Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA342C433F5
	for <linux-doc@archiver.kernel.org>; Sat,  5 Mar 2022 16:24:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232021AbiCEQZm (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 5 Mar 2022 11:25:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229864AbiCEQZk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 5 Mar 2022 11:25:40 -0500
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 060ED1DA466
        for <linux-doc@vger.kernel.org>; Sat,  5 Mar 2022 08:24:49 -0800 (PST)
Received: by mail-pf1-x42f.google.com with SMTP id j1so6183894pfj.5
        for <linux-doc@vger.kernel.org>; Sat, 05 Mar 2022 08:24:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HwSPQntLfxszXRkurUvrEyLYmAXZMbHnv1TVlTtHd40=;
        b=Ef1leReDIxtUnF2HcFeoGi1cDBzkdbCa0Q18e236OO7jABk2aGwLBrUCPEuBuxfqxM
         mArSz5yFowh9y1wIrlyYhpJlWRE8/oh/llwIiKs82aW8HgppTOIPco+meNSgzPetf3IN
         5E9xOY/yQEw3P5d7hs3iJMX46iC7FQ0uflZD1HzOaScBc3ZWtPKtIG4yolqTtHxkavQy
         nxQIkYBqEcDiR02WuzplG2sQqZwZirw3y5mb4IFTJ2Adrb3ni3eErDYY/+cc1xMT/qmM
         drkNa4/FDD9w7INa+KRvz9lM8yD77He/B+2Lshcc8goVlx+34hoF9D714og8X9x9pYNi
         cQ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HwSPQntLfxszXRkurUvrEyLYmAXZMbHnv1TVlTtHd40=;
        b=MtlmG5VS8ZjBeg22c9z0/M47zugi4H0prC2VlRz33hjmoMLYGEaMYUvjeLkat1RF0Y
         q1XGhRJYwUq4AmVXhkwPXjlYPz2jc2dIXV4owCupVgIsAqfpIjIUJltLxLEbB/gc9M1T
         +2vsinPS5k3yVejPnOoO7cOVhEqaTv+4ElgEu+UZDAfGhNPvdHjgJVGH1RCNfYcbZd5H
         6YTJVsj0D2ztd5vjldFuhBXhep6vjfbxHgTEcXPtaCfaGczZcBB4lyr5It3rZ/fUPQPI
         /eDdDyyS5SINZfpLFKp+9xStNPcrSQVt3lq12+8w75FjNZgOp2k8cl4GN7fDXkpjPOvy
         XGAw==
X-Gm-Message-State: AOAM533v9HZCsfjBnR91xTd2DP0Kj6zqMgTK7qOk5LHGCLKxbNE9P7ld
        2BT/LJ31oYzVg5hA86TecGA=
X-Google-Smtp-Source: ABdhPJx/odOlFxH34FnOldhL+sK/6f1as2SsjP5C7AFmaKmJ2JsryYmk93iWxvv1xRc6//gdRNREng==
X-Received: by 2002:a63:f14b:0:b0:374:7b9e:dc8f with SMTP id o11-20020a63f14b000000b003747b9edc8fmr3210380pgk.357.1646497489350;
        Sat, 05 Mar 2022 08:24:49 -0800 (PST)
Received: from localhost.localdomain (42-200-190-71.static.imsbiz.com. [42.200.190.71])
        by smtp.gmail.com with ESMTPSA id x7-20020a17090a1f8700b001bf1db72189sm6106269pja.23.2022.03.05.08.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Mar 2022 08:24:49 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: [PATCH 02/12] docs/zh_CN: add vm hwpoison translation
Date:   Sun,  6 Mar 2022 00:26:02 +0800
Message-Id: <e3bf0689a815a73665e57fe46ea81259ff08e660.1646496448.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1646496448.git.siyanteng@loongson.cn>
References: <cover.1646496448.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate .../vm/hwpoison.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../translations/zh_CN/vm/hwpoison.rst        | 166 ++++++++++++++++++
 Documentation/translations/zh_CN/vm/index.rst |   2 +-
 2 files changed, 167 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/vm/hwpoison.rst

diff --git a/Documentation/translations/zh_CN/vm/hwpoison.rst b/Documentation/translations/zh_CN/vm/hwpoison.rst
new file mode 100644
index 000000000000..7c4477c33e56
--- /dev/null
+++ b/Documentation/translations/zh_CN/vm/hwpoison.rst
@@ -0,0 +1,166 @@
+
+:Original: Documentation/vm/hwpoison.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
+
+:校译:
+
+
+========
+hwpoison
+========
+
+什么是hwpoison?
+===============
+
+
+即将推出的英特尔CPU支持从一些内存错误中恢复（ ``MCA恢复`` ）。这需要操作系统宣布
+一个页面"poisoned"，杀死与之相关的进程，并避免在未来使用它。
+
+这个补丁包在虚拟机中实现了必要的基础设施。
+
+引用概述中的评论::
+
+	高水平的机器检查处理程序。处理被硬件报告为损坏的页面，通常是由于2位ECC内存或
+	高速缓存故障。
+
+	这主要是针对在后台检测到的损坏的页面。当当前的CPU试图访问它时，当前运行的进程
+	可以直接被杀死。这意味着，如果错误由于某种原因不能被处理，就可以安全地忽略它，
+	因为还没有访问损坏的页面。相反，当这种情况发生时，另一个机器检查将出现。
+
+	处理不同状态的页面缓存页。这里棘手的部分是，我们可以异步访问任何页面给其他虚拟
+	机用户，因为内存故障可能随时随地发生，可能违反了他们的一些假设。这就是为什么这
+	段代码必须非常小心。一般来说，它试图使用正常的锁定规则，如获得标准锁，即使这意
+	味着错误处理可能需要很长的时间。
+
+	这里的一些操作有点低效，并且具有非线性的算法复杂性，因为数据结构没有针对这种情
+	况进行优化。特别是从vma到进程的映射就是这种情况。由于这种情况预计是罕见的，我
+	们希望我们可以摆脱这种情况。
+
+该代码由mm/memory-failure.c中的高级处理程序、一个新的页面poison 位和虚拟机中的
+各种检查组成，用来处理poison 的页面。
+
+现在的主要针对的是KVM客户机，但它适用于所有类型的应用程序。支持KVM需要最近的qemu-kvm
+版本。
+
+对于KVM的使用，需要一个新的信号类型，这样KVM就可以用适当的地址将机器检查注入到客户
+机中。这在理论上也允许其他应用程序处理内存故障。我们的期望是，几乎所有的应用程序都不
+会这样做，但一些非常专业的应用程序可能会这样做。
+
+故障恢复模式
+============
+
+有两种（实际上是三种）模式的内存故障恢复可以在。
+
+vm.memory_failure_recovery sysctl 置零:
+	所有的内存故障都会导致panic。请不要尝试恢复。
+
+early kill
+	(可以在全局和每个进程中控制) 一旦检测到错误，立即向应用程序发送SIGBUS 这允许
+	应用程序以温和的方式处理内存错误（例如，放弃受影响的对象） 这是KVM qemu使用的
+	模式。
+
+late kill
+	当应用程序运行到损坏的页面时，发送SIGBUS。这对不知道内存错误的应用程序来说是
+	最好的，默认情况下注意一些页面总是被当作 late kill处理。
+
+用户控制
+========
+
+vm.memory_failure_recovery
+	参阅 sysctl.txt
+
+vm.memory_failure_early_kill
+	全局启用early kill
+
+PR_MCE_KILL
+	设置early/late kill mode/revert 到系统默认值。
+
+	arg1: PR_MCE_KILL_CLEAR:
+		恢复到系统默认值
+	arg1: PR_MCE_KILL_SET:
+		arg2定义了线程特定模式
+
+		PR_MCE_KILL_EARLY:
+			Early kill
+		PR_MCE_KILL_LATE:
+			Late kill
+		PR_MCE_KILL_DEFAULT
+			使用系统全局默认值
+
+	注意，如果你想有一个专门的线程代表进程处理SIGBUS(BUS_MCEERR_AO)，你应该在
+	指定线程上调用prctl(PR_MCE_KILL_EARLY)。否则，SIGBUS将被发送到主线程。
+
+PR_MCE_KILL_GET
+	返回当前模式
+
+测试
+====
+
+* madvise(MADV_HWPOISON, ....) (as root) - 在测试过程中Poison一个页面
+
+* 通过debugfs ``/sys/kernel/debug/hwpoison/`` hwpoison-inject模块
+
+  corrupt-pfn
+	在PFN处注入hwpoison故障，并echoed到这个文件。这做了一些早期过滤，以避
+	免在测试套件中损坏的非预期页面。
+  unpoison-pfn
+	在PFN的Software-unpoison 页面呼应到这个文件。这样，一个页面可以再次被
+	复用。这只对Linux注入的故障起作用，对真正的内存故障不起作用。
+
+  注意这些注入接口并不稳定，可能会在不同的内核版本中发生变化
+
+  corrupt-filter-dev-major, corrupt-filter-dev-minor
+	只处理与块设备major/minor定义的文件系统相关的页面的内存故障。-1U是通
+	配符值。这应该只用于人工注入的测试。
+
+  corrupt-filter-memcg
+	限制注入到memgroup拥有的页面。由memcg的inode号指定。
+
+	Example::
+
+		mkdir /sys/fs/cgroup/mem/hwpoison
+
+	        usemem -m 100 -s 1000 &
+		echo `jobs -p` > /sys/fs/cgroup/mem/hwpoison/tasks
+
+		memcg_ino=$(ls -id /sys/fs/cgroup/mem/hwpoison | cut -f1 -d' ')
+		echo $memcg_ino > /debug/hwpoison/corrupt-filter-memcg
+
+		page-types -p `pidof init`   --hwpoison  # shall do nothing
+		page-types -p `pidof usemem` --hwpoison  # poison its pages
+
+  corrupt-filter-flags-mask, corrupt-filter-flags-value
+	当指定时，只有在((page_flags & mask) == value)的情况下才会poison页面。
+	这允许对许多种类的页面进行压力测试。page_flags与/proc/kpageflags中的相
+	同。这些标志位在include/linux/kernel-page-flags.h中定义，并在
+	Documentation/admin-guide/mm/pagemap.rst中记录。
+
+* 架构特定的MCE注入器
+
+  x86 有 mce-inject, mce-test
+
+  在mce-test中的一些便携式hwpoison测试程序，见下文。
+
+引用
+====
+
+http://halobates.de/mce-lc09-2.pdf
+	09年LinuxCon的概述演讲
+
+git://git.kernel.org/pub/scm/utils/cpu/mce/mce-test.git
+	测试套件（在tsrc中的hwpoison特定可移植测试）。
+
+git://git.kernel.org/pub/scm/utils/cpu/mce/mce-inject.git
+	x86特定的注入器
+
+
+限制
+====
+- 不是所有的页面类型都被支持，而且永远不会。大多数内核内部对象不能被恢
+  复，目前只有LRU页。
+
+---
+Andi Kleen, 2009年10月
diff --git a/Documentation/translations/zh_CN/vm/index.rst b/Documentation/translations/zh_CN/vm/index.rst
index cc8d68b0cbb5..dd0b3d4c0ab8 100644
--- a/Documentation/translations/zh_CN/vm/index.rst
+++ b/Documentation/translations/zh_CN/vm/index.rst
@@ -27,12 +27,12 @@ TODO:待引用文档集被翻译完毕后请及时修改此处）
    free_page_reporting
    highmem
    frontswap
+   hwpoison
 
 TODOLIST:
 * arch_pgtable_helpers
 * free_page_reporting
 * hmm
-* hwpoison
 * hugetlbfs_reserv
 * memory-model
 * mmu_notifier
-- 
2.27.0

