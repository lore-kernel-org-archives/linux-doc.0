Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B178932B9AE
	for <linux-doc@vger.kernel.org>; Tue, 30 Dec 2025 19:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767121346; cv=none; b=AW9o7fA4xnnrJcROgfAMzZ8Qg+m7zZ7bMy5rW5LWM1yHOBIFgJoyssvUXfcQ8jITSizN5+f5qp+7anMydd/PvGrJjFtZkL8RpFMh7DfmjXtJLZ5ZDjO7i9gAD0jQo3yFXf/IyKFU4aHvlK4PaMyV7dvnqc/SONBmq7aYmynCyms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767121346; c=relaxed/simple;
	bh=mMVlPKaaCwCSJh+/xSYm4TAW35rxeEr226n+lZ5VKOQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZQ9ZVrJr+27IbMy4gG3LDwil6DowRq+fJMMbYvFH+RiMGeCU/iQhf2GRLHxgIabkEVsoSkI3NmyReR9+ZoDsn7q0dtCNnAmetJdpeFf/SKnQcscDUmcZPXEa3mJU85Dh7FL7xh9lgMoNPSg5EA9IHE+1xPuZUICYMxaFwT15laQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fMGby87Y; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fMGby87Y"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2a0ac29fca1so86489445ad.2
        for <linux-doc@vger.kernel.org>; Tue, 30 Dec 2025 11:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767121344; x=1767726144; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TtTvkPtA49B5p5z1oPiv28lf5ePiskviem9RJkXpnjg=;
        b=fMGby87YKcbTqVsSZUTDwn5W0hlJTMBMgSqg+ua55iX6pJ9vJqZmpNDc8TNMPHvd0U
         dpUFkfG8NR7TfGkfYfiDxYQoajv1jShS1+zm0PLMGKKfiwdFTYRDhFg0zV1/BCoBWPK1
         YSYzGDBrdM9Aywzew26DeXhEU5jd9YflbUb8aRJUOLRsL4a/zKrieyAq6L6nwv2zoeAJ
         J4dzRm2XoxzRwkgMe11hFEBgY6HJP0Lbd0sotNm74hjY2XQidx9rKgcnEPDKNQwG+2wk
         92Wr9IVuU/orJdaxpi2RDoEkh5IM5P3C0m50Y99qsc10MZEFTSTh4mGOgaMkLkh392/v
         opYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767121344; x=1767726144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TtTvkPtA49B5p5z1oPiv28lf5ePiskviem9RJkXpnjg=;
        b=H6Vwm5Lm+f5gTycqQXdJJhhwjtzPRRN3Y9Yv10PqQh4IjEwB7sTOKM0GY5U/odjGl5
         ON3SHabXDjwtuqxzhLVsVoCmstkxa5F9cNUF03lmSNSAZqo2/JJWG7O53/CxZgS+4Pxh
         JjS0FPem3bfMqNQwIYwXMhr/E/nsvOYYuHGTACgH2qmUPcB3VHAT/T/vjRXgdDbmQoY0
         Mf75HVdlrbN7DOE1wh0RKQHsRalxNrecSkRBRq/dtHXqOZXQyH3QB5KWc09URluY3LZU
         OIVIbd/F9PIBZYdsgImMhhLkfTjDVO1LZIrgD9etUaEWwyopUSvoE4QGomT2wuS24GVO
         uRBA==
X-Forwarded-Encrypted: i=1; AJvYcCVGfthLPHyLUNPSkQlFaPjw6xI+YvDpzjLc1A8o6S/Eq8jQmtDqqps4n0Y9zwRj7Hc9IPmTOkMtzrQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZOYUZCi38WwoNbBO4LJhSSyxr4l/omQoNCwfb34dGlp/VzEUv
	HEfAI140Kg7JC3XwTLoJnvmeg1wURc+Lr3pNN9LraO4c2sN9tryt97Gd
X-Gm-Gg: AY/fxX7nAxnTmZhDYHDwfUsoyPqpch2qKMLUndXJ+72a67gJmV2JdEO/t4QSMrVdCd8
	+IlAtDBWqf0R7qcH4G+ecSMCUoFCStq1FEgYC8B/+LEm3HPamyJuaq58YdQfh5hzdYAOwtaTOPm
	FzrQNXVRXRzXh6gmvSlMLMEJEth2uByzXWVo9KfEVgiw3Xv4fL+QZUj3oM7sbhjdSb/g8sZHwGK
	0dfOz1FNyS4AFBww+DBUoaKruDQDKogkGR6x0lodyCFoeuIShZbvAaX6Ghx1K47k0/85OYDFFjU
	A07ymauc7qRyWwmrk2uka6khZH7MII9EMQmrxdZTibUKmvOyH7tZipVdEHcYrk3JiXSETWXvtPs
	RXR/WMa2iT502494SftrFddSlEXMyfWTWUkr27c/1wH9WM7jYiq5TbbUWAtiLmWK3R8+9/55sov
	LtltzlCqv8sYI3lq2Y19nZVkJqeJwGpd1TUk6sqXWfGOKx
X-Google-Smtp-Source: AGHT+IGPv9UkofilE0rQJ9Y1kR7Yrl5mgYfhb1W4akxjhSjujz7aGFbmi6/llF9izkSWkC8UEoGzhw==
X-Received: by 2002:a17:902:d2c5:b0:2a1:4c31:333 with SMTP id d9443c01a7336-2a2f2222cf4mr355968715ad.19.1767121343430;
        Tue, 30 Dec 2025 11:02:23 -0800 (PST)
Received: from Lingbou.localdomain ([113.225.51.69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c8d10esm302147655ad.42.2025.12.30.11.02.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 11:02:22 -0800 (PST)
From: Xingqiu Xu <hilbertanjou83@gmail.com>
To: alexs@kernel.org,
	si.yanteng@linux.dev,
	corbet@lwn.net
Cc: dzm91@hust.edu.cn,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xingqiu Xu <hilbertanjou83@gmail.com>
Subject: [PATCH v2 2/7] docs/zh_CN: Translate timers/timekeeping.rst
Date: Wed, 31 Dec 2025 03:02:07 +0800
Message-Id: <6f8a022173941e2478806e5606a0a7ba3124a65b.1767118457.git.hilbertanjou83@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1767118457.git.hilbertanjou83@gmail.com>
References: <cover.1767118457.git.hilbertanjou83@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Translate .../timers/timekeeping.rst into Chinese.
Update timers/index.rst to include the translated file.

Update translation through commit 458f69ef3665
("docs: timers: convert docs to ReST and rename to *.rst")

Signed-off-by: Xingqiu Xu <hilbertanjou83@gmail.com>
---
 .../translations/zh_CN/timers/index.rst       |   3 +-
 .../translations/zh_CN/timers/timekeeping.rst | 202 ++++++++++++++++++
 2 files changed, 204 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/timers/timekeeping.rst

diff --git a/Documentation/translations/zh_CN/timers/index.rst b/Documentation/translations/zh_CN/timers/index.rst
index 8dc5861445f9..c1e178484f96 100644
--- a/Documentation/translations/zh_CN/timers/index.rst
+++ b/Documentation/translations/zh_CN/timers/index.rst
@@ -15,13 +15,14 @@
 .. toctree::
     :maxdepth: 1
 
+    timekeeping
+
 TODOList:
 
 * highres
 * hpet
 * hrtimers
 * no_hz
-* timekeeping
 * delay_sleep_functions
 
 .. only::  subproject and html
diff --git a/Documentation/translations/zh_CN/timers/timekeeping.rst b/Documentation/translations/zh_CN/timers/timekeeping.rst
new file mode 100644
index 000000000000..efd024f2e64c
--- /dev/null
+++ b/Documentation/translations/zh_CN/timers/timekeeping.rst
@@ -0,0 +1,202 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/timers/timekeeping.rst
+
+:翻译:
+
+  徐兴球 Xingqiu Xu <hilbertanjou83@gmail.com>
+
+===============================================
+时钟源、时钟事件、sched_clock() 和延迟定时器
+===============================================
+
+本文档试图简要解释一些基本的内核时间保持抽
+象。它部分涉及通常在内核树的
+drivers/clocksource 中找到的驱动程序，但
+代码可能分散在整个内核中。
+
+如果您通过 grep 浏览内核源代码，您会发现许
+多特定于架构的时钟源、时钟事件实现以及类似
+的几个特定于架构的 sched_clock() 函数覆盖
+和一些延迟定时器。
+
+为了为您的平台提供时间保持，时钟源提供基本
+时间线，而时钟事件在此时间线上的某些点触发
+中断，提供诸如高分辨率定时器之类的功能。
+sched_clock() 用于调度和时间戳，延迟定时器
+使用硬件计数器提供准确的延迟源。
+
+
+时钟源
+------
+
+时钟源的目的是为系统提供时间线，告诉系统当
+前的时间位置。例如，在 Linux 系统上发出
+"date" 命令最终将读取时钟源以确定确切的时
+间。
+
+通常，时钟源是一个单调的原子计数器，它将提
+供 n 位，从 0 计数到 (2^n)-1，然后回绕到 0
+并重新开始。只要系统运行，它理想地永远不会
+停止计时。它可能在系统挂起期间停止。
+
+时钟源应该具有尽可能高的分辨率，并且与实际
+的墙上时钟相比，频率应该尽可能稳定和正确。
+它不应该在时间上不可预测地来回移动或在这里
+和那里错过几个周期。
+
+它必须对硬件中发生的那种效果免疫，例如在总
+线上分两个阶段读取计数器寄存器：首先读取最
+低 16 位，然后在第二个总线周期中读取较高的
+16 位，而计数器位可能在两者之间更新，这会
+导致计数器产生非常奇怪的值。
+
+当时钟源的挂钟时间精度不令人满意时，时间保
+持代码中有各种特殊处理机制和层次，用于例如
+将用户可见时间同步到系统中的 RTC 时钟或使
+用 NTP 针对网络时间服务器，但它们所做的基
+本上是更新针对时钟源的偏移量，时钟源为系统
+提供基本时间线。这些措施不会影响时钟源本身，
+它们只是使系统适应时钟源的缺点。
+
+时钟源结构应提供将提供的计数器转换为纳秒值
+作为无符号 64 位整数的方法。由于此操作可能
+被非常频繁地调用，因此在严格的数学意义上这
+样做是不可取的：相反，使用仅算术操作乘法和
+移位将数字尽可能接近纳秒值，因此在
+clocksource_cyc2ns() 中您会发现：
+
+  ns ~= (clocksource * mult) >> shift
+
+您会在时钟源代码中找到许多辅助函数，旨在帮
+助提供这些 mult 和 shift 值，例如
+clocksource_khz2mult()、
+clocksource_hz2mult()，它们帮助从固定的
+shift 确定 mult 因子，以及
+clocksource_register_hz() 和
+clocksource_register_khz()，它们将使用时
+钟源的频率作为唯一输入来帮助分配 shift 和
+mult 因子。
+
+对于从单个 I/O 内存位置访问的真正简单的时
+钟源，现在甚至有 clocksource_mmio_init()，
+它将接受内存位置、位宽、一个参数告诉寄存器
+中的计数器是向上还是向下计数以及定时器时钟
+速率，然后生成所有必要的参数。
+
+由于 100 MHz 的 32 位计数器将在大约 43 秒
+后回绕到零，处理时钟源的代码将不得不对此进
+行补偿。这就是为什么时钟源结构还包含一个
+'mask' 成员，说明源的多少位是有效的。这样，
+时间保持代码就知道计数器何时会回绕，并可以
+在回绕点的两侧插入必要的补偿代码，以便系统
+时间线保持单调。
+
+
+时钟事件
+--------
+
+时钟事件在概念上是时钟源的反向操作：它们采
+用所需的时间规范值并计算要写入硬件定时器寄
+存器的值。
+
+时钟事件与时钟源正交。相同的硬件和寄存器范
+围可用于时钟事件，但它本质上是不同的东西。
+驱动时钟事件的硬件必须能够触发中断，以便在
+系统时间线上触发事件。在 SMP 系统上，理想
+（并且习惯）每个 CPU 核心有一个这样的事件
+驱动定时器，以便每个核心可以独立于任何其他
+核心触发事件。
+
+您会注意到时钟事件设备代码基于关于使用 mult
+和 shift 算术将计数器转换为纳秒的相同基本
+思想，并且您会再次找到用于分配这些值的相同
+辅助函数系列。但是，时钟事件驱动程序不需要
+'mask' 属性：系统不会尝试在时钟事件的时间
+范围之外规划事件。
+
+
+sched_clock()
+-------------
+
+除了时钟源和时钟事件之外，内核中还有一个特
+殊的弱函数，称为 sched_clock()。此函数应
+返回自系统启动以来的纳秒数。架构可能会也可
+能不会提供 sched_clock() 的自己的实现。如
+果不提供本地实现，系统 jiffy 计数器将用作
+sched_clock()。
+
+顾名思义，sched_clock() 用于调度系统，例
+如在 CFS 调度程序中确定某个进程的绝对时间
+片。它还用于 printk 时间戳，当您选择在
+printk 中包含时间信息以用于引导图表等事情
+时。
+
+与时钟源相比，sched_clock() 必须非常快：它
+被调用得更频繁，尤其是被调度程序调用。如果
+您必须在与时钟源相比的精度之间进行权衡，您
+可以在 sched_clock() 中牺牲精度以换取速度。
+但是，它需要与时钟源相同的一些基本特征，即
+它应该是单调的。
+
+sched_clock() 函数只能在无符号长整型边界上
+回绕，即 64 位之后。由于这是一个纳秒值，这
+意味着它在大约 585 年后回绕。（对于大多数
+实际系统，这意味着"永不"。）
+
+如果架构不提供此函数的自己实现，它将回退到
+使用 jiffies，使其最大分辨率为架构的 jiffy
+频率的 1/HZ。这将影响调度精度，并可能在系
+统基准测试中显示出来。
+
+驱动 sched_clock() 的时钟可能在系统挂起/
+睡眠期间停止或重置为零。这对它所服务的调度
+系统事件功能无关紧要。但是，它可能导致
+printk() 中出现有趣的时间戳。
+
+sched_clock() 函数应该在任何上下文中可调
+用，IRQ 和 NMI 安全，并在任何上下文中返回
+合理的值。
+
+某些架构可能具有有限的时间源集并且缺乏一个
+很好的计数器来派生 64 位纳秒值，因此例如在
+ARM 架构上，已经创建了特殊的辅助函数，以从
+16 位或 32 位计数器提供 sched_clock() 纳
+秒基数。有时，也用作时钟源的同一计数器也用
+于此目的。
+
+在 SMP 系统上，对于性能至关重要的是
+sched_clock() 可以在每个 CPU 上独立调用而
+不会产生任何同步性能损失。某些硬件（例如
+x86 TSC）将导致 sched_clock() 函数在系统
+上的 CPU 之间漂移。内核可以通过启用
+CONFIG_HAVE_UNSTABLE_SCHED_CLOCK 选项来解
+决此问题。这是使 sched_clock() 与普通时钟
+源不同的另一个方面。
+
+
+延迟定时器（仅某些架构）
+------------------------
+
+在具有可变 CPU 频率的系统上，各种内核
+delay() 函数有时会表现得很奇怪。基本上，这
+些延迟通常使用硬循环来延迟使用在引导时校准
+的"lpj"（每 jiffy 循环数）值的一定数量的
+jiffy 分数。
+
+让我们希望您的系统在校准此值时以最大频率运
+行：结果是当频率降至一半频率时，任何 delay()
+将是两倍长。通常这不会造成伤害，因为您通常
+要求至少那么多的延迟。但基本上，在此类系统
+上，语义是相当不可预测的。
+
+进入基于定时器的延迟。使用这些，可以使用定
+时器读取而不是硬编码循环来提供所需的延迟。
+
+这是通过声明一个 struct delay_timer 并为此
+延迟定时器分配适当的函数指针和速率设置来完
+成的。
+
+这在某些架构上可用，例如 OpenRISC 或 ARM。
-- 
2.34.1

