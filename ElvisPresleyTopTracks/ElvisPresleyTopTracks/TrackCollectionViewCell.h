//
//  TrackCollectionViewCell.h
//  ElvisPresleyTopTracks
//
//  Created by Christopher E White on 5/19/16.
//  Copyright © 2016 Christopher White. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Track;
@class Album;

@interface TrackCollectionViewCell : UICollectionViewCell

@property(nonatomic, strong) Track *track;
@property(nonatomic, strong) Album *album;

@end
