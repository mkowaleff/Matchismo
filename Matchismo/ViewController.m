//
//  ViewController.m
//  Matchismo
//
//  Created by Martin on 10/3/16.
//  Copyright © 2016 Martin Kowaleff. All rights reserved.
//

#import "ViewController.h"
#import "Deck.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (nonatomic, strong) Deck *deck;
@property (nonatomic, strong) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UISegmentedControl *matchModeButton;
@property (weak, nonatomic) IBOutlet UITextView *activityLog;


@end

@implementation ViewController



-(CardMatchingGame *)game{
    if(!_game)
        _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count] usingDeck:[self createDeck]];
    return _game;
}



- (Deck *)createDeck{
    return [[PlayingCardDeck alloc] init];
}



- (IBAction)deal:(UIButton *)sender {
    [self reDeal];
}



- (void)reDeal {
    // enable the game type segmented control
    self.matchModeButton.enabled = YES;
    
    self.game = nil;
    self.game.matchMode = self.matchModeButton.selectedSegmentIndex;
    [self updateUI];
}

- (IBAction)changeMatchMode:(UISegmentedControl *)sender {
    [self reDeal];
}






- (IBAction)touchCardButton:(UIButton *)sender {
    self.matchModeButton.enabled = NO;
    
    NSInteger cardIndex = [self.cardButtons indexOfObject:sender];
    
    [self.game chooseCardAtIndex:cardIndex];
    
    //NSArray *lastMatchLog = [[self.game activityLog] lastObject];
    //self.activityLog.text = [lastMatchLog componentsJoinedByString:@"\n"];

    [self updateUI];
}



-(void)updateUI{
    for(UIButton *cardButton in self.cardButtons){
        NSInteger cardIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %ld", self.game.score];
    
}



-(NSString *)titleForCard:(Card *)card{
    return card.isChosen ? card.contents : @"";
}



-(UIImage *)backgroundImageForCard:(Card *)card{
    
    return [UIImage imageNamed:card.isChosen ? @"cardfront"
                              : @"cardback2"];
}


@end
