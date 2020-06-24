#import <Foundation/Foundation.h>
#import <React/RCTBridgeModule.h>
#import <AMRSDK/AMRSDK.h>

@interface Admost : NSObject <RCTBridgeModule>
@property(nonatomic, strong) NSString *appID;
@property(nonatomic, assign) BOOL *userConsents;
@property(nonatomic, assign) BOOL *subjectToGDPR;
@property(nonatomic, assign) BOOL *userChild;
@end
