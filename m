Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E47EDC2BB48
	for <linux-doc@archiver.kernel.org>; Thu, 17 Dec 2020 18:54:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BA3E223715
	for <linux-doc@archiver.kernel.org>; Thu, 17 Dec 2020 18:54:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730044AbgLQSxa (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 17 Dec 2020 13:53:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729062AbgLQSx3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 17 Dec 2020 13:53:29 -0500
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F91BC061282
        for <linux-doc@vger.kernel.org>; Thu, 17 Dec 2020 10:52:49 -0800 (PST)
Received: by mail-qt1-x836.google.com with SMTP id 7so20886570qtp.1
        for <linux-doc@vger.kernel.org>; Thu, 17 Dec 2020 10:52:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=moKlK00n8Mdrp7ywZpC6MaDpohjdb0npdJnYeg/on6s=;
        b=ZOxXEpzZE5eoyaS0FfOo5PWGj/4PnUFDMcm9vo0KmaZNneDdSsxRUnXw/684pkorel
         Zt8q9wUL1+/2aHgfijA0vUU9udDbViRaxBO3weUCGeZChY5KhViitj/diOV3z2x2tttI
         wda7SeXLHcPsDOl5Ebl9rKvJ0ScaFNPXEeiEs51TIgOzz8yGpGIXtvHxd5OLbkKiFJdr
         FUyLRdWGVEAqGfOlCyU0Hh5iMHV5x+JuVXzwNcbp1lKW5L3CjWGOeQ4prbHHN/JoUAj8
         X3vysNNxwDmbtDj6EOJ2UpLam2FdfdRGtNm4VbBOsITaj3yoa47yJPcF7T5Gv3HbtL6H
         TndA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=moKlK00n8Mdrp7ywZpC6MaDpohjdb0npdJnYeg/on6s=;
        b=igrzB9F0khG0wpIopGTR9KRlcLMVOV8mEvC50m9IDUAd4a8sUm09O7I6IkUjynu+/A
         +8VnvbbOyIuQCiIsPqVMGLKykG1ZNHKFT7leC9uOEvdUaKaFUlgIdwMsX5096Ui2JVsd
         n+MWQQyiXzqMCoPbUGDC4IZhopAbRGW4K+1B1SybM0KwWLENwI3G7lIzJKTu5scMJte2
         kecs646cpQtMo/1XCcJrLbPCi6QDMtSwd8hCnpzT2hEQjLOx3/sz5DxqlHVE20KVBxNe
         mgHMUq+7BLtfwQr4jfzH0hM82W9yOmdo7bviOrZhWijG/ZfxEGgdQDL3Mrr5VMl+e42C
         9hHQ==
X-Gm-Message-State: AOAM530Ri2sJjkkxHhkDMDrgJjHmyK63SRMSmJmIuzm2ie19oY7luEWj
        qVZru3USXnWRCgrHq3Lj7nuJSQ==
X-Google-Smtp-Source: ABdhPJzR9Qh7lsqKjSY0T7wIxNIkDhJNQGdnPSt+BzV4Eg4mDwA9KfrzI+zYzcc82IhoDCH10Mujuw==
X-Received: by 2002:aed:23d6:: with SMTP id k22mr171171qtc.226.1608231168320;
        Thu, 17 Dec 2020 10:52:48 -0800 (PST)
Received: from localhost.localdomain (c-73-69-118-222.hsd1.nh.comcast.net. [73.69.118.222])
        by smtp.gmail.com with ESMTPSA id m8sm4127434qkn.41.2020.12.17.10.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Dec 2020 10:52:47 -0800 (PST)
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
Subject: [PATCH v4 01/10] mm/gup: don't pin migrated cma pages in movable zone
Date:   Thu, 17 Dec 2020 13:52:34 -0500
Message-Id: <20201217185243.3288048-2-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201217185243.3288048-1-pasha.tatashin@soleen.com>
References: <20201217185243.3288048-1-pasha.tatashin@soleen.com>
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
index 4f3cf14ac958..f2e50cdd7d67 100644
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

