//
//  MediaViewController.h
//  HDVideoDemo
//
//  Created by snackbaby on 15/8/14.
//  Copyright (c) 2015年 wangzi-apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MediaViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *userIdTextField;
@property (weak, nonatomic) IBOutlet UITextField *roomIdTextField;
@property (weak, nonatomic) IBOutlet UITextField *selfIdTextField;

- (IBAction)audioRecordAction:(id)sender;
- (IBAction)audioRecordStopAction:(id)sender;

- (IBAction)videoRecordAction:(id)sender;
- (IBAction)videoStopAction:(id)sender;
- (IBAction)changeCameraAction:(id)sender;
- (IBAction)changeTorchAction:(id)sender;

- (IBAction)audioPlayAction:(id)sender;
- (IBAction)audioPlayStopAction:(id)sender;
- (IBAction)videoPlayAction:(id)sender;
- (IBAction)videoPlayStopAction:(id)sender;

- (IBAction)stopAllAction:(id)sender;
@end
