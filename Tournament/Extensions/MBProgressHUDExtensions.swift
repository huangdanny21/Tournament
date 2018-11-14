//
//  MBProgressHUDExtensions.swift
//  Tournament
//
//  Created by Danny on 11/14/18.
//  Copyright © 2018 Danny. All rights reserved.
//

import Foundation
import RxSwift

extension MBProgressHUD {
    var rx_mbprogresshud_animating: AnyObserver<Bool> {
        
        return AnyObserver { event in
            
            MainScheduler.ensureExecutingOnScheduler()
            
            switch (event) {
            case .next(let value):
                if value {
                    let loadingNotification = MBProgressHUD.showAdded(to: (UIApplication.shared.keyWindow?.subviews.last)!, animated: true)
                    loadingNotification.mode = self.mode
                    loadingNotification.label.text = self.label.text
                } else {
                    DispatchQueue.main.async { 
                        MBProgressHUD.hide(for: (UIApplication.shared.keyWindow?.subviews.last)!, animated: true)
                    }
                }
            case .error(let error):
                let error = "Binding error to UI: \(error)"
                print(error)
            case .completed:
                break
            }
        }
    }
}
