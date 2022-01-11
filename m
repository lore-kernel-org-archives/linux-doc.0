Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3A13C433EF
	for <linux-doc@archiver.kernel.org>; Tue, 11 Jan 2022 02:15:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345971AbiAKCPj (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 10 Jan 2022 21:15:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346228AbiAKCPh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 10 Jan 2022 21:15:37 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBC44C06173F
        for <linux-doc@vger.kernel.org>; Mon, 10 Jan 2022 18:15:36 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id rj2-20020a17090b3e8200b001b1944bad25so3142204pjb.5
        for <linux-doc@vger.kernel.org>; Mon, 10 Jan 2022 18:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zCBr6mHu+Pv5QzgMYP/6eG/gWgK4BhTK9CMihMgiMVE=;
        b=MN66PAzQfuuzrkoIktVI9j6KWgcxQ0mgSWIrjma7fuEKUVQjkq350Jsv3J1n+FkYz0
         SVpuBwgInU31V9Zc9Ib755rPWR2ZitDzOpofR5p8IfOcb0u6uH6gpP0g39jy0TgDwzWa
         pZp51z4l5oFYT2TywV3uTVcqhuYnf9DCmGJYExYUhc6eIiocNiqdtdwxo2CWMZ/eOEv7
         VWb3IcbMT004yGNb5z7CaeNOKpvD19SnzQJ6dwLIdWV+maRPYVpfqhJGpGgxq/LHtUgr
         XASIfyNsqCzBfYLuRlFyCYdDj6Y8JruGTOw4MiNGBXo1TBK3F9m3bLRpb4YJgXWhC+kQ
         YJ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zCBr6mHu+Pv5QzgMYP/6eG/gWgK4BhTK9CMihMgiMVE=;
        b=E4ZzL64rv2cbyg2KUCj0sCKkRt1F4mnL4+fY0AF87wN2pJgNqpIDznHVJIftSAV0GS
         N5wrYhPQlPsPon0pbtGBhby+gsMG4V+7OgsyTz638gLcUoG08mK9f0Oa9h11OztVP8o1
         bjMt4lu2v6ghZl82CibW7XYAw00LPZxZ7VByn7ShAnQn/o78cIIqLxYkAv3sMEJu7Yqs
         VN27USpZNljesQbFvqPXONHQg9bC25CsxCkiPIQOrcoG8ajEUKkGzxiv2kvj5BiuLPij
         04vmlTjcdLcipiabFNuVGyCWx2X9sECND+/RGgSgZDTM7W9lAYq1EcWeN+FOsfgZ81sW
         O1QQ==
X-Gm-Message-State: AOAM531R6kOg6WelpFmw/MbnGDbT3RBK8oSeDINE/6cOSTC+9ViIRWq5
        tYb5ZahOXZcQ2YvMfvgpUY8=
X-Google-Smtp-Source: ABdhPJw8fKfiv2C/NYp89memDy8sueSy0PGhxZBPPpM5V5djs5pUGIcXWjdUZiThl/9PxZx7AEMNEQ==
X-Received: by 2002:aa7:94a5:0:b0:4bd:fd4:82b8 with SMTP id a5-20020aa794a5000000b004bd0fd482b8mr2435904pfl.47.1641867336254;
        Mon, 10 Jan 2022 18:15:36 -0800 (PST)
Received: from wironout4.netvigator.com (pcd454075.netvigator.com. [203.218.244.75])
        by smtp.gmail.com with ESMTPSA id k3sm308914pjt.39.2022.01.10.18.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jan 2022 18:15:35 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng01@gmail.com>, tangyizhou@huawei.com,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v3 2/3] docs_zh_CN: add active_mm translation
Date:   Tue, 11 Jan 2022 10:13:15 +0800
Message-Id: <99ba014bdd9550bad57db6c21653cb7314d7c2d8.1641866889.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1641866889.git.siyanteng@loongson.cn>
References: <cover.1641866889.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Yanteng Si <siyanteng01@gmail.com>

Translatr .../vm/active_mm.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Reviewed-by: Alex Shi <alexs@kernel.org>
Reviewed-by: Tang Yizhou <tangyizhou@huawei.com>
---
 .../translations/zh_CN/vm/active_mm.rst       | 85 +++++++++++++++++++
 Documentation/translations/zh_CN/vm/index.rst |  2 +-
 2 files changed, 86 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/vm/active_mm.rst

diff --git a/Documentation/translations/zh_CN/vm/active_mm.rst b/Documentation/translations/zh_CN/vm/active_mm.rst
new file mode 100644
index 000000000000..366609ea4f37
--- /dev/null
+++ b/Documentation/translations/zh_CN/vm/active_mm.rst
@@ -0,0 +1,85 @@
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/vm/active_mm.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
+
+:校译:
+
+
+=========
+Active MM
+=========
+
+这是一封linux之父回复开发者的一封邮件，所以翻译时我尽量保持邮件格式的完整。
+
+::
+
+ List:       linux-kernel
+ Subject:    Re: active_mm
+ From:       Linus Torvalds <torvalds () transmeta ! com>
+ Date:       1999-07-30 21:36:24
+
+ 因为我并不经常写解释，所以已经抄送到linux-kernel邮件列表，而当我做这些，
+ 且更多的人在阅读它们时，我觉得棒极了。
+
+ 1999年7月30日 星期五， David Mosberger 写道：
+ >
+ > 是否有一个简短的描述，说明task_struct中的
+ >  "mm" 和 "active_mm"应该如何使用？ (如果
+ > 这个问题在邮件列表中讨论过，我表示歉意--我刚
+ > 刚度假回来，有一段时间没能关注linux-kernel了）。
+
+ 基本上，新的设定是：
+
+  - 我们有“真实地址空间”和“匿名地址空间”。区别在于，匿名地址空间根本不关心用
+    户级页表，所以当我们做上下文切换到匿名地址空间时，我们只是让以前的地址空间
+    处于活动状态。
+
+    一个“匿名地址空间”的明显用途是任何不需要任何用户映射的线程--所有的内核线
+    程基本上都属于这一类，但即使是“真正的”线程也可以暂时说在一定时间内它们不
+    会对用户空间感兴趣，调度器不妨试着避免在切换VM状态上浪费时间。目前只有老
+    式的bdflush sync能做到这一点。
+
+  - “tsk->mm” 指向 “真实地址空间”。对于一个匿名进程来说，tsk->mm将是NULL，
+    其逻辑原因是匿名进程实际上根本就 “没有” 真正的地址空间。
+
+  - 然而，我们显然需要跟踪我们为这样的匿名用户“偷用”了哪个地址空间。为此，我们
+    有 “tsk->active_mm”，它显示了当前活动的地址空间是什么。
+
+    规则是，对于一个有真实地址空间的进程（即tsk->mm是 non-NULL），active_mm
+    显然必须与真实的mm相同。
+
+    对于一个匿名进程，tsk->mm == NULL，而tsk->active_mm是匿名进程运行时
+    “借用”的mm。当匿名进程被调度走时，借用的地址空间被返回并清除。
+
+ 为了支持所有这些，“struct mm_struct”现在有两个计数器：一个是 “mm_users”
+ 计数器，即有多少 “真正的地址空间用户”，另一个是 “mm_count”计数器，即 “lazy”
+ 用户（即匿名用户）的数量，如果有任何真正的用户，则加1。
+
+ 通常情况下，至少有一个真正的用户，但也可能是真正的用户在另一个CPU上退出，而
+ 一个lazy的用户仍在活动，所以你实际上得到的情况是，你有一个地址空间 **只**
+ 被lazy的用户使用。这通常是一个短暂的生命周期状态，因为一旦这个线程被安排给一
+ 个真正的线程，这个 “僵尸” mm就会被释放，因为 “mm_count”变成了零。
+
+ 另外，一个新的规则是，**没有人** 再把 “init_mm” 作为一个真正的MM了。
+ “init_mm”应该被认为只是一个 “没有其他上下文时的lazy上下文”，事实上，它主
+ 要是在启动时使用，当时还没有真正的VM被创建。因此，用来检查的代码
+
+   if (current->mm == &init_mm)
+
+ 一般来说，应该用
+
+   if (!current->mm)
+
+ 取代上面的写法（这更有意义--测试基本上是 “我们是否有一个用户环境”，并且通常
+ 由缺页异常处理程序和类似的东西来完成）。
+
+ 总之，我刚才在ftp.kernel.org上放了一个pre-patch-2.3.13-1，因为它稍微改
+ 变了接口以适配alpha（谁会想到呢，但alpha体系结构上下文切换代码实际上最终是
+ 最丑陋的之一--不像其他架构的MM和寄存器状态是分开的，alpha的PALcode将两者
+ 连接起来，你需要同时切换两者）。
+
+ (文档来源 http://marc.info/?l=linux-kernel&m=93337278602211&w=2)
diff --git a/Documentation/translations/zh_CN/vm/index.rst b/Documentation/translations/zh_CN/vm/index.rst
index 0fda40c602ac..5fcdb75d8682 100644
--- a/Documentation/translations/zh_CN/vm/index.rst
+++ b/Documentation/translations/zh_CN/vm/index.rst
@@ -21,9 +21,9 @@ TODO:待引用文档集被翻译完毕后请及时修改此处）
 .. toctree::
    :maxdepth: 1
 
+   active_mm
 
 TODOLIST:
-* active_mm
 * arch_pgtable_helpers
 * balance
 * damon/index
-- 
2.27.0

