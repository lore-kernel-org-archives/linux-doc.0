Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56EA8C433F5
	for <linux-doc@archiver.kernel.org>; Sat,  5 Mar 2022 16:25:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232026AbiCEQ0G (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 5 Mar 2022 11:26:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232024AbiCEQ0G (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 5 Mar 2022 11:26:06 -0500
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D97A1E6E96
        for <linux-doc@vger.kernel.org>; Sat,  5 Mar 2022 08:25:16 -0800 (PST)
Received: by mail-pg1-x531.google.com with SMTP id z4so10017448pgh.12
        for <linux-doc@vger.kernel.org>; Sat, 05 Mar 2022 08:25:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NnQVGo8WR0Bu7sS6DRxaO5hlqE9m581ddLhsXTu3yCc=;
        b=O01DgNxZnOFSn5LEaDMZLcPGl6RlQuvx/Cz1icqF7y7iq/HgF3lAod+pGaaDkKafJx
         01+p/4tyUVebIGeTWo/VdUN/bwhz2YIPWY5yGqW1eiyT7Jw4knSkI923R6tVPql8ol5U
         usTml04W1sVt8xnPF3x7NUG10H9keZE73VJXz+6zoH4hKBP1oUmV3Pr0wqJieWRVCxPh
         t/xKKQm9na5X58YGmYH/GFFdBeWs9IYZV451e1CDKGjQkO9+3+wt83rauCZIQc+h/Nnf
         ZGzwtPvz+8nk4ARnikwParHUBtQeGuRcE51BfcX7opdK6ZGHHh4ZZafZqRHOXrfQmWEh
         Z84w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NnQVGo8WR0Bu7sS6DRxaO5hlqE9m581ddLhsXTu3yCc=;
        b=A+fe5nFdpurqE+wmuJE0ZmhddpjMhx19jyltUINA9bOqcHg/gqkcIzDhrttI/dPB+i
         6c4dGA0Y6JqIKYgT1Ov3/yZn5TbnGxuyM1PvHx+lehwVd2XYk6/ZVDy/YRi+9Z3UN3dZ
         jVcNc0n/1OpzCxm/sa0iHaAUtP4BKNDCg1FDkFp/7r0gXfumKLM1M41kSSlDe9LX/RlG
         d0ovt2HWSSu6qOVgsbIczxIUGtxsHFoPl43ktSzNHjfkFERCRtaonPe0Igmjj9V7Sa5Z
         KGJfEGNSS7/njtinA9CpQNZHr7c74GuZrmK1LYz4Thh3g1v4rV63UE51soAiv1qWL1dE
         uRQw==
X-Gm-Message-State: AOAM533YdyFesTgOGdqZ46NFClqvBA6WyLGZfvJHOJIlHrwXk5W+pJgu
        X/6mxSn26nQmcwqR18dxSQM=
X-Google-Smtp-Source: ABdhPJwVohS3UKP4kvYvQ/Y+R84b5p3ON0tK+p70MG6XhdvLBOYQKIHNGxpdn1aRDI2ANj9utXtkew==
X-Received: by 2002:a63:fb46:0:b0:372:a1d6:45ea with SMTP id w6-20020a63fb46000000b00372a1d645eamr3225987pgj.549.1646497515592;
        Sat, 05 Mar 2022 08:25:15 -0800 (PST)
Received: from localhost.localdomain (42-200-190-71.static.imsbiz.com. [42.200.190.71])
        by smtp.gmail.com with ESMTPSA id x7-20020a17090a1f8700b001bf1db72189sm6106269pja.23.2022.03.05.08.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Mar 2022 08:25:15 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: [PATCH 10/12] docs/zh_CN: add vm split_page_table_lock translation
Date:   Sun,  6 Mar 2022 00:26:10 +0800
Message-Id: <4e4b18cee20125d7a2220ef7754719bb7225d112.1646496448.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1646496448.git.siyanteng@loongson.cn>
References: <cover.1646496448.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate .../vm/split_page_table_lock.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 Documentation/translations/zh_CN/vm/index.rst |  2 +-
 .../zh_CN/vm/split_page_table_lock.rst        | 96 +++++++++++++++++++
 2 files changed, 97 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/vm/split_page_table_lock.rst

diff --git a/Documentation/translations/zh_CN/vm/index.rst b/Documentation/translations/zh_CN/vm/index.rst
index 6d804be1b9d1..343a82b56ec2 100644
--- a/Documentation/translations/zh_CN/vm/index.rst
+++ b/Documentation/translations/zh_CN/vm/index.rst
@@ -35,6 +35,7 @@ TODO:待引用文档集被翻译完毕后请及时修改此处）
    page_owner
    page_table_check
    remap_file_pages
+   split_page_table_lock
 
 TODOLIST:
 * arch_pgtable_helpers
@@ -44,7 +45,6 @@ TODOLIST:
 * numa
 * page_migration
 * slub
-* split_page_table_lock
 * transhuge
 * unevictable-lru
 * vmalloced-kernel-stacks
diff --git a/Documentation/translations/zh_CN/vm/split_page_table_lock.rst b/Documentation/translations/zh_CN/vm/split_page_table_lock.rst
new file mode 100644
index 000000000000..c2610a69676e
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
+Hugetlb可以支持多种页面大小。我们只对PMD级别使用分割锁，但不对PUD使用。
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

