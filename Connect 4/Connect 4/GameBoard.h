//
//  GameBoard.h
//  Connect 4
//
//  Created by John Clem on 5/4/14.
//  Copyright (c) 2014 Code Fellows. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GamePiece;

@interface GameBoard : NSObject

@property (nonatomic, strong) NSArray *players;
@property (nonatomic, strong) NSArray *blackPieces;
@property (nonatomic, strong) NSArray *redPieces;
@property (nonatomic, strong) NSArray *pieces;

- (void)playPiece:(GamePiece*)piece atIndexPath:(NSIndexPath *)indexPath;

- (instancetype)initWithPlayers;

@end
