Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FFE4C433F5
	for <linux-doc@archiver.kernel.org>; Thu, 27 Jan 2022 01:50:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234653AbiA0Buf (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 26 Jan 2022 20:50:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232321AbiA0Buf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 26 Jan 2022 20:50:35 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD071C06161C
        for <linux-doc@vger.kernel.org>; Wed, 26 Jan 2022 17:50:34 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id z14-20020a17090ab10e00b001b6175d4040so297590pjq.0
        for <linux-doc@vger.kernel.org>; Wed, 26 Jan 2022 17:50:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OSA4CA2L5jSIoVce4G8+ABuGOXk7PJrrok5gCG5ngcY=;
        b=JOn8+i55GeYSd22fh/fwjwlbphcZTsn3RUCn1BlrQ8MNiIOvor5DnNq+QUumHzuzcC
         qlhQyYiGMpSRIokqlTai2CRwhoOtNhzYuFLXH568Pdtpbl7IhE6e7c3dx0wgrTbAxLIP
         guMATjY5Ix7AM1PSC+Z3vlMyLpnQD3BIwORKSrTAYxfOoOpB3vxUGZxy+uaYXakXuPQF
         tGQNh/6PFrpZyqy4H8xfvy26sWJ3eBohngTvarlAlmJaxGisJg6+TCck9RGbYsPcGT4n
         ONi+YPm4DHot0sSdytr9cIAjLCj9vs2DJDEnz0SlrMJHcBB168yQeaxj6jmy5GpRGpUL
         RqXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OSA4CA2L5jSIoVce4G8+ABuGOXk7PJrrok5gCG5ngcY=;
        b=gDuevGbs22Gfm07sXURPb7wkZ1kzKuGpqlmtp+8C1mVMo3rdBHVvNQrIjC+gAUTdk0
         /xwaYUe2xJfV0NWlwFuSGSyDF9r4UMy5Rm2tTDqiDTBrMDRlZuFfYlQ2Phx7FIS7oTku
         XPI+hz3ZPLCQa3srwjEOlRs2v/pRW5+pDxxxsEX0llTvTwZaocu4XtCnmfLTPP70eUqD
         ggFaFtKbXQ4PzK0q6n0OrsfPHtN6J2E271umsZ7choJu2OClNUfKQEIUgCTmtqJxxVmR
         x3F/PDBaCgCIyylNQL2SMs5egsiVhEdmfBMjzT7ATkgpL//cKeOkrWp82sAEF5S5BGap
         rTzw==
X-Gm-Message-State: AOAM530+JqtMB/o8QN+TFDL7f0UtRNE88AQ5c/zz5B+Ae7BUFOW3txxH
        weWp62IQti417ev8jC/7Ymg=
X-Google-Smtp-Source: ABdhPJwFAz1p0CnlC4WnlMD0+TjxLv2CVy6bhdaoNXNYOL+/YpzZvhJsWLBCUOxFYB3fN8U7qDANig==
X-Received: by 2002:a17:90a:9284:: with SMTP id n4mr1776785pjo.109.1643248234298;
        Wed, 26 Jan 2022 17:50:34 -0800 (PST)
Received: from localhost.localdomain (cm218-252-25-221.hkcable.com.hk. [218.252.25.221])
        by smtp.gmail.com with ESMTPSA id a14sm3594562pfv.212.2022.01.26.17.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jan 2022 17:50:34 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, tangyizhou@huawei.com,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com
Subject: [PATCH 2/2] docs/zh_CN: add highmem translation
Date:   Thu, 27 Jan 2022 09:47:54 +0800
Message-Id: <51e088d1e8659b9411534a5a3ad03d88c79a5297.1643246827.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1643246827.git.siyanteng@loongson.cn>
References: <cover.1643246827.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate .../vm/highmem.rst into Chenese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../translations/zh_CN/vm/highmem.rst         | 128 ++++++++++++++++++
 Documentation/translations/zh_CN/vm/index.rst |   2 +-
 2 files changed, 129 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/vm/highmem.rst

diff --git a/Documentation/translations/zh_CN/vm/highmem.rst b/Documentation/translations/zh_CN/vm/highmem.rst
new file mode 100644
index 000000000000..d3021e21780b
--- /dev/null
+++ b/Documentation/translations/zh_CN/vm/highmem.rst
@@ -0,0 +1,128 @@
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/vm/highmem.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
+
+:校译:
+
+==========
+高内存处理
+==========
+
+作者: Peter Zijlstra <a.p.zijlstra@chello.nl>
+
+.. contents:: :local:
+
+高内存是什么？
+==============
+
+当物理内存的大小接近或超过虚拟内存的最大大小时，就会使用高内存（highmem）。在这一点上，内
+核不可能在任何时候都保持所有可用的物理内存的映射。这意味着内核需要开始使用它想访问的物理内
+存的临时映射。
+
+没有被永久映射覆盖的那部分（物理）内存就是我们所说的 "高内存"。对于这个边界的确切位置，有
+各种架构上的限制。
+
+例如，在i386架构中，我们选择将内核映射到每个进程的虚拟空间，这样我们就不必为内核的进入/退
+出付出全部的TLB作废代价。这意味着可用的虚拟内存空间（i386上为4GiB）必须在用户和内核空间之
+间进行划分。
+
+使用这种方法的架构的传统分配方式是3:1，3GiB用于用户空间，顶部的1GiB用于内核空间。::
+
+		+--------+ 0xffffffff
+		| Kernel |
+		+--------+ 0xc0000000
+		|        |
+		| User   |
+		|        |
+		+--------+ 0x00000000
+
+这意味着内核在任何时候最多可以映射1GiB的物理内存，但是由于我们需要虚拟地址空间来做其他事
+情--包括访问其余物理内存的临时映射--实际的直接映射通常会更少（通常在~896MiB左右）。
+
+其他有mm上下文标签的TLB的架构可以有独立的内核和用户映射。然而，一些硬件（如一些ARM）在使
+用mm上下文标签时，其虚拟空间有限。
+
+
+临时虚拟映射
+============
+
+内核包含几种创建临时映射的方法。:
+
+* vmap().  这可以用来将多个物理页长期映射到一个连续的虚拟空间。它需要synchronization
+  来解除映射。
+
+* kmap().  这允许对单个页面进行短期映射。它需要synchronization，但在一定程度上被摊销。
+  当以嵌套方式使用时，它也很容易出现死锁，因此不建议在新代码中使用它。
+
+* kmap_atomic().  这允许对单个页面进行非常短的时间映射。由于映射被限制在发布它的CPU上，
+  它表现得很好，但发布任务因此被要求留在该CPU上直到它完成，以免其他任务取代它的映射。
+
+  kmap_atomic() 也可以由中断上下文使用，因为它不睡眠，而且调用者可能在调用kunmap_atomic()
+  之后才睡眠。
+
+  可以假设k[un]map_atomic()不会失败。
+
+
+使用kmap_atomic
+===============
+
+何时何地使用 kmap_atomic() 是很直接的。当代码想要访问一个可能从高内存（见__GFP_HIGHMEM）
+分配的页面的内容时，例如在页缓存中的页面，就会使用它。该API有两个函数，它们的使用方式与
+下面类似::
+
+	/* 找到感兴趣的页面。 */
+	struct page *page = find_get_page(mapping, offset);
+
+	/* 获得对该页内容的访问权。 */
+	void *vaddr = kmap_atomic(page);
+
+	/* 对该页的内容做一些处理。 */
+	memset(vaddr, 0, PAGE_SIZE);
+
+	/* 解除该页面的映射。 */
+	kunmap_atomic(vaddr);
+
+注意，kunmap_atomic()调用的是kmap_atomic()调用的结果而不是参数。
+
+如果你需要映射两个页面，因为你想从一个页面复制到另一个页面，你需要保持kmap_atomic调用严
+格嵌套，如::
+
+	vaddr1 = kmap_atomic(page1);
+	vaddr2 = kmap_atomic(page2);
+
+	memcpy(vaddr1, vaddr2, PAGE_SIZE);
+
+	kunmap_atomic(vaddr2);
+	kunmap_atomic(vaddr1);
+
+
+临时映射的成本
+==============
+
+创建临时映射的代价可能相当高。体系架构必须操作内核的页表、数据TLB和/或MMU的寄存器。
+
+如果CONFIG_HIGHMEM没有被设置，那么内核会尝试用一点计算来创建映射，将页面结构地址转换成
+指向页面内容的指针，而不是去捣鼓映射。在这种情况下，解映射操作可能是一个空操作。
+
+如果CONFIG_MMU没有被设置，那么就不可能有临时映射和高内存。在这种情况下，也将使用计算方法。
+
+
+i386 PAE
+========
+
+在某些情况下，i386 架构将允许你在 32 位机器上安装多达 64GiB 的内存。但这有一些后果:
+
+* Linux需要为系统中的每个页面建立一个页帧结构，而且页帧需要驻在永久映射中，这意味着：
+
+* 你最多可以有896M/sizeof(struct page)页帧；由于页结构体是32字节的，所以最终会有
+  112G的页；然而，内核需要在内存中存储更多的页帧......
+
+* PAE使你的页表变大--这使系统变慢，因为更多的数据需要在TLB填充等方面被访问。一个好处
+  是，PAE有更多的PTE位，可以提供像NX和PAT这样的高级功能。
+
+一般的建议是，你不要在32位机器上使用超过8GiB的空间--尽管更多的空间可能对你和你的工作
+量有用，但你几乎是靠你自己--不要指望内核开发者真的会很关心事情的进展情况。
diff --git a/Documentation/translations/zh_CN/vm/index.rst b/Documentation/translations/zh_CN/vm/index.rst
index 9cdfde0364f0..a1d2f0356cc1 100644
--- a/Documentation/translations/zh_CN/vm/index.rst
+++ b/Documentation/translations/zh_CN/vm/index.rst
@@ -25,13 +25,13 @@ TODO:待引用文档集被翻译完毕后请及时修改此处）
    balance
    damon/index
    free_page_reporting
+   highmem
    ksm
 
 TODOLIST:
 * arch_pgtable_helpers
 * free_page_reporting
 * frontswap
-* highmem
 * hmm
 * hwpoison
 * hugetlbfs_reserv
-- 
2.27.0

