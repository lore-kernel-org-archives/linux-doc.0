Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D5ACC63798
	for <linux-doc@archiver.kernel.org>; Fri, 27 Nov 2020 13:01:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 50447206D9
	for <linux-doc@archiver.kernel.org>; Fri, 27 Nov 2020 13:01:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729055AbgK0NBY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 27 Nov 2020 08:01:24 -0500
Received: from www.linuxtv.org ([130.149.80.248]:36454 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728963AbgK0NBY (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 27 Nov 2020 08:01:24 -0500
Received: from mchehab by www.linuxtv.org with local (Exim 4.92)
        (envelope-from <mchehab@linuxtv.org>)
        id 1kid6Y-00CcLa-UU; Fri, 27 Nov 2020 12:44:02 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Date:   Fri, 27 Nov 2020 11:52:20 +0000
Subject: [git:media_tree/master] media: Documentation: userspace-api/media: v4l/selection-api-config: drop doubled word
To:     linuxtv-commits@linuxtv.org
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org
Mail-followup-to: linux-media@vger.kernel.org
Forward-to: linux-media@vger.kernel.org
Reply-to: linux-media@vger.kernel.org
Message-Id: <E1kid6Y-00CcLa-UU@www.linuxtv.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This is an automatic generated email to let you know that the following patch were queued:

Subject: media: Documentation: userspace-api/media: v4l/selection-api-config: drop doubled word
Author:  Randy Dunlap <rdunlap@infradead.org>
Date:    Sat Jul 4 01:55:33 2020 +0200

Drop the doubled word "in".

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

 Documentation/userspace-api/media/v4l/selection-api-configuration.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

---

diff --git a/Documentation/userspace-api/media/v4l/selection-api-configuration.rst b/Documentation/userspace-api/media/v4l/selection-api-configuration.rst
index 37617eda2fa6..fee49bf1a1c0 100644
--- a/Documentation/userspace-api/media/v4l/selection-api-configuration.rst
+++ b/Documentation/userspace-api/media/v4l/selection-api-configuration.rst
@@ -94,7 +94,7 @@ specified using :ref:`VIDIOC_S_FMT <VIDIOC_G_FMT>` ioctl.
 
 The top left corner, width and height of the source rectangle, that is
 the area from which image date are processed by the hardware, is given
-by the ``V4L2_SEL_TGT_CROP``. Its coordinates are expressed in in the
+by the ``V4L2_SEL_TGT_CROP``. Its coordinates are expressed in the
 same coordinate system as the bounds rectangle. The active cropping area
 must lie completely inside the crop boundaries and the driver may
 further adjust the requested size and/or position according to hardware
