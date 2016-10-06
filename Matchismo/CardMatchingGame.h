//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Martin on 10/3/16.
//  Copyright © 2016 Martin Kowaleff. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject

//designated initializer 
-(instancetype)initWithCardCount:(NSUInteger)count
                       usingDeck:(Deck *)deck;

-(void)chooseCardAtIndex:(NSUInteger)index;

-(Card *)cardAtIndex:(NSUInteger)index;

@property (nonatomic, readonly) NSUInteger score;

@property (nonatomic) NSUInteger matchMode;

//-(NSArray *)activityLog;
@end
