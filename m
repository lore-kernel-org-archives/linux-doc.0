Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC8F0C433EF
	for <linux-doc@archiver.kernel.org>; Tue, 16 Nov 2021 22:00:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9848A63222
	for <linux-doc@archiver.kernel.org>; Tue, 16 Nov 2021 22:00:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231823AbhKPWDm (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 16 Nov 2021 17:03:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231774AbhKPWDl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 16 Nov 2021 17:03:41 -0500
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37AC5C061570
        for <linux-doc@vger.kernel.org>; Tue, 16 Nov 2021 14:00:44 -0800 (PST)
Received: by mail-qk1-x733.google.com with SMTP id 193so411730qkh.10
        for <linux-doc@vger.kernel.org>; Tue, 16 Nov 2021 14:00:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=G1vrXLeEkHaL38rZeKIone4HWwJFBBENMbtQcmlY9TE=;
        b=g43F9JAkc38jKChhi+Enq5azWqDCveDPFo9GQvxs1HOambiVhd/Q9/G2nOkgHQ90+/
         VdJSyJObxRWYtrGT8OX+1tXaMocpk279N1krNbEkZQ5ZYz+vD9Cr1NRFfAkHy6cy0Qp5
         B7cF6yANqoD3FiElqjsCvFhA+lkUmtv+T96aeTaf0MRYhn2yr+zoUVm7fDlTEu5fNIb7
         EmY28xIYxBP25lvZS7/V/Ut9l/61MormaCrfPZjsBUrlTuhK3LO/EKuaG8/MBZuSMLUv
         CAW3lP3q/SnjGSfXquWdLJtGHuVkZPJd+BbzBZcvNDtRwJz542CU8hZnat5MN186NduJ
         itZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=G1vrXLeEkHaL38rZeKIone4HWwJFBBENMbtQcmlY9TE=;
        b=CTxAcGVTzgGzH3gPhIbTZf/X0unXzKppl03mrPAhhWDh84yFPBn/p5QZF+OqNqobxu
         nwOsCRnC3HHgZTAJQYwpfIkkJIMnhxW07h6uDmMFbLpVej6vMpg5L+DbGvxos78irYmc
         V3piy6CPwckRR0JP82octA9mLlcuYaz0sheGVJoeE4FmHRfFUOXB0cCqAYhdJv5BZJCe
         pdBI6IpXH0+gQt8Ey/xhyhVCF1XMVJcVS4VjseFKosj+EZJLx7CFYE5IhUeyApMMKRZQ
         cz14yC4d7pGUqf6TRljZ9GHaQE/Lf8wcJ/chyU+kKHV0Wd9s9xjbkZE736e2f3DbvfTK
         yl8g==
X-Gm-Message-State: AOAM530kgUJHxOxVEeDitIT3wj8Vb0+GXvKNLymHlxaoULvd7bymlyoa
        NZnclZB0vIkMHt9aV8KANBZ01A==
X-Google-Smtp-Source: ABdhPJz5PqqO+f+EAo1gNP40S4S3NrRDchCV410DLqkX5Ry47U4kOjvGRk8RnnGN+BMTTwB90ZGRUw==
X-Received: by 2002:a05:620a:150a:: with SMTP id i10mr8663279qkk.252.1637100043405;
        Tue, 16 Nov 2021 14:00:43 -0800 (PST)
Received: from soleen.c.googlers.com.com (189.216.85.34.bc.googleusercontent.com. [34.85.216.189])
        by smtp.gmail.com with ESMTPSA id i11sm2975655qko.116.2021.11.16.14.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Nov 2021 14:00:42 -0800 (PST)
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
Subject: [RFC 1/3] mm: ptep_clear() page table helper
Date:   Tue, 16 Nov 2021 22:00:36 +0000
Message-Id: <20211116220038.116484-2-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.34.0.rc1.387.gb447b232ab-goog
In-Reply-To: <20211116220038.116484-1-pasha.tatashin@soleen.com>
References: <20211116220038.116484-1-pasha.tatashin@soleen.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

We have ptep_get_and_clear() and ptep_get_and_clear_full() helpers to
clear PTE from user page tables, but there is no variant for simple
clear of a present PTE from user page tables without using a low level
pte_clear() which can be either native or para-virtualised.

Add a new ptep_clear() that can be used in common code to clear PTEs
from page table. We will need this call later in order to add a hook
for page table check.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 Documentation/vm/arch_pgtable_helpers.rst |  6 ++++--
 include/linux/pgtable.h                   |  8 ++++++++
 mm/khugepaged.c                           | 12 ++----------
 3 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/Documentation/vm/arch_pgtable_helpers.rst b/Documentation/vm/arch_pgtable_helpers.rst
index 552567d863b8..fbe06ec75370 100644
--- a/Documentation/vm/arch_pgtable_helpers.rst
+++ b/Documentation/vm/arch_pgtable_helpers.rst
@@ -66,9 +66,11 @@ PTE Page Table Helpers
 +---------------------------+--------------------------------------------------+
 | pte_mknotpresent          | Invalidates a mapped PTE                         |
 +---------------------------+--------------------------------------------------+
-| ptep_get_and_clear        | Clears a PTE                                     |
+| ptep_clear                | Clears a PTE                                     |
 +---------------------------+--------------------------------------------------+
-| ptep_get_and_clear_full   | Clears a PTE                                     |
+| ptep_get_and_clear        | Clears and returns PTE                           |
++---------------------------+--------------------------------------------------+
+| ptep_get_and_clear_full   | Clears and returns PTE (batched PTE unmap)       |
 +---------------------------+--------------------------------------------------+
 | ptep_test_and_clear_young | Clears young from a PTE                          |
 +---------------------------+--------------------------------------------------+
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index e24d2c992b11..bc8713a76e03 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -258,6 +258,14 @@ static inline int pmdp_clear_flush_young(struct vm_area_struct *vma,
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 #endif
 
+#ifndef __HAVE_ARCH_PTEP_CLEAR
+static inline void ptep_clear(struct mm_struct *mm, unsigned long addr,
+			      pte_t *ptep)
+{
+	pte_clear(mm, addr, ptep);
+}
+#endif
+
 #ifndef __HAVE_ARCH_PTEP_GET_AND_CLEAR
 static inline pte_t ptep_get_and_clear(struct mm_struct *mm,
 				       unsigned long address,
diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 5f02fda6f265..6ae659ef7e08 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -756,11 +756,7 @@ static void __collapse_huge_page_copy(pte_t *pte, struct page *page,
 				 * ptl mostly unnecessary.
 				 */
 				spin_lock(ptl);
-				/*
-				 * paravirt calls inside pte_clear here are
-				 * superfluous.
-				 */
-				pte_clear(vma->vm_mm, address, _pte);
+				ptep_clear(vma->vm_mm, address, _pte);
 				spin_unlock(ptl);
 			}
 		} else {
@@ -774,11 +770,7 @@ static void __collapse_huge_page_copy(pte_t *pte, struct page *page,
 			 * inside page_remove_rmap().
 			 */
 			spin_lock(ptl);
-			/*
-			 * paravirt calls inside pte_clear here are
-			 * superfluous.
-			 */
-			pte_clear(vma->vm_mm, address, _pte);
+			ptep_clear(vma->vm_mm, address, _pte);
 			page_remove_rmap(src_page, false);
 			spin_unlock(ptl);
 			free_page_and_swap_cache(src_page);
-- 
2.34.0.rc1.387.gb447b232ab-goog

