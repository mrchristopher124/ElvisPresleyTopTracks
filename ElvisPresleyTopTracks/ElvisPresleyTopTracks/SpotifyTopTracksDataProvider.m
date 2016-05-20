//
//  SpotifyTopTracksDataProvider.m
//  ElvisPresleyTopTracks
//
//  Created by Christopher E White on 5/19/16.
//  Copyright © 2016 Christopher White. All rights reserved.
//

#import "SpotifyTopTracksDataProvider.h"
#import <UIKit/UIKit.h>

@interface SpotifyTopTracksDataProvider ()

@property(nonatomic, strong) NSArray *topTracks;

@end

@implementation SpotifyTopTracksDataProvider

- (NSInteger)numberOfTracks
{
    return [self.topTracks count];
}

- (Track*)trackAtIndexPath:(NSIndexPath *)indexPath
{
    id track = self.topTracks[indexPath.row];
    
    return nil;
}

- (Album*)albumWithId:(NSString*)albumId
{
    return nil;
}

- (void)loadTopTracks
{
    NSURL *topTracksURL = [NSURL URLWithString:@"https://api.spotify.com/v1/artists/43ZHCT0cAZBISjO8DG9PnE/top-tracks?country=US"];
    
    NSData* data = [NSData dataWithContentsOfURL:topTracksURL];
    
    NSError* error;
    
    NSDictionary* json = [NSJSONSerialization JSONObjectWithData:data
                                                         options:kNilOptions
                                                           error:&error];
    
    NSArray* topTracks = nil;
    
    if (!error) {
        
        topTracks = json[@"tracks"];
        
        NSLog(@"tracks: %@", topTracks);
        
    }
    
}

@end
