//
//  AMNetRequestManager.swift
//  yyTools
//
//  Created by eric on 2019/11/11.
//  Copyright © 2019 yy. All rights reserved.
//

import UIKit
import AFNetworking

enum ApiStyle {
    case am
    case showApi
}

class AMNetRequestManager: AFHTTPSessionManager {
    
    typealias NetCompletionBlock = (_ response:AMNetResponse) -> Void
    
    private static let `default`:AMNetRequestManager = {
        let d = AMNetRequestManager.init(baseURL: nil)
        return d
    }()
    
    public static func get(_ url:String, header:[String:Any]?, completion:@escaping NetCompletionBlock) {
        if AMReachabilityManager.default.connection == .unavailable {
            let netResponse = AMNetRequestManager.assemResponse(nil, responseObject: nil, error: nil)
            completion(netResponse)
            return
        }
        let sessionDataTask = AMNetRequestManager.default.get(url, parameters: header, progress: { (progress) in
            
        }, success: { (task, responseObject) in
            let netResponse = AMNetRequestManager.assemResponse(task, responseObject: responseObject as? [String : Any], error: nil)
            completion(netResponse)
        }) { (task, error) in
            let netResponse = AMNetRequestManager.assemResponse(task, responseObject: nil, error: error)
            completion(netResponse)
        }
        if sessionDataTask == nil {
            let netResponse = AMNetRequestManager.assemResponse(nil, responseObject: nil, error: nil)
            completion(netResponse)
        }
    }
    
    public static func post(_ url:String, body:[String:Any]?,apiStyle:ApiStyle = .am ,completion:@escaping NetCompletionBlock) {
        if AMReachabilityManager.default.connection == .unavailable {
            let netResponse = AMNetRequestManager.assemResponse(nil,apiStyle: apiStyle, responseObject: nil, error: nil)
            completion(netResponse)
            return
        }
        
        let sessionDataTask = AMNetRequestManager.default.post(url, parameters: body, progress: { (progress) in
            
        }, success: { (task, responseObject) in
            let netResponse = AMNetRequestManager.assemResponse(task,apiStyle: apiStyle, responseObject: responseObject as? [String : Any], error: nil)
            completion(netResponse)
        }) { (task, error) in
            let netResponse = AMNetRequestManager.assemResponse(task,apiStyle: apiStyle, responseObject: nil, error: error)
            completion(netResponse)
        }
        if sessionDataTask == nil {
            let netResponse = AMNetRequestManager.assemResponse(nil,apiStyle: apiStyle, responseObject: nil, error: nil)
            completion(netResponse)
        }
    }
}

extension AMNetRequestManager {
    private static func assemResponse(_ task:URLSessionDataTask?, apiStyle:ApiStyle = .am, responseObject:[String:Any]?, error:Error?) -> AMNetResponse {
        var netResponse:AMNetResponse = AMNetResponse(statusCode: -100, message: "网络错误，请重试")
        if task == nil || responseObject == nil || error != nil {
            if let httpResponse = task?.response as? HTTPURLResponse {
                netResponse.statusCode = httpResponse.statusCode
            }
        }else {
            if apiStyle == .am {
                if let statusCode = responseObject?["statusCode"] as? Int {
                    netResponse.statusCode = statusCode
                    netResponse.message = (responseObject?["message"] as? String) ?? ""
                    netResponse.data = responseObject?["data"] as? [String : AnyObject]
                }
            }else if apiStyle == .showApi {
                if let statusCode = responseObject?["showapi_res_code"] as? Int {
                    netResponse.statusCode = statusCode
                    netResponse.message = (responseObject?["showapi_res_error"] as? String) ?? ""
                    netResponse.data = responseObject?["showapi_res_body"] as? [String : AnyObject]
                }
            }
        }
        return netResponse
    }
    
}

extension AMNetRequestManager {
}
