//
//  CreateBrand.swift
//  W2WMatch
//
//  Created by Floron on 20.06.2024.
//

import Foundation

// MARK: - CreateBrandRequestBody
struct CreateBrandRequestBody: Codable {
    var category, presenceType, publicSpeaker, subsCount: RequestQuestionType
    var avgBill: RequestQuestionType
    var goals, formats, collaborationInterest: [RequestQuestionType]
    var tgNickname, phone, brandNamePos, instBrandURL: String
    var brandSiteURL, topics, missionStatement, targetAudience: String
    var uniqueProductIs, productDescription, problemSolving, businessGroup: String
    var logo, photo, productPhoto, fullname: String
    var email: String

    enum CodingKeys: String, CodingKey {
        case category
        case presenceType = "presence_type"
        case publicSpeaker = "public_speaker"
        case subsCount = "subs_count"
        case avgBill = "avg_bill"
        case goals, formats
        case collaborationInterest = "collaboration_interest"
        case tgNickname = "tg_nickname"
        case phone
        case brandNamePos = "brand_name_pos"
        case instBrandURL = "inst_brand_url"
        case brandSiteURL = "brand_site_url"
        case topics
        case missionStatement = "mission_statement"
        case targetAudience = "target_audience"
        case uniqueProductIs = "unique_product_is"
        case productDescription = "product_description"
        case problemSolving = "problem_solving"
        case businessGroup = "business_group"
        case logo, photo
        case productPhoto = "product_photo"
        case fullname, email
    }
}

// MARK: - AvgBill
struct RequestQuestionType: Codable {
    var text: String
    var question: Int
}


// MARK: - CreateBrand response
struct CreateBrandResponse: Codable {
    var id: Int
    var user: User2
    var subscription: Subscription?
    var category, presenceType, publicSpeaker, subsCount: QuestionType
    var avgBill: QuestionType
    var goals, formats, collaborationInterest: [QuestionType]
    var subExpire: String?
    var published: Bool
    var tgNickname, phone, brandNamePos: String
    var instBrandURL, brandSiteURL, topics, missionStatement: String
    var targetAudience, uniqueProductIs, productDescription, problemSolving: String
    var businessGroup, logo, photo, productPhoto: String
    var fullname, email: String

    enum CodingKeys: String, CodingKey {
        case id, user, subscription, category
        case presenceType = "presence_type"
        case publicSpeaker = "public_speaker"
        case subsCount = "subs_count"
        case avgBill = "avg_bill"
        case goals, formats
        case published
        case collaborationInterest = "collaboration_interest"
        case subExpire = "sub_expire"
        case tgNickname = "tg_nickname"
        case phone
        case brandNamePos = "brand_name_pos"
        case instBrandURL = "inst_brand_url"
        case brandSiteURL = "brand_site_url"
        case topics
        case missionStatement = "mission_statement"
        case targetAudience = "target_audience"
        case uniqueProductIs = "unique_product_is"
        case productDescription = "product_description"
        case problemSolving = "problem_solving"
        case businessGroup = "business_group"
        case logo, photo
        case productPhoto = "product_photo"
        case fullname, email
    }
}

// MARK: - QuestionType
struct QuestionType: Codable {
    var text: String
}

// MARK: - Subscription
struct Subscription: Codable {
    var id: Int
    var name: String
    var cost: Int
    var duration: String
}

// MARK: - User
struct User2: Codable {
    var id: Int
    var email, phone: String
}
