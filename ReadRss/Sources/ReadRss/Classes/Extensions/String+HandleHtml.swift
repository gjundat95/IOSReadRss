//
//  String+HandleHtml.swift
//  QuizShow
//
//  Created by Tinh Ngo on 9/21/16.
//  Copyright © 2016 Tinh Ngo. All rights reserved.
//

import Foundation
extension String{

    func stringRemoveHtml() -> String? {
        var s = self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
        s = s.replacingOccurrences(of: "\n", with: " ")
        s = s.replacingOccurrences(of: "/", with: "")
        return s
    }
    
    func stringEncodingHtml() -> String {
        var s = self.replacingOccurrences(of: "&quot;",with: "\"")
        s = s.replacingOccurrences(of: "&apos;", with: "'")
        s = s.replacingOccurrences(of: "&amp;", with: "&")
        s = s.replacingOccurrences(of: "&lt;", with: "<")
        s = s.replacingOccurrences(of: "&gt;", with: ">")
        s = s.replacingOccurrences(of: "&#39;", with: "'")
        s = s.replacingOccurrences(of: "&ldquot;", with: "\"")
        s = s.replacingOccurrences(of: "&rdquot;", with: "\"")
        s = s.replacingOccurrences(of: "&nbsp;", with: " ")
        s = s.replacingOccurrences(of: "&aacute;", with: "á")
        s = s.replacingOccurrences(of: "&eacute;", with: "é")
        s = s.replacingOccurrences(of: "&iacute;", with: "í")
        s = s.replacingOccurrences(of: "&oacute;", with: "ó")
        s = s.replacingOccurrences(of: "&uacute;", with: "ú")
        s = s.replacingOccurrences(of: "&ntilde;", with: "ñ")
        s = s.replacingOccurrences(of: "&#8217;", with: "'")
        s = s.replacingOccurrences(of: "&#160;", with: " ")
        
        return s

    }
    
    func validateURL() -> String {
        var s = self.replacingOccurrences(of: "^\\s*", with: "", options: .regularExpression, range: nil)
        s = s.replacingOccurrences(of: "\\s*$", with: "", options: .regularExpression, range: nil)
        return s

    }
}
