//
//  UserModel.swift
//  finpal
//
//  Created by Abdulkarim Koshak on 2/10/25.
//

import Foundation
import SwiftUI

struct UserModel {
    let userId: String
    let name: String?
    let creationDate: Date?
    let didCompleteOnboarding: Bool?
    private(set) var profileImageName: String?
    
    init(
        userId: String,
        name: String? = nil,
        creationDate: Date? = nil,
        didCompleteOnboarding: Bool? = nil,
        profileImageName: String? = nil
    ) {
        self.userId = userId
        self.name = name
        self.creationDate = creationDate
        self.didCompleteOnboarding = didCompleteOnboarding
        self.profileImageName = profileImageName
    }
    
    mutating func updateProfileImage(imageName: String) {
        profileImageName = imageName
    }
    
    static var mock: Self {
        UserModel(
            userId: "user1",
            name: "John Doe",
            creationDate: .now,
            didCompleteOnboarding: true,
            profileImageName: Constants.randomImageURL
        )
    }
    
}
