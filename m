Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE81139A4CE
	for <linux-doc@vger.kernel.org>; Tue, 16 Jun 2026 07:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781594603; cv=none; b=c2/qSdG2JjY2vDv0R+6Qnr8dNOYKNzzSGXO5yr0zxOkXRksPNvxVrXzmcgYUUQa3Dl3+7XuzRnZG362UrPVMgCcUzr4JdxBOe+TwAsMMSxxPj3kAv8sxGKOBQEGTEsxnwT49qpIE3+woYJRPF7YWECW1VUaNQPb3hv5fhm0dj1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781594603; c=relaxed/simple;
	bh=bmfwXkXMYCQ+RKrS7k10m9FyRWRufppNyWl2BrUYexg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p1Cr0momnm83oWPUZif/Pget4RmdvlFJMgXRGbTC34fi2SSzYoqIp1E0GGnqJqhj2nwi6CIVRi6kIoROwSyKvTvmT6gP1DQ5uG+DEVmRtEDjANT4SgOY2lVtn8wDPQ7j/pzll2yfwqZFGevz4wgA5PPrGwQW/zUqQgs6qcHreJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OBbN/W1/; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OBbN/W1/"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2c40397e746so25057615ad.3
        for <linux-doc@vger.kernel.org>; Tue, 16 Jun 2026 00:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781594600; x=1782199400; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q+5vGSmETl/Ms8XBPdeUCk9fXSncbDGOOiAZTfMUEf8=;
        b=OBbN/W1/mAj19AKMD0BoHllo/tq2hkKmxDgZo+XGKKHykp24yb6K0gUeyhT0JNj3Lk
         iHoPwLd1Rf7bmeXxZl/kw3fYhKHRhzravy36mxjc8FDuiaPjRAplGX5e8tgBqq3rwl/m
         VH+zVOyFLDQoCqeyoaVbGjoyTcHjpGnoMZxo3E7imI8by0qGu8qG+VgkfXBWKn2yQ7yF
         L8GpHZIcsOqKROhwX00yeY28tFKwET5/eY8Aoa7hHG5uKx2Zgj5wJcPtVJYytWFpGAJs
         dTZEs1yoLEbyh4Xgw03oq5zN7iBU5cienCFHrPhnt5MqUN+Igc7R6bH7MB7hUOOxx09B
         Pjnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781594600; x=1782199400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q+5vGSmETl/Ms8XBPdeUCk9fXSncbDGOOiAZTfMUEf8=;
        b=E3r83DukYGmDRSCELhE/kpXJRffkIT942WYpFNuLCLuxeaSo8EQHbcElMStgtsz6tm
         QmoFENXxRuGDqP7ueC2o1xDU6xQqGo6O/tMW757tbJqEHqYGP16oBtDNIMDzq7ie5muG
         Jo7MOzIEMYUsEAclNe0i6MbeoTxAusjymcB6QgGJ/YbXcdIGIc1OlGr3eO25WiHtun0U
         +b0r77OR0dnX6fLjJIYqFYvMSn5LEoAeJlT9DJ6muNGeyjGHe0RUUM0/n9R3CaRxj+F7
         3ye7eSOrymS/g9Ni5zskpK9Vv0T+IId9IykR3DLnJYuAZ7jGFeuIJ50YyTys/cXzGRb7
         I4+w==
X-Forwarded-Encrypted: i=1; AFNElJ9Prvhq9ZJN7E3BI8O+faFZhgqU572MSzqyRkd4N7hWvRIQEimqnUoig/sTK+rvIh7LCJUu7BIA7iY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxzh7uorLHaRxaWXdTDncovts63pMgS5yGFvjCYliWzCW3d0mFM
	MiJmbXmBi4bzpnt2YZ4uIKVUUjWXilSO9cVolIUtGU9Lfac4+uECPCkC
X-Gm-Gg: Acq92OF0tYcfiRNUl59Ewtrr49iHKSCTTldMXzY4UXSyG97UE6TSdJPk0yirXK/R/Xl
	QC4Hsaukfv/cfuewtxCxEWUKtgw2lh7fA9eXaT1RknxZFUSQBOYtzm9gAmnTkqWEHBdLx32EJH/
	dlxm/QLrfST8Pg/Mo37gnHeSmJeMF1DbtoHYZM83itdAFdsWBg9f4GOeyTPtwA/8oE+V6A0H7/4
	H9j85ph4i7j/Qp7lbOrkAKm3K3qpSE7IpnVeOk76o8SM05/7UIOHvyOF+zv4UBtDtNsHolcyVap
	nNRA6+LLwzWnTJ4NBMbXYE8QTMl81TZ2b1tc2xJjK7Ii9pEFt+YlxLDEeLMQNtgHYJwaFx9/rrS
	OwhHTgIj9gErstdAkC1QhyyPCuGJPWJOXiQ0yZj3cjnkFLj134zyYEfjtVFvxyNpSysm9gar1uL
	fc2s9115Dfwait7LQHztTRHmQDP1vqxaBPL1Arp87agdcVe1iE5ghG9sGZQjcZwvYbh5ALMCRTH
	znUrvILVfw4dBMkUE1t0tNxmE9vrb7ZHEWzLVc=
X-Received: by 2002:a17:902:f645:b0:2b2:ec46:dfed with SMTP id d9443c01a7336-2c69a1f51d9mr24931525ad.31.1781594600358;
        Tue, 16 Jun 2026 00:23:20 -0700 (PDT)
Received: from DESKTOP-G3E0OSP.localdomain ([112.172.255.242])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f1014sm123513435ad.16.2026.06.16.00.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 00:23:20 -0700 (PDT)
From: Jinseob Kim <kimjinseob88@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jinseob Kim <kimjinseob88@gmail.com>
Subject: [PATCH RFC v5 2/6] Documentation: iio: add Open Sensor Fusion driver overview
Date: Tue, 16 Jun 2026 16:22:38 +0900
Message-ID: <20260616072242.3942-3-kimjinseob88@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260616072242.3942-1-kimjinseob88@gmail.com>
References: <20260616072242.3942-1-kimjinseob88@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the Linux IIO mapping for Open Sensor Fusion devices, including
capability-driven IIO device registration and the initially supported
receive path.

Call out that OSF0 is a wire magic value, while protocol_major and
protocol_minor carry protocol compatibility inside frames. The Linux
compatible remains the generic Open Sensor Fusion host interface.

Signed-off-by: Jinseob Kim <kimjinseob88@gmail.com>
---
 Documentation/iio/index.rst              |  1 +
 Documentation/iio/open-sensor-fusion.rst | 71 ++++++++++++++++++++++++
 2 files changed, 72 insertions(+)
 create mode 100644 Documentation/iio/open-sensor-fusion.rst

diff --git a/Documentation/iio/index.rst b/Documentation/iio/index.rst
index ba3e609c6..2713ec5e0 100644
--- a/Documentation/iio/index.rst
+++ b/Documentation/iio/index.rst
@@ -38,4 +38,5 @@ Industrial I/O Kernel Drivers
    adxl345
    bno055
    ep93xx_adc
+   open-sensor-fusion
    opt4060
diff --git a/Documentation/iio/open-sensor-fusion.rst b/Documentation/iio/open-sensor-fusion.rst
new file mode 100644
index 000000000..cf3bbd761
--- /dev/null
+++ b/Documentation/iio/open-sensor-fusion.rst
@@ -0,0 +1,71 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+Open Sensor Fusion
+==================
+
+Open Sensor Fusion is a sensor aggregation hub interface. The Linux IIO driver
+receives OSF protocol frames from an attached device, discovers supported sensor
+streams through capability reports, and registers matching IIO devices for the
+sensor classes supported by the driver.
+
+This document is a driver-facing overview for the Linux IIO mapping. The full
+wire protocol, firmware behavior, and hardware model details belong in the Open
+Sensor Fusion project documentation.
+
+Device Model
+------------
+
+An OSF device sends binary frames from the device to the host. The host driver
+uses ``CAPABILITY_REPORT`` messages to discover which sensor streams are
+available. Device Tree describes the attached OSF sensor aggregation hub; it does
+not enumerate the individual sensors discovered at runtime.
+
+The currently supported Linux subset exposes:
+
+* accelerometer samples as ``IIO_ACCEL`` X/Y/Z channels,
+* gyroscope samples as ``IIO_ANGL_VEL`` X/Y/Z channels,
+* magnetometer samples as ``IIO_MAGN`` X/Y/Z channels, and
+* temperature samples as ``IIO_TEMP``.
+
+Protocol Scope
+---------------
+
+The driver supports OSF protocol major version 0 for the initial IIO receive
+path. The current wire magic is ``OSF0``; that string is a wire-format detail and
+is not the Linux driver identity. Device Tree keeps the generic
+``opensensorfusion,osf`` compatible rather than naming a product such as OSF
+GREEN or a wire magic value.
+
+Protocol versioning is carried by the ``protocol_major`` and ``protocol_minor``
+fields at fixed offsets in the OSF frame header. The driver currently
+supports ``protocol_major`` 0. ``protocol_minor`` changes within major version
+0 are intended to remain backward-compatible within the fixed header layout.
+Incompatible wire-format changes require a new ``protocol_major``. A future
+device that cannot expose compatible version discovery through that fixed
+header layout would need a different Device Tree compatible.
+
+The initial Linux driver handles device-to-host frames for:
+
+* ``SENSOR_SAMPLE`` buffered and direct-mode sample data,
+* ``CAPABILITY_REPORT`` based IIO device registration, and
+* ``DEVICE_STATUS`` cache updates.
+
+Vendor-private message types are ignored. Command transport, calibration
+control ABI, fusion output ABI, and runtime capability removal are outside the
+initial Linux IIO receive path.
+
+Timestamps
+----------
+
+OSF frames include a device-side ``timestamp_us`` field. Buffered IIO samples use
+an IIO timestamp captured on the host when samples are pushed to IIO buffers.
+The initial driver does not correlate the device timestamp with the host IIO
+clock.
+
+Compatibility Notes
+-------------------
+
+The project protocol documentation should define the compatibility rules for
+reserved fields, optional flags, and trailing extension data. Until those rules
+are finalized, the Linux decoder keeps conservative bounds checks around the
+currently supported message layouts.
-- 
2.43.0

