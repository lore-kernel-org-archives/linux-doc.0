Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2979534216B
	for <linux-doc@vger.kernel.org>; Tue,  6 Jan 2026 19:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767728852; cv=none; b=OYpGCkfCV/TrSC+5iwOY3W1CO95eOedDviGu8MT2ly1QgtmbqSVZNfc8DCxbHlnVYTFOxAy1w5KcLF2EIlbKWZySvOtGzPKsJi3iLLuGf3SzPxw0jTVbuxv5DTbSWBDjOnXJhPcO/2EOM63r9YV3GSlyt5TwhIei0vl54UpYxko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767728852; c=relaxed/simple;
	bh=lHmHwd8FLasob0Ljhf3FgBjEmBusagGrFmEBsEA2r3M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JfnL+SmpL+OHKEJ9SQQFseNvfrs9DzeAlHqsb8lqyCLsW6A0jLqRh9nvY30W1Et8Gga8KW0QuAe+6teavaTg/qtwp4eiBa7AMMfZ6KzjjXBO73XOtfxzCVDgISwhx77KRiiR8p8ykGv0RPi9yjrCtdoAC3I9BDBjugVk0346VL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JwFC9UYI; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JwFC9UYI"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7a9c64dfa8aso1061091b3a.3
        for <linux-doc@vger.kernel.org>; Tue, 06 Jan 2026 11:47:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767728850; x=1768333650; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W9vzOplXqLA/InT0kNtnBJulD4VZdWWxPZrd2ydUlsM=;
        b=JwFC9UYIVzdxVX/FvTcSycAvpVB3CoS1TZmLEu5RrMZGxkk0cMEGoVE3PwdJH0aM+h
         397s6oA0QpQc8xRX5o6R8p3d8QdfSlvMLLjsiAsjO1u9bq93mEowwxw/7V6elE2MCqFd
         kwBq8dabVx/gYLznXozVtewZI46TMYGz/bdEpblT8Df99Yp/+kh88CpGsAzc1m5lruOA
         jKE/1Lg0t/9CBecDy+5qz49XZorodXfUZ2rJ7Lgsf+FoY4BpX5vx9/rBbmW6ieUqXRbs
         Q5gC3DKXGJiRFLMAdIv6UArEByFNAeuwtgDg/GAgJwebaM+Ol9YQL2U1FYc8iChhCSIz
         /c/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767728850; x=1768333650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W9vzOplXqLA/InT0kNtnBJulD4VZdWWxPZrd2ydUlsM=;
        b=mae04/a8GhcYEdB2AMMZ1SeWA1Wzh5BtlYJn0CsCEH4OMXjek91SZCNnF7QMjPVml0
         wwPoluwjQvm0YMf57SrV3UcCNQ3h57zWfEj/ov9OJpz7l6V+9OKX+yE1tg+PXEDAdx9n
         WObm3abJL0ZSV0leXuHhuzJizBRvRkJMcEtamv8+WnmROVqGA+OEGpXbo+lOBUdKKsEL
         S32wQ/lVy4Cz2XCarnb2DzWoHBTST6f9qH/8n4SFDoiZcDFLy1bAMzL30Q68tDs95KaG
         1DKCZPMzjdnQi617VXap8pvDYMtHiiozIlRTl3F+ItedZUaPwwFGzfdmt4YpUhyYQGHV
         mU8w==
X-Forwarded-Encrypted: i=1; AJvYcCUvzZGe+WU20LnQMmk+Id3yWmDephdt7adpBuIgbwXw479o9Vze0WPNOAZuDNTpsMGXTVixpI8CpbQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQfSO/lgkHK9dE9eInEGzl17vqDFcDrYue7+6XdzQrCbtxwGQG
	hVdxY7fTryPH6hz1B8zp58fiC69eCuXcaNP0sHtYc8CQRWwH+OyEaNqt
X-Gm-Gg: AY/fxX4qAgL/yWVlDIAqulmCiILPXiMgW8MoVLZUiiDhomLpkDbYxtNnULKrQLgT0uf
	B6SeOEuH7Gluqdzmg6T5vCP5QOQpEMZwy3oR0RUQg6ne4MMtCpzYwm/Lw1TNIoC8S4xBRgkOO3d
	rEWKmLQFnhOXYpvNnVYH86VjKkRJPDsoiEXmMJJEuQscBubzIg1HeuFXS2IYIQnY1n3noQAeydM
	Hjb0Lw3prRxAjrb8Ehr8isAKsLQ/BwzV8iNtJWMs4T1gqXcuyayzjB1Ck2x46NEs6MtbdqVlzaV
	h0oz6sBno9MsBX1PGYqHCQoChPWthrjjUVOfAmUempNXEi3PCUPyPrTyWYqXPpWP+vW9+XOyMsl
	/4uUzEMNc825jgqdhAtqmPWCmBslT43QhAp9ek3xCc89v/1hxzR1RX4AAEIdzjv35mWBkUjnlxq
	4PIoC8wV5ks9SHRRY6DcoORMbVUXCbQ5ps6bF9Adz+J3Hu
X-Google-Smtp-Source: AGHT+IGSj+Lzwxy2eprogH8DsIemiIYLsihtQx+qBVb90H1bewQhn9kz30C9gpw2VpwIa2mWNWxNiw==
X-Received: by 2002:a05:6a21:99a1:b0:35f:b96d:af06 with SMTP id adf61e73a8af0-389822b9816mr3983260637.14.1767728850241;
        Tue, 06 Jan 2026 11:47:30 -0800 (PST)
Received: from Lingbou.localdomain ([113.225.51.69])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cc8d292fcsm3036722a12.20.2026.01.06.11.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 11:47:29 -0800 (PST)
From: Xingqiu Xu <hilbertanjou83@gmail.com>
To: alexs@kernel.org,
	si.yanteng@linux.dev,
	corbet@lwn.net
Cc: dzm91@hust.edu.cn,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xingqiu Xu <hilbertanjou83@gmail.com>
Subject: [PATCH v3 1/7] docs/zh_CN: Add timers directory Chinese translation
Date: Wed,  7 Jan 2026 03:47:14 +0800
Message-Id: <f5e1f24ac6aed222a95bfeeef7df66b753e3b512.1767725479.git.hilbertanjou83@gmail.com>
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

Translate Documentation/timers/ into Chinese and update subsystem-apis.rst
translation.

Update the translation through commit 1f455f601e20
("timers/Documentation: Cleanup delay/sleep documentation")

Signed-off-by: Xingqiu Xu <hilbertanjou83@gmail.com>
---
 .../translations/zh_CN/subsystem-apis.rst     |  5 +--
 .../translations/zh_CN/timers/index.rst       | 32 +++++++++++++++++++
 2 files changed, 33 insertions(+), 4 deletions(-)
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
index 000000000000..8dc5861445f9
--- /dev/null
+++ b/Documentation/translations/zh_CN/timers/index.rst
@@ -0,0 +1,32 @@
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
-- 
2.34.1

