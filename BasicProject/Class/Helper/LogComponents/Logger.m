//
//  Logger.m
//  BasicProject
//
//  Created by lanfeng on 17/2/3.
//  Copyright © 2017年 lanfeng. All rights reserved.
//

#import "Logger.h"
#import "YTKRequest.h"
#import "NSObject+AXNetworkingMethods.h"
#import "NSMutableString+AXNetworkingMethods.h"

@implementation Logger

#pragma mark - public methods
+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    static Logger *sharedInstance;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

+ (void)logDebugInfoWithRequest:(YTKRequest *)request {
#ifdef DEBUG
    NSString *detailUrl = [request requestUrl];
    NSString *baseUrl;
    if (![detailUrl hasPrefix:@"http"]) {
        
        if ([request useCDN]) {
            if ([request cdnUrl].length > 0) {
                baseUrl = [request cdnUrl];
            }
        } else {
            if ([request baseUrl].length > 0) {
                baseUrl = [request baseUrl];
            }
        }
    } else {
        baseUrl = detailUrl;
    }
    
    NSMutableString *logString = [NSMutableString stringWithString:@"\n\n**************************************************************\n*                       Request Start                        *\n**************************************************************\n\n"];
    
    [logString appendFormat:@"API Name:\t\t%@\n", [baseUrl AX_defaultValue:@"N/A"]];
    [logString appendFormat:@"Method:\t\t\t%@\n", [request.requestUrl AX_defaultValue:@"N/A"]];
    [logString appendFormat:@"Version:\t\t%lld\n", request.cacheVersion];
    [logString appendFormat:@"Class:\t\t%@\n", [request class]];
    [logString appendFormat:@"HTTP Header:\t\t%@\n", request.responseHeaders];
    [logString appendFormat:@"requestMethod:\t\t%@\n", request.requestMethod == YTKRequestMethodGET ? @"Get" :
                                                     request.requestMethod == YTKRequestMethodPOST ? @"POST" :
                                                     request.requestMethod == YTKRequestMethodHEAD ? @"Head" :
                                                     request.requestMethod == YTKRequestMethodPUT ? @"PUT" :
                                                     request.requestMethod == YTKRequestMethodDELETE ? @"DELETE" :
                                                     request.requestMethod == YTKRequestMethodPATCH ? @"PATCH" : @"未知请求"];
//    [logString appendFormat:@"Status:\t\t\t%@\n", isOnline ? @"online" : @"offline"];
//    [logString appendFormat:@"Public Key:\t\t%@\n", [service.publicKey CT_defaultValue:@"N/A"]];
//    [logString appendFormat:@"Private Key:\t%@\n", [service.privateKey CT_defaultValue:@"N/A"]];
    [logString appendFormat:@"Params:\n%@", request.requestArgument];
    
//    [logString appendURLRequest:request.currentRequest];
    
    [logString appendFormat:@"\n\n**************************************************************\n*                         Request End                        *\n**************************************************************\n\n\n\n"];
    NSLog(@"%@", logString);
#endif
}

+ (void)logDebugInfoWithResponse:(YTKRequest *)request {
#ifdef DEBUG
    NSError *error = request.error;
    BOOL shouldLogError = error ? YES : NO;
    NSHTTPURLResponse *response = request.response;
    NSString *responseString = [[NSString alloc] initWithData:request.responseData encoding:NSUTF8StringEncoding];
    NSMutableString *logString = [NSMutableString stringWithString:@"\n\n==============================================================\n=                        API Response                        =\n\n\n"];
    
    [logString appendFormat:@"Status:\t%ld\t(%@)\n\n", (long)response.statusCode, [NSHTTPURLResponse localizedStringForStatusCode:response.statusCode]];
    [logString appendFormat:@"Content:\n\t%@\n\n", responseString];
    if (shouldLogError) {
        [logString appendFormat:@"Error Domain:\t\t\t\t\t\t\t%@\n", error.domain];
        [logString appendFormat:@"Error Domain Code:\t\t\t\t\t\t%ld\n", (long)error.code];
        [logString appendFormat:@"Error Localized Description:\t\t\t%@\n", error.localizedDescription];
        [logString appendFormat:@"Error Localized Failure Reason:\t\t\t%@\n", error.localizedFailureReason];
        [logString appendFormat:@"Error Localized Recovery Suggestion:\t%@\n\n", error.localizedRecoverySuggestion];
    }
    
    [logString appendString:@"\n---------------  Related Request Content  --------------\n"];
    [logString appendFormat:@"\nrequestMethod:\t\t%@\n", request.requestMethod == YTKRequestMethodGET ? @"Get" :
     request.requestMethod == YTKRequestMethodPOST ? @"POST" :
     request.requestMethod == YTKRequestMethodHEAD ? @"Head" :
     request.requestMethod == YTKRequestMethodPUT ? @"PUT" :
     request.requestMethod == YTKRequestMethodDELETE ? @"DELETE" :
     request.requestMethod == YTKRequestMethodPATCH ? @"PATCH" : @"未知请求"];
    [logString appendFormat:@"Method:\t\t\t%@\n", [request.requestUrl AX_defaultValue:@"N/A"]];
    [logString appendFormat:@"Version:\t\t%lld\n", request.cacheVersion];
    [logString appendFormat:@"Class:\t\t%@\n", [request class]];
    [logString appendFormat:@"Params:\n%@", request.requestArgument];
    [logString appendURLRequest:request.currentRequest];
    
    
    [logString appendFormat:@"\n\n\n=                        Response End                        =\n==============================================================\n\n\n\n"];
    
    NSLog(@"%@", logString);
#endif
}


@end
