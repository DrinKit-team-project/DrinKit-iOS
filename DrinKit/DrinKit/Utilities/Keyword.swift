//
//  Keyword.swift
//  DrinKit
//
//  Created by 권재욱 on 2018. 7. 28..
//  Copyright © 2018년 권재욱. All rights reserved.
//

import Foundation

enum Keyword {
    
    // MARK: - HomeView
    enum HomeView {
        case brandCell
        
        var reuseId: String {
            switch self {
            case .brandCell: return "BrandCell"
            }
        }
    }
    // MARK: - BrandInfoView
    enum BrandInfoView {
        case categoryCell
        
        var reuseId: String {
            switch self {
            case .categoryCell: return "CategoryCell"
            }
        }
    }
    
    // MARK: - BeverageView
    enum BeveragesView {
        case beverageCell
        
        var reuseId: String {
            switch self {
            case .beverageCell: return "BeverageCell"
            }
        }
    }
    
    // MARK: - BeverageDetailView
    enum BeverageDetailView {
        case reviewCell
        
        var reuseId: String {
            switch self {
            case .reviewCell: return "ReviewCell"
            }
        }
    }
}
