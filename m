Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54EC2C433FE
	for <linux-doc@archiver.kernel.org>; Mon,  1 Nov 2021 03:22:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3CA7460ED5
	for <linux-doc@archiver.kernel.org>; Mon,  1 Nov 2021 03:22:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231176AbhKADYt (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 31 Oct 2021 23:24:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231126AbhKADYs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 31 Oct 2021 23:24:48 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD385C061766
        for <linux-doc@vger.kernel.org>; Sun, 31 Oct 2021 20:22:15 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id k2so497771pff.11
        for <linux-doc@vger.kernel.org>; Sun, 31 Oct 2021 20:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9VGzNRF5Cvjhv7SHttDh/0XfnKgdTTGPLaylpByFh90=;
        b=vYRa0LrsOiLNMmqOU/t7OT8rhTONipLGiH9yn0jvTsKWacO1NmNySXKjTtGHxXYKCO
         to6LjOvZwqu8nG3t2eCGyaTA8gssXSyxZ4J76AnAW8EQ6hj5DLXD+k82y60Tl5YGM4cN
         d6JpH/o7WaBEtyvPcixgUw9y19LBQ67dkaPylfTJ24lmdIY3OWfkN7OT49j7dZnONKS+
         4voANWnx3lm0j+jHqSo7GvnqGoOu48+J5tp4T0k3yQ6QMzQs+kAICmopcII/2aIS6i+v
         Tgdfn/JpSYxbHC+6jWdmWWTL3d5vz5NmgxW+ts3YR+xbwPxrdx+jc0qHtnmNoxOiM4Jg
         tSfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9VGzNRF5Cvjhv7SHttDh/0XfnKgdTTGPLaylpByFh90=;
        b=HaWYTEIBFOy8RwRWTHElEdaTBiVbs8WKLSD2q68Kezus54bCbWc8Hb5FGsXmOQeCG4
         /+GqQMWrKtRGT2ljbk+l1zUDh13nOSAuOj3LOMaRSCPE5hE5F7vEUlCGSCSZR333RbRq
         xrniWEW4UFsj0cd9P7T1IEfIPAFmUcKyu1lVUyF6sp2Cd4O4vxGf7kEJMDa/EJQKWq3T
         cwOyYtwaxkSlyQX5DOoF1Y3RaprmaLaAy9S+YcxE/6GeJgopG5v6i7tsgBX1oX3wLgwk
         hv9VkobdDtkP3QXUMFMJWYVloZbnBU3AhNBgwXIgMDDqJEE+PrRb4uW+6761gnYqdgeJ
         88TA==
X-Gm-Message-State: AOAM531RwDAYMQL/JbUcWdC+q9NF9a3KndzkoiDDYVDxImg1t1UcJxHl
        CdWWVy2lgaUpOPEuB2XzUBc+RA==
X-Google-Smtp-Source: ABdhPJwXxT74hja/WnNsiVnmGuLCSWgyHkMiOraykpCGLkdAOZchUNVXM6wzutT+ytm1pqHg+bE62g==
X-Received: by 2002:a63:8a41:: with SMTP id y62mr8566247pgd.48.1635736935316;
        Sun, 31 Oct 2021 20:22:15 -0700 (PDT)
Received: from localhost.localdomain ([139.177.225.242])
        by smtp.gmail.com with ESMTPSA id f8sm11860963pjq.29.2021.10.31.20.22.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 31 Oct 2021 20:22:15 -0700 (PDT)
From:   Muchun Song <songmuchun@bytedance.com>
To:     mike.kravetz@oracle.com, akpm@linux-foundation.org,
        osalvador@suse.de, mhocko@suse.com, song.bao.hua@hisilicon.com,
        david@redhat.com, chenhuang5@huawei.com, bodeddub@amazon.com,
        corbet@lwn.net, willy@infradead.org, 21cnbao@gmail.com
Cc:     duanxiongchun@bytedance.com, fam.zheng@bytedance.com,
        smuchun@gmail.com, zhengqi.arch@bytedance.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v7 2/5] mm: hugetlb: replace hugetlb_free_vmemmap_enabled with a static_key
Date:   Mon,  1 Nov 2021 11:16:48 +0800
Message-Id: <20211101031651.75851-3-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
In-Reply-To: <20211101031651.75851-1-songmuchun@bytedance.com>
References: <20211101031651.75851-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The page_fixed_fake_head() is used throughout memory management and
the conditional check requires checking a global variable, although
the overhead of this check may be small, it increases when the memory
cache comes under pressure. Also, the global variable will not be
modified after system boot, so it is very appropriate to use static
key machanism.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Reviewed-by: Barry Song <song.bao.hua@hisilicon.com>
---
 include/linux/hugetlb.h    |  6 ------
 include/linux/page-flags.h | 16 ++++++++++++++--
 mm/hugetlb_vmemmap.c       | 12 ++++++------
 mm/memory_hotplug.c        |  2 +-
 4 files changed, 21 insertions(+), 15 deletions(-)

diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index 44c2ab0dfa59..27a2adff0db7 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -1077,12 +1077,6 @@ static inline void set_huge_swap_pte_at(struct mm_struct *mm, unsigned long addr
 }
 #endif	/* CONFIG_HUGETLB_PAGE */
 
-#ifdef CONFIG_HUGETLB_PAGE_FREE_VMEMMAP
-extern bool hugetlb_free_vmemmap_enabled;
-#else
-#define hugetlb_free_vmemmap_enabled	false
-#endif
-
 static inline spinlock_t *huge_pte_lock(struct hstate *h,
 					struct mm_struct *mm, pte_t *pte)
 {
diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index 7cd386538d0c..26e540fd3393 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -185,7 +185,14 @@ enum pageflags {
 #ifndef __GENERATING_BOUNDS_H
 
 #ifdef CONFIG_HUGETLB_PAGE_FREE_VMEMMAP
-extern bool hugetlb_free_vmemmap_enabled;
+DECLARE_STATIC_KEY_MAYBE(CONFIG_HUGETLB_PAGE_FREE_VMEMMAP_DEFAULT_ON,
+			 hugetlb_free_vmemmap_enabled_key);
+
+static __always_inline bool hugetlb_free_vmemmap_enabled(void)
+{
+	return static_branch_maybe(CONFIG_HUGETLB_PAGE_FREE_VMEMMAP_DEFAULT_ON,
+				   &hugetlb_free_vmemmap_enabled_key);
+}
 
 /*
  * If the feature of freeing some vmemmap pages associated with each HugeTLB
@@ -205,7 +212,7 @@ extern bool hugetlb_free_vmemmap_enabled;
  */
 static __always_inline const struct page *page_fixed_fake_head(const struct page *page)
 {
-	if (!hugetlb_free_vmemmap_enabled)
+	if (!hugetlb_free_vmemmap_enabled())
 		return page;
 
 	/*
@@ -233,6 +240,11 @@ static inline const struct page *page_fixed_fake_head(const struct page *page)
 {
 	return page;
 }
+
+static inline bool hugetlb_free_vmemmap_enabled(void)
+{
+	return false;
+}
 #endif
 
 static __always_inline int page_is_fake_head(struct page *page)
diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 4977f5a520c2..791626983c2e 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -188,9 +188,9 @@
 #define RESERVE_VMEMMAP_NR		1U
 #define RESERVE_VMEMMAP_SIZE		(RESERVE_VMEMMAP_NR << PAGE_SHIFT)
 
-bool hugetlb_free_vmemmap_enabled __read_mostly =
-	IS_ENABLED(CONFIG_HUGETLB_PAGE_FREE_VMEMMAP_DEFAULT_ON);
-EXPORT_SYMBOL(hugetlb_free_vmemmap_enabled);
+DEFINE_STATIC_KEY_MAYBE(CONFIG_HUGETLB_PAGE_FREE_VMEMMAP_DEFAULT_ON,
+			hugetlb_free_vmemmap_enabled_key);
+EXPORT_SYMBOL(hugetlb_free_vmemmap_enabled_key);
 
 static int __init early_hugetlb_free_vmemmap_param(char *buf)
 {
@@ -204,9 +204,9 @@ static int __init early_hugetlb_free_vmemmap_param(char *buf)
 		return -EINVAL;
 
 	if (!strcmp(buf, "on"))
-		hugetlb_free_vmemmap_enabled = true;
+		static_branch_enable(&hugetlb_free_vmemmap_enabled_key);
 	else if (!strcmp(buf, "off"))
-		hugetlb_free_vmemmap_enabled = false;
+		static_branch_disable(&hugetlb_free_vmemmap_enabled_key);
 	else
 		return -EINVAL;
 
@@ -284,7 +284,7 @@ void __init hugetlb_vmemmap_init(struct hstate *h)
 	BUILD_BUG_ON(__NR_USED_SUBPAGE >=
 		     RESERVE_VMEMMAP_SIZE / sizeof(struct page));
 
-	if (!hugetlb_free_vmemmap_enabled)
+	if (!hugetlb_free_vmemmap_enabled())
 		return;
 
 	vmemmap_pages = (nr_pages * sizeof(struct page)) >> PAGE_SHIFT;
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 3de7933e5302..587a8fc61fc8 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1326,7 +1326,7 @@ bool mhp_supports_memmap_on_memory(unsigned long size)
 	 *       populate a single PMD.
 	 */
 	return memmap_on_memory &&
-	       !hugetlb_free_vmemmap_enabled &&
+	       !hugetlb_free_vmemmap_enabled() &&
 	       IS_ENABLED(CONFIG_MHP_MEMMAP_ON_MEMORY) &&
 	       size == memory_block_size_bytes() &&
 	       IS_ALIGNED(vmemmap_size, PMD_SIZE) &&
-- 
2.11.0

