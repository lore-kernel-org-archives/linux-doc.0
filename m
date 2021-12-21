Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9448FC433F5
	for <linux-doc@archiver.kernel.org>; Tue, 21 Dec 2021 15:47:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236763AbhLUPq7 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 21 Dec 2021 10:46:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236719AbhLUPq6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 21 Dec 2021 10:46:58 -0500
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com [IPv6:2607:f8b0:4864:20::f30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F11C0C061747
        for <linux-doc@vger.kernel.org>; Tue, 21 Dec 2021 07:46:57 -0800 (PST)
Received: by mail-qv1-xf30.google.com with SMTP id q3so5392887qvc.7
        for <linux-doc@vger.kernel.org>; Tue, 21 Dec 2021 07:46:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Xmyi2zCZ0qq0KJ7l9kYGd9/NNLTFkYCru9KHZL7RlW0=;
        b=Zvi8Rg4g886r2e8/bLoT2y0NWG6X3S56t/9kCh4NczClQm07VEJTUryxHSMYWFbEAo
         p8PMXJ28kOioXPBq0ix99dx2hczfOcjhb56wg27CwaCByKCyeYEsIq/mLoS45sgCBGeM
         fDMAZ8kDg3haHxKo30vmLRsG3wmmMiyAUkWAsdmlE9K4ZhS/Clmk7D2ouNpwtysNOU+N
         vt2wiNJ7VNXFzv5pcyJDqBeNFyaPTB6vpEDWgvRVRZtqjd7GkeD75fe5919W+lA7HGg4
         lMLeSnvReUyHifMEDe2ULS43fvlV/KZTOV2GeuXkTxivarBuppz470cyXZmtg/B6rE5q
         cwjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Xmyi2zCZ0qq0KJ7l9kYGd9/NNLTFkYCru9KHZL7RlW0=;
        b=T4iJVM26Hc0g9YjnFNMWdB/dSELbezx3e98Lt9n6VYx7whQAJnrp0p+7V5iAO6a8S3
         kNZdxpdyZ4E924HZuJdkTgmz3rOVdVJewWzJ3v8R81Tz9rhl+uZ9LzDAhLFGSVLHIHxJ
         SkPEupja5uOcAFurj9d2vcyyjn17DGDsPQTpR2aWRmuKjw/nEmvrRNFgSqR62eigA+MG
         qOH2dh+EhbVV+ezP6EyUD0Ov4FWrOfxn1pOZ6BCzT6pOYVKsKwo4gQjOE4sO3FJacq2/
         s3g71igWmRKsTwNKYLoeoLbLejB6rdT6XNu+X3szAbzfewghCZFwiAQ2/gbazJXD+g5F
         FY6A==
X-Gm-Message-State: AOAM530RpNwnnn6mE2HXMlBEO2f6b6kumxCPGA7qrBieMgGCVQPIIlz4
        RZ+7P2TLhVkHdwKk+2HG/6NL4A==
X-Google-Smtp-Source: ABdhPJwInCo1DVCqL5Hwf+MENbgmDZwkZnQaFs2cfcc4ye0/E2LpBXPTI45RluoaIQIBeUt6O6joMA==
X-Received: by 2002:ad4:4ee3:: with SMTP id dv3mr3100222qvb.8.1640101617069;
        Tue, 21 Dec 2021 07:46:57 -0800 (PST)
Received: from soleen.c.googlers.com.com (189.216.85.34.bc.googleusercontent.com. [34.85.216.189])
        by smtp.gmail.com with ESMTPSA id d20sm224588qtg.73.2021.12.21.07.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Dec 2021 07:46:56 -0800 (PST)
From:   Pasha Tatashin <pasha.tatashin@soleen.com>
To:     pasha.tatashin@soleen.com, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-doc@vger.kernel.org,
        akpm@linux-foundation.org, rientjes@google.com, pjt@google.com,
        weixugc@google.com, gthelen@google.com, mingo@redhat.com,
        corbet@lwn.net, will@kernel.org, rppt@kernel.org,
        keescook@chromium.org, tglx@linutronix.de, peterz@infradead.org,
        masahiroy@kernel.org, samitolvanen@google.com,
        dave.hansen@linux.intel.com, x86@kernel.org, frederic@kernel.org,
        hpa@zytor.com, aneesh.kumar@linux.ibm.com, jirislaby@kernel.org,
        songmuchun@bytedance.com, qydwhotmail@gmail.com, hughd@google.com
Subject: [PATCH v3 4/4] x86: mm: add x86_64 support for page table check
Date:   Tue, 21 Dec 2021 15:46:50 +0000
Message-Id: <20211221154650.1047963-5-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.34.1.307.g9b7440fafd-goog
In-Reply-To: <20211221154650.1047963-1-pasha.tatashin@soleen.com>
References: <20211221154650.1047963-1-pasha.tatashin@soleen.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add page table check hooks into routines that modify user page tables.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 arch/x86/Kconfig               |  1 +
 arch/x86/include/asm/pgtable.h | 29 +++++++++++++++++++++++++++--
 2 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 5eac1e3610e9..cc91c639acfb 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -104,6 +104,7 @@ config X86
 	select ARCH_SUPPORTS_ACPI
 	select ARCH_SUPPORTS_ATOMIC_RMW
 	select ARCH_SUPPORTS_DEBUG_PAGEALLOC
+	select ARCH_SUPPORTS_PAGE_TABLE_CHECK	if X86_64
 	select ARCH_SUPPORTS_NUMA_BALANCING	if X86_64
 	select ARCH_SUPPORTS_KMAP_LOCAL_FORCE_MAP	if NR_CPUS <= 4096
 	select ARCH_SUPPORTS_LTO_CLANG
diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index dea9fe8a56cc..8a9432fb3802 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -27,6 +27,7 @@
 #include <asm/pkru.h>
 #include <asm/fpu/api.h>
 #include <asm-generic/pgtable_uffd.h>
+#include <linux/page_table_check.h>
 
 extern pgd_t early_top_pgt[PTRS_PER_PGD];
 bool __init __early_make_pgtable(unsigned long address, pmdval_t pmd);
@@ -1007,18 +1008,21 @@ static inline pud_t native_local_pudp_get_and_clear(pud_t *pudp)
 static inline void set_pte_at(struct mm_struct *mm, unsigned long addr,
 			      pte_t *ptep, pte_t pte)
 {
+	page_table_check_pte_set(mm, addr, ptep, pte);
 	set_pte(ptep, pte);
 }
 
 static inline void set_pmd_at(struct mm_struct *mm, unsigned long addr,
 			      pmd_t *pmdp, pmd_t pmd)
 {
+	page_table_check_pmd_set(mm, addr, pmdp, pmd);
 	set_pmd(pmdp, pmd);
 }
 
 static inline void set_pud_at(struct mm_struct *mm, unsigned long addr,
 			      pud_t *pudp, pud_t pud)
 {
+	page_table_check_pud_set(mm, addr, pudp, pud);
 	native_set_pud(pudp, pud);
 }
 
@@ -1049,6 +1053,7 @@ static inline pte_t ptep_get_and_clear(struct mm_struct *mm, unsigned long addr,
 				       pte_t *ptep)
 {
 	pte_t pte = native_ptep_get_and_clear(ptep);
+	page_table_check_pte_clear(mm, addr, pte);
 	return pte;
 }
 
@@ -1064,12 +1069,23 @@ static inline pte_t ptep_get_and_clear_full(struct mm_struct *mm,
 		 * care about updates and native needs no locking
 		 */
 		pte = native_local_ptep_get_and_clear(ptep);
+		page_table_check_pte_clear(mm, addr, pte);
 	} else {
 		pte = ptep_get_and_clear(mm, addr, ptep);
 	}
 	return pte;
 }
 
+#define __HAVE_ARCH_PTEP_CLEAR
+static inline void ptep_clear(struct mm_struct *mm, unsigned long addr,
+			      pte_t *ptep)
+{
+	if (IS_ENABLED(CONFIG_PAGE_TABLE_CHECK))
+		ptep_get_and_clear(mm, addr, ptep);
+	else
+		pte_clear(mm, addr, ptep);
+}
+
 #define __HAVE_ARCH_PTEP_SET_WRPROTECT
 static inline void ptep_set_wrprotect(struct mm_struct *mm,
 				      unsigned long addr, pte_t *ptep)
@@ -1110,14 +1126,22 @@ static inline int pmd_write(pmd_t pmd)
 static inline pmd_t pmdp_huge_get_and_clear(struct mm_struct *mm, unsigned long addr,
 				       pmd_t *pmdp)
 {
-	return native_pmdp_get_and_clear(pmdp);
+	pmd_t pmd = native_pmdp_get_and_clear(pmdp);
+
+	page_table_check_pmd_clear(mm, addr, pmd);
+
+	return pmd;
 }
 
 #define __HAVE_ARCH_PUDP_HUGE_GET_AND_CLEAR
 static inline pud_t pudp_huge_get_and_clear(struct mm_struct *mm,
 					unsigned long addr, pud_t *pudp)
 {
-	return native_pudp_get_and_clear(pudp);
+	pud_t pud = native_pudp_get_and_clear(pudp);
+
+	page_table_check_pud_clear(mm, addr, pud);
+
+	return pud;
 }
 
 #define __HAVE_ARCH_PMDP_SET_WRPROTECT
@@ -1138,6 +1162,7 @@ static inline int pud_write(pud_t pud)
 static inline pmd_t pmdp_establish(struct vm_area_struct *vma,
 		unsigned long address, pmd_t *pmdp, pmd_t pmd)
 {
+	page_table_check_pmd_set(vma->vm_mm, address, pmdp, pmd);
 	if (IS_ENABLED(CONFIG_SMP)) {
 		return xchg(pmdp, pmd);
 	} else {
-- 
2.34.1.307.g9b7440fafd-goog

