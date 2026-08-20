Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA67367B67
	for <linux-doc@vger.kernel.org>; Thu, 20 Aug 2026 05:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787202411; cv=none; b=E6gu1QVkjUZeYB6Ypsc/IlrASQ36gdp3dO7PL/H5YUCjxohWOh9fhv3PdMOp33fzs7Q+O1E8B5fX+d43FezWpu052HNF6MN+wEFJ/8nC0rad8EZTnKhtBhddoNE6i2UfyammzyEew2teRniVCnByhMaVHOq7CRK7dMHiSb7QRHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787202411; c=relaxed/simple;
	bh=tppiwU0afVTqKAsxHD7NixQhO94yjKbGlSO7BWcNl38=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j8i8SkQqajCnMivU2O51Sxwrtx4ik7dhelck4n5hS4A0Ak29dEMu3mhojxiRcMgS//b5eBUdSPGOBkYMMcYkCqz42SR1uNrM3KlHctDqAEPAntfhdsU8uh75c8ffdyygeQTaueqw6TawgK45OGE3fJ2zZJ3iD6gjsMRJc4uj8yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m5dv4fFy; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m5dv4fFy"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cf6d65d8a7so20823345ad.0
        for <linux-doc@vger.kernel.org>; Wed, 19 Aug 2026 22:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787202409; x=1787807209; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TJsCOrmxkPDlt4vp4WrYe2lu9E0Ol0sMmnqsSnQvLkI=;
        b=m5dv4fFy9lXteWvmDVqOS39Yc6X7+tLaSZsT4Hk+kof39Sg9XdLAFs9l7ynPFVRL7L
         GKuMnHVMOT5EsHREzKuCUjamwlmkxkqofFNmvFylUmdT4Wjv/zWNfC+Aff+Dsnobu9rF
         uhyxpohHms3q2wG9SxK43abhiqm2tVact2+GVAt/KAUT5zbGQAtDF7PobWRC+Q66pebz
         ekriEmD7NuwRrgH077oskHlr1+5lTMJm4JJA0TvhZs4yM7gfCGgeioxtDDLeJ7qz507a
         NkfLbMzxvNXXENVI0knuV81rMk5D1bSDb8zw8bno+sA7+3uFB6xUkaDHkD/oV5xy2y0u
         ltmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787202409; x=1787807209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TJsCOrmxkPDlt4vp4WrYe2lu9E0Ol0sMmnqsSnQvLkI=;
        b=I+uMHDbruho/SZLecStaghsdFi9geUwvjnyICt5ISvUxgCSKkKlHVE9i5sMJuBTNlz
         dShwBBIOAVh22whhiYA+Yc53WYA8T0M6+e2r9afiIUTSdVcDek+i9nzO+0DoyED4WV2J
         /ZLgsQ4jKoQDI42C2IcAEzbNylmUqwt1T2NZZoqUer6wIFfrJSVOwUnUoDzzKTmDQQDW
         jBCZc680/yy5yH9vv+uqKsDxqUBxepPEcCUTPXFUJ2Yp00/JINcqUF/na4gAaatZObb/
         l2txXzoVAdId+w4gMGKAvFT8ldqtgXmSBNezwM8VLgzBThw5GWHE1t/LW97LQR0YxSFS
         UpNQ==
X-Forwarded-Encrypted: i=1; AHgh+RprIcsBar9hkFyYtUqyPGtGvRtvQt9ErxXbpkGmQCpGhkw58vfaSP90YgQtL2VxB1vGfAobovqrMoA=@vger.kernel.org
X-Gm-Message-State: AFuF++lWEPhqu6zikE+/W6vIzpUvcI4iQxyfa1iGpeKCr8zO5rSMNAyD
	ODkYjjbVjRS4SGEbCyAIk+wiZqfoeY9VO1mDqHs8qr30O+M/gb09yBpe
X-Gm-Gg: AR+sD12LxLRfQP390ez25Z5emiIlCNRw8dXrC2b+mDD0dAInUtOxz7FhTVBIl575qTV
	dDlvvhz8igwxW8W7SK4Eico/vGX8341Q7/evnraxXy115B/LtBZhqGQhHPNFaEhXjUk2Q4klhsA
	Ls/9Q4uW38t74s3e9acft5SWRHsO3jq0buwfnEHgxQYkKT9XWkqVrMu82E2qxG5mP0A046qAtCp
	UAiRtf91izh0dX1UBN3h3sT3adGIBs7eAZYwKSayLK9DmOpY4+IlX43NjNo5sotuuxnJrX9xu3g
	cTPIMT4cSbjtzguSNeRMen7EzyEMSlsjyUqNoHqpNmQ54ivyWGdVxe0a1cY7R8jJSuCewPeIVYD
	dfUbAj75UCM1YodB4FMNnnfLQeR3zOQhGCrHfejXEWTQiGuuJCSxCFmEv+uHxO1vAkz9vwsVSeW
	33zmq9fla2OW4bUVb/j6MhmA7mw3iibL9EfacQikOBtnp0M79bRYj/blrfu4gXauhA6CuGS9SFG
	3RiPVS6oVMLBHtnDov+2bcn3c7l6KSyNZVnds7d0fXRjdZgJNtoCjBbSORwre7/PULuoxCC2zR/
X-Received: by 2002:a17:903:350c:b0:2cc:aa36:c046 with SMTP id d9443c01a7336-2d601a8e888mr195631285ad.14.1787202408730;
        Wed, 19 Aug 2026 22:06:48 -0700 (PDT)
Received: from DESKTOP-G3E0OSP.localdomain ([112.172.255.242])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d62d58a82dsm2040685ad.18.2026.08.19.22.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 22:06:47 -0700 (PDT)
From: Jinseob Kim <kimjinseob88@gmail.com>
To: jic23@kernel.org,
	linux-iio@vger.kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-kernel@vger.kernel.org,
	rdunlap@infradead.org,
	joshua.crofts1@gmail.com,
	u.kleine-koenig@baylibre.com,
	julianbraha@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	grondon@gmail.com,
	devicetree@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v8 2/5] Documentation: iio: add Open Sensor Fusion driver overview
Date: Thu, 20 Aug 2026 14:06:05 +0900
Message-ID: <20260820050608.5440-3-kimjinseob88@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820050608.5440-1-kimjinseob88@gmail.com>
References: <20260820050608.5440-1-kimjinseob88@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the Linux IIO mapping for Open Sensor Fusion devices.

The overview explains that sensor channels are discovered at runtime
from mandatory capability reports. It also documents that OSF0 is a
wire-format detail and that protocol_major and protocol_minor carry
protocol compatibility information.

Tested-by: Randy Dunlap <rdunlap@infradead.org> # docs build
Signed-off-by: Jinseob Kim <kimjinseob88@gmail.com>
---
 Documentation/iio/index.rst              |  1 +
 Documentation/iio/open-sensor-fusion.rst | 72 ++++++++++++++++++++++++
 MAINTAINERS                              |  1 +
 3 files changed, 74 insertions(+)
 create mode 100644 Documentation/iio/open-sensor-fusion.rst

diff --git a/Documentation/iio/index.rst b/Documentation/iio/index.rst
index b02b879b053a..c2b7963348fd 100644
--- a/Documentation/iio/index.rst
+++ b/Documentation/iio/index.rst
@@ -40,4 +40,5 @@ Industrial I/O Kernel Drivers
    adxl345
    bno055
    ep93xx_adc
+   open-sensor-fusion
    opt4060
diff --git a/Documentation/iio/open-sensor-fusion.rst b/Documentation/iio/open-sensor-fusion.rst
new file mode 100644
index 000000000000..c28886f3b961
--- /dev/null
+++ b/Documentation/iio/open-sensor-fusion.rst
@@ -0,0 +1,72 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+Open Sensor Fusion
+==================
+
+Open Sensor Fusion is a sensor aggregation hub interface. The Linux IIO driver
+receives OSF protocol frames from an attached device and registers matching IIO
+devices for the sensor classes supported by the driver. The actual sensor
+channels are discovered at runtime from mandatory OSF capability reports.
+
+This document is a driver-facing overview for the Linux IIO mapping. The full
+wire protocol, firmware behavior, and hardware model details belong in the Open
+Sensor Fusion project documentation.
+
+Device Model
+------------
+
+An OSF device sends binary frames from the device to the host. Devices using the
+``opensensorfusion,osf`` compatible are expected to provide
+``CAPABILITY_REPORT`` messages so the host can discover which sensor streams are
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
+The driver supports OSF protocol major version 0 for the IIO receive path.
+The current wire magic is ``OSF0``; that string is a wire-format detail and is
+not the Linux driver identity. Device Tree keeps the generic
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
+The Linux driver handles device-to-host frames for:
+
+* ``SENSOR_SAMPLE`` buffered and direct-mode sample data,
+* ``CAPABILITY_REPORT`` based IIO device registration, and
+* ``DEVICE_STATUS`` cache updates.
+
+Vendor-private message types are ignored. Command transport, calibration
+control ABI, fusion output ABI, and runtime capability removal are outside the
+Linux IIO receive path.
+
+Timestamps
+----------
+
+OSF frames include a device-side ``timestamp_us`` field. Buffered IIO samples use
+an IIO timestamp captured on the host when samples are pushed to IIO buffers.
+The driver does not correlate the device timestamp with the host IIO
+clock.
+
+Compatibility Notes
+-------------------
+
+The project protocol documentation should define the compatibility rules for
+reserved fields, optional flags, and trailing extension data. Until those rules
+are finalized, the Linux decoder keeps conservative bounds checks around the
+currently supported message layouts.
diff --git a/MAINTAINERS b/MAINTAINERS
index 17652ba6039d..9550cf1900bd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20297,6 +20297,7 @@ OPEN SENSOR FUSION
 M:	Jinseob Kim <kimjinseob88@gmail.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/iio/opensensorfusion,osf.yaml
+F:	Documentation/iio/open-sensor-fusion.rst
 K:	opensensorfusion
 
 OPENCOMPUTE PTP CLOCK DRIVER
-- 
2.43.0

