Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A347C433FE
	for <linux-doc@archiver.kernel.org>; Thu, 17 Mar 2022 06:51:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229961AbiCQGwj (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 17 Mar 2022 02:52:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230063AbiCQGwg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 17 Mar 2022 02:52:36 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88261ECC5C
        for <linux-doc@vger.kernel.org>; Wed, 16 Mar 2022 23:51:21 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id b8so4084703pjb.4
        for <linux-doc@vger.kernel.org>; Wed, 16 Mar 2022 23:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=26pzTILSSAB+jNQyEXdO7hC3IPsWydlNEbQ3tR74x4I=;
        b=QX6tq1Lx5V4F6vy0exa/xey67BeBWi+9f64yKoM0tHUwmLkZdAXSUmyff9iqSwtXBQ
         qTS6lNIkJgC0u4duoYKGm7yHJ4YqKlBpEJ2br4VXzNJQSilg/mis41pLIaz2nTwMY5l+
         1TtUEpRHPURNx3fVPEgW0weWIdk6UkZVST0wxySj6atQhFuveIirLwVLDe55sDmIHGcb
         wwEITNO49eXLrwlntWabOjA4Ytli5iRYDV/SKjoLqxunR+Ydv1lE1EVMeVAVibJTi64k
         GFMznebCegmF2WkFheJMcxqQRcBVMYcNbt9wk1Q6jANc8cPvQbkFY6SZiBaoRuVr3qmh
         6ObQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=26pzTILSSAB+jNQyEXdO7hC3IPsWydlNEbQ3tR74x4I=;
        b=hvaZ6T8akXrghRiSqTwfUdo8CmIfzsDqMuJ6ev1259X3uUxmpZYlC1GqUW/Jx1pLKc
         F/69yDnc7PdpMPXHcSvXmMJFcVZE9DM5SObCwh7Tt84f6WchWV551qFPVxYeiNQBUJZY
         ZyKb/ZDmYXfecn/jDtxUzJADfr2FEx5atEIXkJT51ODbhPov8QODjg6cvZLzbti4NX3J
         A7WJ7Xkzn7XhLXrFQG55d/m1fmkVmIbWw9ZrXjMooNEOD+CcEFYOElAzg6zTI/YrHs/c
         xYtzcwxAXW1w73pAa+6a7Aq5JIW37/r43hRIe3BLk2rYawTbUfZJvbS9a+/2yqwqIgQc
         fKAg==
X-Gm-Message-State: AOAM530zh19IicbU2y50cY93ZPjnLPtjM5HUplY1YRKroK74Jv5i/MBn
        rpZmjR/V31EyeASZWyNmKvU=
X-Google-Smtp-Source: ABdhPJxkyQwze0Gm44R11AAnH6znxPcATlnnL/PyzW7r+5zJEDZYWZvdY9rDWuj2vikHFENdtEj+FQ==
X-Received: by 2002:a17:90b:1bc1:b0:1bf:7dc6:bc78 with SMTP id oa1-20020a17090b1bc100b001bf7dc6bc78mr3662162pjb.122.1647499880998;
        Wed, 16 Mar 2022 23:51:20 -0700 (PDT)
Received: from localhost.localdomain (pcd454078.netvigator.com. [203.218.244.78])
        by smtp.gmail.com with ESMTPSA id k15-20020a63ab4f000000b00381eef69bfbsm3622152pgp.3.2022.03.16.23.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Mar 2022 23:51:20 -0700 (PDT)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng01@gmail.com>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v2 09/12] docs/zh_CN: add vm remap_file_pages translation
Date:   Thu, 17 Mar 2022 14:50:50 +0800
Message-Id: <1506219c6153c3f47966feee8948ccd646e16157.1647498763.git.siyanteng@loongson.cn>
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

Translate .../vm/remap_file_pages.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 Documentation/translations/zh_CN/vm/index.rst |  2 +-
 .../zh_CN/vm/remap_file_pages.rst             | 32 +++++++++++++++++++
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/vm/remap_file_pages.rst

diff --git a/Documentation/translations/zh_CN/vm/index.rst b/Documentation/translations/zh_CN/vm/index.rst
index a2dea8b618ad..3e4f4cac509c 100644
--- a/Documentation/translations/zh_CN/vm/index.rst
+++ b/Documentation/translations/zh_CN/vm/index.rst
@@ -35,6 +35,7 @@ TODO:待引用文档集被翻译完毕后请及时修改此处）
    page_frags
    page_owner
    page_table_check
+   remap_file_pages
 
 TODOLIST:
 * arch_pgtable_helpers
@@ -43,7 +44,6 @@ TODOLIST:
 * hugetlbfs_reserv
 * numa
 * page_migration
-* remap_file_pages
 * slub
 * split_page_table_lock
 * transhuge
diff --git a/Documentation/translations/zh_CN/vm/remap_file_pages.rst b/Documentation/translations/zh_CN/vm/remap_file_pages.rst
new file mode 100644
index 000000000000..3e0e49b3dffb
--- /dev/null
+++ b/Documentation/translations/zh_CN/vm/remap_file_pages.rst
@@ -0,0 +1,32 @@
+:Original: Documentation/vm/remap_file_pages.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
+
+:校译:
+
+
+==============================
+remap_file_pages()系统调用
+==============================
+
+remap_file_pages()系统调用被用来创建一个非线性映射，也就是说，在这个映射中，
+文件的页面被无序映射到内存中。使用remap_file_pages()比重复调用mmap(2)的好
+处是，前者不需要内核创建额外的VMA（虚拟内存区）数据结构。
+
+支持非线性映射需要在内核虚拟内存子系统中编写大量的non-trivial的代码，包括热
+路径。另外，为了使非线性映射工作，内核需要一种方法来区分正常的页表项和带有文件
+偏移的项（pte_file）。内核为达到这个目的在PTE中保留了标志。PTE标志是稀缺资
+源，特别是在某些CPU架构上。如果能腾出这个标志用于其他用途就更好了。
+
+幸运的是，在生活中并没有很多remap_file_pages()的用户。只知道有一个企业的RDBMS
+实现在32位系统上使用这个系统调用来映射比32位虚拟地址空间线性尺寸更大的文件。
+由于64位系统的广泛使用，这种使用情况已经不重要了。
+
+syscall被废弃了，现在用一个模拟来代替它。仿真会创建新的VMA，而不是非线性映射。
+对于remap_file_pages()的少数用户来说，它的工作速度会变慢，但ABI被保留了。
+
+仿真的一个副作用（除了性能之外）是，由于额外的VMA，用户可以更容易达到
+vm.max_map_count的限制。关于限制的更多细节，请参见DEFAULT_MAX_MAP_COUNT
+的注释。
\ No newline at end of file
-- 
2.27.0

