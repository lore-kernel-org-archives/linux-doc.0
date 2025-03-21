Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA70230273
	for <linux-doc@vger.kernel.org>; Fri, 21 Mar 2025 20:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742589010; cv=none; b=L8cTyFxyK18137JTCRCsAFawkSNJdJGISvB7utUDkI34hqQ0uZq3xRu1VQ6BH+n1b/I3qmSVlBxlTvSCzcC6KsNz+X75OeESqOtsPCqieBlMfxLypdUtT/6y94D434MO1RBtEN++dega//y+4K3aoA7g6UMeSj84tsn3bSk+hP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742589010; c=relaxed/simple;
	bh=YC4T+Fxmel7++n7zPsX37ONlH8IUA0Cd+K60/qZjzk0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V3J2KEpCSKiKzEn9owDOjP3NsL/gHvaVgH23R8xl+Id5YgFGsJZzHfN3ZlUmVJr7cwSch27mZlLz+/bz38q3LXTdQsxW3Wv9KO+HzgF24uJYWW41JCUOjbCHBUASmua54dHcvlDBzMjg0Jq82OWWPgDi/aSqkr5Gu0nx4sGrykU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=xT2SzOz3; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="xT2SzOz3"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cf0d787eeso25216735e9.3
        for <linux-doc@vger.kernel.org>; Fri, 21 Mar 2025 13:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1742589006; x=1743193806; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BrUIumItvCNnNNN+MtX5Y60lKBBj+tPu5adwP5ucCjc=;
        b=xT2SzOz3ASgDiQxSQJyEkSvMwLMhEo8w2kkCGnuIGjIM953gzRPXzPj1WP+Vx5XVjR
         lVqWWS25WjYcLj/ZKIPmhylxuUR0hMYqWgVQz5c21CpwMFk3dtUn3rWfrvjem7ZjjjqF
         /7LQfKQdAmKYjEa/8Wzi7uw5UROip3TPoVA3YIZ2FDxl6cx0kzOOIXEpIe4h0rm/eA4B
         grquOP5ScFV8a+kE03m7RmGW6cAqjb8GiAPiJy7RTBIO2punm1f4mJ6O26z5GwuzQ1/h
         Oo0KbexlDegvMXNzkrl7tpmARCC/yrOOWF4zJlfpCievuSK0SM5oZvVZUhWxOUah0KLQ
         7J2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742589006; x=1743193806;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BrUIumItvCNnNNN+MtX5Y60lKBBj+tPu5adwP5ucCjc=;
        b=kt3n/TVa5Fds4RtT+wm6E1JseIuGcIJKo8Z5RIpf5YzsP7YIzxgIzffYc9I/uTHDzC
         cvw2xObb9eTT3p7e2XCCFIcFxzaay1h3j3JIAp/FZwtnu6kJCNplBNZVy3ls/VcyZXmQ
         5jktqkUVTcPO00x3jRRoYdJLRNH4BqSAFjytcNsdrb37G4aj/58pMbpg1ItHeqp/Y15f
         o7yAG7X8561HOJoFPichaX0SMLkJUFlGZEPD35EtAH6YJKe/fkOajJ4UxfZ3UnDRjSrn
         NRJAYw3Mt+jRcOsroFMFEyKwlWcuw/A4cEv6ESLId+LFg9n/Q6sOHh6tlkVxIoruwis9
         u/zw==
X-Forwarded-Encrypted: i=1; AJvYcCWMsJIxkBvv+etgIuBniHHH0pfQUhtdXEPTTka8xZvHPZsbv4GpfSg7hYxj5deCyvXSL1xjos3yv64=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxAmuk+4NdOMAPbQgoja2wdpSHYyNBuzT11GGJbOW/eDfWm4IU
	YY6jpQgmdEMzHHR/C3PZ6/sL2btq8lf2a3a1SLCQBoklcd8+ai7YagssETa5qtY=
X-Gm-Gg: ASbGnctphUzkAF01OgyO2WbkQZPqPqsE5613EMG9Dx//PJ3wEN4zWYAU7KytwZo4Qug
	1y/FsZ67kP9Dsn/skRaMVlYdXJ2RQtWVzBFLErxeP7bOOsPmKqEEhBUIqLwkgOjtOdMpdWUW7OL
	1rRHgxpYOHIqvzyOR5WeYkvDFUpAgubVpVxdKwR8jk+3jIfuwa86r8THl/0FtvxeA+BRTmM7SGH
	46eQLP+DIIxPQU4ILG/P7qSgeBMF8NpYC2878VBmKXpTnmPJseTr0qEHEffqoka2hiZixERl2Ku
	pZkk9+M0kC99Mgb78CqhL1wWtV6v4zjQHOnL6QWjFN3o4yV/8lM0gyRkeBfPVOoLc+QkWIck++j
	vivwgwIXsPMZ4fA==
X-Google-Smtp-Source: AGHT+IF0enc0SoBKgZE9ptV5JlSLStbIP21CY/7llnPzyfEnIzCO5p0eB6iQvZVUBHy0w0u/ovLT0A==
X-Received: by 2002:a05:600c:4e87:b0:43c:fe15:41c9 with SMTP id 5b1f17b1804b1-43d509ec508mr40324515e9.9.1742589005643;
        Fri, 21 Mar 2025 13:30:05 -0700 (PDT)
Received: from [127.0.1.1] (host-87-8-62-49.retail.telecomitalia.it. [87.8.62.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9955c0sm3258380f8f.3.2025.03.21.13.30.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 13:30:05 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Fri, 21 Mar 2025 21:28:48 +0100
Subject: [PATCH 1/4] docs: iio: add documentation for ad3552r driver
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250321-wip-bl-ad3552r-fixes-v1-1-3c1aa249d163@baylibre.com>
References: <20250321-wip-bl-ad3552r-fixes-v1-0-3c1aa249d163@baylibre.com>
In-Reply-To: <20250321-wip-bl-ad3552r-fixes-v1-0-3c1aa249d163@baylibre.com>
To: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
 Jonathan Corbet <corbet@lwn.net>, 
 Olivier Moysan <olivier.moysan@foss.st.com>, 
 Michael Hennerich <Michael.Hennerich@analog.com>
Cc: linux-iio@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Angelo Dureghello <adureghello@baylibre.com>
X-Mailer: b4 0.14.2

From: Angelo Dureghello <adureghello@baylibre.com>

Add documentation for ad3552r driver, needed to describe the high-speed
driver debugfs attributes and shows how the user may use them.

Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
 Documentation/iio/ad3552r.rst | 65 +++++++++++++++++++++++++++++++++++++++++++
 Documentation/iio/index.rst   |  1 +
 MAINTAINERS                   |  1 +
 3 files changed, 67 insertions(+)

diff --git a/Documentation/iio/ad3552r.rst b/Documentation/iio/ad3552r.rst
new file mode 100644
index 0000000000000000000000000000000000000000..638a62c99fb876cca026a0b1df469c81ba39ff29
--- /dev/null
+++ b/Documentation/iio/ad3552r.rst
@@ -0,0 +1,65 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+==============
+AD3552R driver
+==============
+
+Device driver for Analog Devices Inc. AD35XXR series of DACs. The module name
+is ``ad3552r``.
+With the same module name, two different driver variants are available, the
+``generic spi`` variant, to be used with any classic SPI controllers, and the
+``hs`` (high speed) variant, for an ADI ``axi-dac`` (IP core) based controller
+that allows to reach the maximum sample rate supported from the DACs, using the
+DMA transfer and all the SPI lines available (D/QDSPI)..
+The high speed driver variant is intended to be used with the ``adi-axi-dac``
+backend support enabled, that is enabled by default when the driver is selected.
+
+Supported devices
+=================
+
+* `AD3541R <https://www.analog.com/en/products/ad3541r.html>`_
+* `AD3542R <https://www.analog.com/en/products/ad3542r.html>`_
+* `AD3551R <https://www.analog.com/en/products/ad3551r.html>`_
+* `AD3552R <https://www.analog.com/en/products/ad3552r.html>`_
+
+Wiring connections
+------------------
+
+::
+
+    .-----------------.                .-------.
+    |                 |--- D/QSPI -----|       |
+    |   DAC IP CORE   |--- SPI S_CLK --|  DAC  |
+    |                 |--- SPI CS -----|       |
+    |                 |--- LDAC -------|       |
+    |                 |--- RESET ------|       |
+    |_________________|                |_______|
+
+
+High speed features
+===================
+
+Device attributes
+-----------------
+
+The following table shows the ad35xxr related device debug files, found in the
+specific device debug folder path ``/sys/kernel/debug/iio/iio:deviceX``.
+
++----------------------+-------------------------------------------------------+
+| Debugfs device files | Description                                           |
++----------------------+-------------------------------------------------------+
+| data_source          | The used data source,                                 |
+|                      | as ``iio-buffer`` or ``backend-ramp-generator``.      |
++----------------------+-------------------------------------------------------+
+
+Usage examples
+--------------
+
+. code-block:: bash
+	root:/sys/bus/iio/devices/iio:device0# cat data_source
+	iio-buffer
+	root:/sys/bus/iio/devices/iio:device0# echo -n backend-ramp-generator > data_source
+	root:/sys/bus/iio/devices/iio:device0# cat data_source⏎
+	backend-ramp-generator
+
+
diff --git a/Documentation/iio/index.rst b/Documentation/iio/index.rst
index bbb2edce8272e7483acca500d1a757bbcc11c1e0..2d6afc5a8ed54a90cd8d5723f0dc5212b8593d16 100644
--- a/Documentation/iio/index.rst
+++ b/Documentation/iio/index.rst
@@ -19,6 +19,7 @@ Industrial I/O Kernel Drivers
 .. toctree::
    :maxdepth: 1
 
+   ad3552r
    ad4000
    ad4030
    ad4695
diff --git a/MAINTAINERS b/MAINTAINERS
index 57eaab00f6cb53df52a4799eb2c1afbbd1e77a1e..52bc56a9ee22c66b90555681c4757ea4399adae1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1295,6 +1295,7 @@ L:	linux-iio@vger.kernel.org
 S:	Supported
 W:	https://ez.analog.com/linux-software-drivers
 F:	Documentation/devicetree/bindings/iio/dac/adi,ad3552r.yaml
+F:	Documentation/iio/ad3552r.rst
 F:	drivers/iio/dac/ad3552r.c
 
 ANALOG DEVICES INC AD4000 DRIVER

-- 
2.49.0

