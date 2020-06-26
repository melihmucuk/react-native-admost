//
//  AdmostBanner.m
//  Admost
//
//  Created by Melih Mucuk on 25.06.2020.
//  Copyright © 2020 Facebook. All rights reserved.
//

#import "AdmostBanner.h"

@implementation AdmostBanner

{
    AdmostBannerView *_bannerView;
}

RCT_EXPORT_MODULE()
RCT_EXPORT_VIEW_PROPERTY(zoneID, NSString);
RCT_EXPORT_VIEW_PROPERTY(width, CGFloat);

@synthesize bridge = _bridge;

- (UIView *)view {
  _bannerView = [AdmostBannerView new];
  return _bannerView;
}

- (dispatch_queue_t)methodQueue {
  return dispatch_get_main_queue();
}

@end
