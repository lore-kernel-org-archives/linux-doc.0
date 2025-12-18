Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2881A2673A5
	for <linux-doc@vger.kernel.org>; Thu, 18 Dec 2025 23:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766099824; cv=none; b=h59mxdPWycTkiLhNKHxK3iVfvat1UPDKWZJDyP08CSy6mROqARSMCJDO1CE5wmX/I5ANnYwud0NH7HwM64H+e6ZmJBhMYXAL0YmXVoiT3ZKlLbyr+uEHp4bDDJkbjEAVLNU362TOjPhWAQW+jaOtxwVuFESzOWt9rbzdMJG9V4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766099824; c=relaxed/simple;
	bh=RLmCV+OvagHoUUMbZBs9y0NlkZFNV2ezWAtZucgHerc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X6M88JTAlcSncg/IDthCJy7eP+qhtjbX1xa+CCkl9wBSw6zQsfqUwMmV/tuZ2Nlj/5jRTllM7uHd5DkKmig5VLStfwhufBeSiYc3BWi66pHmOG8od+ZjTFIrt8oj1td4R7oUxuDJ6xqpXaqyN3oZcqEkitVHFmkQbvdE3I7yYW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fbpr3dxX; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fbpr3dxX"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2a1388cdac3so10811765ad.0
        for <linux-doc@vger.kernel.org>; Thu, 18 Dec 2025 15:17:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766099821; x=1766704621; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UhZeyKLTA9ibrUMZZxWygcC3Nvlu+qMnZ6MHbwZrAhQ=;
        b=fbpr3dxXMzHSNtN3MBHZ5I2S5phhDD+yYeq9exCVzSc23N7X/xpym0z0yF1blCEcN4
         JDZQquoNnAkmpGyPbghYZtzxes3U8dP2AD7O2xFpK7uHSm1VVG42Kfnwgs/S1bmHwh6R
         B+4kYpkFC4pJZH6BVtKhAsSijnk18P/GjdVqc8HND3Y+keVd+JZdvOpWYc2lknzj2cGl
         xf+O+Wqgj7Y8v14eSC6Pcyl+54ZO/1cAfnsjrD1/0fR63876z+lPychFs+NzgxSw9Jt4
         Iuswu7KbkLzmRAhIauowSQnpPbQ0fTeq1lAPClnCRmSou1KxucvQkfhT8XelECNw3tyP
         Q82g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766099821; x=1766704621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UhZeyKLTA9ibrUMZZxWygcC3Nvlu+qMnZ6MHbwZrAhQ=;
        b=FbdAk6SxMtlw4NcdQcC1sY5a4L5k9J1o9JC2v3N9m7hvfmBg8LETr+uorpKVOstZMX
         Xxr/EB5A0RtzdwpAnUHrUytIURgj4RLoIUExuL92splk3HEokSfE/hj6pEdSu95wxvkt
         5OgJjExDZdIycZcUl/aMiOT2aYYC8semyiwdOaXWrKNhKeXOrDsRA/XdbslyA0FiZuXL
         7x8g1/qMu/1FtuChAJFfhrElOJSzyssXB375ae+xNftHuru4eITogyTkbpBtIFYfp3iF
         szKVxjQRHWOgxlejSOH16TKowty79yPeFANkhSHWeLfNNm4h7gKsHT24L/2z63hf2fAC
         xFFg==
X-Forwarded-Encrypted: i=1; AJvYcCWldrhSybY6smB4bQ+tjXCRBscCXkzri7lBiDOpFf+yKl6HTeRFWI+iI9K3R2AoR9WaAx0DEpsprDc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqVKCybiLX3AHI/IYfccq08aqydGo+MgePHyjaxG64aEeoK1uW
	3NbpaTgJE9Qdk3N4fAjRGswZepkfypWtiyaYaqcFgL+a6R5x83yLIeM3
X-Gm-Gg: AY/fxX4BSRlLGcXaVZnAhgM13tvHMeFMYgu49esvicxRb2O/seZXey/f3ImQwqmS92q
	/jgDkQX9pgo1VFiJbbXK2Z7EefsBP5JPlkndx49i/PxEu5oVH9uObig6ouF66Kf/9UG2NaK7mo8
	8EoRTTd2fK1xtwsIPww8mzbObcI/5+DTxlAdFEdncfaCkb5ZEp9KeJVk1SNajijUXoXLM49TFft
	AHKo8m5CXMfcRogyYZbGcZW92aub8BdzrZHUlL6QkGw2ZJaZqzOqc6aN/v4RuZHR4D/cih2Drat
	bb7e7Zvd3nJMSfWG6ygV8en5NJPp9ZbEfzUNpgq8L5aNnH8JzQ3eDeJs77m8fK3SwJtuwCq+qCZ
	GgBebbB4Ui+scHaDRLZbBtNBkV2fNnwkdVbPtDAqFFzCbR0DpQFuq2Q2xK6Brt4k65RJunUOhuF
	GbjRaKLgbJtc53faZZMVkZEd6vJGYb1NU5XkQGeYfdjt1BMw==
X-Google-Smtp-Source: AGHT+IEJJK2/UdJoX3M765iVXn/ZuPzXlocYBzJ0cM8ct2mul9m5Z8TTPJHb6WbIrdPUvbpl6Rvqhw==
X-Received: by 2002:a17:902:ec8a:b0:29f:2f40:76c4 with SMTP id d9443c01a7336-2a2f2a34fe0mr9213765ad.34.1766099821207;
        Thu, 18 Dec 2025 15:17:01 -0800 (PST)
Received: from Lingbou.localdomain ([113.225.44.231])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4cb48sm3311955ad.64.2025.12.18.15.16.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 15:17:00 -0800 (PST)
From: Xingqiu Xu <hilbertanjou83@gmail.com>
To: alexs@kernel.org,
	si.yanteng@linux.dev
Cc: dzm91@hust.edu.cn,
	corbet@lwn.net,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xingqiu Xu <hilbertanjou83@gmail.com>
Subject: [PATCH 1/7] docs/zh_CN: Add timers directory Chinese translation
Date: Fri, 19 Dec 2025 07:16:43 +0800
Message-Id: <e6efa01104fb4476abbee4e4b4fe4f6bb99464f7.1766099040.git.hilbertanjou83@gmail.com>
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

Translate Documentation/timers/ into Chinese and update subsystem-apis.rst
translation.

Update the translation through commit 1f455f601e20
("timers/Documentation: Cleanup delay/sleep documentation")

Signed-off-by: Xingqiu Xu <hilbertanjou83@gmail.com>
---
 .../translations/zh_CN/subsystem-apis.rst     |  5 +--
 .../translations/zh_CN/timers/index.rst       | 33 +++++++++++++++++++
 2 files changed, 34 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/timers/index.rst

diff --git a/Documentation/translations/zh_CN/subsystem-apis.rst b/Documentation/translations/zh_CN/subsystem-apis.rst
index 830217140fb6..f6445e256ee9 100644
--- a/Documentation/translations/zh_CN/subsystem-apis.rst
+++ b/Documentation/translations/zh_CN/subsystem-apis.rst
@@ -29,10 +29,7 @@
    power/index
    scheduler/index
    locking/index
-
-TODOList:
-
-* timers/index
+   timers/index
 
 人机接口
 --------
diff --git a/Documentation/translations/zh_CN/timers/index.rst b/Documentation/translations/zh_CN/timers/index.rst
new file mode 100644
index 000000000000..55286759a04a
--- /dev/null
+++ b/Documentation/translations/zh_CN/timers/index.rst
@@ -0,0 +1,33 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/timers/index.rst
+
+:翻译:
+
+  徐兴球 Xingqiu Xu <hilbertanjou83@gmail.com>
+
+======
+定时器
+======
+
+.. toctree::
+    :maxdepth: 1
+
+TODOList:
+
+* highres
+* hpet
+* hrtimers
+* no_hz
+* timekeeping
+* delay_sleep_functions
+
+.. only::  subproject and html
+
+   索引
+   ====
+
+   * :ref:`genindex`
+
-- 
2.34.1

