Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C4CFC43381
	for <linux-doc@archiver.kernel.org>; Mon, 25 Jan 2021 20:53:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0F5652256F
	for <linux-doc@archiver.kernel.org>; Mon, 25 Jan 2021 20:53:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732203AbhAYUnm (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 25 Jan 2021 15:43:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731555AbhAYTtf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 25 Jan 2021 14:49:35 -0500
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF5E5C061788
        for <linux-doc@vger.kernel.org>; Mon, 25 Jan 2021 11:47:57 -0800 (PST)
Received: by mail-qk1-x731.google.com with SMTP id a7so6852946qkb.13
        for <linux-doc@vger.kernel.org>; Mon, 25 Jan 2021 11:47:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=/BFgBC6QAZDKdqJwclIw/UFhagKoK9nwCvAO/0D2vSo=;
        b=CmdxkXZULQNoAHH3ACXza+mPWBw4TkEUp5gdwo9v367G5ivVreRo2jfDKVnAfklKCZ
         lj/PfZNwM9XMAgMXUnM98CEkHtoOECGI2Y0fu0q1xxQ0NEIxll/TMuaZo65GQpW2XHyU
         rIrv4ioZ4SPXFX6hExoeutaJaFN6Zu0xoA3DImi6eVCWWNdMmGSBi/p3ICAR+yl+WaeJ
         R3+LncgUE2Ls+wUl0QzLu91lk0bsnXlR1jdnsIdi+99JwLhK0a83VrLiaiiVKZqdSbG3
         1xmIOxMMElDpTxuj70785Z55JdnBzrgS5LSZRWHM+jZ0kX/7mCQz37JfMpZxQ6ziTejt
         Y3tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/BFgBC6QAZDKdqJwclIw/UFhagKoK9nwCvAO/0D2vSo=;
        b=pOuPKk2HtbUXWDsr+DYfN3IiHTkyupFNw2zjRa1aqoWU5gQcgvU0f3OR8TBo+8vx56
         Sl4BFBe0j7YsLlbirFa1FyZdUc3EHmGLj1B7Lplhqc12OY5+6d9prXWnYFHacx6X5bFL
         Y1ICPf/8wpKJLTAkmLk2fvNnIqTzxpgK/diN0vasV2ZilO1K/6ecJxFuf7R61QZqTxkr
         B2jmq34yanVLD6+vhsROnUgBjHhp/vTsjoIJ4c4r/JYAcw56j6hXseNaUOH9sAQd9o3G
         3iYSCYf6fEIHDkG5uRn9mXQvdqxRCk2M6sMAY7G4RbW0KYNzHIDfDNB4zL2rw54/6wir
         nBFA==
X-Gm-Message-State: AOAM532kA/Fk0S4RPga6enL5MSXcnnagiNZNEf+2+jr++hpjJ1FclCwW
        7/wOGpI1dg5Q3fVIc/jaakyB4A==
X-Google-Smtp-Source: ABdhPJz+Q8gL0GZ9W1lsgErCnpY5WXm31yZTxCvb9A79URsfZ1Q6xwrI2e5Q2K0QFJueffLs1BietQ==
X-Received: by 2002:a37:d58:: with SMTP id 85mr2382064qkn.280.1611604076921;
        Mon, 25 Jan 2021 11:47:56 -0800 (PST)
Received: from localhost.localdomain (c-73-69-118-222.hsd1.nh.comcast.net. [73.69.118.222])
        by smtp.gmail.com with ESMTPSA id c12sm12121569qtq.76.2021.01.25.11.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 11:47:56 -0800 (PST)
From:   Pavel Tatashin <pasha.tatashin@soleen.com>
To:     pasha.tatashin@soleen.com, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, akpm@linux-foundation.org, vbabka@suse.cz,
        mhocko@suse.com, david@redhat.com, osalvador@suse.de,
        dan.j.williams@intel.com, sashal@kernel.org,
        tyhicks@linux.microsoft.com, iamjoonsoo.kim@lge.com,
        mike.kravetz@oracle.com, rostedt@goodmis.org, mingo@redhat.com,
        jgg@ziepe.ca, peterz@infradead.org, mgorman@suse.de,
        willy@infradead.org, rientjes@google.com, jhubbard@nvidia.com,
        linux-doc@vger.kernel.org, ira.weiny@intel.com,
        linux-kselftest@vger.kernel.org, jmorris@namei.org
Subject: [PATCH v8 02/14] mm/gup: check every subpage of a compound page during isolation
Date:   Mon, 25 Jan 2021 14:47:39 -0500
Message-Id: <20210125194751.1275316-3-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210125194751.1275316-1-pasha.tatashin@soleen.com>
References: <20210125194751.1275316-1-pasha.tatashin@soleen.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

When pages are isolated in check_and_migrate_movable_pages() we skip
compound number of pages at a time. However, as Jason noted, it is
not necessary correct that pages[i] corresponds to the pages that
we skipped. This is because it is possible that the addresses in
this range had split_huge_pmd()/split_huge_pud(), and these functions
do not update the compound page metadata.

The problem can be reproduced if something like this occurs:

1. User faulted huge pages.
2. split_huge_pmd() was called for some reason
3. User has unmapped some sub-pages in the range
4. User tries to longterm pin the addresses.

The resulting pages[i] might end-up having pages which are not compound
size page aligned.

Fixes: aa712399c1e8 ("mm/gup: speed up check_and_migrate_cma_pages() on huge page")
Reported-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Pavel Tatashin <pasha.tatashin@soleen.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
---
 mm/gup.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index 24f25b1e9103..16f10d5a9eb6 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -1556,26 +1556,23 @@ static long check_and_migrate_cma_pages(struct mm_struct *mm,
 					unsigned int gup_flags)
 {
 	unsigned long i;
-	unsigned long step;
 	bool drain_allow = true;
 	bool migrate_allow = true;
 	LIST_HEAD(cma_page_list);
 	long ret = nr_pages;
+	struct page *prev_head, *head;
 	struct migration_target_control mtc = {
 		.nid = NUMA_NO_NODE,
 		.gfp_mask = GFP_USER | __GFP_NOWARN,
 	};
 
 check_again:
-	for (i = 0; i < nr_pages;) {
-
-		struct page *head = compound_head(pages[i]);
-
-		/*
-		 * gup may start from a tail page. Advance step by the left
-		 * part.
-		 */
-		step = compound_nr(head) - (pages[i] - head);
+	prev_head = NULL;
+	for (i = 0; i < nr_pages; i++) {
+		head = compound_head(pages[i]);
+		if (head == prev_head)
+			continue;
+		prev_head = head;
 		/*
 		 * If we get a page from the CMA zone, since we are going to
 		 * be pinning these entries, we might as well move them out
@@ -1599,8 +1596,6 @@ static long check_and_migrate_cma_pages(struct mm_struct *mm,
 				}
 			}
 		}
-
-		i += step;
 	}
 
 	if (!list_empty(&cma_page_list)) {
-- 
2.25.1

