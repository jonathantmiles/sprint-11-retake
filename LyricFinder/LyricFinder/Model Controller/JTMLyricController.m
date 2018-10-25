//
//  JTMLyricController.m
//  LyricFinder
//
//  Created by Jonathan T. Miles on 10/24/18.
//  Copyright © 2018 Jonathan T. Miles. All rights reserved.
//

#import "JTMLyricController.h"

@interface JTMLyricController ()

@property (nonatomic) NSMutableArray *internalLyrics;

@property NSFileManager *fileManager;

@end

@implementation JTMLyricController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _internalLyrics = [[NSMutableArray alloc] init];
        _fileManager = [NSFileManager defaultManager];
    }
    return self;
}

- (void)fetchLyricsForSong:(NSString *)title byArtist:(NSString *)artist completionHandler:(void (^)(NSString *lyricsBody, NSError *error))completion
{
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURLComponents *components = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:YES];
    
    NSURLQueryItem *searchArtist = [NSURLQueryItem queryItemWithName:@"q_artist" value:artist];
    NSURLQueryItem *searchTitle = [NSURLQueryItem queryItemWithName:@"q_track" value:title];
    
    [components setQueryItems:@[searchArtist, searchTitle]];
    NSURL *url = [components URL];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request setValue:@"dZ5pJldpLRmsh74FcLkkjAvtFm8Zp1bYMTnjsn1MKkJ9uxxDpF" forHTTPHeaderField:@"X-Mashape-Key"];
    
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            NSLog(@"Error fetching data: %@", error);
            completion(nil, error);
            return;
        }
        
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
        if (![dictionary isKindOfClass:[NSDictionary class]]) {
            NSLog(@"JSON was not a dictionary");
            completion(nil, [[NSError alloc] init]);
            return;
        }
        
        NSString *lyrics = dictionary[@"lyrics_body"];

        completion(lyrics, nil);
        
    }] resume];
}

- (void)saveLyricWithTitle:(NSString *)title artist:(NSString *)artist lyrics:(NSString *)lyrics rating:(int)rating
{
    JTMSong *song = [[JTMSong alloc] initWithTitle:title artist:artist lyrics:lyrics rating:rating];
    [_internalLyrics addObject:song];
    
    NSURL *filePath = [[self.fileManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] firstObject];
    NSDictionary *dictionary = [song convertToDictionaryFromTitle:title artist:artist lyrics:lyrics rating:rating];
    [dictionary writeToURL:filePath atomically:YES];
}

- (void)loadLyrics
{
    NSURL *filePath = [[self.fileManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] firstObject];
    NSString *stringPath = [[NSString alloc] init];
    [self.fileManager contentsAtPath: stringPath];
}

-(NSArray *)lyrics
{
    return [[self internalLyrics] copy];
}

static NSString * const baseURLString = @"https://musixmatchcom-musixmatch.p.mashape.com/wsr/1.1/matcher.lyrics.get";

@end
