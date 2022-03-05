Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EBB7C433F5
	for <linux-doc@archiver.kernel.org>; Sat,  5 Mar 2022 16:24:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232022AbiCEQZq (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 5 Mar 2022 11:25:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231993AbiCEQZp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 5 Mar 2022 11:25:45 -0500
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BCA31DEA97
        for <linux-doc@vger.kernel.org>; Sat,  5 Mar 2022 08:24:55 -0800 (PST)
Received: by mail-pf1-x42d.google.com with SMTP id s8so6091455pfk.12
        for <linux-doc@vger.kernel.org>; Sat, 05 Mar 2022 08:24:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=N76epsa52S9qCMoVN93KBFeb7Btp8/hbh75cbZ5xFW4=;
        b=QpC6+ael4pb7vlFC6rCx5OF4cvU0FbWhv27mgqZlScqrgCQ/LbiynpjcCeKUGg7Q6W
         wrN2Wm6/QLFQ8MLqkOO8atn9jDInYpnYKwVYuOzAYdLsu6JV8xJJQ+SuW5NhPgdEscon
         m/r/dvdUR2AipHEcX8CEYfHvAAuee+iwKjtqdSY7PShHXENCX3YXX6uXMT79EcEsTIwx
         zgLxSVJT6KUCLdnd9mxadODIi0jE67v7cH7EJ3OEKR2CMyVCK6P1/ogxmH1oaPVC8qqR
         3xKDDz2eAMRh1cpFCawtTTu/pm9grVw6u/aEPZAdx/3zK/dwyHn/gxkDRXB9s8/QgPhe
         xSew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=N76epsa52S9qCMoVN93KBFeb7Btp8/hbh75cbZ5xFW4=;
        b=YK9w4FWMvQXu4oFiMG0/2Sf47kL5z8MzK3SHgO/neBUdIV4pMEqJ1Z3Aa2kZFH5J7S
         m6s529b7AXCI6VKjoVTxg3hvuTevHTXka6vJTZyHvdzBNpAqsH9SubPl4sGzxt0KrMP0
         lPkkIK2hMTSNMw4b6iebustSJuyXSjJQNIcFiun21PyN7W5cmVRdBS9uP2W+Ssim4EDq
         wXItH+6Cd9XULEkCPey2ieNWhCqcKO2qo2i4IBOziT10QqhpZxLM0yo9EB66FH3X4B8n
         gVrUsgGQWDhjcyL0ivV/+eTZ2wrjEkhrbz6hgM/ZJE5sDBX8UqHxfLCWoQqgQWQapVPi
         0taQ==
X-Gm-Message-State: AOAM5312hLX0ghxKjg3NBHGMQS6I/aEik91yS9EGYHtj5WdtcXIzHjZV
        tl5lItuD7sFqlFvD9RD+RFw=
X-Google-Smtp-Source: ABdhPJzDTPpri6lcDYIxDhfWqwnyy3bDeDFzMGvc+9nFNRQDy/7PNGGyvcyYkExzZUoHnoSbDkCGLw==
X-Received: by 2002:a63:5119:0:b0:37f:8077:ae15 with SMTP id f25-20020a635119000000b0037f8077ae15mr3331587pgb.11.1646497494841;
        Sat, 05 Mar 2022 08:24:54 -0800 (PST)
Received: from localhost.localdomain (42-200-190-71.static.imsbiz.com. [42.200.190.71])
        by smtp.gmail.com with ESMTPSA id x7-20020a17090a1f8700b001bf1db72189sm6106269pja.23.2022.03.05.08.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Mar 2022 08:24:54 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: [PATCH 04/12] docs/zh_CN: add vm mmu_notifier translation
Date:   Sun,  6 Mar 2022 00:26:04 +0800
Message-Id: <3a8d4ab693c930db9e9e3d727c33f67dae7e9427.1646496448.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1646496448.git.siyanteng@loongson.cn>
References: <cover.1646496448.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate .../vm/mmu_notifier.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 Documentation/translations/zh_CN/vm/index.rst |  3 +-
 .../translations/zh_CN/vm/mmu_notifier.rst    | 97 +++++++++++++++++++
 2 files changed, 98 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/vm/mmu_notifier.rst

diff --git a/Documentation/translations/zh_CN/vm/index.rst b/Documentation/translations/zh_CN/vm/index.rst
index 186f85a156c0..919e879b8167 100644
--- a/Documentation/translations/zh_CN/vm/index.rst
+++ b/Documentation/translations/zh_CN/vm/index.rst
@@ -29,14 +29,13 @@ TODO:待引用文档集被翻译完毕后请及时修改此处）
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

