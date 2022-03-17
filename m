Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26BD1C433EF
	for <linux-doc@archiver.kernel.org>; Thu, 17 Mar 2022 06:51:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230017AbiCQGwS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 17 Mar 2022 02:52:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229968AbiCQGwP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 17 Mar 2022 02:52:15 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A950BED9E1
        for <linux-doc@vger.kernel.org>; Wed, 16 Mar 2022 23:50:56 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id m22so4140189pja.0
        for <linux-doc@vger.kernel.org>; Wed, 16 Mar 2022 23:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LCdsZjK3KmRJ4asGxrz/giLx/XCKlKBFq8o3C2rS7H4=;
        b=bejrfurg9x6OwsZ3aS/kZhamLD1xFydp+HFVKW6y8c6SGPWz9VPHB11GYmlBFZxx8o
         kxn2B9Evus3smMLiCUh7LTfx3IbIjJKWfU9DyXr6ZzmC+xjrZ8+viazAtAONE+N33hFp
         kVjIxUvHU84L3Qbfh3QPNbJNz9hukyzEPCr6wfWuKPjWWLxk3wvJWmByOLidymqCDthC
         NlDD2Zp/XBgVb5xXrukdmAYpUDRNxC1DcuVt45gnujBHLvbMgS6R9SF7GwS0XIaaPj6P
         +VgXJkr+BOq9msTswaq2ir4eZX201wAP0lKCDXDTQFcgDLQtA4NwSScAVFjnXN7U6ymO
         2nkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LCdsZjK3KmRJ4asGxrz/giLx/XCKlKBFq8o3C2rS7H4=;
        b=ZeqcH6XB4p+yz8mmA8LvD0ZpwmO/EB2KhdQ4mWvq8RTV2PK/w07LJzTlA5nbygPsCl
         5dE58RDetSffPG7wsnWKf0awBhTNGGvDsHYkAIvH3x0t1FoSwZ75Hxcqqsp3sYZ9eTDH
         QQzboutggknfcrSk/yqjqVsUshINj08URqKRyvb7XFZ+JhysWDNdYlCGxobNLA2/cJeR
         rtYjjrMW6g9RHDge0wnx4XsNpsSeQBo7csaC4o7w/BLx04HR5LUUgWaV1DhEUBliOymI
         KaP6b+sIl1vMG7vE4Jj4f3WenukVR8+hFwpf2znaEOsSHP0ju1fYpUDqGM5x8VF9DdDT
         NTvg==
X-Gm-Message-State: AOAM532asL6if2abbLAirlU8dXhoNExTj9wVI2zh+LzXkOl0ofJRoq37
        eNjlQpo1CTlyBQ9R1+Nl4ho=
X-Google-Smtp-Source: ABdhPJyo9Qu07Da3SrVdDSAdIlYjZKdcK0wJ6ZQpzQgmiNyqp2pembyIni/ZTnkBsUTNcrnwm37eAg==
X-Received: by 2002:a17:902:f544:b0:153:bb8a:9374 with SMTP id h4-20020a170902f54400b00153bb8a9374mr3227610plf.154.1647499855925;
        Wed, 16 Mar 2022 23:50:55 -0700 (PDT)
Received: from localhost.localdomain (pcd454078.netvigator.com. [203.218.244.78])
        by smtp.gmail.com with ESMTPSA id k15-20020a63ab4f000000b00381eef69bfbsm3622152pgp.3.2022.03.16.23.50.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Mar 2022 23:50:55 -0700 (PDT)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng01@gmail.com>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v2 02/12] docs/zh_CN: add vm hwpoison translation
Date:   Thu, 17 Mar 2022 14:50:43 +0800
Message-Id: <7d058da0157fc439cd646b5201abb7b0cecfc339.1647498763.git.siyanteng@loongson.cn>
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

Translate .../vm/hwpoison.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../translations/zh_CN/vm/hwpoison.rst        | 166 ++++++++++++++++++
 Documentation/translations/zh_CN/vm/index.rst |   2 +-
 2 files changed, 167 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/vm/hwpoison.rst

diff --git a/Documentation/translations/zh_CN/vm/hwpoison.rst b/Documentation/translations/zh_CN/vm/hwpoison.rst
new file mode 100644
index 000000000000..1d0ce1ad5aab
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
+这个补丁包在虚拟机中"实现了必要的(编程)框架。
+
+引用概述中的评论::
+
+	高层次的机器检查处理程序。处理被硬件报告为损坏的页面，通常是由于2位ECC内存或
+	高速缓存故障。
+
+	这主要是针对在后台检测到的损坏的页面。当当前的CPU试图访问它时，当前运行的进程
+	可以直接被杀死。因为还没有访问损坏的页面, 如果错误由于某种原因不能被处理，就可
+	以安全地忽略它. 而不是用另外一个机器检查去处理它。
+
+	处理不同状态的页面缓存页。这里棘手的部分是，相对于其他虚拟机用户， 我们可以异
+	步访问任何页面。因为内存故障可能随时随地发生，可能违反了他们的一些假设。这就是
+	为什么这段代码必须非常小心。一般来说，它试图使用正常的锁定规则，如获得标准锁，
+	即使这意味着错误处理可能需要很长的时间。
+
+	这里的一些操作有点低效，并且具有非线性的算法复杂性，因为数据结构没有针对这种情
+	况进行优化。特别是从vma到进程的映射就是这种情况。由于这种情况预计是罕见的，我
+	们希望我们可以摆脱这种情况。
+
+该代码由mm/memory-failure.c中的高级处理程序、一个新的页面poison 位和虚拟机中的
+各种检查组成，用来处理poison 的页面。
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
+	(可以在全局和每个进程中控制) 一旦检测到错误，立即向应用程序发送SIGBUS 这允许
+	应用程序以温和的方式处理内存错误（例如，放弃受影响的对象） 这是KVM qemu使用的
+	模式。
+
+推迟处理
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
+	免在测试套件中损坏非预期页面。
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

