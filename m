Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473F9345CA8
	for <linux-doc@vger.kernel.org>; Tue,  6 Jan 2026 19:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767728866; cv=none; b=CYyYJEmP2Wztq4tRg6YX5xYkn/RCg22tDfhEB2U59yJDA3VTw1dvnQ4Vti+fv5e5MNySftGhw6FIZUD4BuJor1nel31028FXhemwkh4Kn9oa25nRl249A2QvbtNzhOE2ArCn2oeOk2E63DbKQ1pyVY8iutex3eZKbK86MguzqKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767728866; c=relaxed/simple;
	bh=gGgSXt+DdBp3sbzsp4dpWX7hRm4j//GBxOtlobLS/Qc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dJF8vGy62qK/ueYMtfvGnY+dSouZ5B1kT95TnQA6AfaRnhty82WpYoEU3WiIiZB8IahR7nKfzeaULg0Sp+gLnJc3xdRwoKaxcXuTiFNFzBksz2lWzCZjzs2y/XRgolG4w+N4iMg3zBqDqRZYTDGUZAs6wVvtsVY48NM0SuUPTfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c7w0yV5q; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c7w0yV5q"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-803474aaa8bso108610b3a.0
        for <linux-doc@vger.kernel.org>; Tue, 06 Jan 2026 11:47:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767728864; x=1768333664; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X/pt0IGnnuuAtRE344s3SaMhd3aH3FRKfq+F4DlLQDo=;
        b=c7w0yV5qdz9+aWJPWhGWFmkKUcCAs5MLUs95C/SKJDReaFvsc5EE51Iv4Urqca6fvH
         KGlY5DIxsyyqcLf2RCUZycUVess0zTz9hDhO2iRfLs1VL5zbLg15K9oYGBeq0Un5l0rK
         S1zWIULL4YWmkNLQCFH/BU44AJ0/GHgyfMYJE61g+l6M08eqecFgP9+SL6RQXIUfeWgl
         8OB9buRoxf9zaio+P8Sfp0l93me1ITZ0dVr2+A1CpxdgN2TZCvvXK3C4Umfo0I0eFO6z
         lr47ASjKmFAyVkR9qFqr+FQ1B6NysbAGI/2Ov4sq7dWTbn+lTAg+p/AGOf1BIaySbdFK
         SazQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767728864; x=1768333664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X/pt0IGnnuuAtRE344s3SaMhd3aH3FRKfq+F4DlLQDo=;
        b=v1p+hkNCIaevyY4HdCnPfdP/ekBvG+H6iNbUOYrbgYVncyQtr8xDo+70ncBycIF2/U
         eY+HJ4xA+ue8lP42/VKo58hnJMMBj/z/WNnJzsONlpJnr5dPFLyjcUK98+LYCHqsYKFh
         MbhV3ZW2WLX3cav8p4pRZlyR4TTRWs/+uFhaa2KqX0LDtl5jzHa/9NLNaU9xMEkqI4LQ
         FNKXi90ePPhL5UHGc5Q+Afe+LG8Gy7TZ3WWaYq9cRIr3X37zhN8qSgvjwyyuYdZapBoK
         zcLwwtgykwp6nYSziFXr/k65NkS7Jdr+GWidX1rm7C4oGk2n/6Mj3f6yWpNZZ+rL+tN1
         ZeoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBkuawmaSu6fvty6nrq2wlpgkUEKOkI5sWpPGsXB/Fr3YjQfgsSjNcSo2IQkj7YSO/NVwfzv/kn4Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YztDe9QOil4ocLgjlUqQu4V/5vBHe6rPg6fttJf7/Z4ymeDej6q
	hLgsBh9MO0o32X9uekmnAwErGPdLtKe6UwwUE2C0ODplHBKO8FTWmuDe
X-Gm-Gg: AY/fxX6eOrseS0s52/zb6DlrFUinIKKvKO9sJ54/lrgGwRYav8KBbcToDtFWlhJnm/F
	YAHSv3+IkiHwlRLOUiykJ9stYG0EVJ2J9yKv4wLjZRV3qjXBNexbinmni61IVCvVX5WJ9v2jycO
	oJcdWNLcRohzhLeoNCzRWR+69KP+WXuU8ojPV0SLqFforPI8sPdLQS3IicEUiCcmLhUSvgTafyR
	8YFJDV5GCqXvvWqexiG8eD4WWxO8Na4oOLi+qyShWmJUrbIwoxY9nldP2hbZ+Vk+x/sertB4cnk
	1RcbSXgmYlWHLYGHsQDpjbIvV3rOK3tyD4SmXn2DyyXY8lZLi0CN1t7wRnwmbrcezChAOVuxtdC
	W2C96afv0y1E/HiiRE4E6p0p0nFAFZJ3llu3f6TZsSYE+8+Oc+84EfVhmAxdLNk1+VopvgfGxhm
	5qXwH3KJvWmPvfXDk4oU91IIUNyKTuJkbxpCpw/2X/
X-Google-Smtp-Source: AGHT+IGT3+BWRXKgwmDGHrX1BiTRhgjuUaWpH6towuLPoNAHLaZBruDkMorwXartkCQpsb6bVQeYAg==
X-Received: by 2002:a05:6a20:4388:b0:366:14b0:4afe with SMTP id adf61e73a8af0-38982b715a1mr3426685637.37.1767728863297;
        Tue, 06 Jan 2026 11:47:43 -0800 (PST)
Received: from Lingbou.localdomain ([113.225.51.69])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cc8d292fcsm3036722a12.20.2026.01.06.11.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 11:47:42 -0800 (PST)
From: Xingqiu Xu <hilbertanjou83@gmail.com>
To: alexs@kernel.org,
	si.yanteng@linux.dev,
	corbet@lwn.net
Cc: dzm91@hust.edu.cn,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xingqiu Xu <hilbertanjou83@gmail.com>
Subject: [PATCH v3 5/7] docs/zh_CN: Translate timers/highres.rst
Date: Wed,  7 Jan 2026 03:47:18 +0800
Message-Id: <cddbec3b666c0ba23cdc09d635b907ce04243ae9.1767725479.git.hilbertanjou83@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1767725479.git.hilbertanjou83@gmail.com>
References: <cover.1767725479.git.hilbertanjou83@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Translate .../timers/highres.rst into Chinese.
Update timers/index.rst to include the translated file.

Update translation through commit 458f69ef3665
("docs: timers: convert docs to ReST and rename to *.rst")

Signed-off-by: Xingqiu Xu <hilbertanjou83@gmail.com>
---
 .../translations/zh_CN/timers/highres.rst     | 270 ++++++++++++++++++
 .../translations/zh_CN/timers/index.rst       |   2 +-
 2 files changed, 271 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/timers/highres.rst

diff --git a/Documentation/translations/zh_CN/timers/highres.rst b/Documentation/translations/zh_CN/timers/highres.rst
new file mode 100644
index 000000000000..64fd62e3da68
--- /dev/null
+++ b/Documentation/translations/zh_CN/timers/highres.rst
@@ -0,0 +1,270 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/timers/highres.rst
+
+:翻译:
+
+  徐兴球 Xingqiu Xu <hilbertanjou83@gmail.com>
+
+==========================================
+高分辨率定时器和动态时钟刻度设计笔记
+==========================================
+
+可以在 OLS 2006 演讲"hrtimers 及其超越"的
+论文中找到更多信息。该论文是 OLS 2006 论文
+集第 1 卷的一部分，可以在 OLS 网站上找到：
+https://www.kernel.org/doc/ols/2006/ols2006v1-pages-333-346.pdf
+
+该演讲的幻灯片可从以下网址获得：
+http://www.cs.columbia.edu/~nahum/w6998/papers/ols2006-hrtimers-slides.pdf
+
+幻灯片包含五个图（第 2、15、18、20、22 页），
+说明了 Linux 时间(r)相关子系统的变化。图 #1
+（第 2 页）显示了在 hrtimers 和其他构建块合
+并到主线之前 Linux 时间(r)系统的设计。
+
+注意：论文和幻灯片讨论的是"时钟事件源"，而我
+们同时切换到了名称"时钟事件设备"。
+
+该设计包含以下基本构建块：
+
+- hrtimer 基础设施
+- 时间日期和时钟源管理
+- 时钟事件管理
+- 高分辨率定时器功能
+- 动态时钟刻度
+
+
+hrtimer 基础设施
+----------------
+
+hrtimer 基础设施已合并到 2.6.16 内核中。基
+本实现的详细信息包含在
+Documentation/timers/hrtimers.rst 中。另请
+参见图 #2（OLS 幻灯片第 15 页）
+
+与保存已武装的 timer_list 类型定时器的定时
+器轮的主要区别是：
+
+       - 按时间顺序入队到红黑树中
+       - 独立于时钟节拍（处理基于纳秒）
+
+
+时间日期和时钟源管理
+--------------------
+
+John Stultz 的通用时间日期（GTOD）框架将
+大部分代码从特定于架构的区域移动到通用管理
+框架中，如图 #3（OLS 幻灯片第 18 页）所示。
+特定于架构的部分被简化为时钟源的低级硬件细
+节，这些时钟源在框架中注册并根据基于质量的
+决策进行选择。低级代码提供硬件设置和读出例
+程，并初始化数据结构，通用时间保持代码使用
+这些数据结构将时钟刻度转换为基于纳秒的时间
+值。所有其他与时间保持相关的功能都移到了通
+用代码中。GTOD 基础补丁已合并到 2.6.18 内
+核中。
+
+有关通用时间日期框架的更多信息，请参见 OLS
+2005 论文集第 1 卷：
+
+	http://www.linuxsymposium.org/2005/linuxsymposium_procv1.pdf
+
+论文"We Are Not Getting Any Younger: A New
+Approach to Time and Timers"由 J. Stultz、
+D.V. Hart 和 N. Aravamudan 撰写。
+
+图 #3（OLS 幻灯片第 18 页）说明了这一转变。
+
+
+时钟事件管理
+------------
+
+虽然时钟源提供对单调递增时间值的读访问，但
+时钟事件设备用于调度下一个事件中断。下一个
+事件当前定义为周期性的，其周期在编译时定义。
+事件设备的设置和选择用于各种事件驱动功能被
+硬编码到依赖于架构的代码中。这导致所有架构
+都有重复代码，并且使得更改系统配置以使用除
+已内置到架构中的事件中断设备之外的其他设备
+变得极其困难。当前设计的另一个含义是，为了
+提供诸如高分辨率定时器或动态时钟刻度之类的
+新功能，必须触及所有特定于架构的实现。
+
+时钟事件子系统试图通过提供通用解决方案来管
+理时钟事件设备及其用于各种时钟事件驱动的内
+核功能来解决此问题。时钟事件子系统的目标是
+将时钟事件相关的依赖于架构的代码最小化为纯
+硬件相关的处理，并允许轻松添加和利用新的时
+钟事件设备。它还最小化了跨架构的重复代码，
+因为它提供了从中断服务处理程序向下的通用功
+能，这几乎本质上是硬件依赖的。
+
+时钟事件设备由依赖于架构的引导代码或在模块
+插入时注册。每个时钟事件设备填充一个数据结
+构，其中包含时钟特定的属性参数和回调函数。
+时钟事件管理通过使用指定的属性参数决定时钟
+事件设备将用于支持的系统功能集。这包括区分
+每 CPU 和每系统全局事件设备。
+
+系统级全局事件设备用于 Linux 周期时钟刻度。
+每 CPU 事件设备用于提供本地 CPU 功能，例如
+进程记账、分析和高分辨率定时器。
+
+管理层为时钟事件设备分配以下一个或多个功能：
+
+      - 系统全局周期时钟刻度（jiffies 更新）
+      - cpu 本地 update_process_times
+      - cpu 本地分析
+      - cpu 本地下一个事件中断（非周期模式）
+
+时钟事件设备将这些定时器中断相关功能的选择
+完全委托给管理层。时钟管理层在设备描述结构
+中存储一个函数指针，必须从硬件级处理程序调
+用该指针。这从特定于架构的定时器中断处理程
+序中删除了大量重复代码，并将对时钟事件设备
+的控制以及定时器中断相关功能的分配交给核心
+代码。
+
+时钟事件层 API 相当小。除了时钟事件设备注
+册接口外，它还提供用于调度下一个事件中断、
+时钟事件设备通知服务以及对挂起和恢复的支持
+的函数。
+
+该框架添加了大约 700 行代码，这导致内核二
+进制大小增加 2KB。i386 的转换删除了大约
+100 行代码。二进制大小减少约 400 字节。我
+们认为，灵活性的增加和跨架构的重复代码的避
+免证明了二进制大小的轻微增加是合理的。
+
+架构的转换没有功能影响，但允许在不更改时钟
+事件设备和定时器中断代码的情况下利用高分辨
+率和动态时钟刻度功能。转换后，只需将
+kernel/time/Kconfig 文件添加到特定于架构
+的 Kconfig 并将动态时钟刻度特定调用添加到
+空闲例程（总共向空闲函数和 Kconfig 文件添
+加 3 行）即可简单地提供高分辨率定时器和动
+态时钟刻度的启用。
+
+图 #4（OLS 幻灯片第 20 页）说明了这一转变。
+
+
+高分辨率定时器功能
+------------------
+
+在系统引导期间无法使用高分辨率定时器功能，
+虽然实现这一功能会很困难且没有实际用途。必
+须完成时钟事件设备框架、时钟源框架（GTOD）
+和 hrtimers 本身的初始化，并且必须注册适当
+的时钟源和时钟事件设备，然后高分辨率功能才
+能工作。直到 hrtimers 初始化完成之前，系统
+以通常的低分辨率周期模式工作。
+时钟源和时钟事件设备层提供通知功能，通知
+hrtimers 有关新硬件的可用性。hrtimers 在
+切换到高分辨率模式之前验证已注册时钟源和时
+钟事件设备的可用性。这也确保了配置为高分辨
+率定时器的内核可以在缺乏必要硬件支持的系统
+上运行。
+
+高分辨率定时器代码不支持仅具有全局时钟事件
+设备的 SMP 机器。对此类硬件的支持将涉及中
+断发生时的 IPI 调用。开销将远大于收益。这
+就是为什么我们目前在 i386 SMP 系统上禁用
+高分辨率和动态时钟刻度，这些系统在 C3 电
+源状态下停止本地 APIC。解决方法作为想法可
+用，但尚未解决该问题。
+
+定时器的时间排序插入提供了所有基础设施，以
+在添加定时器时决定是否必须重新编程事件设备。
+该决定是按定时器基础做出的，并在支持函数中
+跨每 CPU 定时器基础同步。该设计允许系统为
+每 CPU 定时器基础使用单独的每 CPU 时钟事
+件设备，但当前每个 CPU 仅使用一个可重新编
+程的时钟事件设备。
+
+当定时器中断发生时，从时钟事件分发代码调用
+下一个事件中断处理函数，并将过期的定时器从
+红黑树移动到单独的双向链表，并调用软中断处
+理函数。hrtimer 结构中的额外模式字段允许
+系统直接从下一个事件中断处理函数执行回调函
+数。这仅限于可以在硬中断上下文中安全执行的
+代码。例如，这适用于 nanosleep 使用的唤醒
+函数的常见情况。在中断上下文中执行处理函数
+的优点是避免了多达两次上下文切换——从中断的
+上下文到软中断以及到被过期定时器唤醒的任务。
+
+一旦系统切换到高分辨率模式，周期时钟节拍就
+会关闭。这会禁用系统级全局周期时钟事件设备
+——例如 i386 SMP 系统上的 PIT。
+
+周期时钟节拍功能由每 CPU hrtimer 提供。回
+调函数在下一个事件中断上下文中执行，并更新
+jiffies 并调用 update_process_times 和分
+析。基于 hrtimer 的周期时钟节拍的实现旨在
+扩展动态时钟节拍功能。这允许使用单个时钟事
+件设备在 UP 系统上调度高分辨率定时器和周期
+事件（jiffies 时钟节拍、分析、进程记账）。
+这已被证明可以在 i386 上的 PIT 和 PPC 上
+的增量器上工作。
+
+用于运行 hrtimer 队列和执行回调的软中断已
+从时钟节拍绑定的定时器软中断中分离出来，以
+允许准确传递 itimer 和 POSIX 间隔定时器使
+用的高分辨率定时器信号。此软中断的执行仍可
+能被其他软中断延迟，但这种分离已显著改善了
+总体延迟。
+
+图 #5（OLS 幻灯片第 22 页）说明了这一转变。
+
+
+动态时钟节拍
+------------
+
+动态时钟节拍是基于 hrtimer 的周期时钟节拍
+替换（sched_tick）的逻辑结果。sched_tick
+hrtimer 的功能由三个函数扩展：
+
+- hrtimer_stop_sched_tick
+- hrtimer_restart_sched_tick
+- hrtimer_update_jiffies
+
+当 CPU 进入空闲状态时调用
+hrtimer_stop_sched_tick()。该代码评估下一
+个预定的定时器事件（来自 hrtimers 和定时
+器轮），如果下一个事件比下一个时钟节拍更远，
+它会将 sched_tick 重新编程到这个未来事件，
+以允许更长的空闲睡眠，而不会受到周期时钟节
+拍的无用中断。当空闲期间发生中断但不会导致
+重新调度时，也会调用该函数。该调用是必要的，
+因为中断处理函数可能已经启动了一个新定时器，
+其到期时间早于在上一次调用
+hrtimer_stop_sched_tick 时识别的最近事件
+的时间。
+
+当 CPU 在调用 schedule() 之前离开空闲状态
+时，调用 hrtimer_restart_sched_tick()。
+hrtimer_restart_sched_tick() 恢复周期时
+钟节拍，该节拍保持活动状态直到下次调用
+hrtimer_stop_sched_tick()。
+
+从 irq_enter() 调用 hrtimer_update_jiffies()
+当空闲期间发生中断时，以确保 jiffies 是最
+新的，并且中断处理函数不必处理可能过时的
+jiffy 值。
+
+动态时钟节拍功能提供统计值，这些值通过
+/proc/stat 导出到用户空间，并可用于增强的
+电源管理控制。
+
+该实现为进一步开发留下了空间，例如完全无节
+拍系统，其中时间片由调度程序控制、可变频率
+分析以及将来完全删除 jiffies。
+
+
+除了当前 i386 支持的初始提交外，补丁集已经
+扩展到 x86_64 和 ARM。MIPS 和 PowerPC 的
+初始（正在进行的工作）支持也可用。
+
+	  Thomas, Ingo
diff --git a/Documentation/translations/zh_CN/timers/index.rst b/Documentation/translations/zh_CN/timers/index.rst
index cd0187d83719..485e6a95c600 100644
--- a/Documentation/translations/zh_CN/timers/index.rst
+++ b/Documentation/translations/zh_CN/timers/index.rst
@@ -15,13 +15,13 @@
 .. toctree::
     :maxdepth: 1
 
+    highres
     hpet
     hrtimers
     timekeeping
 
 TODOList:
 
-* highres
 * no_hz
 * delay_sleep_functions
 
-- 
2.34.1

