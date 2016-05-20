//
//  Album.h
//  ElvisPresleyTopTracks
//
//  Created by Christopher E White on 5/19/16.
//  Copyright © 2016 Christopher White. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Album : NSObject

- (id)initWithDictionary:(NSDictionary*)trackDictionary;

@property(nonatomic, strong) NSString *title;
@property(nonatomic, strong) NSString *albumId;
@property(nonatomic, strong) NSURL *largeCoverImageURL;
@property(nonatomic, strong) NSURL *mediumCoverImageURL;
@property(nonatomic, strong) NSURL *smallCoverImageURL;

@end
