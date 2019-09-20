Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 32CC37D2F0
	for <lwn-linux-doc@archive.lwn.net>; Fri, 20 Sep 2019 19:36:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727092AbfITTgL (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 20 Sep 2019 15:36:11 -0400
Received: from mail-yb1-f195.google.com ([209.85.219.195]:45231 "EHLO
        mail-yb1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726869AbfITTgL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 20 Sep 2019 15:36:11 -0400
Received: by mail-yb1-f195.google.com with SMTP id y6so3034730ybq.12
        for <linux-doc@vger.kernel.org>; Fri, 20 Sep 2019 12:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4PSjVvrwcPyiyPNMdMmKLWfVB71rQ09KRU+ERhcpajc=;
        b=CphLNVPabbhkOs4mKMD7OYc420VKFdDRCIxdCC7HvM6afy87hU52kmc0gffqfJPlqg
         O0e791FvAB10FhGg9wLDm2Exz5+kdm5WZaQWeWZjhWOrhniEZCPl57QvPKy9Gg2JZdlI
         zjpiHCqQx92kcREvJNTYrTMz40y7pHIY2fwohuKNRk52Zt4a9wOQMA3GzMH3CAcT/KT/
         i87HOPCv4vyntKkjhznaNW4hxJ8DuoOeUsrbSWnel2eei7J2YaC2AgAuwiIlBozoddQX
         krqm7krPZB+DwrmWa7BNysIaeg8xWqHbGZaR7uGfwEeU1hHHQt32qe/K9qOC+dm/y24m
         mweA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4PSjVvrwcPyiyPNMdMmKLWfVB71rQ09KRU+ERhcpajc=;
        b=rwID/bwmZB6NRb4wsH+Ez1wPyNYxJMN+jITpW4aX0gT/p2x8HfP9lIv5X1Wtw+YAzk
         FWkkH4WMzt/5qvLfeQqXZ5J10+UwzahK7Mb/810rcEm26o8cIPfgzKJuslEw2aect2l+
         S8A0p4vIFPr+Rzm7yBzuf+IOF/j3ZKLzjbW39zcByljr748M3kWc2FeZG5TlpU6xIdmh
         uTLDyXLWtHLZa55MZujLvCIcykQpk8rKxRtLNOz8YKv5Zmt8OaTQ6dQKCMqfyVR2guTT
         05+fYo+oTnZw5iHfd3Ig6UvLmCOugtP1VxiNC2vJ+wCmxbuPUw/sMhcRIZAuRLvCbJNk
         ES2g==
X-Gm-Message-State: APjAAAXbdPM9XJ7jd0bI+2onkYYC9kNHt1vGRcLzc34kAGt3KHmzNh8+
        +X2dh2JurzK7GHMtqkhXEHF9LQ==
X-Google-Smtp-Source: APXvYqzeoQWT++CqoLDRbSTXE0IswtqVXXnGTklT+ktQlUGI782cNpBKEz/HsmVEw9qKQwiuLrA+vw==
X-Received: by 2002:a25:6004:: with SMTP id u4mr12644483ybb.415.1569008170494;
        Fri, 20 Sep 2019 12:36:10 -0700 (PDT)
Received: from rosewood.cam.corp.google.com ([2620:0:1013:11:89c6:2139:5435:371d])
        by smtp.gmail.com with ESMTPSA id g1sm655126ywk.53.2019.09.20.12.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2019 12:36:10 -0700 (PDT)
From:   Sean Paul <sean@poorly.run>
To:     dri-devel@lists.freedesktop.org
Cc:     Sean Paul <seanpaul@chromium.org>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH 2/2] Documentation/gpu: Fix no structured comments warning for drm_gem_ttm_helper.h
Date:   Fri, 20 Sep 2019 15:35:52 -0400
Message-Id: <20190920193558.89815-2-sean@poorly.run>
X-Mailer: git-send-email 2.23.0.351.gc4317032e6-goog
In-Reply-To: <20190920193558.89815-1-sean@poorly.run>
References: <20190920193558.89815-1-sean@poorly.run>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Sean Paul <seanpaul@chromium.org>

Fixes
include/drm/drm_gem_ttm_helper.h:1: warning: no structured comments found

Fixes: ff540b76f14a ("drm/ttm: add drm gem ttm helpers, starting with drm_gem_ttm_print_info()")
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Sean Paul <sean@poorly.run>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 Documentation/gpu/drm-mm.rst | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
index 99d56015e077..59619296c84b 100644
--- a/Documentation/gpu/drm-mm.rst
+++ b/Documentation/gpu/drm-mm.rst
@@ -406,9 +406,6 @@ GEM TTM Helper Functions Reference
 .. kernel-doc:: drivers/gpu/drm/drm_gem_ttm_helper.c
    :doc: overview
 
-.. kernel-doc:: include/drm/drm_gem_ttm_helper.h
-   :internal:
-
 .. kernel-doc:: drivers/gpu/drm/drm_gem_ttm_helper.c
    :export:
 
-- 
Sean Paul, Software Engineer, Google / Chromium OS

