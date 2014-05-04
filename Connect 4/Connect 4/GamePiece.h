//
//  GamePiece.h
//  Connect 4
//
//  Created by John Clem on 5/4/14.
//  Copyright (c) 2014 Code Fellows. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Player;
@class GameBoard;

@interface GamePiece : NSObject

+ (GamePiece *)blackPiece;
+ (GamePiece *)redPiece;

@property (nonatomic, strong) UIColor *color;
@property (nonatomic, weak) Player *player;
@property (nonatomic, weak) GameBoard *gameBoard;

@end
