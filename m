Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E86315777
	for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 06:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763533444; cv=none; b=X+JBmUUAZfk5KDZV1yog7+6CtctMQaq6uD1R1bJlE5BA1l76pH4oddQN8qkG56Tb1a7N5SO46KCX8qyEQ+Nszj9uQkVAbTdhNjQ1o/SXZwp0V4WPk05fP+VvFM3hb8u/oDsYx9+u5VnR9iDlF8sQ2P0i4ZD5ioMy8dZy9fMx+P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763533444; c=relaxed/simple;
	bh=8UJkSXBHt/Bpt4IcYPR3yfOjACRnlnE1YrAChLikYSY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=R1riKiz704DzDTqmvdy+wu6asVTOr4EdM8USe5LV8vT95imfjwyG6b6gPXuYnLEt1QV02t7PFRQDs1oIRZg7ZRUwpnbdo/WX2wgbESEbmxJrqsyfwq7JIdcSqedsn6Fe3aaZWy3fBpGFmzplbzt+3Upg9YVTFHRq7qgct/ExF2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jjM2euPg; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jjM2euPg"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-29516a36affso77148215ad.3
        for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 22:24:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763533442; x=1764138242; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=5QeZxKjzFMmQXxkgs+pg+gMUlc3U8fT7h313iH8Thm8=;
        b=jjM2euPgnOtk78vORKsHpFWi4dR6ior5HCwlq+7UK6h3akfkhN5vbnAM4Y7BaucoI+
         HbX0Coh20WpllJm02NVz3p9t8QPo7RKFmudUJD4+Z9h2T59e9qppfJiT2Cr3U3dGyA02
         FqSWcp+eU3Yw0dKcULbjIIl20Nr4Ed6kDhXS52tXv1rfO1y5Enu2C7Zk7KOcLllS/6hG
         v/sZJxZqfHvHeVHX8LrFFtDEhyL/0D3zcA8LpPi+PnHE0VPdm63hCkYI3yXjifRN9sju
         QPFHnqb2wlWJXF7wZ4P68499UaIwm8GqUTm0xOYBHV5sFHAa79oe3A4E7yaZ+Dwaartd
         BNXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763533442; x=1764138242;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5QeZxKjzFMmQXxkgs+pg+gMUlc3U8fT7h313iH8Thm8=;
        b=eKBQofyC+skRmCPFc2F2zKsNmiT7R6NRRxa5rYQMXC1PbR1lEPaPnkb8vNfaSLM97L
         pZLb+OEJtylbNT7kM5gqAP7rau6r3ygX8HhmRoXafRnQqx+VnQVptb07RNJqipASs0+a
         xJsB7QGVm06XZ1G8EB6ONxdEfSp0AYAg7SEPfl5gv+3GIRq/CDtWGVb3IwWkEJtxrdzR
         bRmwouPnK/3JXtVrRRQQWAR4AhA6WwnQ9B39xJ0NclBETfNT9R5ssUUoMd0u1f7QJEyv
         oT+pgYVxC9TPdxeOn+OzeJX+F/5lQNIx24viOosSYPeUdig0eUeRjBgKgXU+Y2fT44VS
         ISvw==
X-Forwarded-Encrypted: i=1; AJvYcCW/b8uMxLUAXc1NRAt4guJgDYMeB8WO32solmRSpPAcUD8yL8Z2eqWpU7CnU3Gzph1be4Bj8J4X2kI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuJzJk/aKCWwRDtEOyaJ3etl2O5YdxgWsWe8QMph779ovtEJkZ
	MGCTJ3FtOGsI5ZTUukMoq1/PcM6ekxG1VcFfQnbroWQaDuS5EufHroLeYmU3lw==
X-Gm-Gg: ASbGncvYn2xjxP2Nz/O9KwyeeSa+ODD8CNydDgH0ZaSRRiuIAn3JCplZqOU0846idEa
	vcvjTNbYOdpuxA+5IO/AKXr7DQQbwep37p3gVYFD8Ncm46w/TvwRFc+uh9Vhi1WtDw/Cw7lBw4i
	sWP+JsvM3nS6iNptFlpiczbKwHw8wqbN1o1ssOKwLg3cObw6u9oD5xmAakR4J/5YredIvtJvyYh
	O/rqnDd8WLTxtw6IGObGGPU9d9QW2YnyMvQa2VKVWQBIZj9dOI936vMmy+2gE+IGKYmgLCgRG+l
	PMzJsiLUGS5C6uX4auBHCRvRp1PeRvRSK5csRzMyEuQEMepboc6cqZXGMna4S/BJb/AJoiy0zuL
	b2j5cg/NbWsvQlwOuCQBsld5J7LWjMsr+/N9hoEaGD+RT26AWXiBGUClhzvEUoPrj2QobFANcdc
	7Kiwwf0juhIXDcRH/m
X-Google-Smtp-Source: AGHT+IGNIuudTtun/NKqD9KEi5rCwUr6jFRNgsRTqw4qCLlprUmKnFU/9mq4Q+BrqzN6NtuFGjCMhw==
X-Received: by 2002:a17:903:2448:b0:295:560a:e474 with SMTP id d9443c01a7336-2986a72c309mr198629625ad.32.1763533441655;
        Tue, 18 Nov 2025 22:24:01 -0800 (PST)
Received: from localhost ([46.232.121.212])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2bebe1sm191411335ad.82.2025.11.18.22.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 22:24:00 -0800 (PST)
From: Frank Cen <focksor@gmail.com>
To: Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Jonathan Corbet <corbet@lwn.net>,
	Frank Cen <focksor@gmail.com>,
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4] docs/zh_CN: Add trace debugging Chinese translation
Date: Wed, 19 Nov 2025 14:22:42 +0800
Message-ID: <20251119062300.596150-1-focksor@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Translate .../trace/debugging.rst into Chinese.

Update the translation through commit c44a14f216f4
("tracing: Enforce the persistent ring buffer to be page aligned")

Signed-off-by: Frank Cen <focksor@gmail.com>
---
 .../translations/zh_CN/trace/debugging.rst    | 132 ++++++++++++++++++
 1 file changed, 132 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/trace/debugging.rst

diff --git a/Documentation/translations/zh_CN/trace/debugging.rst b/Documentation/translations/zh_CN/trace/debugging.rst
new file mode 100644
index 000000000000..dc0006622659
--- /dev/null
+++ b/Documentation/translations/zh_CN/trace/debugging.rst
@@ -0,0 +1,132 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+:Original: Documentation/trace/debugging.rst
+:翻译:
+
+ 岑发亮 Frank Cen <focksor@gmail.com>
+
+==================
+使用追踪器进行调试
+==================
+
+Copyright 2024 Google LLC.
+
+:Author:   Steven Rostedt <rostedt@goodmis.org>
+:License:  The GNU Free Documentation License, Version 1.2
+          (dual licensed under the GPL v2)
+
+- Written for: 6.12
+
+引言
+----
+跟踪框架对于调试 Linux 内核非常有用。本文记录了使用追踪器进行调试的各种方法。
+
+首先，确保已经挂载了 tracefs 文件系统::
+
+ $ sudo mount -t tracefs tracefs /sys/kernel/tracing
+
+
+使用 trace_printk()
+-------------------
+
+trace_printk() 是一个非常轻量级的工具，可以在内核中除 "noinstr" 部分外的任何上下文使用。
+它可以在正常、软中断、硬中断甚至 NMI 上下文中使用。
+跟踪数据以无锁的方式写入到环形缓冲区 (tracing ring buffer) 中。
+为了使其更轻量，当可能时，它会只记录格式字符串的指针，并将原始参数保存到缓冲区中。格式和参数
+将在读取环形缓冲区时再进行处理。这样，格式化处理就不会在热路径（即记录追踪的地方）中完成。
+
+trace_printk() 只用于调试，绝不应添加到内核的子系统中。如果需要调试跟踪，请添加跟踪事件。
+如果在内核中发现 trace_printk()，则 dmesg 中会出现以下内容::
+
+  **********************************************************
+  **   NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE   **
+  **                                                      **
+  ** trace_printk() being used. Allocating extra memory.  **
+  **                                                      **
+  ** This means that this is a DEBUG kernel and it is     **
+  ** unsafe for production use.                           **
+  **                                                      **
+  ** If you see this message and you are not debugging    **
+  ** the kernel, report this immediately to your vendor!  **
+  **                                                      **
+  **   NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE   **
+  **********************************************************
+
+
+调试内核崩溃
+------------
+有多种方法可以在内核崩溃时获取系统状态。你可以通过 printk 中的 oops 消息来实现，也可以使用
+kexec/kdump。但是这些方法只能显示崩溃时的情况，而如果能够知道在崩溃发生之前发生了什么则非常
+有帮助。tracing ring buffer 默认情况下是一个循环缓冲区，它会用较新的事件覆盖较旧的事件。
+当崩溃发生时，ring buffer 的内容会是导致崩溃的所有事件。
+
+在进行调试时，有一些内核命令行参数非常有用。第一个参数是 ftrace_dump_on_oops，当系统发生
+oops 时，它会将 tracing ring buffer 的内容输出到控制台。如果控制台的这些输出能够被记录
+下来那将会非常有帮助。但是如果你使用的是串口控制台，建议将环形缓冲区设得相对较小一些，否则可能
+需要几分钟甚至数小时才能完成环形缓冲区的转储工作。下面是一个内核命令行示例::
+
+  ftrace_dump_on_oops trace_buf_size=50K
+
+注意，tracing buffer 由每个 CPU 的缓冲区组成，每个缓冲区又被划分为默认大小为 PAGE_SIZE
+的子缓冲区。上面的 trace_buf_size 选项将每个 CPU 的缓冲区设置为 50K，因此在一台有 8 个
+CPU 的机器上，实际上缓冲区总大小是 400K。
+
+跨重启的持久缓冲区
+------------------
+如果系统内存允许，可以在内存中的特定位置指定 tracing ring buffer。如果该位置在重启时保持
+不变且内存数据未被修改，则该可以在下一次启动后读取该环形缓冲区。有如下两种方法为缓冲区保留内存。
+
+相对更可靠的方法（在 x86 上）是先使用 memmap 内核命令行选项来保留内存，然后将该内存指定用于
+trace_instance。这需要对系统的物理内存布局有一定的了解。使用这种方法的优点是环形缓冲区的内存
+位置将始终保持不变::
+
+  memmap==12M$0x284500000 trace_instance=boot_map@0x284500000:12M
+
+如上参数中，memmap 选项在物理内存地址 0x284500000 处保留了 12 兆字节的内存。而紧随其后的
+trace_instance 选项将在同一位置创建一个名为 "boot_map" 的 trace instance（跟踪实例），
+这个实例使用与保留的内存相同的大小。由于环形缓冲区要被划分为每个 CPU 的缓冲区，因此这 12MB
+内存将被均匀地分配给所有 CPU。如果你有 8 个 CPU，那么每个 CPU 的环形缓冲区大小将是 1.5MB。
+注意这其中还要包括元数据，因此环形缓冲区实际可使用的内存还会稍微小一些。
+
+另一种更通用但没那么可靠的在启动时分配环形缓冲区映射的方法是使用 reserve_mem 选项::
+
+  reserve_mem=12M:4096:trace trace_instance=boot_map@trace
+
+上面的 reserve_mem 会在启动时寻找 12MB 按 4096 字节对齐的可用内存。这块内存会被标记为
+"trace" 以供后续的命令行选项使用。
+
+trace_instance 选项创建了一个名为 "boot_map" 的跟踪实例，并将使用由 reserve_mem 预留
+并标记为 "trace" 的内存。这种方法更通用，但不那么可靠。由于 KASLR（内核地址空间布局随机化）
+机制的存在，reserve_mem 保留的内存位置可能会有所不同。当这种情况发生时，环形缓冲区将不会是
+在上次启动时写入的内容，并且整个缓冲区将会被重置。
+
+有时我们可以通过指定更大的对齐字节的方式来防止 KASLR 改变 reserve_mem 预留内存的位置。
+通过这个方法，你可能会发现缓冲区的位置会更一致::
+
+  reserve_mem=12M:0x2000000:trace trace_instance=boot_map@trace
+
+在启动时，为环形缓冲区保留的内存将会经过校验。系统会通过一系列测试以确保缓冲区内包含有效数据。
+如果测试通过，该环形缓冲区会被设置为可被实例读取；如果测试未通过，则其会被清空并重新初始化。
+
+这块内存的布局在不同的内核版本可能也会不同，因此只有相同的内核版本才能保证其工作正常。在不同
+的内核版本之间切换时，可能会由于内存布局不同而导致缓冲区被标记为非法。
+
+注意：映射的地址和大小都必须符合架构的页面对齐要求。
+
+在启动阶段使用 trace_printk()
+-----------------------------
+默认情况下， trace_printk() 的内容会进入 top level tracing instance（顶级跟踪实例）。
+但这个实例在重启时不会被保留。为了让 trace_printk() 的内容以及一些其它的内部 tracing
+能够进入被保留的缓冲区（例如 dump stacks），你可以在内核命令行中为 trace_printk() 指定
+目标实例，或者在启动后通过 trace_printk_dest 选项进行设置。
+
+启动后::
+
+  echo 1 > /sys/kernel/tracing/instances/boot_map/options/trace_printk_dest
+
+在内核命令行设置::
+
+  reserve_mem=12M:4096:trace trace_instance=boot_map^traceprintk^traceoff@trace
+
+如果在内核命令行中设置，建议同时使用 "traceoff" 标志来禁用追踪，并在启动后再重新启用追踪。
+否则，最近一次启动的追踪信息将与上一次启动的追踪信息会混在一起，可能会变得难以阅读。
-- 
2.43.0

