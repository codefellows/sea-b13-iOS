//
//  MyScene.m
//  spritekit lecture
//
//  Created by Bradley Johnson on 5/12/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "MyScene.h"
#import "PipeNode.h"

@interface MyScene() <SKPhysicsContactDelegate>
{
    CFTimeInterval _previousTime;
    CFTimeInterval _deltaTime;
    CFTimeInterval _timeSinceLastPipe;
    CFTimeInterval _nextPipeTime;
}

@property (strong,nonatomic) SKSpriteNode *mainCharacter;
@property (strong,nonatomic) NSMutableArray *topPipes;
@property (strong,nonatomic) NSMutableArray *bottomPipes;

@property (weak,nonatomic) PipeNode *firstAvailableBottomPipe;
@property (weak,nonatomic) PipeNode *firstAvailableTopPipe;

#define kNumOfPipes 16
#define kTimeBetweenPipes 1.5

@end

@implementation MyScene

static const uint32_t flappyCategory = 0x1 << 0;
static const uint32_t pipeCategory = 0x1 << 1;
static const uint32_t worldCategory = 0x1 << 2;

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        _nextPipeTime = kTimeBetweenPipes;
        self.physicsWorld.contactDelegate = self;
        self.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];
        self.physicsBody.categoryBitMask = worldCategory;
        [self setupScrollingBackgrounds];
        [self setupPlayer];
        [self setupPipes];
        

    }
    return self;
}

-(void)setupPipes
{
    self.bottomPipes = [NSMutableArray new];
    
    for (int i = 0; i < kNumOfPipes; i++)
    {
        PipeNode *pipe = [PipeNode spriteNodeWithImageNamed:@"bottompipe"];
        pipe.position = CGPointMake(600, 0);
        pipe.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:pipe.size];
        pipe.physicsBody.affectedByGravity = NO;
        pipe.physicsBody.dynamic = NO;
        pipe.physicsBody.categoryBitMask = pipeCategory;
        pipe.hidden = YES;
        [self.bottomPipes insertObject:pipe atIndex:0];
        if (self.bottomPipes.count > 1)
        {
            pipe.next = self.bottomPipes[1];
        }
        [self addChild:pipe];
    }
    self.firstAvailableBottomPipe = self.bottomPipes[0];
    
    self.topPipes = [NSMutableArray new];
    
    for (int i = 0; i < kNumOfPipes; i++)
    {
        PipeNode *pipe = [PipeNode spriteNodeWithImageNamed:@"toppipe"];
        pipe.position = CGPointMake(600, 0);
        pipe.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:pipe.size];
        pipe.physicsBody.affectedByGravity = NO;
        pipe.physicsBody.dynamic = NO;
        pipe.physicsBody.categoryBitMask = pipeCategory;
        pipe.hidden = YES;
        [self.topPipes insertObject:pipe atIndex:0];
        if (self.topPipes.count > 1)
        {
            pipe.next = self.topPipes[1];
        }
        [self addChild:pipe];
    }
    self.firstAvailableTopPipe = self.topPipes[0];
    
}

-(void)setupPlayer
{
    self.mainCharacter = [SKSpriteNode spriteNodeWithImageNamed:@"flappy"];
    self.mainCharacter.position = CGPointMake(50, 200);
    [self addChild:self.mainCharacter];
    
    self.mainCharacter.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:self.mainCharacter.size];
    self.mainCharacter.physicsBody.dynamic = YES;
    self.mainCharacter.physicsBody.affectedByGravity = YES;
    self.mainCharacter.physicsBody.allowsRotation = NO;
    self.mainCharacter.physicsBody.mass = .02;
    self.mainCharacter.physicsBody.categoryBitMask = flappyCategory;
    self.mainCharacter.physicsBody.contactTestBitMask = pipeCategory;
}

-(void)setupScrollingBackgrounds
{
    for (int i = 0; i < 2;i++)
    {
        SKSpriteNode *bg = [SKSpriteNode spriteNodeWithImageNamed:@"background"];
        bg.anchorPoint = CGPointZero;
        bg.position = CGPointMake(i * bg.size.width, 0);
        bg.name = @"background";
        [self addChild:bg];
        
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    [self.mainCharacter.physicsBody setVelocity:CGVectorMake(0, 0)];
    [self.mainCharacter.physicsBody applyImpulse:CGVectorMake(0, 7)];
    
}

-(float)randomValueBetween:(float)low andValue:(float)high
{
    
    return arc4random_uniform(high - low) + low;
//    return (((float) arc4random() / 0xFFFFFFFu) * (high - low)) +low;
    
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
    
    _deltaTime = currentTime - _previousTime;
    _previousTime = currentTime;
    _timeSinceLastPipe += _deltaTime;
    
    if (_timeSinceLastPipe > _nextPipeTime)
    {
        NSLog(@" time for pipe!");
        PipeNode *bottomPipe = self.firstAvailableBottomPipe;
        float randomY = [self randomValueBetween:-100 andValue:100];
        bottomPipe.position = CGPointMake(600, randomY);
        CGPoint location = CGPointMake(-30, randomY);
        SKAction *moveAction = [SKAction moveTo:location duration:3];
        SKAction *endAction = [SKAction runBlock:^{
            [self doneWithBottomPipe:bottomPipe];
        }];
        SKAction *sequence = [SKAction sequence:@[moveAction,endAction]];
        [bottomPipe runAction:sequence];
        
        PipeNode *topPipe = self.firstAvailableTopPipe;
        float topY = randomY + 365;
        topPipe.position = CGPointMake(600, topY);
        CGPoint destination = CGPointMake(-30, topY);
        SKAction *downMoveAction = [SKAction moveTo:destination duration:3];
        SKAction *downEndAction = [SKAction runBlock:^{
            [self doneWithTopPipe:topPipe];
        }];
        SKAction *downSequence = [SKAction sequence:@[downMoveAction,downEndAction]];
        [topPipe runAction:downSequence];
        
        _timeSinceLastPipe = 0;
    }
    
    //NSLog(@" %f",_deltaTime);
    
    
    [self enumerateChildNodesWithName:@"background" usingBlock:^(SKNode *node, BOOL *stop) {
        
        SKSpriteNode *bg = (SKSpriteNode *)node;
        bg.position = CGPointMake(bg.position.x - 5, bg.position.y);
        if (bg.position.x <= -bg.size.width)
        {
            bg.position = CGPointMake(bg.position.x + bg.size.width * 2, bg.position.y);
        }
    }];
}

-(PipeNode *)firstAvailableBottomPipe
{
    PipeNode *first = _firstAvailableBottomPipe;
    _firstAvailableBottomPipe = first.next;
    first.hidden = NO;
    return first;
}

-(PipeNode *)firstAvailableTopPipe
{
    PipeNode *first = _firstAvailableTopPipe;
    _firstAvailableTopPipe = first.next;
    first.hidden = NO;
    return first;
}

-(void)doneWithBottomPipe:(PipeNode *)bottomPipe
{
    NSLog(@" done with this pipe");
    bottomPipe.hidden = YES;
    bottomPipe.next = _firstAvailableBottomPipe;
    self.firstAvailableBottomPipe = bottomPipe;
}
-(void)doneWithTopPipe:(PipeNode *)topPipe
{
    NSLog(@" done with this pipe");
    topPipe.hidden = YES;
    topPipe.next = _firstAvailableTopPipe;
    self.firstAvailableTopPipe = topPipe;
}

-(void)didBeginContact:(SKPhysicsContact *)contact
{
    NSLog(@"Contact!");
}

@end
