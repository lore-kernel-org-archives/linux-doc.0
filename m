Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E2925B663
	for <linux-doc@vger.kernel.org>; Tue, 30 Dec 2025 19:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767121360; cv=none; b=dzu7CDHz2K4t2a+Xg1QbfWq00r7ZYXRgr+HG/zCFis5KHrDOzotUmSKxUVbu+5hkFEV3bne2XbSd8KBNyvwzHOVqmzmn4x6LMs+y4BghIardf8noUwo/eguYbUt5ZYJCd5Yp7Nc5oc6ph4lLq5MuwYAOETXY7iIL/jJhxdf85hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767121360; c=relaxed/simple;
	bh=uYFWnkjyIbHlE+dU0Xk9jLi8fYmKQr524gqMCsY3sH4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ayNF+SWFSAVcbxM3k4CQs+ZD+U6usi5wt4pWd3kXI5cVYANOsUqxPzC+CmlCiwQ9g/XG2fLoQ2YvWjDV4IV7Cc50Kce7UIXD5a7Q41DjGDYt3Q/7Y2b+W9rzKYe6uY4K5iZFOmxApxaNWKIF2+enEQ74Aug3NLbTFdoYgXNAcoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LIUyChpZ; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LIUyChpZ"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2a2ea96930cso117878015ad.2
        for <linux-doc@vger.kernel.org>; Tue, 30 Dec 2025 11:02:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767121358; x=1767726158; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HSZeD3LDvdHUl6wzdtsJ3umeGYbSA6RMvYJ0TsZzBv4=;
        b=LIUyChpZ0DMU9sTJ6GIrKsTXZ9AM0k4C0FIzxL0H4Ctc7oK+BRfeOhpbJDNDKPcOsh
         569r7TTWzt4p4WJlPBNHconJd7yVN27Q3A7LG9tHva3zrlXV9vYdTAUsoQTptwRqUF3+
         saubO5+t6aIDXtQTKu0pwhEkIddCcrxWBjCD9fn1qePfTJkW0iauiXTOyJNkR3qo9oji
         LI2b7LTaZl+Z2YJomHZkwwQL7T2uGsq6rEDX1JLLE55sjxYOsmMfb2tSXpoiPWvfdmBx
         NBZ4wOD0ueN0A5osxHbiJFs9QOheaKCzJfehYjY8WjNzyli9Mo4u8EbYiJoX62uWeBvr
         3y6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767121358; x=1767726158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HSZeD3LDvdHUl6wzdtsJ3umeGYbSA6RMvYJ0TsZzBv4=;
        b=Xbd7Xv8D92A7dSKFs0O9IXylZIBF9TW9y4O5cAeldkCctFduyA5IQEZF4hbIol88yY
         1/k4CEruq41TToTom3FeExhpfD3AQFueWsKkVWrHk6RRtKQwuaHDqkXUPtKL4eEEitzK
         bWBWeMOh/pzGLdofMzJIHK5KU9wKllJz/lIeyN3AUh9CWK83zHyD6CFGhHvMtEMZzAQQ
         enm7DUzdhWaoI+00DsUUS7ONnmI1mnYpxOtD/DRTQm5SX5vUoRhzH/+R0iRiEc0J3iUz
         S622K8yIfwDT+SN7nOB5I8mePgK2mrQd+Bt41D8LOna1xcnEdkS5M7R28JHREj5vJvoX
         c2Rg==
X-Forwarded-Encrypted: i=1; AJvYcCWEr3i9GDyBsQcQCebLmD2mWnxXlnuto7vA/2Fa9B0cLl0igOM7SZiYpBP+hFjm8PP7vbkiPaEauYw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcxFNdrQmIp7P1oW7JD+xolJgSaitlz2qqUj8Kq/y8ek2NnB6U
	X8mEGbSKRgVz0R0MN6BnKltbS4m/XTCR1e9cxXQuzkX5xOYrr/LWj25qQtTatoq+v54=
X-Gm-Gg: AY/fxX5DFxyA30nVv4EGINkwyS22hLnkX2zxGXDuzwbEsPIT1TRq2zrMzWOgZUGai2a
	0bJAl28tbuE3ZEsu+FxYojS3eg7xl2NSIRmhUvAuUQtb6wdM903x1fURJ6ZVkO+qfTQxLhPFPRG
	xJpb3q7/FWC3X4HCMfzm7hzDmRAjSlJ3Nxtn7eVqKo8gDWgz6coCDaaBWHtmYiXuvPusp4KeVeb
	FmVQA9ZJD9LPttWpsxGyhSLyU+n6L7YCe8tljzU37373L1g/0+e4T9MHI/nki9omcQHDxcBXjeZ
	sXIGi7Z2fYKgDpDS9nKncKVBzm3GDr0/QY3yhj/Ra40NhM7lul4TE0L7+NR51ti6CDpGPU8PEab
	K5pu80t6OxLpDXNoP0ldw0zU84gMFWOQH1XhxKI+Mt3AhfOSVB7TjLusHhcm0J7gdknQrp6fpRL
	bZ756wuTFJfI13T+1PSQ7JAEvKFKywDtGAQ+6QJpAjZQOG
X-Google-Smtp-Source: AGHT+IFSVXQgf7W31GxNNOPMV5CGFQxRuQY4VXcGukWFBgthMYbvHahvZSNPbgs69aFkX876zSEsag==
X-Received: by 2002:a17:903:3d0b:b0:2a0:c58c:fdd2 with SMTP id d9443c01a7336-2a2f2425808mr379185715ad.26.1767121358105;
        Tue, 30 Dec 2025 11:02:38 -0800 (PST)
Received: from Lingbou.localdomain ([113.225.51.69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c8d10esm302147655ad.42.2025.12.30.11.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 11:02:37 -0800 (PST)
From: Xingqiu Xu <hilbertanjou83@gmail.com>
To: alexs@kernel.org,
	si.yanteng@linux.dev,
	corbet@lwn.net
Cc: dzm91@hust.edu.cn,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xingqiu Xu <hilbertanjou83@gmail.com>
Subject: [PATCH v2 7/7] docs/zh_CN: Translate timers delay_sleep_functions
Date: Wed, 31 Dec 2025 03:02:12 +0800
Message-Id: <e6e5b25d48ddad02ad9de1679d789b2309e7307c.1767118457.git.hilbertanjou83@gmail.com>
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

Translate .../timers/delay_sleep_functions.rst into Chinese.
Update timers/index.rst to include the translated file and
remove the TODO list as all translations are completed.

Update translation through commit 1f455f601e20
("timers/Documentation: Cleanup delay/sleep documentation")

Signed-off-by: Xingqiu Xu <hilbertanjou83@gmail.com>
---
 .../zh_CN/timers/delay_sleep_functions.rst    | 135 ++++++++++++++++++
 .../translations/zh_CN/timers/index.rst       |   5 +-
 2 files changed, 136 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/timers/delay_sleep_functions.rst

diff --git a/Documentation/translations/zh_CN/timers/delay_sleep_functions.rst b/Documentation/translations/zh_CN/timers/delay_sleep_functions.rst
new file mode 100644
index 000000000000..c3695f24d1a0
--- /dev/null
+++ b/Documentation/translations/zh_CN/timers/delay_sleep_functions.rst
@@ -0,0 +1,135 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/timers/delay_sleep_functions.rst
+
+:翻译:
+
+  徐兴球 Xingqiu Xu <hilbertanjou83@gmail.com>
+
+==============
+延迟和睡眠机制
+==============
+
+本文档旨在回答一个常见问题："插入延迟的正
+确方法(TM)是什么？"
+
+驱动程序开发者最常面对这个问题，他们必须处
+理硬件延迟，但可能对Linux内核的内部工作机
+制不是特别熟悉。
+
+下表粗略概述了现有函数"系列"及其局限性。
+此概述表格不能替代使用前阅读函数描述！
+
+.. list-table::
+   :widths: 20 20 20 20 20
+   :header-rows: 2
+
+   * -
+     - `*delay()`
+     - `usleep_range*()`
+     - `*sleep()`
+     - `fsleep()`
+   * -
+     - 忙等待循环
+     - 基于 hrtimers
+     - 基于 timer list timers
+     - 结合其他方法
+   * - 原子上下文中的使用
+     - 是
+     - 否
+     - 否
+     - 否
+   * - "短间隔"上精确
+     - 是
+     - 是
+     - 视情况而定
+     - 是
+   * - "长间隔"上精确
+     - 不要使用！
+     - 是
+     - 最大 12.5% 误差
+     - 是
+   * - 可中断变体
+     - 否
+     - 是
+     - 是
+     - 否
+
+对于非原子上下文的通用建议可能是：
+
+#. 当不确定时使用 `fsleep()` （因为它结合
+   了其他方法的所有优点）
+#. 尽可能使用 `*sleep()`
+#. 当 `*sleep()` 的精度不够时使用
+   `usleep_range*()`
+#. 对于非常非常短的延迟使用 `*delay()`
+
+在接下来的章节中可以找到有关函数"系列"的更
+详细信息。
+
+`*delay()` 函数系列
+-------------------
+
+这些函数使用基于时钟速度的 jiffy 估算，并
+忙等待足够的循环周期以实现所需的延迟。
+udelay() 是基本实现，ndelay() 和 mdelay()
+是变体。
+
+这些函数主要用于在原子上下文中添加延迟。请
+确保在原子上下文中添加延迟之前问自己：这真
+的需要吗？
+
+.. kernel-doc:: include/asm-generic/delay.h
+	:identifiers: udelay ndelay
+
+.. kernel-doc:: include/linux/delay.h
+	:identifiers: mdelay
+
+
+`usleep_range*()` 和 `*sleep()` 函数系列
+-----------------------------------------
+
+这些函数使用 hrtimers 或 timer list 定
+时器来提供所请求的睡眠持续时间。为了决定使
+用哪个函数是正确的，请考虑一些基本信息：
+
+#. hrtimers 更昂贵，因为它们使用红黑树
+   （而不是散列表）
+#. 当请求的睡眠时间是最早的定时器时，
+   hrtimers 更昂贵，这意味着必须对真实硬
+   件进行编程
+#. timer list 定时器总会存在一定误差，
+   因为它们基于 jiffy
+
+通用建议在此重复：
+
+#. 当不确定时使用 `fsleep()` （因为它结合
+   了其他方法的所有优点）
+#. 尽可能使用 `*sleep()`
+#. 当 `*sleep()` 的精度不够时使用
+   `usleep_range*()`
+
+首先检查 fsleep() 函数描述，要了解更多关于
+精度的信息，请检查 msleep() 函数描述。
+
+
+`usleep_range*()`
+~~~~~~~~~~~~~~~~~
+
+.. kernel-doc:: include/linux/delay.h
+	:identifiers: usleep_range usleep_range_idle
+
+.. kernel-doc:: kernel/time/sleep_timeout.c
+	:identifiers: usleep_range_state
+
+
+`*sleep()`
+~~~~~~~~~~
+
+.. kernel-doc:: kernel/time/sleep_timeout.c
+       :identifiers: msleep msleep_interruptible
+
+.. kernel-doc:: include/linux/delay.h
+	:identifiers: ssleep fsleep
diff --git a/Documentation/translations/zh_CN/timers/index.rst b/Documentation/translations/zh_CN/timers/index.rst
index 17f35d87645a..a939d54fd539 100644
--- a/Documentation/translations/zh_CN/timers/index.rst
+++ b/Documentation/translations/zh_CN/timers/index.rst
@@ -15,16 +15,13 @@
 .. toctree::
     :maxdepth: 1
 
+    delay_sleep_functions
     highres
     hpet
     hrtimers
     no_hz
     timekeeping
 
-TODOList:
-
-* delay_sleep_functions
-
 .. only::  subproject and html
 
    索引
-- 
2.34.1

