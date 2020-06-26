#import "Admost.h"

@implementation Admost

{
    NSString *_appID;
    BOOL *_userConsents;
    BOOL *_subjectToGDPR;
    BOOL *_userChild;
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

RCT_EXPORT_METHOD(start:(RCTPromiseResolveBlock)resolve
                  reject:(RCTPromiseRejectBlock)reject)
{
    [AMRSDK startWithAppId:_appID];
    resolve(@YES);
}

RCT_EXPORT_METHOD(setAppID:(NSString *)appID)
{
    _appID = appID;
}

RCT_EXPORT_METHOD(setUserConsents:(BOOL *)userConsents)
{
    _userConsents = userConsents;
    [AMRSDK setUserConsent:userConsents];
}

RCT_EXPORT_METHOD(setSubjectToGDPR:(BOOL *)subjectToGDPR)
{
    _subjectToGDPR = subjectToGDPR;
    [AMRSDK subjectToGDPR:subjectToGDPR];
}

RCT_EXPORT_METHOD(setUserChild:(BOOL *)userChild)
{
    _userChild = userChild;
    [AMRSDK setUserChild:userChild];
}

RCT_EXPORT_METHOD(trackPurchase:(NSString *)transactionId currency:(NSString *)currencyCode price:(CGFloat)price)
{
    [AMRSDK trackPurchase:transactionId currencyCode:currencyCode amount:price];
}

RCT_EXPORT_METHOD(setUserId:(NSString *)userId)
{
    [AMRSDK setUserId:userId];
}

@end
