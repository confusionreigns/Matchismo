//
//  Card.h
//  Matchismo
//
//  Created by Ron Matyjanka on 2013-02-01.
//  Copyright (c) 2013 Ron Matyjanka. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;

@property (nonatomic, getter=isFaceUp) BOOL faceUp;

@property (nonatomic, getter=isUnplayable) BOOL unplayable;

- (int) match:(NSArray *) otherCards;

@end
