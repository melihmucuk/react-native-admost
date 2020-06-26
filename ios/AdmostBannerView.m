//
//  AdmostBannerView.m
//  Admost
//
//  Created by Melih Mucuk on 25.06.2020.
//  Copyright © 2020 Facebook. All rights reserved.
//

#import "AdmostBannerView.h"

@implementation AdmostBannerView

{
    AMRBanner  *_banner;
    NSString *_zoneID;
    CGFloat _width;
}

- (void)reactSetFrame:(CGRect)frame {
    [super reactSetFrame: frame];
}

- (void)setZoneID:(NSString *)zoneID {
    _zoneID = zoneID;
    _banner = [AMRBanner bannerForZoneId:_zoneID];
    _banner.delegate = self;
    [self loadAd];
}

- (void)setWidth:(CGFloat)width {
    _width = width;
    [self loadAd];
}

- (void)loadAd {
#ifndef __LP64__
  return; // prevent crash on 32bit
#endif
    _banner.bannerWidth = _width;
    [_banner loadBanner];
}


- (void)didReceiveBanner:(AMRBanner *)banner {
    NSLog(@"didReceiveBanner");
    [self addSubview:_banner.bannerView];
}

- (void)didFailToReceiveBanner:(AMRBanner *)banner error:(AMRError *)error {
    // TODO
    NSLog(@"didFailToReceiveBanner %@", error.errorDescription);
}

- (void)didClickBanner:(AMRBanner *)banner {
    // TODO
    NSLog(@"didClickBanner");
}

@end
