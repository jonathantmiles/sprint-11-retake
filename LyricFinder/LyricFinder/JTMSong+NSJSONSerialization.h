//
//  JTMSong+NSJSONSerialization.h
//  LyricFinder
//
//  Created by Jonathan T. Miles on 10/23/18.
//  Copyright © 2018 Jonathan T. Miles. All rights reserved.
//

#import "JTMSong.h"

NS_ASSUME_NONNULL_BEGIN

@interface JTMSong (NSJSONSerialization)

-(instancetype)initFromDictionary:(NSDictionary *)dictionary title:(NSString *)title artist:(NSString *)artist lyrics:(NSString *)lyrics rating:(int)rating;

-(NSDictionary *)convertToDictionaryFromTitle:(NSString *)title artist:(NSString *)artist lyrics:(NSString *)lyrics rating:(int)rating;

@end

NS_ASSUME_NONNULL_END
