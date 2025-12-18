Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3971DB125
	for <linux-doc@vger.kernel.org>; Thu, 18 Dec 2025 23:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766099834; cv=none; b=HiwEHThNWDAdT1YjyysPSvXGk+YrxXDmr3ZR8/rPg9P8qGEoA4h++MXCZZEUNjldR1Xq2yUQ3BdknXYNZtpvxrCxRVeIIkn+tIeLl4cXik5Um9vTfme2TwSiWH+pDWpyDiObxZDEf25z/Bve/4OSAVtVWuvcxmoEj5cdjo7uAuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766099834; c=relaxed/simple;
	bh=6KzRwoudRftZIaPrgMtXjn63PJwJ+91XxUvfjFZrXb4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T3Cl+tJWTo53Lne25ERfMfdln04+n3OGF7+X9TlGyj6tnRQgqdBS0Fe7b/5B3zGl7IZ4g7FWNHFmXIG4yQJf4zDYEY7RZBCSPUJ/nNOTZ4GZPK1pSfsG57Qwi6hgGCV318UN83nMrfFBcjS2vKEdsyfmO7frx/tcdEreFclb2bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lxBJCBNi; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lxBJCBNi"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2a12ebe4b74so17754865ad.0
        for <linux-doc@vger.kernel.org>; Thu, 18 Dec 2025 15:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766099831; x=1766704631; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bR87helkNp4U6UAsQg6P+JBrXijCln2lmK+FlkZ9r3w=;
        b=lxBJCBNiEsFxTfB92v1ClVOmifvqkIV2MpF4n8FDRRtmiu8Ghx3WzppXHebItlCJrH
         Gyd2nfgSKavdaBgQ2t8KiLk4ouTY4i9tW4fWkMqU0A40w6RzsjSCNHJYjK/cD5/67mSA
         vtSvvBPD7IT1y92CX4Oaayh8XrwRriF0xgYSUuct5kHpYC4/7XwcXA/50RLR2U1Bq43e
         YMgvfPQUZOAd643lpQ7scn7uZsxVTwwSuEDThmlWxe+KvMPSelOV5WI20nAfOgx+Ccot
         Z8KtXplaNYytGf/q6HPBh3WXi1ttIb0qsQ9nO+kVKo60cVl3b24FuHOqKe5PYHOVkA1y
         Gcdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766099831; x=1766704631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bR87helkNp4U6UAsQg6P+JBrXijCln2lmK+FlkZ9r3w=;
        b=B1j5hMpS3fnDZF2lKcxy1QvftPocLpVvi2hQ0qQTjG4PuBMIAzLKGj5izFzaOf8eA0
         XaLryfke/thRbzJDY+0ZcrDaDsUqj9UK4Av9y6xoVWC+342KUY91J9LhPnTus45w3bSR
         ULFKmwmpzHhqRYXa3SZN9sCGc8wPJNqOnFvYiaPT0E4bhUaz0z0nbhGzpRAdnGy8LAdC
         8BLvkCK6lMO8ALQkjaKu4qtQUUakdFffvTqQ4g+YwVqnBfhTVtAj9wnW6yfXE57JyZ2D
         g9PyaUvc0pxxHAhNhhag1fUlaXS4oY5vjyxbTpqB50HcmuN8ehSc7OmN/1XxQj9BqLwn
         6DEw==
X-Forwarded-Encrypted: i=1; AJvYcCVCeOCu/y/I5h13lpjx3SnKUPg4u3ZHWxVCZRH2Tz6XBTXTlc0Vo+wE1wdDHoushrbJmPzTcxnOZVk=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz8ore54d0RNHJIXExc7MkVccI9vmXR0NCQdE12LT2hjVa/Ix+
	f3GAXDwoSkRLrTcwnZDWqO1lkDg40hFm7d6IppBQHeBGdXJnyJwD5nC0
X-Gm-Gg: AY/fxX4l+qhPtTBigzRb5Hsyt3e8t4KAxMMBAqPynUnm9dBWGQia+s6A8e2mdRxmf0k
	5KhiXqDFDiFJDy217WwEH7JZuAXXNvpOklL3YauNOVDcaPQlT4SorC1t2d8fvU8dmhTBfx4fbyM
	AYtcL7yj5heMlVZO1FDLqnJpGj3Tatg894zHp/2SSPd9RM1TCg1b2FI+rIXj6NdMnnd/dVm0ig7
	qhWEeZja5x7lUEREg5vcbFpQW3ZrtIpVQXbBi9EMLg6lI28WKR4eYSwNI+ezs6MbfzFKCwO6xKS
	7cRdFv6EsxHQbh9+x+T/N5GF/M0rz68rBVG4tDnR5zrBwotFE7eRH6IL0zrFyBzJTX11vHx6BJW
	uObysxyy9CVeiqV4eWHRnmdt4Jp59DY9XeYxyMxKOm5Gz6JT5eZ3en42jS/f36VXnN4lzmW1yDS
	ppMiPGEgkUHaH/SWw84XQJRPo3NcxdwAhFywHtdIxJgngYMQ==
X-Google-Smtp-Source: AGHT+IE54ZoDO678vRAlcYzdljnlX4l3MMPGGgzeQhLiLGImj5+FQiQemTlDD54MlQ8wBecGmRiQPQ==
X-Received: by 2002:a17:903:4b08:b0:294:d953:6ff9 with SMTP id d9443c01a7336-2a2f2840886mr7160575ad.47.1766099831196;
        Thu, 18 Dec 2025 15:17:11 -0800 (PST)
Received: from Lingbou.localdomain ([113.225.44.231])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4cb48sm3311955ad.64.2025.12.18.15.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 15:17:10 -0800 (PST)
From: Xingqiu Xu <hilbertanjou83@gmail.com>
To: alexs@kernel.org,
	si.yanteng@linux.dev
Cc: dzm91@hust.edu.cn,
	corbet@lwn.net,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xingqiu Xu <hilbertanjou83@gmail.com>
Subject: [PATCH 4/7] docs/zh_CN: Translate timers/hrtimers.rst
Date: Fri, 19 Dec 2025 07:16:46 +0800
Message-Id: <bbaf37834b3aade04209c73f45073e1c5301a36b.1766099040.git.hilbertanjou83@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1766099040.git.hilbertanjou83@gmail.com>
References: <cover.1766099040.git.hilbertanjou83@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Translate .../timers/hrtimers.rst into Chinese.
Update timers/index.rst to include the translated file.

Update translation through commit 4c093cbb89f3
("Documentation: timers: hrtimers: Make hybrid union historical")

Signed-off-by: Xingqiu Xu <hilbertanjou83@gmail.com>
---
 .../translations/zh_CN/timers/hrtimers.rst    | 188 ++++++++++++++++++
 .../translations/zh_CN/timers/index.rst       |   2 +-
 2 files changed, 189 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/timers/hrtimers.rst

diff --git a/Documentation/translations/zh_CN/timers/hrtimers.rst b/Documentation/translations/zh_CN/timers/hrtimers.rst
new file mode 100644
index 000000000000..0dac98a43575
--- /dev/null
+++ b/Documentation/translations/zh_CN/timers/hrtimers.rst
@@ -0,0 +1,188 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/timers/hrtimers.rst
+
+:翻译:
+
+  徐兴球 Xingqiu Xu <hilbertanjou83@gmail.com>
+
+==========================================
+hrtimers - 高分辨率内核定时器子系统
+==========================================
+
+本补丁引入了一个新的高分辨率内核定时器子系统。
+
+有人可能会问：我们已经有了一个定时器子系统
+（kernel/timers.c），为什么需要两个定时器
+子系统？在经过大量的反复尝试将高分辨率和高
+精度功能集成到现有定时器框架中，并在实践中
+测试了各种此类高分辨率定时器实现后，我们得
+出结论：定时器轮代码从根本上不适合这种方法。
+我们最初不相信这一点（"一定有办法解决这个
+问题"），并花费了相当大的努力尝试将东西集
+成到定时器轮中，但我们失败了。事后看来，这
+种集成困难/不可能有几个原因：
+
+- 以相同方式强制处理低分辨率和高分辨率定时
+  器导致大量妥协、宏魔法和 #ifdef 混乱。
+  timers.c 代码围绕 jiffies 和 32 位假设
+  进行了非常"紧密的编码"，并且多年来针对相
+  对狭窄的用例（相对狭窄的 HZ 范围内的
+  jiffies）进行了磨练和微优化——因此即使对
+  它的小扩展也容易破坏轮概念，导致更糟糕的
+  妥协。定时器轮代码是非常好和紧凑的代码，
+  在其当前使用中没有任何问题——但它根本不适
+  合扩展为高分辨率定时器。
+
+- 级联的不可预测的 [O(N)] 开销导致延迟，这
+  需要更复杂地处理高分辨率定时器，这反过来
+  又降低了鲁棒性。这种设计仍然导致相当大的
+  定时不准确性。级联是定时器轮概念的基本属
+  性，如果不以不可接受的方式不可避免地降低
+  timers.c 代码的其他部分，就无法"设计出"
+  它。
+
+- 在定时器轮之上实现当前 posix-timer 子系
+  统已经引入了相当复杂的处理，用于在
+  settimeofday 或 NTP 时间调整绝对
+  CLOCK_REALTIME 定时器——通过示例进一步证
+  实了我们的经验：定时器轮数据结构对于高分
+  辨率定时器来说太僵化了。
+
+- 定时器轮代码最适合可以识别为"超时"的用例。
+  此类超时通常被设置为覆盖各种 I/O 路径中
+  的错误条件，例如网络和块 I/O。这些定时器
+  中的绝大多数从不过期，并且很少重新级联，
+  因为预期的正确事件及时到达，因此可以在对
+  它们进行任何进一步处理之前将它们从定时器
+  轮中移除。因此，这些超时的用户可以接受定
+  时器轮的粒度和精度权衡，并且很大程度上期
+  望定时器子系统具有接近零的开销。对他们来
+  说，准确的定时不是核心目的——事实上，使用
+  的大多数超时值都是临时的。对他们来说，这
+  充其量只是保证处理实际超时完成的必要之恶
+  （因为大多数超时在完成前被删除），因此应
+  该尽可能便宜和不显眼。
+
+精确定时器的主要用户是利用 nanosleep、
+posix-timers 和 itimer 接口的用户空间应用
+程序。此外，需要精确定时事件的内核用户（如
+驱动程序和子系统）（例如多媒体）也可以从单
+独的高分辨率定时器子系统的可用性中受益。
+
+虽然该子系统尚未提供高分辨率时钟源，但
+hrtimer 子系统可以很容易地扩展为具有高分
+辨率时钟能力，并且相关补丁已经存在并且正在
+快速成熟。对实时和多媒体应用程序以及精确定
+时器的其他潜在用户的日益增长的需求为分离
+"超时"和"精确定时器"子系统提供了另一个理由。
+
+另一个潜在的好处是，这样的分离允许对现有定
+时器轮进行更特殊目的的优化，以用于低分辨率
+和低精度用例——一旦精度敏感的 API 从定时器
+轮中分离出来并迁移到 hrtimers。例如，我们
+可以将超时子系统的频率从 250 Hz 降低到
+100 HZ（甚至更小）。
+
+hrtimer 子系统实现细节
+----------------------
+
+基本设计考虑是：
+
+- 简单性
+
+- 数据结构不绑定到 jiffies 或任何其他粒度。
+  所有内核逻辑都以 64 位纳秒分辨率工作——没
+  有妥协。
+
+- 简化现有的、与定时相关的内核代码
+
+另一个基本要求是在激活时立即排队和排序定时
+器。在查看了几种可能的解决方案（如基数树和
+散列）之后，我们选择红黑树作为基本数据结构。
+红黑树在内核中作为库可用，并用于各种性能关
+键领域，例如内存管理和文件系统。红黑树仅用
+于时间排序，而单独的列表用于为到期代码提供
+对排队定时器的快速访问，而无需遍历红黑树。
+
+（当我们稍后引入高分辨率时钟时，这个单独的
+列表也很有用，在那里我们需要单独的挂起和过
+期队列，同时保持时间顺序完整。）
+
+但是，时间排序的排队不仅仅是为了高分辨率时
+钟，它还简化了基于低分辨率 CLOCK_REALTIME
+的绝对定时器的处理。现有实现需要保留所有武
+装的绝对 CLOCK_REALTIME 定时器的额外列表以
+及复杂的锁定。在 settimeofday 和 NTP 的情
+况下，所有定时器（！）都必须出队，时间更改
+代码必须逐个修复它们，然后所有这些都必须重
+新排队。时间排序的排队和以绝对时间单位存储
+到期时间从 posix-timer 实现中删除了所有这
+些复杂且可扩展性差的代码——时钟可以简单地设
+置而无需触及红黑树。这也使得 posix-timers
+的处理总体上更简单。
+
+hrtimers 的锁定和每 CPU 行为主要取自现有
+定时器轮代码，因为它已经成熟且非常适合。共
+享代码并不是真正的胜利，因为数据结构不同。
+此外，hrtimer 函数现在具有更清晰的行为和更
+清晰的名称——例如 hrtimer_try_to_cancel()
+和 hrtimer_cancel() [大致相当于
+timer_delete() 和 timer_delete_sync()]
+——因此在算法级别上它们之间没有直接的 1:1
+映射，因此也没有真正的代码共享潜力。
+
+基本数据类型：每个时间值，无论是绝对的还是
+相对的，都采用特殊的纳秒分辨率 64 位类型：
+ktime_t。（最初，ktime_t 值和操作的内核内
+部表示是通过宏和内联函数实现的，可以在"混
+合联合"类型和普通"标量" 64 位纳秒表示之间
+切换（在编译时）。这在 Y2038 工作的背景下
+被放弃了。）
+
+hrtimers - 定时器值的舍入
+-------------------------
+
+hrtimer 代码会将定时器事件舍入到较低分辨
+率的时钟，因为它必须这样做。否则它不会进行
+任何人为舍入。
+
+一个问题是，clock_getres() 接口应该向用户
+返回什么分辨率值。这将返回给定时钟具有的任
+何实际分辨率——无论是低分辨率、高分辨率还是
+人为低分辨率。
+
+hrtimers - 测试和验证
+---------------------
+
+我们在 hrtimers 之上使用了高分辨率时钟子
+系统来在实践中验证 hrtimer 实现的细节，我
+们还运行了 posix 定时器测试以确保规范合规
+性。我们还在低分辨率时钟上运行了测试。
+
+hrtimer 补丁转换了以下内核功能以使用
+hrtimers：
+
+ - nanosleep
+ - itimers
+ - posix-timers
+
+nanosleep 和 posix-timers 的转换使得
+nanosleep 和 clock_nanosleep 的统一成为可能。
+
+该代码已成功为以下平台编译：
+
+ i386, x86_64, ARM, PPC, PPC64, IA64
+
+该代码在以下平台上进行了运行测试：
+
+ i386(UP/SMP), x86_64(UP/SMP), ARM, PPC
+
+hrtimers 也被集成到 -rt 树中，连同基于
+hrtimers 的高分辨率时钟实现，因此 hrtimers
+代码在实践中得到了大量的测试和使用。
+
+	Thomas Gleixner, Ingo Molnar
+
diff --git a/Documentation/translations/zh_CN/timers/index.rst b/Documentation/translations/zh_CN/timers/index.rst
index 4feec955dbc2..513143c5222d 100644
--- a/Documentation/translations/zh_CN/timers/index.rst
+++ b/Documentation/translations/zh_CN/timers/index.rst
@@ -16,12 +16,12 @@
     :maxdepth: 1
 
     hpet
+    hrtimers
     timekeeping
 
 TODOList:
 
 * highres
-* hrtimers
 * no_hz
 * delay_sleep_functions
 
-- 
2.34.1

