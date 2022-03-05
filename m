Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9890FC433EF
	for <linux-doc@archiver.kernel.org>; Sat,  5 Mar 2022 16:25:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231993AbiCEQZv (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 5 Mar 2022 11:25:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232019AbiCEQZu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 5 Mar 2022 11:25:50 -0500
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEE921E0171
        for <linux-doc@vger.kernel.org>; Sat,  5 Mar 2022 08:25:00 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id p17so10315615plo.9
        for <linux-doc@vger.kernel.org>; Sat, 05 Mar 2022 08:25:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZCyGpvpKqO2yjX4QzIYl+n5imM/JsBCQwYW9ywO4Hqo=;
        b=nQI9/1ZG9tYKzfZZ4iw9y5VN/63Eq9gBfFDagfs2lwYUzksGY976bdBo7AC6SiupPR
         vm1my+keg8fqvqbV3US+RYDxHLfifgqnZzLosPyxPb4bxtToFyjfdaMcGbwHjp+PHiNm
         iKFoOy40L7KJqlqt6/R3Ezn0ktXNd5monnvbhmMc4QdTkji6UcvAmGDLa/03y1nhZY7s
         WaG4sE7jdNy2WUHDkejlTqeW/FvSQCRTDRFo8H5n82TlqMyr48434E/m7oUVr+sfwwkv
         fUq+ISz92Xz+UTxOm/OOxlvwXjCIioty73OKbKFmRfuBhaGcx9f/+MGdgBPHJZbiucGy
         Ya7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZCyGpvpKqO2yjX4QzIYl+n5imM/JsBCQwYW9ywO4Hqo=;
        b=nN+uM3MnwNewhJnx4PNl4Mhqz/1OA5BqVvtAsGbLl3p1NR/3i6M251p5uniCvZ7j21
         tAEGlMzTQUMgXrEFM+u05xk59I5mNtlfOwzxAmGBP2LmYAd8NxGeRGJgPzVljk6e/sgY
         4s/enj5boAOeWr78LBrMKzXdx/3OKa2WIN7SkX9Kyi2YMeYAaoVI/AyqHdmsvS1GVQJA
         uDMCFXs7CEMlTeb6sCnUWF/RNHOqE89Ymwi9yVMTllVpbWGnT+D0ghMeXDt7zyhuD1Cg
         DLoI3efggNemrBc/4cMVBBqc9Awxp4hnU8qnyCY2QgLtWneWXt7aFbu057UKeZvbHDbM
         fOaw==
X-Gm-Message-State: AOAM533C/gPNOam9iybq9ShPfsrXfrxZBY3OUmJk0a4DMsmTo8myH8EZ
        2k7T0zcr0uD6rVgLSnEvmD4=
X-Google-Smtp-Source: ABdhPJzIEBY4Zy0ufbfX14Oky6PrGDNTQpjGvnV/4EA371u5R/8Q2kO1yR4dNt94A+5QxzaLZWBtkQ==
X-Received: by 2002:a17:903:32c7:b0:151:bba0:546a with SMTP id i7-20020a17090332c700b00151bba0546amr4174474plr.40.1646497500126;
        Sat, 05 Mar 2022 08:25:00 -0800 (PST)
Received: from localhost.localdomain (42-200-190-71.static.imsbiz.com. [42.200.190.71])
        by smtp.gmail.com with ESMTPSA id x7-20020a17090a1f8700b001bf1db72189sm6106269pja.23.2022.03.05.08.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Mar 2022 08:24:59 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: [PATCH 05/12] docs/zh_CN: add vm overcommit-accounting translation
Date:   Sun,  6 Mar 2022 00:26:05 +0800
Message-Id: <f8b38603bc022c4d2c8017bf8b66a4c26bc48fb3.1646496448.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1646496448.git.siyanteng@loongson.cn>
References: <cover.1646496448.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate .../vm/overcommit-accounting.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 Documentation/translations/zh_CN/vm/index.rst |  2 +-
 .../zh_CN/vm/overcommit-accounting.rst        | 86 +++++++++++++++++++
 2 files changed, 87 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/vm/overcommit-accounting.rst

diff --git a/Documentation/translations/zh_CN/vm/index.rst b/Documentation/translations/zh_CN/vm/index.rst
index 919e879b8167..2a3a93a4c050 100644
--- a/Documentation/translations/zh_CN/vm/index.rst
+++ b/Documentation/translations/zh_CN/vm/index.rst
@@ -30,6 +30,7 @@ TODO:待引用文档集被翻译完毕后请及时修改此处）
    hwpoison
    memory-model
    mmu_notifier
+   overcommit-accounting
 
 TODOLIST:
 * arch_pgtable_helpers
@@ -37,7 +38,6 @@ TODOLIST:
 * hmm
 * hugetlbfs_reserv
 * numa
-* overcommit-accounting
 * page_migration
 * page_frags
 * page_owner
diff --git a/Documentation/translations/zh_CN/vm/overcommit-accounting.rst b/Documentation/translations/zh_CN/vm/overcommit-accounting.rst
new file mode 100644
index 000000000000..1e3eae1338cb
--- /dev/null
+++ b/Documentation/translations/zh_CN/vm/overcommit-accounting.rst
@@ -0,0 +1,86 @@
+:Original: Documentation/vm/overcommit.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
+
+:校译:
+
+
+
+==============
+Overcommit审计
+==============
+
+Linux内核支持下列overcommit处理模式
+
+0
+	启发式overcommit处理。拒绝明显的地址空间overcommit。用于一个典型的系统。
+	它确保严重的疯狂分配失败，同时允许overcommit以减少swap的使用。在这种模式下，
+	允许root分配稍多的内存。这是默认的。
+1
+	总是overcommit。适用于一些科学应用。经典的例子是使用稀疏数组的代码，只是依赖
+	几乎完全由零页组成的虚拟内存
+
+2
+	不overcommit。系统提交的总地址空间不允许超过swap+一个可配置的物理RAM的数量
+	（默认为50%）。根据你使用的数量，在大多数情况下，这意味着一个进程在访问页面时
+	不会被杀死，但会在内存分配上收到相应的错误。
+
+	对于那些想保证他们的内存分配在未来可用而又不需要初始化每一个页面的应用程序来说
+	是很有用的。
+
+overcommit策略是通过sysctl  `vm.overcommit_memory` 设置的。
+
+可以通过 `vm.overcommit_ratio` （百分比）或 `vm.overcommit_kbytes` （绝对值）
+来设置超限数量。这些只有在 `vm.overcommit_memory` 被设置为2时才有效果。
+
+在 ``/proc/meminfo`` 中可以分别以CommitLimit和Committed_AS的形式查看当前
+的overcommit和提交量。
+
+陷阱
+====
+
+C语言的堆栈增长是一个隐含的mremap。如果你想得到绝对的保证，并在接近边缘的地方运行，
+你 **必须** 为你认为你需要的最大尺寸的堆栈进行mmap。对于典型的堆栈使用来说，这并
+不重要，但如果你真的非常关心的话，这就是一个值得关注的案例。
+
+
+在模式2中，MAP_NORESERVE标志被忽略。
+
+
+它是如何工作的
+==============
+
+overcommit是基于以下规则
+
+For a file backed map
+	| SHARED or READ-only	-	0 cost (该文件是映射而不是交换)
+	| PRIVATE WRITABLE	-	每个实例的映射大小
+
+For an anonymous or ``/dev/zero`` map
+	| SHARED			-	映射的大小
+	| PRIVATE READ-only	-	0 cost (但作用不大)
+	| PRIVATE WRITABLE	-	每个实例的映射大小
+
+Additional accounting
+	| 通过mmap制作可写副本的页面
+	| 从同一池中提取的shmfs内存
+
+状态
+====
+
+*	我们核算mmap内存映射
+*	我们核算mprotect在提交中的变化
+*	我们核算mremap的大小变化
+*	我们的审计 brk
+*	审计munmap
+*	我们在/proc中报告commit 状态
+*	核对并检查分叉的情况
+*	审查堆栈处理/执行中的构建
+*	叙述SHMfs的情况
+*	实现实际限制的执行
+
+待续
+====
+*	帐户trace页（这很难）。
-- 
2.27.0

