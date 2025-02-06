//
//  Intro.swift
//  finpal
//
//  Created by Abdulkarim Koshak on 2/6/25.
//

import Foundation

struct Intro: Identifiable {
    let id = UUID().uuidString
    let imageName: String
    let title: String
    let description: String
    
    static let screens: [Intro] = [
        Intro(
            imageName: "Onboarding_1",
            title: "Control Your Finances with Personal Budgets",
            description: "Invest your spare change with every transaction and watch it grow effortlessly."
        ),
        
        Intro(
            imageName: "Onboarding_2",
            title: "AI Finance Assistance, Everywhere, Anywhere",
            description: "Invest your spare change every time you do something and let it grow."
        ),
        
        Intro(
            imageName: "Onboarding_3",
            title: "Set Your Own Financial Goals Easily",
            description: "Invest your spare change every time you do something and let it grow."
        ),
        
        Intro(
            imageName: "Onboarding_4",
            title: "Save More & Spend More Smarter",
            description: "Invest your spare change every time you do something and let it grow."
        ),
        
        Intro(
            imageName: "Onboarding_5",
            title: "Manage Subscriptions in One Single Place",
            description: "Invest your spare change every time you do something and let it grow."
        ),
    ]
}
