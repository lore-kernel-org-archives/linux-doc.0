Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 376D9C433E0
	for <linux-doc@archiver.kernel.org>; Mon,  1 Feb 2021 15:42:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 020E464E2A
	for <linux-doc@archiver.kernel.org>; Mon,  1 Feb 2021 15:42:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230171AbhBAPmX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 1 Feb 2021 10:42:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231773AbhBAPkn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 1 Feb 2021 10:40:43 -0500
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FE08C061226
        for <linux-doc@vger.kernel.org>; Mon,  1 Feb 2021 07:38:50 -0800 (PST)
Received: by mail-qt1-x82a.google.com with SMTP id z9so12510819qtv.6
        for <linux-doc@vger.kernel.org>; Mon, 01 Feb 2021 07:38:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=mjWbyN3QlCSRxacF3EdFD9Q6Qqvve11XewDvx8+hMpo=;
        b=OAiVj8EUaBhRyXc5Me6CxkkQ4JJVwN6FcXMZMtlbhDja2FZkfFfbZUQ1PV61FJ8Bxh
         2qgpQslo1yfXRnpnaXy6AMqLdZo4lI69UbWuvi1JbU/mO7Eq03VkKh3tm3nN2kSYrbNc
         m1+m9ejmNWrz2xa17nl3fdFICPvoujm7g+JFNXAZGZEYBBFfjvjrns89jj1CryT0oZLE
         nb7cN2BbJezLQYuJ/RmdUItZgpcGYUEiAlCaLgYl17uHU1gNtYi6ehSL9P5GPWhRDJ2l
         wgSAinJkk7pCkLG+zVr0RMiDZnPOFJxLchCltU+ktnNkpd+AUWYjAi6UELgens7aoVf2
         46eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mjWbyN3QlCSRxacF3EdFD9Q6Qqvve11XewDvx8+hMpo=;
        b=YcGuIAmIBybOieRBjC1tN83LD04ANnrACC2G9br255aAFl+fmKAxN3FAgS4PHpXOet
         1sLDMsZO0IheZHT+mOS8zx4U+xqu4B1nDGqcHiXccRRDZBRBZ8KatzYir1n1RvO957LW
         gHZH+dfT3/N0ZioGzu1w63Iv2neSNk2bKW7dJUhrAy5pItiAyBLHRNwGb0JX8pLqI7RH
         xjPrBOWuhhLA37OoYwyqPyk1M8J+q9tLVFYkHF0Y98SNOACL43m6uXUtq3QW9tU8Ptwf
         +99PVxnBu5MUmst1CYoi7r1GMeyY/uIuhQWcnem2dgxsohpZi7HYMgUmubDG7s5mnpI9
         N/HA==
X-Gm-Message-State: AOAM532is/bbX0/8/vJ9605RK1O0QVFa1qMX/uNMEoZ8y4t/zcPuAErJ
        VkUkHWWj1Ge20p7ruS7S0/PPDA==
X-Google-Smtp-Source: ABdhPJzNq3NrBsdgUGhvNMpGvQtnn1ipFJ+9G5L4EDS9p0pLvxVzoDtfLf/6zBoa3mZCddCTnis+MA==
X-Received: by 2002:ac8:4d59:: with SMTP id x25mr15779216qtv.369.1612193929474;
        Mon, 01 Feb 2021 07:38:49 -0800 (PST)
Received: from localhost.localdomain (c-73-69-118-222.hsd1.nh.comcast.net. [73.69.118.222])
        by smtp.gmail.com with ESMTPSA id 22sm14853307qke.123.2021.02.01.07.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Feb 2021 07:38:48 -0800 (PST)
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
Subject: [PATCH v9 11/14] mm/gup: change index type to long as it counts pages
Date:   Mon,  1 Feb 2021 10:38:24 -0500
Message-Id: <20210201153827.444374-12-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210201153827.444374-1-pasha.tatashin@soleen.com>
References: <20210201153827.444374-1-pasha.tatashin@soleen.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

In __get_user_pages_locked() i counts number of pages which should be
long, as long is used in all other places to contain number of pages, and
32-bit becomes increasingly small for handling page count proportional
values.

Signed-off-by: Pavel Tatashin <pasha.tatashin@soleen.com>
Acked-by: Michal Hocko <mhocko@suse.com>
---
 mm/gup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/gup.c b/mm/gup.c
index df29825305f8..f98af75dab0f 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -1479,7 +1479,7 @@ static long __get_user_pages_locked(struct mm_struct *mm, unsigned long start,
 {
 	struct vm_area_struct *vma;
 	unsigned long vm_flags;
-	int i;
+	long i;
 
 	/* calculate required read or write permissions.
 	 * If FOLL_FORCE is set, we only require the "MAY" flags.
-- 
2.25.1

