//
//  Song.h
//  LyricFinder
//
//  Created by Jonathan T. Miles on 10/23/18.
//  Copyright © 2018 Jonathan T. Miles. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JTMSong : NSObject

- (instancetype)initWithTitle:(NSString *)title artist:(NSString *)artist lyrics:(NSString *)lyrics rating:(int)rating;

@property NSString *title;
@property NSString *artist;
@property NSString *lyrics;
@property int rating;

@end

NS_ASSUME_NONNULL_END
