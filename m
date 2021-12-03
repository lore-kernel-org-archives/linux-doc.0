Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E0E1C433EF
	for <linux-doc@archiver.kernel.org>; Fri,  3 Dec 2021 08:04:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379106AbhLCIIK (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 3 Dec 2021 03:08:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351084AbhLCIIK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 3 Dec 2021 03:08:10 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1221DC06173E
        for <linux-doc@vger.kernel.org>; Fri,  3 Dec 2021 00:04:47 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id w33-20020a17090a6ba400b001a722a06212so4743178pjj.0
        for <linux-doc@vger.kernel.org>; Fri, 03 Dec 2021 00:04:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1jLmweAzpQW9FKjGfNFGCZKq/lqUW0boe3svwzV33I0=;
        b=quy+gTMsmt1JI6UIr05TYO5CjIDYu0i5kRqwtIx4biw4u+B/1U2cLZGBbhzVN6AWV5
         eCJ4U4vZQL8B4jXZYmW3NdqiQdgnmcTQE7KELHnAl28gVW/XmedL2+rdICq0Rer7cXUW
         l2Jz6e2AFBn4+f4Kd7xWNhHSA7XomaLtP/NuQ/Ja67RqgLS2vV7n382yvH7fakZWZkXE
         OldaxQpCVIBCnjKb94pcVKuZ4Y83q7Yj5lH4W3Nz+12b979KZ5RScPBTmR9qr63dbZWE
         fUny453K1I6rglfocsc1njFn/BJqklLIuqjqzZTDlWJrBAgTj8z14Yb2uc+2JqbNZsaU
         iHfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1jLmweAzpQW9FKjGfNFGCZKq/lqUW0boe3svwzV33I0=;
        b=BFGe5TlPVyINiDB+sd2V2i6OCNH6/VjdKMUBuv3B/rjGXT3wKpKgz8JCUjudmtD+ZW
         NVVP8ZPcAz2bXSqlgbFuNYS1RH5SyF7VvqmLCiiC+JzCwVtfIyxt6NyLEZTZtQBn+igu
         wpV3DSQWtp1B9BDC2c8PiQTOiXUXLsXKGuZMBDvoRXAUWdPjh32mWts+DxFumQgrdFDO
         rCopPxFC+IhNVud6B/1UXNui88Zf6uKChyqpQuHG/MJI5HfBCzV3CJYbGyfnKOw0631l
         Ywnn0p8aLeZaABaiuyOZSxGDdfrZyBZPFOLB1xxjha1/kP/135O+iGnkWCQB/ZLeHVHE
         YJZQ==
X-Gm-Message-State: AOAM530iQ39DzD++59xfovPsWaD5o2gcAnXGO9wl1MybQfAba7zCWR32
        ZtWpAuoR0HtoJmBcxAwZKbM=
X-Google-Smtp-Source: ABdhPJxmckopRplIFlVM2f87WBkkTC4SwejkI5rUVqHdzxT9DR/aima8GNzg0YQxTF6bn12aNvD22w==
X-Received: by 2002:a17:90b:314c:: with SMTP id ip12mr12373956pjb.162.1638518686492;
        Fri, 03 Dec 2021 00:04:46 -0800 (PST)
Received: from localhost.localdomain ([8.26.182.175])
        by smtp.gmail.com with ESMTPSA id h6sm2543332pfh.82.2021.12.03.00.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Dec 2021 00:04:46 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng01@gmail.com>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, kolyshkin@gmail.com,
        changhuaixin@linux.alibaba.com, Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v3 1/3] docs/zh_CN: add scheduler sched-arch translation
Date:   Fri,  3 Dec 2021 16:03:20 +0800
Message-Id: <f9e66ba8920bc1bb3f1d67044f64712fa30db7c9.1638517064.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1638517064.git.siyanteng@loongson.cn>
References: <cover.1638517064.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Yanteng Si <siyanteng01@gmail.com>

Translate .../scheduler/sched-arch.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../translations/zh_CN/scheduler/index.rst    |  2 +-
 .../zh_CN/scheduler/sched-arch.rst            | 76 +++++++++++++++++++
 2 files changed, 77 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/scheduler/sched-arch.rst

diff --git a/Documentation/translations/zh_CN/scheduler/index.rst b/Documentation/translations/zh_CN/scheduler/index.rst
index 5ec71e6043ae..797df3a9c66f 100644
--- a/Documentation/translations/zh_CN/scheduler/index.rst
+++ b/Documentation/translations/zh_CN/scheduler/index.rst
@@ -20,11 +20,11 @@ Linux调度器
     :maxdepth: 1
 
     completion
+    sched-arch
 
 
 TODOList:
 
-    sched-arch
     sched-bwc
     sched-deadline
     sched-design-CFS
diff --git a/Documentation/translations/zh_CN/scheduler/sched-arch.rst b/Documentation/translations/zh_CN/scheduler/sched-arch.rst
new file mode 100644
index 000000000000..754a15c6b60f
--- /dev/null
+++ b/Documentation/translations/zh_CN/scheduler/sched-arch.rst
@@ -0,0 +1,76 @@
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/scheduler/sched-arch.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
+
+:校译:
+
+
+
+===============================
+架构特定代码的CPU调度器实现提示
+===============================
+
+	Nick Piggin, 2005
+
+上下文切换
+==========
+1. 运行队列锁
+默认情况下，switch_to arch函数在调用时锁定了运行队列。这通常不是一个问题，除非
+switch_to可能需要获取运行队列锁。这通常是由于上下文切换中的唤醒操作造成的。见
+arch/ia64/include/asm/switch_to.h的例子。
+
+为了要求调度器在运行队列解锁的情况下调用switch_to，你必须在头文件
+中`#define __ARCH_WANT_UNLOCKED_CTXSW`(通常是定义switch_to的那个文件）。
+
+在CONFIG_SMP的情况下，解锁的上下文切换对核心调度器的实现只带来了非常小的性能损
+失。
+
+CPU空转
+=======
+你的cpu_idle程序需要遵守以下规则：
+
+1. 现在抢占应该在空闲的例程上禁用。应该只在调用schedule()时启用，然后再禁用。
+
+2. need_resched/TIF_NEED_RESCHED 只会被设置，并且在运行任务调用 schedule()
+   之前永远不会被清除。空闲线程只需要查询need_resched，并且永远不会设置或清除它。
+
+3. 当cpu_idle发现（need_resched() == 'true'），它应该调用schedule()。否则
+   它不应该调用schedule()。
+
+4. 在检查need_resched时，唯一需要禁用中断的情况是，我们要让处理器休眠到下一个中
+   断（这并不对need_resched提供任何保护，它可以防止丢失一个中断）:
+
+	4a. 这种睡眠类型的常见问题似乎是::
+
+	        local_irq_disable();
+	        if (!need_resched()) {
+	                local_irq_enable();
+	                *** resched interrupt arrives here ***
+	                __asm__("sleep until next interrupt");
+	        }
+
+5. 当need_resched变为高电平时，TIF_POLLING_NRFLAG可以由不需要中断来唤醒它们
+   的空闲程序设置。换句话说，它们必须定期轮询need_resched，尽管做一些后台工作或
+   进入低CPU优先级可能是合理的。
+
+      - 5a. 如果TIF_POLLING_NRFLAG被设置，而我们确实决定进入一个中断睡眠，那
+            么需要清除它，然后发出一个内存屏障（接着测试need_resched，禁用中断，如3中解释）。
+
+arch/x86/kernel/process.c有轮询和睡眠空闲函数的例子。
+
+
+可能出现的arch/问题
+===================
+
+我发现的可能的arch问题（并试图解决或没有解决）。:
+
+ia64 - safe_halt的调用与中断相比，是否很荒谬？ (它睡眠了吗) (参考 #4a)
+
+sh64 - 睡眠与中断相比，是否很荒谬？ (参考 #4a)
+
+sparc - 在这一点上，IRQ是开着的（？），把local_irq_save改为_disable。
+      - 待办事项: 需要第二个CPU来禁用抢占 (参考 #1)
-- 
2.27.0

