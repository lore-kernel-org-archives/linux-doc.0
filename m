Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EC24C49EA2
	for <linux-doc@archiver.kernel.org>; Mon, 21 Jun 2021 06:29:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3A90161040
	for <linux-doc@archiver.kernel.org>; Mon, 21 Jun 2021 06:29:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230269AbhFUGcG (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 21 Jun 2021 02:32:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230263AbhFUGcE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 21 Jun 2021 02:32:04 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AE0AC061787
        for <linux-doc@vger.kernel.org>; Sun, 20 Jun 2021 23:29:48 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id m15-20020a17090a5a4fb029016f385ffad0so6811042pji.0
        for <linux-doc@vger.kernel.org>; Sun, 20 Jun 2021 23:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=igel-co-jp.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MByV6cpfz5xYL+DMP3l1hiWnj/Gzo6aYK3LpWdzWngw=;
        b=INBgOxS5FqMrlNPVd6fydqECStt/0aXOX0ms8c86Xm9H5Czt0SAQViPwSHhxqBbA6L
         qRcQJRg1tLpFi1jd3YRlM9TPQAZEe9vlHLhIUZG2/tofLM97F6HSJ+0V8vqo94igM0QH
         Ve8BQkLBbpytMccLcNA83ZAOnFZ+Me8pWT90vJexeneqr1mlK5lFROQo4VxlAEaL/0z8
         renQqq6zpBQB/+AYALWZ0i2wq0qJiZfNmj1jhfTdYDUTyUEd2UWY4AglxcN1qo03oekA
         YqZftYh5Yp6gT59Hg90rmIGFE1TTTFn7I2zjPlvTg7dVjOBkzngLkwHezWdFVpAckuai
         8vtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MByV6cpfz5xYL+DMP3l1hiWnj/Gzo6aYK3LpWdzWngw=;
        b=BAsAXuH8a6wMg2tslnJJypVkiZ7xvVph4FxHE2SfDFHr0JmDWCMSNgKKa+mY0YwwpN
         ejL36wW9CGE88yfuv0fcyKy3OLnB18qpVq+eyxd53wOOxBb5co+6O+PEi73GLkcMlh+c
         qXGFYeKQkwYDjP3K1qIBARO/HqLXaVydEmbsLrZqExmBGnbNdbpSOXUlMGDfAt8xKykN
         xMs7A+fkr815bbOexiXWPTfFPOwt5qgzoIW+LdN4sTsh79HV+1SjqBl4cLI+TXHmWokK
         6xIi8Zekqg6Fw57hq1cLUFCAoNYqXdbb9aXrekpNvs42qsqAX/ARGX4NuTqvx6XjGpZ2
         5NkA==
X-Gm-Message-State: AOAM5336gMlbHn0/VDoZ/C0/bAhE4lmHms3p0Ju3oEVtTC1CEN7SY7oF
        B6Yy3f2+sWtLvFxwO/NxG1NLKg==
X-Google-Smtp-Source: ABdhPJxHNpA+XwXUTcAq7QFgOE6z6xDf29WT9IIQdU5CA8Phncg6Mo0Y0WvZ8pH33A0XVv1phS5WIg==
X-Received: by 2002:a17:90a:ab96:: with SMTP id n22mr25432272pjq.92.1624256987850;
        Sun, 20 Jun 2021 23:29:47 -0700 (PDT)
Received: from localhost.localdomain ([240b:10:c9a0:ca00:61b8:26ec:dc30:8823])
        by smtp.gmail.com with ESMTPSA id j19sm15266018pgm.44.2021.06.20.23.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jun 2021 23:29:47 -0700 (PDT)
From:   Tomohito Esaki <etom@igel.co.jp>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     dri-devlel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
        Tomohito Esaki <etom@igel.co.jp>
Subject: [PATH 4/4] doc-rst: Add virtual DRM documentation
Date:   Mon, 21 Jun 2021 15:27:42 +0900
Message-Id: <20210621062742.26073-5-etom@igel.co.jp>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210621062742.26073-1-etom@igel.co.jp>
References: <20210621062742.26073-1-etom@igel.co.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Signed-off-by: Tomohito Esaki <etom@igel.co.jp>
---
 Documentation/gpu/drivers.rst |  1 +
 Documentation/gpu/vdrm.rst    | 51 +++++++++++++++++++++++++++++++++++
 2 files changed, 52 insertions(+)
 create mode 100644 Documentation/gpu/vdrm.rst

diff --git a/Documentation/gpu/drivers.rst b/Documentation/gpu/drivers.rst
index b4a0ed3ca961..bad0226de972 100644
--- a/Documentation/gpu/drivers.rst
+++ b/Documentation/gpu/drivers.rst
@@ -19,6 +19,7 @@ GPU Driver Documentation
    xen-front
    afbc
    komeda-kms
+   vdrm
 
 .. only::  subproject and html
 
diff --git a/Documentation/gpu/vdrm.rst b/Documentation/gpu/vdrm.rst
new file mode 100644
index 000000000000..2ab1699c2f42
--- /dev/null
+++ b/Documentation/gpu/vdrm.rst
@@ -0,0 +1,51 @@
+=============================
+ drm/vdrm virtual DRM driver
+=============================
+
+Virtual DRM splits the overlay planes of a display controller into multiple
+virtual devices to allow each plane to be accessed by each process.
+
+This makes it possible to overlay images output from multiple processes on a
+display. For example, one process displays the camera image without compositor
+while another process overlays the UI.
+
+The virtual DRM creates standalone virtual device and make DRM planes from a
+master device (e.g. card0) accessible via one or more virtual device. However,
+these plane are no longer accessible from the original device.
+Each virtual device (and plane) can be accessed via a separate device file.
+
+The virtual DRM driver doesn't directly control the display hardware and has
+no access to the physical bus. Instead, the virtual DRM driver issues requests
+to the standard DRM device driver ("master" driver) when the hardware needs to
+be controlled. The master driver is modified to notify the virtual DRM driver
+of interrupt events from the display hardware.
+
+Plane position and size
+=======================
+The initial position, size and z-position of the plane used in virtual DRM is
+specified in the device tree. The position and size of the planes are set as
+properties and can be updated. The name of each property is as
+follows:
+* vdrm_offset_x: x-coordinate of the left-top of the plane on the screen
+* vdrm_offset_y: y-coordinate of the left-top of the plane on the screen
+* vdrm_width: width of the plane
+* vdrm_height: height of the plane
+
+Virtual DRM Functions Reference
+===============================
+
+.. kernel-doc:: drivers/gpu/drm/vdrm/vdrm_api.h
+    :internal:
+
+.. kernel-doc:: drivers/gpu/drm/vdrm/vdrm_drv.c
+    :export:
+
+Driver limitations
+==================
+1. Each virtual DRM device only supports one plane per CRTC.
+
+2. Virtual DRM doesn't support hot plug connector.
+
+3. If virtual DRM has multiple CRTCs, the initial position and size of the
+   virtual DRM planes is the same for all planes, since they cannot be set
+   for each plane in the device tree.
-- 
2.25.1

