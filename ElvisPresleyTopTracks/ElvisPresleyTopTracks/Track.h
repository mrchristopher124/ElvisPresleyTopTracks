//
//  Track.h
//  ElvisPresleyTopTracks
//
//  Created by Christopher E White on 5/19/16.
//  Copyright © 2016 Christopher White. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Track : NSObject

- (id)initWithDictionary:(NSDictionary*)trackDictionary;

@property(nonatomic, strong) NSString *title;
@property(nonatomic, strong) NSString *albumId;
@property(nonatomic, assign) NSTimeInterval duration;

@end
