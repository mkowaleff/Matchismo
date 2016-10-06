//
//  Card.m
//  Matchismo
//
//  Created by Martin on 10/3/16.
//  Copyright © 2016 Martin Kowaleff. All rights reserved.
//

#import "Card.h"


@interface Card()
//@property(nonatomic, strong) NSMutableArray* activity;
@end



@implementation Card

-(int)match:(NSArray *)otherCards{
    int score = 0;
    for (Card *card in otherCards){
        if([card.contents isEqualToString:self.contents]){
            score = 1;
        }
    }
    
    return score;
    
}

//- (NSMutableArray *)activity {
//    if (!_activity) _activity = [[NSMutableArray alloc] init];
//    return _activity;
//}

//- (NSArray *)activityLog {
//    return self.activity;
//}











@end
