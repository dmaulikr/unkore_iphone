//
//  EnemyEntity.h
//  unkore
//
//  Created by Daichi Nakajima on 12/07/18.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Entity.h"
#import "SimpleAudioEngine.h"
#import "EnemyCache.h"

//#import "CCParticleGoldUnko.h"
#import "CCParticleExamples.h"

// GameKit
#import <GameKit/GameKit.h>

typedef enum
{
	EnemyTypeSafe001 = 0,
	EnemyTypeSafe002,
	EnemyTypeSafe003,
    EnemyTypeSafe004,
    EnemyTypeSafe005,
    EnemyTypeSafe006,
    EnemyTypeSafe100,
    
    EnemyTypeOut001,
    EnemyTypeOut002,
    EnemyTypeOut003,
    EnemyTypeOut004,
	
	EnemyType_MAX,
} EnemyTypes;

@interface EnemyEntity : Entity <CCTargetedTouchDelegate>{
    int initialHitPoints;
	int hitPoints;
    int myScore;
    
    EnemyTypes type;
    
    //CCParticleSystem* emitter_;
}
//@property (readwrite, retain) CCParticleSystem* emitter;

@property (readonly, nonatomic) int initialHitPoints;
@property (readonly, nonatomic) int hitPoints;
@property (readonly, nonatomic) int myScore;
@property (readonly, nonatomic) EnemyTypes type;

+(id) enemyWithType:(EnemyTypes)enemyType;

// 敵発生
-(void) spawn;

-(void) gotHit;

@end
