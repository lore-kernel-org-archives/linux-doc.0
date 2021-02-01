Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E07A1C433E9
	for <linux-doc@archiver.kernel.org>; Mon,  1 Feb 2021 15:39:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B9F0B64EBB
	for <linux-doc@archiver.kernel.org>; Mon,  1 Feb 2021 15:39:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229881AbhBAPjS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 1 Feb 2021 10:39:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230114AbhBAPjM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 1 Feb 2021 10:39:12 -0500
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53200C0613D6
        for <linux-doc@vger.kernel.org>; Mon,  1 Feb 2021 07:38:32 -0800 (PST)
Received: by mail-qk1-x736.google.com with SMTP id a12so16574304qkh.10
        for <linux-doc@vger.kernel.org>; Mon, 01 Feb 2021 07:38:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=uI6NShNpRZxuWFJgcFGIsf9y7F3FhEyQzIGIbDpR8GM=;
        b=ZK7zb4JfZxvJDH4rP++rGO4ym9RA4/AUZq57tVze+Z39Aim4mSkSHLogDTGtN029/D
         6FKlTuyF7Siie7kPLweGrab7Qj4CCRi3fUa7zYUdqJB+ukCQAg67+FfZGHra3shRU4Ud
         XSQjsrghTq6HK17jPWf+ftPrMORmjZ9/641OwzeMwJT4YqrvIoKXPQbWrcjzurfyPb+k
         xxV1sKrqi85++t3Vyb0ayML+GV3TZbLXZcho47XFFjbuATYGCbAsVmPW2/kzxVdUyP4B
         RgvhOuTqVrtMx48Cg8MWcisNzMKsv6p1XORa/mwNdjEm4OFltCV2B8stVa7AkGAFALZa
         udxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uI6NShNpRZxuWFJgcFGIsf9y7F3FhEyQzIGIbDpR8GM=;
        b=HbjNYBOkGqsY0/wpYacPHDP9AdEMtU7U3h+xJym4exARklziRrMg2+rrdqDBgYvJ9p
         MKJ9QsZ6Lyq6RIvpPjVX497r40FlsEZyktgwH769m55MC8zIFKWsXtWp7SAFNX9Pf3kF
         gex8t65UnMoIkLItZnDzUSvF9XYocvxJoNdoYCxQOQhftJ8tCySz2zaLMRzKMqw28NsN
         tekLBZj5Ph2qrWqHnkTsLJenQDCA8kpP7bLdkCCUCnyh1eTLc/bYjBwagdf7zRJuo+57
         ieUo30c82zSz1E0V8bJf+3j9XHde3Uqg7havxziBM00JX0iOfOeni32DzCQuF8c5soM3
         LetQ==
X-Gm-Message-State: AOAM530qoRmNq4+JCF3h5pOQsecNi4uKNrvY+3u3bUq64BQihRmWBITl
        8ylspNjgO5zRAN77jPbTYXXiFg==
X-Google-Smtp-Source: ABdhPJxLW2knwkEUqx65lpqbqovanbpJQgv8STLvLG5owMyBbjkmB+/m15zX9T7iv27mkC5256j0Hw==
X-Received: by 2002:a37:484f:: with SMTP id v76mr9917370qka.312.1612193911600;
        Mon, 01 Feb 2021 07:38:31 -0800 (PST)
Received: from localhost.localdomain (c-73-69-118-222.hsd1.nh.comcast.net. [73.69.118.222])
        by smtp.gmail.com with ESMTPSA id 22sm14853307qke.123.2021.02.01.07.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Feb 2021 07:38:30 -0800 (PST)
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
Subject: [PATCH v9 01/14] mm/gup: don't pin migrated cma pages in movable zone
Date:   Mon,  1 Feb 2021 10:38:14 -0500
Message-Id: <20210201153827.444374-2-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210201153827.444374-1-pasha.tatashin@soleen.com>
References: <20210201153827.444374-1-pasha.tatashin@soleen.com>
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

