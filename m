Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C28D0C433ED
	for <linux-doc@archiver.kernel.org>; Mon, 26 Apr 2021 07:00:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A651761263
	for <linux-doc@archiver.kernel.org>; Mon, 26 Apr 2021 07:00:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232062AbhDZHA4 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 26 Apr 2021 03:00:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231907AbhDZHA4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 26 Apr 2021 03:00:56 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DB2EC061574
        for <linux-doc@vger.kernel.org>; Mon, 26 Apr 2021 00:00:15 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id p2so23996107pgh.4
        for <linux-doc@vger.kernel.org>; Mon, 26 Apr 2021 00:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZTf4VDhB+vsAlWiKaTvh+bcNfZdV5PiIE39ZO2UyLSc=;
        b=OzBm0TRrwP0w1UMWiqgYTFsquMLh/ibMx4tparnOh6D5BQP8Vxp5h4x0YzqlDgw/Cx
         eHFF9TnavfKxRskT7kQ/ZDb08ZSq9/DnjtVv6B9T3C0W1HJhiXenSD7uxwhlSK/707Qg
         qD4Tdh+ta4TccI/eMNcT5xzXvtMxNciyxefotosU8AiDTbFg7HNkRuEwMcJ/fAy6qo0E
         dNJJApejzTl0Uisgb6zW6Sv4T9BI3zq10gKu7O/cEHsTpWvZ3jNkBd6QsHw0nCRw5kG9
         iEwVnQRM13tQgkthHoqe6Zw6RTnXOLQzipsyIW1R1ViNgWbkDbx5H45cRQVUTdE8FUTT
         z59Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZTf4VDhB+vsAlWiKaTvh+bcNfZdV5PiIE39ZO2UyLSc=;
        b=QR21TWt3AZYfwuSfLRuPtEEL3p+gAenD4Ds+3r6brsZ0EBNJcajDJiq7xNzxxFz0V+
         t6eO6CzwgDFogiKPw5zNMMazJq0uLHCVr8Yk1d6Zo+OEXv99tjKato2SIMuf1ZXt8a98
         CBInBVQ65+/Mrgvvu+aEokzgBA6IGRKX7nYjpuiebtImk1/KJ1ZQw9jp7VLB5sCa6YvI
         IMTP35EV9twW6Q00YLO5b1iEpcd9DismgISM30250ZRhXDDtUM7kBJyg7i7coS1AaDXd
         Bwweqi53md9GLtZFDIXv1Tz9eGa9rGKuP2ZPH6JXNiZVEcLfuijGDiR9Pk4poreaXo6U
         /u/g==
X-Gm-Message-State: AOAM532F6h5dGpQkhgN5+i+sL3u6wE6uJd57YSyN/C2tZS31NTEnZWqH
        lZtqOQaO/mvMcCQvO+SVXHRS4A==
X-Google-Smtp-Source: ABdhPJwYFD7MUi/5hvdyxTvyf2M6mrOhvBi5WWkars4S6BedJK7btjVTIZiPp+AcQYhNX7AfppHPPA==
X-Received: by 2002:a62:194f:0:b029:25c:37cb:2132 with SMTP id 76-20020a62194f0000b029025c37cb2132mr16017661pfz.37.1619420413981;
        Mon, 26 Apr 2021 00:00:13 -0700 (PDT)
Received: from C02DV8HUMD6R.bytedance.net ([139.177.225.224])
        by smtp.gmail.com with ESMTPSA id w14sm4535047pfn.3.2021.04.26.00.00.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Apr 2021 00:00:13 -0700 (PDT)
From:   Abel Wu <wuyun.abel@bytedance.com>
To:     akpm@linux-foundation.org, lizefan.x@bytedance.com, tj@kernel.org,
        hannes@cmpxchg.org, corbet@lwn.net
Cc:     cgroups@vger.kernel.org, linux-mm@kvack.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Wu <wuyun.abel@bytedance.com>
Subject: [PATCH 1/3] mm/mempolicy: apply cpuset limits to tasks using default policy
Date:   Mon, 26 Apr 2021 14:59:44 +0800
Message-Id: <20210426065946.40491-2-wuyun.abel@bytedance.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210426065946.40491-1-wuyun.abel@bytedance.com>
References: <20210426065946.40491-1-wuyun.abel@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The nodemasks of non-default policies (pol->v) are calculated within
the restriction of task->mems_allowed, while default policies are not.
This may lead to improper results of mpol_misplaced(), since it can
return a target node outside of current->mems_allowed for tasks using
default policies. Although this is not a bug because migrating pages
to that out-of-cpuset node will fail eventually due to sanity checks
in page allocation, it still would be better to avoid such useless
efforts.

This patch also changes the behavior of autoNUMA a bit by showing
a tendency to move pages inside mems_allowed for tasks using default
policies, which is good for memory isolation.

Signed-off-by: Abel Wu <wuyun.abel@bytedance.com>
---
 mm/mempolicy.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/mm/mempolicy.c b/mm/mempolicy.c
index d79fa299b70c..e0ae6997bbfb 100644
--- a/mm/mempolicy.c
+++ b/mm/mempolicy.c
@@ -2516,7 +2516,10 @@ int mpol_misplaced(struct page *page, struct vm_area_struct *vma, unsigned long
 
 	/* Migrate the page towards the node whose CPU is referencing it */
 	if (pol->flags & MPOL_F_MORON) {
-		polnid = thisnid;
+		if (node_isset(thisnid, cpuset_current_mems_allowed))
+			polnid = thisnid;
+		else
+			polnid = node_random(&cpuset_current_mems_allowed);
 
 		if (!should_numa_migrate_memory(current, page, curnid, thiscpu))
 			goto out;
-- 
2.31.1

