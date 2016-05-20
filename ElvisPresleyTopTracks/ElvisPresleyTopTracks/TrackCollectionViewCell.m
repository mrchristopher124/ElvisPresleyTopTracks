//
//  TrackCollectionViewCell.m
//  ElvisPresleyTopTracks
//
//  Created by Christopher E White on 5/19/16.
//  Copyright © 2016 Christopher White. All rights reserved.
//

#import "TrackCollectionViewCell.h"
#import "Track.h"
#import "Album.h"

@interface TrackCollectionViewCell ()

@property(nonatomic, weak) IBOutlet UIImageView *albumCoverImageView;

@property(nonatomic, weak) IBOutlet UILabel *titleLabel;

@property(nonatomic, weak) IBOutlet UILabel *albumNameLabel;

@property(nonatomic, weak) IBOutlet UILabel *durationLabel;

@end

@implementation TrackCollectionViewCell

- (void)setTrack:(Track *)track
{
    _track = track;
    
    self.titleLabel.text = _track.title;
    
    NSDateComponentsFormatter *formatter = [[NSDateComponentsFormatter alloc] init];
    
    formatter.allowedUnits = NSCalendarUnitMinute | NSCalendarUnitSecond;
    
    formatter.zeroFormattingBehavior = NSDateComponentsFormatterZeroFormattingBehaviorPad;
    
    NSString *string = [formatter stringFromTimeInterval:_track.duration * 0.001];
    
    self.durationLabel.text = string;
    
}

- (void)setAlbum:(Album *)album
{
    _album = album;
    
    self.albumNameLabel.text = _album.title;
    
    self.backgroundColor = [UIColor redColor];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
    
        NSData *coverImageData = [NSData dataWithContentsOfURL:_album.mediumCoverImageURL];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            self.albumCoverImageView.image = [UIImage imageWithData:coverImageData];
            
        });
        
    });
}

@end
