Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A29F97D089
	for <lwn-linux-doc@archive.lwn.net>; Thu, 29 Nov 2018 15:55:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728735AbeK3DBO (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 29 Nov 2018 22:01:14 -0500
Received: from mail-yb1-f194.google.com ([209.85.219.194]:41464 "EHLO
        mail-yb1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728583AbeK3DBN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 29 Nov 2018 22:01:13 -0500
Received: by mail-yb1-f194.google.com with SMTP id t13-v6so924442ybb.8
        for <linux-doc@vger.kernel.org>; Thu, 29 Nov 2018 07:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5eEskBUuKnWtfATLRh9ZS1L6bRZasqMoL88Zom6Ut+8=;
        b=IbRMhI/0uprNnUtQ9YrFvpIvSadZntMY0tskyWho/zzXam8vo9YOu/rtlhJj632U+2
         zEPsCxds1u3IjbShJhWxN4xm+Ezcc2Rv/SQ4bsTdkvBMjihuuzQtlt1/2fBuEKeopKBX
         XRnSZvSPd7U8V2KzOyFOrTQx6tXfa2iLyoZtelet1FMd6CpeepZXzUmtWrcyDjjCKAA/
         GoZWwgPUcQXjZFGRr8MCXPlCynNqSGxzQlxdFy6sLAtt4wJiI+GKPmGUCKM1h4pT5Ywq
         QhEmBkN8kEaoEod1Wm6T5k6ppNCA1Fuyx5RyOrL8ovDVAjTyp6nAiAWYVoxFi4zsfHuC
         ITYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5eEskBUuKnWtfATLRh9ZS1L6bRZasqMoL88Zom6Ut+8=;
        b=R+TTb4SGc7Jnoih3Lc8FO2g2do/uI0K0Dg1+QYKTh+qoWTVnSAW8Tvc29TTL8lems+
         oJCwLP3Nff/RMuTZpaKmnyNj9+blfvey9PetnUfN9WeqhhTUim1JDctPeL+vXDsJO3hC
         MXsH/fEalfzK4vOJcYMKB/yMOHJzHXuVbA/atn7WeLJFv2ULFxfZwjGRRzJ/R949WDxA
         Rvsnpvt3k5pLMoPSJ00wKCEjsOOG1ZlP6+kFiAnZCtYPDbmJpz4vB+lRDR+66gKHYu6Q
         w7IUcpTM4ZxQmXoxyo2sgaTpSRn6B6NNE+MJm9XnFeCWAch2qfrsi9OOuRZydyu/7YlO
         I6UQ==
X-Gm-Message-State: AA+aEWbNvAM8pldLN7JzlIfGsGBOb+1uQOFahsKQAbwvVqYcYph3Adxx
        DIug0csWO7BbXOotqMKOsG5mQg==
X-Google-Smtp-Source: AFSGD/X3A2IicWe6HKcAbGSktnctUD3GAFw4CXypVcWlbDxztut0mS0Zw393xOR551P51NFnJ3Yy1w==
X-Received: by 2002:a25:e80c:: with SMTP id k12-v6mr1856353ybd.218.1543506923891;
        Thu, 29 Nov 2018 07:55:23 -0800 (PST)
Received: from rosewood.cam.corp.google.com ([2620:0:1013:11:ad55:b1db:adfe:3b9f])
        by smtp.gmail.com with ESMTPSA id f191-v6sm996981ywh.98.2018.11.29.07.55.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Nov 2018 07:55:23 -0800 (PST)
From:   Sean Paul <sean@poorly.run>
To:     dri-devel@lists.freedesktop.org
Cc:     Sean Paul <seanpaul@chromium.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Junwei Zhang <Jerry.Zhang@amd.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Huang Rui <ray.huang@amd.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH] Documentation: drm: Remove dangling pointer from drm-mm.rst
Date:   Thu, 29 Nov 2018 10:55:17 -0500
Message-Id: <20181129155522.33749-1-sean@poorly.run>
X-Mailer: git-send-email 2.20.0.rc0.387.gc7a69e6b6c-goog
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Sean Paul <seanpaul@chromium.org>

Fixes htmldocs build error:
Error: Cannot open file ../drivers/gpu/drm/drm_global.c

Fixes: 2bb42410b1bd ("drm: Remove drm_global.{c,h} v2")
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Christian König <christian.koenig@amd.com>
Cc: Junwei Zhang <Jerry.Zhang@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Sean Paul <sean@poorly.run>
Cc: David Airlie <airlied@linux.ie>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Huang Rui <ray.huang@amd.com>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 Documentation/gpu/drm-mm.rst | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
index d0f3c6b032009..54a696d961a7c 100644
--- a/Documentation/gpu/drm-mm.rst
+++ b/Documentation/gpu/drm-mm.rst
@@ -79,9 +79,6 @@ count for the TTM, which will call your initialization function.
 
 See the radeon_ttm.c file for an example of usage.
 
-.. kernel-doc:: drivers/gpu/drm/drm_global.c
-   :export:
-
 
 The Graphics Execution Manager (GEM)
 ====================================
-- 
Sean Paul, Software Engineer, Google / Chromium OS

