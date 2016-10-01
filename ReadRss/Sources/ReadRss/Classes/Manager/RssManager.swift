//
//  RssManager.swift
//  ReadRss
//
//  Created by Tinh Ngo on 9/26/16.
//  Copyright © 2016 Tinh Ngo. All rights reserved.
//

import Foundation
class RssManager : NSObject, XMLParserDelegate {
    
    var urlRSS:String = "http://vnreview.vn/feed/-/rss/home";
    
    var parser = XMLParser()
    var posts = NSMutableArray()
    var elements = NSMutableDictionary()
    var element = NSString()
    
    var tit = NSMutableString()
    var des = NSMutableString()
    var link = NSMutableString()
    var icon = NSMutableString()
    
    override init() {
        super.init()
        self.beginParsing()
    }
    
    init(url : String) {
        self.urlRSS = url
        super.init()
        self.beginParsing()
    }
    
    
    // begin parse
    func beginParsing()
    {
        posts = []
        parser = XMLParser(contentsOf:(URL(string:urlRSS))!)!
        parser.delegate = self
        parser.parse()
        
    }
    
    //XMLParser Methods
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String])
    {
        self.element = elementName as NSString
        if (elementName as NSString).isEqual(to: "item")
        {
            elements = NSMutableDictionary()
            elements = [:]
            
            tit = NSMutableString()
            tit = ""
            des = NSMutableString()
            des = ""
            link = NSMutableString()
            link = ""
            icon = NSMutableString()
            icon = ""
            
        }
        
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?)
    {
        
        if (elementName as NSString).isEqual(to: "item") {
            if !tit.isEqual(nil) {
                elements.setObject(tit, forKey: "tit" as NSCopying)
                
            }
            if !des.isEqual(nil) {
                elements.setObject(des, forKey: "des" as NSCopying)
            }
            if !link.isEqual(nil){
                elements.setObject(link, forKey: "link" as NSCopying)
            }
            if !icon.isEqual(nil){
                elements.setObject(icon, forKey: "guid" as NSCopying)
            }
            posts.add(elements)
            print(elements.object(forKey: "tit").debugDescription)
            
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String)
    {
        if element.isEqual(to: "title") {
            tit.append(string)
        } else if element.isEqual(to: "description") {
            des.append(string)
        } else if element.isEqual(to: "link") {
            link.append(string)
        } else if element.isEqual(to: "guid") {
            icon.append(string)
        }
    }

    

}
