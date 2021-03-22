Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E090C433E0
	for <linux-doc@archiver.kernel.org>; Mon, 22 Mar 2021 19:54:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EE01B6198E
	for <linux-doc@archiver.kernel.org>; Mon, 22 Mar 2021 19:54:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230016AbhCVTxn (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 22 Mar 2021 15:53:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230167AbhCVTx0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 22 Mar 2021 15:53:26 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF734C061574
        for <linux-doc@vger.kernel.org>; Mon, 22 Mar 2021 12:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=0C3/ykYRFKokUEKwEXxBMoSu2pgV2JtyhEWH6NBEzHI=; b=bJtc/+N7mVHi4c6Ri/wYSL5q/w
        gfnQB4HOWGclWTVSqQ5oB81C0liHfYpA0km8u7ilNGDVeOSn/mXXbfQFv5J34sYKqnlP7gyOQQwPM
        qrPCzsx8YcU+kbDE0u+0BvbhjLxWTax7bR3rjSigM9O4elvddnA3FIh1XiHZnwEv4EJ0RuTxx3pAU
        9zD4DJloc1KArQg8vDjKFAE7nKBCbJgrbisKoVPv+UL8batHF/+/HOCzBbHr5NBVXQ2lQAuWzYnDF
        qIwF3APhi2SWW6zqXYEzuMKSgiZ7lDbfCutUcyBjgIoHVUFJmMRpwceZeopBApf3bR/CUtClOjpVZ
        EH7vDZjQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat Linux))
        id 1lOQaw-008zlX-5W; Mon, 22 Mar 2021 19:52:18 +0000
From:   "Matthew Wilcox (Oracle)" <willy@infradead.org>
To:     linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>
Cc:     "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        linux-doc@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>,
        Mike Rapoport <rppt@linux.ibm.com>
Subject: [PATCH 4/4] mm/doc: Add mm.h and mm_types.h to the mm-api document
Date:   Mon, 22 Mar 2021 19:50:22 +0000
Message-Id: <20210322195022.2143603-4-willy@infradead.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210322195022.2143603-1-willy@infradead.org>
References: <20210322195022.2143603-1-willy@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

kerneldoc in include/linux/mm.h and include/linux/mm_types.h wasn't
being included in the html build.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 Documentation/core-api/mm-api.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/core-api/mm-api.rst b/Documentation/core-api/mm-api.rst
index 874ae1250258..34f46df91a8b 100644
--- a/Documentation/core-api/mm-api.rst
+++ b/Documentation/core-api/mm-api.rst
@@ -93,3 +93,7 @@ More Memory Management Functions
 
 .. kernel-doc:: mm/page_alloc.c
 .. kernel-doc:: mm/mempolicy.c
+.. kernel-doc:: include/linux/mm_types.h
+   :internal:
+.. kernel-doc:: include/linux/mm.h
+   :internal:
-- 
2.30.2

