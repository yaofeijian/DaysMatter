//
//  AMNetResponse.swift
//  yyTools
//
//  Created by eric on 2019/11/16.
//  Copyright © 2019 yy. All rights reserved.
//

import UIKit

struct AMNetResponse {
    public var statusCode:Int
    public var message:String
    public var data:[String:AnyObject]?
}

