//
//  ViewController.m
//  PekkaGhost
//
//  Created by Fabian on 22.10.14.
//  Copyright (c) 2014 Fabian. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *blurView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    

}
- (void)viewDidAppear:(BOOL)animated {
    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    UIVisualEffectView *blurEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    [blurEffectView setFrame:self.blurView.bounds];
    //[self.blurView addSubview:blurEffectView];
    [self.blurView setBackgroundColor:[UIColor colorWithWhite:1.0 alpha:0.0]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
