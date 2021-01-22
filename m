Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 815AAC433DB
	for <linux-doc@archiver.kernel.org>; Fri, 22 Jan 2021 03:39:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3BC542310A
	for <linux-doc@archiver.kernel.org>; Fri, 22 Jan 2021 03:39:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726646AbhAVDik (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 21 Jan 2021 22:38:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726623AbhAVDif (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 21 Jan 2021 22:38:35 -0500
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EA49C061786
        for <linux-doc@vger.kernel.org>; Thu, 21 Jan 2021 19:37:53 -0800 (PST)
Received: by mail-qv1-xf29.google.com with SMTP id d11so2056904qvo.11
        for <linux-doc@vger.kernel.org>; Thu, 21 Jan 2021 19:37:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=uI6NShNpRZxuWFJgcFGIsf9y7F3FhEyQzIGIbDpR8GM=;
        b=JPFxiIpXfQz7s+HD+h+h53MJjfdFcIIb3fRCeiOL2nLTb7mQbwL/mv5bD6YwNIDlb0
         BFY7g1NGuXse+LEq41ouEsNL2gXTOwPaiR5GQExaxMEhuAeRYuHEyPmcy3TPLbX47vVE
         LgK7fRS4bUQpOBiTm8HrFG94WE1pNF7hff5zWb4gSNw9ArUMMqrpPtxr2Hdd8IFn0nsq
         otWlRvxKtojA55dd+CCjH/0X0/bnDxm6K27wzxRWifoK79oGb/3CRBxDgjMBTWxfPRFa
         7uUcOuV7mfY5ILLAsCPM5yVmzUm+wvxNLL3fe7M9oDRQxMYtz25aXENgZkyKm7tT/eiJ
         TkSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uI6NShNpRZxuWFJgcFGIsf9y7F3FhEyQzIGIbDpR8GM=;
        b=RmnEPuAhWhTjCQVFu1ifOdtndhGqkR/7J/jY65Wn2FZv/gw5fxwJuqv+MSj3SLDoig
         0tdP35L/Svg73dXOV6DQeBQyXj9SP8VFVm0vcxxlSISeRuzMbsx7K0rv1Dva96C8mknS
         xkpssQ3pmBm8OOnZngO+znj008Hh5J2zLctaHU2w+y4JOcyFqpRM6HT9ch52sW5ssn2b
         mlo9P2NRRGJyMMqUDlXZduETnxRRW4XvxY9WAvPUcX+Cv2shAVmPzoDLS/Ak0n/knvRn
         LAaBOMdDWJuSDu5Bkc0Gi+ZbVXu1Q0ZxQWyl59FSoAnw/in4uP7ex/vLLefrxOlIBNTf
         stGw==
X-Gm-Message-State: AOAM533UB6eWy7cHFIrQ9yxEhbYtmWZfPqP8hMnYZcY3ASbmy5tN4dHU
        r7wvBUJGeTbPtiCB5nGhJ65LtQ==
X-Google-Smtp-Source: ABdhPJwSGFYJhC+Qib8qDxE3HBrhAWAJcwGgvgnJ2/IXoY6+kFqDz947kH5LHEFg/lVWRPLyadzxDg==
X-Received: by 2002:ad4:4e09:: with SMTP id dl9mr2838296qvb.44.1611286672365;
        Thu, 21 Jan 2021 19:37:52 -0800 (PST)
Received: from localhost.localdomain (c-73-69-118-222.hsd1.nh.comcast.net. [73.69.118.222])
        by smtp.gmail.com with ESMTPSA id m85sm5426529qke.33.2021.01.21.19.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jan 2021 19:37:51 -0800 (PST)
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
Subject: [PATCH v7 01/14] mm/gup: don't pin migrated cma pages in movable zone
Date:   Thu, 21 Jan 2021 22:37:35 -0500
Message-Id: <20210122033748.924330-2-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210122033748.924330-1-pasha.tatashin@soleen.com>
References: <20210122033748.924330-1-pasha.tatashin@soleen.com>
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
index 3e086b073624..24f25b1e9103 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -1563,7 +1563,7 @@ static long check_and_migrate_cma_pages(struct mm_struct *mm,
 	long ret = nr_pages;
 	struct migration_target_control mtc = {
 		.nid = NUMA_NO_NODE,
-		.gfp_mask = GFP_USER | __GFP_MOVABLE | __GFP_NOWARN,
+		.gfp_mask = GFP_USER | __GFP_NOWARN,
 	};
 
 check_again:
-- 
2.25.1

