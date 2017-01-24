//
//  NetworkModulesTest.m
//  BasicProject
//
//  Created by lanfeng on 17/1/23.
//  Copyright © 2017年 lanfeng. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSArray+AXNetworkingMethods.h"
#import "NSDictionary+AXNetworkingMethods.h"
#import "NSMutableString+AXNetworkingMethods.h"
#import "NSString+AXNetworkingMethods.h"
#import "NSObject+AXNetworkingMethods.h"
#import "NSURLRequest+LFNetworkingMethods.h"
#import "UIDevice+IdentifierAddition.h"
#import "LFUDIDGenerator.h"

@interface NetworkModulesTest : XCTestCase

@end

@implementation NetworkModulesTest

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.

    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)testCategories {
    NSString *jsonString = [@[@"aa", @"bb", @"cc"] AX_jsonString];
    NSString *emptyJsonString = [@[] AX_jsonString];
    XCTAssertNotNil(jsonString, @"should be a value");
    XCTAssertNotNil(emptyJsonString, @"empty string");
    
    NSString *dictJsonString = [@{@"key1" : @"value1", @"key2" : @"value2", @"key3" : @"value3"} AX_jsonString];
    NSString *emptyDictJsonString = [@{} AX_jsonString];
    XCTAssertNotNil(dictJsonString, @"should be a value");
    XCTAssertNotNil(emptyDictJsonString, @"empty string");
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[[NSURL alloc] initWithString:@"https://www.baidu.com"]];
    [request setRequestParams:@{@"test1" : @"key1"}];
    NSMutableString *testRequestString = [NSMutableString string];
    [testRequestString appendURLRequest:request];
    XCTAssertTrue(testRequestString.length, @"should be a string");
    
    NSString *md5String = [@"123" AX_md5];
    XCTAssertTrue(md5String.length, @"should be a string");
    XCTAssertTrue([md5String isEqualToString:@"202cb962ac59075b964b07152d234b70"], @"should be equal");
    
    XCTAssertTrue([@[] AX_isEmptyObject], @"is empty");
    XCTAssertTrue([@{} AX_isEmptyObject], @"is empty");
    XCTAssertTrue([@"" AX_isEmptyObject], @"is empty");
    XCTAssertTrue([[NSNull null] AX_isEmptyObject], @"is empty");
    
    XCTAssertTrue(![@[@"2"] AX_isEmptyObject], @"is empty");
    XCTAssertTrue(![@{@"key1" : @"value1"} AX_isEmptyObject], @"is empty");
    XCTAssertTrue(![@"sdfjsldkjf" AX_isEmptyObject], @"is empty");

    NSURLRequest *request2 = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://www.baidu.com"]];
    XCTAssertNil(request2.requestParams, @"nil");
    request2.requestParams = @{@"key1" : @"value2"};
    XCTAssertNotNil(request2.requestParams, @"not nil");
    
    UIDevice *device = [[UIDevice alloc] init];
    XCTAssertNotNil(device.LF_udid, @"should be a string value");
    XCTAssertNotNil(device.LF_uuid, @"should be a string value");
    XCTAssertNotNil(device.LF_ostype, @"should be a string value");
    XCTAssertNotNil(device.LF_macaddress, @"should be a string value");
    
    LFUDIDGenerator *generator = [[LFUDIDGenerator alloc] init];
//    XCTAssertTrue([generator.UDID isEqualToString:@"19FC0EC1-7AA3-4C4C-A78E-562B20FB957E"], @"equal");
    XCTAssertNotNil(generator.UDID, @"not nill");
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // Use recording to get started writing UI tests.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

@end
