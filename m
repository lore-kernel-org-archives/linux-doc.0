Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0CACC433F5
	for <linux-doc@archiver.kernel.org>; Thu, 17 Mar 2022 06:51:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230064AbiCQGwh (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 17 Mar 2022 02:52:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230021AbiCQGwZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 17 Mar 2022 02:52:25 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FCEBECD99
        for <linux-doc@vger.kernel.org>; Wed, 16 Mar 2022 23:51:07 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id o23so1970772pgk.13
        for <linux-doc@vger.kernel.org>; Wed, 16 Mar 2022 23:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NVq4XwXYXYu+ITy+WrwW7u/onH+X2sWprOLAfXzTo8M=;
        b=DkW0/qr6squHAKqldktoNu9nK4s7wyEyzQGghQqvCR6xBIfvYTz0dt0cjM0VgXh46Y
         QSjdMAPu74igPDmelR+NrTLG5e9bR6KDUIpNipPIJ5DnwypZqvyDA9YQB8bMNeK+y7M6
         eUIRn78nYIfEPEyGP4nIgKFiGAsZMMT7uvGzP4KId9mPiFa9mcMhzBZRAQqLXUvq/+E0
         vIVOsSq5Pk+1M0q5GQqosaJlo4Bu6ctVXcdy2Y+nD72ETCxSr+qWze/R5bcckYQVSkEP
         mL9fNDu+ysNS6RKZG2Uv1CXknoLPhkIPTkdkDtOI/TiR0s7ajKWLPMkteN3bMD3NC+nk
         IQrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NVq4XwXYXYu+ITy+WrwW7u/onH+X2sWprOLAfXzTo8M=;
        b=RJN1Srt0qH2Nn1J+ZPrU35t14j/Fl2VP/RID2RErJAtHXPrw2AEFBlvPnAPQiW3NzA
         BXnfoFVx2auI8y4puUrOqsSj2qqGR6dGjiDYPH88ZwZIMfu4bIHq+kRebxWP2kXLQdeV
         qkn3RrmnxMHtOhMk7GltTmN7pnokevdkdFuqcUqV27EBAdvzh33ncY3EWpBCf+D2I0w5
         qCq1WWbQvTiaf/gL2jYTKo8YOBgs1BWirjuk2GqBaH2t3wKJCPVLoKX0Exp9CNTHjO2V
         RNmkEwxjAEPKk+dovjWbUP7ewhONGSiO6YAL1eLy4+djXEyT8DNzpakwGN8IxUPuiMVB
         usKQ==
X-Gm-Message-State: AOAM530Zs0ZfWnwU4qhkzmEzrnFYjrMgkM3VTCSvLpBL+0oY0u03VvSR
        mZv63K5BWPrRsAEMT+OfdavF4inru4BRejTi
X-Google-Smtp-Source: ABdhPJxSkUhxpn1qk7k5qQM+0oQToQW3ES0aBUM8DQEFBZkj6mpDLjjyKahV22cqTynt5v4whtthBQ==
X-Received: by 2002:a65:6e82:0:b0:381:71c9:9856 with SMTP id bm2-20020a656e82000000b0038171c99856mr2598594pgb.316.1647499866910;
        Wed, 16 Mar 2022 23:51:06 -0700 (PDT)
Received: from localhost.localdomain (pcd454078.netvigator.com. [203.218.244.78])
        by smtp.gmail.com with ESMTPSA id k15-20020a63ab4f000000b00381eef69bfbsm3622152pgp.3.2022.03.16.23.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Mar 2022 23:51:06 -0700 (PDT)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng01@gmail.com>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v2 05/12] docs/zh_CN: add vm overcommit-accounting translation
Date:   Thu, 17 Mar 2022 14:50:46 +0800
Message-Id: <144153c9b9f611d508255b339299d62e56e470be.1647498763.git.siyanteng@loongson.cn>
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

Translate .../vm/overcommit-accounting.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 Documentation/translations/zh_CN/vm/index.rst |  2 +-
 .../zh_CN/vm/overcommit-accounting.rst        | 86 +++++++++++++++++++
 2 files changed, 87 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/vm/overcommit-accounting.rst

diff --git a/Documentation/translations/zh_CN/vm/index.rst b/Documentation/translations/zh_CN/vm/index.rst
index 1fb80aa7a08b..1c6ec847a2f3 100644
--- a/Documentation/translations/zh_CN/vm/index.rst
+++ b/Documentation/translations/zh_CN/vm/index.rst
@@ -31,6 +31,7 @@ TODO:待引用文档集被翻译完毕后请及时修改此处）
    hwpoison
    memory-model
    mmu_notifier
+   overcommit-accounting
 
 TODOLIST:
 * arch_pgtable_helpers
@@ -38,7 +39,6 @@ TODOLIST:
 * hmm
 * hugetlbfs_reserv
 * numa
-* overcommit-accounting
 * page_migration
 * page_frags
 * page_owner
diff --git a/Documentation/translations/zh_CN/vm/overcommit-accounting.rst b/Documentation/translations/zh_CN/vm/overcommit-accounting.rst
new file mode 100644
index 000000000000..8765cb118f24
--- /dev/null
+++ b/Documentation/translations/zh_CN/vm/overcommit-accounting.rst
@@ -0,0 +1,86 @@
+:Original: Documentation/vm/overcommit-accounting.rst
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
+超量使用审计
+==============
+
+Linux内核支持下列超量使用处理模式
+
+0
+	启发式超量使用处理。拒绝明显的地址空间超量使用。用于一个典型的系统。
+	它确保严重的疯狂分配失败，同时允许超量使用以减少swap的使用。在这种模式下，
+	允许root分配稍多的内存。这是默认的。
+1
+	总是超量使用。适用于一些科学应用。经典的例子是使用稀疏数组的代码，只是依赖
+	几乎完全由零页组成的虚拟内存
+
+2
+	不超量使用。系统提交的总地址空间不允许超过swap+一个可配置的物理RAM的数量
+	（默认为50%）。根据你使用的数量，在大多数情况下，这意味着一个进程在访问页面时
+	不会被杀死，但会在内存分配上收到相应的错误。
+
+	对于那些想保证他们的内存分配在未来可用而又不需要初始化每一个页面的应用程序来说
+	是很有用的。
+
+超量使用策略是通过sysctl  `vm.overcommit_memory` 设置的。
+
+可以通过 `vm.overcommit_ratio` （百分比）或 `vm.overcommit_kbytes` （绝对值）
+来设置超限数量。这些只有在 `vm.overcommit_memory` 被设置为2时才有效果。
+
+在 ``/proc/meminfo`` 中可以分别以CommitLimit和Committed_AS的形式查看当前
+的超量使用和提交量。
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
+超量使用是基于以下规则
+
+对于文件映射
+	| SHARED or READ-only	-	0 cost (该文件是映射而不是交换)
+	| PRIVATE WRITABLE	-	每个实例的映射大小
+
+对于匿名或者 ``/dev/zero`` 映射
+	| SHARED			-	映射的大小
+	| PRIVATE READ-only	-	0 cost (但作用不大)
+	| PRIVATE WRITABLE	-	每个实例的映射大小
+
+额外的计数
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
+*	ptrace 页计数（这很难）。
-- 
2.27.0

