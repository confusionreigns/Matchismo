//
//  Deck.h
//  Matchismo
//
//  Created by Ron Matyjanka on 2013-02-01.
//  Copyright (c) 2013 Ron Matyjanka. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void) addCard:(Card *)card
           atTop:(BOOL) atTop;

-(Card *)drawRandomCard;

@end

// return to slide 161161