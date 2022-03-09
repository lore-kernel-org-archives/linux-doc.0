Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02E37C433FE
	for <linux-doc@archiver.kernel.org>; Wed,  9 Mar 2022 02:13:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231357AbiCICO0 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 8 Mar 2022 21:14:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231356AbiCICOZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Mar 2022 21:14:25 -0500
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74BE1637D
        for <linux-doc@vger.kernel.org>; Tue,  8 Mar 2022 18:13:25 -0800 (PST)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-2dcc326fc4dso5937267b3.16
        for <linux-doc@vger.kernel.org>; Tue, 08 Mar 2022 18:13:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc:content-transfer-encoding;
        bh=rg3wku5xl2PL1N8SWaxt6E1BdTA98F4PakQ3p281Xms=;
        b=nEmItpTLFzmEpkQdZ6HtfDVVI0HoiNzdZyImfv1khSwWR1+VTwzx196eg9+HBnqc2g
         4BkDdxh0ll2AH4+uxMGQ0G0W0w9eYS3wcQtzkyHucA9fkZ+UTRk5yRpsUq+Io7Z9uDAw
         1YyPHJiQfFCfTRjNU8tKCQ/z2nL27QpA88rFI1IZNbNoYDoVvoulshTlz2V2wWF2e69D
         iQ2Ao/fe+rGGkv4CDwpNDg8ui+QtZeJNkjHRRwAn4CRg5vgbGbQAHHqZmwzk0BOvmIyy
         R5X5+tffvWhOb+Fk+8qJk4Qs/M11pB1BsmYAZ31SqghbWd3qO5rn5ggNxR35+ffS6Ny9
         TZUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc:content-transfer-encoding;
        bh=rg3wku5xl2PL1N8SWaxt6E1BdTA98F4PakQ3p281Xms=;
        b=5mlsznPnbzmIATtPMY3ydXi/d90bvOA4DRKVZT8VRC6PiBut0lIqcwvVz0qFNWq092
         LZurUnb9s/5G+fBEshhPCxq+SgaZA7yNtzX8KSNsh2DUiSGLlkhHD7K/r+GBJRpXFEnq
         jlWfKsJxpzX4HBIWhmadz8Vot+yG/d/dXESOH1Y+KkIHHfX9kPosSICSHLQWYNlFXE+J
         2rl57Sm37Ew0FTBo6ddbSjy3fDnkQxUPz50JRen8pKUyv0MGMnIoB7p+QI5dO2nuug5b
         ahkJy00GHG93wsoESdTTH1s37NVwmf17lVeefHA/6VE5bpau/DeYkLuBfhn1HtQanvwL
         XNAA==
X-Gm-Message-State: AOAM531+8wxikfkb8DyD4K6oSx7yFUWTNeQxme4putYLb19WDqBtkq54
        UjSNHklWt2TwdhkyPax071cOZYgLXYs=
X-Google-Smtp-Source: ABdhPJw9/JKbj0bOT+fBPxqSrCTUh59PyXYEJ8rk8m0oESXRRSVh7FDaOlHzYCErBJIQpbA9pgyuVHGCuaU=
X-Received: from yuzhao.bld.corp.google.com ([2620:15c:183:200:57a6:54a6:aad1:c0a8])
 (user=yuzhao job=sendgmr) by 2002:a81:3a44:0:b0:2dc:e978:2099 with SMTP id
 h65-20020a813a44000000b002dce9782099mr8419302ywa.166.1646792004552; Tue, 08
 Mar 2022 18:13:24 -0800 (PST)
Date:   Tue,  8 Mar 2022 19:12:18 -0700
In-Reply-To: <20220309021230.721028-1-yuzhao@google.com>
Message-Id: <20220309021230.721028-2-yuzhao@google.com>
Mime-Version: 1.0
References: <20220309021230.721028-1-yuzhao@google.com>
X-Mailer: git-send-email 2.35.1.616.g0bdcbb4464-goog
Subject: [PATCH v9 01/14] mm: x86, arm64: add arch_has_hw_pte_young()
From:   Yu Zhao <yuzhao@google.com>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Andi Kleen <ak@linux.intel.com>,
        Aneesh Kumar <aneesh.kumar@linux.ibm.com>,
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
        Mike Rapoport <rppt@kernel.org>,
        Rik van Riel <riel@surriel.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Will Deacon <will@kernel.org>,
        Ying Huang <ying.huang@intel.com>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        page-reclaim@google.com, x86@kernel.org,
        Yu Zhao <yuzhao@google.com>, Brian Geffon <bgeffon@google.com>,
        Jan Alexander Steffens <heftig@archlinux.org>,
        Oleksandr Natalenko <oleksandr@natalenko.name>,
        Steven Barrett <steven@liquorix.net>,
        Suleiman Souhlal <suleiman@google.com>,
        Daniel Byrne <djbyrne@mtu.edu>,
        Donald Carr <d@chaos-reins.com>,
        "=?UTF-8?q?Holger=20Hoffst=C3=A4tte?=" 
        <holger@applied-asynchrony.com>,
        Konstantin Kharlamov <Hi-Angel@yandex.ru>,
        Shuang Zhai <szhai2@cs.rochester.edu>,
        Sofia Trinh <sofia.trinh@edi.works>,
        Vaibhav Jain <vaibhav@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Some architectures automatically set the accessed bit in PTEs, e.g.,
x86 and arm64 v8.2. On architectures that do not have this capability,
clearing the accessed bit in a PTE usually triggers a page fault
following the TLB miss of this PTE (to emulate the accessed bit).

Being aware of this capability can help make better decisions, e.g.,
whether to spread the work out over a period of time to reduce bursty
page faults when trying to clear the accessed bit in many PTEs.

Note that theoretically this capability can be unreliable, e.g.,
hotplugged CPUs might be different from builtin ones. Therefore it
should not be used in architecture-independent code that involves
correctness, e.g., to determine whether TLB flushes are required (in
combination with the accessed bit).

Signed-off-by: Yu Zhao <yuzhao@google.com>
Acked-by: Brian Geffon <bgeffon@google.com>
Acked-by: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
Acked-by: Oleksandr Natalenko <oleksandr@natalenko.name>
Acked-by: Steven Barrett <steven@liquorix.net>
Acked-by: Suleiman Souhlal <suleiman@google.com>
Acked-by: Will Deacon <will@kernel.org>
Tested-by: Daniel Byrne <djbyrne@mtu.edu>
Tested-by: Donald Carr <d@chaos-reins.com>
Tested-by: Holger Hoffst=C3=A4tte <holger@applied-asynchrony.com>
Tested-by: Konstantin Kharlamov <Hi-Angel@yandex.ru>
Tested-by: Shuang Zhai <szhai2@cs.rochester.edu>
Tested-by: Sofia Trinh <sofia.trinh@edi.works>
Tested-by: Vaibhav Jain <vaibhav@linux.ibm.com>
---
 arch/arm64/include/asm/pgtable.h | 14 ++------------
 arch/x86/include/asm/pgtable.h   |  6 +++---
 include/linux/pgtable.h          | 13 +++++++++++++
 mm/memory.c                      | 14 +-------------
 4 files changed, 19 insertions(+), 28 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgta=
ble.h
index c4ba047a82d2..990358eca359 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -999,23 +999,13 @@ static inline void update_mmu_cache(struct vm_area_st=
ruct *vma,
  * page after fork() + CoW for pfn mappings. We don't always have a
  * hardware-managed access flag on arm64.
  */
-static inline bool arch_faults_on_old_pte(void)
-{
-	WARN_ON(preemptible());
-
-	return !cpu_has_hw_af();
-}
-#define arch_faults_on_old_pte		arch_faults_on_old_pte
+#define arch_has_hw_pte_young		cpu_has_hw_af
=20
 /*
  * Experimentally, it's cheap to set the access flag in hardware and we
  * benefit from prefaulting mappings as 'old' to start with.
  */
-static inline bool arch_wants_old_prefaulted_pte(void)
-{
-	return !arch_faults_on_old_pte();
-}
-#define arch_wants_old_prefaulted_pte	arch_wants_old_prefaulted_pte
+#define arch_wants_old_prefaulted_pte	cpu_has_hw_af
=20
 static inline pgprot_t arch_filter_pgprot(pgprot_t prot)
 {
diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.=
h
index 8a9432fb3802..60b6ce45c2e3 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -1423,10 +1423,10 @@ static inline bool arch_has_pfn_modify_check(void)
 	return boot_cpu_has_bug(X86_BUG_L1TF);
 }
=20
-#define arch_faults_on_old_pte arch_faults_on_old_pte
-static inline bool arch_faults_on_old_pte(void)
+#define arch_has_hw_pte_young arch_has_hw_pte_young
+static inline bool arch_has_hw_pte_young(void)
 {
-	return false;
+	return true;
 }
=20
 #endif	/* __ASSEMBLY__ */
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index f4f4077b97aa..79f64dcff07d 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -259,6 +259,19 @@ static inline int pmdp_clear_flush_young(struct vm_are=
a_struct *vma,
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 #endif
=20
+#ifndef arch_has_hw_pte_young
+/*
+ * Return whether the accessed bit is supported on the local CPU.
+ *
+ * This stub assumes accessing through an old PTE triggers a page fault.
+ * Architectures that automatically set the access bit should overwrite it=
.
+ */
+static inline bool arch_has_hw_pte_young(void)
+{
+	return false;
+}
+#endif
+
 #ifndef __HAVE_ARCH_PTEP_CLEAR
 static inline void ptep_clear(struct mm_struct *mm, unsigned long addr,
 			      pte_t *ptep)
diff --git a/mm/memory.c b/mm/memory.c
index c125c4969913..a7379196a47e 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -122,18 +122,6 @@ int randomize_va_space __read_mostly =3D
 					2;
 #endif
=20
-#ifndef arch_faults_on_old_pte
-static inline bool arch_faults_on_old_pte(void)
-{
-	/*
-	 * Those arches which don't have hw access flag feature need to
-	 * implement their own helper. By default, "true" means pagefault
-	 * will be hit on old pte.
-	 */
-	return true;
-}
-#endif
-
 #ifndef arch_wants_old_prefaulted_pte
 static inline bool arch_wants_old_prefaulted_pte(void)
 {
@@ -2778,7 +2766,7 @@ static inline bool cow_user_page(struct page *dst, st=
ruct page *src,
 	 * On architectures with software "accessed" bits, we would
 	 * take a double page fault, so mark it accessed here.
 	 */
-	if (arch_faults_on_old_pte() && !pte_young(vmf->orig_pte)) {
+	if (!arch_has_hw_pte_young() && !pte_young(vmf->orig_pte)) {
 		pte_t entry;
=20
 		vmf->pte =3D pte_offset_map_lock(mm, vmf->pmd, addr, &vmf->ptl);
--=20
2.35.1.616.g0bdcbb4464-goog

