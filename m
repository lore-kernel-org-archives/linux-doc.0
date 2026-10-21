Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792564438;
	b=SWJoNjoXTbg9nHbE4ZvlK8Sa98omx0xXBti5o9zvk2zgcUmAx5cvby0pIXyXJPxqm5ff
	 AYmHvlv0TMQ44lUb0BqHC3oLgnMOidWgGBx4Qd2ibb8mnxS+DOwrjuiGhWN1nAAHbTHzA
	 i9rl/ifX1JomuWzI+u43wOnq8tY5sbi++b9cnd3NduUr727HEwc6OVVkyDromin6Eux+t
	 PmLh/zkdcBtYBGO5WYA2p34p3240HLdbclfz0unApi1fNbJLuFbhFRmpn2oQg36SBxBio
	 pD2Eryc9lPTR623N5YRzvmFJuiYSo/kqtmliGQZ7M79QFPTmVVxYoDVEjCTrMpGce7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792564438;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=XfpDTt0rN1tqZZQ9NzVFLUVJCa2Nxf7s33VXO2H8BuY=;
	b=Idt25YvT1418QadC8zWxLZzXaLM+zwE2NPCs+ZLXrU5xo6RgoP+/VkxkoQaw4URtmInk
	 bdbFFuvVZGX1K4GOushRxcLjtpwWvnrA4fTuEunvRRQDFZ0jc+rCacZRc7kh5kLoJeOxQ
	 36Zd7eiQIKNhVvVi1E5axKk5Drpi7YIw5UagseXHOcUh79rDspiyEtKFKuvP4IzvJaEf1
	 6ICfD5hjC9YQdxC8SmTTVpTPote8rcFzdAtt8MendI/HaNyDs9nQHkN7vEbKBPZ5KAT2Y
	 WFuPinnap5t1dK80O7Q2PcmF4aaOUb6diE5S8q1BPV79FfrAV9LGRkgxi+6wYndZl8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oUbtByXC;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356AC606A322
	for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 06:33:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 356AC606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oUbtByXC
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so312080f8f.1
        for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 23:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792564436; x=1793169236; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XfpDTt0rN1tqZZQ9NzVFLUVJCa2Nxf7s33VXO2H8BuY=;
        b=oUbtByXCBGRAYf/94Hy5mFiVX/EOo3S3a9888PZNtD+M6l5dxyrX8RZbT1xWpsPTYM
         0wwMKdnWiTRZ+ss+sxqEyv4/s3OuLFh8RrJHIIjoGknJDJpOTaeuJhbjCyenDwS1jP2l
         PjhKoPAAOtBzYeioDWG3eQ4N5yYGcI7wYGCMmI2nWZxGt8fTxvLHd0gqRu5qKNu9JAoA
         0vwVICOD12KT6Mv/mZchmzauVocAzAgiys/Xijov7zR9nT4r1Kcq2Mmy//gWKcMLOxcW
         BsReoXjukbmwOijdpyL9jOmgsk+bzkQyXzgQ2t6UrcJy5nmSLR/uFWBnPA5jHymCl91u
         XXkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792564436; x=1793169236;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XfpDTt0rN1tqZZQ9NzVFLUVJCa2Nxf7s33VXO2H8BuY=;
        b=Bjrm3MCCRLxTD7ekQK/y8Q4PBcPU9E+PHX+UFA81RXSvUCRPBOTFhMey8Qa8P6Oe8Z
         cuTRuMP4hzkPApihj4FakaowFbpSk32q0V4ddT+TnPL1RtnVzs1/pFSWpAxZKTN+d8IC
         na0BASOiOURXjgAk+KUhZxHpY9VHhjtiW5tpij/0V5vlFL53YQVKLRhijvnj78n3XDyV
         FpQN0TIPDL/EVX6y95vOQzHz/lZZbUeC5EA4/uBnmorg9chT5sIiMhQ0/n78AV9KzP30
         AQ34NyapYvFQdIPhsljeNF3q5QM52V27NsqHq2GCutQPZvHoy9+6VjkGfvanWwHJEq44
         xPqQ==
X-Forwarded-Encrypted: i=1; AKwUvBzwn1H6qte1v52VPZLou+V6iBnzuGhnWu1TrRDkkvd9Da6iRN4iHsIjlvjOTOaWhM/4fv4N7bebVnU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJxbmJ7P7YJWkaJGHskJIAgWZmBPVglghK1hg20+CvAecGg15ue
	vaSmWM2HKWt5612B1n+eRI/P0ZIhs2igUjnd7jCtdDU5hZjB4vauMhzD
X-Gm-Gg: AYBFou22UEUkjqDdFW0274Zk40YqWrK78pFhNJ3PabQwRYT1E/tADHpDukKmwDAErdf
	2aGOkqE6yWnvoB0JQBxHumnbEtygrnMT0iIA0wcZk+tZoDgZF3ppkduiRVSOzzLKmsiSEnPYAST
	viEgOPWqL6rKbuGZfgFkw39GIO2ea5DDe1HK6YgC72Z+eEHQvR6qzJAkl5PM911XboUEqhTDG4a
	OZH2zjS7vw5wu0kQm/XP4dCkkfL0RAyokPklSUDygi3S/KqnNDvpWHR5batAxVdl5FA/77cBTE0
	7VhZAlCoiRymJ3zzY65Psgsbwu6+VxtlnW5lp7pKvi+0O0HG+r/qJUY3jvEE0/+BRuA0u62XZjp
	bk1uOcyURAWSnX6281MhMOTuacT3ZDzdgOWPmVflhTOLGYgcvrxrW1nIZw4xMLQoXGC6OaT3Ch/
	ZfqYx/f5X4vdO1CO9ksN8my+WOtQtX5CJui235CSOPz6eec2R/bmmP1gff7kOgynCh3Xgis9BO3
	Ge1uA24WQM6tt/3DTbAeOMstwTSor1Xk5tCrF2EhNJLMIsG5yXN5AfhoGUXDZxjqZh2KU7mIQgi
	46O0BgSA+iMcwSDKKsi8LGSpNxV6qg==
X-Received: by 2002:a05:6000:46d6:b0:48d:f831:2681 with SMTP id ffacd0b85a97d-48e264ce32cmr1131712f8f.38.1792564436308;
        Tue, 20 Oct 2026 23:33:56 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([5.15.72.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2581f15esm3726408f8f.20.2026.10.20.23.33.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 23:33:55 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno Sa <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: Flaviu Nistor <flaviu.nistor@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH] docs: iio: add documentation for ti-ads1015 driver
Date: Wed, 21 Oct 2026 09:33:50 +0300
Message-ID: <20261021063350.7984-1-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add documentation for the ADS1015 ADC IIO driver, which describes channels,
IIO attributes, threshold events and ABI usage examples.

Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
---
 Documentation/iio/index.rst      |   1 +
 Documentation/iio/ti-ads1015.rst | 129 +++++++++++++++++++++++++++++++
 2 files changed, 130 insertions(+)
 create mode 100644 Documentation/iio/ti-ads1015.rst

diff --git a/Documentation/iio/index.rst b/Documentation/iio/index.rst
index d0fb32f4b80f..47ba249dae0b 100644
--- a/Documentation/iio/index.rst
+++ b/Documentation/iio/index.rst
@@ -43,3 +43,4 @@ Industrial I/O Kernel Drivers
    bno055
    ep93xx_adc
    opt4060
+   ti-ads1015
diff --git a/Documentation/iio/ti-ads1015.rst b/Documentation/iio/ti-ads1015.rst
new file mode 100644
index 000000000000..214e50c39821
--- /dev/null
+++ b/Documentation/iio/ti-ads1015.rst
@@ -0,0 +1,129 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+=====================
+TI ADS1015 ADC driver
+=====================
+
+Driver for the Texas Instruments ADS1015 and related I2C analog-to-digital
+converters. The module name is ``ads1015``.
+
+Supported devices
+=================
+
+* `ADS1015 <https://www.ti.com/product/ADS1015>`_: 12-bit ADC, programmable data rate from 128 to 3300 samples/s.
+* `ADS1115 <https://www.ti.com/product/ADS1115>`_: 16-bit ADC, programmable data rate from 8 to 860 samples/s.
+* `TLA2024 <https://www.ti.com/product/TLA2024>`_: 12-bit ADC, programmable data rate from 128 to 3300 samples/s.
+
+The ADS1015 and ADS1115 provide a comparator; the TLA2024 does not.
+
+I2C address
+===========
+
+The ADDR pin selects the 7-bit I2C address.
+For ADS1015 and ADS1115, the possible addresses are:
+
+* ``0x48``: ADDR connected to GND
+* ``0x49``: ADDR connected to VDD
+* ``0x4a``: ADDR connected to SDA
+* ``0x4b``: ADDR connected to SCL
+
+For the TLA2024, the possible addresses are:
+
+* ``0x48``: ADDR connected to GND
+* ``0x49``: ADDR connected to VDD
+* ``0x4b``: ADDR connected to SCL
+
+
+Channel configuration
+======================
+
+The driver exposes four single-ended voltage channels (AIN0 through AIN3,
+measured relative to GND) and four differential channels (AIN0-AIN1,
+AIN0-AIN3, AIN1-AIN3, and AIN2-AIN3). Device Tree child nodes configure the
+initial settings for the corresponding conversion input. They do not restrict
+which IIO channels are available.
+
+The child node ``reg`` values select the conversion input as follows:
+
++---------+------------------+
+| ``reg`` | Conversion input |
++=========+==================+
+| 0       | AIN0 - AIN1      |
++---------+------------------+
+| 1       | AIN0 - AIN3      |
++---------+------------------+
+| 2       | AIN1 - AIN3      |
++---------+------------------+
+| 3       | AIN2 - AIN3      |
++---------+------------------+
+| 4       | AIN0 - GND       |
++---------+------------------+
+| 5       | AIN1 - GND       |
++---------+------------------+
+| 6       | AIN2 - GND       |
++---------+------------------+
+| 7       | AIN3 - GND       |
++---------+------------------+
+
+``ti,gain`` selects the full-scale input range using the following index:
+
++-------+--------------------------+
+| Index | Full-scale range         |
++=======+==========================+
+| 0     | +/- 6.144 V              |
++-------+--------------------------+
+| 1     | +/- 4.096 V              |
++-------+--------------------------+
+| 2     | +/- 2.048 V (default)    |
++-------+--------------------------+
+| 3     | +/- 1.024 V              |
++-------+--------------------------+
+| 4     | +/- 0.512 V              |
++-------+--------------------------+
+| 5     | +/- 0.256 V              |
++-------+--------------------------+
+
+For a channel node that omits ``ti,gain``, the default index is 2.
+
+``ti,datarate`` selects the data rate by index. For the ADS1015 and TLA2024,
+indices 0 through 7 select 128, 250, 490, 920, 1600, 2400, 3300, and 3300
+samples/s, respectively. For the ADS1115, they select 8, 16, 32, 64, 128,
+250, 475, and 860 samples/s. For a channel node that omits
+``ti,datarate``, the default index is 4.
+
+The ``label`` property is exposed through the channel's ``in_voltageY_label``
+sysfs attribute. Without a defined label, the datasheet input name is used
+(for example, ``AIN0`` or ``AIN0-AIN1``).
+
+IIO attributes
+==============
+
+Each voltage channel provides a raw reading, a label, scale, and sampling frequency.
+The scale and sampling frequency can be changed at runtime; their available
+values are listed by ``scale_available`` and ``sampling_frequency_available``.
+
+Threshold events
+================
+
+The ADS1015 and ADS1115 can report threshold events when the ALERT/RDY pin is
+connected to an interrupt. The driver supports one active comparator channel
+at a time, and threshold events cannot be enabled while buffered capture is
+active. The TLA2024 does not support threshold events.
+
+The rising threshold value sets the upper threshold. The falling threshold
+value sets the lower threshold; enabling the ``either`` event uses both values
+in window-comparator mode. The event period selects the comparator queue
+duration, which corresponds to 1, 2, or 4 consecutive conversions at the
+channel's configured sampling frequency.
+
+Usage examples
+--------------
+
+.. code-block:: bash
+
+	root:/sys/bus/iio/devices/iio:device0# cat name
+	ads1015
+	root:/sys/bus/iio/devices/iio:device0# cat in_voltage0_label
+	AN0
+	root:/sys/bus/iio/devices/iio:device0# cat in_voltage0_raw
+	750
-- 
2.34.1

