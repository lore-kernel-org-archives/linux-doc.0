Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,T_DKIMWL_WL_HIGH autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C6E597D584
	for <lwn-linux-doc@archive.lwn.net>; Thu, 30 Aug 2018 21:57:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727981AbeHaCAp (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 30 Aug 2018 22:00:45 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:40631 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727607AbeHaCAo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 30 Aug 2018 22:00:44 -0400
Received: by mail-pf1-f195.google.com with SMTP id s13-v6so4488692pfi.7
        for <linux-doc@vger.kernel.org>; Thu, 30 Aug 2018 14:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bNkXjyd/TJwjJQq5sEuLkOphZyxbub4Zs7WyVtO+UM0=;
        b=OO2p7d+CZgD4xu58qnmC/I+WtDMVinCv2sRX+QxYmOggLJ6HEFrSO5eq3Xwd8yOO3I
         2YD0a33Qp016oqh0a0lciOhz2xY9q7NxcgvCrMbbaVJJineVysS91WrHY84ZLuoZyNMd
         okn84jvHPZ4wzARZvMvhFwOwkyIgsDQHf/sKs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bNkXjyd/TJwjJQq5sEuLkOphZyxbub4Zs7WyVtO+UM0=;
        b=H+IMQck0zdlq5OY42tQsCzzdcfko970gwNPsXys8BaRy826Q50f2WFcHFGeKmO8stG
         7XdRzu+sBryoLmyV1bWqiflaBQvN8+IclTvf0vv59bPqWZFrPqgPN439V7lHlZimVlI1
         aJTB8XW1SWobPf3tV96gSY6UZDSIyXEUWAOV0F15DIShR1cTMKzhvp8YedtY7nPnWfe1
         ZFqCd8WyFkFqipxt0cuoZzcsNDq6a8gWDQ320XNd3feSbG43Hl/syf2JCw7AkOOh8Yh7
         uqFFoE9n0LHf6cY3E49zC0KUa60EPMCA9pwc+zaGa9pWwyf7QssV2GQhaco14dR4yP5G
         nigg==
X-Gm-Message-State: APzg51BCD/i9xReTyef/cncwB00E46ySCiaSi6hadN9/DBFiyL/FniQF
        eWv414c2Y1ujIDN2cC7aKEFvtQ==
X-Google-Smtp-Source: ANB0VdbNkl8lbvHPMvyngVgpXh3ZSQLD2vCCYre8H6NFVp07Ua62TVik9DMEPfWU76DNHJGykuMSzA==
X-Received: by 2002:a63:f501:: with SMTP id w1-v6mr6830908pgh.446.1535666188590;
        Thu, 30 Aug 2018 14:56:28 -0700 (PDT)
Received: from kolhar.mtv.corp.google.com ([2620:15c:202:201:356a:9de2:526a:5bc])
        by smtp.gmail.com with ESMTPSA id h132-v6sm13516828pfc.100.2018.08.30.14.56.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Aug 2018 14:56:28 -0700 (PDT)
From:   Harry Cutts <hcutts@chromium.org>
To:     linux-input <linux-input@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     Jiri Kosina <jiri.kosina@suse.cz>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Harry Cutts <hcutts@chromium.org>, linux-doc@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v2 1/5] Add the `REL_WHEEL_HI_RES` event code
Date:   Thu, 30 Aug 2018 14:56:18 -0700
Message-Id: <20180830215622.47550-2-hcutts@chromium.org>
X-Mailer: git-send-email 2.19.0.rc0.228.g281dcd1b4d0-goog
In-Reply-To: <20180830215622.47550-1-hcutts@chromium.org>
References: <20180830215622.47550-1-hcutts@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This event code represents scroll reports from high-resolution wheels,
and will be used by future patches in this series. See the linux-input
"Reporting high-resolution scroll events" thread [0] for more details.

[0]: https://www.spinics.net/lists/linux-input/msg57380.html

Signed-off-by: Harry Cutts <hcutts@chromium.org>
---

Changes in v2: None

 Documentation/input/event-codes.rst    | 11 ++++++++++-
 include/uapi/linux/input-event-codes.h |  1 +
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/Documentation/input/event-codes.rst b/Documentation/input/event-codes.rst
index a8c0873beb95..cef220c176a4 100644
--- a/Documentation/input/event-codes.rst
+++ b/Documentation/input/event-codes.rst
@@ -190,7 +190,16 @@ A few EV_REL codes have special meanings:
 * REL_WHEEL, REL_HWHEEL:
 
   - These codes are used for vertical and horizontal scroll wheels,
-    respectively.
+    respectively. The value is the number of "notches" moved on the wheel, the
+    physical size of which varies by device. For high-resolution wheels (which
+    report multiple events for each notch of movement, or do not have notches)
+    this may be an approximation based on the high-resolution scroll events.
+
+* REL_WHEEL_HI_RES:
+
+  - If a vertical scroll wheel supports high-resolution scrolling, this code
+    will be emitted in addition to REL_WHEEL. The value is the (approximate)
+    distance travelled by the user's finger, in microns.
 
 EV_ABS
 ------
diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
index 53fbae27b280..dad8d3890a3a 100644
--- a/include/uapi/linux/input-event-codes.h
+++ b/include/uapi/linux/input-event-codes.h
@@ -708,6 +708,7 @@
 #define REL_DIAL		0x07
 #define REL_WHEEL		0x08
 #define REL_MISC		0x09
+#define REL_WHEEL_HI_RES	0x0a
 #define REL_MAX			0x0f
 #define REL_CNT			(REL_MAX+1)
 
-- 
2.19.0.rc0.228.g281dcd1b4d0-goog

