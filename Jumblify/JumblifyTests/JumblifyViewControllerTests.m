//
//  JumblifyViewControllerTests.m
//  Jumblify
//
//  Created by DAVY UONG on 9/1/15.
//  Copyright (c) 2015 Tuts+. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "JumblifyViewController.h"

@interface JumblifyViewControllerTests : XCTestCase

@property (nonatomic) JumblifyViewController *vcToTest;

@end

@interface JumblifyViewController (Test)

- (NSString *)reverseString:(NSString *)stringToReverse;
- (void)doSomethingThatTakesSomeTimesWithCompletionBlock:(void (^)(NSString *result))completion;

@end

@implementation JumblifyViewControllerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.vcToTest = [[JumblifyViewController alloc] init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testReverseString {
    NSString *originalString = @"himynameissandy";
    NSString *reversedString = [self.vcToTest reverseString:originalString];
    
    NSString *expectedReversedString = @"ydnassiemanymih";
    XCTAssertEqualObjects(expectedReversedString, reversedString, @"The reversed string did not match the expected reverse");
}

- (void)testDoSomethingThatTakesSomeTime {
    XCTestExpectation *completionExpectation = [self expectationWithDescription:@"Long method"];
    [self.vcToTest doSomethingThatTakesSomeTimesWithCompletionBlock:^(NSString *result) {
        XCTAssertEqualObjects(@"result", result, @"Result was not correct!");
        [completionExpectation fulfill];
    }];
    [self waitForExpectationsWithTimeout:5.0 handler:nil];
}

#pragma mark - Performance Testing

- (void)testPerformanceReverseString {
    NSString *originalString = @"himynameissandy";
    [self measureBlock:^{
        [self.vcToTest reverseString:originalString];
    }];
}

@end
