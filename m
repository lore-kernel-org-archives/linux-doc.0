Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 756EBC433C1
	for <linux-doc@archiver.kernel.org>; Mon, 22 Mar 2021 19:52:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2BBE261972
	for <linux-doc@archiver.kernel.org>; Mon, 22 Mar 2021 19:52:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232294AbhCVTwH (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 22 Mar 2021 15:52:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232329AbhCVTwC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 22 Mar 2021 15:52:02 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1490C061574
        for <linux-doc@vger.kernel.org>; Mon, 22 Mar 2021 12:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=kayJ76bq4gw4z85XDXR+VShQ1uEIV81RDNzYH2iF6+I=; b=iuT60PW44BD0x4g+1NLe1/YNFP
        VUDOwZHpIfnuNk3EVEy7OIOu1GlJknr+QHAYCiWpqdRCAgs9u4YcuipkOX1MC8oaFCCFD4rEvTK6U
        nlGc146ZQJCyrgrywSyVW1jgLEyqCnIt6WGmKit/b/Zclexi7FwfQnjlrkI31w4gJkZUE+VH0+k+X
        6Oc1O0WJ4nqL2NkbjWdZeHvLHmMo0k3dB5DST9cPA6j++BrtDkiBoQc9drJhPzJAnFqlUbw8rkc6s
        ZOWjnaii//D1DBnpHYFTTKvmPLyotw4Yjijm+u2gaSFZKcSOHmDB6LKPDQY4Xq0Spy7jN0t05enQ+
        FCpD+muQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat Linux))
        id 1lOQZg-008zi7-99; Mon, 22 Mar 2021 19:50:57 +0000
From:   "Matthew Wilcox (Oracle)" <willy@infradead.org>
To:     linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>
Cc:     "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        linux-doc@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>,
        Mike Rapoport <rppt@linux.ibm.com>
Subject: [PATCH 2/4] mm/doc: Fix page_maybe_dma_pinned kerneldoc
Date:   Mon, 22 Mar 2021 19:50:20 +0000
Message-Id: <20210322195022.2143603-2-willy@infradead.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210322195022.2143603-1-willy@infradead.org>
References: <20210322195022.2143603-1-willy@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

make htmldocs reports:

./include/linux/mm.h:1341: warning: Excess function parameter 'Return' description in 'page_maybe_dma_pinned'

Fix a few other formatting nits while I'm editing this description.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 include/linux/mm.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 9c149e945bf9..96e5ceffce09 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1273,10 +1273,11 @@ void unpin_user_page_range_dirty_lock(struct page *page, unsigned long npages,
 void unpin_user_pages(struct page **pages, unsigned long npages);
 
 /**
- * page_maybe_dma_pinned() - report if a page is pinned for DMA.
+ * page_maybe_dma_pinned - Report if a page is pinned for DMA.
+ * @page: The page.
  *
  * This function checks if a page has been pinned via a call to
- * pin_user_pages*().
+ * a function in the pin_user_pages() family.
  *
  * For non-huge pages, the return value is partially fuzzy: false is not fuzzy,
  * because it means "definitely not pinned for DMA", but true means "probably
@@ -1294,9 +1295,8 @@ void unpin_user_pages(struct page **pages, unsigned long npages);
  *
  * For more information, please see Documentation/core-api/pin_user_pages.rst.
  *
- * @page:	pointer to page to be queried.
- * @Return:	True, if it is likely that the page has been "dma-pinned".
- *		False, if the page is definitely not dma-pinned.
+ * Return: True, if it is likely that the page has been "dma-pinned".
+ * False, if the page is definitely not dma-pinned.
  */
 static inline bool page_maybe_dma_pinned(struct page *page)
 {
-- 
2.30.2

