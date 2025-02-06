//
//  AppState.swift
//  finpal
//
//  Created by Abdulkarim Koshak on 2/6/25.
//

import SwiftUI

@Observable class AppState {
    private(set) var showTabBar: Bool {
        didSet {
            UserDefaults.showTabBar = showTabBar
        }
    }
    
    init(showTabBar: Bool = UserDefaults.showTabBar) {
        self.showTabBar = showTabBar
    }
    
    func updateViewState(showTabBar: Bool) {
        self.showTabBar = showTabBar
    }
}

extension UserDefaults {
    
    private struct Keys {
        static let showTabBar = "showTabBar"
    }
    
    static var showTabBar: Bool {
        get {
            standard.bool(forKey: Keys.showTabBar)
        } set {
            standard.set(newValue, forKey: Keys.showTabBar)
        }
    }
}
