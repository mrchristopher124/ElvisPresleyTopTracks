//
//  SpotifyTopTracksDataProvider.m
//  ElvisPresleyTopTracks
//
//  Created by Christopher E White on 5/19/16.
//  Copyright © 2016 Christopher White. All rights reserved.
//

#import "SpotifyTopTracksDataProvider.h"
#import <UIKit/UIKit.h>
#import "Track.h"
#import "Album.h"

@interface SpotifyTopTracksDataProvider ()

@property(nonatomic, strong) NSMutableArray *topTracks;

@property(nonatomic, strong) NSMutableDictionary *albums;

@end

@implementation SpotifyTopTracksDataProvider

- (NSInteger)numberOfTracks
{
    return [self.topTracks count];
}

- (Track*)trackAtIndexPath:(NSIndexPath *)indexPath
{
    Track *track = self.topTracks[indexPath.row];
    
    return track;
}

- (Album*)albumWithId:(NSString*)albumId
{
    Album *album = self.albums[albumId];
    
    return album;
}

- (void)loadTopTracks:(void (^)())completionBlock
{
    NSURL *topTracksURL = [NSURL URLWithString:@"https://api.spotify.com/v1/artists/43ZHCT0cAZBISjO8DG9PnE/top-tracks?country=US"];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        
        NSData* data = [NSData dataWithContentsOfURL:topTracksURL];
        
        NSError* error;
        
        NSDictionary* json = [NSJSONSerialization JSONObjectWithData:data
                                                             options:kNilOptions
                                                               error:&error];
        
        if (!error) {
            
            NSArray *loadedTracks = json[@"tracks"];
            
            NSLog(@"tracks: %@", loadedTracks);
            
            if (!self.topTracks) {
                
                self.topTracks = [[NSMutableArray alloc] initWithCapacity:[loadedTracks count]];
                
                self.albums = [[NSMutableDictionary alloc] init];
                
            }
            
            for (NSDictionary *trackDictionary in loadedTracks) {
                
                Track *track = [[Track alloc] initWithDictionary:trackDictionary];
                
                [self.topTracks addObject:track];
                
                NSString *albumId = trackDictionary[@"album"][@"id"];
                
                Album *album = [[Album alloc] initWithDictionary:trackDictionary];
                
                self.albums[albumId] = album;
                
            }
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                if (completionBlock) {
                    
                    completionBlock();
                    
                }
                
            });
        }
        
    });
}

@end
