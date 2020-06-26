package com.reactnative.admost;
import android.util.Log;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import admost.sdk.AdMostInterstitial;
import admost.sdk.listener.AdMostAdListener;
import com.facebook.react.bridge.Promise;

public class AdmostRewarded extends ReactContextBaseJavaModule {

    private final ReactApplicationContext reactContext;
    private static final String TAG = "ADMOST";
    private String zoneID;
    private AdMostInterstitial rewarded;
    private Boolean autoShow = false;

    AdmostRewarded(ReactApplicationContext reactContext) {
        super(reactContext);
        this.reactContext = reactContext;
    }

    @Override
    public String getName() {
        return "AdmostRewarded";
    }

    @ReactMethod
    public void setAutoShow(Boolean autoShow) {
        this.autoShow = autoShow;
    }

    @ReactMethod
    public void initWithZoneID(String zoneID, Promise promise) {
        this.zoneID = zoneID;
        if(getCurrentActivity() == null){
            Log.e(TAG, "Current activity is null!");
            return;
        }
        Log.i(TAG, "Starting rewarded with " + this.zoneID);
        this.rewarded = new AdMostInterstitial(getCurrentActivity(), this.zoneID, new AdMostAdListener() {
            @Override
            public void onDismiss(String message) {
                AdmostModule.sendEvent("didDismissRewardedVideo", "");
            }
            @Override
            public void onFail(int errorCode) {
                AdmostModule.sendEvent("didFailToReceiveRewardedVideo", String.valueOf(errorCode));
            }
            @Override
            public void onReady(String network, int ecpm) {
                AdmostModule.sendEvent("didReceiveRewardedVideo", network);
            }
            @Override
            public void onShown(String network) {
                AdmostModule.sendEvent("didShowRewardedVideo", network);
            }
            @Override
            public void onClicked(String s) {
                AdmostModule.sendEvent("didClickRewardedVideo", s);
            }
            @Override
            public void onComplete(String s) {
                AdmostModule.sendEvent("didCompleteRewardedVideo", s);
            }
        });
        promise.resolve(true);
    }

    @ReactMethod
    public void loadAd(Promise promise) {
        this.rewarded.refreshAd(this.autoShow);
        promise.resolve(true);
    }

    @ReactMethod
    public void showAd(Promise promise) {
        this.rewarded.show();
        promise.resolve(null);
    }

    @ReactMethod
    public void destroyAd(Promise promise) {
        this.rewarded.destroy();
        promise.resolve(null);
    }

}
