Return-Path: <SRS0=C3TA=EC=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75512C4363A
	for <linux-doc@archiver.kernel.org>; Tue, 27 Oct 2020 10:00:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 268F0222C8
	for <linux-doc@archiver.kernel.org>; Tue, 27 Oct 2020 10:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603792851;
	bh=7iRzQ9FtMsadAedSe/m2uOK3R6zBKK4pf/UOJjIXzSM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=KZC7f5cKavn4KkVNZlc3iD+H7F3HvjkwyxIjPE+t8ZNLjhQjMYB1EuvxU9R61ELVa
	 FqwMT6qqbs1V7Fn0EuIv1UVJh7ED4byxJrWx/NEgafEM/HWhe6QRKy4RW+OP7u/tmQ
	 96R5M4B9v+9YoYYOGJJyNOEe6TxS8OC5qfBgTmL0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2896698AbgJ0KAq (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 27 Oct 2020 06:00:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:42612 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2896065AbgJ0Jvo (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 27 Oct 2020 05:51:44 -0400
Received: from mail.kernel.org (ip5f5ad5af.dynamic.kabel-deutschland.de [95.90.213.175])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0D8DC24677;
        Tue, 27 Oct 2020 09:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603792302;
        bh=7iRzQ9FtMsadAedSe/m2uOK3R6zBKK4pf/UOJjIXzSM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Dcsblmz0EkVXN+vfJXxMzME789p5Ep83AyUYuExckEi++nLmuGrXGYKf6fuAZb9mB
         Hzh7y+UgEnIONRwARO7M8zu6X8DbUj2CYUy+IAJRei33rZOzx2juH2dSni9X2bpUY8
         sQk0IAHZvYVieBp/DkSc/RRJz6gtpNx56Qv7saQU=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kXLdk-003FFr-0G; Tue, 27 Oct 2020 10:51:40 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 31/32] drm: drm_print.h: fix kernel-doc markups
Date:   Tue, 27 Oct 2020 10:51:35 +0100
Message-Id: <5b76c5625709aaaa3abee98faa620b9f3d27ff85.1603791716.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1603791716.git.mchehab+huawei@kernel.org>
References: <cover.1603791716.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

A kernel-doc markup should start with the identifier on its
first line.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 include/drm/drm_print.h | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index 1c9417430d08..f32d179e139d 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -338,7 +338,7 @@ void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
 		 const char *format, ...);
 
 /**
- * Error output.
+ * DRM_DEV_ERROR() - Error output.
  *
  * @dev: device pointer
  * @fmt: printf() like format string.
@@ -347,10 +347,12 @@ void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
 	drm_dev_printk(dev, KERN_ERR, "*ERROR* " fmt, ##__VA_ARGS__)
 
 /**
- * Rate limited error output.  Like DRM_ERROR() but won't flood the log.
+ * DRM_DEV_ERROR_RATELIMITED() - Rate limited error output.
  *
  * @dev: device pointer
  * @fmt: printf() like format string.
+ *
+ * Like DRM_ERROR() but won't flood the log.
  */
 #define DRM_DEV_ERROR_RATELIMITED(dev, fmt, ...)			\
 ({									\
@@ -375,15 +377,27 @@ void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
 })
 
 /**
- * Debug output.
+ * DRM_DEV_DEBUG() - Debug output for generic drm code
  *
  * @dev: device pointer
  * @fmt: printf() like format string.
  */
 #define DRM_DEV_DEBUG(dev, fmt, ...)					\
 	drm_dev_dbg(dev, DRM_UT_CORE, fmt, ##__VA_ARGS__)
+/**
+ * DRM_DEV_DEBUG_DRIVER() - Debug output for vendor specific part of the driver
+ *
+ * @dev: device pointer
+ * @fmt: printf() like format string.
+ */
 #define DRM_DEV_DEBUG_DRIVER(dev, fmt, ...)				\
 	drm_dev_dbg(dev, DRM_UT_DRIVER,	fmt, ##__VA_ARGS__)
+/**
+ * DRM_DEV_DEBUG_KMS() - Debug output for modesetting code
+ *
+ * @dev: device pointer
+ * @fmt: printf() like format string.
+ */
 #define DRM_DEV_DEBUG_KMS(dev, fmt, ...)				\
 	drm_dev_dbg(dev, DRM_UT_KMS, fmt, ##__VA_ARGS__)
 
-- 
2.26.2

