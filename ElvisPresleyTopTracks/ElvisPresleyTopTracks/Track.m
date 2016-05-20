//
//  Track.m
//  ElvisPresleyTopTracks
//
//  Created by Christopher E White on 5/19/16.
//  Copyright © 2016 Christopher White. All rights reserved.
//

#import "Track.h"

/**
 
 @brief This class encapsulates the basic information for a track.
 
 */

@implementation Track

- (id)initWithDictionary:(NSDictionary*)trackDictionary
{
    self = [super init];
    
    if (self) {
        
        self.title = trackDictionary[@"name"];
        
        self.albumId = trackDictionary[@"album"][@"id"];
        
        self.duration = [trackDictionary[@"duration_ms"] doubleValue];
        
    }
    
    return self;
}

@end
