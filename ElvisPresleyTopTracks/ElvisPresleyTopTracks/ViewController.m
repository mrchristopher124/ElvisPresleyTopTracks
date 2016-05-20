//
//  ViewController.m
//  ElvisPresleyTopTracks
//
//  Created by Christopher E White on 5/19/16.
//  Copyright © 2016 Christopher White. All rights reserved.
//

#import "ViewController.h"
#import "TopTracksDataProviderProtocol.h"
#import "TopTracksDataProviderFactory.h"
#import "Track.h"
#import "Album.h"
#import "TrackCollectionViewCell.h"

/**
 
 @brief This class is the sole view controller of the application. It contains a header on its top half and a collection view on its bottom half.
 
 @discussion The collection view uses a data provider to fetch the information to display and to provide the data for the UICollectionViewDataSource.
 
 */

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property(nonatomic, weak) IBOutlet UIView *headerView;

@property(nonatomic, weak) IBOutlet UICollectionView *topTracksCollectionView;

@property(nonatomic, strong) id<TopTracksDataProviderProtocol> topTracksDataProvider;

@property(nonatomic, weak) IBOutlet UIImageView *albumCoverImageView;

@property(nonatomic, weak) IBOutlet UIActivityIndicatorView *loadCoverImageActivityIndicateView;

@property(nonatomic, weak) IBOutlet UICollectionViewFlowLayout *flowLayout;

@end

@implementation ViewController

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UINib *cellNib = [UINib nibWithNibName:@"TrackCollectionViewCell" bundle:nil];
    
    [self.topTracksCollectionView registerNib:cellNib forCellWithReuseIdentifier:@"TrackCollectionViewCell"];
    
    self.topTracksDataProvider = [TopTracksDataProviderFactory dataProviderOfType:TopTracksDataProviderSpotify];
    
    [self.topTracksDataProvider loadTopTracks:^{
        
        Track *track = [self.topTracksDataProvider trackAtIndexPath:0];
        
        [self displayTrackAlbumInHeader:track];
        
        [self.topTracksCollectionView reloadData];
        
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)displayTrackAlbumInHeader:(Track*)track
{
    Album *album = [self.topTracksDataProvider albumWithId:track.albumId];
    
    self.albumCoverImageView.image = nil;
    
    [self.loadCoverImageActivityIndicateView startAnimating];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        
        NSData *coverImageData = [NSData dataWithContentsOfURL:album.largeCoverImageURL];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [self.loadCoverImageActivityIndicateView stopAnimating];
            
            self.albumCoverImageView.image = [UIImage imageWithData:coverImageData];
            
        });
        
    });
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;
{
    return [self.topTracksDataProvider numberOfTracks];
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    TrackCollectionViewCell *cell = (TrackCollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:@"TrackCollectionViewCell" forIndexPath:indexPath];
    
    return cell;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView*)collectionView didSelectItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    Track *track = [self.topTracksDataProvider trackAtIndexPath:indexPath];
    
    [self displayTrackAlbumInHeader:track];
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    TrackCollectionViewCell *trackCollectionViewCell = (TrackCollectionViewCell*)cell;
    
    Track *track = [self.topTracksDataProvider trackAtIndexPath:indexPath];
    
    Album *album = [self.topTracksDataProvider albumWithId:track.albumId];
    
    trackCollectionViewCell.track = track;
    
    trackCollectionViewCell.album = album;
    
}

#pragma mark - UICollectionViewLayoutDelegate

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat cellWidth = collectionView.frame.size.width/2.0f;
    
    return CGSizeMake(cellWidth, cellWidth);
}

@end
