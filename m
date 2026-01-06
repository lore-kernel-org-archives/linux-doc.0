Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F07F934404B
	for <linux-doc@vger.kernel.org>; Tue,  6 Jan 2026 19:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767728858; cv=none; b=qPVdPU7bT8Gzx/a60bT20bxbf9hvF34hu/i84OwiqPlM8B+S2wyf6PyXJ5GZ5XCqrTNF1Ofg9GYvnD5kpveOYS/Fsggto8nWBsAR16qeuBy9yJ2CC0x6Z0h9iYWseTeVWjouLJLLMZ9J0gVsP4i8e0FGd79idQBmXmKJBQAvsMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767728858; c=relaxed/simple;
	bh=qBQQu40azqHWfpS6VGvcjlZzUc0v6mkKHQVnOSpx//g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F/vlNQa0VZqR6ins4g8QSfqC8AQBz457K37ngSFU3whaqK7yqc8tbqqshY10iHlW+JyklCoPOvEEdmAAlahqihzc8eTW5tg6OseXygfVhukV0CGDsRR/1tds8Mq/RUSqNhvnQmLmet38EHuj1RqDKNwBLv8MHjLLi/8eSrWpdzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e8EUFkzi; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e8EUFkzi"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7f121c00dedso1481507b3a.0
        for <linux-doc@vger.kernel.org>; Tue, 06 Jan 2026 11:47:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767728856; x=1768333656; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gz3ahXUf6eqGsh5sD4UlN3eX8e+QLFsPZdONCxzjpLo=;
        b=e8EUFkziIZ7bgVLolTKRmutjMnS+wYDPrJxlhf+O91WohcFYpBxYtqPiQoJDa9ezcE
         ecvgOekZXC3uOj/CQIt8sg2rzCtVloWzf22lpjOk6TcAn8h+iDJ0vSrnUp26b4luOM0t
         opHIPvc5Gjkz5aiLmHqgmPvlVMkPcOQvga4eAWiRdVyFBjj6JPKNs+jZ+O/R0FUrHyws
         n5h5Y4nh5IyCpuENECoAKWTBjuK3FEFasnkLVqbLlXzy29vLHBxl4fWYAwJnWk51J+U5
         rnqly1NNlpyQ3HLJJ26myEHDwwGa6DvUTmac2KGZkqtkX4IMvz2X8lqqYOZHjyJbYp6a
         OmkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767728856; x=1768333656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Gz3ahXUf6eqGsh5sD4UlN3eX8e+QLFsPZdONCxzjpLo=;
        b=mkpKelAE0LZfQ8F7ab2XUUGSGpTfDkyFqgFK8coocMADNkQa+Q47gWRHbIg3AMaHTk
         uhMqjzzEmkQjT+nZwtxG636fXIfvlqRG7f5xa53CKD9qTmM8i9xTSqZ4IYzmb1DVP0s+
         brMkU3zJHO44sSYfkDxDL5Mxt+uOeJIJjh1F2gz6nG598Rrxt1qJCj0G0dMPp6lECx4l
         EgYFiraF93xmXVpikoy46hjwkEHcpHwa9Qo0lcZs0ulGjBZ7AUkO1UTD1DjQpD93/Q0e
         6RqrOVlu3qfzH/ukOwSYGl5LEPfyMj/uQ49vQ657bX78zYD+mdiZ9jiooC3cWoFRFLgT
         u6sQ==
X-Forwarded-Encrypted: i=1; AJvYcCVv9cQ82wz38ircvCaHp1t+ok7Yz/49I+tCGJd6Z85SpdnfqlYdvfv/Wk0r8yBWw719OvAq9V+1FaQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm9Z+j+36RtueSkUEbunaUjZ+LqOJC1q+H+/F3rsm/hJQvIfDH
	IvToY5o8WY+McVscaxwQnJGNUYZXkBSRFLdVefX2owvsSJzca/wgRE6K
X-Gm-Gg: AY/fxX5kGmN0RdX0u7UrSmqhM5mnOpHZPYrEwGFWvLvIkjlEM4B/XgkIgFgCU+Qd9kO
	z4wQrrElwYEx3E0Qwd8yCJiyn0E1BMVC83bqDxQvxasz1TYTSZHbR3Sj7nZk5UdOnLvFszqJsGi
	xpmgijJvF9ubRX1r4wPLoJ0qg1XgMWnIO79sC3xMAroq7HNXpLX0fE3IZkEP5Fl1GdhBmv7AHMD
	8r31/flzKKCzwczeJy3zHKxiy99wtmaYQOmS+HXwwbR83zaoEt6Nwt7FkJC9Oh/dQvasW+oHe0Y
	V/Js41vAH8KX6/srYHQLIDgH/BswaNpHt+imhYjaWhucHh82Cu5VPopOSsNr6wAAkSWZpJZ9F4+
	qNr/Uz496dWSzqzRExfJbGK8zlmvYDI8TMcUiR3Eax4NUgH7aP5/ZjIoo9bJtJRsbmz6UWaR6He
	Exrqnd5RtxUjQ21Yls1OTuFD/IYcvPG2uSeGMJcz3y
X-Google-Smtp-Source: AGHT+IEaIleTNGMixpSGjFs9YtQaIxUGr3wlYU4Hz1OxLHlYgGSP2aLlKJfgFkLf4grJpebHtH+xaQ==
X-Received: by 2002:a05:6a20:94c8:b0:34f:1623:2354 with SMTP id adf61e73a8af0-3898237bed1mr3954626637.42.1767728856126;
        Tue, 06 Jan 2026 11:47:36 -0800 (PST)
Received: from Lingbou.localdomain ([113.225.51.69])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cc8d292fcsm3036722a12.20.2026.01.06.11.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 11:47:35 -0800 (PST)
From: Xingqiu Xu <hilbertanjou83@gmail.com>
To: alexs@kernel.org,
	si.yanteng@linux.dev,
	corbet@lwn.net
Cc: dzm91@hust.edu.cn,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xingqiu Xu <hilbertanjou83@gmail.com>
Subject: [PATCH v3 3/7] docs/zh_CN: Translate timers/hpet.rst
Date: Wed,  7 Jan 2026 03:47:16 +0800
Message-Id: <c1504ef8f30bf0fa3195246e481d1f4cd009fd8c.1767725479.git.hilbertanjou83@gmail.com>
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

Translate .../timers/hpet.rst into Chinese.
Update timers/index.rst to include the translated file.

Update translation through commit 458f69ef3665
("docs: timers: convert docs to ReST and rename to *.rst")

Signed-off-by: Xingqiu Xu <hilbertanjou83@gmail.com>
---
 .../translations/zh_CN/timers/hpet.rst        | 43 +++++++++++++++++++
 .../translations/zh_CN/timers/index.rst       |  2 +-
 2 files changed, 44 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/timers/hpet.rst

diff --git a/Documentation/translations/zh_CN/timers/hpet.rst b/Documentation/translations/zh_CN/timers/hpet.rst
new file mode 100644
index 000000000000..6ed46220e12e
--- /dev/null
+++ b/Documentation/translations/zh_CN/timers/hpet.rst
@@ -0,0 +1,43 @@
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
diff --git a/Documentation/translations/zh_CN/timers/index.rst b/Documentation/translations/zh_CN/timers/index.rst
index c1e178484f96..bf63a69ca71d 100644
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

