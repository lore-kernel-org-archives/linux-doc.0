Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C686C433FE
	for <linux-doc@archiver.kernel.org>; Thu, 10 Dec 2020 00:45:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E5EDD22D5B
	for <linux-doc@archiver.kernel.org>; Thu, 10 Dec 2020 00:44:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730115AbgLJAod (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 9 Dec 2020 19:44:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730476AbgLJAoW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 Dec 2020 19:44:22 -0500
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com [IPv6:2607:f8b0:4864:20::f42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A546C0611CB
        for <linux-doc@vger.kernel.org>; Wed,  9 Dec 2020 16:43:42 -0800 (PST)
Received: by mail-qv1-xf42.google.com with SMTP id u16so1624242qvl.7
        for <linux-doc@vger.kernel.org>; Wed, 09 Dec 2020 16:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Vo/yLKAiBS5h7nMLASyDzuT56nkaTKWz46PdLnDqyVo=;
        b=lWcq4VQzxkaWPyNizEDNGYhGjugYHnHlB7gIkV8AVNth2RU1O8bPJqDyqXkjGelUBb
         DtuSfCf2vU3iQ2Aw2aHIB/OUhtzdIKvp9GPqGanu6vYYeLYd8uHYXfCfkRfHwbkwK0nn
         AA+lWcTiJyWmv/jcnvBHdVb8hyCNhk7oArTBfqp+Rx1gSVn6hSBDo+x8ejNat3qPP7Pw
         I0ouWxKweeSLCAuynp4EjKkntCkncxKCEJmdCf3dlExR9b+ZDCgZWGnvRPaP8NUKW7G2
         V244hehbzwIJzbQTSVR+BTFmASHF1nXUTfYoDWSs1CLrVlB3p++uRUQ/RlMTreKpyCvF
         RO7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Vo/yLKAiBS5h7nMLASyDzuT56nkaTKWz46PdLnDqyVo=;
        b=qO5qyURiNUMi9SQbVj1T9KVFFPuyrAcX14tuOHj9oY9lDs2GpeXMKAoSIGPSVi3ivs
         KZtRnBLZB4DTgYcxznELV6r6jb4Te5oCvQBv8U+cx9/Zx05/l+wZLzGM/Usc/Arj5O0x
         r6PB3lmPh7DzS4t6+41jJWxrBl9t84nZhxcvsLFGk1GOp/jRwQ3s8ZMIduV9w97CxQcb
         G361pYcrO46bFbdoBopkdi7w7odsNkVZ141xPnmwhTtpu2aA2oxsUVfSRuQ+X2XYjmgq
         t31KtC1sJv9/u/d3x9hOuMHVK75KhNawDuQ3RuiPZZGOBrTE/eDe368YhyUcepP8QBiD
         tLBQ==
X-Gm-Message-State: AOAM533hrxXwMxqlGeKUxCAu+zNptLXxXAVCqjP3I2+ANTcR48/z9pyW
        z6aKSul/hN/TP+FeELBc5QabjQ==
X-Google-Smtp-Source: ABdhPJydALvSGS7GDNYtKUswYkrylNumV2tLiFG9B8JTmcFkB18LgsEdm1vhHem+5qCNXzlbBRkswg==
X-Received: by 2002:a0c:e6e7:: with SMTP id m7mr6461346qvn.11.1607561021480;
        Wed, 09 Dec 2020 16:43:41 -0800 (PST)
Received: from localhost.localdomain (c-73-69-118-222.hsd1.nh.comcast.net. [73.69.118.222])
        by smtp.gmail.com with ESMTPSA id y1sm2538745qky.63.2020.12.09.16.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 16:43:40 -0800 (PST)
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
Subject: [PATCH v2 2/8] mm/gup: don't pin migrated cma pages in movable zone
Date:   Wed,  9 Dec 2020 19:43:29 -0500
Message-Id: <20201210004335.64634-3-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201210004335.64634-1-pasha.tatashin@soleen.com>
References: <20201210004335.64634-1-pasha.tatashin@soleen.com>
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
index cdb8b9eeb016..3a76c005a3e2 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -1610,7 +1610,7 @@ static long check_and_migrate_cma_pages(struct mm_struct *mm,
 	long ret = nr_pages;
 	struct migration_target_control mtc = {
 		.nid = NUMA_NO_NODE,
-		.gfp_mask = GFP_USER | __GFP_MOVABLE | __GFP_NOWARN,
+		.gfp_mask = GFP_USER | __GFP_NOWARN,
 	};
 
 check_again:
-- 
2.25.1

