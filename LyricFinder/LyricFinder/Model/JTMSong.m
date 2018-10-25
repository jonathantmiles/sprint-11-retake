//
//  Song.m
//  LyricFinder
//
//  Created by Jonathan T. Miles on 10/23/18.
//  Copyright © 2018 Jonathan T. Miles. All rights reserved.
//

#import "JTMSong.h"

@implementation JTMSong

- (instancetype)initWithTitle:(NSString *)title artist:(NSString *)artist lyrics:(NSString *)lyrics rating:(int)rating
{
    self = [super init];
    if (self) {
        _title = title;
        _artist = artist;
        _lyrics = lyrics;
        _rating = rating;
    }
    return self;
}

@end
