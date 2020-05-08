//
//  ThemeManager.swift
//  CombineCollectionView
//
//  Created by zeroplus on 2020/5/8.
//  Copyright © 2020 zeroplus. All rights reserved.
//

import Foundation
import Combine

class ThemeManager {
    
    static let shared = ThemeManager()
    
    init() {}
    
    enum PreferredUserInterfaceStyle {
        case dark, light, system
    }
    
    lazy private(set) var themeSubject: CurrentValueSubject<
        PreferredUserInterfaceStyle, Never> = {
            var preferredStyle = PreferredUserInterfaceStyle.system
                preferredStyle = shouldApplyDarkMode ? .dark : .light
            
            return CurrentValueSubject<PreferredUserInterfaceStyle, Never>(preferredStyle)
            
    }()
    
    var shouldApplyDarkMode: Bool {
        get {
            UserDefaults.standard.bool(forKey: "shouldApplyDarkMode")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "shouldApplyDarkMode")
            updateThemeSubject()
        }
    }
    
    private func updateThemeSubject() {
        themeSubject.value = shouldApplyDarkMode ? .dark : .light
}
}
