Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49F0EC433F5
	for <linux-doc@archiver.kernel.org>; Tue, 23 Nov 2021 21:48:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237471AbhKWVvj (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 23 Nov 2021 16:51:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238593AbhKWVva (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 23 Nov 2021 16:51:30 -0500
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6676FC061714
        for <linux-doc@vger.kernel.org>; Tue, 23 Nov 2021 13:48:21 -0800 (PST)
Received: by mail-qt1-x82a.google.com with SMTP id n15so744520qta.0
        for <linux-doc@vger.kernel.org>; Tue, 23 Nov 2021 13:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=7jEGmf6rbttjf3UOaeyi0PHYHYXDyo9k0mZjDJGreuc=;
        b=OY45cGMaHwuwhn+50XLmAybbl9MI8eZLvYb7pnD4rDpzxESIxzVeYnbJewRFj1qINm
         7ORsaWn7LbWcSYRFk3VohH+fiJfOk9DBaBT9wAlY/kagnFQjbaZhnBgwcTqWeGI5juop
         XKmqhQr0S5rz0lQFtpBxf/xgshVjZyBv1jSvLEhcmONRz1diWJy2vqG1nTIIxrrkHo9B
         1tUaR1OEq9b/rpn0WdNBD0rOir6mPjBC2aTggvF8us9rbCusqlaG2NDEfd0q5eEwGgHS
         jupYGsTCvV3pw9VrivGcAorPEdVGLSO6bpE/E5mDdDrIuo9s3rQONCGAq1w43R495bay
         B6Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7jEGmf6rbttjf3UOaeyi0PHYHYXDyo9k0mZjDJGreuc=;
        b=SMnz2JL9hzbTPYkmRoE/CBIprP0U1f6zD0n0dwa/Gi2sCc/lwna7tyYIcqSbtIH1JB
         h7fAE+zvuz2N8Xo1yQqXUyQt1M1CqGdsqhLuKIsICayVJdM0P8tu/CsW/JWDJW7y5b5T
         vPJzdJmPab/RiGesSloDBnRl7PrSuruAnMZmhiQnmATM34KQ40HXGSjZFRNnGzYs3NF7
         AUdO2HgKR8V0ShlVoYsSPgDJQX03FhB5cgcy7q6ToGHGfTNEtc3E+oiMsRp9NSey06QC
         d8ID8DSEu8KGALXR4CRe5QKp3QTqoPVWeyG+NOsOdKkPkPQ+HSnbE6NVRU8rPHNbTxLE
         HlsQ==
X-Gm-Message-State: AOAM532KpjZfV1Sv37dLKwPM9yhjsWV96zie8Bii2TmjDO1hBeLZWTe/
        qX6Bj6OrugI8VF5JQdkbI5pk97cyEOjbbg==
X-Google-Smtp-Source: ABdhPJwfJm4rh6t7vgZ6WcSx/ZRS5eLjYv759nSXQbEvpf5aiIqvo72oU93vu/H+8rEOGMgMTRTY3A==
X-Received: by 2002:a05:622a:30b:: with SMTP id q11mr773158qtw.235.1637704100592;
        Tue, 23 Nov 2021 13:48:20 -0800 (PST)
Received: from soleen.c.googlers.com.com (189.216.85.34.bc.googleusercontent.com. [34.85.216.189])
        by smtp.gmail.com with ESMTPSA id i11sm7356912qko.116.2021.11.23.13.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 13:48:20 -0800 (PST)
From:   Pasha Tatashin <pasha.tatashin@soleen.com>
To:     pasha.tatashin@soleen.com, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-doc@vger.kernel.org,
        akpm@linux-foundation.org, rientjes@google.com, pjt@google.com,
        weixugc@google.com, gthelen@google.com, mingo@redhat.com,
        corbet@lwn.net, will@kernel.org, rppt@kernel.org,
        keescook@chromium.org, tglx@linutronix.de, peterz@infradead.org,
        masahiroy@kernel.org, samitolvanen@google.com,
        dave.hansen@linux.intel.com, x86@kernel.org, frederic@kernel.org,
        hpa@zytor.com, aneesh.kumar@linux.ibm.com
Subject: [PATCH 3/3] x86: mm: add x86_64 support for page table check
Date:   Tue, 23 Nov 2021 21:48:14 +0000
Message-Id: <20211123214814.3756047-4-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.34.0.rc2.393.gf8c9666880-goog
In-Reply-To: <20211123214814.3756047-1-pasha.tatashin@soleen.com>
References: <20211123214814.3756047-1-pasha.tatashin@soleen.com>
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
index 5e16393d9988..7636ea400a71 100644
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
index 448cd01eb3ec..ae34614b7e8d 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -26,6 +26,7 @@
 #include <asm/pkru.h>
 #include <asm/fpu/api.h>
 #include <asm-generic/pgtable_uffd.h>
+#include <linux/page_table_check.h>
 
 extern pgd_t early_top_pgt[PTRS_PER_PGD];
 bool __init __early_make_pgtable(unsigned long address, pmdval_t pmd);
@@ -1006,18 +1007,21 @@ static inline pud_t native_local_pudp_get_and_clear(pud_t *pudp)
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
 
@@ -1048,6 +1052,7 @@ static inline pte_t ptep_get_and_clear(struct mm_struct *mm, unsigned long addr,
 				       pte_t *ptep)
 {
 	pte_t pte = native_ptep_get_and_clear(ptep);
+	page_table_check_pte_clear(mm, addr, pte);
 	return pte;
 }
 
@@ -1063,12 +1068,23 @@ static inline pte_t ptep_get_and_clear_full(struct mm_struct *mm,
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
@@ -1109,14 +1125,22 @@ static inline int pmd_write(pmd_t pmd)
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
@@ -1137,6 +1161,7 @@ static inline int pud_write(pud_t pud)
 static inline pmd_t pmdp_establish(struct vm_area_struct *vma,
 		unsigned long address, pmd_t *pmdp, pmd_t pmd)
 {
+	page_table_check_pmd_set(vma->vm_mm, address, pmdp, pmd);
 	if (IS_ENABLED(CONFIG_SMP)) {
 		return xchg(pmdp, pmd);
 	} else {
-- 
2.34.0.rc2.393.gf8c9666880-goog

