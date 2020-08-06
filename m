Return-Path: <SRS0=qlPG=BQ=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5066FC433E0
	for <linux-doc@archiver.kernel.org>; Thu,  6 Aug 2020 23:25:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5F4CD2075A
	for <linux-doc@archiver.kernel.org>; Thu,  6 Aug 2020 23:25:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726071AbgHFXZX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 6 Aug 2020 19:25:23 -0400
Received: from agw3.byu.edu ([128.187.16.187]:41576 "EHLO agw3.byu.edu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725927AbgHFXZX (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 6 Aug 2020 19:25:23 -0400
X-Greylist: delayed 341 seconds by postgrey-1.27 at vger.kernel.org; Thu, 06 Aug 2020 19:25:23 EDT
Received: from cangw2.byu.edu (cangw2.byu.edu [10.18.21.142])
        by agw3.byu.edu (Postfix) with ESMTPS id 1B4FE1AC23;
        Thu,  6 Aug 2020 17:19:42 -0600 (MDT)
Received: from mail2.fsl.byu.edu (mail2.rc.byu.edu [128.187.49.32])
        by cangw2.byu.edu (8.15.2/8.15.2/Debian-8) with ESMTPS id 076NJeaf027997
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Thu, 6 Aug 2020 17:19:41 -0600
Received: from localhost.localdomain (unknown [166.70.219.28])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail2.fsl.byu.edu (Postfix) with ESMTPSA id 3B5303F2D9;
        Thu,  6 Aug 2020 17:19:40 -0600 (MDT)
From:   Billy Wilson <billy_wilson@byu.edu>
To:     linux-doc@vger.kernel.org
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Billy Wilson <billy_wilson@byu.edu>
Subject: [PATCH] docs: Correct the release date of 5.2 stable
Date:   Thu,  6 Aug 2020 17:17:54 -0600
Message-Id: <20200806231754.7735-1-billy_wilson@byu.edu>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Bayes-Prob: 0.0001 (Score -1, tokens from: Outbound, byu-edu:default, base:default, @@RPTN)
X-CanIt-Geo: ip=128.187.49.32; country=US; region=Utah; city=Provo; latitude=40.2329; longitude=-111.6688; http://maps.google.com/maps?q=40.2329,-111.6688&z=6
X-CanItPRO-Stream: byu-edu:Outbound (inherits from byu-edu:default,base:default)
X-Canit-Stats-ID: 093cnjEBU - d9261ccc6c9d - 20200806
X-Scanned-By: CanIt (www . roaringpenguin . com)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

A table lists the 5.2 stable release date as September 15, but it was
released on July 7. This may confuse a reader who is trying to
understand the stable update release cycle.

Signed-off-by: Billy Wilson <billy_wilson@byu.edu>
---
 Documentation/process/2.Process.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/process/2.Process.rst b/Documentation/process/2.Process.rst
index 3588f48841eb..4ae1e0f600c1 100644
--- a/Documentation/process/2.Process.rst
+++ b/Documentation/process/2.Process.rst
@@ -113,7 +113,7 @@ than one development cycle past their initial release. So, for example, the
 5.2 kernel's history looked like this (all dates in 2019):
 
 	==============  ===============================
-	September 15 	5.2 stable release
+	July 7		5.2 stable release
 	July 14		5.2.1
 	July 21		5.2.2
 	July 26		5.2.3
-- 
2.28.0

