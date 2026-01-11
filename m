Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9881833C53D
	for <linux-doc@vger.kernel.org>; Sun, 11 Jan 2026 13:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768139772; cv=none; b=j4yP2GWzvTkvNRKv6X4y92TO8RCjAY68bq/nSCWNcxBNLMlXqMwWjKzZNrFYWs5QaAppoH06jw+3438/qyjWmrb94ArcgNxlrTtxvPO3HACzoVVYhEAUd9IZxmBE5SIyWR2D6SwZbtthZwbecPEnYObtBvoaWrtJ9zwQcMoOa/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768139772; c=relaxed/simple;
	bh=fQGHg/GaALo4L7NakZAnZQKi+khkZF+lQSdpTOINtvU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NdOtgv+j2jChtwPgj8HjCnnAPKVX3BgAnI9JdKJoIHRdMaGereY36rLvSyJosOvZpVyGWvgYeIpNLxD4kDNZBCJDUXgwDHIJPur0K+kkptq4xlilnjFowRAsw9DEBMqtfWSL/0jswmPY68Fy+0N4qp7wL5jpzHKHXIA2XFrCq0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VsGPOTwt; arc=none smtp.client-ip=209.85.215.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VsGPOTwt"
Received: by mail-pg1-f193.google.com with SMTP id 41be03b00d2f7-c06cb8004e8so2148344a12.0
        for <linux-doc@vger.kernel.org>; Sun, 11 Jan 2026 05:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768139769; x=1768744569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fOv6EGsZbFYXRB0m9rGx8n7JodIqftlLa5WhfqqaVtc=;
        b=VsGPOTwtF8qPGY+3/aWuhFOS6jXIrBPAM1OZzC0N/WGBLYbk0WZEX6puXzDpZ+2o33
         2VlFRnHBEk9v80pefFk1wNCPOFXc00Z0pgeUrkLnDlwVPi555H6rq+F+6ZIItqN3r1Zq
         GmWqVBd8U1kxXAfntEb7nWBD19CET1BHnK+y3klMapj4wRPt8H7xey58CdI56FfXu3n+
         K8ysfV5YVsn9g2PTSQlPY9oYa3ToJAgLSz9e7u/L0VRbExWyUnM+ifiGh+eoZyN578tz
         c1bXCNztALTi1sKcG2VO/abJPQm0M+rkW6mpEaiRhicnuSLpm47zJvyOKY7Tn9Y3ajk5
         HE9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768139769; x=1768744569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fOv6EGsZbFYXRB0m9rGx8n7JodIqftlLa5WhfqqaVtc=;
        b=nFxlVqgyvlvjtoIdGdNWLo4uSGKikf7/hF9pWyVSM5ziiz5A23S+HaP/V8xpls/k4N
         SlkguF+SkefUOqGoKiDfRBobuQJlCZxFtgqv+nhBmQlJhogGtcol2fpOERiun21rqxyc
         epfwrE6LR1DlVALb/dDkodoqgN5q/QrJSPSRisGq5k47iSkqq8/XFnUUfwm0c5JV0DNP
         M1j+QVPSHNvVouiDu1X/8NOajqqitfFJFdhNZ2o0zu4lq6zm80/TXqtlJGLbvovREjHC
         fWjRJ4JDq/BtbjRvor1De75qxyr8+4MALqIn7mITH5U4aVfpL7IClYboFL5MtOmUyvsC
         TURw==
X-Forwarded-Encrypted: i=1; AJvYcCX9qXBFDxkEAFFGboK4qc8oCAc9uxG1fYqTagF7rI/nhT19EnteCcAftBxVQVEEh20WGEfPtYMZedc=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq7ZZ0PWF5UTcZxsqhG6ElQ5s0KCdoCDrjQBdfrooclgR3uR4q
	4j3xKrPP3cWRK2pPYABW6zQFYcOybGdP/jTvroarWGXcTQc/2qNnSBIH
X-Gm-Gg: AY/fxX7qH3G//amxiP5ucFLS7kkLICvqU2wrWh+9QX+Q5bqNe52humS2QaxIIJZ7IfZ
	R12OUgUOIihI6XQyeGGIk/BfbGfi951wX3cvC/rknIeD8UjblMccvg82w7IREhwxmniHeSUjaHu
	6UqJtRd3n2R/HnZ5Q4rGxYqBr2pRyfVTRaoj9xUofT4/FEwtR7/bbaYVeyC32J65TR5jVuSV45i
	WZi9PPXtZSeFdJCYeY2RWdhFjXK019tyM8QMNL8OcUMWHsrQqgNaMj3Mm48+n6O843z8ZgTOpfv
	QiGwc0KdcfWPJH3m3k+Jiigsog+cht8YcOptAg0RD6b6lgENfVamOiegSiDPvcy65DGAbnLBXyQ
	jqZmHktwtDLyc/Ds+tRxJbU/tP4dOC7txE13/3JNcJf9leHo/vBt/rpcUiviB4FMBXWtqxYHPg4
	1TsuY0Kt+LTo5lZ8PIIWoFcb45fOrZZoUbvnY=
X-Google-Smtp-Source: AGHT+IEB1YKs1sBri/CwpT883LDcNuDwf7Q1SbSRf2vdPYouCmwfR4cxzcsipVBYtOx/jDlkTLMMPw==
X-Received: by 2002:a17:90b:1b03:b0:343:e461:9022 with SMTP id 98e67ed59e1d1-34f68ca444bmr15338692a91.24.1768139768855;
        Sun, 11 Jan 2026 05:56:08 -0800 (PST)
Received: from localhost.localdomain ([113.164.155.57])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f6b88d984sm5742345a91.3.2026.01.11.05.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 05:56:08 -0800 (PST)
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
Subject: [PATCH v21 3/3] docs: leds: Document TI LP5812 LED driver
Date: Sun, 11 Jan 2026 20:55:19 +0700
Message-Id: <20260111135519.28112-4-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260111135519.28112-1-trannamatk@gmail.com>
References: <20260111135519.28112-1-trannamatk@gmail.com>
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
index 65fca8dc34fb..584cf63aaacb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25936,6 +25936,7 @@ M:	Nam Tran <trannamatk@gmail.com>
 L:	linux-leds@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/leds/ti,lp5812.yaml
+F:	Documentation/leds/leds-lp5812.rst
 F:	drivers/leds/rgb/Kconfig
 F:	drivers/leds/rgb/Makefile
 F:	drivers/leds/rgb/leds-lp5812.c
-- 
2.25.1

