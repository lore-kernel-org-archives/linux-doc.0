Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31ED7C4332F
	for <linux-doc@archiver.kernel.org>; Mon, 28 Mar 2022 09:59:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240120AbiC1KAz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 28 Mar 2022 06:00:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240115AbiC1KAy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 28 Mar 2022 06:00:54 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 419924130B
        for <linux-doc@vger.kernel.org>; Mon, 28 Mar 2022 02:59:13 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id c15-20020a17090a8d0f00b001c9c81d9648so237983pjo.2
        for <linux-doc@vger.kernel.org>; Mon, 28 Mar 2022 02:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AAvJxMQEEM61ZcW5e/1wHe2yd4Fqe2CFep9x6YNicM8=;
        b=aZctRTu7+o3DyY7LrvvtocoXxKjusDyLu02BZAjeYRHCwAQk5zwx48p5wVNcR4dNcH
         0U2+8h0j6NvOI3M0OCgmGb7O7ysrNOwgIcgRb9lxvUcvqlPG+Uy3iFDql2rSFcZOznwq
         0fmkE/NLoqhIIgtsCZoOAk9PpeXu3JGIMQkpeK2zagfv/2n5toVj9TdywHFj+LcrWQrV
         x63oqRZFXfguEApOgQtImlmTmmYBYlNfFfIPwumG908DnIvKLAgP2P8CUMGjMvIKgh96
         enZwdrLuJMXfSMmJ66/IZdMs57hXeD+7umVmlsZjMg5/ohngvVMQka/PJg+gF3k1+mEP
         DfXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AAvJxMQEEM61ZcW5e/1wHe2yd4Fqe2CFep9x6YNicM8=;
        b=hw4oGGfjML67sHtEFolC2MhqM9N23NYSM6D0T8UG4xx4cumUns19Iz2SsHhluUmI3f
         miGoWEbHKBJ+JFdefuMWuhhn2vwWbzdBIFsYb7LVVQhMFbOEdOkzPPWXribjXEr3DUKA
         y4yrDGxO8d1athEQLC1ZfBVwGV1j3UpDeKrqHZNx2mXCDMFv4sxb8zebvXk2aMq12maV
         AvIPTjEmmuk63ge2Kea0nmaGEJ/HeJvOdKnOKlBH4/1+SLEOKO+Hb6ejIzbB7xMMizP3
         F+WjtktlDyABvuq+Ydj6V2lQ4ziN9D3Prp6HqllWHEAt9Q+m+4gPfTFNKYZVY+353F8S
         dkHg==
X-Gm-Message-State: AOAM533GEgX9wNFjPrWaGbhtYd9Gia4781rib/T0xWwBjYpyflnhRKBo
        sqKxaL6xkKnsMeAciI0vwyc=
X-Google-Smtp-Source: ABdhPJxa9/fMJDUCuXF5zhs48ohlrYZoarQJNUilisH0Y/Y3IWKC4/fXVyPcXPe6Fvd5/yBvqVZDkg==
X-Received: by 2002:a17:90b:4ac1:b0:1c7:7e32:4ec4 with SMTP id mh1-20020a17090b4ac100b001c77e324ec4mr27376941pjb.85.1648461553432;
        Mon, 28 Mar 2022 02:59:13 -0700 (PDT)
Received: from localhost.localdomain (111-250-2-155.dynamic-ip.hinet.net. [111.250.2.155])
        by smtp.gmail.com with ESMTPSA id 8-20020a17090a174800b001c7d8b160f0sm10526637pjm.51.2022.03.28.02.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Mar 2022 02:59:13 -0700 (PDT)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng01@gmail.com>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v3 09/12] docs/zh_CN: add vm remap_file_pages translation
Date:   Mon, 28 Mar 2022 17:59:51 +0800
Message-Id: <265cf95bcfc28f94c40b01e8c0c6d191fcdcbe45.1648458742.git.siyanteng@loongson.cn>
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

Translate .../vm/remap_file_pages.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Reviewed-by: Alex Shi <alexs@kernel.org>
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
index 000000000000..af6b7e28af23
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
-- 
2.27.0

