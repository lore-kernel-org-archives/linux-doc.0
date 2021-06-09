Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4E26C48BCF
	for <linux-doc@archiver.kernel.org>; Wed,  9 Jun 2021 12:17:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C75BF61351
	for <linux-doc@archiver.kernel.org>; Wed,  9 Jun 2021 12:17:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234522AbhFIMTj (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 9 Jun 2021 08:19:39 -0400
Received: from mail-pj1-f50.google.com ([209.85.216.50]:54028 "EHLO
        mail-pj1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230303AbhFIMTj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 Jun 2021 08:19:39 -0400
Received: by mail-pj1-f50.google.com with SMTP id ei4so1223963pjb.3
        for <linux-doc@vger.kernel.org>; Wed, 09 Jun 2021 05:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vy2vVe473iC0KFAOyJz/xUTl6s66HkwJPteHv90RCR4=;
        b=UYsb96zxHNzDVv58SGuFNoM6Oquj4+VDx3w5pjoq90F1hKpgb70LeDcKzYdewfO9+y
         vzCGoB/6uXnCU3WlBsvDTfTWTra7WQfFi9wa+5anAgVVGrQRaRgyCOHfP7s9FNmY6lDB
         zgHN8LF6CUEdi+kmie8hLZOS+d6EGeTB4/SRCU3v1KrpmIU7XzaKKELbo/7xCDcHs7Wy
         t74LrOZs+f7/ajBn+jBzXIUw93l4VtQJBJk3JeZVRPqewPS8IN4G/aF2R9VLweQzAEjo
         5c9BldllaK/gpAUtnHLuOf88ZC6svddAnUlcN/9a1MrXlPn6bwM9N3lEWl3NFRoopmVj
         XwKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vy2vVe473iC0KFAOyJz/xUTl6s66HkwJPteHv90RCR4=;
        b=sRBM3Dou7bsgr6dvwPmy1i6JNJgqYHhrhZnPIG0bgWkZpzJCGkNbwQn5s+G6kIDdMU
         Xw4GSkcHc6BzZyalyAYFn64ycodW6rbYjIRC00yq/+9Eq/kflhAwCSkcksFuThOh5Nuj
         XmIvbXQN4UkkOxeTyfcisMRMiO6c6aN3fmBTvjC/yqPQEEYeDTiVHjLmSPtiK+wBxXyK
         X/7PzWx8oJBCpjR7j7B10JIg5UydEDA6xiJhK/VN4BOuSYNVuPNasv6SG2YYmCNIoy+H
         vz8qaS7wsWCEPCa9iiliATzO3Ca3g+5Wqxvx9sTpK3VDcFcCLVVFigqXkSWRZKPMJToS
         Ix1A==
X-Gm-Message-State: AOAM532E6la/bGBl/P5fMEHVfHDPeEHpvkn2rMa6W1gWh4e2MRmXszl0
        sQ+ia4eobBI4+jV4/0SgJWeZeA==
X-Google-Smtp-Source: ABdhPJzLaWWfHVtSZ3+fY3NWpPqUPpix3owtwLIGLB42Oi9QcZ2FGMjZ/s9C4Z7llgAw1/4gonqY3g==
X-Received: by 2002:a17:902:c78a:b029:109:edbb:44de with SMTP id w10-20020a170902c78ab0290109edbb44demr4744623pla.6.1623240988524;
        Wed, 09 Jun 2021 05:16:28 -0700 (PDT)
Received: from localhost.localdomain ([139.177.225.254])
        by smtp.gmail.com with ESMTPSA id h16sm13689224pfk.119.2021.06.09.05.16.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 09 Jun 2021 05:16:28 -0700 (PDT)
From:   Muchun Song <songmuchun@bytedance.com>
To:     mike.kravetz@oracle.com, akpm@linux-foundation.org,
        osalvador@suse.de, mhocko@suse.com, song.bao.hua@hisilicon.com,
        david@redhat.com, chenhuang5@huawei.com, bodeddub@amazon.com,
        corbet@lwn.net
Cc:     duanxiongchun@bytedance.com, fam.zheng@bytedance.com,
        zhengqi.arch@bytedance.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH 4/5] mm: sparsemem: use huge PMD mapping for vmemmap pages
Date:   Wed,  9 Jun 2021 20:13:09 +0800
Message-Id: <20210609121310.62229-5-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
In-Reply-To: <20210609121310.62229-1-songmuchun@bytedance.com>
References: <20210609121310.62229-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The preparation of splitting huge PMD mapping of vmemmap pages is ready,
so switch the mapping from PTE to PMD.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 Documentation/admin-guide/kernel-parameters.txt |  7 -------
 arch/x86/mm/init_64.c                           |  8 ++------
 include/linux/hugetlb.h                         | 25 ++++++-------------------
 mm/memory_hotplug.c                             |  2 +-
 4 files changed, 9 insertions(+), 33 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index db1ef6739613..a01aadafee38 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1599,13 +1599,6 @@
 			enabled.
 			Allows heavy hugetlb users to free up some more
 			memory (6 * PAGE_SIZE for each 2MB hugetlb page).
-			This feauture is not free though. Large page
-			tables are not used to back vmemmap pages which
-			can lead to a performance degradation for some
-			workloads. Also there will be memory allocation
-			required when hugetlb pages are freed from the
-			pool which can lead to corner cases under heavy
-			memory pressure.
 			Format: { on | off (default) }
 
 			on:  enable the feature
diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
index 9d9d18d0c2a1..65ea58527176 100644
--- a/arch/x86/mm/init_64.c
+++ b/arch/x86/mm/init_64.c
@@ -34,7 +34,6 @@
 #include <linux/gfp.h>
 #include <linux/kcore.h>
 #include <linux/bootmem_info.h>
-#include <linux/hugetlb.h>
 
 #include <asm/processor.h>
 #include <asm/bios_ebda.h>
@@ -1610,8 +1609,7 @@ int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
 	VM_BUG_ON(!IS_ALIGNED(start, PAGE_SIZE));
 	VM_BUG_ON(!IS_ALIGNED(end, PAGE_SIZE));
 
-	if ((is_hugetlb_free_vmemmap_enabled()  && !altmap) ||
-	    end - start < PAGES_PER_SECTION * sizeof(struct page))
+	if (end - start < PAGES_PER_SECTION * sizeof(struct page))
 		err = vmemmap_populate_basepages(start, end, node, NULL);
 	else if (boot_cpu_has(X86_FEATURE_PSE))
 		err = vmemmap_populate_hugepages(start, end, node, altmap);
@@ -1639,8 +1637,6 @@ void register_page_bootmem_memmap(unsigned long section_nr,
 	pmd_t *pmd;
 	unsigned int nr_pmd_pages;
 	struct page *page;
-	bool base_mapping = !boot_cpu_has(X86_FEATURE_PSE) ||
-			    is_hugetlb_free_vmemmap_enabled();
 
 	for (; addr < end; addr = next) {
 		pte_t *pte = NULL;
@@ -1666,7 +1662,7 @@ void register_page_bootmem_memmap(unsigned long section_nr,
 		}
 		get_page_bootmem(section_nr, pud_page(*pud), MIX_SECTION_INFO);
 
-		if (base_mapping) {
+		if (!boot_cpu_has(X86_FEATURE_PSE)) {
 			next = (addr + PAGE_SIZE) & PAGE_MASK;
 			pmd = pmd_offset(pud, addr);
 			if (pmd_none(*pmd))
diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index c27a299c4211..2b46e6494114 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -907,20 +907,6 @@ static inline void huge_ptep_modify_prot_commit(struct vm_area_struct *vma,
 }
 #endif
 
-#ifdef CONFIG_HUGETLB_PAGE_FREE_VMEMMAP
-extern bool hugetlb_free_vmemmap_enabled;
-
-static inline bool is_hugetlb_free_vmemmap_enabled(void)
-{
-	return hugetlb_free_vmemmap_enabled;
-}
-#else
-static inline bool is_hugetlb_free_vmemmap_enabled(void)
-{
-	return false;
-}
-#endif
-
 #else	/* CONFIG_HUGETLB_PAGE */
 struct hstate {};
 
@@ -1080,13 +1066,14 @@ static inline void set_huge_swap_pte_at(struct mm_struct *mm, unsigned long addr
 					pte_t *ptep, pte_t pte, unsigned long sz)
 {
 }
-
-static inline bool is_hugetlb_free_vmemmap_enabled(void)
-{
-	return false;
-}
 #endif	/* CONFIG_HUGETLB_PAGE */
 
+#ifdef CONFIG_HUGETLB_PAGE_FREE_VMEMMAP
+extern bool hugetlb_free_vmemmap_enabled;
+#else
+#define hugetlb_free_vmemmap_enabled	false
+#endif
+
 static inline spinlock_t *huge_pte_lock(struct hstate *h,
 					struct mm_struct *mm, pte_t *pte)
 {
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index d96a3c7551c8..9d8a551c08d5 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1056,7 +1056,7 @@ bool mhp_supports_memmap_on_memory(unsigned long size)
 	 *       populate a single PMD.
 	 */
 	return memmap_on_memory &&
-	       !is_hugetlb_free_vmemmap_enabled() &&
+	       !hugetlb_free_vmemmap_enabled &&
 	       IS_ENABLED(CONFIG_MHP_MEMMAP_ON_MEMORY) &&
 	       size == memory_block_size_bytes() &&
 	       IS_ALIGNED(vmemmap_size, PMD_SIZE) &&
-- 
2.11.0

