Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 219DE7D043
	for <lwn-linux-doc@archive.lwn.net>; Thu, 31 May 2018 16:22:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1755685AbeEaQWi (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 31 May 2018 12:22:38 -0400
Received: from mail.netline.ch ([148.251.143.178]:37520 "EHLO
        netline-mail3.netline.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755673AbeEaQWd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 31 May 2018 12:22:33 -0400
X-Greylist: delayed 322 seconds by postgrey-1.27 at vger.kernel.org; Thu, 31 May 2018 12:22:33 EDT
Received: from localhost (localhost [127.0.0.1])
        by netline-mail3.netline.ch (Postfix) with ESMTP id EF5952A6049;
        Thu, 31 May 2018 18:17:09 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
        by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
        with LMTP id Kn8f05rIZ4Vt; Thu, 31 May 2018 18:17:09 +0200 (CEST)
Received: from kaveri (252.228.127.176.dynamic.wline.res.cust.swisscom.ch [176.127.228.252])
        by netline-mail3.netline.ch (Postfix) with ESMTPSA id 3DD992A6046;
        Thu, 31 May 2018 18:17:09 +0200 (CEST)
Received: from daenzer by kaveri with local (Exim 4.91)
        (envelope-from <michel@daenzer.net>)
        id 1fOQGC-0001Xq-DP; Thu, 31 May 2018 18:17:08 +0200
From:   =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>
To:     amd-gfx@lists.freedesktop.org
Cc:     Jonathan Corbet <corbet@lwn.net>, dri-devel@lists.freedesktop.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] drm/doc: Add a label for the PRIME Buffer Sharing chapter
Date:   Thu, 31 May 2018 18:17:06 +0200
Message-Id: <20180531161708.5894-1-michel@daenzer.net>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Michel Dänzer <michel.daenzer@amd.com>

So that it can be referenced from e.g. DOC comments.

Signed-off-by: Michel Dänzer <michel.daenzer@amd.com>
---
 Documentation/gpu/drm-mm.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
index 96ebcc2a7b41..21b6b72a9ba8 100644
--- a/Documentation/gpu/drm-mm.rst
+++ b/Documentation/gpu/drm-mm.rst
@@ -395,6 +395,8 @@ VMA Offset Manager
 .. kernel-doc:: drivers/gpu/drm/drm_vma_manager.c
    :export:
 
+.. _prime_buffer_sharing:
+
 PRIME Buffer Sharing
 ====================
 
-- 
2.17.0

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
