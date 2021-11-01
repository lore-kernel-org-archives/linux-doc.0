Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF129C433F5
	for <linux-doc@archiver.kernel.org>; Mon,  1 Nov 2021 03:22:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A848960E0C
	for <linux-doc@archiver.kernel.org>; Mon,  1 Nov 2021 03:22:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231185AbhKADZW (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 31 Oct 2021 23:25:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231310AbhKADZN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 31 Oct 2021 23:25:13 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5E70C061766
        for <linux-doc@vger.kernel.org>; Sun, 31 Oct 2021 20:22:40 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id g11so3706488pfv.7
        for <linux-doc@vger.kernel.org>; Sun, 31 Oct 2021 20:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2UoWjZzOHViEmzMC0Qv5p6Aol3nKS7az97fC7P92qe4=;
        b=mKP0ohFbfVQvapDd1cxSSUQoOhILeQQNi04r/0XIuYy1v7A0lxlwD8CJhLGlYGDL+S
         GEwrDudJKGSatRGKbpSPvwuO7/uK/brOWGDHxw8QH4w8v4O6lRhWgzHlaJX0KHouSdXu
         u0u7n3nu9tzbLrbcfNOvYIlsXGBjzfbEjI0dcoW2RSktQMUfiFAecvgel+yiR4Eqo2Ih
         vQPvdA8EygpJ/SIYaQh53HxuObxRie7bqsspLrdsPsTCKPGrz6K5Mb1T3nAYB1Y7gRla
         z2cqsQzcfnRBPevYTo3Uwu6XH1ez9MDwMwA64GF7nlWljkoay9o9g20tENUSudsXTJ89
         wQRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2UoWjZzOHViEmzMC0Qv5p6Aol3nKS7az97fC7P92qe4=;
        b=QNwR+3hdqDtHyThMNllSS6ka+U6bTET1YXRjXvBV5l9jwZVI2eE7ZLBAcT1AC9C87d
         icj6xkPzv85KJKLST4qHw/RvKplbnho0Tqg4ef3jcX7GUJhL+fN8pgeKpfcqrJE0tldc
         g9itmd6tLVXPYbkr7HoE8PkMU3tNMDq5jQOGQkfr8gmo4bx7yxC/bCIsTDH4w2JcehAK
         fTeyoFQySmnmRwDi26zxmD/8VKKgUgHosMD4Sira4IePw3iNGgzJsHLonKnv2s+bFT47
         uz0QlDGX2WBHTPVLzSVswMQa6oULv8IsRLDALIRnNTM5ooHbqZDzz36hvCXa/+Z1pyEC
         pBnA==
X-Gm-Message-State: AOAM5315WTKIOlORFAGDrR6MKuQ2dpkPuwqT9ZP7mbIRhusO02uKDRg1
        btdCw0hK2lI7JFgzg3xgn6WoGg==
X-Google-Smtp-Source: ABdhPJx2a87GRNdgfXSLRJ0wr6CnW8L0BkmTvheFr9coFV82vt+FtcwdaXTOQpqDZtlezPC7KbtRNg==
X-Received: by 2002:aa7:8019:0:b0:44d:d761:6f79 with SMTP id j25-20020aa78019000000b0044dd7616f79mr26229514pfi.3.1635736960495;
        Sun, 31 Oct 2021 20:22:40 -0700 (PDT)
Received: from localhost.localdomain ([139.177.225.242])
        by smtp.gmail.com with ESMTPSA id f8sm11860963pjq.29.2021.10.31.20.22.33
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 31 Oct 2021 20:22:40 -0700 (PDT)
From:   Muchun Song <songmuchun@bytedance.com>
To:     mike.kravetz@oracle.com, akpm@linux-foundation.org,
        osalvador@suse.de, mhocko@suse.com, song.bao.hua@hisilicon.com,
        david@redhat.com, chenhuang5@huawei.com, bodeddub@amazon.com,
        corbet@lwn.net, willy@infradead.org, 21cnbao@gmail.com
Cc:     duanxiongchun@bytedance.com, fam.zheng@bytedance.com,
        smuchun@gmail.com, zhengqi.arch@bytedance.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v7 5/5] mm: sparsemem: move vmemmap related to HugeTLB to CONFIG_HUGETLB_PAGE_FREE_VMEMMAP
Date:   Mon,  1 Nov 2021 11:16:51 +0800
Message-Id: <20211101031651.75851-6-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
In-Reply-To: <20211101031651.75851-1-songmuchun@bytedance.com>
References: <20211101031651.75851-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The vmemmap_remap_free/alloc are relevant to HugeTLB, so move those
functiongs to the scope of CONFIG_HUGETLB_PAGE_FREE_VMEMMAP.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Reviewed-by: Barry Song <song.bao.hua@hisilicon.com>
---
 include/linux/mm.h  | 2 ++
 mm/sparse-vmemmap.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index a7e4a9e7d807..8c85863a067c 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -3184,10 +3184,12 @@ static inline void print_vma_addr(char *prefix, unsigned long rip)
 }
 #endif
 
+#ifdef CONFIG_HUGETLB_PAGE_FREE_VMEMMAP
 int vmemmap_remap_free(unsigned long start, unsigned long end,
 		       unsigned long reuse);
 int vmemmap_remap_alloc(unsigned long start, unsigned long end,
 			unsigned long reuse, gfp_t gfp_mask);
+#endif
 
 void *sparse_buffer_alloc(unsigned long size);
 struct page * __populate_section_memmap(unsigned long pfn,
diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index c64d1aa3c4b5..8aecd6b3896c 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -34,6 +34,7 @@
 #include <asm/pgalloc.h>
 #include <asm/tlbflush.h>
 
+#ifdef CONFIG_HUGETLB_PAGE_FREE_VMEMMAP
 /**
  * struct vmemmap_remap_walk - walk vmemmap page table
  *
@@ -419,6 +420,7 @@ int vmemmap_remap_alloc(unsigned long start, unsigned long end,
 
 	return 0;
 }
+#endif /* CONFIG_HUGETLB_PAGE_FREE_VMEMMAP */
 
 /*
  * Allocate a block of memory to be used to back the virtual memory map
-- 
2.11.0

