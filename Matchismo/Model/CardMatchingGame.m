//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Ron Matyjanka on 2013-02-01.
//  Copyright (c) 2013 Ron Matyjanka. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (strong, nonatomic) NSMutableArray *cards;
@property (nonatomic) int score; // make score writeable in the implementation; it's readonly in interface
@end

@implementation CardMatchingGame

// getter for cards
- (NSMutableArray *) cards
{
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}



// here's the designated initializer
- (id) initWithCardCount:(NSUInteger)count
               usingDeck:(Deck *)deck
{
    self = [super init];
    
    if (self)
    {
        for (int i = 0; i < count; i++)
        {
            Card *card = [deck drawRandomCard];
            if (!card)
            {
                self = nil;
            }
            else
            {
                self.cards[i] = card;
            }
        }
    }
    
    return self;
}

- (Card *) cardAtIndex:(NSUInteger)index
{
    return (index < self.cards.count) ? self.cards[index] : nil;
}

#define FLIP_COST 1
#define MATCH_BONUS 4
#define MISMATCH_PENALTY 2

- (void) flipCardAtIndex:(NSUInteger)index
{
    Card *card =  [self cardAtIndex:index];
    
    if (!card.isUnplayable)
    {
        if (!card.isFaceUp)
        {
            // this will be the matching process
            for (Card *otherCard in self.cards) // loop through all other cards
            {
                if (otherCard.isFaceUp && !otherCard.isUnplayable) // if other card is face up and playable. NOTE the to be flipped card is not yet face up...
                {
                    int matchScore = [card match:@[otherCard]];
                    if (matchScore)
                    {
                        otherCard.unplayable = YES;
                        card.unplayable = YES;
                        self.score += matchScore * MATCH_BONUS;
                    }
                    else
                    {
                        otherCard.faceUp = NO;
                        self.score -= MISMATCH_PENALTY;
                    }
                    break;
                }
            }
            self.score -= FLIP_COST;
        }
        card.faceUp = !card.isFaceUp;
    }
}


@end
