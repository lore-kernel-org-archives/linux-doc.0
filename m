Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C80A7C433F5
	for <linux-doc@archiver.kernel.org>; Thu, 25 Nov 2021 13:02:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354962AbhKYNFx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 25 Nov 2021 08:05:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355042AbhKYNDw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 25 Nov 2021 08:03:52 -0500
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4988C0613ED
        for <linux-doc@vger.kernel.org>; Thu, 25 Nov 2021 04:55:22 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id p18-20020a17090ad31200b001a78bb52876so7714210pju.3
        for <linux-doc@vger.kernel.org>; Thu, 25 Nov 2021 04:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FxKwfnzQcdKO0dEUmjwAM1VIuYY5Y6raLPFHajqVQtE=;
        b=ByjfbnYVMrBS4FFR/ycudNtH0qNWyhiCFoqp24gW7iJR9C+a4NoSpBXcvvUSlUmp6D
         RcVvhqbyC8dxqUEXZfPElYrZvnBZjIjHmannvDRhZFGYsKu2O/oymW1hcConElZ7bYZ1
         ei93CxLLbDlT8e5/Bei0Li4zVc1MxVrtHsh9I+AJf2mYD4AI2MLHE9nOa8yJGku78+ZA
         RbsF8xj+7+FyvgME/2hzNdNaWPExS/btbyLELapJ/TjRjY77FTUkqtEczwbJy9JPPADk
         185NpdJcwVV8WcRV8ceAdKE3qXINT2ASB7Tws1CPW36fdaYXhfa0JI2tK7+aYKBcxr0m
         8aHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FxKwfnzQcdKO0dEUmjwAM1VIuYY5Y6raLPFHajqVQtE=;
        b=Zg/nokRheatiZtziIZlTGQPveBdRHsNu+lIbm4FrKcOZLhjWHItgZSrisASM4G3Hwh
         GKz5NQ9T0yuJFN91Z2MUM0/tluHvouX0W0lgRGVIvrSqZ3htGlEkbLrpoko4jWz59uvK
         r4MYaJuhjkcRvXEfOJkgJ1Q0JKOFcy93Ygh9DWA1epqGiwm9HBBc9NejPMgI6XbMETnR
         Cwg2FhTY0kToWJJAsdMydqWtFfnO8HgsvanY0JnVP8UlisudovggeIG7+tgoDdMX94JZ
         eApqSWvy5VN1DghK3J2VqqBpN3HDJ0qSmHnlLlSZqyiviNdDeY0lZGZ8bPx4cWtHdMNZ
         Sl+w==
X-Gm-Message-State: AOAM5311I+gxPlbU2mkXTB3aR1gUmwYyGL4ALptoM9g1nBVWTC8pOhut
        2XpnvXx2Na9AqTrTnNaTSz4=
X-Google-Smtp-Source: ABdhPJyIY+tilpJSc/Yfk5JSqhRILCvmSl07TAhxl3WGXJTcoB6Dy+HiRZc3z5SrmzE7Q3ujbrtISA==
X-Received: by 2002:a17:90b:20d:: with SMTP id fy13mr6738774pjb.47.1637844922046;
        Thu, 25 Nov 2021 04:55:22 -0800 (PST)
Received: from localhost.localdomain ([8.26.182.90])
        by smtp.gmail.com with ESMTPSA id d7sm3694923pfj.91.2021.11.25.04.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 04:55:21 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com, kolyshkin@gmail.com,
        changhuaixin@linux.alibaba.com
Subject: [PATCH 1/3] docs/zh_CN: add scheduler sched-arch translation
Date:   Thu, 25 Nov 2021 20:54:03 +0800
Message-Id: <228f332fb205e4091afab840457f652111742cdf.1637843107.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1637843107.git.siyanteng@loongson.cn>
References: <cover.1637843107.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

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

