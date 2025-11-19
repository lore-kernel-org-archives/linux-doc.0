Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB4C313297
	for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 07:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763536418; cv=none; b=DcJzhFn8zODH5huBke20Jjmu8HiwdVXwjpixM9YHiVFkibbHPiVPoA51qlDTO05Wq/XMYTQEoXzlKQOxdNe3TUIvFpqSiz2uxEsrGrr3a7lrjkMTLqstyHzLvAnRBhCjBOvrhvIXSm35TEohoWuiISecuMJW0zpxInhaDRP+drw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763536418; c=relaxed/simple;
	bh=NUnDgPybvgNXzeSLFQzQvrjiOfD8km93TwoyRmz7LhQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=lbT9MTxm3V83WYMerAlR7I5ocWdneVHIE4goKf9oZh8KErFTSgzXlqf24U9Ek9/PxnGQCXGWCChvlQTrZwkEwccF/wbQ1aRi6pHu17qxMprz09VrJCMQshmZRPXF9236htPgMoxG2m40XIQBSCKhm2qa4tiCMbJMErybl0nLN0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=uNvdrnXZ; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="uNvdrnXZ"
Message-ID: <2c0f4bbc-a9ab-4811-ab4c-355139f80076@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1763536411;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5PdwMOysLsZGo2jg+551j+QJoGmC6ayx2b8df/pVTCo=;
	b=uNvdrnXZWWp6BQm1J/3CouJIhWOwToIx2oZRvumTevBCBCY/4eGM4NwhOBzxtzz8nvF+KG
	M1XTEVusKgqow/+C7zNozk4pQ6fdkV1AYfOQQ6p1ms0/B3mUR7zDPs4KwFAnn07LoL+jB8
	zspJL/jYeD2wx1GiQXDAQPuzUMFw7LE=
Date: Wed, 19 Nov 2025 15:13:25 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v4] docs/zh_CN: Add trace debugging Chinese translation
To: Frank Cen <focksor@gmail.com>, Alex Shi <alexs@kernel.org>,
 Dongliang Mu <dzm91@hust.edu.cn>, Jonathan Corbet <corbet@lwn.net>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20251119062300.596150-1-focksor@gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <20251119062300.596150-1-focksor@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


在 2025/11/19 14:22, Frank Cen 写道:
> Translate .../trace/debugging.rst into Chinese.
>
> Update the translation through commit c44a14f216f4
> ("tracing: Enforce the persistent ring buffer to be page aligned")
>
> Signed-off-by: Frank Cen <focksor@gmail.com>
> ---
>   .../translations/zh_CN/trace/debugging.rst    | 132 ++++++++++++++++++
>   1 file changed, 132 insertions(+)
>   create mode 100644 Documentation/translations/zh_CN/trace/debugging.rst
>
> diff --git a/Documentation/translations/zh_CN/trace/debugging.rst b/Documentation/translations/zh_CN/trace/debugging.rst
> new file mode 100644
> index 000000000000..dc0006622659
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/trace/debugging.rst
> @@ -0,0 +1,132 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. include:: ../disclaimer-zh_CN.rst
> +:Original: Documentation/trace/debugging.rst
> +:翻译:
> +
> + 岑发亮 Frank Cen <focksor@gmail.com>
> +
> +==================
> +使用追踪器进行调试
> +==================
> +
> +Copyright 2024 Google LLC.
> +
> +:Author:   Steven Rostedt <rostedt@goodmis.org>
> +:License:  The GNU Free Documentation License, Version 1.2
> +          (dual licensed under the GPL v2)
> +
> +- Written for: 6.12
> +
> +引言
> +----
> +跟踪框架对于调试 Linux 内核非常有用。本文记录了使用追踪器进行调试的各种方法。
> +
> +首先，确保已经挂载了 tracefs 文件系统::
> +
> + $ sudo mount -t tracefs tracefs /sys/kernel/tracing
> +
> +
> +使用 trace_printk()
> +-------------------
> +
> +trace_printk() 是一个非常轻量级的工具，可以在内核中除 "noinstr" 部分外的任何上下文使用。
> +它可以在正常、软中断、硬中断甚至 NMI 上下文中使用。
> +跟踪数据以无锁的方式写入到环形缓冲区 (tracing ring buffer) 中。
> +为了使其更轻量，当可能时，它会只记录格式字符串的指针，并将原始参数保存到缓冲区中。格式和参数
> +将在读取环形缓冲区时再进行处理。这样，格式化处理就不会在热路径（即记录追踪的地方）中完成。
> +
> +trace_printk() 只用于调试，绝不应添加到内核的子系统中。如果需要调试跟踪，请添加跟踪事件。
> +如果在内核中发现 trace_printk()，则 dmesg 中会出现以下内容::
> +
> +  **********************************************************
> +  **   NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE   **
> +  **                                                      **
> +  ** trace_printk() being used. Allocating extra memory.  **
> +  **                                                      **
> +  ** This means that this is a DEBUG kernel and it is     **
> +  ** unsafe for production use.                           **
> +  **                                                      **
> +  ** If you see this message and you are not debugging    **
> +  ** the kernel, report this immediately to your vendor!  **
> +  **                                                      **
> +  **   NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE   **
> +  **********************************************************

Translate it?


BTW:

what  happened between v1 and v4?



Thanks,

Yanteng

> +
> +
> +调试内核崩溃
> +------------
> +有多种方法可以在内核崩溃时获取系统状态。你可以通过 printk 中的 oops 消息来实现，也可以使用
> +kexec/kdump。但是这些方法只能显示崩溃时的情况，而如果能够知道在崩溃发生之前发生了什么则非常
> +有帮助。tracing ring buffer 默认情况下是一个循环缓冲区，它会用较新的事件覆盖较旧的事件。
> +当崩溃发生时，ring buffer 的内容会是导致崩溃的所有事件。
> +
> +在进行调试时，有一些内核命令行参数非常有用。第一个参数是 ftrace_dump_on_oops，当系统发生
> +oops 时，它会将 tracing ring buffer 的内容输出到控制台。如果控制台的这些输出能够被记录
> +下来那将会非常有帮助。但是如果你使用的是串口控制台，建议将环形缓冲区设得相对较小一些，否则可能
> +需要几分钟甚至数小时才能完成环形缓冲区的转储工作。下面是一个内核命令行示例::
> +
> +  ftrace_dump_on_oops trace_buf_size=50K
> +
> +注意，tracing buffer 由每个 CPU 的缓冲区组成，每个缓冲区又被划分为默认大小为 PAGE_SIZE
> +的子缓冲区。上面的 trace_buf_size 选项将每个 CPU 的缓冲区设置为 50K，因此在一台有 8 个
> +CPU 的机器上，实际上缓冲区总大小是 400K。
> +
> +跨重启的持久缓冲区
> +------------------
> +如果系统内存允许，可以在内存中的特定位置指定 tracing ring buffer。如果该位置在重启时保持
> +不变且内存数据未被修改，则该可以在下一次启动后读取该环形缓冲区。有如下两种方法为缓冲区保留内存。
> +
> +相对更可靠的方法（在 x86 上）是先使用 memmap 内核命令行选项来保留内存，然后将该内存指定用于
> +trace_instance。这需要对系统的物理内存布局有一定的了解。使用这种方法的优点是环形缓冲区的内存
> +位置将始终保持不变::
> +
> +  memmap==12M$0x284500000 trace_instance=boot_map@0x284500000:12M
> +
> +如上参数中，memmap 选项在物理内存地址 0x284500000 处保留了 12 兆字节的内存。而紧随其后的
> +trace_instance 选项将在同一位置创建一个名为 "boot_map" 的 trace instance（跟踪实例），
> +这个实例使用与保留的内存相同的大小。由于环形缓冲区要被划分为每个 CPU 的缓冲区，因此这 12MB
> +内存将被均匀地分配给所有 CPU。如果你有 8 个 CPU，那么每个 CPU 的环形缓冲区大小将是 1.5MB。
> +注意这其中还要包括元数据，因此环形缓冲区实际可使用的内存还会稍微小一些。
> +
> +另一种更通用但没那么可靠的在启动时分配环形缓冲区映射的方法是使用 reserve_mem 选项::
> +
> +  reserve_mem=12M:4096:trace trace_instance=boot_map@trace
> +
> +上面的 reserve_mem 会在启动时寻找 12MB 按 4096 字节对齐的可用内存。这块内存会被标记为
> +"trace" 以供后续的命令行选项使用。
> +
> +trace_instance 选项创建了一个名为 "boot_map" 的跟踪实例，并将使用由 reserve_mem 预留
> +并标记为 "trace" 的内存。这种方法更通用，但不那么可靠。由于 KASLR（内核地址空间布局随机化）
> +机制的存在，reserve_mem 保留的内存位置可能会有所不同。当这种情况发生时，环形缓冲区将不会是
> +在上次启动时写入的内容，并且整个缓冲区将会被重置。
> +
> +有时我们可以通过指定更大的对齐字节的方式来防止 KASLR 改变 reserve_mem 预留内存的位置。
> +通过这个方法，你可能会发现缓冲区的位置会更一致::
> +
> +  reserve_mem=12M:0x2000000:trace trace_instance=boot_map@trace
> +
> +在启动时，为环形缓冲区保留的内存将会经过校验。系统会通过一系列测试以确保缓冲区内包含有效数据。
> +如果测试通过，该环形缓冲区会被设置为可被实例读取；如果测试未通过，则其会被清空并重新初始化。
> +
> +这块内存的布局在不同的内核版本可能也会不同，因此只有相同的内核版本才能保证其工作正常。在不同
> +的内核版本之间切换时，可能会由于内存布局不同而导致缓冲区被标记为非法。
> +
> +注意：映射的地址和大小都必须符合架构的页面对齐要求。
> +
> +在启动阶段使用 trace_printk()
> +-----------------------------
> +默认情况下， trace_printk() 的内容会进入 top level tracing instance（顶级跟踪实例）。
> +但这个实例在重启时不会被保留。为了让 trace_printk() 的内容以及一些其它的内部 tracing
> +能够进入被保留的缓冲区（例如 dump stacks），你可以在内核命令行中为 trace_printk() 指定
> +目标实例，或者在启动后通过 trace_printk_dest 选项进行设置。
> +
> +启动后::
> +
> +  echo 1 > /sys/kernel/tracing/instances/boot_map/options/trace_printk_dest
> +
> +在内核命令行设置::
> +
> +  reserve_mem=12M:4096:trace trace_instance=boot_map^traceprintk^traceoff@trace
> +
> +如果在内核命令行中设置，建议同时使用 "traceoff" 标志来禁用追踪，并在启动后再重新启用追踪。
> +否则，最近一次启动的追踪信息将与上一次启动的追踪信息会混在一起，可能会变得难以阅读。
