Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BAC0C432BE
	for <linux-doc@archiver.kernel.org>; Thu, 19 Aug 2021 03:20:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4530C60698
	for <linux-doc@archiver.kernel.org>; Thu, 19 Aug 2021 03:20:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236152AbhHSDUu (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 18 Aug 2021 23:20:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236121AbhHSDUn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 18 Aug 2021 23:20:43 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AE47C061796
        for <linux-doc@vger.kernel.org>; Wed, 18 Aug 2021 20:20:08 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id s11so4522915pgr.11
        for <linux-doc@vger.kernel.org>; Wed, 18 Aug 2021 20:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nbYzfQrconcsR+4RpHS7arH5FSzBDfWHN7dK/RaMaFw=;
        b=YOM/CjZFQYUfZyT2Fc4Nn6IQVqf1WWt7EkHXDVMuyNb9SvyKWGL4qXbtcpAg4Sg89e
         oKOQEQQ11KPcU9hGocbQx/bTVUA0qlaM2sgIc0MH6y/Vd2e6ytt6c8FPfDjSIrOwWG3X
         rOogyzQzLB/Sbb4E1vsRCSOf0MYhhEHsy+0u9P2z7HeBDcvETioDnM01k+OJ9DwHEb1a
         zEmY73foZoQLq/cmt4/+CftyhY4k06xm1Ymfa9qbY94zjbReMLua3J0NFbWd9xgOHZ5g
         he3vwICKNs+p1+Nd98SAa9UrwjxADENYVRUtjWlPf5DDby19E/Q1iXTFOMoPgooL28O2
         lr1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nbYzfQrconcsR+4RpHS7arH5FSzBDfWHN7dK/RaMaFw=;
        b=HdO0NwaAEwJRyfMFzzu+9AvpRKLdsrXW0b0p2Q1fTtkM9MyONXgPpgmxyc+9rJNo/O
         8yJitt0F1yE3zhMypis7Uflp8ZkzOXeTXnQVPY8iSWpRgsNbXZD6DJQdc4mikeueMRkx
         nDH19zAV1v1BfPauxzowb3seXi8bCfvxOoVr9R9jTUJNMtcqN6gcBaZW1jxVDsMOvIl/
         wXiV+nvbm76MrEfgQaJkmbO8ZgJfF3ToEDOKByOkjKsXpmHtlI3Tftfk4p4Km3nKORD0
         itjVaJpctbtDwtP6XCe05KeOceok7IL4R69kzbOZNKNnAsrKx/RyCAnGT5qZWFxxcm7d
         3mrg==
X-Gm-Message-State: AOAM5312vUULeR7I90E016eXadkFG8XHdMsfrf/HFqxumE9dhE33VUi4
        W4RId+foXcoTpHIGAlOhezFK2g==
X-Google-Smtp-Source: ABdhPJycFOiVUzzFfHyRJZNon6CB7juNZC+TEA1Mqbc1P3fyFSV4ULUnK2OqTYn5F+dvtiLDyjMJ4A==
X-Received: by 2002:a65:6107:: with SMTP id z7mr11924617pgu.43.1629343207673;
        Wed, 18 Aug 2021 20:20:07 -0700 (PDT)
Received: from localhost.localdomain ([139.177.225.255])
        by smtp.gmail.com with ESMTPSA id k3sm1261276pfc.16.2021.08.18.20.20.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Aug 2021 20:20:07 -0700 (PDT)
From:   Qi Zheng <zhengqi.arch@bytedance.com>
To:     akpm@linux-foundation.org, tglx@linutronix.de, hannes@cmpxchg.org,
        mhocko@kernel.org, vdavydov.dev@gmail.com,
        kirill.shutemov@linux.intel.com, mika.penttila@nextfour.com,
        david@redhat.com
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, songmuchun@bytedance.com,
        Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH v2 3/9] mm: rework the parameter of lock_page_or_retry()
Date:   Thu, 19 Aug 2021 11:18:52 +0800
Message-Id: <20210819031858.98043-4-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20210819031858.98043-1-zhengqi.arch@bytedance.com>
References: <20210819031858.98043-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

we need the vmf in lock_page_or_retry() in the subsequent patch,
so pass in it directly.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 include/linux/pagemap.h | 8 +++-----
 mm/filemap.c            | 6 ++++--
 mm/memory.c             | 4 ++--
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index c36292181a21..dbb4dd6bb608 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -710,8 +710,7 @@ static inline bool wake_page_match(struct wait_page_queue *wait_page,
 
 void __folio_lock(struct folio *folio);
 int __folio_lock_killable(struct folio *folio);
-bool __folio_lock_or_retry(struct folio *folio, struct mm_struct *mm,
-				unsigned int flags);
+bool __folio_lock_or_retry(struct folio *folio, struct vm_fault *vmf);
 void unlock_page(struct page *page);
 void folio_unlock(struct folio *folio);
 
@@ -773,14 +772,13 @@ static inline int lock_page_killable(struct page *page)
  * Return value and mmap_lock implications depend on flags; see
  * __folio_lock_or_retry().
  */
-static inline bool lock_page_or_retry(struct page *page, struct mm_struct *mm,
-				     unsigned int flags)
+static inline bool lock_page_or_retry(struct page *page, struct vm_fault *vmf)
 {
 	struct folio *folio;
 	might_sleep();
 
 	folio = page_folio(page);
-	return folio_trylock(folio) || __folio_lock_or_retry(folio, mm, flags);
+	return folio_trylock(folio) || __folio_lock_or_retry(folio, vmf);
 }
 
 /*
diff --git a/mm/filemap.c b/mm/filemap.c
index 9f773059c6dc..eeac0e119cf5 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -1688,9 +1688,11 @@ static int __folio_lock_async(struct folio *folio, struct wait_page_queue *wait)
  * If neither ALLOW_RETRY nor KILLABLE are set, will always return 1
  * with the folio locked and the mmap_lock unperturbed.
  */
-bool __folio_lock_or_retry(struct folio *folio, struct mm_struct *mm,
-			 unsigned int flags)
+bool __folio_lock_or_retry(struct folio *folio, struct vm_fault *vmf)
 {
+	unsigned int flags = vmf->flags;
+	struct mm_struct *mm = vmf->vma->vm_mm;
+
 	if (fault_flag_allow_retry_first(flags)) {
 		/*
 		 * CAUTION! In this case, mmap_lock is not released
diff --git a/mm/memory.c b/mm/memory.c
index 9c7534187454..d2aaa85b840c 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -3451,7 +3451,7 @@ static vm_fault_t remove_device_exclusive_entry(struct vm_fault *vmf)
 	struct vm_area_struct *vma = vmf->vma;
 	struct mmu_notifier_range range;
 
-	if (!lock_page_or_retry(page, vma->vm_mm, vmf->flags))
+	if (!lock_page_or_retry(page, vmf))
 		return VM_FAULT_RETRY;
 	mmu_notifier_range_init_owner(&range, MMU_NOTIFY_EXCLUSIVE, 0, vma,
 				vma->vm_mm, vmf->address & PAGE_MASK,
@@ -3584,7 +3584,7 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
 		goto out_release;
 	}
 
-	locked = lock_page_or_retry(page, vma->vm_mm, vmf->flags);
+	locked = lock_page_or_retry(page, vmf);
 
 	delayacct_clear_flag(current, DELAYACCT_PF_SWAPIN);
 	if (!locked) {
-- 
2.11.0

