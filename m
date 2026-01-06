Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0AA3491E8
	for <linux-doc@vger.kernel.org>; Tue,  6 Jan 2026 19:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767728871; cv=none; b=a7a3SOEGVsLnvnFGzjWzEQK1xhvyCj/bayz1WFL0fRcwF9ERz65a4JUkkRR0PW6bxedI+bhk+48a3Q4CIJF6osuBNw5X0beVYAu0diZSM3mbdwmdMJEZAvVhLruU2rHqy6hKSUEc4BbY1qusDFZ14yI45CnuGk97HRzj6sAuZno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767728871; c=relaxed/simple;
	bh=f3HNK6FcOluK7y3RxtErAAEPX4r/74rUQBrlFhekpy4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Qf2/Vch5ceoX8Zv9hAzxgsEl/pTYDL0ko013eju3Ag7u33qk/aT4SB+cGn0gHPSxxHeDQ8BV8/4QWAzu6YibCkUP/kSi25t6ZWApNcfAhZp9bXNRzRZKqlQT4HH+SZ5Tyaqez9HR6m8Xk00vf1Rka4ajrwMaSeTbXCcdnOnN+T8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i+j2wBMf; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i+j2wBMf"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7b8e49d8b35so1493454b3a.3
        for <linux-doc@vger.kernel.org>; Tue, 06 Jan 2026 11:47:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767728869; x=1768333669; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hivfveq8/tYAl6kEfXSDWaxSEAf6KowW7Mp2zrmIYGw=;
        b=i+j2wBMfik0vHaE0auxFGHU/ud12W71Rf8xgHZJuM3sR2Yw6VOF3YcTPTiRs7MxoRj
         8w2IFpx10uS6asct0QqUQbrRf3dzTA2JO58+MdBw1U3N8bS9IRzcx61RSZ5/mShnSjGQ
         kfGfdmKXdSGFIS/adb+YFTPfaNi92lI/+iQ+msGJfnvE1t5qqxXHVKVbkRwCspPkUTzH
         lzNoZv46BvznlLWChC4eCfMH8cDsbQkDuOnK/YirXTNs4TWOaGVTUVDCsUonEPUVaMsp
         V0pdmCN26IzwBDabl/168oBNafdlXRGzIAL1EAcOpWE2UFOlgVrPw7Z668giRBaQQ34G
         +WmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767728869; x=1768333669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Hivfveq8/tYAl6kEfXSDWaxSEAf6KowW7Mp2zrmIYGw=;
        b=tEcnQspfm6ypK/gbQz8Fyfbj1o5tp+VLLKvWrIm/PLWCuvhEursmaIk9n5OEei7cNG
         B8LYzXuVak4IkP5Cm0asG0uBzHnDv3A6+jF8OmR81TAkdwDW4O+ErMZHMvmeBs/kQNLp
         FWQ+I/2w7Ana5KSs3Hanf5AxZzEcQ08j1w045eSFMP2LCGRitGmeWrZL39bGinwUnttw
         4yFJLH7D5zrYCk7681Zz9+TUXDBatF8HsZr2co5JD86K6jM6ykSMhYtdkLyA4idmDhho
         rj4VUznAnFEdlX7mzUMiGcD7mtPPZ0+dd5UBF9gDt7WBccom6kl2iYuo0MC4V/gzk8MT
         824g==
X-Forwarded-Encrypted: i=1; AJvYcCUgGBvuQ+F77lJmd5lKfyWqz5bC0WD42boNh+3bKVj1yICisP/pjhpnQsMudVinZDJTinNx+rSrsSU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXcooOIwjl4I+dRs4R+gzGgEH2BmFVdk9Y0lD2CbPnHaL8qECi
	gh8oeDiJGBjbxQl7+YsLA9eDljex5HIv4p3m3dttOq1Z25ucyDg3XQJD
X-Gm-Gg: AY/fxX6c7IoERZBFSx3cN5V32ahlIJWXNzy8IpLbSQc1SbA4Gi1hRQw+Xay4Pop+52b
	mv+/HkfERZILN95zpuyou+6YEwN+G2iXL7CVElmh8GIeq+BY3ZJtgVjhA6clzi84ecIh4deOaDy
	8CgE5++VRcF9D6yIGTOS6rWi6yituq1g1rx/DZr4/Wsk+cWeCL4Ift4TAXaNEpAvCqMQrZ1qW5E
	/IE62aKj0zvY5+2yKSy07qZt/GNFc2H8Yt0tZsLjcDhOz499ETVtl9u3tgpjHaZUGJPUD0zCsF8
	RoPDB90xzGsl/Bl5jkzA7x9lKw3UlDci8jcBpmJtXTaKKNALtOmsQwdrnQWliSKLiD6RHTux9yI
	bdIvCgCKIrXQTZ3RNgdUKnhKqBbEgSdSvhd2X3+P4HFD9NwKmil/+dlTYNWdvPUIYCMRZ/PzFW7
	ydf04Ny9VE038mCE4Q+lvTYr3x02GzxSelSEsd5p7F
X-Google-Smtp-Source: AGHT+IESGhwx6MIRV4RvHszWbmrKx0fzzZbVLvQsf5L3yznRxciZTM7Xy2ngfVukYOCLYTrgj2a+Gg==
X-Received: by 2002:a05:6a20:12c6:b0:350:7238:7e2b with SMTP id adf61e73a8af0-389822c19edmr3576236637.16.1767728868927;
        Tue, 06 Jan 2026 11:47:48 -0800 (PST)
Received: from Lingbou.localdomain ([113.225.51.69])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cc8d292fcsm3036722a12.20.2026.01.06.11.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 11:47:48 -0800 (PST)
From: Xingqiu Xu <hilbertanjou83@gmail.com>
To: alexs@kernel.org,
	si.yanteng@linux.dev,
	corbet@lwn.net
Cc: dzm91@hust.edu.cn,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xingqiu Xu <hilbertanjou83@gmail.com>
Subject: [PATCH v3 7/7] docs/zh_CN: Translate timers delay_sleep_functions
Date: Wed,  7 Jan 2026 03:47:20 +0800
Message-Id: <2cdd84d575e230094c96dd56b720c15e72145c46.1767725479.git.hilbertanjou83@gmail.com>
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
index 000000000000..3ae2d3c43687
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
+相关函数请参考：
+
+- :c:func:`udelay`
+- :c:func:`ndelay`
+- :c:macro:`mdelay`
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
+相关函数请参考：
+
+- :c:func:`usleep_range`
+- :c:func:`usleep_range_idle`
+- :c:func:`usleep_range_state`
+
+
+`*sleep()`
+~~~~~~~~~~
+
+相关函数请参考：
+
+- :c:func:`msleep`
+- :c:func:`msleep_interruptible`
+- :c:func:`ssleep`
+- :c:func:`fsleep`
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

