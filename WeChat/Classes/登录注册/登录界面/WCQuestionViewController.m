//
//  WCQuestionViewController.m
//  WeChat
//
//  Created by test on 2018/8/17.
//  Copyright © 2018年 SkyFly. All rights reserved.
//

#import "WCQuestionViewController.h"
#import <Speech/Speech.h>
#import <AVFoundation/AVFoundation.h>
#import <Masonry.h>
@interface WCQuestionViewController ()<SFSpeechRecognizerDelegate>
@property (nonatomic,strong) SFSpeechRecognizer *speechRecognizer;
@property (nonatomic,strong) AVAudioEngine *audioEngine;
@property (nonatomic,strong) SFSpeechRecognitionTask *recognitionTask;
@property (nonatomic,strong) SFSpeechAudioBufferRecognitionRequest *recognitionRequest;
@property(nonatomic, strong)UILabel *textLabel;
@property(nonatomic, strong)UIButton *voiceButton;
@end

@implementation WCQuestionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _voiceButton.enabled = NO;
    self.title = @"问题反馈";
    //更改返回按钮的样式和返回方法
    [self creatRightBackButton];
    [self creatBaseView];
    // Do any additional setup after loading the view.
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    __weak typeof(self) weakSelf = self;
    [SFSpeechRecognizer  requestAuthorization:^(SFSpeechRecognizerAuthorizationStatus status) {
        dispatch_async(dispatch_get_main_queue(), ^{
            switch (status) {
                case SFSpeechRecognizerAuthorizationStatusNotDetermined:
                    weakSelf.voiceButton.enabled = NO;
                    [weakSelf.voiceButton setTitle:@"语音识别未授权" forState:UIControlStateDisabled];
                    break;
                case SFSpeechRecognizerAuthorizationStatusDenied:
                    weakSelf.voiceButton.enabled = NO;
                    [weakSelf.voiceButton setTitle:@"用户未授权使用语音识别" forState:UIControlStateDisabled];
                    break;
                case SFSpeechRecognizerAuthorizationStatusRestricted:
                    weakSelf.voiceButton.enabled = NO;
                    [weakSelf.voiceButton setTitle:@"语音识别在这台设备上受到限制" forState:UIControlStateDisabled];
                    
                    break;
                case SFSpeechRecognizerAuthorizationStatusAuthorized:
                    weakSelf.voiceButton.enabled = YES;
                    [weakSelf.voiceButton setTitle:@"开始录音" forState:UIControlStateNormal];
                    break;
                    
                default:
                    break;
            }
            
        });
    }];
}



#pragma mark - property
- (AVAudioEngine *)audioEngine{
    if (!_audioEngine) {
        _audioEngine = [[AVAudioEngine alloc] init];
    }
    return _audioEngine;
}
- (SFSpeechRecognizer *)speechRecognizer{
    if (!_speechRecognizer) {
        //腰围语音识别对象设置语言，这里设置的是中文
        NSLocale *local =[[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
        
        _speechRecognizer =[[SFSpeechRecognizer alloc] initWithLocale:local];
        _speechRecognizer.delegate = self;
    }
    return _speechRecognizer;
}
#pragma mark --SFSpeechRecognizerDelegate
-(void)speechRecognizer:(SFSpeechRecognizer *)speechRecognizer availabilityDidChange:(BOOL)available
{
    if (available) {
        self.voiceButton.enabled = YES;
        [self.voiceButton setTitle:@"开始录音" forState:UIControlStateNormal];
    }
    else{
        self.voiceButton.enabled = NO;
        [self.voiceButton setTitle:@"语音识别不可用" forState:UIControlStateDisabled];
    }
}




-(void)creatBaseView{
    
    self.voiceButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [self.voiceButton setTitle:@"开始录音" forState:UIControlStateNormal];
    
    [self.voiceButton setBackgroundColor:[UIColor grayColor]];
    
    [self.voiceButton addTarget:self action:@selector(voiceButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.voiceButton];
    
    UIButton *recognizeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [recognizeButton setTitle:@"声音识别" forState:UIControlStateNormal];
    
    [recognizeButton setBackgroundColor:[UIColor grayColor]];
    
    [recognizeButton addTarget:self action:@selector(recognizeButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:recognizeButton];

    self.textLabel = [[UILabel alloc]init];
    
    self.textLabel.backgroundColor = [UIColor lightGrayColor];
    
    [self.view addSubview:self.textLabel];
    
    [self.voiceButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view).offset(-40);
        make.height.mas_equalTo(30);
        make.left.equalTo(self.view).offset(30);
        make.right.equalTo(self.view).offset(-40);
    }];
    
    [recognizeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.voiceButton.mas_top).offset(-10);
        make.height.equalTo(self.voiceButton);
        make.width.equalTo(self.voiceButton);
        make.centerX.equalTo(self.voiceButton);
    }];
    
    
    [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(120);
        make.width.equalTo(self.voiceButton);
        make.height.mas_equalTo(40);
        make.centerX.equalTo(self.voiceButton);
    }];
}
#pragma mark 开始录音按钮
-(void)voiceButtonAction:(UIButton *)sender{
    if (self.audioEngine.isRunning) {
        [self endRecording];
        [self.voiceButton setTitle:@"正在停止" forState:UIControlStateDisabled];
        
    }
    else{
        [self startRecording];
        [self.voiceButton setTitle:@"停止录音" forState:UIControlStateNormal];
        
    }
}
#pragma mark 对录音的文件进行识别
-(void)recognizeButtonAction:(UIButton *)sender{
    NSLocale *local =[[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    SFSpeechRecognizer *localRecognizer =[[SFSpeechRecognizer alloc] initWithLocale:local];
    NSURL *url =[[NSBundle mainBundle] URLForResource:@"录音.m4a" withExtension:nil];
    if (!url) return;
    SFSpeechURLRecognitionRequest *res =[[SFSpeechURLRecognitionRequest alloc] initWithURL:url];
    __weak typeof(self) weakSelf = self;
    [localRecognizer recognitionTaskWithRequest:res resultHandler:^(SFSpeechRecognitionResult * _Nullable result, NSError * _Nullable error) {
        if (error) {
            NSLog(@"语音识别解析失败,%@",error);
        }
        else
        {
            weakSelf.textLabel.text = result.bestTranscription.formattedString;
        }
    }];
}

-(void)startRecording{
    if (_recognitionTask) {
        [_recognitionTask cancel];
        _recognitionTask = nil;
    }
    
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    NSError *error;
    [audioSession setCategory:AVAudioSessionCategoryRecord error:&error];
    NSParameterAssert(!error);
    [audioSession setMode:AVAudioSessionModeMeasurement error:&error];
    NSParameterAssert(!error);
    [audioSession setActive:YES withOptions:AVAudioSessionSetActiveOptionNotifyOthersOnDeactivation error:&error];
    NSParameterAssert(!error);
    
    _recognitionRequest = [[SFSpeechAudioBufferRecognitionRequest alloc] init];
    AVAudioInputNode *inputNode = self.audioEngine.inputNode;
    NSAssert(inputNode, @"录入设备没有准备好");
    NSAssert(_recognitionRequest, @"请求初始化失败");
    _recognitionRequest.shouldReportPartialResults = YES;
    __weak typeof(self) weakSelf = self;
    _recognitionTask = [self.speechRecognizer recognitionTaskWithRequest:_recognitionRequest resultHandler:^(SFSpeechRecognitionResult * _Nullable result, NSError * _Nullable error) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        BOOL isFinal = NO;
        if (result) {
            strongSelf.textLabel.text = result.bestTranscription.formattedString;
            isFinal = result.isFinal;
        }
        if (error || isFinal) {
            [self.audioEngine stop];
            [inputNode removeTapOnBus:0];
            strongSelf.recognitionTask = nil;
            strongSelf.recognitionRequest = nil;
            strongSelf.voiceButton.enabled = YES;
            [strongSelf.voiceButton setTitle:@"开始录音" forState:UIControlStateNormal];
        }
        
    }];
    
    AVAudioFormat *recordingFormat = [inputNode outputFormatForBus:0];
    //在添加tap之前先移除上一个  不然有可能报"Terminating app due to uncaught exception 'com.apple.coreaudio.avfaudio',"之类的错误
    [inputNode removeTapOnBus:0];
    [inputNode installTapOnBus:0 bufferSize:1024 format:recordingFormat block:^(AVAudioPCMBuffer * _Nonnull buffer, AVAudioTime * _Nonnull when) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if (strongSelf.recognitionRequest) {
            [strongSelf.recognitionRequest appendAudioPCMBuffer:buffer];
        }
    }];
    
    [self.audioEngine prepare];
    [self.audioEngine startAndReturnError:&error];
    NSParameterAssert(!error);
    self.textLabel.text = @"";
}

-(void)endRecording{
    [self.audioEngine stop];
    if (_recognitionRequest) {
        [_recognitionRequest endAudio];
    }
    
    if (_recognitionTask) {
        [_recognitionTask cancel];
        _recognitionTask = nil;
    }
    self.voiceButton.enabled = NO;

}

-(void)creatRightBackButton{
    
    //创建导航栏的左侧按钮
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 10, 34, 16)];
    [button setImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
    button.titleLabel.adjustsFontSizeToFitWidth = YES;
    [button setImageEdgeInsets:UIEdgeInsetsMake(0, -10, 0, 0)];
    [button addTarget:self action:@selector(backForword) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = backButton;
}

-(void)backForword{
    [self.navigationController popViewControllerAnimated:YES];
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
