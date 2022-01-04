Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88544C4332F
	for <linux-doc@archiver.kernel.org>; Tue,  4 Jan 2022 20:23:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232589AbiADUXa (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 4 Jan 2022 15:23:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232570AbiADUX0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 4 Jan 2022 15:23:26 -0500
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAD94C061784
        for <linux-doc@vger.kernel.org>; Tue,  4 Jan 2022 12:23:24 -0800 (PST)
Received: by mail-yb1-xb49.google.com with SMTP id d5-20020a25be45000000b0060fdc206836so9482803ybm.21
        for <linux-doc@vger.kernel.org>; Tue, 04 Jan 2022 12:23:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=ErZiUixWH/cJcxMlnoQDl0hBUoB+SSs91qpm5nkbK+Y=;
        b=cxbZdvswWE7RZvP9IvXMveg8yKckpkPwQ+2pB0JQtZNGJXgw/zJq3qgpnGHQxcj1Ve
         fc0QlCSku5oy+ODBWo6NEXfA/YEXTUwkxcLs+1/h0xJwL6SJzuX4uEZmWHIGpcH0n9Ok
         eZWg03zHKsitT8bXnSMhZa+ECdO7xPzvlef6DCD4BJC3skgbIcsadIlpon94Xlikm+27
         FhxtE4Qaj0JgRvBaw+KRd/WKcxzY16fsX8Lg7slcr+PjLXtluL865vIv0C/1J9GvNy22
         8Z4xo/oacDiHAWF+grA8rPcZ0B+jiekIu5vNFhRTHnNxKctkTj7ZTMyM2D0g0QD0nF/1
         u5eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=ErZiUixWH/cJcxMlnoQDl0hBUoB+SSs91qpm5nkbK+Y=;
        b=XA3V+Ru3Mzsahip7Ho/e4bK3wIYq8b3ntbA2n9TqhgQWJDQsS3I2dTEM5lbgAvcDrO
         z4yhV6neFnfMBgyYkncqOy6WPjAksRvGPCaCq90rEDIOlzKb11Avp9ClznCm5CvSO5sx
         Q/MpRjNUpFUnbo6Vs8H/aPr713AnPf/8tdmc6gOdHIXqm0gkiq0FkFXiwXzUldOAUcqa
         W2T7ENvhrHbO5drvWVhS2dIBP5PFQ12IWVIukeDcO1Ekd8PrI6bnrgeaEoFi1JJTNe61
         gD3yGygxU5+K118rb4DIcePvonGdVUzFbH+6nS8n7uZGzWRx+6tXjs7oZ9+HE/Bc6L/j
         uUxA==
X-Gm-Message-State: AOAM530X0UtE/P7+RVjEU9PTtTWeJFGMv346Zxx6nQC9obv1UY/Wh7dQ
        fB2LbKGbD1fBz3cRuUQ/Zkny2WmgmwQ=
X-Google-Smtp-Source: ABdhPJw5uU6Ej243oVr18SKxslk8lmcRKMlrIEw/dUnqkaxEwutRtnYpOs55oumSEq1IaOOSKJErme31+Xo=
X-Received: from yuzhao.bld.corp.google.com ([2620:15c:183:200:6c8c:5506:7ca2:9dfd])
 (user=yuzhao job=sendgmr) by 2002:a25:2554:: with SMTP id l81mr42813951ybl.101.1641327804159;
 Tue, 04 Jan 2022 12:23:24 -0800 (PST)
Date:   Tue,  4 Jan 2022 13:22:21 -0700
In-Reply-To: <20220104202227.2903605-1-yuzhao@google.com>
Message-Id: <20220104202227.2903605-3-yuzhao@google.com>
Mime-Version: 1.0
References: <20220104202227.2903605-1-yuzhao@google.com>
X-Mailer: git-send-email 2.34.1.448.ga2b2bfdf31-goog
Subject: [PATCH v6 2/9] mm: x86: add CONFIG_ARCH_HAS_NONLEAF_PMD_YOUNG
From:   Yu Zhao <yuzhao@google.com>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Andi Kleen <ak@linux.intel.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Hillf Danton <hdanton@sina.com>, Jens Axboe <axboe@kernel.dk>,
        Jesse Barnes <jsbarnes@google.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Matthew Wilcox <willy@infradead.org>,
        Mel Gorman <mgorman@suse.de>,
        Michael Larabel <Michael@michaellarabel.com>,
        Michal Hocko <mhocko@kernel.org>,
        Rik van Riel <riel@surriel.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Will Deacon <will@kernel.org>,
        Ying Huang <ying.huang@intel.com>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        page-reclaim@google.com, x86@kernel.org,
        Yu Zhao <yuzhao@google.com>,
        Konstantin Kharlamov <Hi-Angel@yandex.ru>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Some architectures support the accessed bit in non-leaf PMD entries,
e.g., x86_64 sets the accessed bit in a non-leaf PMD entry when using
it as part of linear address translation [1]. Page table walkers that
clear the accessed bit may use this feature to reduce their search
space.

Although an inline function is preferable, this capability is added as
a configuration option for the consistency with the existing macros.

[1]: Intel 64 and IA-32 Architectures Software Developer's Manual
     Volume 3 (June 2021), section 4.8

Signed-off-by: Yu Zhao <yuzhao@google.com>
Tested-by: Konstantin Kharlamov <Hi-Angel@yandex.ru>
---
 arch/Kconfig                   | 9 +++++++++
 arch/x86/Kconfig               | 1 +
 arch/x86/include/asm/pgtable.h | 3 ++-
 arch/x86/mm/pgtable.c          | 5 ++++-
 include/linux/pgtable.h        | 4 ++--
 5 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index d3c4ab249e9c..10f564340f79 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -1312,6 +1312,15 @@ config ARCH_HAS_PARANOID_L1D_FLUSH
 config DYNAMIC_SIGFRAME
 	bool
 
+config ARCH_HAS_NONLEAF_PMD_YOUNG
+	bool
+	depends on PGTABLE_LEVELS > 2
+	help
+	  Architectures that select this option are capable of setting the
+	  accessed bit in non-leaf PMD entries when using them as part of linear
+	  address translations. Page table walkers that clear the accessed bit
+	  may use this feature to reduce their search space.
+
 source "kernel/gcov/Kconfig"
 
 source "scripts/gcc-plugins/Kconfig"
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 5c2ccb85f2ef..5a4843242f09 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -85,6 +85,7 @@ config X86
 	select ARCH_HAS_PMEM_API		if X86_64
 	select ARCH_HAS_PTE_DEVMAP		if X86_64
 	select ARCH_HAS_PTE_SPECIAL
+	select ARCH_HAS_NONLEAF_PMD_YOUNG	if X86_64
 	select ARCH_HAS_UACCESS_FLUSHCACHE	if X86_64
 	select ARCH_HAS_COPY_MC			if X86_64
 	select ARCH_HAS_SET_MEMORY
diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index c60b16f8b741..36205ec0acac 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -817,7 +817,8 @@ static inline unsigned long pmd_page_vaddr(pmd_t pmd)
 
 static inline int pmd_bad(pmd_t pmd)
 {
-	return (pmd_flags(pmd) & ~_PAGE_USER) != _KERNPG_TABLE;
+	return (pmd_flags(pmd) & ~(_PAGE_USER | _PAGE_ACCESSED)) !=
+	       (_KERNPG_TABLE & ~_PAGE_ACCESSED);
 }
 
 static inline unsigned long pages_to_mb(unsigned long npg)
diff --git a/arch/x86/mm/pgtable.c b/arch/x86/mm/pgtable.c
index 3481b35cb4ec..a224193d84bf 100644
--- a/arch/x86/mm/pgtable.c
+++ b/arch/x86/mm/pgtable.c
@@ -550,7 +550,7 @@ int ptep_test_and_clear_young(struct vm_area_struct *vma,
 	return ret;
 }
 
-#ifdef CONFIG_TRANSPARENT_HUGEPAGE
+#if defined(CONFIG_TRANSPARENT_HUGEPAGE) || defined(CONFIG_ARCH_HAS_NONLEAF_PMD_YOUNG)
 int pmdp_test_and_clear_young(struct vm_area_struct *vma,
 			      unsigned long addr, pmd_t *pmdp)
 {
@@ -562,6 +562,9 @@ int pmdp_test_and_clear_young(struct vm_area_struct *vma,
 
 	return ret;
 }
+#endif
+
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
 int pudp_test_and_clear_young(struct vm_area_struct *vma,
 			      unsigned long addr, pud_t *pudp)
 {
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 53bd6a26918f..b51f939a73f7 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -211,7 +211,7 @@ static inline int ptep_test_and_clear_young(struct vm_area_struct *vma,
 #endif
 
 #ifndef __HAVE_ARCH_PMDP_TEST_AND_CLEAR_YOUNG
-#ifdef CONFIG_TRANSPARENT_HUGEPAGE
+#if defined(CONFIG_TRANSPARENT_HUGEPAGE) || defined(CONFIG_ARCH_HAS_NONLEAF_PMD_YOUNG)
 static inline int pmdp_test_and_clear_young(struct vm_area_struct *vma,
 					    unsigned long address,
 					    pmd_t *pmdp)
@@ -232,7 +232,7 @@ static inline int pmdp_test_and_clear_young(struct vm_area_struct *vma,
 	BUILD_BUG();
 	return 0;
 }
-#endif /* CONFIG_TRANSPARENT_HUGEPAGE */
+#endif /* CONFIG_TRANSPARENT_HUGEPAGE || CONFIG_ARCH_HAS_NONLEAF_PMD_YOUNG */
 #endif
 
 #ifndef __HAVE_ARCH_PTEP_CLEAR_YOUNG_FLUSH
-- 
2.34.1.448.ga2b2bfdf31-goog

