//
//  AdmostBannerView.h
//  Admost
//
//  Created by Melih Mucuk on 25.06.2020.
//  Copyright © 2020 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AMRSDK/AMRSDK.h>
#import <UIKit/UIKit.h>
#import "UIView+React.h"

NS_ASSUME_NONNULL_BEGIN

@interface AdmostBannerView : UIView
@property (nonatomic, strong) AMRBanner *banner;
@property(nonatomic, copy) NSString *zoneID;
@property CGFloat width;

- (void)loadAd;
@end

NS_ASSUME_NONNULL_END
