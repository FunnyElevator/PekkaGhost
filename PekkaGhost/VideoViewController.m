//
//  VideoViewController.m
//  PekkaGhost
//
//  Created by Fabian on 23.10.14.
//  Copyright (c) 2014 Fabian. All rights reserved.
//

#import "VideoViewController.h"
@import AVFoundation;
@import AVKit;

@interface VideoViewController ()
@property (weak, nonatomic) IBOutlet UIView *imagePreview;

@end

@implementation VideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

}

- (void)viewDidAppear:(BOOL)animated {
    //----- SHOW LIVE CAMERA PREVIEW -----
    AVCaptureSession *session = [[AVCaptureSession alloc] init];
    session.sessionPreset = AVCaptureSessionPresetMedium;
    
    CALayer *viewLayer = self.imagePreview.layer;
    NSLog(@"viewLayer = %@", viewLayer);
    
    AVCaptureVideoPreviewLayer *captureVideoPreviewLayer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:session];
    
    captureVideoPreviewLayer.frame = self.imagePreview.bounds;
    [self.imagePreview.layer addSublayer:captureVideoPreviewLayer];
    
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    
    NSError *error = nil;
    AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:device error:&error];
    if (!input) {
        // Handle the error appropriately.
        NSLog(@"ERROR: trying to open camera: %@", error);
    }
    [session addInput:input];
    
    [session startRunning];
    //self.imagePreview.transform = CGAffineTransformMakeRotation(3.141/2);
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
