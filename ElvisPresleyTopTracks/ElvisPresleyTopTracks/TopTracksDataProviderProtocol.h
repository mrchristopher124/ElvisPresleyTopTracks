//
//  TopTracksDataProviderProtocol.h
//  ElvisPresleyTopTracks
//
//  Created by Christopher E White on 5/19/16.
//  Copyright © 2016 Christopher White. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TopTracksDataProviderProtocol <NSObject>

- (NSInteger)numberOfTracks;

- (id)trackAtIndexPath:(NSIndexPath *)indexPath;

@end
