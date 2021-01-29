Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC103C433DB
	for <linux-doc@archiver.kernel.org>; Fri, 29 Jan 2021 23:46:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5783D64DEB
	for <linux-doc@archiver.kernel.org>; Fri, 29 Jan 2021 23:46:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231202AbhA2Xqe (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 29 Jan 2021 18:46:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229683AbhA2Xqd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 29 Jan 2021 18:46:33 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0395C061574
        for <linux-doc@vger.kernel.org>; Fri, 29 Jan 2021 15:45:52 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id v15so10486899wrx.4
        for <linux-doc@vger.kernel.org>; Fri, 29 Jan 2021 15:45:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5tw1Hp7aX/S0VjTJJRisCjf0Avfnwz4zJamKEdO13Ig=;
        b=ezvP0/016Ph5ZYnfV3u4UGjyoaDOxwpS+sXs/4ixvS88CT/B7PjjFHHij3nwLfOwVK
         3qxpGR8l/UDiab0txk+CbJgw26ZUC5nx5lQlxGdc8FhoQuciqgO7abXBo3CrBkGAbmPR
         xMleYfmOt6LJaBdAeWo9aZiUdj7x3L8UNmHwnpx6aoN4MfQ38PqkLVvwqn1glaTbwihc
         NfNwuHDwz1B0Q+LB1guWnkcDxE6G6OeAh+HZdPZyt/rSlz2MDVBkhDCPDFAZHaZztLTq
         2dD95NDRZtjjIiniw56Ryrpts0VtXjXnowPLVANUs3zm223hXzaWTsxkwjK2DqavU+mi
         +J5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5tw1Hp7aX/S0VjTJJRisCjf0Avfnwz4zJamKEdO13Ig=;
        b=nXLYGU8qG0nSPqIpdYYh1fVS+9WP5xguY1/l4eZRPa9tqtE4Bp1bw/rXdnStpGmz07
         LpkH2Rl2rPBEX0HwbEJ9iOTaIcWt3N2OEZX0rl675Fx60FNv4Wjg/b1p2dbR+jlGtBer
         AeKw81f8blBLQzO+57zVIGLmhcrJWkMA8uPOT7j7aNyCtQfRf/Jmbna5mZPFFjseOLXM
         dylM0qa8O/y4p4Ca7I4aDreZtASRy8qI7IBb3/tT2C6VdQor7kFLHMbiG5zp1C7VVo4Z
         9Oo0Qa/iwcPDBgEq/wTTv/GE2H/Qz5LzkXGVO87hH30n8kZynaLif97TG3XKoxWv5Xc1
         E6kg==
X-Gm-Message-State: AOAM532TkpKWyUHMN5FaPbRirmhi9UFS1kKuZ1UXQDJGaQYK2+V43EpD
        XaO2H27We5jcK8EJFmKr00zaaXHS8gKPsQ==
X-Google-Smtp-Source: ABdhPJwSrmsBUw0JVsO4Dn8CSCcWHNv+NHGbSr63pqQM0s1AODOPZTrqR81CgfE40eZthHDWMmFqeA==
X-Received: by 2002:adf:cd83:: with SMTP id q3mr6963326wrj.225.1611963951497;
        Fri, 29 Jan 2021 15:45:51 -0800 (PST)
Received: from localhost.localdomain ([212.45.67.2])
        by smtp.googlemail.com with ESMTPSA id x1sm12376230wmi.14.2021.01.29.15.45.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 29 Jan 2021 15:45:50 -0800 (PST)
From:   Georgi Djakov <georgi.djakov@linaro.org>
To:     akpm@linux-foundation.org, linux-mm@kvack.org
Cc:     vbabka@suse.cz, corbet@lwn.net, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Georgi Djakov <georgi.djakov@linaro.org>
Subject: [PATCH] mm/page_owner: Record the timestamp of all pages during free
Date:   Sat, 30 Jan 2021 01:45:48 +0200
Message-Id: <20210129234548.10054-1-georgi.djakov@linaro.org>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Collect the time when each allocation is freed, to help with memory
analysis with kdump/ramdump.

Having another timestamp when we free the page helps for debugging
page migration issues. For example both alloc and free timestamps
being the same can gave hints that there is an issue with migrating
memory, as opposed to a page just being dropped during migration.

Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
---
 Documentation/vm/page_owner.rst | 2 +-
 mm/page_owner.c                 | 5 +++++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/vm/page_owner.rst b/Documentation/vm/page_owner.rst
index 4e67c2e9bbed..5d7a62c2be28 100644
--- a/Documentation/vm/page_owner.rst
+++ b/Documentation/vm/page_owner.rst
@@ -47,7 +47,7 @@ size change due to this facility.
 
    text    data     bss     dec     hex filename
    48800   2445     644   51889    cab1 mm/page_alloc.o
-   6574     108      29    6711    1a37 mm/page_owner.o
+   6644     108      29    6777    1a79 mm/page_owner.o
    1025       8       8    1041     411 mm/page_ext.o
 
 Although, roughly, 8 KB code is added in total, page_alloc.o increase by
diff --git a/mm/page_owner.c b/mm/page_owner.c
index d15c7c4994f5..fbdf064e7494 100644
--- a/mm/page_owner.c
+++ b/mm/page_owner.c
@@ -27,6 +27,7 @@ struct page_owner {
 	depot_stack_handle_t handle;
 	depot_stack_handle_t free_handle;
 	u64 ts_nsec;
+	u64 free_ts_nsec;
 	pid_t pid;
 };
 
@@ -148,6 +149,7 @@ void __reset_page_owner(struct page *page, unsigned int order)
 	struct page_ext *page_ext;
 	depot_stack_handle_t handle = 0;
 	struct page_owner *page_owner;
+	u64 free_ts_nsec = local_clock();
 
 	handle = save_stack(GFP_NOWAIT | __GFP_NOWARN);
 
@@ -158,6 +160,7 @@ void __reset_page_owner(struct page *page, unsigned int order)
 		__clear_bit(PAGE_EXT_OWNER_ALLOCATED, &page_ext->flags);
 		page_owner = get_page_owner(page_ext);
 		page_owner->free_handle = handle;
+		page_owner->free_ts_nsec = free_ts_nsec;
 		page_ext = page_ext_next(page_ext);
 	}
 }
@@ -177,6 +180,7 @@ static inline void __set_page_owner_handle(struct page *page,
 		page_owner->last_migrate_reason = -1;
 		page_owner->pid = current->pid;
 		page_owner->ts_nsec = local_clock();
+		page_owner->free_ts_nsec = 0;
 		__set_bit(PAGE_EXT_OWNER, &page_ext->flags);
 		__set_bit(PAGE_EXT_OWNER_ALLOCATED, &page_ext->flags);
 
@@ -243,6 +247,7 @@ void __copy_page_owner(struct page *oldpage, struct page *newpage)
 	new_page_owner->handle = old_page_owner->handle;
 	new_page_owner->pid = old_page_owner->pid;
 	new_page_owner->ts_nsec = old_page_owner->ts_nsec;
+	new_page_owner->free_ts_nsec = old_page_owner->ts_nsec;
 
 	/*
 	 * We don't clear the bit on the oldpage as it's going to be freed
