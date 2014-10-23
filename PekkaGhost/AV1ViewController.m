//
//  AV1ViewController.m
//  PekkaGhost
//
//  Created by Fabian on 23.10.14.
//  Copyright (c) 2014 Fabian. All rights reserved.
//

#import "AV1ViewController.h"
@import AVFoundation;
@import AVKit;

@interface AV1ViewController ()

@end

@implementation AV1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *filepath = [[NSBundle mainBundle] pathForResource:@"v1" ofType:@"mov"];
    NSURL    *fileURL = [NSURL fileURLWithPath:filepath];
    
    AVAsset *asset = [AVAsset assetWithURL:fileURL];
    AVPlayerItem *playerItem = [AVPlayerItem playerItemWithAsset:asset];
    
    AVPlayer *vPlayer = [AVPlayer playerWithPlayerItem:playerItem];
    self.player = vPlayer;
    
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
