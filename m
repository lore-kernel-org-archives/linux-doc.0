Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B98E57DBD4
	for <lwn-linux-doc@archive.lwn.net>; Tue,  5 Nov 2019 16:09:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390125AbfKEQI3 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 5 Nov 2019 11:08:29 -0500
Received: from mx2.rt-rk.com ([89.216.37.149]:60605 "EHLO mail.rt-rk.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390166AbfKEQI3 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 5 Nov 2019 11:08:29 -0500
Received: from localhost (localhost [127.0.0.1])
        by mail.rt-rk.com (Postfix) with ESMTP id B1C621A2148;
        Tue,  5 Nov 2019 16:59:40 +0100 (CET)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local [10.10.14.106])
        by mail.rt-rk.com (Postfix) with ESMTPSA id 919FC1A215D;
        Tue,  5 Nov 2019 16:59:40 +0100 (CET)
From:   Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        corbet@lwn.net
Cc:     Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Subject: [PATCH 3/3] docs: ioctl: Update ioctl-number.rst 'last updated' date
Date:   Tue,  5 Nov 2019 16:59:21 +0100
Message-Id: <1572969561-17591-4-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1572969561-17591-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1572969561-17591-1-git-send-email-aleksandar.markovic@rt-rk.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>

Update info on the date of the last update of ioctl-number.rst.

Signed-off-by: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
---
 Documentation/ioctl/ioctl-number.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/ioctl/ioctl-number.rst b/Documentation/ioctl/ioctl-number.rst
index 799b90b..f501467 100644
--- a/Documentation/ioctl/ioctl-number.rst
+++ b/Documentation/ioctl/ioctl-number.rst
@@ -2,7 +2,7 @@
 Ioctl Numbers
 =============
 
-19 October 1999
+Last update: 5th November, 2019
 
 Michael Elizabeth Chastain
 <mec@shout.net>
-- 
2.7.4

