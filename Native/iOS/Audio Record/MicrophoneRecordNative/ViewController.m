//
//  ViewController.m
//  MicrophoneRecordNative
//
//  Created by Matteo Ciman on 23/06/14.
//  Copyright (c) 2014 Matteo Ciman. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    AVAudioRecorder *recorder;
    AVAudioPlayer *player;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSArray *pathComponents = [NSArray arrayWithObjects:[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject], @"MyAudioDemo.m4a", nil];
    
    NSURL *outputFileURL = [NSURL fileURLWithPathComponents:pathComponents];
    
    AVAudioSession *session = [AVAudioSession sharedInstance];
    [session setCategory:AVAudioSessionCategoryPlayAndRecord error:nil];
    
    NSMutableDictionary *recordSettings = [[NSMutableDictionary alloc] init];
    
    [recordSettings setValue:[NSNumber numberWithInt:kAudioFormatMPEG4AAC] forKey:AVFormatIDKey];
    [recordSettings setValue:[NSNumber numberWithFloat:44100.0] forKey:AVSampleRateKey];
    [recordSettings setValue:[NSNumber numberWithInt: 2] forKey:AVNumberOfChannelsKey];
    
    NSError *error;
    recorder = [[AVAudioRecorder alloc] initWithURL:outputFileURL settings:recordSettings error:&error];
    if (error != nil) {
        NSLog(@"Error: %@", error);
    }
    
    recorder.delegate = self;
    recorder.meteringEnabled = YES;
    [recorder prepareToRecord];
    
    [self.view setBackgroundColor:[UIColor blackColor]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startRecord:(id)sender
{
    if (!recorder.recording)
    {
        AVAudioSession *session = [AVAudioSession sharedInstance];
        NSError *error = nil;
        [session setActive: YES error:&error];
        
        if (error != nil) {
            NSLog(@"Error in startRecord: %@", error);
        }
        [recorder record];
    }
}
@end
