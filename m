Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57E6BC43333
	for <linux-doc@archiver.kernel.org>; Tue, 19 Jan 2021 04:45:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 27DDF2223E
	for <linux-doc@archiver.kernel.org>; Tue, 19 Jan 2021 04:45:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732590AbhASEpP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 18 Jan 2021 23:45:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732810AbhASEmH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 18 Jan 2021 23:42:07 -0500
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECC7AC06179E
        for <linux-doc@vger.kernel.org>; Mon, 18 Jan 2021 20:39:32 -0800 (PST)
Received: by mail-qt1-x834.google.com with SMTP id o18so3231386qtp.10
        for <linux-doc@vger.kernel.org>; Mon, 18 Jan 2021 20:39:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=9lkuj952gZlf+x4X5uCEePkXus+rlNAKcNGEDA8YLvg=;
        b=ReLVagpad7q60DTveWAmm+8ncFT5pURI3UAiMZpuKSFB8oYs2/Eyo3Y2tYwuFX8146
         U9vy9Y+i+NqJQVnVhR/vY1ef8tsWAmS2BRTSPd94OqFtrOOGbSEJyB4WWeBzXp+Dk2Ye
         EdQO5p9IBw7xmo54ASApnhdJajhSXrx7obUByFRcNkF8bMIfhA6oJsNcksqNjKBkacBK
         f1w1k5VY9fyvXJTOqpnkrjOpxoYZbojsHzGDO3T/cpeULT5cxA4Qe2aFFpZKUBSGtl2y
         2aecGhCe7kHIBuFI6P5Otcd+upQOHaDwTPZYUJ0P9WYqYKzWw2NreDpeU1vpxV7zEaDy
         MwWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9lkuj952gZlf+x4X5uCEePkXus+rlNAKcNGEDA8YLvg=;
        b=X7pikUYG7MrL4J+xmPguVJPghK1C7IIw79176+l/gr8iwMTxrD2oBr1RBsfMUHwPiN
         lLC0RqWgQVWLv9DGcMhQJbA4K4GbMV28GlTQ9yiWkzlw4jVNeDG/913Cdgah8PjGHcGy
         Z61LWtEqfWnMzfXi7el3NO19JbXpKMRPWsEZ0ZX8TQbULkNjdaKeUl0JJEEcl2nk/gR2
         tSyQk2WYyoP7Zr4uN/8d8uaGjqY6WSp3zrsVXe16KtULVJDavl/WnH/giUX3DBh78zuR
         jBrApdWUGFagoK5QnwJCqyi7WMwuXilkXKg8sMvUu61fhWgQ6d3M8uq6mRjKQ0PafviI
         VDgg==
X-Gm-Message-State: AOAM5320w59WhQaD3S9PFzgZtKgoWh/GMoo0L2mP1dkHY2O4yCOI0Zab
        GCl0JRWFNagZcGVIItvHeqO4tA==
X-Google-Smtp-Source: ABdhPJy2mS14y9Xwpik9VIIILnUTrIsijfT9Ta3yBjQ/dOFsYqZeIJJDDcNLBILA2vSYmww44Z4lJw==
X-Received: by 2002:ac8:5514:: with SMTP id j20mr2706689qtq.387.1611031172219;
        Mon, 18 Jan 2021 20:39:32 -0800 (PST)
Received: from localhost.localdomain (c-73-69-118-222.hsd1.nh.comcast.net. [73.69.118.222])
        by smtp.gmail.com with ESMTPSA id z20sm11934536qkz.37.2021.01.18.20.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jan 2021 20:39:31 -0800 (PST)
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
        linux-kselftest@vger.kernel.org
Subject: [PATCH v5 06/14] mm: apply per-task gfp constraints in fast path
Date:   Mon, 18 Jan 2021 23:39:12 -0500
Message-Id: <20210119043920.155044-7-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210119043920.155044-1-pasha.tatashin@soleen.com>
References: <20210119043920.155044-1-pasha.tatashin@soleen.com>
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
Acked-by: Michal Hocko <mhocko@suse.com>
---
 mm/page_alloc.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 0114cdfe4aae..de9bcd08d002 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -4979,6 +4979,13 @@ __alloc_pages_nodemask(gfp_t gfp_mask, unsigned int order, int preferred_nid,
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
@@ -4994,13 +5001,7 @@ __alloc_pages_nodemask(gfp_t gfp_mask, unsigned int order, int preferred_nid,
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
-- 
2.25.1

