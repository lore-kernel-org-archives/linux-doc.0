Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A18C97D08A
	for <lwn-linux-doc@archive.lwn.net>; Tue, 29 Jan 2019 16:45:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728191AbfA2Qpp (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 29 Jan 2019 11:45:45 -0500
Received: from mail-yw1-f65.google.com ([209.85.161.65]:39177 "EHLO
        mail-yw1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726752AbfA2Qpp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 29 Jan 2019 11:45:45 -0500
Received: by mail-yw1-f65.google.com with SMTP id k188so8438852ywa.6
        for <linux-doc@vger.kernel.org>; Tue, 29 Jan 2019 08:45:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fKsmPEpaEdGyQgxZeB5JbICl/Z+g+/fLxwKgdnnLqc4=;
        b=fZgxxpwdupl2IGCkzDTQpf/a69ttpYZAfMFWW1pVLNJBMGhIpMwcOkIDOZ3L2GR0Wl
         r0KyhprtRRrsR6+LNbPZAQUhJG42OxFGZFNQrGh+PsIUHAnVW/xxSCMBfUTcP64iNQOy
         cK+KnSV+rO2fGDqK0PyHkvMgEXAhSW0ThS6plVPJwq4R9YgB9EcZ4O+eldm9rpcaV0iW
         8zuYj6kQUsu8ygKVJs//rLx49RPRVn0EUl7IfP6vFThrx66gzrATL0Sgxd7BpZAYdt0u
         Pl2U4+Qgwy0Pd9GUaqwdS8byUGPRnyCGlBMcvT5WRmjWBzDifijV28HVt1Jw5Bz4puJh
         rbKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fKsmPEpaEdGyQgxZeB5JbICl/Z+g+/fLxwKgdnnLqc4=;
        b=rdley2nckfde3M7h2vlqhSY2OTyssISvnoB1O/b7YKbnTHDR05GmokxzTX0m/zId1U
         0RtPvn4f892fXmQsl+SP9bJuSfzKovFfssG5SF29bHPO4XzEEL1KymBlRf/CA/4xgHrs
         Wm7hGMGq8iclfcXU797/EWwQx4qa6thTaQF44fOuWIzea24isQXjBDmOMi6hlepsbayH
         nz6Ao6tXr9BHCtE3Kr4b52OLTjQhouDO3LhLfLJwdgE2is50YvT64vkaaDmIlInUPNwN
         M8i0/0faE8m8aCb13o0zBx+qjcAVulyfBnst/w1QTyMsQpKBL2pSXCjChQ4ulMf1iNXc
         5VKg==
X-Gm-Message-State: AJcUukfrrSDsI1jG8DO+vesYsAkADq/RHQh/5cAhqsGfb8vRbhmDg3r0
        6/896GlUVKDb5flICjzPauF95Q8DbP7icA==
X-Google-Smtp-Source: ALg8bN6OsjbpfxdQnlH659QMiFmTiiEm01eSpZ52tyRpXj05LqK306zc4aHlXYmEjluOzvOqQwswCw==
X-Received: by 2002:a0d:e505:: with SMTP id o5mr26001656ywe.38.1548780343659;
        Tue, 29 Jan 2019 08:45:43 -0800 (PST)
Received: from rosewood.cam.corp.google.com ([2620:0:1013:11:89c6:2139:5435:371d])
        by smtp.gmail.com with ESMTPSA id y16sm12807983ywg.35.2019.01.29.08.45.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 29 Jan 2019 08:45:42 -0800 (PST)
From:   Sean Paul <sean@poorly.run>
To:     dri-devel@lists.freedesktop.org
Cc:     daniel@ffwll.ch, Sean Paul <seanpaul@chromium.org>,
        =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= 
        <ville.syrjala@linux.intel.com>, Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Sean Paul <sean@poorly.run>, linux-doc@vger.kernel.org
Subject: [PATCH v2] drm/TODO: Add vrefresh replacement to the todo
Date:   Tue, 29 Jan 2019 11:45:10 -0500
Message-Id: <20190129164542.252814-1-sean@poorly.run>
X-Mailer: git-send-email 2.20.1.495.gaa96b0ce6b-goog
In-Reply-To: <20190129163544.GE20097@intel.com>
References: <20190129163544.GE20097@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Sean Paul <seanpaul@chromium.org>

Changes in v2:
- Add drm_display_mode.vrefresh removal (Ville)
- Add Sam's R-b and bonus points

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Suggested-by: Daniel Vetter <daniel@ffwll.ch>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
Bonus-points-awarded-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 Documentation/gpu/todo.rst | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 38360ede12215..1bbfc5e1b2a46 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -262,6 +262,24 @@ As a reference, take a look at the conversions already completed in drm core.
 
 Contact: Sean Paul, respective driver maintainers
 
+Convert direct mode.vrefresh accesses to use drm_mode_vrefresh()
+----------------------------------------------------------------
+
+drm_display_mode.vrefresh isn't guaranteed to be populated. As such, using it
+is risky and has been known to cause div-by-zero bugs. Fortunately, drm core
+has helper which will use mode.vrefresh if it's !0 and will calculate it from
+the timings when it's 0.
+
+Use simple search/replace, or (more fun) cocci to replace instances of direct
+vrefresh access with a call to the helper. Check out
+https://lists.freedesktop.org/archives/dri-devel/2019-January/205186.html for
+inspiration.
+
+Once all instances of vrefresh have been converted, consider removing vrefresh
+from drm_display_mode to avoid future use.
+
+Contact: Sean Paul
+
 Core refactorings
 =================
 
-- 
Sean Paul, Software Engineer, Google / Chromium OS

