//
//  GameBoard.m
//  Connect 4
//
//  Created by John Clem on 5/4/14.
//  Copyright (c) 2014 Code Fellows. All rights reserved.
//

#import "GameBoard.h"
#import "Player.h"

@implementation GameBoard

- (instancetype)initWithPlayers
{
    if (self = [super init]) {
        Player *playerOne = [[Player alloc] initWithColor:[UIColor blackColor]];
        Player *playerTwo = [[Player alloc] initWithColor:[UIColor redColor]];
        self.players = @[playerOne, playerTwo];
    }
    
    return self;
}

- (void)playPiece:(GamePiece *)piece atIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
