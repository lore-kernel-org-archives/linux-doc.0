Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75DA322F77B
	for <linux-doc@vger.kernel.org>; Thu, 18 Dec 2025 23:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766099830; cv=none; b=obo3iuOhUBWHbG2ITrjOha1PXgCVHTplxjTaU7cFOOnWINk4y21r1L6ZO2+zk+Y0v1Zz/8RIqNPMFQY/shUI9kKMV/ds08YYhbvBdTn3E3XKcbP3e8xg3S2JbK1xCRDxVUGGKC3yu26785ZOZoQMR4TOeTzc3EzVyEpkyca/rd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766099830; c=relaxed/simple;
	bh=oQA+TEWFzRDKlBHAX1UEfwLM/pqhhN0QzSPdry5Kpl0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X+f2X2yn7OAzQwb2LgCHOE9C/yUGAdSVWZBN5kw14wNow3lveh0thrths9kc2jSKnNd2h9TYh7xk49tfJsJZ2QXsYMhypoZGncrtuex7/a3y8J97hrqW+ciXp5VfYPynC8rwhdkljTNf5wCpABdmTglY1wm0oFJMJQ2s4yarZSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZDIW1rLg; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZDIW1rLg"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-29efd139227so14999725ad.1
        for <linux-doc@vger.kernel.org>; Thu, 18 Dec 2025 15:17:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766099828; x=1766704628; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/RChEknkLKEzUR6d3iOnPtAuiS1CV4I8TRyxCHVs/lQ=;
        b=ZDIW1rLgX7dLxl3jAwK3y2eAfcPXqqCvgajCkmJa6ZeHpBcO3lKgUoeKLGD2kEFk52
         CNxd5dBySKCnLPALvVX0oaPUINGNTZPjflmXWDpCkUjH1Uesx+tb3NcV0OSh9789jlOG
         QzWYHCZlb4iHJpUWjMdXLpZMwC9anDQoCH/u5MuEZ4EMtEmFd2Lm31NmGssV/IZDsSrn
         D/VmgQj0XlWwvA91ct6xsicuUHuqS/pC3nsilza4jpB8zU2auOFaigfoBN88xKfj7hpS
         GLH49Z33i/QhUDHD0SFM3rfqUYFRRZkqfeL04dfOeFZ2OGC53WzmjOR4QvnQySoI5I8G
         LVDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766099828; x=1766704628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/RChEknkLKEzUR6d3iOnPtAuiS1CV4I8TRyxCHVs/lQ=;
        b=QdAoCQzeDM3xKYZOYKR0SsH0LWtWCOWnEn1pg0LnTLbXVmGzcap1dy/VBiF2wXULUX
         ilWJH0tQEGc6aLajMnwpJ0TJLmtOCgEgtpiLKlUD/F+D9tTz4kXOqKb6j3UdIsXmY2IQ
         dfAZazswE+POlibLFyhrm8PjnOk7FF+AtLNLJYfKGM+wZrJGWxErz0i3/5lyZPVS32QN
         GXv9dYueRpg3DhE+No4Vut9a/iPo2iRVR9ADnnTqy7V/L4uPzZWc982QA+N83pQEOYeT
         xpLzdOYInG1dcjLNPL3cx+HWRr4wuOEu5ERL55dbhP44YFRbLmsLqXSEc3bRLL3AJUAZ
         ICSw==
X-Forwarded-Encrypted: i=1; AJvYcCWe0bX4Gqe7jNX0u6H2WbKyqcVzzekPfGuAKZNKjU8HYRvAqhqTSi09ME5rmRakdCROYVxWv6ZVBRQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2iMBUoFD6+hzuJoJZe/VO67ieFt35DjeNdCAx2ZTON4ynyFj1
	++9BL5az+lmD4dblr+VZkQ8C275qmRT8wXti04PnRHqdDLPz8GwZlfjs
X-Gm-Gg: AY/fxX4fuu+KI1u9+YlenW7J5k/DLLbq8YmIxnF25/+7AMebJ1K+isY5YoBehMy3m6F
	BaNdzvPM23Q8OQGLMITA2OSlFdDq7ULFbms/mW/ffdlmolVRsXb4IgU92TBqGNzl2qmfrJnljV/
	EdTt9xaahE5bsbdG4chCqA5ojQEE4pj8z+juGHmBiSiR38beC9gDfvGxlRQO9c2hqZxt677TMdk
	e6drUYHPw+afgr7vuWg+iwvV2dNjLOmFINlLvBW4j0WLl2l51yFx/pzZ6Mc0gQATYUzvmZmfhok
	v0RpiN4uz4OoR3hiI+7wX3FzjGVgYomemT9TJdNS+Z1LS7axzKG3SIVf2mYyrd93sJAibjdDI+7
	0j4ReOI2yPOmsGmrGLXX5JyFWa4EwUL4yrWXt2ySiIb8KMSEhbQYr5Il3jBffIOGoHZ5+IAar5h
	CNFCxBlKAcKnevIoYKDI308Tcirxi0MXh0nygn1bubHt3pwg==
X-Google-Smtp-Source: AGHT+IFUTEa1Ut1pLeq+DQMRTBj7zaR1VPqEgKmm388X9tsgmFStuIFywkAs5/b0NupopgDaExUPvg==
X-Received: by 2002:a17:903:3b86:b0:2a1:1f28:d7ee with SMTP id d9443c01a7336-2a2f293e0d0mr7522775ad.57.1766099827409;
        Thu, 18 Dec 2025 15:17:07 -0800 (PST)
Received: from Lingbou.localdomain ([113.225.44.231])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4cb48sm3311955ad.64.2025.12.18.15.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 15:17:07 -0800 (PST)
From: Xingqiu Xu <hilbertanjou83@gmail.com>
To: alexs@kernel.org,
	si.yanteng@linux.dev
Cc: dzm91@hust.edu.cn,
	corbet@lwn.net,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xingqiu Xu <hilbertanjou83@gmail.com>
Subject: [PATCH 3/7] docs/zh_CN: Translate timers/hpet.rst
Date: Fri, 19 Dec 2025 07:16:45 +0800
Message-Id: <f1738b7b1b7458c6acf92d70eea88b3de8b30c9e.1766099040.git.hilbertanjou83@gmail.com>
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

Translate .../timers/hpet.rst into Chinese.
Update timers/index.rst to include the translated file.

Update translation through commit 458f69ef3665
("docs: timers: convert docs to ReST and rename to *.rst")

Signed-off-by: Xingqiu Xu <hilbertanjou83@gmail.com>
---
 .../translations/zh_CN/timers/hpet.rst        | 44 +++++++++++++++++++
 .../translations/zh_CN/timers/index.rst       |  2 +-
 2 files changed, 45 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/timers/hpet.rst

diff --git a/Documentation/translations/zh_CN/timers/hpet.rst b/Documentation/translations/zh_CN/timers/hpet.rst
new file mode 100644
index 000000000000..0cad0daa5c00
--- /dev/null
+++ b/Documentation/translations/zh_CN/timers/hpet.rst
@@ -0,0 +1,44 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/timers/hpet.rst
+
+:翻译:
+
+  徐兴球 Xingqiu Xu <hilbertanjou83@gmail.com>
+
+================================
+Linux 高精度事件定时器驱动程序
+================================
+
+高精度事件定时器（HPET）硬件遵循 Intel 和
+Microsoft 的规范，修订版 1。
+
+每个 HPET 有一个固定速率计数器（以 10 MHz
+以上运行，因此称为"高精度"）和最多 32 个比
+较器。通常提供三个或更多比较器，每个比较器
+都可以生成单次中断，并且至少其中一个具有支
+持周期中断的额外硬件。比较器也称为"定时器"，
+这可能引起混淆，因为通常定时器彼此独立……这
+些共享一个计数器，使重置变得复杂。
+
+HPET 设备可以支持两种中断路由模式。在一种
+模式下，比较器是没有特定系统角色的附加中断
+源。许多 x86 BIOS 编写者根本不路由 HPET
+中断，这导致该模式无法使用。它们支持另一种
+"传统替换"模式，其中前两个比较器替代 8254
+定时器和 RTC 的中断。
+
+该驱动程序支持在驱动程序 module_init 例程
+被调用之前检测 HPET 驱动分配并初始化
+HPET。这使得使用定时器 0 或 1 作为主定时器
+的平台代码能够拦截 HPET 初始化。可以在
+arch/x86/kernel/hpet.c 中找到此初始化的示
+例。
+
+该驱动程序提供了一个用户空间 API，类似于
+RTC 驱动程序框架中的 API。示例用户空间程
+序在 file:samples/timers/hpet_example.c
+中提供。
+
diff --git a/Documentation/translations/zh_CN/timers/index.rst b/Documentation/translations/zh_CN/timers/index.rst
index ae40f8b91346..4feec955dbc2 100644
--- a/Documentation/translations/zh_CN/timers/index.rst
+++ b/Documentation/translations/zh_CN/timers/index.rst
@@ -15,12 +15,12 @@
 .. toctree::
     :maxdepth: 1
 
+    hpet
     timekeeping
 
 TODOList:
 
 * highres
-* hpet
 * hrtimers
 * no_hz
 * delay_sleep_functions
-- 
2.34.1

