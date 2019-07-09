Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3F2F77DD29
	for <lwn-linux-doc@archive.lwn.net>; Tue,  9 Jul 2019 18:34:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728080AbfGISde (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 9 Jul 2019 14:33:34 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:57008 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729349AbfGISdd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 9 Jul 2019 14:33:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=/3X5BqPb3a1Kn6DP28s3SMqgBjBdt2wUeFKFEkKZCkQ=; b=aOfnADdnpUDttNTCPiXNLmlLlz
        ctTcamkRN3H6Pu1l5OCKd9t2FwGuByETS3FA6xiA5YV1PsnuEzPs5imOTzRPbrnapYY+8L4s3+0rQ
        8KNOhtD74Iqso9uqTzCLOZJSZ5s6WLz0XjertyVm+N6I+0IpQqTsj/6qyUHXQwpvXz5lvGIXvOOGV
        1p3FnMiqwUy5CNczqUogjGPI7/q4BGKSlcocZL37JQJTE0/WUwDmyTfg5t3R5wdp+7YcRYu53iLPY
        57bySD8/9JdVboO/YQHPl9QCIweWfqRHLTprEZbAMCFa6FOnWnQ9awV2kECd/qWATP3JAWgzAIVOJ
        MFbguM2g==;
Received: from 177.43.30.58.dynamic.adsl.gvt.net.br ([177.43.30.58] helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hkuvf-0007Av-Bj; Tue, 09 Jul 2019 18:33:27 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1hkuvd-0005Pt-66; Tue, 09 Jul 2019 15:33:25 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, Jens Axboe <axboe@kernel.dk>,
        Hannes Reinecke <hare@suse.com>,
        Omar Sandoval <osandov@fb.com>, linux-doc@vger.kernel.org
Subject: [PATCH 3/5] docs: block: fix pdf output
Date:   Tue,  9 Jul 2019 15:33:21 -0300
Message-Id: <d310f0aa097cd3df3f7dc1862c7c0456254409ec.1562696797.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1562696797.git.mchehab+samsung@kernel.org>
References: <cover.1562696797.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add an extra blank line and use a markup for the enumberated
list, in order to make it possible to build the block book
on pdf format.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 Documentation/block/biodoc.rst | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/Documentation/block/biodoc.rst b/Documentation/block/biodoc.rst
index d6e30b680405..c8eb28401332 100644
--- a/Documentation/block/biodoc.rst
+++ b/Documentation/block/biodoc.rst
@@ -9,6 +9,7 @@ Notes on the Generic Block Layer Rewrite in Linux 2.5
 	here might still be useful.
 
 Notes Written on Jan 15, 2002:
+
 	- Jens Axboe <jens.axboe@oracle.com>
 	- Suparna Bhattacharya <suparna@in.ibm.com>
 
@@ -172,8 +173,8 @@ Some new queue property settings:
 
 New queue flags:
 
-	QUEUE_FLAG_CLUSTER (see 3.2.2)
-	QUEUE_FLAG_QUEUED (see 3.2.4)
+	- QUEUE_FLAG_CLUSTER (see 3.2.2)
+	- QUEUE_FLAG_QUEUED (see 3.2.4)
 
 
 ii. High-mem i/o capabilities are now considered the default
@@ -478,7 +479,7 @@ With this multipage bio design:
 - Splitting of an i/o request across multiple devices (as in the case of
   lvm or raid) is achieved by cloning the bio (where the clone points to
   the same bi_io_vec array, but with the index and size accordingly modified)
-- A linked list of bios is used as before for unrelated merges [*]_ - this
+- A linked list of bios is used as before for unrelated merges [#]_ - this
   avoids reallocs and makes independent completions easier to handle.
 - Code that traverses the req list can find all the segments of a bio
   by using rq_for_each_segment.  This handles the fact that a request
@@ -489,7 +490,7 @@ With this multipage bio design:
   [TBD: Should preferably also have a bi_voffset and bi_vlen to avoid modifying
   bi_offset an len fields]
 
-.. [*]
+.. [#]
 
 	unrelated merges -- a request ends up containing two or more bios that
 	didn't originate from the same place.
-- 
2.21.0

