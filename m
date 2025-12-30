Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2591A21B9C1
	for <linux-doc@vger.kernel.org>; Tue, 30 Dec 2025 19:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767121349; cv=none; b=gQ7tZ0uY4mVxA26WyuZwuFZbJLiNTFVerz6Ov1Qu3Y9OBG8s1N9xCNULC3a7pKU29g/bhM4nqW3F0/f9MET6iLLj5beyAW6uMZNUubxmyBrRSlI0LJciKr80j6uFmSUAn3Xx5vPD1ix3I/y1oaL8ujIdQkaUHcwYT1/Q8Wrm+WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767121349; c=relaxed/simple;
	bh=qBQQu40azqHWfpS6VGvcjlZzUc0v6mkKHQVnOSpx//g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XACyrUpY38QhgojWU/q8BeePPUDBggCk/lL95mpeNnh4RDgQJV2GPAagpEv+uIxY5Jk/a7cObUqkz6bsMZY8MT5+JQKWorwcEaEjSv+zUAu/MTvrkYGRSVcJxJkp45oMlFCVR45kswAYkc6FUqWw7Jjha7mOsn4b2xcOieJIOy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bYInV/JU; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bYInV/JU"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2a0ac29fca1so86489655ad.2
        for <linux-doc@vger.kernel.org>; Tue, 30 Dec 2025 11:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767121346; x=1767726146; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gz3ahXUf6eqGsh5sD4UlN3eX8e+QLFsPZdONCxzjpLo=;
        b=bYInV/JUkovVLGMB4tUV1F4qK9VHD5x/V8Q1kQD3HNgDT10wyEE90Ok8FahsiRYJXA
         KAazj207oaNmHtqERkQIYqBqnuoffFgXHUNfCoVZkUzrfdWOwoVYAmkb+5BrePjqowKG
         THVa6cuU0FImbZ6LFLTGPwinaQKcEzeoqqkiIesK0y7gG7mAOcbEx1RnTdmZDXCb9Z1A
         3s3Hl+dAXXztpgScwx+3i9UZk2cvv8yWnaCfmzjMvEmRla1Wd/XrBu1e1mnjtqCJSHls
         0397Ft9gdIUGY2n9P3hoqMlOb610JiXIovYKE8hdrIrc23iro5Rt64CVLexCBFZitbwq
         fE5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767121346; x=1767726146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Gz3ahXUf6eqGsh5sD4UlN3eX8e+QLFsPZdONCxzjpLo=;
        b=OXHK1dlRTfFYtf7xSpsWN6w2fWzY2EKRusMXuBv3PTSlmHXe3xN/1HwnPNU5liy7Ao
         h0/7N3Vvyq5g9xhvFvXduRcL04KS6Jm5qxoDtlTyT2OmXtS5XuBraNfH0nZrCBlf0ru+
         OQsxA6ig86JTh9w6P4v2OGKazLRyvq8PsikN4O3sDEiyBR6YITiF0AkAzQoImzFlGK2x
         p9UYuDEm/EApSnpSo7+7SCQtcTfQv0Hm5lsjQwrLQ3LYip7dBCzGcHz/vb3F3droyh9m
         6OTz1CINUucQ4DOg95wXmIyNzVKDTJWH2/L/biqW0i5UUXwqzJoP3vjNW4xQI58ZTsoc
         K+0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXiw6PHXkisxxo6Du6va9GmDvoxI8mqbd5jIDDX76HkA2H4+5tBWJ3yFwN+HUJJYZqxdWbjlgwUgCk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhA6cRQ1MAApyww93SVx9bggV+/SVQkR55gnZh5g4U6dOyALde
	pxj+LjQN1f3jPRBOegulMxZKyB7DmC/1CjEorbwASxI6l0lSFCSXsROj
X-Gm-Gg: AY/fxX7IdE4GkKfRoGbgE7wKAyUz4TIDK4KNkQEhd1peVJM6zpDbE6i2pXnKV8wSMn+
	4PP16RDZNhMIjwaGVFTb99jcY5B6tEav7PgdNkEmkiVHHERr5B31lVuTjyo5oNaY5bqOhxHbgDC
	7qrRhO1lvphn9C0u/qZP4o6EBIU/su+bKLemU9g5yvQUNupBPEEJqanaNyboiqAtC95LHHbOJxi
	28Oj7RJdtGY1ZfcFjnjs0Kb6WT4AKJwmUhQU+NPwqwTDhrSv89hDPLGqiT1+0ehwq//PCpsxqNo
	NjWUmq7XvCmW3H5N17I63OgmlMh7ipvAL7fNB4ZAA62YQOwuTPSMXA7EFb9IW+ybqGQbba9EGso
	qTXqgbaXMLcDfbL137wb2xwZvf97+J97M7lGCWDuXLK/CetC0mVGFL8kQuDxjwtH/qsxuRbWf9P
	gvysGVQsOXrA4+CFTyhKRnRHIROwu1RYuoPd2OQFgn
X-Google-Smtp-Source: AGHT+IEtZtuodZGi4sXBtMOBjHz4klt39MA11IfsrODO6K575L5RUkcC+MVYG1Xs0xiCt3rJzUoa2A==
X-Received: by 2002:a17:902:ecc8:b0:2a0:a4b7:44af with SMTP id d9443c01a7336-2a2f232bb66mr276563265ad.26.1767121346342;
        Tue, 30 Dec 2025 11:02:26 -0800 (PST)
Received: from Lingbou.localdomain ([113.225.51.69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c8d10esm302147655ad.42.2025.12.30.11.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 11:02:25 -0800 (PST)
From: Xingqiu Xu <hilbertanjou83@gmail.com>
To: alexs@kernel.org,
	si.yanteng@linux.dev,
	corbet@lwn.net
Cc: dzm91@hust.edu.cn,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xingqiu Xu <hilbertanjou83@gmail.com>
Subject: [PATCH v2 3/7] docs/zh_CN: Translate timers/hpet.rst
Date: Wed, 31 Dec 2025 03:02:08 +0800
Message-Id: <c1504ef8f30bf0fa3195246e481d1f4cd009fd8c.1767118457.git.hilbertanjou83@gmail.com>
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

