Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FC34C433EF
	for <linux-doc@archiver.kernel.org>; Thu, 17 Mar 2022 06:51:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230038AbiCQGwZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 17 Mar 2022 02:52:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230023AbiCQGwW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 17 Mar 2022 02:52:22 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 844F0ECC67
        for <linux-doc@vger.kernel.org>; Wed, 16 Mar 2022 23:51:04 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id q1-20020a17090a4f8100b001c6575ae105so3136429pjh.0
        for <linux-doc@vger.kernel.org>; Wed, 16 Mar 2022 23:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=W3d8l/YwHy3qXfzLsEPN92/nxKA0iU0l6ttgohmdBLg=;
        b=hsrL6nriv56hP3VQk7k6GNrxqmy2A2Do73KcWnxvD/C1tU8StA49jY+SxM9KwQHCjo
         ku1VAnIZqgLfGgwS2dJMlxr2HcZNi5n0MU/V0cwlGHGqc8V9SG/pULUWQHdBV4XkzQ1J
         GNSwjhZh2O0Ud/Slp8gGhm1iS3eZahbZOMQMYh9dJ8LStXH5EZuz7nhpiZlXXGt7jLM/
         LmzUEiu/vT8qs7XoiT8lmUBUWeqZf7FKJYbO9h0zvcuF+qwysef5MkFYvTQ64crVHJHH
         e14ahM1gclb26DkjwY4aiQNlzR1WsCQq+GUxPZQJXfosk7ydoF7yLAI/EgUliVobXdxu
         968w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=W3d8l/YwHy3qXfzLsEPN92/nxKA0iU0l6ttgohmdBLg=;
        b=nyX4uajv0F6vjmrXEFYPMAe0Vk2l5nc0y4fxDRsg7EcSHmfm4zPHliyS4IQ5tjFJVi
         Gq5KAQuMLC4EMZXVw4WGpb9gLGCrUe97b3ertvxR0P6wIzfIp1o435mx7rrn+/qV76p8
         b957UwJsk+5kTbOemDWBgPAWkZnb8o+7+Nj3fAseXjROWU8M2pnNZoeokIi/4ar2Js7u
         Ko4hXKKGtN+nB69bqJaiIGSGDFzpGHNLKAKOg7rc10hlaX54/mBku+Kh+2jGAsHrNADG
         DMyOK03gr3BaQUHdfSYRymKSOjyGh/Zb7Mgtv2AgxqZUK70rdlRLi+Uax35QtcQjKvgX
         r+NQ==
X-Gm-Message-State: AOAM531xi89yAXS5Q02Jds0sDgDyMMebAmfaxcyqkcoVEDRrUDUP7OHt
        KtsiP4nrhIc5UjZEnr0XocyqHh5t3QHcckLV
X-Google-Smtp-Source: ABdhPJx5TQj+IsRVCqORTUIpqOr70xh4vFs1Lz+cVSVU44XNZksvjcRy+2EYynz8Jl9DnEum1IDweA==
X-Received: by 2002:a17:902:f605:b0:14d:9e11:c864 with SMTP id n5-20020a170902f60500b0014d9e11c864mr3310840plg.54.1647499863701;
        Wed, 16 Mar 2022 23:51:03 -0700 (PDT)
Received: from localhost.localdomain (pcd454078.netvigator.com. [203.218.244.78])
        by smtp.gmail.com with ESMTPSA id k15-20020a63ab4f000000b00381eef69bfbsm3622152pgp.3.2022.03.16.23.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Mar 2022 23:51:03 -0700 (PDT)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng01@gmail.com>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v2 04/12] docs/zh_CN: add vm mmu_notifier translation
Date:   Thu, 17 Mar 2022 14:50:45 +0800
Message-Id: <cffe009c8b94682200c46fb4d80313f603a65cb6.1647498763.git.siyanteng@loongson.cn>
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

Translate .../vm/mmu_notifier.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Reviewed-by: Alex Shi <alexs@kernel.org>
---
 Documentation/translations/zh_CN/vm/index.rst |  3 +-
 .../translations/zh_CN/vm/mmu_notifier.rst    | 97 +++++++++++++++++++
 2 files changed, 98 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/vm/mmu_notifier.rst

diff --git a/Documentation/translations/zh_CN/vm/index.rst b/Documentation/translations/zh_CN/vm/index.rst
index c1f517da81f4..1fb80aa7a08b 100644
--- a/Documentation/translations/zh_CN/vm/index.rst
+++ b/Documentation/translations/zh_CN/vm/index.rst
@@ -30,14 +30,13 @@ TODO:待引用文档集被翻译完毕后请及时修改此处）
    frontswap
    hwpoison
    memory-model
+   mmu_notifier
 
 TODOLIST:
 * arch_pgtable_helpers
 * free_page_reporting
 * hmm
 * hugetlbfs_reserv
-
-* mmu_notifier
 * numa
 * overcommit-accounting
 * page_migration
diff --git a/Documentation/translations/zh_CN/vm/mmu_notifier.rst b/Documentation/translations/zh_CN/vm/mmu_notifier.rst
new file mode 100644
index 000000000000..9a85d6acb249
--- /dev/null
+++ b/Documentation/translations/zh_CN/vm/mmu_notifier.rst
@@ -0,0 +1,97 @@
+:Original: Documentation/vm/mmu_notifier.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
+
+:校译:
+
+
+
+什么时候需要通知内页表锁？
+==========================
+
+当清除一个pte/pmd时，我们可以选择通过在页表锁下（通知版的\*_clear_flush调用
+mmu_notifier_invalidate_range）通知事件。但这种通知并不是在所有情况下都需要的。
+
+对于二级TLB（非CPU TLB），如IOMMU TLB或设备TLB（当设备使用类似ATS/PASID的东西让
+IOMMU走CPU页表来访问进程的虚拟地址空间）。只有两种情况需要在清除pte/pmd时在持有页
+表锁的同时通知这些二级TLB：
+
+  A) 在mmu_notifier_invalidate_range_end()之前，支持页的地址被释放。
+  B) 一个页表项被更新以指向一个新的页面（COW，零页上的写异常，__replace_page()，...）。
+
+情况A很明显，你不想冒风险让设备写到一个现在可能被一些完全不同的任务使用的页面。
+
+情况B更加微妙。为了正确起见，它需要按照以下序列发生:
+
+  - 上页表锁
+  - 清除页表项并通知 ([pmd/pte]p_huge_clear_flush_notify())
+  - 设置页表项以指向新页
+
+如果在设置新的pte/pmd值之前，清除页表项之后没有进行通知，那么你就会破坏设备的C11或
+C++11等内存模型。
+
+考虑以下情况（设备使用类似于ATS/PASID的功能）。
+
+两个地址addrA和addrB，这样|addrA - addrB| >= PAGE_SIZE，我们假设它们是COW的
+写保护（B的其他情况也适用）。
+
+::
+
+ [Time N] --------------------------------------------------------------------
+ CPU-thread-0  {尝试写到addrA}
+ CPU-thread-1  {尝试写到addrB}
+ CPU-thread-2  {}
+ CPU-thread-3  {}
+ DEV-thread-0  {读取addrA并填充设备TLB}
+ DEV-thread-2  {读取addrB并填充设备TLB}
+ [Time N+1] ------------------------------------------------------------------
+ CPU-thread-0  {COW_step0: {mmu_notifier_invalidate_range_start(addrA)}}
+ CPU-thread-1  {COW_step0: {mmu_notifier_invalidate_range_start(addrB)}}
+ CPU-thread-2  {}
+ CPU-thread-3  {}
+ DEV-thread-0  {}
+ DEV-thread-2  {}
+ [Time N+2] ------------------------------------------------------------------
+ CPU-thread-0  {COW_step1: {更新页表以指向addrA的新页}}
+ CPU-thread-1  {COW_step1: {更新页表以指向addrB的新页}}
+ CPU-thread-2  {}
+ CPU-thread-3  {}
+ DEV-thread-0  {}
+ DEV-thread-2  {}
+ [Time N+3] ------------------------------------------------------------------
+ CPU-thread-0  {preempted}
+ CPU-thread-1  {preempted}
+ CPU-thread-2  {写入addrA，这是对新页面的写入}
+ CPU-thread-3  {}
+ DEV-thread-0  {}
+ DEV-thread-2  {}
+ [Time N+3] ------------------------------------------------------------------
+ CPU-thread-0  {preempted}
+ CPU-thread-1  {preempted}
+ CPU-thread-2  {}
+ CPU-thread-3  {写入addrB，这是一个写入新页的过程}
+ DEV-thread-0  {}
+ DEV-thread-2  {}
+ [Time N+4] ------------------------------------------------------------------
+ CPU-thread-0  {preempted}
+ CPU-thread-1  {COW_step3: {mmu_notifier_invalidate_range_end(addrB)}}
+ CPU-thread-2  {}
+ CPU-thread-3  {}
+ DEV-thread-0  {}
+ DEV-thread-2  {}
+ [Time N+5] ------------------------------------------------------------------
+ CPU-thread-0  {preempted}
+ CPU-thread-1  {}
+ CPU-thread-2  {}
+ CPU-thread-3  {}
+ DEV-thread-0  {从旧页中读取addrA}
+ DEV-thread-2  {从新页面读取addrB}
+
+所以在这里，因为在N+2的时候，清空页表项没有和通知一起作废二级TLB，设备在看到addrA的新值之前
+就看到了addrB的新值。这就破坏了设备的总内存序。
+
+当改变一个pte的写保护或指向一个新的具有相同内容的写保护页（KSM）时，将mmu_notifier_invalidate_range
+调用延迟到页表锁外的mmu_notifier_invalidate_range_end()是可以的。即使做页表更新的线程
+在释放页表锁后但在调用mmu_notifier_invalidate_range_end()前被抢占，也是如此。
-- 
2.27.0

