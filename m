Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51333C433DB
	for <linux-doc@archiver.kernel.org>; Mon, 25 Jan 2021 04:32:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1227B22C7B
	for <linux-doc@archiver.kernel.org>; Mon, 25 Jan 2021 04:32:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726714AbhAYEcx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 24 Jan 2021 23:32:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726692AbhAYEcw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 24 Jan 2021 23:32:52 -0500
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81089C061573;
        Sun, 24 Jan 2021 20:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=S/kBVVvCcc9QWxOPDYj9Agu686Dhc2nXfs4KvSQF5E8=; b=w4IihMtqdxqs/6W4OrsEbGwUC4
        9O7Vq2kDXJKepwXHgEwxGpY+Ufw6stiAgibHyZMIVOJ0BEPn9GNLFYTR9BuPuVKXxoELU5+Z/ils2
        kqv3NhpqhTkLwAjyqUuaTDK3uNskKNCSEaCdukL5cK0F/rQuiqJoPmeA7G0Iw5umug9vtYpoD4iw/
        z25Yb0GylmIIhghr/YEEZTb7bvRW6j5xlJwVisnMJVWKf1yDMpvve6LF+scSkP7Vh1/CYAik9XEhO
        Qi/8STeWgA5XMT0nLAq5wOORAuTe4Mud7xItIrnGHehwPsOFa+peJY5TonWuNClphIgb+87871CBO
        9ZVOo89g==;
Received: from [2601:1c0:6280:3f0::7650] (helo=merlin.infradead.org)
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1l3tXt-0002Ue-FP; Mon, 25 Jan 2021 04:32:10 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
        Mike Kravetz <mike.kravetz@oracle.com>
Subject: [PATCH v2] Documentation/admin-guide: kernel-parameters: update CMA entries
Date:   Sun, 24 Jan 2021 20:32:02 -0800
Message-Id: <20210125043202.22399-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add qualifying build option legend [CMA] to kernel boot options
that requirce CMA support to be enabled for them to be usable.

Also capitalize 'CMA' when it is used as an acronym.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Cc: linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Mike Kravetz <mike.kravetz@oracle.com>
---
v2: rebase & resend

 Documentation/admin-guide/kernel-parameters.txt |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

--- linux-next-20210122.orig/Documentation/admin-guide/kernel-parameters.txt
+++ linux-next-20210122/Documentation/admin-guide/kernel-parameters.txt
@@ -631,7 +631,7 @@
 			kernel/dma/contiguous.c
 
 	cma_pernuma=nn[MG]
-			[ARM64,KNL]
+			[ARM64,KNL,CMA]
 			Sets the size of kernel per-numa memory area for
 			contiguous memory allocations. A value of 0 disables
 			per-numa CMA altogether. And If this option is not
@@ -1556,12 +1556,12 @@
 	hpet_mmap=	[X86, HPET_MMAP] Allow userspace to mmap HPET
 			registers.  Default set by CONFIG_HPET_MMAP_DEFAULT.
 
-	hugetlb_cma=	[HW] The size of a cma area used for allocation
+	hugetlb_cma=	[HW,CMA] The size of a CMA area used for allocation
 			of gigantic hugepages.
 			Format: nn[KMGTPE]
 
-			Reserve a cma area of given size and allocate gigantic
-			hugepages using the cma allocator. If enabled, the
+			Reserve a CMA area of given size and allocate gigantic
+			hugepages using the CMA allocator. If enabled, the
 			boot-time allocation of gigantic hugepages is skipped.
 
 	hugepages=	[HW] Number of HugeTLB pages to allocate at boot.
