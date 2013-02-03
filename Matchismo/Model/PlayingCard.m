//
//  PlayingCard.m
//  Matchismo
//
//  Created by Ron Matyjanka on 2013-02-01.
//  Copyright (c) 2013 Ron Matyjanka. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

- (NSString *) contents
{
    return [[PlayingCard rankStrings] [self.rank] stringByAppendingString:self.suit];
}

@synthesize suit = _suit;
- (void) setSuit:(NSString *)suit
{
    if ([[PlayingCard validSuits] containsObject:suit])
    {
        _suit = suit;
    }
}

- (NSString *) suit
{
    return _suit ? _suit : @"?";
}

- (void) setRank:(NSUInteger)rank
{
    if (rank <= [PlayingCard maxRank])
    {
        _rank = rank;
    }
}

+ (NSArray *) validSuits
{
    static NSArray *validSuits = nil;
    if (!validSuits) validSuits = @[@"♥", @"♦", @"♠", @"♣"];
    return validSuits;
}

+ (NSArray *) rankStrings
{
    return @[@"?", @"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
}

+ (NSUInteger) maxRank
{
    return [self rankStrings].count-1;
}

- (int)match:(NSArray *)otherCards
{
    int score = 0;
    
    if (otherCards.count == 1)
    {
        PlayingCard *otherCard = [otherCards lastObject];
        if ([otherCard.suit isEqualToString:self.suit])
        {
            score = 1;
        }
        else if (otherCard.rank == self.rank)
        {
            score = 4;
        }
    }
    
    return score;
}

@end
