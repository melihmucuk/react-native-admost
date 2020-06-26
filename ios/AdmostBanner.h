//
//  AdmostBanner.h
//  Admost
//
//  Created by Melih Mucuk on 25.06.2020.
//  Copyright © 2020 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <React/RCTViewManager.h>
#import "AdmostBannerView.h"

NS_ASSUME_NONNULL_BEGIN

@interface AdmostBanner : RCTViewManager
@property (nonatomic, strong) AdmostBannerView* bannerView;
@end

NS_ASSUME_NONNULL_END
