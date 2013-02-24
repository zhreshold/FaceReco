//
//  MatchingViewController.h
//  FaceReco
//
//  Created by Zhi Zhang on 13-2-22.
//  Copyright (c) 2013年 Zhi Zhang. All rights reserved.
//

#import <opencv2/highgui/cap_ios.h>
using namespace cv;
#import <UIKit/UIKit.h>
#import <QuartzCore/CAAnimation.h>
#import "ResultViewController.h"

@interface MatchingViewController : UIViewController<CvVideoCameraDelegate>
{
    CvVideoCamera* matchingVideoCamera;
    IBOutlet UIImageView* matchingImageView;
    
}

@property (nonatomic, retain) CvVideoCamera* matchingVideoCamera;
//@property (weak, nonatomic) IBOutlet UIImageView *matchingImageView;
- (IBAction)matchingStopButton:(id)sender;
- (IBAction)startMatchingButton:(id)sender;

@property (weak, nonatomic) IBOutlet UIProgressView *matchingProgressBar;

@end
