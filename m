Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B247C64E7B
	for <linux-doc@archiver.kernel.org>; Fri, 27 Nov 2020 13:02:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6B53A206D9
	for <linux-doc@archiver.kernel.org>; Fri, 27 Nov 2020 13:02:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728963AbgK0NBm (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 27 Nov 2020 08:01:42 -0500
Received: from www.linuxtv.org ([130.149.80.248]:36488 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727859AbgK0NBl (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 27 Nov 2020 08:01:41 -0500
Received: from mchehab by www.linuxtv.org with local (Exim 4.92)
        (envelope-from <mchehab@linuxtv.org>)
        id 1kid6Z-00CcN8-93; Fri, 27 Nov 2020 12:44:03 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Date:   Fri, 27 Nov 2020 11:50:47 +0000
Subject: [git:media_tree/master] media: Documentation: userspace-api/media: dvb/video: drop doubled word
To:     linuxtv-commits@linuxtv.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Mail-followup-to: linux-media@vger.kernel.org
Forward-to: linux-media@vger.kernel.org
Reply-to: linux-media@vger.kernel.org
Message-Id: <E1kid6Z-00CcN8-93@www.linuxtv.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This is an automatic generated email to let you know that the following patch were queued:

Subject: media: Documentation: userspace-api/media: dvb/video: drop doubled word
Author:  Randy Dunlap <rdunlap@infradead.org>
Date:    Sat Jul 4 01:55:31 2020 +0200

Drop the doubled word "and".

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

 Documentation/userspace-api/media/dvb/video.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

---

diff --git a/Documentation/userspace-api/media/dvb/video.rst b/Documentation/userspace-api/media/dvb/video.rst
index 3ed1bbfb93c3..38a8d39a1d25 100644
--- a/Documentation/userspace-api/media/dvb/video.rst
+++ b/Documentation/userspace-api/media/dvb/video.rst
@@ -8,7 +8,7 @@ Digital TV Video Device
 
 The Digital TV video device controls the MPEG2 video decoder of the Digital
 TV hardware. It can be accessed through **/dev/dvb/adapter0/video0**. Data
-types and and ioctl definitions can be accessed by including
+types and ioctl definitions can be accessed by including
 **linux/dvb/video.h** in your application.
 
 Note that the Digital TV video device only controls decoding of the MPEG video
