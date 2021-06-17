Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 234E2C49361
	for <linux-doc@archiver.kernel.org>; Thu, 17 Jun 2021 20:44:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E2FA461408
	for <linux-doc@archiver.kernel.org>; Thu, 17 Jun 2021 20:44:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231815AbhFQUrB (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 17 Jun 2021 16:47:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231226AbhFQUrA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 17 Jun 2021 16:47:00 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 647AEC061574
        for <linux-doc@vger.kernel.org>; Thu, 17 Jun 2021 13:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=aHLaziIx2roUv+C+UqM4fNifK6D3E4TjbK3gKooQSwY=; b=nqhBd1ctIJc/X/VbQiq/lhJSaS
        MZczerdedDQcHDi8hHwigQpC2tZtpqujageiXZf1KcUX+oC84eK9O1RZP21D73D1e7vPeT00b7+2U
        05pBzb3VPnlopUgikGJLCNfD/8b79migAZ2AHXIQ5S8XZM387rcGxivSWwCux7ZrShCfWBn55DBkl
        AJL+B3hqjNddEcWE407psE4OdluNf3s6fO8irCtVi7i/7p2m14MkZ6q5r+HZ8rA2LtNa9cLGZsUtT
        uSE33X6+Z+/WMg2KJctbV3yQT9Y6CvQ00Vi2w7oeB+yiMldb5rF5evekvHiHc9JdRbrhry/ADT4w1
        zHX5I4MQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1ltysC-009Yr1-14; Thu, 17 Jun 2021 20:44:30 +0000
From:   "Matthew Wilcox (Oracle)" <willy@infradead.org>
To:     linux-mm@kvack.org, linux-doc@vger.kernel.org
Cc:     "Matthew Wilcox (Oracle)" <willy@infradead.org>
Subject: [PATCH 3/3] mm/doc: Include percpu documentation in html docs
Date:   Thu, 17 Jun 2021 21:43:25 +0100
Message-Id: <20210617204325.2278730-3-willy@infradead.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617204325.2278730-1-willy@infradead.org>
References: <20210617204325.2278730-1-willy@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The kernel-doc was written, but not included in the html documentation.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 Documentation/core-api/mm-api.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/core-api/mm-api.rst b/Documentation/core-api/mm-api.rst
index e46f01c4b200..89a53ac00249 100644
--- a/Documentation/core-api/mm-api.rst
+++ b/Documentation/core-api/mm-api.rst
@@ -87,6 +87,12 @@ DMA pools
 .. kernel-doc:: mm/dmapool.c
    :export:
 
+Per-CPU memory allocation
+=========================
+
+.. kernel-doc:: mm/percpu.c
+   :export:
+
 More Memory Management Functions
 ================================
 
-- 
2.30.2

