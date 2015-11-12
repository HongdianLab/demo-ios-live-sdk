
# 红点直播云Demo for iOS #

## Installation  ##

 在使用之前，请首先确保你也添加了如下依赖库：
 
  * AudioToolbox.framework
  * CoreVideo.framework
  * VideoToolbox.framework
  * CoreMedia.framework
  * AVFoundation.framework

请使用libc++(LLVM C++ standard library with C++11 support)作为C++的库，
这也是苹果默认的C++库，使用libstdc++(GNU C++ standard library)会报错。

HDMediaModule.framework (红点SDK，该Framework从此处[下载]( http://media-sdk.b0.upaiyun.com/ios-live-sdk/HDMediaModule.framework.20151113.zip))

### Manually ####



### CocoaPods ###

## API ##
 以下介绍请同时参考demo

#### 初始化配置 ####

    初始化SDK内部配置，此方法只有第一次调用的时候生效，
    AppId:用于安全校验,必须设置，否则无法实际录制或播放

    [[HDMediaModule sharedInstance] setAppId:APPID];


#### 音频 ####
  对于音频直播，都是在一个直播间内，录制者上传，需要传入录制者的id，收听者也需要传入自己的id
  
  1.开始音频录制并上传至服务器
 
     [[HDMediaModule sharedInstance] startAudioRecordWithRoomId:_roomIdTextField.text myUserId:_selfIdTextField.text];
 
  2.结束音频录制
 
     [[HDMediaModule sharedInstance] stopAudioRecord];
 
  1.开始从服务器获取音频数据并播放
 
     播放一个人的音频：
     [[HDMediaModule sharedInstance] startAudioPlayWithRoomId:_roomIdTextField.text userId:_userIdTextField.text myUserId:_selfIdTextField.text];
     播放多个人的音频：
     [[HDMediaModule sharedInstance] startAudioPlayWithRoomId:roomID userIdList:array myUserId:selfID];

 
   2.停止音频播放
 
     停止一个人的音频：
     [[HDMediaModule sharedInstance] stopAudioPlayWithRoomId:_roomIdTextField.text userId:_userIdTextField.text];
     停止所有人的音频：
     [[HDMediaModule sharedInstance] stopAudioPlay];

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
  
        播放一个人的视频：
        [[HDMediaModule sharedInstance] startVideoPlayWithRoomId:_roomIdTextField.text userId:_userIdTextField.text myUserId:_selfIdTextField.text];
        播放多人的视频：
        [[HDMediaModule sharedInstance] startVideoPlayWithRoomId:roomID userIdList:array myUserId:selfID];
 
  4. 停止播放：
  
        停止一个人的视频：
        [[HDMediaModule sharedInstance] stopVideoPlayWithRoomId:_roomIdTextField.text userId:_userIdTextField.text];
        停止所有人的视频：
        [[HDMediaModule sharedInstance] stopVideoPlay];
 
 
举个例子：在roomid=123，userid=456录制视频，userid=789收看，那么调用[HDMediaModule startVideoPlayWithRoomId:@“123” userId:@“456” myUserId:@“789”];

注意：停止录制或结束播放后视图自动解绑，重新开始录制或播放需要重新绑定视图
  
  切换摄像头
  
     [[HDMediaModule sharedInstance] changeCameraPosition];
  
  开启/关闭闪光灯
  
     [[HDMediaModule sharedInstance] changeTorchStatus];
     
  获取录制者的音量
  
    [[HDMediaModule sharedInstance] getCurrentVolumesWithUserId:userId];   
     
 其他：
 
    
    1、开始自动播放某房间的所有流。
    声音流全播，播放所有绑定view的视频流。如果超过播放器可以播放的上限（上限是10个），则按数据到达的时间顺序播放。
    因为视频也有声音部分，有view的视频优先，会挤掉数据到达时间相对靠后的纯声音流。
    
     -(void)startAutoPlayRoom:(NSString *)roomId;
     
    2、停止自动播放某房间的所有流
    此操作并不影响已经在播放的流，只影响新到达的流
 
    -(void)stopAutoPlayRoom:(NSString *)roomId;
    
    3、返回当前所在房间信息
    房间信息包括：房间号，是否自动播放，当前流的数量和每个流的信息
    流的信息包括：用户名，是否是视频，是否正在播放，缓冲大小
    
    -(struct HDRoomStatus)getCurrentRoomStatus;

    4、设置监听函数，监听房间内信息变化
	roomStatusListener 监听的回调block，具体参数格式见类型说明
	比如：视频第一帧到达的通知就可以通过这个方法获取
	
	-(void)setRoomStatusListener:(HDRoomStatusListener) roomStatusListener;

## Requirements ##

 requires iOS 7.0 or OS X 10.7 and greater.

## Contact ##


## License ##

Copyright 2013 Hongdian, Inc.

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. [See the License](LICENSE.txt) for the specific language governing permissions and limitations under the License.
