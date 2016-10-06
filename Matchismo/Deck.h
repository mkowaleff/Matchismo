//
//  Deck.h
//  Matchismo
//
//  Created by Martin on 10/3/16.
//  Copyright © 2016 Martin Kowaleff. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

-(void) addCard:(Card *)card atTop:(BOOL)atTop;

-(void) addCard:(Card *)card;

-(Card *) drawRandomCard;









@end
