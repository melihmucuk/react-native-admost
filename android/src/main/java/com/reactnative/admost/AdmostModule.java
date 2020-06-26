package com.reactnative.admost;

import android.util.Log;

import com.facebook.react.bridge.NativeModule;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.modules.core.DeviceEventManagerModule;

import admost.sdk.base.AdMostConfiguration;
import admost.sdk.base.AdMost;
import admost.sdk.listener.AdMostInitListener;

public class AdmostModule extends ReactContextBaseJavaModule {

    private static ReactApplicationContext reactContext;
    private static final String TAG = "ADMOST";
    private String appID;
    private Boolean userContents;
    private Boolean subjectToGDPR;
    private Boolean userChild;
    private String appUserID;
    private AdMostConfiguration.Builder admostConfiguration;

    AdmostModule(ReactApplicationContext reactContext) {
        super(reactContext);
        this.reactContext = reactContext;
    }

    @Override
    public String getName() {
        return "Admost";
    }

    @ReactMethod
    public void start() {
        if(getCurrentActivity() == null){
            Log.e(TAG, "Current activity is null!");
            return;
        }
        Log.i(TAG, this.appID);
        this.admostConfiguration = new AdMostConfiguration.Builder(getCurrentActivity(), this.appID);
        AdMost.getInstance().init(this.admostConfiguration.build(), new AdMostInitListener() {
            @Override
            public void onInitCompleted() {
                Log.i(TAG, "Admost init completed.");
            }

            @Override
            public void onInitFailed(int err) {
                Log.e(TAG, "Admost init failed!");
            }
        });
    }

    @ReactMethod
    public void setAppID(String appID) {
        this.appID = appID;
        this.admostConfiguration = new AdMostConfiguration.Builder(getCurrentActivity(), appID);
    }

    @ReactMethod
    public void setUserConsents(Boolean userConsents) {
        this.userContents = userConsents;
        this.admostConfiguration.setUserConsent(userConsents);
    }

    @ReactMethod
    public void setSubjectToGDPR(Boolean subjectToGDPR) {
        this.subjectToGDPR = subjectToGDPR;
        this.admostConfiguration.setSubjectToGDPR(subjectToGDPR);
    }

    @ReactMethod
    public void setUserChild(Boolean userChild) {
        this.userChild = userChild;
        this.admostConfiguration.setUserChild(userChild);
    }

    @ReactMethod
    public void setUserId(String userId) {
        this.appUserID = userId;
        AdMost.getInstance().setUserId(userId);
    }

    public static void sendEvent(String eventName, String eventValue) {
        reactContext.getJSModule(DeviceEventManagerModule.RCTDeviceEventEmitter.class).emit(eventName, eventValue);
    }
}
