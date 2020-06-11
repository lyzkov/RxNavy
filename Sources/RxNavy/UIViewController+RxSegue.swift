//
//  UIViewController+RxSegue.swift
//  Wikia
//
//  Created by BOGU$ on 15/05/2019.
//  Copyright © 2019 lyzkov. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

public extension Reactive where Base: UIViewController {

    func segue<Sender>(identifier: String) -> Observable<(UIStoryboardSegue, Sender)> {
        return methodInvoked(#selector(Base.prepare(for:sender:)))
            .compactMap { args in
                guard let segue = (args.first { ($0 as? UIStoryboardSegue)?.identifier == identifier }
                    as? UIStoryboardSegue), let sender = args.last as? Sender else {
                        return nil
                }

                return (segue, sender)
        }
    }

    func segue<Destination: UIViewController, Sender>(identifier: String, destinationType: Destination.Type = Destination.self) -> Observable<(Destination, Sender)> {
        return methodInvoked(#selector(Base.prepare(for:sender:)))
            .compactMap { args in
                guard let segue = (args.first { ($0 as? UIStoryboardSegue)?.identifier == identifier }
                    as? UIStoryboardSegue),
                    let destination = segue.destination as? Destination,
                    let sender = args.last as? Sender else {
                        return nil
                }

                return (destination, sender)
            }
    }

}

public extension Reactive where Base: UIButton {

    func tap<Item, Destination: UIViewController, Source: ObservableType>
        (segue: Observable<(Destination, Base)>)
        -> (_ source: Source)
        -> (_ handler: @escaping (Item, Destination) -> Void)
        -> Disposable where Source.Element == Item {
            return { source in
                return { handler in
                    segue
                        .withLatestFrom(source) { ($0.0, $0.1, $1) }
                        .filter { _, button, _ in
                            button === self.base
                        }
                        .subscribe(onNext: { destination, _, item in
                            handler(item, destination)
                        })
                }
            }
    }

}

public extension Reactive where Base: UICollectionView {

    func selectedItem<Item, Destination: UIViewController, Source: ObservableType>
        (segue: Observable<(Destination, UICollectionViewCell)>)
        -> (_ source: Source)
        -> (_ handler: @escaping (Item, Destination) -> Void)
        -> Disposable where Source.Element == [Item] {
            return { source in
                return { handler in
                    segue
                        .withLatestFrom(source) { ($0.0, $0.1, $1) }
                        .compactMap { destination, cell, items in
                            guard let indexPath = self.base.indexPath(for: cell) else {
                                return nil
                            }

                            return (items[indexPath.item], destination)
                        }
                        .subscribe(onNext: { item, destination in
                            handler(item, destination)
                        })
                }
            }
    }

}

public extension Reactive where Base: UITableView {

    func selectedItem<Item, Destination: UIViewController, Source: ObservableType>
        (segue: Observable<(Destination, UITableViewCell)>)
        -> (_ source: Source)
        -> (_ handler: @escaping (Item, Destination) -> Void)
        -> Disposable where Source.Element == [Item] {
            return { source in
                return { handler in
                    segue
                        .withLatestFrom(source) { ($0.0, $0.1, $1) }
                        .compactMap { destination, cell, items in
                            guard let indexPath = self.base.indexPath(for: cell) else {
                                return nil
                            }

                            return (items[indexPath.item], destination)
                        }
                        .subscribe(onNext: { item, destination in
                            handler(item, destination)
                        })
                }
            }
    }

}
