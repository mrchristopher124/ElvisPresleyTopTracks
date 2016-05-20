//
//  Track.m
//  ElvisPresleyTopTracks
//
//  Created by Christopher E White on 5/19/16.
//  Copyright © 2016 Christopher White. All rights reserved.
//

#import "Track.h"

@implementation Track

- (id)initWithDictionary:(NSDictionary*)trackDictionary
{
    self = [super init];
    
    if (self) {
        
        self.title = trackDictionary[@"name"];
        
        self.duration = [trackDictionary[@"duration_ms"] doubleValue];
        
    }
    
    return self;
}

@end
