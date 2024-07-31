Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD471B3757
	for <linux-doc@vger.kernel.org>; Wed, 31 Jul 2024 13:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722433693; cv=none; b=IopPKmnJ3u7l/c5fkwtWd3XhpwFSHyKKnwoeWaGecmmYRTLRUU3jcdCrHxr/PDCDZlrw8I+dhB1qcJgDx/WV4TsWTWdDRjmfjN1hsAfiprPAZXpudpwalXlHUj2+lyd83mZzcrzqv+22AY2verUbnnA8CZp+PnC4CpW4RY+WWj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722433693; c=relaxed/simple;
	bh=GKmFo3bmFk2IVwRE7ksCrTnyul2s0DsTqMziI0uIR6M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gPZecJ3zYvlhzvQblXkYSJBQ1gZvm14LhBV3ZT49v2xZ5Yz4DfA1AY+bWp/4Q5kfdBKgDTHY+mrw5dxmxlUeifKBl9F0V5V03sR74V0Y2rZoqLlBCKgk0sIM6AW8OIhgm0ADyG5Xw2CGq+yh7QU+vbySxJbIsw7PgBYtNwN0Pmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=mC9XmqHH; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="mC9XmqHH"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7a1d7bc07b7so353080785a.0
        for <linux-doc@vger.kernel.org>; Wed, 31 Jul 2024 06:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1722433690; x=1723038490; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/5uzNUVmRh9vWTdDmOIKmWFbEDxFk4bBzY+xGs2C1kM=;
        b=mC9XmqHHRWIaRkAua6YWY2ANHgKWx+/6VgwLB51HgTCKWkw7pA2J5OnfWPgAnzmKsE
         A+FPnPTHTPVY/7fzz28XeBd8nCGzU5m7fTDYNDPVHcK/OXiTWLjYu8rNvxkzmiOV0DtJ
         0qvqZNBVhTG5a4B/pTUfOR8CtSc30XIif0d9CMQjN2kjBFuIfJQiH6+TIUDSzX/p85E5
         US/bfBcN2SvhoM5Kot8LmM8w8Db5luvbne1CfNqI0VPt+OSApRdPFr7kVW3epVgApLke
         8kCwSC+TaN+rqtuGKAAIlaBKpmJgQIOhJPv53VBYtLbCGCelHy59D74IN49SAhL/T05S
         E9pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722433690; x=1723038490;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/5uzNUVmRh9vWTdDmOIKmWFbEDxFk4bBzY+xGs2C1kM=;
        b=qmf/I9C/S+RKjhuxkCMfD1T2TOI6b/R4v+bEoOiGcUf4isqWa+Q6GULCa4j7NQIp9+
         YKCBLZQr3VYNb/yk0ZitxGR3DaeTFN83i+tQFzDk3TQ9iIQcBIsKsxbgVbyuhEOKG8hS
         TpXfDvPNw1JQ3Ihqq5mLnOuvun7VJ1e4/UP2xIsfpwk6gUsUQ/HIRpcQFPSen4lHbfpX
         b7vAbyUi5vV9d0GCVeeTaEUIsTI8VMAnroHUZHzRSs9iD9J/bOSuXDqpe4W6OswMQO/w
         PFHizIEQQ/IU3GJvDr50miylbgy7lCf50diF0Epf+PCj0qMAF7lWTAIs7JIQfV/V8Dk+
         J6Uw==
X-Forwarded-Encrypted: i=1; AJvYcCWDGuyZGzmpfW7mmhG6ULjlYTL9iB/wSUq2lMtDDr8XpBybpytUVuPuWaks375vwTV+HvfSKjnEg59KRilZposPlA0u97y4+CAv
X-Gm-Message-State: AOJu0YwEiV5FaRWbXZH5tIEGheWugiZLWEoKd6/MHQC8ZZOgzrmfo9Ul
	qZR6SGn9ER0vEgnGgqIFO09Q5/rL2V7Wpqgeii1uSJhafXVyxmJN1OwqnXUoiPg=
X-Google-Smtp-Source: AGHT+IENXE7gMX9n7xlozfsQwOgjRSJ79Q6Ieiz5vXJp14uZDTYVPDecol5LPvAzsx31osMEowdNBg==
X-Received: by 2002:a05:620a:c4c:b0:79d:a265:cc95 with SMTP id af79cd13be357-7a1e52fbd12mr1534556885a.65.1722433690459;
        Wed, 31 Jul 2024 06:48:10 -0700 (PDT)
Received: from [127.0.1.1] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a1d73955ccsm746209985a.11.2024.07.31.06.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 06:48:10 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Wed, 31 Jul 2024 09:48:05 -0400
Subject: [PATCH RFC 3/3] docs: iio: new docs for ad7625 driver
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240731-ad7625_r1-v1-3-a1efef5a2ab9@baylibre.com>
References: <20240731-ad7625_r1-v1-0-a1efef5a2ab9@baylibre.com>
In-Reply-To: <20240731-ad7625_r1-v1-0-a1efef5a2ab9@baylibre.com>
To: Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 David Lechner <dlechner@baylibre.com>, 
 Uwe Kleine-Konig <u.kleine-koenig@baylibre.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Trevor Gamblin <tgamblin@baylibre.com>
X-Mailer: b4 0.14.1

Add documentation for the AD7625/AD7626/AD7960/AD7961 ADCs.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 Documentation/iio/ad7625.rst | 91 ++++++++++++++++++++++++++++++++++++++++++++
 MAINTAINERS                  |  1 +
 2 files changed, 92 insertions(+)

diff --git a/Documentation/iio/ad7625.rst b/Documentation/iio/ad7625.rst
new file mode 100644
index 000000000000..61761e3b75c3
--- /dev/null
+++ b/Documentation/iio/ad7625.rst
@@ -0,0 +1,91 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+====================
+AD7625 driver
+====================
+
+ADC driver for Analog Devices Inc. AD7625, AD7626, AD7960, and AD7961
+devices. The module name is ``ad7625``.
+
+Supported devices
+=================
+
+The following chips are supported by this driver:
+
+* `AD7625 <https://www.analog.com/AD7625>`_
+* `AD7626 <https://www.analog.com/AD7626>`_
+* `AD7960 <https://www.analog.com/AD7960>`_
+* `AD7961 <https://www.analog.com/AD7961>`_
+
+The driver requires use of the Pulsar LVDS HDL project:
+
+* `Pulsar LVDS HDL <http://analogdevicesinc.github.io/hdl/projects/pulsar_lvds/index.html>`_
+
+To trigger conversions and enable subsequent data transfer, the devices
+require coupled PWM signals with a phase offset.
+
+Supported features
+==================
+
+Conversion control modes
+------------------------
+
+The driver currently supports one of two possible LVDS conversion control methods.
+
+Echoed-Clock interface mode
+^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+.. code-block::
+
+                                                +----------------+
+                     +xxxxxxxxxxxxxxxxxxxxxxxxxx| CNV            |
+                     X                          |                |
+                     v                          |    HOST        |
+          +----------------------------+        |                |
+          |      CNV+/CNV-   DCO+/DCO- |xxxxxxx>| CLK_IN         |
+          |                            |        |                |
+          |                            |        |                |
+          |       AD7625         D+/D- |xxxxxxx>| DATA_IN        |
+          |                            |        |                |
+          |                            |        |                |
+          |                  CLK+/CLK- |<xxxxxxx| CLK & CLK_GATE |
+          +----------------------------+        |                |
+                                                +----------------+
+
+Reference voltage
+-----------------
+
+Three possible reference voltage sources are supported:
+
+- Internal reference (only available on AD7625 and AD7626)
+- External reference and internal buffer
+- External reference
+
+The source is determined by the device tree. If ``ref-supply`` is present, then
+the external reference is used. If ``refin-supply`` is present, then the internal
+buffer is used. If neither is present, then the internal reference is used.
+
+Unimplemented features
+----------------------
+
+- Self-clocked mode
+
+
+Device attributes
+=================
+
+The AD762x is a fully-differential ADC and has the following attributes:
+
++---------------------------------------+--------------------------------------------------------------+
+| Attribute                             | Description                                                  |
++=======================================+==============================================================+
+| ``scale``                             | Scale factor to convert raw value from buffered reads to mV. |
++---------------------------------------+--------------------------------------------------------------+
+
+
+Device buffers
+==============
+
+This driver supports IIO triggered buffers.
+
+See :doc:`iio_devbuf` for more information.
diff --git a/MAINTAINERS b/MAINTAINERS
index a90972e1c5c5..97c9b03e1cf0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1268,6 +1268,7 @@ S:	Supported
 W:	https://ez.analog.com/linux-software-drivers
 W:	http://analogdevicesinc.github.io/hdl/projects/pulsar_lvds/index.html
 F:	Documentation/devicetree/bindings/iio/adc/adi,ad7625.yaml
+F:	Documentation/iio/ad7625.rst
 F:	drivers/iio/adc/ad7625.c
 
 ANALOG DEVICES INC AD7768-1 DRIVER

-- 
2.39.2

