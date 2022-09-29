//
//  NavigationStyles.swift
//  octosub
//
//  Created by Manuel Rodriguez Sebastian on 28/9/22.
//

import UIKit

struct NavigationStyles {
    static func applyBlueHeaderStyle() {
        let navigationAppearance = UINavigationBarAppearance()
        navigationAppearance.backgroundColor = .blueHeader
        navigationAppearance.shadowColor = .blueHeader
        navigationAppearance.shadowImage = nil
        
        
        UINavigationBar.appearance().standardAppearance = navigationAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navigationAppearance
        
        UIBarButtonItem.appearance().tintColor = .white
    }
    
    static func applyWhiteStyle() {
        let navigationAppearance = UINavigationBarAppearance()
        navigationAppearance.backgroundColor = .white
        navigationAppearance.shadowColor = .white
        navigationAppearance.shadowImage = nil
        
        
        UINavigationBar.appearance().standardAppearance = navigationAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navigationAppearance
        
        UIBarButtonItem.appearance().tintColor = .black
    }
}
