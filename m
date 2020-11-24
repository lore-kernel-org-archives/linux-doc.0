Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DD66C64E7D
	for <linux-doc@archiver.kernel.org>; Tue, 24 Nov 2020 09:58:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 26B70206FA
	for <linux-doc@archiver.kernel.org>; Tue, 24 Nov 2020 09:58:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.b="B7s2QSZd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731681AbgKXJ56 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 24 Nov 2020 04:57:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731678AbgKXJ55 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 24 Nov 2020 04:57:57 -0500
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C138CC0613D6
        for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2020 01:57:56 -0800 (PST)
Received: by mail-pg1-x541.google.com with SMTP id 34so16998981pgp.10
        for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2020 01:57:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oSUrQajIlhHrZQJhWJQy1InopKyNlwdkkxQ0BvZwQN0=;
        b=B7s2QSZdwKs6D656MgfnkoLqCCJ2k2pYSfIOnNWNNwqAEh9uEpIuiX6LDtbE178WrC
         jjuUSq3hI3hM9sGyUKnOwI2f/d9Q40hQClsq9HYgFoO3ChJdL6Qx7I6vsp2nbvr1gRts
         qcBkPfLQu3qC95KdnFaki+XdTFWPz/K1bW75zQR8DP+pwj+gpuQifRbQCErRjYqaOurf
         KXWOnmuvUSM50zWK0gtccC3PATob4pad+REin14akFJ0RKcNtv2Fap12YEtyFV5pE4bc
         jwRhZFLQOH/bxopGPWardMumil0DeJldoqEwMI4vR86WvTDOOwS4e5JZPH+pDNUxWuEv
         wO0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oSUrQajIlhHrZQJhWJQy1InopKyNlwdkkxQ0BvZwQN0=;
        b=IOwkJX4wlyihmyKIcPUExJCz86A3WWQ1Q4CC3Vgdygg1uews29bftn9a6gtaQF9Gju
         48CbDi2utfgX/tEMPAuSpQrdXcgFIT5oQX5NDXJVOOPqN/+FLVfOqr9EXK3F7XRJs+Sq
         PVCRGwRbABkvyCM+8RvLpLs1czuO03KWfv33rD6pn34sKsJe8xFSXWjlEe05XrIFUXpu
         h/KLzOAIIhFDbFjtPQ+H8EZR8LraTTrj6e3rJzGa8tRLLIO1RVAREjtG0QJGMIVUfJRC
         MZ8ZU6zaJbGadrbBOlfs+pUG6Fhx5wQLwQpdv/dcvDavwiR3McAH4ZmyN5orPyv0x8XE
         nDxw==
X-Gm-Message-State: AOAM532Ds39k4T71C7LmpA02kZ3WnNGK4gSxWiPHsazeLoTx+mH5afBL
        I9hNOO2SIBLBgzwo1KV3H72Nzw==
X-Google-Smtp-Source: ABdhPJyMrb78F1w9ZubIENSfiY4yzl9F3+dQeY4OKhrOsOuJH8YxUhUghcDgoJFYUmMbp5zY3YWt3A==
X-Received: by 2002:a17:90a:f406:: with SMTP id ch6mr3827991pjb.134.1606211876417;
        Tue, 24 Nov 2020 01:57:56 -0800 (PST)
Received: from localhost.localdomain ([103.136.220.120])
        by smtp.gmail.com with ESMTPSA id t20sm2424562pjg.25.2020.11.24.01.57.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Nov 2020 01:57:55 -0800 (PST)
From:   Muchun Song <songmuchun@bytedance.com>
To:     corbet@lwn.net, mike.kravetz@oracle.com, tglx@linutronix.de,
        mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
        dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
        viro@zeniv.linux.org.uk, akpm@linux-foundation.org,
        paulmck@kernel.org, mchehab+huawei@kernel.org,
        pawan.kumar.gupta@linux.intel.com, rdunlap@infradead.org,
        oneukum@suse.com, anshuman.khandual@arm.com, jroedel@suse.de,
        almasrymina@google.com, rientjes@google.com, willy@infradead.org,
        osalvador@suse.de, mhocko@suse.com, song.bao.hua@hisilicon.com
Cc:     duanxiongchun@bytedance.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-fsdevel@vger.kernel.org,
        Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v6 07/16] x86/mm/64: Disable PMD page mapping of vmemmap
Date:   Tue, 24 Nov 2020 17:52:50 +0800
Message-Id: <20201124095259.58755-8-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
In-Reply-To: <20201124095259.58755-1-songmuchun@bytedance.com>
References: <20201124095259.58755-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

If we enable the CONFIG_HUGETLB_PAGE_FREE_VMEMMAP, we can just
disbale PMD page mapping of vmemmap to simplify the code. In this
case, we do not need complex code doing vmemmap page table
manipulation. This is a way to simply the first version of this
patch series. In the future, we can add some code doing page table
manipulation.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 arch/x86/mm/init_64.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
index 0435bee2e172..155cb06a6961 100644
--- a/arch/x86/mm/init_64.c
+++ b/arch/x86/mm/init_64.c
@@ -1557,7 +1557,9 @@ int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
 {
 	int err;
 
-	if (end - start < PAGES_PER_SECTION * sizeof(struct page))
+	if (IS_ENABLED(CONFIG_HUGETLB_PAGE_FREE_VMEMMAP))
+		err = vmemmap_populate_basepages(start, end, node, NULL);
+	else if (end - start < PAGES_PER_SECTION * sizeof(struct page))
 		err = vmemmap_populate_basepages(start, end, node, NULL);
 	else if (boot_cpu_has(X86_FEATURE_PSE))
 		err = vmemmap_populate_hugepages(start, end, node, altmap);
@@ -1610,7 +1612,8 @@ void register_page_bootmem_memmap(unsigned long section_nr,
 		}
 		get_page_bootmem(section_nr, pud_page(*pud), MIX_SECTION_INFO);
 
-		if (!boot_cpu_has(X86_FEATURE_PSE)) {
+		if (!boot_cpu_has(X86_FEATURE_PSE) ||
+		    IS_ENABLED(CONFIG_HUGETLB_PAGE_FREE_VMEMMAP)) {
 			next = (addr + PAGE_SIZE) & PAGE_MASK;
 			pmd = pmd_offset(pud, addr);
 			if (pmd_none(*pmd))
-- 
2.11.0

