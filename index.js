import {
  NativeModules,
  NativeEventEmitter,
  requireNativeComponent,
  Platform,
} from "react-native";

const { Admost, AdmostInterstitial, AdmostRewarded } = NativeModules;
const AIEvents = {
  DID_RECEIVE: "didReceiveInterstitial",
  DID_FAIL_TO_RECEIVE: "didFailToReceiveInterstitial",
  DID_SHOW: "didShowInterstitial",
  DID_FAIL_TO_SHOW: "didFailToShowInterstitial",
  DID_CLICK: "didClickInterstitial",
  DID_DISMISS: "didDismissInterstitial",
};
const AREvents = {
  DID_RECEIVE: "didReceiveRewardedVideo",
  DID_FAIL_TO_RECEIVE: "didFailToReceiveRewardedVideo",
  DID_SHOW: "didShowRewardedVideo",
  DID_FAIL_TO_SHOW: "didFailToShowRewardedVideo",
  DID_CLICK: "didClickRewardedVideo",
  DID_DISMISS: "didDismissRewardedVideo",
  DID_COMPLETE: "didCompleteRewardedVideo",
};

const AIEventEmitter = new NativeEventEmitter(AdmostInterstitial);
const AREventEmitter = new NativeEventEmitter(AdmostRewarded);
const AdmostBanner =
  Platform.OS === "ios" ? requireNativeComponent("AdmostBanner") : null;

export {
  AdmostInterstitial,
  AdmostRewarded,
  AIEvents,
  AIEventEmitter,
  AREvents,
  AREventEmitter,
  AdmostBanner,
};
export default Admost;
