//
//  AdmostRewarded.m
//  Admost
//
//  Created by Melih Mucuk on 24.06.2020.
//  Copyright © 2020 Facebook. All rights reserved.
//

#import "AdmostRewarded.h"

@implementation AdmostRewarded

{
    AMRRewardedVideo  *_rewardedVideo;
    NSString *_zoneID;
}

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}

+ (BOOL)requiresMainQueueSetup
{
    return NO;
}

RCT_EXPORT_MODULE()

- (NSArray<NSString *> *)supportedEvents
{
    return @[
             @"didFailToReceiveRewardedVideo",
             @"didReceiveRewardedVideo",
             @"didShowRewardedVideo",
             @"didFailToShowRewardedVideo",
             @"didClickRewardedVideo",
             @"didCompleteRewardedVideo",
             @"didDismissRewardedVideo"
    ];
}

RCT_EXPORT_METHOD(initWithZoneID:(NSString *)zoneID resolver:(RCTPromiseResolveBlock)resolve
rejecter:(RCTPromiseRejectBlock)reject)
{
    _zoneID = zoneID;
    _rewardedVideo = [AMRRewardedVideo rewardedVideoForZoneId:zoneID];
    _rewardedVideo.delegate = self;
    resolve(@YES);
}

RCT_EXPORT_METHOD(loadAd:(RCTPromiseResolveBlock)resolve
rejecter:(RCTPromiseRejectBlock)reject)
{
  [_rewardedVideo loadRewardedVideo];
  resolve(@YES);
}

RCT_EXPORT_METHOD(showAd:(RCTPromiseResolveBlock)resolve
rejecter:(RCTPromiseRejectBlock)reject){
  [_rewardedVideo showFromViewController:[UIApplication sharedApplication].delegate.window.rootViewController];
  resolve(nil);
}

- (void)didFailToReceiveRewardedVideo:(AMRRewardedVideo *)rewardedVideo error:(AMRError *)error {
    NSLog(@"didFailToReceiveRewardedVideo %@", error.errorDescription);
    [self sendEventWithName:@"didFailToReceiveRewardedVideo" body:error.errorDescription];
}

- (void)didReceiveRewardedVideo:(AMRRewardedVideo *)rewardedVideo {
    [self sendEventWithName:@"didReceiveRewardedVideo" body:nil];
}

- (void)didShowRewardedVideo:(AMRRewardedVideo *)rewardedVideo {
    [self sendEventWithName:@"didShowRewardedVideo" body:nil];
}

- (void)didFailToShowRewardedVideo:(AMRRewardedVideo *)rewardedVideo error:(AMRError *)error {
    NSLog(@"didFailToShowRewardedVideo %@", error.errorDescription);
    [self sendEventWithName:@"didFailToShowRewardedVideo" body:error.errorDescription];
}

- (void)didClickRewardedVideo:(AMRRewardedVideo *)rewardedVideo {
    [self sendEventWithName:@"didClickRewardedVideo" body:nil];
}

- (void)didCompleteRewardedVideo:(AMRRewardedVideo *)rewardedVideo {
    [self sendEventWithName:@"didCompleteRewardedVideo" body:nil];
}

- (void)didDismissRewardedVideo:(AMRRewardedVideo *)rewardedVideo {
    [self sendEventWithName:@"didDismissRewardedVideo" body:nil];
}

@end
