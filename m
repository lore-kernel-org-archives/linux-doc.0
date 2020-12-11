Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1FCDC4361B
	for <linux-doc@archiver.kernel.org>; Fri, 11 Dec 2020 21:26:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 49BC52409B
	for <linux-doc@archiver.kernel.org>; Fri, 11 Dec 2020 21:26:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394393AbgLKUXM (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 11 Dec 2020 15:23:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394154AbgLKUXE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 11 Dec 2020 15:23:04 -0500
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com [IPv6:2607:f8b0:4864:20::f43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DD53C0617B0
        for <linux-doc@vger.kernel.org>; Fri, 11 Dec 2020 12:21:50 -0800 (PST)
Received: by mail-qv1-xf43.google.com with SMTP id d11so4811506qvo.11
        for <linux-doc@vger.kernel.org>; Fri, 11 Dec 2020 12:21:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=t05CqHIlXP0OR2TlEeNfvovOjUdJXSb7qOKVVzDYFcA=;
        b=gC3VqWF2dqyBIJ4/CZ2fr2C8ptOj6DeaRWXAI75omk7t9oOIeJ+spMyLSqL8FfkZ+X
         3lFGo24eAsPsEi1POcVl5lcjbF7vBWloFQOg5AIVApV9W+bgTGaIa2gvx6qJlECT8DVB
         LirOa8cUvi0IXPjjgs4geBdCtkAHRt4Z3myuyUutSpgL9ngDShfQ25KuVCEST11rw0UB
         wVsN0yoTSrZ/70RByUrF3NcSrmrZeTSEKkWwqEd+MKc11a4PhBiP5IKh5AIvBslZO2ij
         06ZEcdf+SpCIxGSehv1VYDwIDEjp2bERkY6/xf5qoNHKkclsJdCYpwVrJ6qF2m37xusp
         9W6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=t05CqHIlXP0OR2TlEeNfvovOjUdJXSb7qOKVVzDYFcA=;
        b=tTmY+zIYCnXuwkx7lxpI/F6Tb/ScZxcmwc/f4PxJ/mZDSxNpD80unams07NO2cmpa0
         G0/aSepjSaV8zZ0XbQSS1yL0T413BA7kONeRzkbDgy8Jdktl8XW4LYHIicFC6ZBlkgNx
         01dfbiGOX8nSb2J/Wh5/kD/ahu487B+1DamMSZpglbZm2+1fOvcXdc3PPzHzX1vvgsmQ
         ov2ZQniP6MBV187n9Z47g1HA5wzmCXhTKNIrGrth/xmNdwetK8GJ+RXamwfJEQIRBXqd
         RoK4l7Jx25VTnDfCDz++pmOagRi9oxAkj2aAF7jWcOw4o/xRB4GE9fAKe4o1VOlRTrPU
         NqRw==
X-Gm-Message-State: AOAM532HLdouMOPjK4/LEcTV5Ya+fnCRFh+EvWAFCrRozsQQWDfWvTd+
        +J6ssjVN/4yL7qlMOkrzUkzAAg==
X-Google-Smtp-Source: ABdhPJzu6upnB3D5SUtpRcpp8uvfrwWIABh8+bKd3FL/FUipRxlWKEK06r0aFJBUQYxBIErihsu5gg==
X-Received: by 2002:ad4:4052:: with SMTP id r18mr17462828qvp.38.1607718109647;
        Fri, 11 Dec 2020 12:21:49 -0800 (PST)
Received: from localhost.localdomain (c-73-69-118-222.hsd1.nh.comcast.net. [73.69.118.222])
        by smtp.gmail.com with ESMTPSA id y192sm8514455qkb.12.2020.12.11.12.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Dec 2020 12:21:49 -0800 (PST)
From:   Pavel Tatashin <pasha.tatashin@soleen.com>
To:     pasha.tatashin@soleen.com, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, akpm@linux-foundation.org, vbabka@suse.cz,
        mhocko@suse.com, david@redhat.com, osalvador@suse.de,
        dan.j.williams@intel.com, sashal@kernel.org,
        tyhicks@linux.microsoft.com, iamjoonsoo.kim@lge.com,
        mike.kravetz@oracle.com, rostedt@goodmis.org, mingo@redhat.com,
        jgg@ziepe.ca, peterz@infradead.org, mgorman@suse.de,
        willy@infradead.org, rientjes@google.com, jhubbard@nvidia.com,
        linux-doc@vger.kernel.org
Subject: [PATCH v3 4/6] mm: honor PF_MEMALLOC_PIN for all movable pages
Date:   Fri, 11 Dec 2020 15:21:38 -0500
Message-Id: <20201211202140.396852-5-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201211202140.396852-1-pasha.tatashin@soleen.com>
References: <20201211202140.396852-1-pasha.tatashin@soleen.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

PF_MEMALLOC_PIN is only honored for CMA pages, extend
this flag to work for any allocations from ZONE_MOVABLE by removing
__GFP_MOVABLE from gfp_mask when this flag is passed in the current
context.

Add is_pinnable_page() to return true if page is in a pinnable page.
A pinnable page is not in ZONE_MOVABLE and not of MIGRATE_CMA type.

Signed-off-by: Pavel Tatashin <pasha.tatashin@soleen.com>
---
 include/linux/mm.h       | 11 +++++++++++
 include/linux/sched/mm.h |  6 +++++-
 mm/hugetlb.c             |  2 +-
 mm/page_alloc.c          | 19 ++++++++-----------
 4 files changed, 25 insertions(+), 13 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 5299b90a6c40..51b3090dd072 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1109,6 +1109,17 @@ static inline bool is_zone_device_page(const struct page *page)
 }
 #endif
 
+static inline bool is_zone_movable_page(const struct page *page)
+{
+	return page_zonenum(page) == ZONE_MOVABLE;
+}
+
+/* MIGRATE_CMA and ZONE_MOVABLE do not allow pin pages */
+static inline bool is_pinnable_page(struct page *page)
+{
+	return !is_zone_movable_page(page) && !is_migrate_cma_page(page);
+}
+
 #ifdef CONFIG_DEV_PAGEMAP_OPS
 void free_devmap_managed_page(struct page *page);
 DECLARE_STATIC_KEY_FALSE(devmap_managed_key);
diff --git a/include/linux/sched/mm.h b/include/linux/sched/mm.h
index 5f4dd3274734..a55277b0d475 100644
--- a/include/linux/sched/mm.h
+++ b/include/linux/sched/mm.h
@@ -150,12 +150,13 @@ static inline bool in_vfork(struct task_struct *tsk)
  * Applies per-task gfp context to the given allocation flags.
  * PF_MEMALLOC_NOIO implies GFP_NOIO
  * PF_MEMALLOC_NOFS implies GFP_NOFS
+ * PF_MEMALLOC_PIN  implies !GFP_MOVABLE
  */
 static inline gfp_t current_gfp_context(gfp_t flags)
 {
 	unsigned int pflags = READ_ONCE(current->flags);
 
-	if (unlikely(pflags & (PF_MEMALLOC_NOIO | PF_MEMALLOC_NOFS))) {
+	if (unlikely(pflags & (PF_MEMALLOC_NOIO | PF_MEMALLOC_NOFS | PF_MEMALLOC_PIN))) {
 		/*
 		 * NOIO implies both NOIO and NOFS and it is a weaker context
 		 * so always make sure it makes precedence
@@ -164,6 +165,9 @@ static inline gfp_t current_gfp_context(gfp_t flags)
 			flags &= ~(__GFP_IO | __GFP_FS);
 		else if (pflags & PF_MEMALLOC_NOFS)
 			flags &= ~__GFP_FS;
+
+		if (pflags & PF_MEMALLOC_PIN)
+			flags &= ~__GFP_MOVABLE;
 	}
 	return flags;
 }
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 012246234eb5..b170ef2e04f5 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -1036,7 +1036,7 @@ static struct page *dequeue_huge_page_node_exact(struct hstate *h, int nid)
 	bool pin = !!(current->flags & PF_MEMALLOC_PIN);
 
 	list_for_each_entry(page, &h->hugepage_freelists[nid], lru) {
-		if (pin && is_migrate_cma_page(page))
+		if (pin && !is_pinnable_page(page))
 			continue;
 
 		if (PageHWPoison(page))
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index c2dea9ad0e98..4d8e7f801c66 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -3802,16 +3802,12 @@ alloc_flags_nofragment(struct zone *zone, gfp_t gfp_mask)
 	return alloc_flags;
 }
 
-static inline unsigned int current_alloc_flags(gfp_t gfp_mask,
-					unsigned int alloc_flags)
+static inline unsigned int cma_alloc_flags(gfp_t gfp_mask,
+					   unsigned int alloc_flags)
 {
 #ifdef CONFIG_CMA
-	unsigned int pflags = current->flags;
-
-	if (!(pflags & PF_MEMALLOC_PIN) &&
-	    gfp_migratetype(gfp_mask) == MIGRATE_MOVABLE)
+	if (gfp_migratetype(gfp_mask) == MIGRATE_MOVABLE)
 		alloc_flags |= ALLOC_CMA;
-
 #endif
 	return alloc_flags;
 }
@@ -4467,7 +4463,7 @@ gfp_to_alloc_flags(gfp_t gfp_mask)
 	} else if (unlikely(rt_task(current)) && !in_interrupt())
 		alloc_flags |= ALLOC_HARDER;
 
-	alloc_flags = current_alloc_flags(gfp_mask, alloc_flags);
+	alloc_flags = cma_alloc_flags(gfp_mask, alloc_flags);
 
 	return alloc_flags;
 }
@@ -4769,7 +4765,7 @@ __alloc_pages_slowpath(gfp_t gfp_mask, unsigned int order,
 
 	reserve_flags = __gfp_pfmemalloc_flags(gfp_mask);
 	if (reserve_flags)
-		alloc_flags = current_alloc_flags(gfp_mask, reserve_flags);
+		alloc_flags = cma_alloc_flags(gfp_mask, reserve_flags);
 
 	/*
 	 * Reset the nodemask and zonelist iterators if memory policies can be
@@ -4938,7 +4934,7 @@ static inline bool prepare_alloc_pages(gfp_t gfp_mask, unsigned int order,
 	if (should_fail_alloc_page(gfp_mask, order))
 		return false;
 
-	*alloc_flags = current_alloc_flags(gfp_mask, *alloc_flags);
+	*alloc_flags = cma_alloc_flags(gfp_mask, *alloc_flags);
 
 	/* Dirty zone balancing only done in the fast path */
 	ac->spread_dirty_pages = (gfp_mask & __GFP_WRITE);
@@ -4980,7 +4976,8 @@ __alloc_pages_nodemask(gfp_t gfp_mask, unsigned int order, int preferred_nid,
 	 * Apply scoped allocation constraints. This is mainly about GFP_NOFS
 	 * resp. GFP_NOIO which has to be inherited for all allocation requests
 	 * from a particular context which has been marked by
-	 * memalloc_no{fs,io}_{save,restore}.
+	 * memalloc_no{fs,io}_{save,restore}. And PF_MEMALLOC_PIN which ensures
+	 * movable zones are not used during allocation.
 	 */
 	gfp_mask = current_gfp_context(gfp_mask);
 	alloc_mask = gfp_mask;
-- 
2.25.1

