Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59920C4167B
	for <linux-doc@archiver.kernel.org>; Thu, 10 Dec 2020 00:46:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2FD742313E
	for <linux-doc@archiver.kernel.org>; Thu, 10 Dec 2020 00:46:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729578AbgLJAqN (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 9 Dec 2020 19:46:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730702AbgLJAoU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 Dec 2020 19:44:20 -0500
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com [IPv6:2607:f8b0:4864:20::f44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79360C0617A7
        for <linux-doc@vger.kernel.org>; Wed,  9 Dec 2020 16:43:40 -0800 (PST)
Received: by mail-qv1-xf44.google.com with SMTP id s6so1623671qvn.6
        for <linux-doc@vger.kernel.org>; Wed, 09 Dec 2020 16:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=YDDAi2s6I9irj1eFCp+Xpz5CYfQrtxxsgY8jH6RM458=;
        b=Nk+AuTMfxQ6BbAHmfpjqdXSFnw1CX0GCnpt5Rtr+S5ZZHzRoxhUkXzjSaLBFo9FKnP
         +IGv/oMQZ60Z5oFcu+WcBKLRJVlJIYOStwwQhx8A63/pkfbIk01AMMQrVYLFm122JdCB
         ZhbhX33sTQJUJplzJA2KCaOHlmGycGbsVHpDDZmMcTiFO6zgEcZ5bn3oKR/nhS7NmGXE
         lSUNz94k7ztCGv2c6TPO+oYZAaXQIIpJzaTSorVPYYAS5rRfsh2MWxhI1wbtSM8fm6SD
         ty0uVYq1b+GXDXOHEDRKOXvQB09Qf6VhbIcqJueEsD6VjWHJFlCxwCjTIUSuBPWyseQi
         q3JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YDDAi2s6I9irj1eFCp+Xpz5CYfQrtxxsgY8jH6RM458=;
        b=kRwgQ/zNgN5q8V3t6c6B/LulS9LdceKrsucE9+h9+HqJ1jjptJui56jsbe5aKtQTQJ
         2vCMP5XBrQiU2JXu/Bm2NKiWDMX9AYvbeG245NPMJXHtPgQywYGvLipgeqvZPTjVCRhB
         MjlbAqNTs9pypTlVKR6Sso7VuSVSkADCn9tw+ZKVBPlj45RTQjFdZQG2u94ZqJTZXzM9
         vzpHGCwi4pgx5dyMGKQ6hHnF/QDzsPTpt8CO/iJqmgpBwCtrcmtvO/t4UOZtY10pixsy
         qbJQGk3LwchwKOtsOMjGOnIx9tBr/mqhc6pWPnfuuZm3MkSOhHxaE/DdKDBFaZCav8B3
         bNiQ==
X-Gm-Message-State: AOAM531CJi+8Irn74jC+9n7wvuXEsLbpkBd+W7VS8djncrfRl9p1yDGR
        bmydWb+d4Z2r+dveRamKoUaJ1w==
X-Google-Smtp-Source: ABdhPJzAa7q5sUByKWOSFZ0Py2q3Uc376O6i1oNIXW+AdlNdeOTECHVZXZpiUJYIRGDv8y9xQIyh+Q==
X-Received: by 2002:ad4:4051:: with SMTP id r17mr5889435qvp.39.1607561019788;
        Wed, 09 Dec 2020 16:43:39 -0800 (PST)
Received: from localhost.localdomain (c-73-69-118-222.hsd1.nh.comcast.net. [73.69.118.222])
        by smtp.gmail.com with ESMTPSA id y1sm2538745qky.63.2020.12.09.16.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 16:43:39 -0800 (PST)
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
Subject: [PATCH v2 1/8] mm/gup: perform check_dax_vmas only when FS_DAX is enabled
Date:   Wed,  9 Dec 2020 19:43:28 -0500
Message-Id: <20201210004335.64634-2-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201210004335.64634-1-pasha.tatashin@soleen.com>
References: <20201210004335.64634-1-pasha.tatashin@soleen.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

There is no need to check_dax_vmas() and run through the npage loop of
pinned pages if FS_DAX is not enabled.

Add a stub check_dax_vmas() function for no-FS_DAX case.

Signed-off-by: Pavel Tatashin <pasha.tatashin@soleen.com>
Reviewed-by: John Hubbard <jhubbard@nvidia.com>
---
 mm/gup.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/mm/gup.c b/mm/gup.c
index 98eb8e6d2609..cdb8b9eeb016 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -1568,6 +1568,7 @@ struct page *get_dump_page(unsigned long addr)
 #endif /* CONFIG_ELF_CORE */
 
 #if defined(CONFIG_FS_DAX) || defined (CONFIG_CMA)
+#ifdef CONFIG_FS_DAX
 static bool check_dax_vmas(struct vm_area_struct **vmas, long nr_pages)
 {
 	long i;
@@ -1586,6 +1587,12 @@ static bool check_dax_vmas(struct vm_area_struct **vmas, long nr_pages)
 	}
 	return false;
 }
+#else
+static bool check_dax_vmas(struct vm_area_struct **vmas, long nr_pages)
+{
+	return false;
+}
+#endif
 
 #ifdef CONFIG_CMA
 static long check_and_migrate_cma_pages(struct mm_struct *mm,
-- 
2.25.1

