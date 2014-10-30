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

@interface FirstVideoViewController ()

@property (weak, nonatomic) IBOutlet UIButton *nextButton;

@end

@implementation FirstVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
   [self performSelector:@selector(goToNextView) withObject:nil afterDelay:260];
    
    /*
    AVAsset *asset = [AVAsset assetWithURL:url];
    AVPlayerItem *playerItem = [AVPlayerItem playerItemWithAsset:asset];
    
    AVPlayer *player = [AVPlayer playerWithPlayerItem:playerItem];
    
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        
        //NSURL *url = [NSURL URLWithString:kPlayerItemUrl];
        NSString *filepath = [[NSBundle mainBundle] pathForResource:@"v1" ofType:@"mov"];
        NSURL    *fileURL = [NSURL fileURLWithPath:filepath];
        AVPlayerItem *playerItem = [AVPlayerItem playerItemWithURL:fileURL];
        AVPlayer *player = [AVPlayer playerWithPlayerItem:playerItem];
        
        //self.videoPlayer.player = player;
        AVPlayerViewController *playerViewController = [[AVPlayerViewController alloc] init];
        playerViewController.player = player;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [self presentViewController:playerViewController
                               animated:YES
                             completion:^{
                             }];
        });
    });
     */
    
    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *blurEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    [blurEffectView setFrame:self.nextButton.bounds];
    //[self.nextButton addSubview:blurEffectView];
}

- (void)goToNextView {
    [self performSegueWithIdentifier:@"segueToViewTwo" sender:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  
    if ([[segue identifier] isEqualToString:@"showMoview"]) {
        AVPlayerViewController *playerViewController = segue.destinationViewController;
        
        //Player setup
        NSString *filepath = [[NSBundle mainBundle] pathForResource:@"v1" ofType:@"mov"];
        NSURL    *fileURL = [NSURL fileURLWithPath:filepath];
        playerViewController.player = [AVPlayer playerWithURL:fileURL];
    }
}


@end
