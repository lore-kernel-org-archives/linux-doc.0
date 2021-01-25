Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B051BC433E0
	for <linux-doc@archiver.kernel.org>; Mon, 25 Jan 2021 19:51:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 728E9206D4
	for <linux-doc@archiver.kernel.org>; Mon, 25 Jan 2021 19:51:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732150AbhAYTvM (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 25 Jan 2021 14:51:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726561AbhAYTvD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 25 Jan 2021 14:51:03 -0500
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com [IPv6:2607:f8b0:4864:20::f33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DB0BC061352
        for <linux-doc@vger.kernel.org>; Mon, 25 Jan 2021 11:48:04 -0800 (PST)
Received: by mail-qv1-xf33.google.com with SMTP id w11so811305qvz.12
        for <linux-doc@vger.kernel.org>; Mon, 25 Jan 2021 11:48:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=BhWP1P8Q7i9lD0EGpT6UypXh912bl/nwbH5yu3+aADs=;
        b=R90VZ3vGcrRYvZbgV7azLdKs09oOeO1Lk8KPeEtI0CYo+B4Bw6mPEKxqL5eg56jNc9
         ZDrbez70bMDtoC6Od7HL0ftNoMEQ3peg7mRtVWsgG325a5PlRlbmKT7RHgvkhtOhId4d
         7dYEeW1LvOtO3oZjif6bi5MbAEz9No5RYl4KG4ubdRNqV0/tlyNZMriVg+YWst3j+WTZ
         PjO8GSotud/xnvOzQkGUVD0179zez9cw1bfDMJSQuTSACrGxlrSUyp4iYu0Ps2hw+Zuv
         dQq7Ilb7K8Fa+eF8jxWDHJeEvOyhu0eMMUe1CmjKngGzlok/qZkPzNDWJsDq0udh+T7i
         vr8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BhWP1P8Q7i9lD0EGpT6UypXh912bl/nwbH5yu3+aADs=;
        b=FqpL66kcTvAfXWmG1FcWjEeNwKJsWmFxZhDWh0QMXRju7vpXZT5+hI5qAf+4fhbicc
         Y7JugZHfRaGiS0gzO+Wdv8UnS0aKaJ8W9/G/bC/ND6EhEvHyZ3U/JzscD0ZvQT5o3r4J
         4M7JgBS84HO8uy7uy+FvsG2udkV6rlkfHD7cKRm+faAXUBtll2nJrtprp6dLEpFUyr3B
         qOYWcDfAlaT4C/h5Z+HGEbqYoFcjrduzpeohleGzoZlEn/JZhL42+L0ohyE4OMtxrHu5
         d3Uv/6/34WdhmrF9O7+EVvT7zdrwDvERr8kNCrZhn6gtf2+DQIjBO3D8X+QtGqU9a283
         6YCA==
X-Gm-Message-State: AOAM533CfD0nhbadmm6C6iz/xWHZ5Oy4DCtGvdlicKeT0t+t9HERGQc4
        YzI2fNCDwigxPZfWVFnuEsZIKw==
X-Google-Smtp-Source: ABdhPJy3QWGRlhCdTJ6t8Bl2AWaYHX6rqsFzWzOohroOr2+KwZLFlfWsdO5+EVfO+/raYzXEIL5oIA==
X-Received: by 2002:a0c:c688:: with SMTP id d8mr2432312qvj.8.1611604083512;
        Mon, 25 Jan 2021 11:48:03 -0800 (PST)
Received: from localhost.localdomain (c-73-69-118-222.hsd1.nh.comcast.net. [73.69.118.222])
        by smtp.gmail.com with ESMTPSA id c12sm12121569qtq.76.2021.01.25.11.48.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 11:48:02 -0800 (PST)
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
Subject: [PATCH v8 06/14] mm: apply per-task gfp constraints in fast path
Date:   Mon, 25 Jan 2021 14:47:43 -0500
Message-Id: <20210125194751.1275316-7-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210125194751.1275316-1-pasha.tatashin@soleen.com>
References: <20210125194751.1275316-1-pasha.tatashin@soleen.com>
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
index f92d7c810953..c93e801a45e9 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -4981,6 +4981,13 @@ __alloc_pages_nodemask(gfp_t gfp_mask, unsigned int order, int preferred_nid,
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
@@ -4996,13 +5003,7 @@ __alloc_pages_nodemask(gfp_t gfp_mask, unsigned int order, int preferred_nid,
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

