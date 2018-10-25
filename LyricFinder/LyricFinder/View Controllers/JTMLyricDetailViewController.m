//
//  JTMLyricDetailViewController.m
//  LyricFinder
//
//  Created by Jonathan T. Miles on 10/24/18.
//  Copyright © 2018 Jonathan T. Miles. All rights reserved.
//

#import "JTMLyricDetailViewController.h"

@interface JTMLyricDetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;
@property (weak, nonatomic) IBOutlet UIStepper *ratingStepper;
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextField *artistTextField;
- (IBAction)searchForLyrics:(id)sender;
@property (weak, nonatomic) IBOutlet UITextView *lyricsTextView;
- (IBAction)saveLyrics:(id)sender;


@end

@implementation JTMLyricDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateViews];
}

- (void)updateViews {
    NSString *ratingHeader = @"Rating: ";
    NSString *ratingText = [ratingHeader stringByAppendingString:[@(self.lyric.rating) stringValue]];
    [self.ratingLabel setText:(ratingText)];
    [self.titleTextField setText:self.lyric.title];
    [self.artistTextField setText:self.lyric.artist];
    [self.lyricsTextView setText:self.lyric.lyrics];
}

- (IBAction)searchForLyrics:(id)sender {
    NSString *title = self.titleTextField.text;
    NSString *artist = self.artistTextField.text;
    [self.lyricController fetchLyricsForSong:title byArtist:artist completionHandler:^(NSString * _Nonnull lyricsBody, NSError * _Nonnull error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [[self lyricsTextView] setText:lyricsBody];
            //[self updateViews];
        });
    }];
}
- (IBAction)saveLyrics:(id)sender {
    [self.lyricController saveLyricWithTitle:self.titleTextField.text artist:self.artistTextField.text lyrics:self.lyricsTextView.text rating:self.ratingStepper.value];
}
@end
