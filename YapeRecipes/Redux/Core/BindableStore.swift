//
//  BindableStore.swift
//  YapeRecipes
//
//  Created by Jorge Acosta Alvarado on 18-03-23.
//

import Combine
import SwiftUI
import ReSwift

typealias AppStore = BindableStore<AppState>

final class BindableStore<S>: ObservableObject, StoreSubscriber  {

    @Published var state: S
    private let store: Store<S>

    func dispatch(_ action: Action) {
        store.dispatch(action)
    }

    init(
        reducer: @escaping Reducer<S>,
        state: S?,
        middleware: [Middleware<S>] = [],
        automaticallySkipsRepeats: Bool = true
        ) {

        store = Store(reducer: reducer,
                      state: state,
                      middleware: middleware,
                      automaticallySkipsRepeats: automaticallySkipsRepeats)

        self.state = store.state

        store.subscribe(self)
    }

    public func newState(state: S) {
        self.state = state
    }
}
