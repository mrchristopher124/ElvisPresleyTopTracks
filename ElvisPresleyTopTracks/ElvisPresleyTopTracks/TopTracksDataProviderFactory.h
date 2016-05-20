//
//  TopTracksDataProviderFactory.h
//  ElvisPresleyTopTracks
//
//  Created by Christopher E White on 5/19/16.
//  Copyright © 2016 Christopher White. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, TopTracksDataProvider) {
    TopTracksDataProviderFile,
    TopTracksDataProviderSpotify
};

@protocol TopTracksDataProviderProtocol;

@interface TopTracksDataProviderFactory : NSObject

+ (id<TopTracksDataProviderProtocol>)dataProviderOfType:(TopTracksDataProvider)dataProviderType;

@end
