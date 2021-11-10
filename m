Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C29FC433EF
	for <linux-doc@archiver.kernel.org>; Wed, 10 Nov 2021 10:55:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2E7C56112D
	for <linux-doc@archiver.kernel.org>; Wed, 10 Nov 2021 10:55:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231311AbhKJK5t (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 10 Nov 2021 05:57:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231331AbhKJK5t (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 10 Nov 2021 05:57:49 -0500
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCF93C061764
        for <linux-doc@vger.kernel.org>; Wed, 10 Nov 2021 02:55:01 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id h24so1245343pjq.2
        for <linux-doc@vger.kernel.org>; Wed, 10 Nov 2021 02:55:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Zr0rEdADAEaJn1N2dbntb6SW/6iRFYHNNestGTjHAUw=;
        b=HPUN9ql1FG+neFcOlqge+XfZ9d8NFw14fMg58AGUz+eydfvC09cyZa+jcxb37NzfN5
         V+H/2f3OtvfVTRoEPwomKmsxjjqz2tMWLvloxX+azi3MAXcdKwuvd5OnzjaVX0gKhPzL
         ivUobAdbapEhRBbzYIxpjYe2raMmkrMTaIWLIz41b0EYHen3+ZyyirO8ubW0jWEHLAVq
         tjmAUQ1Up9N/eOYzd9ojy70F+Imu2eGknw+fLV/mxocHK4wNJ8/9NmMaQPze5m7I23w2
         QNSqhp1lPC8zoP39jltkuYN/T7wIgJRV4kG4gznwzXCpvqxw44X5adLh0RLH7Oazvq6W
         n2Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Zr0rEdADAEaJn1N2dbntb6SW/6iRFYHNNestGTjHAUw=;
        b=cBSF/o5ZYU7bctdYQKhZG0R7jn+Wz5fGhUxKcqBOTceZeKeG32pIw4kK8i4ZAPsX46
         L0/8EYk9c0LCbUZ8MwhcH1PHxHZeqyR2L4aHpmXAoUqeKoo7Y5S6FmYnxa1dq9W/cwC6
         clVJfKwRvJjor2i5c6e/c14A7h2Cyg6imE+eSxnmXqdZg5Vfnwh2Ln+N1I2196xT56o6
         /CR/lCBX0HNkipORmmWjd/4XhqpSg7zrFWtLvINpK3PX5cVTYJi4dG82OUpkBjjE4yM2
         PPzZskoAV57eW3OUChtUsHn+CFEf4Q7SiuBx/jBXHntSb6yGCGFRrNmJgPlY+0NnI5rl
         8MLw==
X-Gm-Message-State: AOAM533jsS6GhlY+LjsNqmdDMYHebi0vTSTqfQ03/xm9Z5rmN9DMMPAd
        ZqaxKroyfaE0xFusu8U4aqV/kA==
X-Google-Smtp-Source: ABdhPJwFh1bEBmmrAr/exJm9KrX1d9IXTLyrDWgr/IvlDLpUmsG5/fJDb/+NBSZdkcokjcHWkv0S4A==
X-Received: by 2002:a17:902:f693:b0:142:9ec:c2e1 with SMTP id l19-20020a170902f69300b0014209ecc2e1mr14415302plg.34.1636541701391;
        Wed, 10 Nov 2021 02:55:01 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([139.177.225.251])
        by smtp.gmail.com with ESMTPSA id v38sm5865829pgl.38.2021.11.10.02.54.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 10 Nov 2021 02:55:01 -0800 (PST)
From:   Qi Zheng <zhengqi.arch@bytedance.com>
To:     akpm@linux-foundation.org, tglx@linutronix.de,
        kirill.shutemov@linux.intel.com, mika.penttila@nextfour.com,
        david@redhat.com, jgg@nvidia.com
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, songmuchun@bytedance.com,
        zhouchengming@bytedance.com, Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH v3 04/15] mm: rework the parameter of lock_page_or_retry()
Date:   Wed, 10 Nov 2021 18:54:17 +0800
Message-Id: <20211110105428.32458-5-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20211110105428.32458-1-zhengqi.arch@bytedance.com>
References: <20211110105428.32458-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

We need the vmf in lock_page_or_retry() in the subsequent patch,
so pass in it directly.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 include/linux/pagemap.h | 8 +++-----
 mm/filemap.c            | 6 ++++--
 mm/memory.c             | 4 ++--
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index 6a30916b76e5..94f9547b4411 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -709,8 +709,7 @@ static inline bool wake_page_match(struct wait_page_queue *wait_page,
 
 void __folio_lock(struct folio *folio);
 int __folio_lock_killable(struct folio *folio);
-bool __folio_lock_or_retry(struct folio *folio, struct mm_struct *mm,
-				unsigned int flags);
+bool __folio_lock_or_retry(struct folio *folio, struct vm_fault *vmf);
 void unlock_page(struct page *page);
 void folio_unlock(struct folio *folio);
 
@@ -772,14 +771,13 @@ static inline int lock_page_killable(struct page *page)
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
index 07c654202870..ff8d19b7ce1d 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -1695,9 +1695,11 @@ static int __folio_lock_async(struct folio *folio, struct wait_page_queue *wait)
  * If neither ALLOW_RETRY nor KILLABLE are set, will always return true
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
index b00cd60fc368..bec6a5d5ee7c 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -3443,7 +3443,7 @@ static vm_fault_t remove_device_exclusive_entry(struct vm_fault *vmf)
 	struct vm_area_struct *vma = vmf->vma;
 	struct mmu_notifier_range range;
 
-	if (!lock_page_or_retry(page, vma->vm_mm, vmf->flags))
+	if (!lock_page_or_retry(page, vmf))
 		return VM_FAULT_RETRY;
 	mmu_notifier_range_init_owner(&range, MMU_NOTIFY_EXCLUSIVE, 0, vma,
 				vma->vm_mm, vmf->address & PAGE_MASK,
@@ -3576,7 +3576,7 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
 		goto out_release;
 	}
 
-	locked = lock_page_or_retry(page, vma->vm_mm, vmf->flags);
+	locked = lock_page_or_retry(page, vmf);
 
 	delayacct_clear_flag(current, DELAYACCT_PF_SWAPIN);
 	if (!locked) {
-- 
2.11.0

