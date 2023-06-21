import * as OneSignal from "https://esm.sh/@onesignal/node-onesignal@2.0.0-beta1";

// OneSignal
export const _OnesignalAppId_ = Deno.env.get("ONESIGNAL_APP_ID")!;
const _OnesignalUserAuthKey_ = Deno.env.get("USER_AUTH_KEY")!;
export const _OnesignalRestApiKey_ = Deno.env.get("ONESIGNAL_REST_API_KEY")!;
console.log(_OnesignalAppId_);
const configuration = OneSignal.createConfiguration({
  userKey: _OnesignalUserAuthKey_,
  appKey: _OnesignalAppId_,
});
export const onesignal = new OneSignal.DefaultApi(configuration);
