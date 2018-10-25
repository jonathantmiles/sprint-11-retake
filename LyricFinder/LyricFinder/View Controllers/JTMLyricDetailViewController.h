//
//  JTMLyricDetailViewController.h
//  LyricFinder
//
//  Created by Jonathan T. Miles on 10/24/18.
//  Copyright © 2018 Jonathan T. Miles. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JTMLyricController.h"

@class JTMLyricController;

NS_ASSUME_NONNULL_BEGIN

@interface JTMLyricDetailViewController : UIViewController

@property (nonatomic) JTMLyricController *lyricController;
@property (nonatomic) JTMSong *lyric;

@end

NS_ASSUME_NONNULL_END
