Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9A9C17D981
	for <lwn-linux-doc@archive.lwn.net>; Tue,  5 Nov 2019 16:09:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390192AbfKEQI3 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 5 Nov 2019 11:08:29 -0500
Received: from mx2.rt-rk.com ([89.216.37.149]:60603 "EHLO mail.rt-rk.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390044AbfKEQI3 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 5 Nov 2019 11:08:29 -0500
Received: from localhost (localhost [127.0.0.1])
        by mail.rt-rk.com (Postfix) with ESMTP id A4BAD1A2113;
        Tue,  5 Nov 2019 16:59:40 +0100 (CET)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local [10.10.14.106])
        by mail.rt-rk.com (Postfix) with ESMTPSA id 821D81A2148;
        Tue,  5 Nov 2019 16:59:40 +0100 (CET)
From:   Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        corbet@lwn.net
Cc:     Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Subject: [PATCH 2/3] docs: ioctl: Update ioctl-number.rst ioctl ranges table preamble
Date:   Tue,  5 Nov 2019 16:59:20 +0100
Message-Id: <1572969561-17591-3-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1572969561-17591-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1572969561-17591-1-git-send-email-aleksandar.markovic@rt-rk.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>

Update introductory paragraph of ioctl ranges table.

Signed-off-by: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
---
 Documentation/ioctl/ioctl-number.rst | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/ioctl/ioctl-number.rst b/Documentation/ioctl/ioctl-number.rst
index f8768c7..799b90b 100644
--- a/Documentation/ioctl/ioctl-number.rst
+++ b/Documentation/ioctl/ioctl-number.rst
@@ -63,8 +63,10 @@ Following this convention is good because:
     code to copy the parameters between user and kernel space.
 
 This table lists ioctls visible from user land for Linux/x86.  It contains
-most drivers up to 2.6.31, but I know I am missing some.  There has been
-no attempt to list non-X86 architectures or ioctls from drivers/staging/.
+most drivers up to 2.6.31, with some updates from 5.3 kernel, but I know I
+am missing some.  There has been no attempt to list non-X86 architectures
+(except some s390 ioctls). Only some ioctls from drivers/staging/ are
+covered.
 
 ====  =====  ======================================================= ================================================================
 Code  Seq#    Include File                                           Comments
-- 
2.7.4

