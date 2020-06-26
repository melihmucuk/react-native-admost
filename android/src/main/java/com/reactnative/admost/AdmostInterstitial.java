package com.reactnative.admost;
import android.util.Log;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import admost.sdk.AdMostInterstitial;
import admost.sdk.listener.AdMostAdListener;
import com.facebook.react.bridge.Promise;

public class AdmostInterstitial extends ReactContextBaseJavaModule {

    private final ReactApplicationContext reactContext;
    private static final String TAG = "ADMOST";
    private String zoneID;
    private AdMostInterstitial interstitial;
    private Boolean autoShow = false;

    AdmostInterstitial(ReactApplicationContext reactContext) {
        super(reactContext);
        this.reactContext = reactContext;
    }

    @Override
    public String getName() {
        return "AdmostInterstitial";
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
        Log.i(TAG, "Starting interstitial with " + this.zoneID);
        this.interstitial = new AdMostInterstitial(getCurrentActivity(), this.zoneID, new AdMostAdListener() {
            @Override
            public void onDismiss(String message) {
                AdmostModule.sendEvent("didDismissInterstitial", "");
            }
            @Override
            public void onFail(int errorCode) {
                AdmostModule.sendEvent("didFailToReceiveInterstitial", String.valueOf(errorCode));
            }
            @Override
            public void onReady(String network, int ecpm) {
                AdmostModule.sendEvent("didReceiveInterstitial", network);
            }
            @Override
            public void onShown(String network) {
                AdmostModule.sendEvent("didShowInterstitial", network);
            }
            @Override
            public void onClicked(String s) {
                AdmostModule.sendEvent("didClickInterstitial", s);
            }
            @Override
            public void onComplete(String s) {
                // If you are using interstitial, this callback will not be triggered.
            }
        });
        promise.resolve(true);
    }

    @ReactMethod
    public void loadAd(Promise promise) {
        this.interstitial.refreshAd(this.autoShow);
        promise.resolve(true);
    }

    @ReactMethod
    public void showAd(Promise promise) {
        this.interstitial.show();
        promise.resolve(null);
    }

    @ReactMethod
    public void destroyAd(Promise promise) {
        this.interstitial.destroy();
        promise.resolve(null);
    }

}
