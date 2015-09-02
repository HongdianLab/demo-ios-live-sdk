
# 红点直播云Demo for iOS #

## Installation  ##

 在使用之前，请首先确保你也添加了如下依赖库：
 
  * AudioToolbox.framework
  * CoreVideo.framework
  * VideoToolbox.framework
  * CoreMedia.framework
  * AVFoundation.framework


HDMediaModule.framework (红点SDK，该framework从此处[下载]( http://media-sdk.b0.upaiyun.com/ios-live-sdk/HDMediaModule.framework.zip))

### Manually ####



### CocoaPods ###

## API ##
 以下介绍请同时参考demo

#### 初始化配置 ####

    [[HDMediaModule sharedInstance] setAppId:APPID];
    [HDMediaModule sharedInstance] 调用此方法初始化SDK内部配置

#### 音频 ####
  对于音频直播，都是在一个直播间内，录制者上传，需要传入录制者的id，收听者也需要传入自己的id
  
 开始音频录制并上传至服务器
 
     [[HDMediaModule sharedInstance] startAudioRecordWithRoomId:_roomIdTextField.text myUserId:_selfIdTextField.text];
 
 结束音频录制
 
     [[HDMediaModule sharedInstance] stopAudioRecord];
 
 开始从服务器获取音频数据并播放
 
     [[HDMediaModule sharedInstance] startAudioPlayWithRoomId:_roomIdTextField.text userId:_userIdTextField.text myUserId:_selfIdTextField.text];
 
 停止音频播放
 
     [[HDMediaModule sharedInstance] stopAudioPlayWithRoomId:_roomIdTextField.text userId:_userIdTextField.text];

#### 视频 ####

  视频直播，也是在一个直播间内，录制者上传，需要传入录制者的id，收看者也需要传入自己的id
  流程是生成视频画面视图,绑定到对应的userid上，开启视频录制或播放，结束录制或停止播放

  对于录制者:
  
  1. 生成视频画面视图：
  
         _recordView = [[HDMediaModule sharedInstance] createDisplayViewWithFrame:CGRectMake(0, _roomIdTextField.frame.origin.y + _roomIdTextField.frame.size.height + 10, CGRectGetWidth(self.view.frame), 160)];
  
  2. 绑定：
  
         [[HDMediaModule sharedInstance] bindPreview:_recordView];（由于是本地录制，所以不需要userid）
  
  3. 开始录制：
  
         [[HDMediaModule sharedInstance] startVideoRecordWithRoomId:_roomIdTextField.text myUserId:_selfIdTextField.text];
  
  4. 结束录制： 
  
         [[HDMediaModule sharedInstance] stopVideoRecord];

  
对于收看者：
  
  1. 生成视频画面视图： 
  
         _playView = [[HDMediaModule sharedInstance] createDisplayViewWithFrame:CGRectMake(0, _userIdTextField.frame.origin.y + _userIdTextField.frame.size.height + 10, CGRectGetWidth(self.view.frame), 160)];
  
  2. 绑定：
  
         [[HDMediaModule sharedInstance] bindPlayViewToUserId:_userIdTextField.text view:_playView];
  
  3. 开始播放：
  
         [[HDMediaModule sharedInstance] startVideoPlayWithRoomId:_roomIdTextField.text userId:_userIdTextField.text myUserId:_selfIdTextField.text];
  
  4. 停止播放：
  
         [[HDMediaModule sharedInstance] stopVideoPlayWithRoomId:_roomIdTextField.text userId:_userIdTextField.text];

举个例子：在roomid=123，userid=456录制视频，userid=789收看，那么调用[HDMediaModule startVideoPlayWithToken:nil roomId:@“123” userId:@“456” myUserId:@“789”];

注意：停止录制或结束播放后视图自动解绑，重新开始录制或播放需要重新绑定视图
  
  切换摄像头
  
     [[HDMediaModule sharedInstance] changeCameraPosition];
  
  开启/关闭闪光灯
  
     [[HDMediaModule sharedInstance] changeTorchStatus];



## Requirements ##

 requires iOS 7.0 or OS X 10.7 and greater.

## Contact ##


## License ##

Copyright 2013 Hongdian, Inc.

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. [See the License](LICENSE.txt) for the specific language governing permissions and limitations under the License.
