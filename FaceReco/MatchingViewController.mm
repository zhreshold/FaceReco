//
//  MatchingViewController.m
//  FaceReco
//
//  Created by Zhi Zhang on 13-2-22.
//  Copyright (c) 2013年 Zhi Zhang. All rights reserved.
//

#import "MatchingViewController.h"

@interface MatchingViewController ()

@end

@implementation MatchingViewController
@synthesize matchingVideoCamera, matchingProgressBar;

double gTime;
BOOL   gMatchSucceed;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.matchingVideoCamera = [[CvVideoCamera alloc] initWithParentView:matchingImageView];
    self.matchingVideoCamera.delegate = self;
    self.matchingVideoCamera.defaultAVCaptureDevicePosition = AVCaptureDevicePositionFront; //Default front camera
    self.matchingVideoCamera.defaultAVCaptureSessionPreset = AVCaptureSessionPreset352x288;
    self.matchingVideoCamera.defaultAVCaptureVideoOrientation = AVCaptureVideoOrientationPortrait;
    self.matchingVideoCamera.defaultFPS = 20;
    self.matchingVideoCamera.grayscaleMode = NO;
    
    [matchingProgressBar setProgress: 0.0 animated:NO];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#ifdef __cplusplus
- (void)processImage:(cv::Mat &)image;
{
    //do sth.
    
#if 0
    if (((CACurrentMediaTime() - gTime)) > 5)
    {
        [self.matchingVideoCamera stop];
        //gMatchSucceed = YES;
        [self performSegueWithIdentifier:@"SegueMatchingToResult" sender:self];
        //[self dismissViewControllerAnimated:YES completion:nil];
        
    }
    else
    {
        
    }
#endif
}
#endif

- (IBAction)matchingStopButton:(id)sender {
    [self.matchingVideoCamera stop];
    
}

- (IBAction)startMatchingButton:(id)sender {
    gMatchSucceed = FALSE;
    gTime = CACurrentMediaTime();
    [self.matchingVideoCamera start];
    
    
    while ((((CACurrentMediaTime() - gTime)) < 5))
    {
        float fProgress = ((CACurrentMediaTime() - gTime) / 5);
        [matchingProgressBar setProgress:fProgress animated:YES];
    }
    [self.matchingVideoCamera stop];
    [self performSegueWithIdentifier:@"SegueMatchingToResult" sender:self];
    
}



@end
