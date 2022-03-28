Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 249DAC433F5
	for <linux-doc@archiver.kernel.org>; Mon, 28 Mar 2022 09:59:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240112AbiC1KAt (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 28 Mar 2022 06:00:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240080AbiC1KAs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 28 Mar 2022 06:00:48 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 554363617E
        for <linux-doc@vger.kernel.org>; Mon, 28 Mar 2022 02:59:08 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id h19so11133132pfv.1
        for <linux-doc@vger.kernel.org>; Mon, 28 Mar 2022 02:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wLVoUoHsB4mS82rIeV9UzFmyWizJd58nb2gpW7PD4Vo=;
        b=gX6/xENxDnV/D17PE1JgCBj3Z8G83AV8eZ2PhAYj1906oiB63Bh4jh12/Q9byNoZQ7
         N3i4y4dm5q5/go/f3EdKUMx+BiBLON6dcGjvsmuqrN7ile2qv9J9tczcDwr7WwXwgnmL
         PXZ3Ap9ka2t9KSiCziK9wVFUrGfPU0ErytpU0q0eO7F6ztsywAcJRTQ3UyIS7mFPOTU9
         NcDHZAeWytjaeYs4XiqTht69N8258M4RLxJ2kvdCjITys+voVL3Ww9vAB5unVbe/APeA
         MCK/zOURKoa7KHQy6XWv3jCRe8Sj1XrdjOk11O27No3N1A/ELHjE4OHJQde73FaIIbFq
         w+yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wLVoUoHsB4mS82rIeV9UzFmyWizJd58nb2gpW7PD4Vo=;
        b=CppEhoIaELd1WovnOGcCqVoOwwQTSas83Gzvfut75eTIvvahuI+r7PVJrxCAbPUzD+
         E9qeecFxsjhD6timzhxDFZPTr3pv1c97NU0pGF5fjR6eBdl6vnCRCoOomxp5IlwmK2EE
         mS3NoRrZI6dFV7wVPcOePC9AnJSgW45XKRwFHPDlkHLXRESYGQwFtD4uHv4tGhnG/S8e
         yDxso3dy0AxwsGaRLLuAzKSrZ0L+brDGD+EOwxLMfXMx1sQrcoXw7yelDDo8LNuhMbZQ
         K/LEivDguZRKMnDU3L9ELEVVSwK5orOPOYen5hi5BQ7L9xjQZRKwRCUnANxiPYQvo9sT
         t9sw==
X-Gm-Message-State: AOAM5332iM6aDjKAhaswDq7a/+gCxQK6NS1lQKp9glZmJl0zUGpiaZ85
        yxbwtEgk6xGwuwSzP6zyxMg=
X-Google-Smtp-Source: ABdhPJwHaIiYBgIgBGRsxDyVm5n6Aq28vfV1pVjw5/WLCg+dj6Nao9Sj5M0ZMXuYa9MIhgH1fwYzyA==
X-Received: by 2002:a05:6a00:1a89:b0:4fa:b21d:2cd with SMTP id e9-20020a056a001a8900b004fab21d02cdmr22721767pfv.62.1648461547743;
        Mon, 28 Mar 2022 02:59:07 -0700 (PDT)
Received: from localhost.localdomain (111-250-2-155.dynamic-ip.hinet.net. [111.250.2.155])
        by smtp.gmail.com with ESMTPSA id 8-20020a17090a174800b001c7d8b160f0sm10526637pjm.51.2022.03.28.02.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Mar 2022 02:59:07 -0700 (PDT)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng01@gmail.com>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v3 07/12] docs/zh_CN: add vm page_owner translation
Date:   Mon, 28 Mar 2022 17:59:49 +0800
Message-Id: <ffd15c2537c7c3855c2b263bbc0ba75e97a0cd70.1648458742.git.siyanteng@loongson.cn>
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

Translate .../vm/page_owner.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Reviewed-by: Alex Shi <alexs@kernel.org>
---
 Documentation/translations/zh_CN/vm/index.rst |   2 +-
 .../translations/zh_CN/vm/page_owner.rst      | 116 ++++++++++++++++++
 2 files changed, 117 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/vm/page_owner.rst

diff --git a/Documentation/translations/zh_CN/vm/index.rst b/Documentation/translations/zh_CN/vm/index.rst
index f478032cd477..aa983d023045 100644
--- a/Documentation/translations/zh_CN/vm/index.rst
+++ b/Documentation/translations/zh_CN/vm/index.rst
@@ -33,6 +33,7 @@ TODO:待引用文档集被翻译完毕后请及时修改此处）
    mmu_notifier
    overcommit-accounting
    page_frags
+   page_owner
 
 TODOLIST:
 * arch_pgtable_helpers
@@ -41,7 +42,6 @@ TODOLIST:
 * hugetlbfs_reserv
 * numa
 * page_migration
-* page_owner
 * page_table_check
 * remap_file_pages
 * slub
diff --git a/Documentation/translations/zh_CN/vm/page_owner.rst b/Documentation/translations/zh_CN/vm/page_owner.rst
new file mode 100644
index 000000000000..9e951fabba9d
--- /dev/null
+++ b/Documentation/translations/zh_CN/vm/page_owner.rst
@@ -0,0 +1,116 @@
+:Original: Documentation/vm/page_owner.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
+
+:校译:
+
+
+================================
+page owner: 跟踪谁分配的每个页面
+================================
+
+概述
+====
+
+page owner是用来追踪谁分配的每一个页面。它可以用来调试内存泄漏或找到内存占用者。
+当分配发生时，有关分配的信息，如调用堆栈和页面的顺序被存储到每个页面的特定存储中。
+当我们需要了解所有页面的状态时，我们可以获得并分析这些信息。
+
+尽管我们已经有了追踪页面分配/释放的tracepoint，但用它来分析谁分配的每个页面是
+相当复杂的。我们需要扩大跟踪缓冲区，以防止在用户空间程序启动前出现重叠。而且，启
+动的程序会不断地将跟踪缓冲区转出，供以后分析，这将会改变系统的行为，会产生更多的
+可能性，而不是仅仅保留在内存中，所以不利于调试。
+
+页面所有者也可以用于各种目的。例如，可以通过每个页面的gfp标志信息获得精确的碎片
+统计。如果启用了page owner，它就已经实现并激活了。我们非常欢迎其他用途。
+
+page owner在默认情况下是禁用的。所以，如果你想使用它，你需要在你的启动cmdline
+中加入"page_owner=on"。如果内核是用page owner构建的，并且由于没有启用启动
+选项而在运行时禁用page owner，那么运行时的开销是很小的。如果在运行时禁用，它不
+需要内存来存储所有者信息，所以没有运行时内存开销。而且，页面所有者在页面分配器的
+热路径中只插入了两个不可能的分支，如果不启用，那么分配就会像没有页面所有者的内核
+一样进行。这两个不可能的分支应该不会影响到分配的性能，特别是在静态键跳转标签修补
+功能可用的情况下。以下是由于这个功能而导致的内核代码大小的变化。
+
+- 没有page owner::
+
+   text    data     bss     dec     hex filename
+   48392   2333     644   51369    c8a9 mm/page_alloc.o
+
+- 有page owner::
+
+   text    data     bss     dec     hex filename
+   48800   2445     644   51889    cab1 mm/page_alloc.o
+   6662     108      29    6799    1a8f mm/page_owner.o
+   1025       8       8    1041     411 mm/page_ext.o
+
+虽然总共增加了8KB的代码，但page_alloc.o增加了520字节，其中不到一半是在hotpath
+中。构建带有page owner的内核，并在需要时打开它，将是调试内核内存问题的最佳选择。
+
+有一个问题是由实现细节引起的。页所有者将信息存储到struct page扩展的内存中。这
+个内存的初始化时间比稀疏内存系统中的页面分配器启动的时间要晚一些，所以，在初始化
+之前，许多页面可以被分配，但它们没有所有者信息。为了解决这个问题，这些早期分配的
+页面在初始化阶段被调查并标记为分配。虽然这并不意味着它们有正确的所有者信息，但至
+少，我们可以更准确地判断该页是否被分配。在2GB内存的x86-64虚拟机上，有13343
+个早期分配的页面被捕捉和标记，尽管它们大部分是由结构页扩展功能分配的。总之，在这
+之后，没有任何页面处于未追踪状态。
+
+使用方法
+========
+
+1) 构建用户空间的帮助::
+
+	cd tools/vm
+	make page_owner_sort
+
+2) 启用page owner: 添加 "page_owner=on" 到 boot cmdline.
+
+3) 做你想调试的工作。
+
+4) 分析来自页面所有者的信息::
+
+	cat /sys/kernel/debug/page_owner > page_owner_full.txt
+	./page_owner_sort page_owner_full.txt sorted_page_owner.txt
+
+   ``page_owner_full.txt`` 的一般输出情况如下(输出信息无翻译价值)::
+
+	Page allocated via order XXX, ...
+	PFN XXX ...
+	// Detailed stack
+
+	Page allocated via order XXX, ...
+	PFN XXX ...
+	// Detailed stack
+
+   ``page_owner_sort`` 工具忽略了 ``PFN`` 行，将剩余的行放在buf中，使用regexp提
+   取页序值，计算buf的次数和页数，最后根据参数进行排序。
+
+   在 ``sorted_page_owner.txt`` 中可以看到关于谁分配了每个页面的结果。一般输出::
+
+	XXX times, XXX pages:
+	Page allocated via order XXX, ...
+	// Detailed stack
+
+   默认情况下， ``page_owner_sort`` 是根据buf的时间来排序的。如果你想
+   按buf的页数排序，请使用-m参数。详细的参数是:
+
+   基本函数:
+
+	Sort:
+		-a		按内存分配时间排序
+		-m		按总内存排序
+		-p		按pid排序。
+		-P		按tgid排序。
+		-r		按内存释放时间排序。
+		-s		按堆栈跟踪排序。
+		-t		按时间排序（默认）。
+
+   其它函数:
+
+	Cull:
+		-c		通过比较堆栈跟踪而不是总块来进行剔除。
+
+	Filter:
+		-f		过滤掉内存已被释放的块的信息。
-- 
2.27.0

