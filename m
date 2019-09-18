Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A1F8A7D9ED
	for <lwn-linux-doc@archive.lwn.net>; Wed, 18 Sep 2019 14:23:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730407AbfIROXR (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 18 Sep 2019 10:23:17 -0400
Received: from mx2.suse.de ([195.135.220.15]:33306 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730235AbfIROXP (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 18 Sep 2019 10:23:15 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 8FAD7B686;
        Wed, 18 Sep 2019 14:23:13 +0000 (UTC)
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
        sam@ravnborg.org, yc_chen@aspeedtech.com, corbet@lwn.net
Cc:     dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 08/11] drm/mgag200: Add separate move-cursor function
Date:   Wed, 18 Sep 2019 16:23:04 +0200
Message-Id: <20190918142307.27127-9-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190918142307.27127-1-tzimmermann@suse.de>
References: <20190918142307.27127-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Adding mgag200_move_cursor() makes the cursor code more consistent and
will become handy when we move to universal cursor planes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_cursor.c | 29 ++++++++++++++++--------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_cursor.c b/drivers/gpu/drm/mgag200/mgag200_cursor.c
index c6a7ad11ca72..aabacdd3e401 100644
--- a/drivers/gpu/drm/mgag200/mgag200_cursor.c
+++ b/drivers/gpu/drm/mgag200/mgag200_cursor.c
@@ -24,6 +24,24 @@ static void mgag200_hide_cursor(struct mga_device *mdev)
 	mdev->cursor.pixels_current = NULL;
 }
 
+static void mgag200_move_cursor(struct mga_device *mdev, int x, int y)
+{
+	if (WARN_ON(x <= 0))
+		return;
+	if (WARN_ON(y <= 0))
+		return;
+	if (WARN_ON(x & ~0xffff))
+		return;
+	if (WARN_ON(y & ~0xffff))
+		return;
+
+	WREG8(MGA_CURPOSXL, x & 0xff);
+	WREG8(MGA_CURPOSXH, (x>>8) & 0xff);
+
+	WREG8(MGA_CURPOSYL, y & 0xff);
+	WREG8(MGA_CURPOSYH, (y>>8) & 0xff);
+}
+
 int mgag200_cursor_init(struct mga_device *mdev)
 {
 	struct drm_device *dev = mdev->dev;
@@ -251,19 +269,12 @@ int mgag200_crtc_cursor_set(struct drm_crtc *crtc, struct drm_file *file_priv,
 int mgag200_crtc_cursor_move(struct drm_crtc *crtc, int x, int y)
 {
 	struct mga_device *mdev = (struct mga_device *)crtc->dev->dev_private;
+
 	/* Our origin is at (64,64) */
 	x += 64;
 	y += 64;
 
-	BUG_ON(x <= 0);
-	BUG_ON(y <= 0);
-	BUG_ON(x & ~0xffff);
-	BUG_ON(y & ~0xffff);
+	mgag200_move_cursor(mdev, x, y);
 
-	WREG8(MGA_CURPOSXL, x & 0xff);
-	WREG8(MGA_CURPOSXH, (x>>8) & 0xff);
-
-	WREG8(MGA_CURPOSYL, y & 0xff);
-	WREG8(MGA_CURPOSYH, (y>>8) & 0xff);
 	return 0;
 }
-- 
2.23.0

