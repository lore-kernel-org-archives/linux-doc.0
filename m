Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 492CBC2D0E4
	for <linux-doc@archiver.kernel.org>; Fri, 27 Nov 2020 13:02:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F043D206D9
	for <linux-doc@archiver.kernel.org>; Fri, 27 Nov 2020 13:02:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726885AbgK0NBe (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 27 Nov 2020 08:01:34 -0500
Received: from www.linuxtv.org ([130.149.80.248]:36474 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728963AbgK0NBe (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 27 Nov 2020 08:01:34 -0500
Received: from mchehab by www.linuxtv.org with local (Exim 4.92)
        (envelope-from <mchehab@linuxtv.org>)
        id 1kid6Z-00CcMk-5U; Fri, 27 Nov 2020 12:44:03 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Date:   Fri, 27 Nov 2020 11:51:08 +0000
Subject: [git:media_tree/master] media: Documentation: userspace-api/media: v4l/vidioc-qbuf: drop doubled word
To:     linuxtv-commits@linuxtv.org
Cc:     linux-doc@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
        Jonathan Corbet <corbet@lwn.net>
Mail-followup-to: linux-media@vger.kernel.org
Forward-to: linux-media@vger.kernel.org
Reply-to: linux-media@vger.kernel.org
Message-Id: <E1kid6Z-00CcMk-5U@www.linuxtv.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This is an automatic generated email to let you know that the following patch were queued:

Subject: media: Documentation: userspace-api/media: v4l/vidioc-qbuf: drop doubled word
Author:  Randy Dunlap <rdunlap@infradead.org>
Date:    Sat Jul 4 01:55:36 2020 +0200

Drop the doubled word "the".

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

 Documentation/userspace-api/media/v4l/vidioc-qbuf.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

---

diff --git a/Documentation/userspace-api/media/v4l/vidioc-qbuf.rst b/Documentation/userspace-api/media/v4l/vidioc-qbuf.rst
index fbf8c5962d8a..77e0747a6d28 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-qbuf.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-qbuf.rst
@@ -163,7 +163,7 @@ EINVAL
     The buffer ``type`` is not supported, or the ``index`` is out of
     bounds, or no buffers have been allocated yet, or the ``userptr`` or
     ``length`` are invalid, or the ``V4L2_BUF_FLAG_REQUEST_FD`` flag was
-    set but the the given ``request_fd`` was invalid, or ``m.fd`` was
+    set but the given ``request_fd`` was invalid, or ``m.fd`` was
     an invalid DMABUF file descriptor.
 
 EIO
