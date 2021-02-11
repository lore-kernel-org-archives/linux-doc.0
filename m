Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68348C433DB
	for <linux-doc@archiver.kernel.org>; Thu, 11 Feb 2021 16:30:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3B8EF64EC5
	for <linux-doc@archiver.kernel.org>; Thu, 11 Feb 2021 16:30:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231830AbhBKQaB (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 11 Feb 2021 11:30:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231167AbhBKQ1j (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 11 Feb 2021 11:27:39 -0500
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com [IPv6:2607:f8b0:4864:20::f2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 953BAC061A2A
        for <linux-doc@vger.kernel.org>; Thu, 11 Feb 2021 08:24:47 -0800 (PST)
Received: by mail-qv1-xf2f.google.com with SMTP id dr7so1031306qvb.1
        for <linux-doc@vger.kernel.org>; Thu, 11 Feb 2021 08:24:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=KnIo6b0mEfBi+N6pkBoUNy3tWIMzelUSHiTa3+9/dts=;
        b=n8Eu1wdTAh9Eu4OjEcbbsCdcAWsoWpPR6r6oYR8mtb7+gOiuwlw5rBoFjWAUF1aD4T
         TXzqZomyaBngyAVAPOpRH35SWz1FaO7N8eyisU1iXK+yeL/CmG3GjMM0lbDi1VM0RU5Y
         xl005mxCvoNcjB/gA8lU6/08bS7TVoKdrR9atqFIUZ2MFTaxrnGWK7+GJeJrkaj2eBvn
         8DCsb16/e8ik7AkLva5ru4YCK7qz3//jrh0fkfWuQ2cbWV359i9AoN1BOgCZbBmwvJQ9
         I2cGyZMZKHROPHbFEIIs6foth/8gNgH54qY6OhsqfuemiSCeodc9J6/bdG1jjwja7/V9
         OaKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KnIo6b0mEfBi+N6pkBoUNy3tWIMzelUSHiTa3+9/dts=;
        b=N9IVzaVVIZydXYMgqHsuLwpqzpa7BT6+aYamEHLm2moy7R0ylvVBvcZBmGXqDfrb/F
         pPUf1uZhnD7m24czX/E4vW5vgieCpgsfH2RRN47lbkAPMZsZ0eYDEPrdW1RSjGvkz4ZU
         l7NdL35iw75+xTyTN+7h7c3e7xkCqgWJQeRJj4QK+PjpyDDU3DO89hCpH/E1lJvieu8E
         7NQ15N5sBdUr01XtWWpNnnTUEwKaYme5m2ji/3ollmyEl5wSfyiO3w/Ak0WMJGzsBzJb
         TYa72IlF0hUTDQvAVVaj3CzvLHoPkpZGrs6e5AyC3pCVzA526nE7WHrUb5lfoHfNliMV
         9wOg==
X-Gm-Message-State: AOAM533XCuhiS98nRqR0fiNbrcQa49fSKMzeWGiCI/xeoTEIKc28Wqok
        wI/UX8JrZGkqXXkdY7MEfaFDGg==
X-Google-Smtp-Source: ABdhPJzIeLzlqhbbKblTkU8XD7cXmkgY30iiBxIBBLyWnV0dtEAESq464td/C4isJdlFAK5z34rDsw==
X-Received: by 2002:ad4:554c:: with SMTP id v12mr8612729qvy.41.1613060686722;
        Thu, 11 Feb 2021 08:24:46 -0800 (PST)
Received: from localhost.localdomain (c-73-69-118-222.hsd1.nh.comcast.net. [73.69.118.222])
        by smtp.gmail.com with ESMTPSA id i23sm3831778qtq.42.2021.02.11.08.24.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Feb 2021 08:24:46 -0800 (PST)
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
Subject: [PATCH v10 11/14] mm/gup: change index type to long as it counts pages
Date:   Thu, 11 Feb 2021 11:24:24 -0500
Message-Id: <20210211162427.618913-12-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210211162427.618913-1-pasha.tatashin@soleen.com>
References: <20210211162427.618913-1-pasha.tatashin@soleen.com>
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
index ced2303dc59e..9d303c8e907f 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -1471,7 +1471,7 @@ static long __get_user_pages_locked(struct mm_struct *mm, unsigned long start,
 {
 	struct vm_area_struct *vma;
 	unsigned long vm_flags;
-	int i;
+	long i;
 
 	/* calculate required read or write permissions.
 	 * If FOLL_FORCE is set, we only require the "MAY" flags.
-- 
2.25.1

