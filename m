Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E98FC433F5
	for <linux-doc@archiver.kernel.org>; Fri, 18 Feb 2022 08:51:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232871AbiBRIvU (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 18 Feb 2022 03:51:20 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:49510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232891AbiBRIvT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 18 Feb 2022 03:51:19 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA2B72B3561;
        Fri, 18 Feb 2022 00:51:02 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id b9so4049056lfv.7;
        Fri, 18 Feb 2022 00:51:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LJbcx9GXIvfUI5KCKq9WXupm8Tu9jHJ0DXAeVQ2MYcc=;
        b=CxzY9cQZiRm93BVfJ6cYpt/3KFCfBO/HuZbvUmgBMiudgx564JcyEGyYDqu3wirp8t
         j1gkXUm8ao9iPN9KOFZfFu+tWFv+1n7PiZY6rFs/SRv2V77FinyI/YaoF+O0v56FUxFL
         Blwj+T74oU4zHIJ+FsvyB4lKKVjwZmQ+gcVHn9bcdpmyqYkHIvrNWjB24TLiJawcdeo+
         CCQIR7XsgE+wRZSs4m7JpuVFxiDKre+QfQiJqd+IOXkaVJ58APXdD4N4CZcvyndi5eEG
         82bdNDJE31mJMQJObzJDAH7QW1jBgFPfFYtYYq5KNcDQSi25r4Y4BEwmyt6M7tbUenod
         hBpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LJbcx9GXIvfUI5KCKq9WXupm8Tu9jHJ0DXAeVQ2MYcc=;
        b=uzG8OpA83ivjIjmB8FGsgzDbvEg3C5M99ienmniB9b6rhiB0Xhzw5EEc2r5Rof9XwD
         kJan4DueAKm43ZhM8QWFGAEasb01b3sr8O0NWagBYmVJfd9s5g60U6FRweX6oY6+M4c1
         hlx5RQeG7PvwWydt39+G6n7gbhy5X/KFa9xCFIeOT3SbGEru2Ursui1wg9WBZhNQwxw3
         3IpUyP301chN5NHaiDkoLmd4MJoW0WNbsYKoj6iS2cLYnvxFP6B7KqLEttcmA3UM6kWN
         aGMfXE1iWJvEOv2wszvirm7bn2c/eZiRjmMj8frL8vt7IYJt+fwIPk11Fg9QNPJ3B4ks
         0Qqw==
X-Gm-Message-State: AOAM531vaioix9dwpCu1gmQ0OwI715mjgMOv3Jx3k0cMJeOkrswtD65y
        ckutVkO07cYkdpjbaPVH9NQrGstsXn49wA==
X-Google-Smtp-Source: ABdhPJwsebRm3K0U4uismNXUSiisn+3J1R8bP6dqHjUmdFCsYavzx4E6Vq3NRIh984klMfD3GhXEwg==
X-Received: by 2002:a05:6512:b25:b0:43a:9b8c:b360 with SMTP id w37-20020a0565120b2500b0043a9b8cb360mr4771157lfu.261.1645174260728;
        Fri, 18 Feb 2022 00:51:00 -0800 (PST)
Received: from WBEC678.wbe.local (xt27d8.stansat.pl. [83.243.39.216])
        by smtp.gmail.com with ESMTPSA id j21sm214606lja.44.2022.02.18.00.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 00:51:00 -0800 (PST)
From:   Pawel Dembicki <paweldembicki@gmail.com>
To:     devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>,
        Pawel Dembicki <paweldembicki@gmail.com>
Subject: [PATCH] leds: add new functions for mobile routers
Date:   Fri, 18 Feb 2022 09:50:02 +0100
Message-Id: <20220218085002.18110-1-paweldembicki@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

2G/2G/4G routers have some special leds functions:
  - signal strength, which shows info about signal status.
    Some devices have multicolor indication (e.g. D-Link DWR-960)
    other use multiple leds for different levels (e.g. Cell-C RTL30VW)
  - connection status, which shows if connection is active. Some devices
    have multiple leds for different bands (e.g. D-Link DWR-960).
  - sms indicator

This patch adds new LED_FUNCTION_* defines of them.

Signed-off-by: Pawel Dembicki <paweldembicki@gmail.com>
---
 Documentation/leds/well-known-leds.txt | 9 +++++++++
 include/dt-bindings/leds/common.h      | 5 +++++
 2 files changed, 14 insertions(+)

diff --git a/Documentation/leds/well-known-leds.txt b/Documentation/leds/well-known-leds.txt
index 2160382c86be..677cf7e57a76 100644
--- a/Documentation/leds/well-known-leds.txt
+++ b/Documentation/leds/well-known-leds.txt
@@ -16,6 +16,15 @@ but then try the legacy ones, too.
 
 Notice there's a list of functions in include/dt-bindings/leds/common.h .
 
+* 4G/3G/2G routers
+
+Cellular routers use LEDs for signal strength identification and connection
+status. Some models also have incoming SMS indicator.
+
+Good: "*:connection"
+Good: "*:signal"
+Good: "*:sms"
+
 * Gamepads and joysticks
 
 Game controllers may feature LEDs to indicate a player number. This is commonly
diff --git a/include/dt-bindings/leds/common.h b/include/dt-bindings/leds/common.h
index 3be89a7c20a9..3adfa120353e 100644
--- a/include/dt-bindings/leds/common.h
+++ b/include/dt-bindings/leds/common.h
@@ -60,6 +60,11 @@
 #define LED_FUNCTION_MICMUTE "micmute"
 #define LED_FUNCTION_MUTE "mute"
 
+/* Used for 4G/3G/2G routers. */
+#define LED_FUNCTION_CONNECTION "connection"
+#define LED_FUNCTION_SIGNAL "signal"
+#define LED_FUNCTION_SMS "sms"
+
 /* Used for player LEDs as found on game controllers from e.g. Nintendo, Sony. */
 #define LED_FUNCTION_PLAYER1 "player-1"
 #define LED_FUNCTION_PLAYER2 "player-2"
-- 
2.25.1

