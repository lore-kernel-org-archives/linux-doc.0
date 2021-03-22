Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C771DC433C1
	for <linux-doc@archiver.kernel.org>; Mon, 22 Mar 2021 19:53:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 921F961477
	for <linux-doc@archiver.kernel.org>; Mon, 22 Mar 2021 19:53:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230337AbhCVTxL (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 22 Mar 2021 15:53:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229884AbhCVTwk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 22 Mar 2021 15:52:40 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A6F8C061574
        for <linux-doc@vger.kernel.org>; Mon, 22 Mar 2021 12:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=p/Nkq+YXtzDNG75Fdomi39g4jkuM3XR6NmOhaBFJ2jQ=; b=H6Tg8fZuvvp7WPeRTPiWEY7b+4
        uHzG/41jdjIOU3UW38CJiW264/QpXqUWta5g4cBC6IEvIcow/E9NaqngGmrlyVbLW9YcKUcfps2Qd
        rgZahmgoUYVshZfk4FCog3VAhDgAYoqm1HJDFmu61h48TOJi/UETlvxYwQ69ieG7hopS8RCM/fIb7
        GXB9bqk4YJ5epuR9BhVlym4+KTeqQEmfAV95zwnm+zyThlgs9oV4jNPCbOhkWw/LewoQRo5c1Ifif
        0OFLzi9VbN6XcrksioHmMlsmHOw7qnuUaizehCRmNoN/YpDXVA8NuqIf4QSEyoJIH+LhWoPK7RbEN
        lUQ9PMIw==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat Linux))
        id 1lOQaC-008zjO-Mw; Mon, 22 Mar 2021 19:51:41 +0000
From:   "Matthew Wilcox (Oracle)" <willy@infradead.org>
To:     linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>
Cc:     "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        linux-doc@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>,
        Mike Rapoport <rppt@linux.ibm.com>
Subject: [PATCH 3/4] mm/doc: Turn fault flags into an enum
Date:   Mon, 22 Mar 2021 19:50:21 +0000
Message-Id: <20210322195022.2143603-3-willy@infradead.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210322195022.2143603-1-willy@infradead.org>
References: <20210322195022.2143603-1-willy@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The kernel-doc script complains about
./include/linux/mm.h:425: warning: wrong kernel-doc identifier on line:
 * Fault flag definitions.

I don't know how to document a series of #defines, so turn these
definitions into an enum and document that instead.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 include/linux/mm.h | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 96e5ceffce09..58df4027dd4d 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -429,8 +429,7 @@ extern unsigned int kobjsize(const void *objp);
 extern pgprot_t protection_map[16];
 
 /**
- * Fault flag definitions.
- *
+ * enum fault_flag - Fault flag definitions.
  * @FAULT_FLAG_WRITE: Fault was a write fault.
  * @FAULT_FLAG_MKWRITE: Fault was mkwrite of existing PTE.
  * @FAULT_FLAG_ALLOW_RETRY: Allow to retry the fault if blocked.
@@ -461,16 +460,18 @@ extern pgprot_t protection_map[16];
  * signals before a retry to make sure the continuous page faults can still be
  * interrupted if necessary.
  */
-#define FAULT_FLAG_WRITE			0x01
-#define FAULT_FLAG_MKWRITE			0x02
-#define FAULT_FLAG_ALLOW_RETRY			0x04
-#define FAULT_FLAG_RETRY_NOWAIT			0x08
-#define FAULT_FLAG_KILLABLE			0x10
-#define FAULT_FLAG_TRIED			0x20
-#define FAULT_FLAG_USER				0x40
-#define FAULT_FLAG_REMOTE			0x80
-#define FAULT_FLAG_INSTRUCTION  		0x100
-#define FAULT_FLAG_INTERRUPTIBLE		0x200
+enum fault_flag {
+	FAULT_FLAG_WRITE =		1 << 0,
+	FAULT_FLAG_MKWRITE =		1 << 1,
+	FAULT_FLAG_ALLOW_RETRY =	1 << 2,
+	FAULT_FLAG_RETRY_NOWAIT = 	1 << 3,
+	FAULT_FLAG_KILLABLE =		1 << 4,
+	FAULT_FLAG_TRIED = 		1 << 5,
+	FAULT_FLAG_USER =		1 << 6,
+	FAULT_FLAG_REMOTE =		1 << 7,
+	FAULT_FLAG_INSTRUCTION =	1 << 8,
+	FAULT_FLAG_INTERRUPTIBLE =	1 << 9,
+};
 
 /*
  * The default fault flags that should be used by most of the
@@ -493,7 +494,7 @@ extern pgprot_t protection_map[16];
  * Return: true if the page fault allows retry and this is the first
  * attempt of the fault handling; false otherwise.
  */
-static inline bool fault_flag_allow_retry_first(unsigned int flags)
+static inline bool fault_flag_allow_retry_first(enum fault_flag flags)
 {
 	return (flags & FAULT_FLAG_ALLOW_RETRY) &&
 	    (!(flags & FAULT_FLAG_TRIED));
@@ -528,7 +529,7 @@ struct vm_fault {
 		pgoff_t pgoff;			/* Logical page offset based on vma */
 		unsigned long address;		/* Faulting virtual address */
 	};
-	unsigned int flags;		/* FAULT_FLAG_xxx flags
+	enum fault_flag flags;		/* FAULT_FLAG_xxx flags
 					 * XXX: should really be 'const' */
 	pmd_t *pmd;			/* Pointer to pmd entry matching
 					 * the 'address' */
-- 
2.30.2

