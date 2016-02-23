//
//  MediaViewController.m
//  HDVideoDemo
//
//  Created by snackbaby on 15/8/14.
//  Copyright (c) 2015年 wangzi-apple. All rights reserved.
//

#import "MediaViewController.h"

#import <HDMediaModule/HDMediaModule.h>

#define APPID @"hongdianhongdian"

@implementation MediaViewController
{
    HDOpenGLYUVView *_recordView;
    HDOpenGLYUVView *_playView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _selfIdTextField.text = [NSString stringWithFormat:@"%u",arc4random()/1000000];
    
    
    _recordView = [[HDMediaModule sharedInstance] createDisplayViewWithFrame:CGRectMake(0, _roomIdTextField.frame.origin.y + _roomIdTextField.frame.size.height + 10, CGRectGetWidth(self.view.frame), 160)];
    [self.view addSubview:_recordView];
    [self.view sendSubviewToBack:_recordView];
    
    
    _playView = [[HDMediaModule sharedInstance] createDisplayViewWithFrame:CGRectMake(0, _userIdTextField.frame.origin.y + _userIdTextField.frame.size.height + 10, CGRectGetWidth(self.view.frame), 160)];
    [self.view addSubview:_playView];
    [self.view sendSubviewToBack:_playView];
    
    [[HDMediaModule sharedInstance] setAppId:APPID];

    
}

- (IBAction)audioRecordAction:(id)sender {
    [[HDMediaModule sharedInstance] startAudioRecordWithRoomId:_roomIdTextField.text myUserId:_selfIdTextField.text];
}

- (IBAction)audioRecordStopAction:(id)sender {
    [[HDMediaModule sharedInstance] stopAudioRecord];
}

- (IBAction)videoRecordAction:(id)sender {
    [[HDMediaModule sharedInstance] bindPreview:_recordView];
    [[HDMediaModule sharedInstance] startVideoRecordWithRoomId:_roomIdTextField.text myUserId:_selfIdTextField.text];
}

- (IBAction)videoStopAction:(id)sender {
    [[HDMediaModule sharedInstance] stopVideoRecord];
}

- (IBAction)changeCameraAction:(id)sender {
    [[HDMediaModule sharedInstance] changeCameraPosition];
}

- (IBAction)changeTorchAction:(id)sender {
    [[HDMediaModule sharedInstance] changeTorchStatus];
}
- (IBAction)audioPlayAction:(id)sender {
    [[HDMediaModule sharedInstance] startAudioPlayWithRoomId:_roomIdTextField.text userId:_userIdTextField.text myUserId:_selfIdTextField.text];
}

- (IBAction)audioPlayStopAction:(id)sender {
    [[HDMediaModule sharedInstance] stopAudioPlayWithRoomId:_roomIdTextField.text userId:_userIdTextField.text];
}

- (IBAction)videoPlayAction:(id)sender {
    [[HDMediaModule sharedInstance] bindPlayViewToUserId:_userIdTextField.text view:_playView];
    [[HDMediaModule sharedInstance] startVideoPlayWithRoomId:_roomIdTextField.text userId:_userIdTextField.text myUserId:_selfIdTextField.text];
}

- (IBAction)videoPlayStopAction:(id)sender {
    [[HDMediaModule sharedInstance] stopVideoPlayWithRoomId:_roomIdTextField.text userId:_userIdTextField.text];
}

- (IBAction)stopAllAction:(id)sender {
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
@end
