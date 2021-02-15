Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C42CC433E9
	for <linux-doc@archiver.kernel.org>; Mon, 15 Feb 2021 16:19:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0BCD664DF0
	for <linux-doc@archiver.kernel.org>; Mon, 15 Feb 2021 16:19:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231486AbhBOQSy (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 15 Feb 2021 11:18:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232041AbhBOQP7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 15 Feb 2021 11:15:59 -0500
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00977C0617AB
        for <linux-doc@vger.kernel.org>; Mon, 15 Feb 2021 08:13:57 -0800 (PST)
Received: by mail-qk1-x735.google.com with SMTP id m144so6784612qke.10
        for <linux-doc@vger.kernel.org>; Mon, 15 Feb 2021 08:13:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=kEb4+EO5FfWEwvtEEV/r+bfuAysDp0uLtQ9Vtb7+Mxs=;
        b=Mjvcn9gFUcCdc22/z/QIMuZAHqj9t0eazT33m6nDiWcsf9dC7b5/Cqunj984C77GCh
         +eDO+f4jZHaYmRkVNyiVvE/AZoCTRqAe6ySBISnRnba2iYwkDWhLwgkZr28MD45Z8sGw
         M+IdB3IPXQBNCXU+B1NJgQpPoEUGoJX07e04vdomEuoHxT0c1nrf30wE5WbEK4Ri2kQc
         VtN/WdklMkVYcoU59sdJbpIYt6mFZ42vKB5YQWdBrt02lFAgo40Rb8TMLf+rPUXDO8Wh
         l4hG1rXQtAGTiPNm3SxKtjXYQ9tx1s3SARXTmDHVP/vcvhonKigVIdiYFwfdvJQ1h1J0
         MRwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kEb4+EO5FfWEwvtEEV/r+bfuAysDp0uLtQ9Vtb7+Mxs=;
        b=S8lEEtC2QMKHh0WLKYvZFG7FLwVhz3Yg3vyE+3tzbsdGmLufHICrKWqiYaLTwevbno
         ycBa1jW/0CTQIZk3yREuA/savhIjzPE5ojLBN8hAYWG2is9LMtMWhFFSJzGJ6ZDATC+W
         woIZ/YWqXkdQiclaVTnKdVKfRZwKOd5IRoDZqUk7PdbIMyfmdhw7ElJ2gM15ENXEsUEK
         SUwoUMeQI0Tna/ISBfwlk4D6Y9RA6FB6HYpk7FtaIpJ6IdsO8WZ9hlpqm4QbG60OPGoR
         4soR21Gi/nuaws9o9rxwJuEnWNrlVKyTP/UO2N/QRJwpeHZ+fVTOSZaDJVT3N1Qd7UA9
         Rd/Q==
X-Gm-Message-State: AOAM531FmHD7njmAgV5L2CTtRYIE/ZJ5cHKrK1Ls4lSI+y2AV+GJKuRy
        KVagFKJnNr2WvqvkiRWgRxU6MA==
X-Google-Smtp-Source: ABdhPJx1c/toBBYCrfBwQhlcATPk9ySGYdcd3wSTS0lxHztOk2SDxHuOaSIOFMhw+gB/ecl0UXpyHw==
X-Received: by 2002:a37:8306:: with SMTP id f6mr15907605qkd.366.1613405636226;
        Mon, 15 Feb 2021 08:13:56 -0800 (PST)
Received: from localhost.localdomain (c-73-69-118-222.hsd1.nh.comcast.net. [73.69.118.222])
        by smtp.gmail.com with ESMTPSA id u7sm10909213qta.75.2021.02.15.08.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Feb 2021 08:13:55 -0800 (PST)
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
Subject: [PATCH v11 03/14] mm/gup: return an error on migration failure
Date:   Mon, 15 Feb 2021 11:13:38 -0500
Message-Id: <20210215161349.246722-4-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210215161349.246722-1-pasha.tatashin@soleen.com>
References: <20210215161349.246722-1-pasha.tatashin@soleen.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

When migration failure occurs, we still pin pages, which means
that we may pin CMA movable pages which should never be the case.

Instead return an error without pinning pages when migration failure
happens.

No need to retry migrating, because migrate_pages() already retries
10 times.

Signed-off-by: Pavel Tatashin <pasha.tatashin@soleen.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
---
 mm/gup.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index 11ca49f3f11d..2d0292980b1d 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -1550,7 +1550,6 @@ static long check_and_migrate_cma_pages(struct mm_struct *mm,
 {
 	unsigned long i;
 	bool drain_allow = true;
-	bool migrate_allow = true;
 	LIST_HEAD(cma_page_list);
 	long ret = nr_pages;
 	struct page *prev_head, *head;
@@ -1601,17 +1600,15 @@ static long check_and_migrate_cma_pages(struct mm_struct *mm,
 			for (i = 0; i < nr_pages; i++)
 				put_page(pages[i]);
 
-		if (migrate_pages(&cma_page_list, alloc_migration_target, NULL,
-			(unsigned long)&mtc, MIGRATE_SYNC, MR_CONTIG_RANGE)) {
-			/*
-			 * some of the pages failed migration. Do get_user_pages
-			 * without migration.
-			 */
-			migrate_allow = false;
-
+		ret = migrate_pages(&cma_page_list, alloc_migration_target,
+				    NULL, (unsigned long)&mtc, MIGRATE_SYNC,
+				    MR_CONTIG_RANGE);
+		if (ret) {
 			if (!list_empty(&cma_page_list))
 				putback_movable_pages(&cma_page_list);
+			return ret > 0 ? -ENOMEM : ret;
 		}
+
 		/*
 		 * We did migrate all the pages, Try to get the page references
 		 * again migrating any new CMA pages which we failed to isolate
@@ -1621,7 +1618,7 @@ static long check_and_migrate_cma_pages(struct mm_struct *mm,
 						   pages, vmas, NULL,
 						   gup_flags);
 
-		if ((ret > 0) && migrate_allow) {
+		if (ret > 0) {
 			nr_pages = ret;
 			drain_allow = true;
 			goto check_again;
-- 
2.25.1

