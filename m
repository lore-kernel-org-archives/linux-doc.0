Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FF00C12002
	for <linux-doc@archiver.kernel.org>; Wed, 21 Jul 2021 07:50:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3F9416120A
	for <linux-doc@archiver.kernel.org>; Wed, 21 Jul 2021 07:50:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235576AbhGUHKG (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 21 Jul 2021 03:10:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235954AbhGUHJf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 21 Jul 2021 03:09:35 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57D77C0613DF
        for <linux-doc@vger.kernel.org>; Wed, 21 Jul 2021 00:49:34 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id g22-20020a17090a5796b02901763aca3df6so531599pji.5
        for <linux-doc@vger.kernel.org>; Wed, 21 Jul 2021 00:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5SiPzH0oQvD2cNeDSmkgLcQ+i377uBDVUSzyiSv2rLY=;
        b=qfZqotzquTXe7VSUITa6ZJmoYJKz5MciCfcteq60Ba+A+X0MqWUyOHtIOfjBfam0B6
         3QWsfNofdh4IjaJNL5SUblYuQuGncudv8j1MvMsL1DabZlxjw78MeM/XxOqaGz/H1Fft
         n3JllH2c3ZnZI3L2e+b4ypu9jIdBhHitxhF/mxsjQVnxiUNAYqxx3/1dXk8uMh0yP8wy
         rLKkG8C6vxdmUZWCB8XUPI0so0ra6APk1hFy1X8dKU5Nyh4K1xrbNqSoraDVN+Dlm67m
         ZxhvR8YA0eXOZLEtH/iUGwcRtvupZCTc+4rlp94jQbhXdkmob9kOStBHvvAdJoJPA30B
         vVlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5SiPzH0oQvD2cNeDSmkgLcQ+i377uBDVUSzyiSv2rLY=;
        b=qbfIfu9bZcb8PlIx8p8sVAA2AbHRSe1W+E/tvrB5XpyEnSmdpVsIz8lr7ApvvWs9jq
         bAGvvP4hjErwA//BXHRpmtSoLhGlbP+2IlKOrt6k91a22rP84IGJV/gnwqfqAWDflW5q
         MIvpZol3lGbOQbexxubjPFwBYy04RbbRGYV5bHYv4ucxR9HSpfVxu+0IhEkhHNPsqaL6
         cFB1diPcSvKy6MJTFHxCh0p9anLnLUK6iq7H8ktpa1B4xOIdN/pftP7KokyFbiTlSWV9
         CbpBtN86P6Z4WSEiPG38oojwokExTh0SVcGB3VI5d1roGMu7/La9Qpw+zC0NbKkoK4Ox
         8xfg==
X-Gm-Message-State: AOAM532DXoN7bNn+H7YADHeeQMfhJtZoDAUsL/dxcyDy9LfHfJYYr0TP
        X4mhS9GlLqOd60Nm9WjAgHPiyg==
X-Google-Smtp-Source: ABdhPJwVcTa6ayV2xNFTtcBA4UI1/B6NB25ALk4yhn4ZuTduJWQZ0/ET+0UopsBFy2MS3zrj2pWlvA==
X-Received: by 2002:a17:90a:fa88:: with SMTP id cu8mr34258238pjb.198.1626853773904;
        Wed, 21 Jul 2021 00:49:33 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([139.177.225.250])
        by smtp.gmail.com with ESMTPSA id c83sm791163pfb.164.2021.07.21.00.49.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 21 Jul 2021 00:49:33 -0700 (PDT)
From:   Qi Zheng <zhengqi.arch@bytedance.com>
To:     akpm@linux-foundation.org, tglx@linutronix.de, hannes@cmpxchg.org,
        mhocko@kernel.org, vdavydov.dev@gmail.com,
        kirill.shutemov@linux.intel.com
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, songmuchun@bytedance.com,
        Qi Zheng <zhengqi.arch@bytedance.com>, stable@vger.kernel.org
Subject: [PATCH v2] mm: fix the deadlock in finish_fault()
Date:   Wed, 21 Jul 2021 15:48:49 +0800
Message-Id: <20210721074849.57004-1-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The commit 63f3655f9501 ("mm, memcg: fix reclaim deadlock with
writeback") fix the following ABBA deadlock by pre-allocating
the pte page table without holding the page lock.

	                                lock_page(A)
                                        SetPageWriteback(A)
                                        unlock_page(A)
  lock_page(B)
                                        lock_page(B)
  pte_alloc_one
    shrink_page_list
      wait_on_page_writeback(A)
                                        SetPageWriteback(B)
                                        unlock_page(B)

                                        # flush A, B to clear the writeback

The commit f9ce0be71d1f ("mm: Cleanup faultaround and finish_fault()
codepaths") rework the relevant code but ignore this race. This will
cause the deadlock above to appear again, so fix it.

Fixes: f9ce0be71d1f ("mm: Cleanup faultaround and finish_fault() codepaths")
Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Acked-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
CC: <stable@vger.kernel.org>
---
 Changelog in v1 -> v2:
  - Update commit log

 mm/memory.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/mm/memory.c b/mm/memory.c
index db86558791f1..94a17a9a48ab 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -4026,8 +4026,17 @@ vm_fault_t finish_fault(struct vm_fault *vmf)
 				return ret;
 		}

-		if (unlikely(pte_alloc(vma->vm_mm, vmf->pmd)))
+		if (vmf->prealloc_pte) {
+			vmf->ptl = pmd_lock(vma->vm_mm, vmf->pmd);
+			if (likely(pmd_none(*vmf->pmd))) {
+				mm_inc_nr_ptes(vma->vm_mm);
+				pmd_populate(vma->vm_mm, vmf->pmd, vmf->prealloc_pte);
+				vmf->prealloc_pte = NULL;
+			}
+			spin_unlock(vmf->ptl);
+		} else if (unlikely(pte_alloc(vma->vm_mm, vmf->pmd))) {
 			return VM_FAULT_OOM;
+		}
 	}

 	/* See comment in handle_pte_fault() */
--
2.11.0

