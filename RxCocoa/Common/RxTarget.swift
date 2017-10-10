//
//  RxTarget.swift
//  RxCocoa
//
//  Created by Krunoslav Zaher on 7/12/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

import class Foundation.NSObject

#if !RX_NO_MODULE
import RxSwift
#endif

class RxTarget : NSObject
               , Disposable {

    private var retainSelf: RxTarget?

    override init() {
        super.init()
        self.retainSelf = self

#if TRACE_RESOURCES
        _ = Resources.incrementTotal()
#endif

#if DIALOG_RX_DEBUG
        MainScheduler.ensureExecutingOnScheduler()
#endif
    }

    func dispose() {
#if DIALOG_RX_DEBUG
        MainScheduler.ensureExecutingOnScheduler()
#endif
        self.retainSelf = nil
    }

#if TRACE_RESOURCES
    deinit {
        _ = Resources.decrementTotal()
    }
#endif
}
