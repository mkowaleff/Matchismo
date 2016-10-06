//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Martin on 10/3/16.
//  Copyright © 2016 Martin Kowaleff. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (nonatomic, readwrite) NSUInteger score;
@property (nonatomic, strong) NSMutableArray *cards; // of Card class
//@property (nonatomic, strong) NSMutableArray *activity;
@end

@implementation CardMatchingGame

static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;

-(NSMutableArray *)cards{
    if(!_cards)
        _cards = [[NSMutableArray alloc] init];
    return _cards;
}


-(Card *)cardAtIndex:(NSUInteger)index {
    if (index< [self.cards count]){
        return self.cards[index];
    }
    else{
        return nil;
    }
}

//- (NSMutableArray *)activity {
//    if (!_activity) _activity = [[NSMutableArray alloc] init];
//    return _activity;
//}

//- (NSArray *)activityLog {
//    return self.activity;
//}



-(void)chooseCardAtIndex:(NSUInteger)index{
    Card *card = self.cards[index];
    
    if(![card isMatched]){
        if([card isChosen]){
            card.chosen = NO;
            //NSString *deselectedMessage = [[NSString alloc] initWithFormat:@"Deselected %@", card.contents];
            //[self.activity addObject:@[deselectedMessage]];
        }
        else{
            //match against other card(s)
            NSMutableArray *matchedCards = [[NSMutableArray alloc] init];
            for (Card *otherCard in self.cards){
                if(otherCard.isChosen && !otherCard.isMatched) {
                    [matchedCards addObject:otherCard];
                }
                if([matchedCards count] == (self.matchMode +1)){
                    int matchScore = [card match:matchedCards];
                    if(matchScore){
                        self.score += MATCH_BONUS;
                        card.matched = YES;
                        for (Card *otherCard in matchedCards){
                            otherCard.matched = YES;
                        }
                        //[self.activity addObject:[card activityLog]];
                    }
                    else{
                        self.score -= MISMATCH_PENALTY;
                        for (Card *otherCard in matchedCards){
                            otherCard.chosen = NO;
                        }
                        //NSString *activityLog = card.activityLog.lastObject;
                        //NSString *penaltyMessage = [activityLog stringByAppendingFormat:@"Penalized %ld points", penalty];
                        //[self.activity addObject:@[penaltyMessage]];
                    }
                    
                }
                //else{
                   // NSString *pickedMessage = [[NSString alloc] initWithFormat:@"%@ picked", card.contents];
                   // [self.activity addObject:@[pickedMessage]];
                //}
                
            }
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
        }
    }
}



-(instancetype) initWithCardCount:(NSUInteger)count
                        usingDeck:(Deck *)deck{
    self = [super init];
    
    if(self){
        for(int i=0;i<count;i++){
            Card *card = [deck drawRandomCard];
            if(card){
                [self.cards addObject:card];
            }
            else{
                self = nil;
                break;
            }
        }
    }
    return self;
}

@end



















