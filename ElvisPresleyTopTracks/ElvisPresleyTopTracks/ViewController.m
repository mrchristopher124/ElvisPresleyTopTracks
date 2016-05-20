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

@interface ViewController () <UICollectionViewDataSource>

@property(nonatomic, weak) IBOutlet UIView *headerView;
@property(nonatomic, weak) IBOutlet UICollectionView *topTracksCollectionView;
@property(nonatomic, strong) id<TopTracksDataProviderProtocol> topTracksDataProvider;

@end

@implementation ViewController

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.topTracksDataProvider = [TopTracksDataProviderFactory dataProviderOfType:TopTracksDataProviderFile];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;
{
    return [self.topTracksDataProvider numberOfTracks];
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    id track = [self.topTracksDataProvider trackAtIndexPath:indexPath];
    
    return nil;
}

@end
