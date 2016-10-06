//
//  PlayingCard.h
//  Matchismo
//
//  Created by Martin on 10/3/16.
//  Copyright © 2016 Martin Kowaleff. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface PlayingCard : Card

@property(strong,nonatomic) NSString *suit;
@property(nonatomic) NSUInteger rank;
+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;
@end
