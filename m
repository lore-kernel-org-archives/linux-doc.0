Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6644F221F1F
	for <linux-doc@vger.kernel.org>; Sun, 21 Dec 2025 04:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766290847; cv=none; b=DyYCpz9+P0OegCUy8WOy7KWVI35AIXovyUhk8P5W4rEbN5ATFrjHReqC1r9WHQE4gMBkMrKWrcR/myr0FYDBvD4kccyRQS+McZSaF/2tVDibRirKBHkVFsczLOqmuo8KK/zdkJjuieNW+ooI+PEzW/0Q10WBMmhwTkOX7evvv4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766290847; c=relaxed/simple;
	bh=p32qd1CMtpZrvOqiOyNxVvmMRWtTmW3d9z9hTfsYpGw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=H4hsDndywAVvFMXCdBDjMhiDz1p7uyHm233S5sH/eA+u7KiUBWONac95QIwTVCCsHTaNZQmIe3Uagr7KsoDp2oA2kh5f7VSHI5b2Pa7RGDaseREp1CQBhSYSTNQygyrsP5XU51tFAGmwrX0nL0+QhhwOiKQUwqWgEk8xxE5uJws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eQhNzP2h; arc=none smtp.client-ip=209.85.214.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eQhNzP2h"
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-2a0833b5aeeso40796975ad.1
        for <linux-doc@vger.kernel.org>; Sat, 20 Dec 2025 20:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766290842; x=1766895642; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XnP7OKw91qUHBafMZ5I1kAG02nR+3IKvTt8SsYgVCHw=;
        b=eQhNzP2hyJPrrXzQHti/TlHxYQ7rh820FC1uSKeiaxBMTqW84YClOkDOgmygSLcyJ4
         SD7T+3YXTNzDJwuQBzzlnYy8OL4jZY2C3Bd6dYXK2n2fz+GlvKzy+3xFnnGZhuthLJ0O
         7mFdd67OeJL9rCg1Ovina79UX447bw20MpLPeOChQ5DktvBIcGRC10lCKOOhLIYZtSPc
         xEo6dyOsKpOR12doH04Z/OIdjjwvfv8glw1cidp4j//+3R1egb/W5ZJR9wENagxRKmf+
         FgMyE/3ErvPTbrLXLncnHzR/cMN+DW6Sp4Hu8CsA+CXpHz2aaDel++dpaRcTT+mbuz5e
         WJzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766290842; x=1766895642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XnP7OKw91qUHBafMZ5I1kAG02nR+3IKvTt8SsYgVCHw=;
        b=PprtqEldHNJresmRVInyO4/d/Xg3w9O3pn3PwE57+EiKM99RNaWWJnUYpoIpiTDER8
         3g3A8kihJ1Lim9qgtJHUeuMVFnwpD2ZlKu2Kuo3HHAz01hlJqVhvQp8+4+/w/psNTeZI
         i9Ezud9d5n+gCb1uu9FFZl8XagOFNW36M2SmHjwWpLF8k0BjgDcIMxAfIY7HQqt9K/UA
         3Pv2nlWIvUcXXhcm9hWjCN7n+t8RcBvtA6yS+ey36SvFeGlxn4q8BZsOJaRyh2hMetQG
         NP5daQafez47TM8RO11WybdYTcWyqqrufEtoEixs/+6UUb1B6k6QTcLe5k2GAFXzFll6
         JPXw==
X-Forwarded-Encrypted: i=1; AJvYcCVJ2I2mVn5V/f1fCVYImPiFgJJjOcVsgWTL//X+UxeEOCOTKW9nZ/ayqPvt1JyGWQga/aildyUk1Fg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5qtXNOFZ2L3+uAiHMZrjJRkmJlYYhVfM3T+nvvBPD3sxYXsSm
	P2rUp8OSNv+0MhSNBtpQOzHy0NR/jX70AI4a7zekQ+kV24I6s37twawY
X-Gm-Gg: AY/fxX5St8/uZ/i40kZF6yjI6daNnM3BgBQt9D8UuX9JYFt1mHN/HTkOGi5dEafu+84
	CTWxzAoN/LnCqes/R7ZkWeiXYDBXg0fCvQk2jCv0f5qZN9iSly5wuNkwfRdxjURHgFqMkWzTmV2
	S+lqJ4O8TMpL88VI+NaCPgWoI3WBcDSSz8OR4E5lSoYXPxs9h8ebRCD0cOx4HBTTVdn44kvcDkn
	vQnYnXB+IzWl0w/RrmHI3O1DI9koXcTFkA4DmYFnpvK5Zxcg8dnFk4jch+lIRgMGjGgF+1hU5sX
	U0YuXrik3SCv2j6mFUkhABsZ8C3DEnT8EGBH2v89WBmEVTXicQ4JFgRNl4BrWFRZpYiV/ilMfKe
	3DBomoXOJtTrNcivqyaxaE6IVGK9X0y6KQijFtjcKWgcVUPPw4XjpmIGVmgMtIHyLBMygpSRpcl
	2ezX+e6k8vDkWr4KtEf5gtLBc=
X-Google-Smtp-Source: AGHT+IGmGZSCNhEhHjUIS60wSnhLvOSqRgduWOyCEsTNRSYTC/0ddkkGHZQMcpHHjFAEheFEk433nw==
X-Received: by 2002:a17:903:2342:b0:2a0:e5cd:80a1 with SMTP id d9443c01a7336-2a2f2a34fa1mr71333975ad.41.1766290842511;
        Sat, 20 Dec 2025 20:20:42 -0800 (PST)
Received: from localhost.localdomain ([14.255.43.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4cb90sm62319245ad.51.2025.12.20.20.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Dec 2025 20:20:42 -0800 (PST)
From: Nam Tran <trannamatk@gmail.com>
To: lee@kernel.org
Cc: pavel@kernel.org,
	gregkh@linuxfoundation.org,
	rdunlap@infradead.org,
	christophe.jaillet@wanadoo.fr,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Nam Tran <trannamatk@gmail.com>
Subject: [PATCH v20 3/3] docs: leds: Document TI LP5812 LED driver
Date: Sun, 21 Dec 2025 11:19:50 +0700
Message-Id: <20251221041950.4631-4-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251221041950.4631-1-trannamatk@gmail.com>
References: <20251221041950.4631-1-trannamatk@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver provides sysfs interfaces to control and configure the
LP5812 device and its LED channels.

The documetation describes the chip's capabilities, sysfs interface,
and usage examples.

Signed-off-by: Nam Tran <trannamatk@gmail.com>
---
 Documentation/leds/index.rst       |  1 +
 Documentation/leds/leds-lp5812.rst | 50 ++++++++++++++++++++++++++++++
 MAINTAINERS                        |  1 +
 3 files changed, 52 insertions(+)
 create mode 100644 Documentation/leds/leds-lp5812.rst

diff --git a/Documentation/leds/index.rst b/Documentation/leds/index.rst
index 76fae171039c..bebf44004278 100644
--- a/Documentation/leds/index.rst
+++ b/Documentation/leds/index.rst
@@ -25,6 +25,7 @@ LEDs
    leds-lp5523
    leds-lp5562
    leds-lp55xx
+   leds-lp5812
    leds-mlxcpld
    leds-mt6370-rgb
    leds-sc27xx
diff --git a/Documentation/leds/leds-lp5812.rst b/Documentation/leds/leds-lp5812.rst
new file mode 100644
index 000000000000..c2a6368d5149
--- /dev/null
+++ b/Documentation/leds/leds-lp5812.rst
@@ -0,0 +1,50 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+========================
+Kernel driver for lp5812
+========================
+
+* TI/National Semiconductor LP5812 LED Driver
+* Datasheet: https://www.ti.com/product/LP5812#tech-docs
+
+Authors: Jared Zhou <jared-zhou@ti.com>
+
+Description
+===========
+
+The LP5812 is a 4x3 matrix LED driver with support for both manual and
+autonomous animation control. This driver provides sysfs interfaces to
+control and configure the LP5812 device and its LED channels.
+
+Sysfs Interface
+===============
+
+This driver uses the standard multicolor LED class interfaces defined
+in Documentation/ABI/testing/sysfs-class-led-multicolor.rst.
+
+Each LP5812 LED output appears under ``/sys/class/leds/`` with its
+assigned label (for example ``LED_A``).
+
+The following attributes are exposed:
+  - multi_intensity: Per-channel RGB intensity control
+  - brightness: Standard brightness control (0-255)
+
+Autonomous Control Modes
+========================
+
+The driver also supports autonomous control through pattern configuration
+(e.g., direct, tcmscan, or mixscan modes) defined in the device tree.
+When configured, the LP5812 can generate transitions and color effects
+without CPU intervention.
+
+Refer to the device tree binding document for valid mode strings and
+configuration examples.
+
+Example Usage
+=============
+
+To control LED_A::
+    # Set RGB intensity (R=50, G=50, B=50)
+    echo 50 50 50 > /sys/class/leds/LED_A/multi_intensity
+    # Set overall brightness to maximum
+    echo 255 > /sys/class/leds/LED_A/brightness
diff --git a/MAINTAINERS b/MAINTAINERS
index 8d840b34c924..394165660e67 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25841,6 +25841,7 @@ M:	Nam Tran <trannamatk@gmail.com>
 L:	linux-leds@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/leds/ti,lp5812.yaml
+F:	Documentation/leds/leds-lp5812.rst
 F:	drivers/leds/rgb/Kconfig
 F:	drivers/leds/rgb/Makefile
 F:	drivers/leds/rgb/leds-lp5812.c
-- 
2.25.1

