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
#import "Player.h"

@interface Connect_4Tests : XCTestCase

@property (nonatomic, strong) GameBoard *gameBoard;

@end

@implementation Connect_4Tests

- (void)setUp
{
    [super setUp];

    _gameBoard = [[GameBoard alloc] initWithPlayers];
}

- (void)tearDown
{
    
    [super tearDown];
}

- (void)testColorOfNewPiece
{
    GamePiece *redPiece = [GamePiece redPiece];
    XCTAssertEqual(redPiece.pieceColor, [UIColor redColor], @"[GamePiece redPiece] should return a red colored piece");

    GamePiece *blackPiece = [GamePiece blackPiece];
    XCTAssertEqual(blackPiece.pieceColor, [UIColor blackColor], @"[GamePiece blackPiece] should return a black colored piece");

}

- (void)testNewGamePlayerCount
{
    XCTAssertTrue(_gameBoard.players.count == 2, @"New games should start with two players");
}

- (void)testNewGamePlayerColors
{
    XCTAssertEqual([_gameBoard.players.firstObject playerColor], [UIColor blackColor], @"Player one should be black color");
    
    XCTAssertEqual([_gameBoard.players.lastObject playerColor], [UIColor redColor], @"Player two should be red color");
}

@end
