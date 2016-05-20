//
//  Album.m
//  ElvisPresleyTopTracks
//
//  Created by Christopher E White on 5/19/16.
//  Copyright © 2016 Christopher White. All rights reserved.
//

#import "Album.h"

@implementation Album

- (id)initWithDictionary:(NSDictionary*)trackDictionary
{
    self = [super init];
    
    if (self) {
        
        self.title = trackDictionary[@"album"][@"name"];
        
        self.albumId = trackDictionary[@"album"][@"id"];
        
        NSArray *albumCovers = trackDictionary[@"album"][@"images"];
        
        NSDictionary *albumCoverImageDictionary = albumCovers[0];
        
        NSString *albumCoverImagePath = albumCoverImageDictionary[@"url"];
        
        self.largeCoverImageURL = [NSURL URLWithString:albumCoverImagePath];
        
        albumCoverImageDictionary = albumCovers[1];
        
        albumCoverImagePath = albumCoverImageDictionary[@"url"];
        
        self.mediumCoverImageURL = [NSURL URLWithString:albumCoverImagePath];
        
        albumCoverImageDictionary = albumCovers[2];
        
        albumCoverImagePath = albumCoverImageDictionary[@"url"];
        
        self.smallCoverImageURL = [NSURL URLWithString:albumCoverImagePath];
        
    }
    
    return self;
}

@end
