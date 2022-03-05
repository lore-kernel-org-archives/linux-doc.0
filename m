Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85BC1C433F5
	for <linux-doc@archiver.kernel.org>; Sat,  5 Mar 2022 16:25:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232025AbiCEQ0E (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 5 Mar 2022 11:26:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232024AbiCEQ0D (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 5 Mar 2022 11:26:03 -0500
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 460BB1E5A76
        for <linux-doc@vger.kernel.org>; Sat,  5 Mar 2022 08:25:13 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id e13so10337904plh.3
        for <linux-doc@vger.kernel.org>; Sat, 05 Mar 2022 08:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=l1nV/g2wTZvyWOMCD2mR4LuYua9InHPk29HBS4iU6S4=;
        b=ON5MHqmn5lOeK+WvS2iPYtcLNXAw9CtIFNgjnOv00gpQMJz5uI1rXFK4CHBtmjKEaT
         02pb4DISIUp2QiLp/5O9VcAp6fkiI7+8ZbA6K6Ig3jrHkGbmMo7Lw3QuaDNI06z0vDYK
         HBmCLg73fTrIFvf2bqkdAXaLBpVsmeFZi8QoSGCnnomxzfLADihZJS2yXdrKB28Vudwk
         nTvkoOCPFbzkLJacxUerxm44CbtQjLvgCgE1tax83eTV9j8Hs7O16U1YF38T52CiYKHP
         n0qsjwJSzSWyBOb070v12EEQsBsAEbzizI02EL/nadGnX+COzJ/1/i2Uu04iJBdn/bxk
         /zoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=l1nV/g2wTZvyWOMCD2mR4LuYua9InHPk29HBS4iU6S4=;
        b=USj/csgIWZYdvDSN9hYw4cCmCOjMjsQPa9GXcsBa4riSrRTj0AfPjeRwvxtzm9hScY
         NLqilfuTiju0eeCXsSzLnJQswC/1Wh0FrIql0oszvwL9KqRau8RaIycjyRJvN0bOLGWj
         ehlNQFCVXqwRHyzknzyeUpI8DHVNINryL+VxdnAsmWlqG7MmBi4eF/yFKoSZ15Os2Ksr
         WIDqLK8SXRimGW06dN2CVqobBZuGI4AFmZ3K4tasiNSEPDRmJdmiTRvR9K4gXR7oALKN
         TIYPZJuZEv0qQzP6G6Gt+m9uVZWoChxSappZEJYJpfw7fZkrafl1o0f7rAHoeyY7eLq9
         NiZw==
X-Gm-Message-State: AOAM530e9In8gbgQ9tAB6UXrzKn9r3n//ER7UgsIukJFCsZ3/Yk3AXTl
        vN9naYUVusolK2pEOSqaXV0=
X-Google-Smtp-Source: ABdhPJyX0S9jyJo1BU+Zrv5icLtuZcG8V/TiO1xDO1wdf7wuRFgx7gaLSoPUwkSbizM8uioxvl00Iw==
X-Received: by 2002:a17:90a:a795:b0:1b9:2f9a:c049 with SMTP id f21-20020a17090aa79500b001b92f9ac049mr4467338pjq.240.1646497512686;
        Sat, 05 Mar 2022 08:25:12 -0800 (PST)
Received: from localhost.localdomain (42-200-190-71.static.imsbiz.com. [42.200.190.71])
        by smtp.gmail.com with ESMTPSA id x7-20020a17090a1f8700b001bf1db72189sm6106269pja.23.2022.03.05.08.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Mar 2022 08:25:12 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: [PATCH 09/12] docs/zh_CN: add vm remap_file_pages translation
Date:   Sun,  6 Mar 2022 00:26:09 +0800
Message-Id: <dc8d36588870359a54db8462bf6f6884de390ed6.1646496448.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1646496448.git.siyanteng@loongson.cn>
References: <cover.1646496448.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate .../vm/remap_file_pages.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 Documentation/translations/zh_CN/vm/index.rst |  2 +-
 .../zh_CN/vm/remap_file_pages.rst             | 32 +++++++++++++++++++
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/vm/remap_file_pages.rst

diff --git a/Documentation/translations/zh_CN/vm/index.rst b/Documentation/translations/zh_CN/vm/index.rst
index 33a04a623608..6d804be1b9d1 100644
--- a/Documentation/translations/zh_CN/vm/index.rst
+++ b/Documentation/translations/zh_CN/vm/index.rst
@@ -34,6 +34,7 @@ TODO:待引用文档集被翻译完毕后请及时修改此处）
    page_frags
    page_owner
    page_table_check
+   remap_file_pages
 
 TODOLIST:
 * arch_pgtable_helpers
@@ -42,7 +43,6 @@ TODOLIST:
 * hugetlbfs_reserv
 * numa
 * page_migration
-* remap_file_pages
 * slub
 * split_page_table_lock
 * transhuge
diff --git a/Documentation/translations/zh_CN/vm/remap_file_pages.rst b/Documentation/translations/zh_CN/vm/remap_file_pages.rst
new file mode 100644
index 000000000000..4291c600d22a
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
+幸运的是，在生活中并没有很多remap_file_pages()的用户。只知道一个企业的RDBMS
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

