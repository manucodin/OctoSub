//
//  AppSetting.swift
//  octosub
//
//  Created by Manuel Rodriguez Sebastian on 28/9/22.
//

import Foundation

struct AppSetting {
    struct ShowOnBoarding: UserPrefencePersitable {
        static var key: String { return "showOnBoarding" }
        static var defaultValue: Any { return true }
    }
}
