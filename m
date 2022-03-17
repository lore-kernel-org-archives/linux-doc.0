Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7ECAC433F5
	for <linux-doc@archiver.kernel.org>; Thu, 17 Mar 2022 06:51:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229987AbiCQGwl (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 17 Mar 2022 02:52:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230004AbiCQGwk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 17 Mar 2022 02:52:40 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D4B4A27F6
        for <linux-doc@vger.kernel.org>; Wed, 16 Mar 2022 23:51:24 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id o6-20020a17090a9f8600b001c6562049d9so4639081pjp.3
        for <linux-doc@vger.kernel.org>; Wed, 16 Mar 2022 23:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=G0W58orY6Fh1lEetntpA/bBRFYqPrNuvTV14YHltAGk=;
        b=RTSVvOawbK4FN2NSALZeKa+8IEh8xEAegFrxMJJZVRRuQFexcyn5E4E6Vfq9dQ4oLB
         dFysWNHH01AN4TRP3A8CcTtNNSVAj2/LbsceXnpTU6eR/JmPvSf01H5N8M3y8xQ9NtZn
         oxjS7sQthxyec8UGwaVqSmbcqK57vsM6ji9VWah7SCGsiJe6X2khyozyBz7RPH8VuK//
         qHA1fCf9lmv/xQjV4KdhoRzXCXL3aV1OgU6NR+7RVPu11TbLCQJ71GL9MF230mb8xhjf
         QCSSklk5E25JnEPw40D4tRFvGxWOoFdJIqby1n2/1FWhG7Kfla5+qsr3OhUUiTMoxfu3
         k5Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=G0W58orY6Fh1lEetntpA/bBRFYqPrNuvTV14YHltAGk=;
        b=Vag8LmYUGl1alDDKgeDBkEPL+vvkTFJQ0rK+9CvJRadqSdoMeda9VwgRDzwHe9MHyL
         7w+XKzw4jtUPpc9i4suJqaiChbv83MqCSwGoTr/AbqUJvQZ3I/V11oq9DUO6cei3Hjfi
         sJ0SELLL/h4Qwzc9T1eicw2geqHrJpCRPmQUSRNssc1YfJXQQ8KJBTApDQ2j/iVJ93q1
         0DvrG04fT1yoNpmdM6I/qNywb/ENxXad3MFymokQs8raaArLe+XPs4CDRdVdlUIp3/wm
         i+8zwlx36ca7bhMby8YlSDwhgS6oy2ZIwAa5eo3bt02R4xApWEOBXwm0fj7E29TL5wIs
         o7fg==
X-Gm-Message-State: AOAM530FBRSTD5LPon8uwW8zFJIWfGcE2H7o4NT4gP/yDmLb7NzvDRVW
        9ik9d58ao6WC4omPeryHWl8=
X-Google-Smtp-Source: ABdhPJwc5B7evkh3Dpg+oGNa7obSsuNIct1ZRx3AiKYb4pafa0RIdtDALSuciwNTxTPhO9PpICZYJA==
X-Received: by 2002:a17:90b:3910:b0:1bf:2972:ccea with SMTP id ob16-20020a17090b391000b001bf2972cceamr13972227pjb.221.1647499884083;
        Wed, 16 Mar 2022 23:51:24 -0700 (PDT)
Received: from localhost.localdomain (pcd454078.netvigator.com. [203.218.244.78])
        by smtp.gmail.com with ESMTPSA id k15-20020a63ab4f000000b00381eef69bfbsm3622152pgp.3.2022.03.16.23.51.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Mar 2022 23:51:23 -0700 (PDT)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng01@gmail.com>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v2 10/12] docs/zh_CN: add vm split_page_table_lock translation
Date:   Thu, 17 Mar 2022 14:50:51 +0800
Message-Id: <65bfa72047bf00c645b7dae316bfde43310aae4d.1647498763.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1647498763.git.siyanteng@loongson.cn>
References: <cover.1647498763.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Yanteng Si <siyanteng01@gmail.com>

Translate .../vm/split_page_table_lock.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 Documentation/translations/zh_CN/vm/index.rst |  2 +-
 .../zh_CN/vm/split_page_table_lock.rst        | 96 +++++++++++++++++++
 2 files changed, 97 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/vm/split_page_table_lock.rst

diff --git a/Documentation/translations/zh_CN/vm/index.rst b/Documentation/translations/zh_CN/vm/index.rst
index 3e4f4cac509c..8c7d0b1e5c3e 100644
--- a/Documentation/translations/zh_CN/vm/index.rst
+++ b/Documentation/translations/zh_CN/vm/index.rst
@@ -36,6 +36,7 @@ TODO:待引用文档集被翻译完毕后请及时修改此处）
    page_owner
    page_table_check
    remap_file_pages
+   split_page_table_lock
 
 TODOLIST:
 * arch_pgtable_helpers
@@ -45,7 +46,6 @@ TODOLIST:
 * numa
 * page_migration
 * slub
-* split_page_table_lock
 * transhuge
 * unevictable-lru
 * vmalloced-kernel-stacks
diff --git a/Documentation/translations/zh_CN/vm/split_page_table_lock.rst b/Documentation/translations/zh_CN/vm/split_page_table_lock.rst
new file mode 100644
index 000000000000..50694d97c426
--- /dev/null
+++ b/Documentation/translations/zh_CN/vm/split_page_table_lock.rst
@@ -0,0 +1,96 @@
+:Original: Documentation/vm/split_page_table_lock.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
+
+:校译:
+
+
+=================================
+分页表锁（split page table lock）
+=================================
+
+最初，mm->page_table_lock spinlock保护了mm_struct的所有页表。但是这种方
+法导致了多线程应用程序的缺页异常可扩展性差，因为对锁的争夺很激烈。为了提高可扩
+展性，我们引入了分页表锁。
+
+有了分页表锁，我们就有了单独的每张表锁来顺序化对表的访问。目前，我们对PTE和
+PMD表使用分页锁。对高层表的访问由mm->page_table_lock保护。
+
+有一些辅助工具来锁定/解锁一个表和其他访问器函数:
+
+ - pte_offset_map_lock()
+	映射pte并获取PTE表锁，返回所取锁的指针；
+ - pte_unmap_unlock()
+	解锁和解映射PTE表；
+ - pte_alloc_map_lock()
+	如果需要的话，分配PTE表并获取锁，如果分配失败，返回已获取的锁的指针
+	或NULL；
+ - pte_lockptr()
+	返回指向PTE表锁的指针；
+ - pmd_lock()
+	取得PMD表锁，返回所取锁的指针。
+ - pmd_lockptr()
+	返回指向PMD表锁的指针；
+
+如果CONFIG_SPLIT_PTLOCK_CPUS（通常为4）小于或等于NR_CPUS，则在编译
+时启用PTE表的分页表锁。如果分页锁被禁用，所有的表都由mm->page_table_lock
+来保护。
+
+如果PMD表启用了分页锁，并且架构支持它，那么PMD表的分页锁就会被启用（见
+下文）。
+
+Hugetlb 和分页表锁
+==================
+
+Hugetlb可以支持多种页面大小。我们只对PMD级别使用分页锁，但不对PUD使用。
+
+Hugetlb特定的辅助函数:
+
+ - huge_pte_lock()
+	对PMD_SIZE页面采取pmd分割锁，否则mm->page_table_lock；
+ - huge_pte_lockptr()
+	返回指向表锁的指针。
+
+架构对分页表锁的支持
+====================
+
+没有必要特别启用PTE分页表锁：所有需要的东西都由pgtable_pte_page_ctor()
+和pgtable_pte_page_dtor()完成，它们必须在PTE表分配/释放时被调用。
+
+确保架构不使用slab分配器来分配页表：slab使用page->slab_cache来分配其页
+面。这个区域与page->ptl共享存储。
+
+PMD分页锁只有在你有两个以上的页表级别时才有意义。
+
+启用PMD分页锁需要在PMD表分配时调用pgtable_pmd_page_ctor()，在释放时调
+用pgtable_pmd_page_dtor()。
+
+分配通常发生在pmd_alloc_one()中，释放发生在pmd_free()和pmd_free_tlb()
+中，但要确保覆盖所有的PMD表分配/释放路径：即X86_PAE在pgd_alloc()中预先
+分配一些PMD。
+
+一切就绪后，你可以设置CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK。
+
+注意：pgtable_pte_page_ctor()和pgtable_pmd_page_ctor()可能失败--必
+须正确处理。
+
+page->ptl
+=========
+
+page->ptl用于访问分割页表锁，其中'page'是包含该表的页面struct page。它
+与page->private（以及union中的其他几个字段）共享存储。
+
+为了避免增加struct page的大小并获得最佳性能，我们使用了一个技巧:
+
+ - 如果spinlock_t适合于long，我们使用page->ptr作为spinlock，这样我们
+   就可以避免间接访问并节省一个缓存行。
+ - 如果spinlock_t的大小大于long的大小，我们使用page->ptl作为spinlock_t
+   的指针并动态分配它。这允许在启用DEBUG_SPINLOCK或DEBUG_LOCK_ALLOC的
+   情况下使用分页锁，但由于间接访问而多花了一个缓存行。
+
+PTE表的spinlock_t分配在pgtable_pte_page_ctor()中，PMD表的spinlock_t
+分配在pgtable_pmd_page_ctor()中。
+
+请不要直接访问page->ptl - -使用适当的辅助函数。
-- 
2.27.0

