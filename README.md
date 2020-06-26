# react-native-admost

## WARNING

**This package is in under heavy development. Use at own risk!**

## Getting started

`$ npm install react-native-admost --save`

### iOS

1. You should install required pods, please follow on [Admost documentation](https://admost.github.io/amrios/#installation-with-cocoapods).
2. Complete XCode setup, please follow on [Admost documentation](https://admost.github.io/amrios/#xcode-setup).
3. Then simply run pod install;

   `$ cd ios && pod install && cd ..`

### Android

You should install Ad Networks and complete required steps [Admost documentation](https://admost.github.io/amrandroid/).

## Usage

Here are test ids provided by Admost:

```markup
For iOS:
  Application Id: @"15066ddc-9c18-492c-8185-bea7e4c7f88c"
  Banner Zone Id: @"b4009772-de04-42c4-bbaa-c18da9e4a1ab"
  Interstitial Zone Id: @"39f74377-5682-436a-9338-9d1c4df410bd"
  RewardedVideo Zone Id: @"2bdefd44-5269-4cbc-b93a-373b74a2f067"
  Offerwall Zone Id: @"1cadca08-33f9-4da7-969e-ef116d4e7d0e"

For Android:
  Application Id = "6cc8e89a-b52a-4e9a-bb8c-579f7ec538fe";
  Banner Zone Id = "86644357-21d0-45a4-906a-37262461df65";
  Interstitial Zone Id = "f99e409b-f9ab-4a2e-aa9a-4d143e6809ae";
  RewardedVideo Zone Id = "88cfcfd0-2f8c-4aba-9f36-cc0ac99ab140";
  Offerwall Zone Id = "fa1072e4-afcf-49b6-a919-1ab1ab1b0aa9";
```

### Initializing

```javascript
import Admost from "react-native-admost";
//
//
Admost.setAppID("Your Application ID");
Admost.setUserConsents(true);
Admost.setSubjectToGDPR(false);
Admost.setUserChild(false);
Admost.start();
```

### Interstitial

```javascript
import {
  AdmostInterstitial,
  AIEventEmitter,
  AIEvents,
} from "react-native-admost";
//
//
componentDidMount = async () => {
  await AdmostInterstitial.initWithZoneID(
    "39f74377-5682-436a-9338-9d1c4df410bd"
  );
  await AdmostInterstitial.loadAd();
  this.subscribeEvents();
};

subscribeEvents = () => {
  AIEventEmitter.addListener(AIEvents.DID_FAIL_TO_RECEIVE, async () => {
    console.log("ad did fail to receive");
  });
  AIEventEmitter.addListener(AIEvents.DID_RECEIVE, async () => {
    console.log("ad did receive");
    await AdmostInterstitial.showAd();
  });
  AIEventEmitter.addListener(AIEvents.DID_SHOW, async () => {
    console.log("ad did show");
  });
};
```

**Interstitial Events**

```javascript
const AIEvents = {
  DID_RECEIVE: "didReceiveInterstitial",
  DID_FAIL_TO_RECEIVE: "didFailToReceiveInterstitial",
  DID_SHOW: "didShowInterstitial",
  DID_FAIL_TO_SHOW: "didFailToShowInterstitial",
  DID_CLICK: "didClickInterstitial",
  DID_DISMISS: "didDismissInterstitial",
};
```

### Rewarded Video

```javascript
import { AdmostRewarded, AREvents, AREventEmitter } from "react-native-admost";
//
//
componentDidMount = async () => {
  await AdmostRewarded.initWithZoneID("2bdefd44-5269-4cbc-b93a-373b74a2f067");
  await AdmostRewarded.loadAd();
  this.subscribeEvents();
};

subscribeEvents = () => {
  AREventEmitter.addListener(AREvents.DID_FAIL_TO_RECEIVE, async () => {
    console.log("ad did fail to receive");
  });
  AREventEmitter.addListener(AREvents.DID_RECEIVE, async () => {
    console.log("ad did receive");
    await AdmostRewarded.showAd();
  });
  AREventEmitter.addListener(AREvents.DID_SHOW, async () => {
    console.log("ad did show");
  });
  AREventEmitter.addListener(AREvents.DID_COMPLETE, async () => {
    console.log("ad did complete");
  });
};
```

**Rewarded Video Events**

```javascript
const AREvents = {
  DID_RECEIVE: "didReceiveRewardedVideo",
  DID_FAIL_TO_RECEIVE: "didFailToReceiveRewardedVideo",
  DID_SHOW: "didShowRewardedVideo",
  DID_FAIL_TO_SHOW: "didFailToShowRewardedVideo",
  DID_CLICK: "didClickRewardedVideo",
  DID_DISMISS: "didDismissRewardedVideo",
  DID_COMPLETE: "didCompleteRewardedVideo",
};
```

### Banner

```javascript
import Admost, {
  AdmostBanner,
} from 'react-native-admost';
//
//
render() {
    return (
      <View style={styles.container}>
        <Text style={styles.welcome}>☆Admost example☆</Text>
          <AdmostBanner
            zoneID={'b4009772-de04-42c4-bbaa-c18da9e4a1ab'}
            width={320}
          />
      </View>
    );
  }
```

## Extras

**In App Purchase Tracking**

```javascript
import Admost from "react-native-admost";
//
//
Admost.trackPurchase("transactionId", "currency", "price as float");
```

**Setting Application User Id**

```javascript
import Admost from "react-native-admost";
//
//
Admost.setUserId("applicationUserID");
```
