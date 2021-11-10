Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41741C433EF
	for <linux-doc@archiver.kernel.org>; Wed, 10 Nov 2021 08:41:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 29F6561247
	for <linux-doc@archiver.kernel.org>; Wed, 10 Nov 2021 08:41:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230328AbhKJIoS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 10 Nov 2021 03:44:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230316AbhKJIoS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 10 Nov 2021 03:44:18 -0500
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AFC8C061766
        for <linux-doc@vger.kernel.org>; Wed, 10 Nov 2021 00:41:31 -0800 (PST)
Received: by mail-pf1-x434.google.com with SMTP id m14so2022548pfc.9
        for <linux-doc@vger.kernel.org>; Wed, 10 Nov 2021 00:41:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Qt7zreSDUacj2v2u5kH5eyo4ziYtzmNFB0lGNIs9uO4=;
        b=NOvrflc+LPqLg5YyJ0rxgNwEIVBSw1pADjLyV8ro/XVfNu+93Dhk9aWBGu5z1yKl11
         pU2WHZsQcPuZ1TsBFF2jxdUPJRB0SxYRW25B8Z1RlmgCDqWbr+lumkv0THymyDNiBBdg
         aZX5cAhJt9ZV+lSjWzg0KqEjnm474BBKBIn+Cw5T9fWXZ/eYZYJdlcAfHq+pilrWPmib
         of6lU/cFOKihdZk83jXzwTz1kQFfIfllVaqWe/L05LL31mHl9BeSQvQCvHr58FyClY0g
         /6occjuka3lZoG/Zi5ObRJ0yf9G/7ruzf5qCNnehsWBS3udLIjYr8PT5bksrYIoqgAD+
         fVFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Qt7zreSDUacj2v2u5kH5eyo4ziYtzmNFB0lGNIs9uO4=;
        b=N24XEgkWoqljrPFQUyGJt18gpu8we50d4VbfJKsc0tbQdThZVnQ/cniNXBkxE6cqFQ
         908KplowBN90GmpC2ZsOpl7j4kzmEGwJClAl1SNZjFiinzAMT0Ue+hD0zlJ5lnLYTHaZ
         DakxtId3Pc2qEZrCL0BGtvXbyU1idLfGSeqRg1bLLBRaUA3GduP/KGyJiKzhQMsmByOv
         is7MueoYHROf5nM6fX3cEKCY6CvAfSdozifMdC2p30gv4lsJHWz8+30rWJ+FZ7EJBaM+
         nlZpXmSV1pGokF7r+zGxIO1yuKRpqqe9seXmjIfhUcE+VOCTcvLUxgIL0KkaGPlv2WmF
         il/A==
X-Gm-Message-State: AOAM532MXoAEO4iwC7nMNiJkq+qH/zKqqd+IdFg1zIX3FTDqSc/FgLcA
        wSMwcO6mG2O01aPA+OiB3TA05A==
X-Google-Smtp-Source: ABdhPJwOUzG3sjGF9SIZl3T5LDP3eOmiS/U6BsPv+oNn3riL5hCu+fFDClnn2hk/JAQtx/Wcp9vD5w==
X-Received: by 2002:a63:b603:: with SMTP id j3mr10572825pgf.427.1636533690702;
        Wed, 10 Nov 2021 00:41:30 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([139.177.225.251])
        by smtp.gmail.com with ESMTPSA id v38sm5485368pgl.38.2021.11.10.00.41.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 10 Nov 2021 00:41:30 -0800 (PST)
From:   Qi Zheng <zhengqi.arch@bytedance.com>
To:     akpm@linux-foundation.org, tglx@linutronix.de,
        kirill.shutemov@linux.intel.com, mika.penttila@nextfour.com,
        david@redhat.com, jgg@nvidia.com
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, songmuchun@bytedance.com,
        zhouchengming@bytedance.com, Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH v3 01/15] mm: do code cleanups to filemap_map_pmd()
Date:   Wed, 10 Nov 2021 16:40:43 +0800
Message-Id: <20211110084057.27676-2-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20211110084057.27676-1-zhengqi.arch@bytedance.com>
References: <20211110084057.27676-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Currently we have two times the same few lines repeated
in filemap_map_pmd(). Deduplicate them and fix some code
style issues.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 mm/filemap.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/mm/filemap.c b/mm/filemap.c
index daa0e23a6ee6..07c654202870 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -3203,11 +3203,8 @@ static bool filemap_map_pmd(struct vm_fault *vmf, struct page *page)
 	struct mm_struct *mm = vmf->vma->vm_mm;
 
 	/* Huge page is mapped? No need to proceed. */
-	if (pmd_trans_huge(*vmf->pmd)) {
-		unlock_page(page);
-		put_page(page);
-		return true;
-	}
+	if (pmd_trans_huge(*vmf->pmd))
+		goto out;
 
 	if (pmd_none(*vmf->pmd) && PageTransHuge(page)) {
 		vm_fault_t ret = do_set_pmd(vmf, page);
@@ -3222,13 +3219,15 @@ static bool filemap_map_pmd(struct vm_fault *vmf, struct page *page)
 		pmd_install(mm, vmf->pmd, &vmf->prealloc_pte);
 
 	/* See comment in handle_pte_fault() */
-	if (pmd_devmap_trans_unstable(vmf->pmd)) {
-		unlock_page(page);
-		put_page(page);
-		return true;
-	}
+	if (pmd_devmap_trans_unstable(vmf->pmd))
+		goto out;
 
 	return false;
+
+out:
+	unlock_page(page);
+	put_page(page);
+	return true;
 }
 
 static struct page *next_uptodate_page(struct page *page,
-- 
2.11.0

