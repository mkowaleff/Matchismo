//
//  PlayingCard.m
//  Matchismo
//
//  Created by Martin on 10/3/16.
//  Copyright © 2016 Martin Kowaleff. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

-(int)match:(NSArray *)otherCards{
    int score = 0;
    int matchCount = 0;
    
    //NSMutableArray *activity = [[NSMutableArray alloc] init];
    NSMutableArray *matchArray = [[NSMutableArray alloc] initWithArray:otherCards];
    
    [matchArray addObject:self];
    
    while([matchArray count]){
        Card *matchCard = matchArray.lastObject;
        if([matchCard isKindOfClass:[PlayingCard class]]){
            PlayingCard *card = (PlayingCard *)matchCard;
            [matchArray removeObject:matchCard];
            
            for(Card *otherMatchCard in matchArray){
                if([otherMatchCard isKindOfClass:[PlayingCard class]]){
                    PlayingCard *otherCard = (PlayingCard *)otherMatchCard;
                    if([card.suit isEqualToString:otherCard.suit]){
                        score+=1;
                        matchCount++;
                        //[activity addObject:[[NSString alloc] initWithFormat:@"Match between %@ and %@ = 1 point", card.contents, otherCard.contents]];
                    }
                    else if(card.rank == otherCard.rank){
                        score+=4;
                        matchCount++;
                        //[activity addObject:[[NSString alloc] initWithFormat:@"Match between %@ and %@ = 4 points", card.contents, otherCard.contents]];
                    }
                }
            }
        }
    }
    if(matchCount<[otherCards count]){
        if(score>1){
            score-=1;
            //[activity addObject:[[NSString alloc] initWithFormat:@"Match only between %d of %lu cards, %d point penalty!", matchCount + 1, [otherCards count] + 1, penalty]];
        }
    }
    if(!score){
        NSMutableString *cardText = [[NSMutableString alloc] init];
        NSMutableArray *cards = [[NSMutableArray alloc] initWithArray:otherCards];
        [cards addObject:self];
        
        while ([cards count]) {
            Card *matchCard = cards.lastObject;
            [cards removeObject:matchCard];
            
            if ([matchCard isKindOfClass:[PlayingCard class]]) {
                PlayingCard *card = (PlayingCard *)matchCard;
                NSString *append = ([cards count]) ? (([cards count] > 1) ? @", " : @" and ") : @"";
                [cardText appendFormat:@"%@%@", card.contents, append];
            }
        }
        //[activity addObject:[[NSString alloc] initWithFormat:@"%@ do not match", cardText]];
    }
    return score;
}

- (NSString *)contents{
    NSArray *rankStrings = [PlayingCard rankStrings];
        return [rankStrings[self.rank] stringByAppendingString:self.suit];
    }

@synthesize suit = _suit;

+ (NSArray *)validSuits{
    return @[@"♥️",@"♦️",@"♠️",@"♣️"];
}

- (void) setSuit:(NSString *)suit{
    if([[PlayingCard validSuits] containsObject:suit]){
        _suit = suit;
    }
}

- (NSString *)suit{
    return _suit ? _suit: @"?";
}

+ (NSArray *) rankStrings{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+ (NSUInteger) maxRank{
    return [[self rankStrings] count]-1;
}

- (void) setRank:(NSUInteger)rank{
       if(rank<=[PlayingCard maxRank]){
        _rank = rank;
    }
}


@end
