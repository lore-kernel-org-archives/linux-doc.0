Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C87A5C4167B
	for <linux-doc@archiver.kernel.org>; Thu, 10 Dec 2020 00:45:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A30B62313E
	for <linux-doc@archiver.kernel.org>; Thu, 10 Dec 2020 00:45:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730130AbgLJAoi (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 9 Dec 2020 19:44:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728477AbgLJAo2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 Dec 2020 19:44:28 -0500
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA201C0611CD
        for <linux-doc@vger.kernel.org>; Wed,  9 Dec 2020 16:43:43 -0800 (PST)
Received: by mail-qk1-x744.google.com with SMTP id z11so3303322qkj.7
        for <linux-doc@vger.kernel.org>; Wed, 09 Dec 2020 16:43:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=wKF1vMMrBlL3Nf1z4M/UQUVU8LetyRUPTbIEfnAIYlQ=;
        b=gqbd9DoMaRvvzvvMIqaS5F41tXsvEg/1IPa7tX68ji4V8ZFM0lAhGyUZ1CmiVZXVSh
         biDr/Ej0RPp58RM/ATaFiF2WLnZCp9mVyqJVF8saPqoaMIdnbxPdA9IzLH1s2jY1UK4Y
         H2lHueaV79j1DW3rTXM50YMPOTq29GTP2KnfVIJxkLxzhdbc+fjGIE2Eq7Ue0jnYz0A/
         cW2to2nIGGjeyaZYDoshUaphaprRyBhQwGVqtTeymXkz9SP2YoPNh3LxiaImeY19SgbI
         w5Q+FiKl6hlqVYo0yVw5f3cEDEQ9eba8GOePohl4kJKP3tZk/EQx4jdfOaSRMeVu6A09
         tSPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wKF1vMMrBlL3Nf1z4M/UQUVU8LetyRUPTbIEfnAIYlQ=;
        b=UJJzc1N2fFnmOhP/F68lSHnOCal0lupcA/0520Tc5CPRGyBT9cUQ+LwHojz0iG7BdC
         okAheSdSoiNGUoYe14/Hhyxa3dzYAK0ca4y6681qTvPHkqL94Qo6vhqTpNKsWgqUWr9v
         tEF6O18xzOXpVrua36zURgcyNna8BzyfjUqwBMdvx3+g2BdPRtQ52Y6QL9yFR9R/V8od
         bDOCAthhr8pddepvqIA8bQt4GacN0W2/u6nQ1AtJIbPd9l5dl7su7YwZlPMOPlob9CER
         F+LdH2bUBPTnetD6GaMgOOb7mBtn4RDaXlrWiK9bDG3s6lFqlHCYoPlA1PdjcqFdH8gL
         3J6A==
X-Gm-Message-State: AOAM532s0LZUBWi+1tXbBXQGnq3+rCB0P4NdgO49e/Rt0PY9mOaC/elq
        7R9YtNnHCRXtEB9hYufaCHvifw==
X-Google-Smtp-Source: ABdhPJwVjQblG8lz4nHLZuO6EXQnNDMXKQRm0jhOeWrGTKeTLfE1Ij+ZT0B/O2DFXL+mzXgo5kPtBQ==
X-Received: by 2002:a37:8384:: with SMTP id f126mr5922627qkd.500.1607561023216;
        Wed, 09 Dec 2020 16:43:43 -0800 (PST)
Received: from localhost.localdomain (c-73-69-118-222.hsd1.nh.comcast.net. [73.69.118.222])
        by smtp.gmail.com with ESMTPSA id y1sm2538745qky.63.2020.12.09.16.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 16:43:42 -0800 (PST)
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
Subject: [PATCH v2 3/8] mm/gup: make __gup_longterm_locked common
Date:   Wed,  9 Dec 2020 19:43:30 -0500
Message-Id: <20201210004335.64634-4-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201210004335.64634-1-pasha.tatashin@soleen.com>
References: <20201210004335.64634-1-pasha.tatashin@soleen.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

__gup_longterm_locked() has CMA || FS_DAX version and a common stub
version. In the preparation of prohibiting longterm pinning of pages from
movable zone make the CMA || FS_DAX version common, and delete the stub
version.

Signed-off-by: Pavel Tatashin <pasha.tatashin@soleen.com>
Reviewed-by: John Hubbard <jhubbard@nvidia.com>
---
 mm/gup.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index 3a76c005a3e2..0e2de888a8b0 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -1567,7 +1567,6 @@ struct page *get_dump_page(unsigned long addr)
 }
 #endif /* CONFIG_ELF_CORE */
 
-#if defined(CONFIG_FS_DAX) || defined (CONFIG_CMA)
 #ifdef CONFIG_FS_DAX
 static bool check_dax_vmas(struct vm_area_struct **vmas, long nr_pages)
 {
@@ -1757,18 +1756,6 @@ static long __gup_longterm_locked(struct mm_struct *mm,
 		kfree(vmas_tmp);
 	return rc;
 }
-#else /* !CONFIG_FS_DAX && !CONFIG_CMA */
-static __always_inline long __gup_longterm_locked(struct mm_struct *mm,
-						  unsigned long start,
-						  unsigned long nr_pages,
-						  struct page **pages,
-						  struct vm_area_struct **vmas,
-						  unsigned int flags)
-{
-	return __get_user_pages_locked(mm, start, nr_pages, pages, vmas,
-				       NULL, flags);
-}
-#endif /* CONFIG_FS_DAX || CONFIG_CMA */
 
 static bool is_valid_gup_flags(unsigned int gup_flags)
 {
-- 
2.25.1

