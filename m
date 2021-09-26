Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E904C433EF
	for <linux-doc@archiver.kernel.org>; Sun, 26 Sep 2021 03:15:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EA72061029
	for <linux-doc@archiver.kernel.org>; Sun, 26 Sep 2021 03:15:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230453AbhIZDRG (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 25 Sep 2021 23:17:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230428AbhIZDRD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 25 Sep 2021 23:17:03 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 040BBC061575
        for <linux-doc@vger.kernel.org>; Sat, 25 Sep 2021 20:15:28 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id s11so14149458pgr.11
        for <linux-doc@vger.kernel.org>; Sat, 25 Sep 2021 20:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lBVREcbULLdqaPu2xVXA/zzEvcIr2XcW00aGGgEt1R0=;
        b=AIt908PRuKK8faRpMJ6vdoIzcoydx21Jsb8fY7MrXRpJmjdkBtjzxlfPQLHCUXvqZK
         DVOLTHIHa8EYlxC1ziWx5RVNhDDrFwtVgEJQavOLkucLoYFg91hCTvk+edMhvHzWrzIA
         qQY+h1deTymLNbzXPLNvYsUXEHylU81xQ3UJP+oaphv2oWJ+6UeGctVlXDvL2XAL/2rQ
         8VzPBewHjvvhGKcAJOcTB2cHkrRdvEJ+xEI+574MDWiFtj3KE5Q8Nu4SkeXEfdOwxFYp
         QwMMm5vMMTeU+ytG6apzi2wRMvgqQM+kyH78VD9nQGBel77Duf619wZr/sYVdj+wlF0g
         /ndA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lBVREcbULLdqaPu2xVXA/zzEvcIr2XcW00aGGgEt1R0=;
        b=jPoPnXg0hwmmXcDf5h7D+7tB8iDKjxVat7xz/P4iUaPMCspDnr+gjF2Ug+bPzJUwzn
         38pbMGG0fDiwIJ5P3Vfky5kL+yBHvvzq/xLIl1tC0q/uY9n1zCX4WvZiBX6uNJQbCjlk
         olXJKXHKuVJhRJdX6PYZBHhNE+GQjRcHjufpEyHfGs4dR+uNRV45pQQ5XizCTkVFRpfJ
         EwAwqFgJykheXhl9PhL9XQ4KRIeuyPA6t9e2EeiPF2q1hX1b6+DBSsgIwWZrd7a3om2y
         bGCfQal+cMdc9YL7wBSg5uwsHjScc5QCrCwBzc4p1b51C4x5a5cfMJQn7132hwD+61Uj
         s/KQ==
X-Gm-Message-State: AOAM532w20GVGP+LfaoZq/JtTzqL3KisnnzUDOVpeRedx6TOEaOvgV29
        /q+NadWg94JkDWB0/gkFdW+dlA==
X-Google-Smtp-Source: ABdhPJy4n8ITV5TO8x69HoiW/b5VWS7o6Hbt05+tkS6I4fn84pt8iljnvISDWFvfVDkdcEfSaiBJJg==
X-Received: by 2002:a65:640f:: with SMTP id a15mr510106pgv.106.1632626127582;
        Sat, 25 Sep 2021 20:15:27 -0700 (PDT)
Received: from localhost.localdomain ([61.120.150.70])
        by smtp.gmail.com with ESMTPSA id v26sm13374862pfm.175.2021.09.25.20.15.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 25 Sep 2021 20:15:27 -0700 (PDT)
From:   Muchun Song <songmuchun@bytedance.com>
To:     mike.kravetz@oracle.com, akpm@linux-foundation.org,
        osalvador@suse.de, mhocko@suse.com, song.bao.hua@hisilicon.com,
        david@redhat.com, chenhuang5@huawei.com, bodeddub@amazon.com,
        corbet@lwn.net, willy@infradead.org, 21cnbao@gmail.com
Cc:     duanxiongchun@bytedance.com, fam.zheng@bytedance.com,
        smuchun@gmail.com, zhengqi.arch@bytedance.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v4 5/5] mm: sparsemem: move vmemmap related to HugeTLB to CONFIG_HUGETLB_PAGE_FREE_VMEMMAP
Date:   Sun, 26 Sep 2021 11:13:39 +0800
Message-Id: <20210926031339.40043-6-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
In-Reply-To: <20210926031339.40043-1-songmuchun@bytedance.com>
References: <20210926031339.40043-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The vmemmap_remap_free/alloc are relevant to HugeTLB, so move those
functiongs to the scope of CONFIG_HUGETLB_PAGE_FREE_VMEMMAP.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
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
index d486a7a48512..3c7dd41c3164 100644
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

