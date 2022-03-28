Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D0D8C433EF
	for <linux-doc@archiver.kernel.org>; Mon, 28 Mar 2022 09:58:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238866AbiC1KAd (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 28 Mar 2022 06:00:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238452AbiC1KAd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 28 Mar 2022 06:00:33 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8DFD2E6AB
        for <linux-doc@vger.kernel.org>; Mon, 28 Mar 2022 02:58:52 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id k14so11889024pga.0
        for <linux-doc@vger.kernel.org>; Mon, 28 Mar 2022 02:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0coquMDLrQc24ZzTIrfgrMEG4fd6k8TZrcclpqmJN4Y=;
        b=qVOTobRRQXUwqQFGaT/c2zaTowpXLL+06RZAAhOMhNFlN8Eal9jV4uqkiADEIZqm4D
         h4DWUegBAmEwEBByF2TfZheSkwFiqQNKa9TM1gR0X8vts+fcmpS5XBu06LDNAuAOUDVK
         0tuvf3GuCk7chTZOcsVuS1Fvqd4n13tSnMoksxqsYrF1Fe6OxuhF4Yf9poQu4qtrOYi6
         Z5gEhAt4uLTYosBO4IWrlIS+pq6s40NpTEg16X1WTAqopAI2wK2RBJlpsYcOjEDWBAqU
         H7gveU9BvOCB2ZHJbI1UebAbUnkTlQCJYHtz231DCrgXn/SB2pcXOpve7VRP2GrKEGkA
         /QJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0coquMDLrQc24ZzTIrfgrMEG4fd6k8TZrcclpqmJN4Y=;
        b=6z6YSF/W+Eq3ABk3srIU/tFD67Bf9DcrgRT8/rmsD0vQOnCtvUJcUWa4kiIl1Wuf44
         XP/gK44JgiqAybPVSy41t8NexWVZZLsLuTDtMsMGQLFWzpFpZVA/QGpYnrr3VsYQHVbA
         eI5m58I7A7AFtH9S2yveCL6P+dkLJsm47cFKvtV2ThC8wTKA55sxZWSsibskNe9uWgrf
         tkMpg7Jj3rFI9T/Chgmh7aIo6Dokj27h1vPgHKImpTr+J4Ltg5BWLif/9sqnxw72aCGz
         TUo89NRqEm2XDL7xTYolqI4WBM/uE1JExQeYNthmBimxwVVMquFNDv+HWRvaX07FanFO
         wtHQ==
X-Gm-Message-State: AOAM5322YpIywIhlvmFlieC6GNaPg/E+sgMdVxe6If0EChhHAim/fevB
        zc9fHxPzp9FnoypjKXrMIok=
X-Google-Smtp-Source: ABdhPJyzIz79YIhvwQnpPQAMoKYMaOhHg84TbaA49BFNwpcIUXsIzOvOi88HneMzDk+d+Vg/IWuwWg==
X-Received: by 2002:a05:6a00:2354:b0:4fa:f195:b0c9 with SMTP id j20-20020a056a00235400b004faf195b0c9mr19987594pfj.33.1648461532059;
        Mon, 28 Mar 2022 02:58:52 -0700 (PDT)
Received: from localhost.localdomain (111-250-2-155.dynamic-ip.hinet.net. [111.250.2.155])
        by smtp.gmail.com with ESMTPSA id 8-20020a17090a174800b001c7d8b160f0sm10526637pjm.51.2022.03.28.02.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Mar 2022 02:58:51 -0700 (PDT)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng01@gmail.com>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v3 02/12] docs/zh_CN: add vm hwpoison translation
Date:   Mon, 28 Mar 2022 17:59:44 +0800
Message-Id: <41853e4068a2f6c6de37bd23708b8b154cd17716.1648458742.git.siyanteng@loongson.cn>
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

Translate .../vm/hwpoison.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../translations/zh_CN/vm/hwpoison.rst        | 166 ++++++++++++++++++
 Documentation/translations/zh_CN/vm/index.rst |   2 +-
 2 files changed, 167 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/vm/hwpoison.rst

diff --git a/Documentation/translations/zh_CN/vm/hwpoison.rst b/Documentation/translations/zh_CN/vm/hwpoison.rst
new file mode 100644
index 000000000000..c6e1e7bdb05b
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
+这个补丁包在虚拟机中实现了必要的(编程)框架。
+
+引用概述中的评论::
+
+	高级机器的检查与处理。处理方法是损坏的页面被硬件报告，通常是由于2位ECC内
+	存或高速缓存故障。
+
+	这主要是针对在后台检测到的损坏的页面。当当前的CPU试图访问它时，当前运行的进程
+	可以直接被杀死。因为还没有访问损坏的页面, 如果错误由于某种原因不能被处理，就可
+	以安全地忽略它. 而不是用另外一个机器检查去处理它。
+
+	处理不同状态的页面缓存页。这里棘手的部分是，相对于其他虚拟内存用户， 我们可以异
+	步访问任何页面。因为内存故障可能随时随地发生，可能违反了他们的一些假设。这就是
+	为什么这段代码必须非常小心。一般来说，它试图使用正常的锁规则，如获得标准锁，即使
+	这意味着错误处理可能需要很长的时间。
+
+	这里的一些操作有点低效，并且具有非线性的算法复杂性，因为数据结构没有针对这种情
+	况进行优化。特别是从vma到进程的映射就是这种情况。由于这种情况大概率是罕见的，所
+	以我们希望我们可以摆脱这种情况。
+
+该代码由mm/memory-failure.c中的高级处理程序、一个新的页面poison位和虚拟机中的
+各种检查组成，用来处理poison的页面。
+
+现在主要目标是KVM客户机，但它适用于所有类型的应用程序。支持KVM需要最近的qemu-kvm
+版本。
+
+对于KVM的使用，需要一个新的信号类型，这样KVM就可以用适当的地址将机器检查注入到客户
+机中。这在理论上也允许其他应用程序处理内存故障。我们的期望是，所有的应用程序都不要这
+样做，但一些非常专业的应用程序可能会这样做。
+
+故障恢复模式
+============
+
+有两种（实际上是三种）模式的内存故障恢复可以在。
+
+vm.memory_failure_recovery sysctl 置零:
+	所有的内存故障都会导致panic。请不要尝试恢复。
+
+早期处理
+	(可以在全局和每个进程中控制) 一旦检测到错误，立即向应用程序发送SIGBUS这允许
+	应用程序以温和的方式处理内存错误（例如，放弃受影响的对象） 这是KVM qemu使用的
+	模式。
+
+推迟处理
+	当应用程序运行到损坏的页面时，发送SIGBUS。这对不知道内存错误的应用程序来说是
+	最好的，默认情况下注意一些页面总是被当作late kill处理。
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
+	免在测试套件中损坏非预期页面。
+  unpoison-pfn
+	在PFN的Software-unpoison页面对应到这个文件。这样，一个页面可以再次被
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
index a78060a0c2ed..c5b3d5ba21f1 100644
--- a/Documentation/translations/zh_CN/vm/index.rst
+++ b/Documentation/translations/zh_CN/vm/index.rst
@@ -28,12 +28,12 @@ TODO:待引用文档集被翻译完毕后请及时修改此处）
    highmem
    ksm
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

