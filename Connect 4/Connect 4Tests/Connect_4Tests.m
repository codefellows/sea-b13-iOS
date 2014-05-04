//
//  Connect_4Tests.m
//  Connect 4Tests
//
//  Created by John Clem on 5/4/14.
//  Copyright (c) 2014 Code Fellows. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "GameBoard.h"
#import "GamePiece.h"

@interface Connect_4Tests : XCTestCase

@end

@implementation Connect_4Tests

- (void)setUp
{
    [super setUp];

    
}

- (void)tearDown
{
    
    [super tearDown];
}

- (void)testColorOfNewPiece
{
    GamePiece *redPiece = [GamePiece redPiece];
    XCTAssertEqual(redPiece.color, [UIColor redColor], @"[GamePiece redPiece] should return a red colored piece");

    GamePiece *blackPiece = [GamePiece blackPiece];
    XCTAssertEqual(blackPiece.color, [UIColor blackColor], @"[GamePiece blackPiece] should return a black colored piece");

}
@end
