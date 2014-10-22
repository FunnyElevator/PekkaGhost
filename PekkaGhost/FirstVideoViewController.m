//
//  FirstVideoViewController.m
//  PekkaGhost
//
//  Created by Fabian on 22.10.14.
//  Copyright (c) 2014 Fabian. All rights reserved.
//

#import "FirstVideoViewController.h"

@import AVFoundation;
@import AVKit;

NSString * const kPlayerItemUrl = @"Videos/v1.mov";

@interface FirstVideoViewController ()

@end

@implementation FirstVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    /*
    AVAsset *asset = [AVAsset assetWithURL:url];
    AVPlayerItem *playerItem = [AVPlayerItem playerItemWithAsset:asset];
    
    AVPlayer *player = [AVPlayer playerWithPlayerItem:playerItem];
    */
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        
        //NSURL *url = [NSURL URLWithString:kPlayerItemUrl];
        NSString *filepath = [[NSBundle mainBundle] pathForResource:@"v1" ofType:@"mov"];
        NSURL    *fileURL = [NSURL fileURLWithPath:filepath];
        AVPlayerItem *playerItem = [AVPlayerItem playerItemWithURL:fileURL];
        AVPlayer *player = [AVPlayer playerWithPlayerItem:playerItem];
        
        AVPlayerViewController *playerViewController = [[AVPlayerViewController alloc] init];
        playerViewController.player = player;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [self presentViewController:playerViewController
                               animated:YES
                             completion:^{
                             }];
        });
    });
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end