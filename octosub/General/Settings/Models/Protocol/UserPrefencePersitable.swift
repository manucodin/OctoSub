//
//  UserPrefencePersitable.swift
//  octosub
//
//  Created by Manuel Rodriguez Sebastian on 28/9/22.
//

import Foundation

protocol UserPrefencePersitable {
    static var key: String { get }
    static var defaultValue: Any { get }
}
