Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D145EC433FE
	for <linux-doc@archiver.kernel.org>; Fri, 11 Dec 2020 21:27:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 905812409A
	for <linux-doc@archiver.kernel.org>; Fri, 11 Dec 2020 21:27:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730387AbgLKUXS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 11 Dec 2020 15:23:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393948AbgLKUXE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 11 Dec 2020 15:23:04 -0500
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com [IPv6:2607:f8b0:4864:20::841])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9B30C0617A7
        for <linux-doc@vger.kernel.org>; Fri, 11 Dec 2020 12:21:48 -0800 (PST)
Received: by mail-qt1-x841.google.com with SMTP id a6so7409173qtw.6
        for <linux-doc@vger.kernel.org>; Fri, 11 Dec 2020 12:21:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=wsBBzNzDskmm1L92habwo+bQrCRo6cUbscDHID44jtI=;
        b=Xw6EwkP5NGT8ojgRINybMgV0CEA/32rfK6VpqwScYHQTiSjgDDDgIAv1ObyIa5yf8C
         64a4xj8I9BmfJOgiscgJ3oQ4YecLGRFL6TiNq902N1woOP6EDuQJnsCJ6dOfH9ewifOR
         MHvhW9NkUCciATgOXVgOufjCPnXSSmSJhqlDa/Xt8iehA/LPGNT8fPO9d/qJwAiqIv6z
         7QOagbaZpnlnuSh9xVI5MZS35bpwCt5Wr4lUmMv/8P1oYw6DPaKVMtbez3yebFuipSB5
         wAtry6eKK77Kd7hnv+WqLe+JNzdZdVMEoyeZksgW4rPzcNJ8PFJGSFromgAIr7KTjIfZ
         paSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wsBBzNzDskmm1L92habwo+bQrCRo6cUbscDHID44jtI=;
        b=SY8obENMEZZGmx9wt4ZV6cLJfsQaqUVLbRV/qfxribzbulB1U6pFviRwBD2DVdYv+4
         Cc8z4jzMRDNAeBOPbsRUAPMI7oElse+sqsVpdpD+mPM3YQN+irM+F3e1CKjuhMFIy9Dt
         t96zBEy9ULPqFtUEfYaUr5co3LyjKLnCrZZSqh+3gPCq+jQYZYFZ3FZfrS38pwAmhrZ1
         +3OU051Dfi0w/ZEPCqO2AgMKYj41mHpJH+CEuWw6k95PDyxlBI3piqv1mwm1sPVFXUZ2
         3zq75H3t7zZ0r8v26TdTfNKWLmQMpquIB+8J4RWseYbKWJ2neGMS0plBsxnthaWRokzb
         kMEA==
X-Gm-Message-State: AOAM5327/QqBXozEkhs7l2ek9HlOLfNO5gu7FvoAOz89Jeij1iJ1JFIB
        Wbap+mgbCJpo26+Jxh7I4u+lSw==
X-Google-Smtp-Source: ABdhPJwZBDj+bDwR2xyRmaL+PBvHpV7akfdLiClVp+ecUemviam551kOC6gczZy6ZbRQQi66Jhb9zA==
X-Received: by 2002:aed:29a5:: with SMTP id o34mr17294060qtd.379.1607718108108;
        Fri, 11 Dec 2020 12:21:48 -0800 (PST)
Received: from localhost.localdomain (c-73-69-118-222.hsd1.nh.comcast.net. [73.69.118.222])
        by smtp.gmail.com with ESMTPSA id y192sm8514455qkb.12.2020.12.11.12.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Dec 2020 12:21:47 -0800 (PST)
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
Subject: [PATCH v3 3/6] mm: apply per-task gfp constraints in fast path
Date:   Fri, 11 Dec 2020 15:21:37 -0500
Message-Id: <20201211202140.396852-4-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201211202140.396852-1-pasha.tatashin@soleen.com>
References: <20201211202140.396852-1-pasha.tatashin@soleen.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Function current_gfp_context() is called after fast path. However, soon we
will add more constraints which will also limit zones based on context.
Move this call into fast path, and apply the correct constraints for all
allocations.

Also update .reclaim_idx based on value returned by current_gfp_context()
because it soon will modify the allowed zones.

Note:
With this patch we will do one extra current->flags load during fast path,
but we already load current->flags in fast-path:

__alloc_pages_nodemask()
 prepare_alloc_pages()
  current_alloc_flags(gfp_mask, *alloc_flags);

Later, when we add the zone constrain logic to current_gfp_context() we
will be able to remove current->flags load from current_alloc_flags, and
therefore return fast-path to the current performance level.

Suggested-by: Michal Hocko <mhocko@kernel.org>
Signed-off-by: Pavel Tatashin <pasha.tatashin@soleen.com>
---
 mm/page_alloc.c | 15 ++++++++-------
 mm/vmscan.c     | 10 ++++++----
 2 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index ec05396a597b..c2dea9ad0e98 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -4976,6 +4976,13 @@ __alloc_pages_nodemask(gfp_t gfp_mask, unsigned int order, int preferred_nid,
 	}
 
 	gfp_mask &= gfp_allowed_mask;
+	/*
+	 * Apply scoped allocation constraints. This is mainly about GFP_NOFS
+	 * resp. GFP_NOIO which has to be inherited for all allocation requests
+	 * from a particular context which has been marked by
+	 * memalloc_no{fs,io}_{save,restore}.
+	 */
+	gfp_mask = current_gfp_context(gfp_mask);
 	alloc_mask = gfp_mask;
 	if (!prepare_alloc_pages(gfp_mask, order, preferred_nid, nodemask, &ac, &alloc_mask, &alloc_flags))
 		return NULL;
@@ -4991,13 +4998,7 @@ __alloc_pages_nodemask(gfp_t gfp_mask, unsigned int order, int preferred_nid,
 	if (likely(page))
 		goto out;
 
-	/*
-	 * Apply scoped allocation constraints. This is mainly about GFP_NOFS
-	 * resp. GFP_NOIO which has to be inherited for all allocation requests
-	 * from a particular context which has been marked by
-	 * memalloc_no{fs,io}_{save,restore}.
-	 */
-	alloc_mask = current_gfp_context(gfp_mask);
+	alloc_mask = gfp_mask;
 	ac.spread_dirty_pages = false;
 
 	/*
diff --git a/mm/vmscan.c b/mm/vmscan.c
index 469016222cdb..d9546f5897f4 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -3234,11 +3234,12 @@ static bool throttle_direct_reclaim(gfp_t gfp_mask, struct zonelist *zonelist,
 unsigned long try_to_free_pages(struct zonelist *zonelist, int order,
 				gfp_t gfp_mask, nodemask_t *nodemask)
 {
+	gfp_t current_gfp_mask = current_gfp_context(gfp_mask);
 	unsigned long nr_reclaimed;
 	struct scan_control sc = {
 		.nr_to_reclaim = SWAP_CLUSTER_MAX,
-		.gfp_mask = current_gfp_context(gfp_mask),
-		.reclaim_idx = gfp_zone(gfp_mask),
+		.gfp_mask = current_gfp_mask,
+		.reclaim_idx = gfp_zone(current_gfp_mask),
 		.order = order,
 		.nodemask = nodemask,
 		.priority = DEF_PRIORITY,
@@ -4158,17 +4159,18 @@ static int __node_reclaim(struct pglist_data *pgdat, gfp_t gfp_mask, unsigned in
 {
 	/* Minimum pages needed in order to stay on node */
 	const unsigned long nr_pages = 1 << order;
+	gfp_t current_gfp_mask = current_gfp_context(gfp_mask);
 	struct task_struct *p = current;
 	unsigned int noreclaim_flag;
 	struct scan_control sc = {
 		.nr_to_reclaim = max(nr_pages, SWAP_CLUSTER_MAX),
-		.gfp_mask = current_gfp_context(gfp_mask),
+		.gfp_mask = current_gfp_mask,
 		.order = order,
 		.priority = NODE_RECLAIM_PRIORITY,
 		.may_writepage = !!(node_reclaim_mode & RECLAIM_WRITE),
 		.may_unmap = !!(node_reclaim_mode & RECLAIM_UNMAP),
 		.may_swap = 1,
-		.reclaim_idx = gfp_zone(gfp_mask),
+		.reclaim_idx = gfp_zone(current_gfp_mask),
 	};
 
 	trace_mm_vmscan_node_reclaim_begin(pgdat->node_id, order,
-- 
2.25.1

