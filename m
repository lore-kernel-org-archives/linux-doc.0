Return-Path: <SRS0=i7Ry=4J=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A28F8C3566F
	for <linux-doc@archiver.kernel.org>; Fri, 21 Feb 2020 22:00:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7AD54206DB
	for <linux-doc@archiver.kernel.org>; Fri, 21 Feb 2020 22:00:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="PlOw0CR8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728684AbgBUWAv (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 21 Feb 2020 17:00:51 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:54006 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728384AbgBUWAv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 21 Feb 2020 17:00:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=FW1hN29x0uVP93l527RDu/ZdBzffdMJbQ/PcTlZQETg=; b=PlOw0CR8EbJaLl2uO+5GN3XuCO
        1m9kYcfyEJ6X+9r2oJmlzWVciX5rsZuLUCvgR67AVbSWtZS0VoC5pcbeqNsyZH7ZKXsCaeJhQKmiC
        HOIUiyipePiOB1SGq9DhK+B0VZ2D6/wFDxLYdmOUuDgnJGmJo7KFbMf9u6FnIXvdi3YJGFWEOOuuh
        84CtZvmRnMrTcW9hoyivuXtTowwB/WejdhA6HAFG0koRoJ1r9i+5OR2OuLPxwTvlf+1uHIEl0a0FA
        bIQL6Jbm/wYMNAcF4H8cs3Yvxm9CpC+cHnmmK17A8+Ocr3STpNZiItF6YcX/Q6x/81nJc2WDF2boB
        ZIklrAsw==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1j5GLq-0008NV-Ow; Fri, 21 Feb 2020 22:00:50 +0000
From:   Matthew Wilcox <willy@infradead.org>
To:     linux-doc@vger.kernel.org, linux-mm@kvack.org
Cc:     "Matthew Wilcox (Oracle)" <willy@infradead.org>
Subject: [PATCH] mm: Add pagemap.h to the fine documentation
Date:   Fri, 21 Feb 2020 14:00:44 -0800
Message-Id: <20200221220045.24989-1-willy@infradead.org>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: "Matthew Wilcox (Oracle)" <willy@infradead.org>

The documentation currently does not include the deathless prose
written to describe functions in pagemap.h because it's not included
in any rst file.  Fix up the mismatches between parameter names and the
documentation and add the file to mm-api.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 Documentation/core-api/mm-api.rst | 3 +++
 include/linux/pagemap.h           | 8 ++++----
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/Documentation/core-api/mm-api.rst b/Documentation/core-api/mm-api.rst
index be726986ff75..2adffb3f7914 100644
--- a/Documentation/core-api/mm-api.rst
+++ b/Documentation/core-api/mm-api.rst
@@ -73,6 +73,9 @@ File Mapping and Page Cache
 .. kernel-doc:: mm/truncate.c
    :export:
 
+.. kernel-doc:: include/linux/pagemap.h
+   :internal:
+
 Memory pools
 ============
 
diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index ccb14b6a16b5..6462df717cff 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -33,8 +33,8 @@ enum mapping_flags {
 
 /**
  * mapping_set_error - record a writeback error in the address_space
- * @mapping - the mapping in which an error should be set
- * @error - the error to set in the mapping
+ * @mapping: the mapping in which an error should be set
+ * @error: the error to set in the mapping
  *
  * When writeback fails in some way, we must record that error so that
  * userspace can be informed when fsync and the like are called.  We endeavor
@@ -305,9 +305,9 @@ static inline struct page *find_lock_page(struct address_space *mapping,
  * atomic allocation!
  */
 static inline struct page *find_or_create_page(struct address_space *mapping,
-					pgoff_t offset, gfp_t gfp_mask)
+					pgoff_t index, gfp_t gfp_mask)
 {
-	return pagecache_get_page(mapping, offset,
+	return pagecache_get_page(mapping, index,
 					FGP_LOCK|FGP_ACCESSED|FGP_CREAT,
 					gfp_mask);
 }
-- 
2.25.0

