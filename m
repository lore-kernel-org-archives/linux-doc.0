Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 647BD7D08A
	for <lwn-linux-doc@archive.lwn.net>; Thu, 29 Nov 2018 19:58:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726190AbeK3HFP (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 30 Nov 2018 02:05:15 -0500
Received: from mail-yw1-f66.google.com ([209.85.161.66]:42806 "EHLO
        mail-yw1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725788AbeK3HFO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 30 Nov 2018 02:05:14 -0500
Received: by mail-yw1-f66.google.com with SMTP id x2so1285284ywc.9
        for <linux-doc@vger.kernel.org>; Thu, 29 Nov 2018 11:58:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HkuhcmnP2XqZAgSg3H2j5Sxm30eXST7E5Z+C56MnO1E=;
        b=U8qG0QpCVVRVVakPk8+/HLoY2YMzP8/brNA1yJ7NHFZIqT3GIEC7LC6pgekSNs8Ku3
         E26MqWi/hvEsdZuwA9+qITiSnUpQb+nMGQbAq9Nkfo6xlD6HUSGVByVRiUVsju82CJHq
         cDiAGD2lC6d9HFey/7w/5O4a0q15/kdHWTYq1lBAqnscDrkC0F/E18ZaXpy1AUruSp7H
         losmS8htpJuXJsxRLXg3LIBWQnDBncV0orkd5uvknhNXH/2kGnxPAmaDl1k7GJOXowc9
         NrIbpvNGvy6H1ALxduiSj1xbyqIOXykFfvOni1Lwe6bUBRYDkow0mfWUrRxDbf+mZDu0
         VrmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HkuhcmnP2XqZAgSg3H2j5Sxm30eXST7E5Z+C56MnO1E=;
        b=JsU2RF9nHkobxHsu/FHWEj+A+KQzglBN2TsDYIBLnajuoSeRUEHc/GnQm/fpv0T2q5
         App81YwtD58xPtlGKqZwqouYPuL2iQD4NM/FqERJjVAAvlIGYv8fxft/z2xdONrk0kIL
         vuSVU7G7O8a6ldM1NpaQoKn5wsUV/H5h8NbXIxRjjVzeJeffxR1r4tU21KYIMtLjRfM3
         QHLPNVVHg2Et13T5qXfQIm7OAh0J3h6Wu6dgFcyekZclsLDN0o5vGmPRanCA4WeByBxV
         S4htwpFxhC/3SWIbCS+L1jgMZCbe/VTjIDtRM0lEktW6qPKeEa8k/B2Ui3JUcCLpKM0l
         1V0g==
X-Gm-Message-State: AA+aEWYm2YRfnQxTzS9Sg7182PKS2eoLYYD1HO9z/w5vD58wBIxvyAVi
        JMA6bq9oogjfo0QXM4I4Q5mEYg==
X-Google-Smtp-Source: AFSGD/U40GdGx7ipULkXlVLJ7vRoRcFdal+ha5V2Dy+xERopa7QQXM4Iaiik4ydyQ3BxC/k2tronoQ==
X-Received: by 2002:a0d:dd52:: with SMTP id g79mr2881025ywe.29.1543521520117;
        Thu, 29 Nov 2018 11:58:40 -0800 (PST)
Received: from rosewood.cam.corp.google.com ([2620:0:1013:11:ad55:b1db:adfe:3b9f])
        by smtp.gmail.com with ESMTPSA id l7sm913929ywk.24.2018.11.29.11.58.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Nov 2018 11:58:39 -0800 (PST)
From:   Sean Paul <sean@poorly.run>
To:     dri-devel@lists.freedesktop.org
Cc:     Sean Paul <seanpaul@chromium.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Sean Paul <sean@poorly.run>, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org
Subject: [PATCH v2] drm: TODO: Add DRM_MODESET_LOCK_ALL* conversion to todo.rst
Date:   Thu, 29 Nov 2018 14:58:33 -0500
Message-Id: <20181129195838.222031-1-sean@poorly.run>
X-Mailer: git-send-email 2.20.0.rc0.387.gc7a69e6b6c-goog
In-Reply-To: <20181129164651.GM21184@phenom.ffwll.local>
References: <20181129164651.GM21184@phenom.ffwll.local>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Sean Paul <seanpaul@chromium.org>

We should also get the drivers using the helpers. Seems like a good
intermediate TODO item.

Changes in v2:
- Add line about replacing drm_modest_lock_all() (Daniel)

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 Documentation/gpu/todo.rst | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index ab347dec50796..14191b64446df 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -241,6 +241,21 @@ struct drm_gem_object_funcs
 GEM objects can now have a function table instead of having the callbacks on the
 DRM driver struct. This is now the preferred way and drivers can be moved over.
 
+Use DRM_MODESET_LOCK_ALL_* helpers instead of boilerplate
+---------------------------------------------------------
+
+For cases where drivers are attempting to grab the modeset locks with a local
+acquire context. Replace the boilerplate code surrounding
+drm_modeset_lock_all_ctx() with DRM_MODESET_LOCK_ALL_BEGIN() and
+DRM_MODESET_LOCK_ALL_END() instead.
+
+This should also be done for all places where drm_modest_lock_all() is still
+used.
+
+As a reference, take a look at the conversions already completed in drm core.
+
+Contact: Sean Paul, respective driver maintainers
+
 Core refactorings
 =================
 
-- 
Sean Paul, Software Engineer, Google / Chromium OS

