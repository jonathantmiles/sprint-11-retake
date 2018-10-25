//
//  JTMLyricController.h
//  LyricFinder
//
//  Created by Jonathan T. Miles on 10/24/18.
//  Copyright © 2018 Jonathan T. Miles. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JTMSong.h"

NS_ASSUME_NONNULL_BEGIN

@interface JTMLyricController : NSObject

// array of saved song lyrics
@property (nonatomic) NSArray *lyrics;

// fetch function that returns an object, maybe even holds it here
-(void)fetchLyricsForSong:(NSString *)title byArtist:(NSString *)artist completionHandler:(void (^)(NSString *lyricsBody, NSError *error))completion;

// add saved lyric to array
-(void)saveLyricWithTitle:(NSString *)title artist:(NSString *)artist lyrics:(NSString *)lyrics rating:(int)rating;

@end

NS_ASSUME_NONNULL_END
