//
//  TopTracksDataProviderFactory.m
//  ElvisPresleyTopTracks
//
//  Created by Christopher E White on 5/19/16.
//  Copyright © 2016 Christopher White. All rights reserved.
//

#import "TopTracksDataProviderFactory.h"
#import "FileTopTracksDataProvider.h"
#import "SpotifyTopTracksDataProvider.h"

/**
 
 @brief This class uses the factory pattern to make it easy to request different types of TopTracksDataProvider's
 
 */

@implementation TopTracksDataProviderFactory

+ (id<TopTracksDataProviderProtocol>)dataProviderOfType:(TopTracksDataProvider)dataProviderType
{
    id<TopTracksDataProviderProtocol> dataProvider = nil;
    
    switch (dataProviderType) {
            
        case TopTracksDataProviderFile:
            
            dataProvider = [[FileTopTracksDataProvider alloc] init];
            
            break;
            
        case TopTracksDataProviderSpotify:
            
            dataProvider = [[SpotifyTopTracksDataProvider alloc] init];
            
            break;
            
        default:
            break;
    }
    
    return dataProvider;
}


@end
