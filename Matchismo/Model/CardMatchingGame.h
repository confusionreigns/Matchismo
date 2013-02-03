//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Ron Matyjanka on 2013-02-01.
//  Copyright (c) 2013 Ron Matyjanka. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject

- (id) initWithCardCount:(NSUInteger)cardCount // designated inializer
               usingDeck:(Deck *)deck;

- (void)flipCardAtIndex:(NSUInteger)index;

-(Card *)cardAtIndex:(NSUInteger)index;

@property (nonatomic, readonly) int score;

@end
