//
//  Category.swift
//  ReadRss
//
//  Created by Tinh Ngo on 9/25/16.
//  Copyright © 2016 Tinh Ngo. All rights reserved.
//

import Foundation
struct Category {
    
    var name:String?
    var link:String?
    
}

class CategoryModel {
    
    static var list:[Category] = []
    static func getCategoryVnReview() -> [Category]{
        
        let l1 = Category(name: "Trang Chủ",link: "http://vnreview.vn/feed/-/rss/home")
        list.append(l1)
        let l2 = Category(name: "Đánh giá",link: "http://vnreview.vn/feed/-/rss/13612")
        list.append(l2)
        let l3 = Category(name: "Di động",link: "http://vnreview.vn/feed/-/rss/13612/13622")
        list.append(l3)
        let l4 = Category(name: "Laptop",link: "http://vnreview.vn/feed/-/rss/13612/13620")
        list.append(l4)
        let l5 = Category(name: "Máy ảnh số",link: "http://vnreview.vn/feed/-/rss/13612/13619")
        list.append(l5)
        let l6 = Category(name: "Máy tính bảng",link: "http://vnreview.vn/feed/-/rss/13612/13618")
        list.append(l6)
        let l7 = Category(name: "Tivi",link: "http://vnreview.vn/feed/-/rss/13612/13616")
        list.append(l7)
        let l8 = Category(name: "Tin tức",link: "http://vnreview.vn/feed/-/rss/13414")
        list.append(l8)
        let l9 = Category(name: "An ninh mạng",link: "http://vnreview.vn/feed/-/rss/13414/13418")
        list.append(l9)
        let l10 = Category(name: "Sản phẩm mới",link: "http://vnreview.vn/feed/-/rss/13414/13417")
        list.append(l10)
        let l11 = Category(name: "Xã hội số",link: "http://vnreview.vn/feed/-/rss/13414/13415")
        list.append(l11)
        let l12 = Category(name: "Xe",link: "http://vnreview.vn/feed/-/rss/13414/1347138")
        list.append(l12)
        
        return list
    }
}
