//
//  Card.h
//  Matchismo
//
//  Created by Martin on 10/3/16.
//  Copyright © 2016 Martin Kowaleff. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;

@property (nonatomic, getter=isChosen) BOOL chosen;
@property (nonatomic, getter=isMatched) BOOL matched;

-(int)match:(NSArray *)otherCards;
//-(NSArray *)activityLog;




@end
