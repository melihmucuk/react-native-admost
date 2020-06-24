//
//  AdmostInterstitial.h
//  Admost
//
//  Created by Melih Mucuk on 24.06.2020.
//  Copyright © 2020 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AMRSDK/AMRSDK.h>
#import <React/RCTBridgeModule.h>
#import <React/RCTViewManager.h>
#import <React/RCTEventEmitter.h>

NS_ASSUME_NONNULL_BEGIN

@interface AdmostInterstitial : RCTEventEmitter <RCTBridgeModule, AMRInterstitialDelegate>
@property(nonatomic, strong) AMRInterstitial *interstitial;
@property(nonatomic, strong) NSString *zoneID;
@end

NS_ASSUME_NONNULL_END
