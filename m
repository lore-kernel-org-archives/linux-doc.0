Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E94797D2F0
	for <lwn-linux-doc@archive.lwn.net>; Mon,  7 Oct 2019 15:19:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728689AbfJGPTY (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 7 Oct 2019 11:19:24 -0400
Received: from mail-yw1-f67.google.com ([209.85.161.67]:41009 "EHLO
        mail-yw1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727745AbfJGPTX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 Oct 2019 11:19:23 -0400
Received: by mail-yw1-f67.google.com with SMTP id 129so5241703ywb.8
        for <linux-doc@vger.kernel.org>; Mon, 07 Oct 2019 08:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=va7DzYTLDisgPb0Q7LAfg9j6xV96g03+xcPDp+1en2Y=;
        b=S3ELl6Nv91EyPBYsO7BiEf2AnAYj1MigM2PswaRsih+xB+6PpLe+SE1a26aduZZ0WJ
         prD8sFCQ8qbB5KfmLwL1Q+6CCGVhJCU34APnIg7qsFtUtEbZXBA/8TRb9GpE+czQVfNS
         Uz8SU3JEZJN8m8sYapKNX0cX1xhoMchgA+BBwsS49YYro5VJSBCTQbjxjCycBOOhpDPP
         nfKq0+Lk78vYxR9JHkwN4zz2mcaA52qjUOjcTLO3pFYtWKHM12NaBqIn9s+CydD5expx
         cvYeOghjmBkjhY3u2VMwW2uFrwxKaSjcGp57I0qzYYK/ZyIhI+LeOCarS+oOnS3HcZm3
         i+xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=va7DzYTLDisgPb0Q7LAfg9j6xV96g03+xcPDp+1en2Y=;
        b=D3CVGLFjYELkob5oso5ldm1lS2i6IbAhQEJ3TS1JihkLBsZF6m0Bqj23ZEa8uqs/+7
         xvyxHAkm1GY8CVDttLpDkaRY5LzFAEaD50b/4BCiX0ljUNsxg2NfaUWvyoaJiDEZi6vT
         JU4wRpuvIcatx40zxCTZtwjZHhvSppUvHNpEodf7cwH9VbygUGTUgtehhS8m66jq8LgJ
         u90JxDdb4nZzqj1wluMKUjDlWG7n+v+szaLgalbylvr3eCleTq7Xfc5TDnHMAswBB6oT
         L6X90MczIsp9OQSmurXiExsuvPItDTIxeWqZA9CF4W2bQXif3kJJyxpEtRyuH3GPlF2a
         cNug==
X-Gm-Message-State: APjAAAVwL8+QhOaL+c60nniL6tUYplghLT5sHohq4l9ynA/TTD662l1Q
        TBUi7wIml1K4vJED/D0OsGMvLe8v2g8=
X-Google-Smtp-Source: APXvYqx7eMSr7rGGtkEwZIh/7tK9sJ+V6gRs5t479H+c1U5/HJocHXFLLwn+HbVA3kvrCZ8cgItLpg==
X-Received: by 2002:a0d:e693:: with SMTP id p141mr21354576ywe.425.1570461562832;
        Mon, 07 Oct 2019 08:19:22 -0700 (PDT)
Received: from rosewood.cam.corp.google.com ([2620:0:1013:11:89c6:2139:5435:371d])
        by smtp.gmail.com with ESMTPSA id y67sm4102306ywd.63.2019.10.07.08.19.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2019 08:19:22 -0700 (PDT)
From:   Sean Paul <sean@poorly.run>
To:     dri-devel@lists.freedesktop.org
Cc:     Sean Paul <seanpaul@chromium.org>,
        =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= 
        <ville.syrjala@linux.intel.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-doc@vger.kernel.org
Subject: [PATCH] Documentation: Fix warning in drm-kmsc-helpers.rst
Date:   Mon,  7 Oct 2019 11:19:01 -0400
Message-Id: <20191007151921.27099-1-sean@poorly.run>
X-Mailer: git-send-email 2.23.0.581.g78d2f28ef7-goog
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Sean Paul <seanpaul@chromium.org>

Fixes the following warning:
../include/drm/drm_atomic_state_helper.h:1: warning: no structured comments found

Fixes: 9ef8a9dc4b21 ("drm: Extract drm_atomic_state_helper.[hc]")
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Daniel Vetter <daniel.vetter@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Sean Paul <sean@poorly.run>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 Documentation/gpu/drm-kms-helpers.rst | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/gpu/drm-kms-helpers.rst b/Documentation/gpu/drm-kms-helpers.rst
index 3868008db8a9..9668a7fe2408 100644
--- a/Documentation/gpu/drm-kms-helpers.rst
+++ b/Documentation/gpu/drm-kms-helpers.rst
@@ -77,9 +77,6 @@ Atomic State Reset and Initialization
 Atomic State Helper Reference
 -----------------------------
 
-.. kernel-doc:: include/drm/drm_atomic_state_helper.h
-   :internal:
-
 .. kernel-doc:: drivers/gpu/drm/drm_atomic_state_helper.c
    :export:
 
-- 
Sean Paul, Software Engineer, Google / Chromium OS

