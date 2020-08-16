Return-Path: <SRS0=fMDX=B2=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75F17C433DF
	for <linux-doc@archiver.kernel.org>; Sun, 16 Aug 2020 23:47:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4CD6E20704
	for <linux-doc@archiver.kernel.org>; Sun, 16 Aug 2020 23:47:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="lN83Phis"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726357AbgHPXrU (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 16 Aug 2020 19:47:20 -0400
Received: from mr85p00im-zteg06011601.me.com ([17.58.23.186]:37818 "EHLO
        mr85p00im-zteg06011601.me.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725967AbgHPXrU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 16 Aug 2020 19:47:20 -0400
X-Greylist: delayed 518 seconds by postgrey-1.27 at vger.kernel.org; Sun, 16 Aug 2020 19:47:20 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
        s=1a1hai; t=1597621121;
        bh=0WGo9Fa1CNGfjYqptFUkfrDLq3vy/cE3uOW+6wxXLyE=;
        h=From:To:Subject:Date:Message-Id:MIME-Version;
        b=lN83Phise2ueDc9UtEoaLhmbpuD86pxwxRSLy54ptftXG4Ywue6Gm/aDDbWnSWIyu
         NhWH3mMVelcrsLZYc1iQPXF214U0dNGGg7w5k90mKj10UJ6cpbmEFsDYIzLzqLaocC
         VlMtPm7VsROc4r8EujLvB0NOE0fcAgiywxgc2cuLKu4p3SNu32X9QG/NBgok2S8b5B
         aV08XBMYrZQcqKoGj7nXITo602C53sWsHgX73uIzEXKz0Ckiv8MdzN4BEa11qZ5F1b
         x3JQBmDuhQgV9TMfxJAoqwZJqCQ/Ix7gcK3O60IsnzQY1+HSKzAjFWHZkiXdwuRDSP
         weLUOfbHXuNAA==
Received: from tbodt-pro.local.net (99-130-36-163.lightspeed.frokca.sbcglobal.net [99.130.36.163])
        by mr85p00im-zteg06011601.me.com (Postfix) with ESMTPSA id 99DBA920814;
        Sun, 16 Aug 2020 23:38:41 +0000 (UTC)
From:   Theodore Dubois <tblodt@icloud.com>
To:     linux-doc@vger.kernel.org
Cc:     corbet@lwn.net, Theodore Dubois <tblodt@icloud.com>
Subject: [PATCH] devices.txt: fix typo of "ubd" as "udb"
Date:   Sun, 16 Aug 2020 16:38:23 -0700
Message-Id: <20200816233823.86316-1-tblodt@icloud.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-08-16_12:2020-08-14,2020-08-16 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011 mlxscore=0
 mlxlogscore=867 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-2004280000 definitions=main-2008160197
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Signed-off-by: Theodore Dubois <tblodt@icloud.com>
---
 Documentation/admin-guide/devices.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/devices.txt b/Documentation/admin-guide/devices.txt
index 2a97aaec8b12..ee05cb38e696 100644
--- a/Documentation/admin-guide/devices.txt
+++ b/Documentation/admin-guide/devices.txt
@@ -1661,7 +1661,7 @@
 
   98 block	User-mode virtual block device
 		  0 = /dev/ubda		First user-mode block device
-		 16 = /dev/udbb		Second user-mode block device
+		 16 = /dev/ubdb		Second user-mode block device
 		    ...
 
 		Partitions are handled in the same way as for IDE
-- 
2.24.1

