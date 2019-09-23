Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 65EC17D9ED
	for <lwn-linux-doc@archive.lwn.net>; Mon, 23 Sep 2019 17:28:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440150AbfIWR2D (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 23 Sep 2019 13:28:03 -0400
Received: from mx2.suse.de ([195.135.220.15]:46430 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2437873AbfIWR2D (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 23 Sep 2019 13:28:03 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 8B59FB639;
        Mon, 23 Sep 2019 17:28:00 +0000 (UTC)
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
        sam@ravnborg.org, yc_chen@aspeedtech.com, corbet@lwn.net
Cc:     dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 08/12] drm/mgag200: Add separate move-cursor function
Date:   Mon, 23 Sep 2019 19:27:49 +0200
Message-Id: <20190923172753.26593-9-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190923172753.26593-1-tzimmermann@suse.de>
References: <20190923172753.26593-1-tzimmermann@suse.de>
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
index d39e2bc57a70..621960723a3a 100644
--- a/drivers/gpu/drm/mgag200/mgag200_cursor.c
+++ b/drivers/gpu/drm/mgag200/mgag200_cursor.c
@@ -25,6 +25,24 @@ static void mgag200_hide_cursor(struct mga_device *mdev)
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
@@ -252,19 +270,12 @@ int mgag200_crtc_cursor_set(struct drm_crtc *crtc, struct drm_file *file_priv,
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

