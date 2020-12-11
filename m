Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63C0DC433FE
	for <linux-doc@archiver.kernel.org>; Fri, 11 Dec 2020 21:26:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F24842409B
	for <linux-doc@archiver.kernel.org>; Fri, 11 Dec 2020 21:26:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389676AbgLKUWk (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 11 Dec 2020 15:22:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388412AbgLKUWZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 11 Dec 2020 15:22:25 -0500
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45EE8C061793
        for <linux-doc@vger.kernel.org>; Fri, 11 Dec 2020 12:21:45 -0800 (PST)
Received: by mail-qt1-x842.google.com with SMTP id f14so7394117qto.12
        for <linux-doc@vger.kernel.org>; Fri, 11 Dec 2020 12:21:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=g6NOhJ3w3XRzsqZuC7ga0SKkBBZ5s5oSTRUPFdoho3o=;
        b=QIPBzIB9YCwxjTmgunmw4D66koVC14iWgJ5vMT9WKGGdO/jqIVhcL4FXyOkLjiIgwx
         2w/qGjWQFjXJd2w3pkSca+bt5aVw5jUgxXMbVac7h+DpJ83Br/D9jE82VTAkwBlT1Rmw
         3FXxFGz7ak389EY2W1/R4dmSgNKt09Q1a6FiIcYKEOvzB8dkwEHbpVZYJZo88vtsdrm4
         eUKzO1mPeGf02VF+u6ekNdjnRupaeN7zwPbY8uT52XeDZfExtvGWr9yGlBik8X9lBxN8
         g5ROSqOruM869dzTToz2XzCgs6b1DakksWvGy7bAPZAbdHwqfkT2n/zDJ6CHexwINi3p
         lTKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=g6NOhJ3w3XRzsqZuC7ga0SKkBBZ5s5oSTRUPFdoho3o=;
        b=r+QRpWD3uUjHq7sSbOzJzLU4Yh8ek2wX8xhwCahBCZ0QflenDte7shvMwvAMYGATzc
         0L1rW2QLFIs2lvs0Y8PX7WoB2UJCg7Z9Sb/lBmU4nV/vt4+Kf7hMejqpBx79xKcxEWNZ
         87lD+qKkyZQBKnWDTLsseFXwcaD4U8zQZ8ks+GXyVH5wAmpWO5mG7thdal6WETxgJHUv
         7o6I1Bpyutu/2nYooEW3DD6XKhwfhvM9cM7nokgczfPkNIGG/bDAurOJleztNLsnWBNr
         JlQy5Pj4MIkhYVfgOUx9skfGvkhaBjZXsPoHNzcITgkoB/dOrgS9y74ACrSBNJcY2f3L
         5BBg==
X-Gm-Message-State: AOAM531PFBHms6069fPS15Cyy5uNKdPjCFtKlyrK2+xqGQPB4EYf84qO
        7E+Nr5OEUNC1fD/vvuHJIs76Zg==
X-Google-Smtp-Source: ABdhPJzZqhcqsCxmzzgOEDVNGFUk9Dt2CNmfQPAeukFqgySkrYTp9H2Ov8uq/5CM5Fj9kDUmv8+bLg==
X-Received: by 2002:aed:2ba5:: with SMTP id e34mr18349348qtd.146.1607718104558;
        Fri, 11 Dec 2020 12:21:44 -0800 (PST)
Received: from localhost.localdomain (c-73-69-118-222.hsd1.nh.comcast.net. [73.69.118.222])
        by smtp.gmail.com with ESMTPSA id y192sm8514455qkb.12.2020.12.11.12.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Dec 2020 12:21:43 -0800 (PST)
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
Subject: [PATCH v3 1/6] mm/gup: don't pin migrated cma pages in movable zone
Date:   Fri, 11 Dec 2020 15:21:35 -0500
Message-Id: <20201211202140.396852-2-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201211202140.396852-1-pasha.tatashin@soleen.com>
References: <20201211202140.396852-1-pasha.tatashin@soleen.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

In order not to fragment CMA the pinned pages are migrated. However,
they are migrated to ZONE_MOVABLE, which also should not have pinned pages.

Remove __GFP_MOVABLE, so pages can be migrated to zones where pinning
is allowed.

Signed-off-by: Pavel Tatashin <pasha.tatashin@soleen.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Reviewed-by: John Hubbard <jhubbard@nvidia.com>
Acked-by: Michal Hocko <mhocko@suse.com>
---
 mm/gup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/gup.c b/mm/gup.c
index 0c866af5d96f..87452fcad048 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -1565,7 +1565,7 @@ static long check_and_migrate_cma_pages(struct mm_struct *mm,
 	long ret = nr_pages;
 	struct migration_target_control mtc = {
 		.nid = NUMA_NO_NODE,
-		.gfp_mask = GFP_USER | __GFP_MOVABLE | __GFP_NOWARN,
+		.gfp_mask = GFP_USER | __GFP_NOWARN,
 	};
 
 check_again:
-- 
2.25.1

