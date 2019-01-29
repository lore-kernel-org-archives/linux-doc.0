Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 212907D161
	for <lwn-linux-doc@archive.lwn.net>; Tue, 29 Jan 2019 19:26:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728439AbfA2T0m (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 29 Jan 2019 14:26:42 -0500
Received: from mail-yw1-f65.google.com ([209.85.161.65]:36514 "EHLO
        mail-yw1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726852AbfA2T0l (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 29 Jan 2019 14:26:41 -0500
Received: by mail-yw1-f65.google.com with SMTP id i73so8654707ywg.3
        for <linux-doc@vger.kernel.org>; Tue, 29 Jan 2019 11:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GcukgBXEHQSQGkc3mdvEQKq+keUsB3n7RVA/njAR1oA=;
        b=KTDHD8hje5lYLTpYBI3dml5mFGRreS5vVdo9uVy7qZmLm/ym3R4mR4TRt8zbUh+JcA
         b2FCWk6dFYrhFpU4groVV6gIguBUHFvNWyKPT6f5T+YDRSNTYuG3AR4a7uyLKfDUtvzW
         i9VNYb4ImDgslnxmkS8UDzGwOo+aHqi3JaEfPpvXQW3y0x7i57K5nRtEYpS/89hoZAAy
         R3mxryDyqlrKmSsyqYSORvhGspBdpvO7CyoPOX2eF0/qv6enR1lbGn0ilztlEv4uN3Sv
         mPKzLlE2ZLL7OeEoOZo79X3kRMB6JEVHwVzssG+bUTlXFWatD95WlDOD2SWagBs73PhC
         H6vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GcukgBXEHQSQGkc3mdvEQKq+keUsB3n7RVA/njAR1oA=;
        b=XdA7lgEoS92L/SJJ9tMrn1CprHDB9Few+xrwik0eWGw4XyvrDQiQSOxa5QF1oJFl54
         WEsVMH2RazesUptdiqOUPxFi5m0omhxojpc8TXA1decbAuK5V7SGoWV2Kh0tqNMoZccK
         CE2GMXXhw0OflFU7QnmY+WJpEWAkkXuDCf1/jowqAZycyA7kC/zZvgunEaGPtUppZSgL
         Jqhf20jyj78KT9NoyF7BxFu8gl36ZKBvv/K3vGACk0TOfC0ty1/N6VHHq1oIkfJIiABu
         2/FdiPAysTrfTA9F1fX6eQ3UiD9rzyo6JB58Ew9E2IFpqHoiz2wiNg7ha8wfIbzfy740
         BFTw==
X-Gm-Message-State: AJcUukft34DnmzoD81QcHbN6ya/dkmcprCD/oQ9FL+JgnACSJcQo/Zk/
        8yba5uDmIqKveqAg1m7haOCcAA==
X-Google-Smtp-Source: ALg8bN5YNeI59k7N2Iy5BkOS+1YeIWH0GaXoli7bgrvb7FNHkclAuxK3xT1hHl+yviz6Jkofmge34Q==
X-Received: by 2002:a0d:e901:: with SMTP id s1mr24946614ywe.97.1548790000218;
        Tue, 29 Jan 2019 11:26:40 -0800 (PST)
Received: from rosewood.cam.corp.google.com ([2620:0:1013:11:89c6:2139:5435:371d])
        by smtp.gmail.com with ESMTPSA id j134sm18130704ywb.91.2019.01.29.11.26.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 29 Jan 2019 11:26:38 -0800 (PST)
From:   Sean Paul <sean@poorly.run>
To:     dri-devel@lists.freedesktop.org
Cc:     daniel@ffwll.ch, Sean Paul <seanpaul@chromium.org>,
        =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= 
        <ville.syrjala@linux.intel.com>, Sam Ravnborg <sam@ravnborg.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        linux-doc@vger.kernel.org
Subject: [PATCH v3] drm/TODO: Add drm_display_mode.hsync/vrefresh removal
Date:   Tue, 29 Jan 2019 14:26:29 -0500
Message-Id: <20190129192637.73296-1-sean@poorly.run>
X-Mailer: git-send-email 2.20.1.495.gaa96b0ce6b-goog
In-Reply-To: <20190129172441.GX3271@phenom.ffwll.local>
References: <20190129172441.GX3271@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Sean Paul <seanpaul@chromium.org>

Drivers shouldn't be using these values, add a TODO so someone removes
them.

Changes in v2:
- Add drm_display_mode.vrefresh removal (Ville)
- Add Sam's R-b and bonus points
Changes in v3:
- Add hsync removal todo item (Daniel)
- Change vrefresh wording to make removal less optional

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Suggested-by: Daniel Vetter <daniel@ffwll.ch>
Reviewed-by: Daniel Vetter <daniel@ffwll.ch>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
Bonus-points-awarded-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
---

This time with feeling.

 Documentation/gpu/todo.rst | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 38360ede12215..f67c84b92873c 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -262,6 +262,34 @@ As a reference, take a look at the conversions already completed in drm core.
 
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
+Once all instances of vrefresh have been converted, remove vrefresh from
+drm_display_mode to avoid future use.
+
+Contact: Sean Paul
+
+Remove drm_display_mode.hsync
+-----------------------------
+
+We have drm_mode_hsync() to calculate this from hsync_start/end, since drivers
+shouldn't/don't use this, remove this member to avoid any temptations to use it
+in the future. If there is any debug code using drm_display_mode.hsync, convert
+it to use drm_mode_hsync() instead.
+
+Contact: Sean Paul
+
 Core refactorings
 =================
 
-- 
Sean Paul, Software Engineer, Google / Chromium OS

