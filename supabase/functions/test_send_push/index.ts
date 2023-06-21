// Follow this setup guide to integrate the Deno language server with your editor:
// https://deno.land/manual/getting_started/setup_your_environment
// This enables autocomplete, go to definition, etc.

import { serve } from "https://deno.land/std@0.168.0/http/server.ts";
import * as OneSignal from "https://esm.sh/@onesignal/node-onesignal@2.0.0-beta1";
import {
  _OnesignalAppId_,
  _OnesignalRestApiKey_,
  onesignal,
} from "../_utils/config.ts";

serve(async (req) => {
  try {
    const { player_ids, message } = await req.json();

    const notification = new OneSignal.Notification();
    notification.app_id = _OnesignalAppId_;
    notification.include_player_ids = player_ids;
    notification.contents = { en: message };

    const res = await onesignal.createNotification(notification);
    if (res.errors) {
      return new Response("Error sending push notifications", { status: 500 });
    }
    return new Response("sent", { status: 200 });
  } catch (error) {
    return new Response(error.message, { status: 500 });
  }
});

// To invoke:
// curl -i --location --request POST 'http://localhost:54321/functions/v1/' \
//   --header 'Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZS1kZW1vIiwicm9sZSI6ImFub24iLCJleHAiOjE5ODM4MTI5OTZ9.CRXP1A7WOeoJeXxjNni43kdQwgnWNReilDMblYTn_I0' \
//   --header 'Content-Type: application/json' \
//   --data '{"name":"Functions"}'
