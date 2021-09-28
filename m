Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87D3DC433F5
	for <linux-doc@archiver.kernel.org>; Tue, 28 Sep 2021 12:43:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 73178611CE
	for <linux-doc@archiver.kernel.org>; Tue, 28 Sep 2021 12:43:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240795AbhI1Moz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 28 Sep 2021 08:44:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240807AbhI1Mow (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 28 Sep 2021 08:44:52 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48BA6C061575
        for <linux-doc@vger.kernel.org>; Tue, 28 Sep 2021 05:43:13 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id y5so11653764pll.3
        for <linux-doc@vger.kernel.org>; Tue, 28 Sep 2021 05:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0LAyp9r8bOnwik80mbEioL/ye7jfFZ1gOmLErvcKKTI=;
        b=PZHYivOVjs95VPpnWAgIp+6wL2rO4Ei1SF0+27DUnepUrm/zMtRtbU2mlqVRY+S+rA
         WRC6aCYL7YVeOOL4f+Su0wYtNgIfZO4XjOkC/AfgbjLb33+gN/mK7v6hWZTFPdWfyBb4
         y5wCkJC/tBASlA2Q+PAXCQtkDkcht+yuoPr06set4eSvacjapOusf94iiGD5QhwyB2Hx
         xq3Gwr95haRW+fg4am3pCo4Y4qBKo1v1N48C7ZLMj/9H4I7/wwxNNvU4D/M99CAK9Q5X
         QTnpNehLBkPuY0sE2GYO28xP9feWQH+OVCHqpJ+rbPxj7roisp7IdHRwnuRUB+krQVJy
         Y5nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0LAyp9r8bOnwik80mbEioL/ye7jfFZ1gOmLErvcKKTI=;
        b=rzEEok68wV43qc2FvgT4mys0GdVuZFGSbLiA6dcpVVSggRnre/S0jMtLW6n1ndpdRP
         tXy6OyANPWCjSylHCFxRGaxbJy7BUMRDxhfQw/gTwvbz7L+CSMHX+xCS7mtHkrsGJ3cb
         53pE0OcyL9qWHEND4JnIAr1uZqHMfc7PhXUNkyYKKw2n8j9zkI8nv/Y3YP/LLC7o0Up/
         FvsdvxK5GYnmzDdDYuhaFtc0kIp+4V2c/8zgWts/WgGIv516+JDFmntdGX2ey3YsNCdE
         JeZHV3ZXLAoLvs72VIw5w4PEx0sgGlAysigXrIrhwDJSPv3CaCr218oPz6QV29ndj8Cv
         ahOQ==
X-Gm-Message-State: AOAM533p0VfdFvmQ5ZQW41mqqYLlGc5jb3D07n9N2cRvrJKqAtzDLr4s
        dOAG/lQevxacNBWjnCjktJyMpQ==
X-Google-Smtp-Source: ABdhPJyZWXa2EClSDC6dnvkI3nryJK9ZCpSndKPVprcLvqe+9w4aBO4h5eUHs1nGNfjmVqKd7FShJQ==
X-Received: by 2002:a17:90a:c914:: with SMTP id v20mr5330329pjt.208.1632832992907;
        Tue, 28 Sep 2021 05:43:12 -0700 (PDT)
Received: from localhost.localdomain ([61.120.150.70])
        by smtp.gmail.com with ESMTPSA id s17sm10055287pge.50.2021.09.28.05.43.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Sep 2021 05:43:12 -0700 (PDT)
From:   Muchun Song <songmuchun@bytedance.com>
To:     mike.kravetz@oracle.com, akpm@linux-foundation.org,
        osalvador@suse.de, mhocko@suse.com, song.bao.hua@hisilicon.com,
        david@redhat.com, chenhuang5@huawei.com, bodeddub@amazon.com,
        corbet@lwn.net, willy@infradead.org, 21cnbao@gmail.com
Cc:     duanxiongchun@bytedance.com, fam.zheng@bytedance.com,
        smuchun@gmail.com, zhengqi.arch@bytedance.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v5 5/5] mm: sparsemem: move vmemmap related to HugeTLB to CONFIG_HUGETLB_PAGE_FREE_VMEMMAP
Date:   Tue, 28 Sep 2021 20:41:52 +0800
Message-Id: <20210928124152.33634-6-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
In-Reply-To: <20210928124152.33634-1-songmuchun@bytedance.com>
References: <20210928124152.33634-1-songmuchun@bytedance.com>
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
index 00bb2d938df4..a706e7ffda94 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -3182,10 +3182,12 @@ static inline void print_vma_addr(char *prefix, unsigned long rip)
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
index ba76d8765211..ad73650809ed 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -34,6 +34,7 @@
 #include <asm/pgalloc.h>
 #include <asm/tlbflush.h>
 
+#ifdef CONFIG_HUGETLB_PAGE_FREE_VMEMMAP
 /**
  * struct vmemmap_remap_walk - walk vmemmap page table
  *
@@ -423,6 +424,7 @@ int vmemmap_remap_alloc(unsigned long start, unsigned long end,
 
 	return 0;
 }
+#endif /* CONFIG_HUGETLB_PAGE_FREE_VMEMMAP */
 
 /*
  * Allocate a block of memory to be used to back the virtual memory map
-- 
2.11.0

