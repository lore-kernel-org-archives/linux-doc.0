Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD14DC433DB
	for <linux-doc@archiver.kernel.org>; Wed, 20 Jan 2021 01:44:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9424C2245C
	for <linux-doc@archiver.kernel.org>; Wed, 20 Jan 2021 01:44:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729513AbhATBoY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 19 Jan 2021 20:44:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729420AbhATBoV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 19 Jan 2021 20:44:21 -0500
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30639C0613D6
        for <linux-doc@vger.kernel.org>; Tue, 19 Jan 2021 17:43:38 -0800 (PST)
Received: by mail-qk1-x72a.google.com with SMTP id h4so24008320qkk.4
        for <linux-doc@vger.kernel.org>; Tue, 19 Jan 2021 17:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=uI6NShNpRZxuWFJgcFGIsf9y7F3FhEyQzIGIbDpR8GM=;
        b=k3UV+tDJFr+BKK3SSCpump1HUAtfuWyB3vS0LsN5fFAtz4WTPM/kPfMX6f7azPyAi2
         Hy5M6t3n4O4rmylRtxe4c7sC0bV8+0OvyNP3ZZ4nLrIpmoNU4o58Zfglxs2St1XzFukH
         hsbqH769UPvhuyWV+rOOmMbI1AObZhKuZ2SCh7bwxPLN7QRrqdO7fuq5Tr4Uv8e2Id0O
         Xc+E/yROvbKWmlFHupHjdhDN1/7oMmnz1o3AUNkHOTb1MC0LQ2B88d9ClGIfu6MV9bo3
         rn4PiTCrb7/vrinyIPhnEftr0SI0zN3glm7iCVTH7vDhfmaS5WPQi4cdSa3IIvRm/hfE
         htpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uI6NShNpRZxuWFJgcFGIsf9y7F3FhEyQzIGIbDpR8GM=;
        b=FAXTcmkfPA1AhpUvzB1ks9PD+f3P5ApvUS9388+tlQXWG9OJK/UWIHlrcGsDa9eoPZ
         45T3y3ZVw1qu/BayN2JbsTOyJI37Z7UvBWEoTVf+CoagHAROUWjjTzlkxaSl3lYln69F
         jPotCZf2ew3ml409CkI/ltCJbRIv5IPP0utX30k6bBSyKEBfM3hSNzf7J7pfnYJ1Gtfw
         3yV5T5cVdWMJWP8HNpDSzq3/RxViyK0B1qZdTIHQufB5K7E+421QLxB7jdL+5X1XTQR2
         OAYIQmIEjv0hlRk7WdW5rcNEy436kguBIHnhBa2Rt10tEi96/j6y5PmlCPj1A3pgsye5
         vLtw==
X-Gm-Message-State: AOAM533VfXoa+Tgu/yLOl+S/GkI0IYhm5vGTGPPVGgFOdGG4G3JOKAgx
        Cev/30WjJRoDbABjLLZjf9iWxQ==
X-Google-Smtp-Source: ABdhPJw/w3n1JtoHciRMldIMV+u/1mfbbFkskDr23rQOCI1lzfOX0iF0LEkdMvvV0EJt5+9QPKx29Q==
X-Received: by 2002:a37:883:: with SMTP id 125mr7628509qki.366.1611107017485;
        Tue, 19 Jan 2021 17:43:37 -0800 (PST)
Received: from localhost.localdomain (c-73-69-118-222.hsd1.nh.comcast.net. [73.69.118.222])
        by smtp.gmail.com with ESMTPSA id a9sm391871qkk.39.2021.01.19.17.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jan 2021 17:43:36 -0800 (PST)
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
Subject: [PATCH v6 01/14] mm/gup: don't pin migrated cma pages in movable zone
Date:   Tue, 19 Jan 2021 20:43:20 -0500
Message-Id: <20210120014333.222547-2-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210120014333.222547-1-pasha.tatashin@soleen.com>
References: <20210120014333.222547-1-pasha.tatashin@soleen.com>
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

