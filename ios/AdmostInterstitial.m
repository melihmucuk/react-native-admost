//
//  AdmostInterstitial.m
//  Admost
//
//  Created by Melih Mucuk on 24.06.2020.
//  Copyright © 2020 Facebook. All rights reserved.
//

#import "AdmostInterstitial.h"

@implementation AdmostInterstitial

{
    AMRInterstitial  *_interstitial;
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
             @"didFailToReceiveInterstitial",
             @"didReceiveInterstitial",
             @"didShowInterstitial",
             @"didFailToShowInterstitial",
             @"didClickInterstitial",
             @"didDismissInterstitial"
    ];
}

RCT_EXPORT_METHOD(initWithZoneID:(NSString *)zoneID resolver:(RCTPromiseResolveBlock)resolve
rejecter:(RCTPromiseRejectBlock)reject)
{
    _zoneID = zoneID;
    _interstitial = [AMRInterstitial interstitialForZoneId:zoneID];
    _interstitial.delegate = self;
    resolve(@YES);
}

RCT_EXPORT_METHOD(loadAd:(RCTPromiseResolveBlock)resolve
rejecter:(RCTPromiseRejectBlock)reject)
{
  [_interstitial loadInterstitial];
  resolve(@YES);
}

RCT_EXPORT_METHOD(showAd:(RCTPromiseResolveBlock)resolve
rejecter:(RCTPromiseRejectBlock)reject){
  [_interstitial showFromViewController:[UIApplication sharedApplication].delegate.window.rootViewController];
  resolve(nil);
}

- (void)didFailToReceiveInterstitial:(AMRInterstitial *)interstitial error:(AMRError *)error {
  NSLog(@"didFailToReceiveInterstitial %@", error.errorDescription);
  [self sendEventWithName:@"didFailToReceiveInterstitial" body:error.errorDescription];
}

- (void)didReceiveInterstitial:(AMRInterstitial *)interstitial {
  [self sendEventWithName:@"didReceiveInterstitial" body:nil];
}

- (void)didShowInterstitial:(AMRInterstitial *)interstitial {
  [self sendEventWithName:@"didShowInterstitial" body:nil];
}

- (void)didFailToShowInterstitial:(AMRInterstitial *)interstitial error:(AMRError *)error {
  NSLog(@"didFailToShowInterstitial %@", error.errorDescription);
  [self sendEventWithName:@"didFailToShowInterstitial" body:error.errorDescription];
}

- (void)didClickInterstitial:(AMRInterstitial *)interstitial {
  [self sendEventWithName:@"didClickInterstitial" body:nil];
}

- (void)didDismissInterstitial:(AMRInterstitial *)interstitial {
  [self sendEventWithName:@"didDismissInterstitial" body:nil];
}

@end
