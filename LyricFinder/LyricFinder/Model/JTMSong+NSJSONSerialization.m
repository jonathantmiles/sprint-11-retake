//
//  JTMSong+NSJSONSerialization.m
//  LyricFinder
//
//  Created by Jonathan T. Miles on 10/23/18.
//  Copyright © 2018 Jonathan T. Miles. All rights reserved.
//

#import "JTMSong+NSJSONSerialization.h"

@implementation JTMSong (NSJSONSerialization)

- (NSDictionary *)convertToDictionaryFromTitle:(NSString *)title artist:(NSString *)artist lyrics:(NSString *)lyrics rating:(int)rating
{
    return @{@"title": title, @"artist": artist, @"lyrics": lyrics, @"rating": @(rating)};
}

- (instancetype)initFromDictionary:(NSDictionary *)dictionary
{
    NSString *title = dictionary[@"title"];
    NSString *artist = dictionary[@"artist"];
    NSString *lyrics = dictionary[@"lyrics"];
    NSNumber *rating = dictionary[@"rating"];
    
    return [self initWithTitle:title artist:artist lyrics:lyrics rating:[rating integerValue]];
}

@end
