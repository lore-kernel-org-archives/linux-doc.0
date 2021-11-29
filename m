Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56826C433F5
	for <linux-doc@archiver.kernel.org>; Mon, 29 Nov 2021 03:04:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242559AbhK2DIM (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 28 Nov 2021 22:08:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244829AbhK2DGL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 28 Nov 2021 22:06:11 -0500
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42BD4C06175A
        for <linux-doc@vger.kernel.org>; Sun, 28 Nov 2021 19:01:42 -0800 (PST)
Received: by mail-pf1-x431.google.com with SMTP id x131so15256409pfc.12
        for <linux-doc@vger.kernel.org>; Sun, 28 Nov 2021 19:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zL2ulOJ65MyJYnIW0fWvJ/p3E9AOIPyCFtyEbbAkCqQ=;
        b=nAeEDuWhfLsRtR+CnqOTv19kQmKgj+7C3U7MbNrciHA2mhTJnq+T7KfO/f38P/AzEC
         Hlbh+VrManGSIxI/YDxacukAQKweebfDYzZAKZ81QBRkgxQwAjC4vV2KtQnmSVrazBH8
         lLKS82rxiY/yzI3SppeisF6syoOGQX7TmMXHVe92TJj6YTu9WHxb06UHxozwaCzJx5Pp
         +M8dAqHMwW2YxHF5FwAujHKYbTTvUdJNFmEYT50w5qYb2ZRTbys0vNp4yURYJzQtvpsu
         3tpaSNpBL8hQJ+6AnGQ/2vX8xwWoViLFUW/G6wcGgTUQ6pbRI3QSHdbr25tuKvyaaSEr
         c3RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zL2ulOJ65MyJYnIW0fWvJ/p3E9AOIPyCFtyEbbAkCqQ=;
        b=W7NZqy+SEw54YX3BGW1ykw5ZlMRj5Fq4fw4Q52m8S9/GPdrJ62vauLLH8ekLLXw8gz
         KqFsmJD5bpVtkifWbyiumBiCwl2OOR6G5605XKuMmRzrzdL3CheVFTtie3/myGoxgBMD
         wmOj5AaC4dfzfyNg2cjn1NS8wLMoJTPICPRXhvgcJyjXtQgHiIRsxU4r0WNZeimdjUUR
         hJB9Qv1eZ8rShoUnQKhO6+YHZ+kZ9NPGUbOWbh4lGcWhEhFySTuS1muAdJi7uxQmxfpz
         dEAfSNO+GWhnV+EhqqZ8ucTw17sxBlNucfIHIzIUc/TW8HFLtgngQK95PnYlxysSsgmV
         /2cg==
X-Gm-Message-State: AOAM530zGJBHS7kDvcyBbKebcZRsID7I26CRE+CwFjVANvzz4V9hBbVS
        Lm89yJ4LIw+zHumtODwSJFM=
X-Google-Smtp-Source: ABdhPJzaJ6XcVRrcUF0rGeak2yUXxilR77+NGM2l0bsEGkOf8fyY1gGipEhRpU8auoQgOTa6QORS3Q==
X-Received: by 2002:a63:8ac1:: with SMTP id y184mr30155915pgd.48.1638154901723;
        Sun, 28 Nov 2021 19:01:41 -0800 (PST)
Received: from localhost.localdomain ([8.26.182.90])
        by smtp.gmail.com with ESMTPSA id y23sm10066271pgf.86.2021.11.28.19.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 19:01:41 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng01@gmail.com>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, kolyshkin@gmail.com,
        changhuaixin@linux.alibaba.com, Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v2 1/3] docs/zh_CN: add scheduler sched-arch translation
Date:   Mon, 29 Nov 2021 11:00:21 +0800
Message-Id: <7a05bec2756bb4bf3843945166fa2d913677459c.1638154485.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1638154485.git.siyanteng@loongson.cn>
References: <cover.1638154485.git.siyanteng@loongson.cn>
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
 .../zh_CN/scheduler/sched-arch.rst            | 78 +++++++++++++++++++
 2 files changed, 79 insertions(+), 1 deletion(-)
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
index 000000000000..0e02e7b5c9df
--- /dev/null
+++ b/Documentation/translations/zh_CN/scheduler/sched-arch.rst
@@ -0,0 +1,78 @@
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
+.. _cn_scheduler_sched-arch.rst:
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

