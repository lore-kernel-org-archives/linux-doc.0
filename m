Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A586C433EF
	for <linux-doc@archiver.kernel.org>; Mon, 28 Mar 2022 09:59:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240107AbiC1KAk (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 28 Mar 2022 06:00:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238452AbiC1KAj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 28 Mar 2022 06:00:39 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3044C2E6AB
        for <linux-doc@vger.kernel.org>; Mon, 28 Mar 2022 02:58:59 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id f10so4007357plr.6
        for <linux-doc@vger.kernel.org>; Mon, 28 Mar 2022 02:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+X+i8zfWoKTEaz0v8Tvfm3lJRXbTfYfMCi+b9t0Qu9U=;
        b=XqjmHi7f1eaMVTKHjoOex1OiiAlqm08VrC9y9DkH6o2ZsG/4QJWDAn49Pk3cf0LwLA
         udTDqDSUQadHR1sjSvFHmGxTv4NJNl5uuoZh1W1hTjZde1k5SHmWKETWAnlPNUdjl4TG
         aXSUQMGO1LyIOPbHqysLwzE5Fuj10PgyBjXu0O4WEe7U/Yv+QY9xfVWA4hUQUdoveR5f
         wmpjPgO4PohJVJ+rmRofZxXppO4V1HPjdXR1C7xHZ3SNlxFqmQgDnQ4RPZ9LTX6P445m
         mfq184gYAhieMkTmC8NMRECqVJTKwtNZKQxb3AaGmd9wIAiQjtJlcNZU4H1uTPSAueRi
         s4xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+X+i8zfWoKTEaz0v8Tvfm3lJRXbTfYfMCi+b9t0Qu9U=;
        b=DNkTmTdELqytCG/NWrmOpITTNTOaqNEbbwgz5sTEZ5toKVXBSuAtDp2TFS1Y4Ywyse
         /BMk//4ELUFNa09HCPwkMOnjjMBIZSd4tjyoLgQoDvHFz4vpM+hND8PRYOHJZc8VkuD1
         ChObBHWdY/0h3/L1llRAtbRsd8T8oDgVoe7ntV2cMPtQen4q8lVfNn5PAmiVTp3vDg3M
         xq53muw3s9tJ0r7Cni8OQnqOtJ8pcX5zorRtju75GRM6fkNYmdFjETZCtgNIdcp5xcvr
         ppW/0BmiisEoEjI0TqREYNB3ONJh6P0fQ7kpHos51k43ndaRucQoSEISdHOtchnS+5kg
         LxSg==
X-Gm-Message-State: AOAM533ARi79SUhso56Hv26dfJWL1HUm+a8xUSo9t/smFkl7dAM65mFs
        Z2kJxhX9heUyexDVAIfMxaw=
X-Google-Smtp-Source: ABdhPJyNLmcUdWvwbdEXWT1XuQkr7S5Ci1qCrykXAcTfjh1F7mhZ8jxif3xJIw554hcd+6m/0JcVCg==
X-Received: by 2002:a17:902:eb8c:b0:153:fb56:1905 with SMTP id q12-20020a170902eb8c00b00153fb561905mr25125854plg.158.1648461538641;
        Mon, 28 Mar 2022 02:58:58 -0700 (PDT)
Received: from localhost.localdomain (111-250-2-155.dynamic-ip.hinet.net. [111.250.2.155])
        by smtp.gmail.com with ESMTPSA id 8-20020a17090a174800b001c7d8b160f0sm10526637pjm.51.2022.03.28.02.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Mar 2022 02:58:58 -0700 (PDT)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng01@gmail.com>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v3 04/12] docs/zh_CN: add vm mmu_notifier translation
Date:   Mon, 28 Mar 2022 17:59:46 +0800
Message-Id: <14ad3859f3444143f42884bfc447ce1baa1d80dd.1648458742.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1648458742.git.siyanteng@loongson.cn>
References: <cover.1648458742.git.siyanteng@loongson.cn>
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
index 000000000000..b29a37b33628
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
+什么时候需要页表锁内通知？
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

