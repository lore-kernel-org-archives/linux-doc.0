Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D3D2BD022
	for <linux-doc@vger.kernel.org>; Thu, 18 Dec 2025 23:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766099844; cv=none; b=C+XzGk//H9sJqSFF88Wm2H8iT0fOVQplYsr3Ubop++M/LRINV8IvmRa20nIty27TqJUZntbuer1I+SJ6q6rEe10yfim+7mdUbjID3avATTgtrYjqbz0AqqoDwDrCcEhOAgekORqcMYhdRtChfDr/id3H8jwkuIT3w5KmzLl39PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766099844; c=relaxed/simple;
	bh=t32t+Say045W2ZnJImhVS3El6gX/oV3aGlI1JkpdlqI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VTQ0+zVU0Uz3aX+pEzzJEcOkYZ77krJfHWz0O/hTLij2HOqrInD4hZR2GR1sJRsfMu4spA5BnJWl4xdYoAhcHQ0qh2kUAiANCpO9wjpbf8S9rTmcngBbQBhpYCMi10k3wegNM8pmegaAmKUMPs3S8Aq0vDpsO2acoNdpU9w9GU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iXNQjp8b; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iXNQjp8b"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2a12ed4d205so10771615ad.0
        for <linux-doc@vger.kernel.org>; Thu, 18 Dec 2025 15:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766099841; x=1766704641; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pIGZ4+1yo4GhJdonLKpPnJlS4IBqaW870glag0SgTgI=;
        b=iXNQjp8b3i/VqxtR725Ys5d5OK0r0rBtlTEd/DQfxC8Yw8KeiZf2RWK6jNX1t4geny
         6POhNyjL/zG3RVpsOmphBTSuOA9fWS6SfHRm0ucrNV3WJaBUIIEfsfMbjcmVEqWHsZPH
         vs5nRFpHOOolmp5FMBuJ+A+GSDoUDQHjNNbLIE+6ko7535Ovlm3ysLib37yOqC/l8NDN
         NqzSRe+EQSQyh2CIN+4d4bP4hzw8H696kd2OyAHA1RYHSvnuGGzYrsAmZPLyj5nAW8WQ
         u99jrchaD5OMU67VTvrMdL9dX4Z55x38k2dEDgHD7tTH5ljhSLLuifwojqUJP/JHqxGQ
         MwTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766099841; x=1766704641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pIGZ4+1yo4GhJdonLKpPnJlS4IBqaW870glag0SgTgI=;
        b=jOXUyn81Fh4VNnSoU/ygwW+0ZGFbVGZdLrQFTFVu/hNn06PNWW4a/Wy6M4PgarRvGJ
         PxXLD6g6aiXj2UH/BKDOEM5x3RDCc3OU+Cakr4tG17S5+Valh5Rqtc9WpzEDFpkCNkNq
         oMLqh1puvJEGfy8J753n50Aeetu21tOolWv5E4o9MLJqdstuvTPqIQrkU2omuauSUfhb
         Blj5Tt9b+Dy5vEOAS1IKZBJXPr622rwb0dQfPZhbkM/a8y/oKJuXk2ZsSp+n4dOnTUts
         zWM1Sg1nOVdz7qtkWAHYo4uOvLY37Vc0Y8wIFeJg3W+5nNMwD5IZs+lnI58VshOo+vNR
         PNvw==
X-Forwarded-Encrypted: i=1; AJvYcCXZjUOZOv7wRMIZc3zejhrDqMSLdAUPP8xrzViIpxuvk4xjDrssEG0GBui+wRSeUmoGXNoNmCOqskI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0z2QdrNx68O3F4G/m2+DEovQweinihBD561unkoFUItvz1WnS
	b/ne6UEUo8xgGwa6rN+7S09rXn91wuirdtTm6GhRS5XgaewcU8vSswxM
X-Gm-Gg: AY/fxX7JHGW/pMUmzEXtdFCejTO3yz6Aex5T0BP3I/yCuiy/6zPPksWmdvOG4loTn/1
	imbZDm9UHwzLyRdwmtyFJZxfzA9hVpQObsBWiiNsV6izJaASyOBFbs9KH06JjhjhKGq5u/QJFsc
	X17/mefQgyJP3J7vxReztsSdElxUdGLOJAgIfQPwxtddUc0OX7i6kWOyjVTCxp+bdCetBj6G5ip
	qi4lA1oY9gP7LTJPaXUsQuaBZ75/SINLcK3X3YRlwIjgQ0PIvER1RzTzGkW9WK2n19GDQw6Ygv0
	uhLR8d3hly/auDCHkNUPF05LOIP+g1ZG81JPbLSdoDRiluTy5+1eTjOaCwHQp7T/lPBGJC9fI73
	7fWxO+QFmLWM65tv/kseauj673jV5bvwuzdZeqDuG5F9AOxl43bbfw9ZVqI4zQcLMWzohis27V5
	lcQbSlPrGbHqd6CJH/TSUhOE3eGKcGSaFCnspAN87i0w==
X-Google-Smtp-Source: AGHT+IFRKgTG9uERPsGGN5HbZiUgSdu6OuEn5gDbl7EKw2BhM3WsoJKj1wJcIg47OfN3kK13SrWRFQ==
X-Received: by 2002:a17:903:3c50:b0:2a0:9040:637b with SMTP id d9443c01a7336-2a2f2423178mr9737765ad.26.1766099840970;
        Thu, 18 Dec 2025 15:17:20 -0800 (PST)
Received: from Lingbou.localdomain ([113.225.44.231])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4cb48sm3311955ad.64.2025.12.18.15.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 15:17:20 -0800 (PST)
From: Xingqiu Xu <hilbertanjou83@gmail.com>
To: alexs@kernel.org,
	si.yanteng@linux.dev
Cc: dzm91@hust.edu.cn,
	corbet@lwn.net,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xingqiu Xu <hilbertanjou83@gmail.com>
Subject: [PATCH 7/7] docs/zh_CN: Translate timers delay_sleep_functions
Date: Fri, 19 Dec 2025 07:16:49 +0800
Message-Id: <017a9f9e9452610611a9a1e6a8bffcb5a7aafb38.1766099040.git.hilbertanjou83@gmail.com>
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

Translate .../timers/delay_sleep_functions.rst into Chinese.
Update timers/index.rst to include the translated file and
remove the TODO list as all translations are completed.

Update translation through commit 1f455f601e20
("timers/Documentation: Cleanup delay/sleep documentation")

Signed-off-by: Xingqiu Xu <hilbertanjou83@gmail.com>
---
 .../zh_CN/timers/delay_sleep_functions.rst    | 136 ++++++++++++++++++
 .../translations/zh_CN/timers/index.rst       |   5 +-
 2 files changed, 137 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/timers/delay_sleep_functions.rst

diff --git a/Documentation/translations/zh_CN/timers/delay_sleep_functions.rst b/Documentation/translations/zh_CN/timers/delay_sleep_functions.rst
new file mode 100644
index 000000000000..fbed7a060cf8
--- /dev/null
+++ b/Documentation/translations/zh_CN/timers/delay_sleep_functions.rst
@@ -0,0 +1,136 @@
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
+
diff --git a/Documentation/translations/zh_CN/timers/index.rst b/Documentation/translations/zh_CN/timers/index.rst
index 339e87e28baa..5983121dce91 100644
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

