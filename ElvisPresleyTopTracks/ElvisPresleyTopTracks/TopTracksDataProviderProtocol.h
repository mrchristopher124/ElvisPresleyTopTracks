//
//  TopTracksDataProviderProtocol.h
//  ElvisPresleyTopTracks
//
//  Created by Christopher E White on 5/19/16.
//  Copyright © 2016 Christopher White. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Track;
@class Album;

@protocol TopTracksDataProviderProtocol <NSObject>

- (NSInteger)numberOfTracks;

- (Track*)trackAtIndexPath:(NSIndexPath *)indexPath;

- (Album*)albumWithId:(NSString*)albumId;

- (void)loadTopTracks:(void (^)())completionBlock;

@end
