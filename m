Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF5333ADAE
	for <linux-doc@vger.kernel.org>; Sun,  7 Jun 2026 23:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780875920; cv=none; b=UaSQv01t/Cf2KdHx/WgpSKnUvAUjvc+Z80Ps29Iup2zayxTTQYrfMxsb/ItUiOpN8LzNhTvl+hxuaoGlD5w+6Kpk313CEv1QltLnhYgVFVx6cgeMvQb6mihep4mFQvOmqgE86JwIyUtJE0G9U9owtmG01nrP1yht7RwzJtFzRGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780875920; c=relaxed/simple;
	bh=frVXIk/he5j7loUU8RveXgVsf8ozNDsmdNT6TSVEGGo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pjUm9rbbbGEzVBP8fqlhnFvr/gum8wplbRMY4M4n8I5oBHl9c3MJrls4WqLmQG3aSvDioE4lVwC09mfP92aeTtfn0JEFYwD0V7F0Ibn0nBpahdCD1JdwSsZ95jVQq9sNdKJnonz5XFxJavPKQUjHIPRxCKEonQtYq9xLCtU7y3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=anuuLU2N; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="anuuLU2N"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8423f1e2f8eso2845318b3a.1
        for <linux-doc@vger.kernel.org>; Sun, 07 Jun 2026 16:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780875918; x=1781480718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kKK4DtRzZCaG1BhvbydcKcJ9uELhzs4pECkpn9X7PSg=;
        b=anuuLU2Nb1sfuEmx1Z2ofb6Wz2GeMv5Nj9KRv5a2lw88N26XdiTCZq+WtXn3JGuEWU
         2BT7/DGZ6qejsOrcvBLm+SLj1w3tXaKudNzM5qMCcbEN8i4FtjBQU4XbpJZzJZRk5MxM
         mGY2LQhnSOcJ0W6G4z/lXATjj0mbGhzd551sMXNRJt321S/K0A12G9EMbLJH927DOPf5
         W4D2aN7ynqB01YWAOPVmhe+fh5jRDy0OCLjVIsYY32i/Rrxn6qW75Ns8CKeqjCWKUfsC
         oh6hS1vdfb6L9D6h2FFjHdkVDoT2DJuvuyTYb2xFDdnj6uSARe5ZCo44refuIPPZgtys
         fpgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780875918; x=1781480718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kKK4DtRzZCaG1BhvbydcKcJ9uELhzs4pECkpn9X7PSg=;
        b=dcffu4520qxaJ/zl9ZDf6BMszsNhAfk9uSdrt9kX5eoaI8/4zA0ICb80wfdS5TzGkd
         GAlJRce8sv2Zc7NNfSkX4zsqVEQwTLc50voGBvU9IOqukpB4I6jRl87lIZEJ0pEX32dZ
         SsV/HSh1ACweVyAW+yQjoPNslWfmprPBwRqQJakFwVWOXgpHk+jexoZHoW8+ti+xYJsB
         YA8cHRxJR+brRGas4wkJc/JyB7tXYHS8BBS9IOla4inYaCTov1yN+epx0dgUeRYYCPOF
         9U+RgYY4HzV+Zy3VnF6sTdQKwIrk66O8B0FwtZF4pVpXy5bDNhm3wdofEwr5jYAivaIE
         EB1w==
X-Forwarded-Encrypted: i=1; AFNElJ/Jay5NFtuLEfpI4nWzclssjwcqRdvwkrr85EwMhJSKbiWra25SU6ywnshGBW0plxYCyTCMhfsi8Ms=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx63GZvHNPB+diq5SvlB98dUwTjr6dHNxjUub8aZsg56RZUZEfx
	pGt+oC3HWFSPiRxC6bWuY5HENMR/p3KqpsIsa4oYc9IsHyqfL6o7tmt2
X-Gm-Gg: Acq92OHQH3cSym+CfSpbp+Che/qGxTPj6qo8I2lTgYmU0N8I2SlcJXpvklsY6yhVnZo
	SLFAzaLaujb/JNLzqMkQzpquz89clEFpXsSdSckZ39Ho7pug1+6TEQ9SpPn6E/9e7yYQoUEnvxO
	gg9Uj01HlbKmc2fhsJxtOu7GZZ8XT90PYdrhuyMBNRkmYpY27Uajsm1Y6DrqC9ToKu5sxWGW00R
	MagSWgPgXawmqwSI/m/T1yWuJ48Kv1hAfnG6o2TUXMhpbhpjsf0a91lp9aFxzpsetVj5ybcwTEE
	qwX7zfVG+8aYTItF7j1+cC76YdVYTQhyuZuWRUTQ0aXbatJHayElPtImK7O3XIqVpVV9Mo0sAuS
	6f8mcAonq3hPAlW6v7sY5TUOevp4nAHQPOOijqPB9VxYd8XQ6ABHRvxG+ZdV4gE/NX1kgEUY6cM
	LckcZ5rZsXuw5us1wolVg/3bSKq0rzfEYWukXyRbtj4Xg+vtpvgUeC5XHu8AVW8o7d2tNrTg3AY
	yLNtFd8BUEHeaHlR3KWHELn3E4YFSxH9i0LOibg2G6q2YR6/WIVBigOlww=
X-Received: by 2002:a05:6a00:21ce:b0:842:6fec:1297 with SMTP id d2e1a72fcca58-842b0d81b56mr13302391b3a.9.1780875917910;
        Sun, 07 Jun 2026 16:45:17 -0700 (PDT)
Received: from DESKTOP-G3E0OSP.localdomain ([112.172.255.242])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828d6bd1sm19257732b3a.44.2026.06.07.16.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 16:45:17 -0700 (PDT)
From: Jinseob Kim <kimjinseob88@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	linux-iio@vger.kernel.org
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH RFC v4 2/6] Documentation: iio: add Open Sensor Fusion driver overview
Date: Mon,  8 Jun 2026 08:43:39 +0900
Message-ID: <20260607234343.22109-3-kimjinseob88@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260607234343.22109-1-kimjinseob88@gmail.com>
References: <20260607234343.22109-1-kimjinseob88@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a short driver-facing overview.

Leave full protocol details to project docs.

Signed-off-by: Jinseob Kim <kimjinseob88@gmail.com>
---
 Documentation/iio/index.rst                   |   1 +
 .../iio/open-sensor-fusion-protocol-v0.rst    | 308 ------------------
 Documentation/iio/open-sensor-fusion.rst      |  62 ++++
 MAINTAINERS                                   |   3 +-
 4 files changed, 64 insertions(+), 310 deletions(-)
 delete mode 100644 Documentation/iio/open-sensor-fusion-protocol-v0.rst
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
diff --git a/Documentation/iio/open-sensor-fusion-protocol-v0.rst b/Documentation/iio/open-sensor-fusion-protocol-v0.rst
deleted file mode 100644
index 80852f4cf..000000000
--- a/Documentation/iio/open-sensor-fusion-protocol-v0.rst
+++ /dev/null
@@ -1,308 +0,0 @@
-.. SPDX-License-Identifier: GPL-2.0-only
-
-Open Sensor Fusion protocol v0
-==============================
-
-This document describes the OSF0 UART wire format used by the Open Sensor
-Fusion Linux IIO driver. It is a wire format reference for the host driver. It
-is not a firmware programming interface.
-
-Background
-----------
-
-Open Sensor Fusion is an open hardware project for sensor aggregation devices
-and Linux IIO host support. It is not a generic sensor protocol standard. The
-first concrete hardware target is OSF GREEN, an STM32F405-based board that
-streams OSF0 frames to a Linux host.
-
-Public project documentation is available at:
-
-- https://www.opensensorfusion.org/
-- https://github.com/opensensorfusion
-- https://github.com/opensensorfusion/opensensorfusion-hardware
-- https://github.com/opensensorfusion/opensensorfusion-linux
-
-Wire format and driver subset
------------------------------
-
-OSF0 defines a small device-to-host UART frame format. The current RFC driver
-supports only the subset needed to expose OSF GREEN raw sensor data through
-IIO:
-
-- ``SENSOR_SAMPLE`` frames for accelerometer, gyroscope, magnetometer, and
-  temperature samples.
-- ``CAPABILITY_REPORT`` frames used to create the supported IIO devices.
-- ``DEVICE_STATUS`` frames cached for diagnostics.
-
-The driver ignores vendor private message types and does not implement command
-transport, calibration controls, USB transport, fusion output, or runtime
-capability removal.
-
-Device model
-------------
-
-An OSF0 device is a sensor aggregation device. It sends binary frames from the
-device to the host. The host driver decodes the frames and maps supported
-sensors to IIO devices.
-
-The hardware used for smoke testing is an OSF GREEN prototype with an
-STM32F405RGT6 MCU, an ICM42688P-class IMU, and an MMC5983MA magnetometer. That
-hardware is the first supported target for the RFC driver.
-
-Transport
----------
-
-The transport is UART at 115200 baud, 8 data bits, no parity, and 1 stop bit.
-The Linux transport is serdev. The v0 upstream driver covers device-to-host
-frames. Flow control is not used by the tested stream.
-
-Byte order
-----------
-
-All multi-byte integer fields are little-endian. Samples use signed 32-bit
-little-endian integers when ``sample_format`` is ``s32``.
-
-Frame format
-------------
-
-Each frame has a fixed 38-byte header, a payload, and a 4-byte CRC.
-
-.. list-table::
-   :header-rows: 1
-
-   * - Offset
-     - Size
-     - Field
-     - Description
-   * - 0
-     - 4
-     - magic
-     - ASCII ``OSF0``
-   * - 4
-     - 1
-     - protocol_major
-     - Must be ``0``
-   * - 5
-     - 1
-     - protocol_minor
-     - Minor version
-   * - 6
-     - 2
-     - header_len
-     - Must be ``38``
-   * - 8
-     - 2
-     - message_type
-     - Message type
-   * - 10
-     - 4
-     - payload_len
-     - Payload length in bytes
-   * - 14
-     - 8
-     - sequence
-     - Monotonic device sequence
-   * - 22
-     - 8
-     - timestamp_us
-     - Device timestamp in microseconds
-   * - 30
-     - 4
-     - flags
-     - Message flags
-   * - 34
-     - 4
-     - reserved
-     - Must be zero for v0
-   * - 38
-     - payload_len
-     - payload
-     - Message payload
-   * - 38 + payload_len
-     - 4
-     - crc32
-     - CRC32 over header and payload
-
-The frame CRC is IEEE CRC32 as implemented by ``crc32_le()`` with initial
-value ``0xffffffff`` and final XOR value ``0xffffffff``. The CRC field is not
-included in the CRC input.
-
-Message types
--------------
-
-.. list-table::
-   :header-rows: 1
-
-   * - Value
-     - Name
-     - Direction
-   * - ``0x0001``
-     - ``SENSOR_SAMPLE``
-     - device to host
-   * - ``0x0002``
-     - ``DEVICE_STATUS``
-     - device to host
-   * - ``0x0003``
-     - ``CAPABILITY_REPORT``
-     - device to host
-
-Message types ``0x7f00`` through ``0x7fff`` are reserved. Values at or above
-``0x8000`` are vendor private and are ignored by the current RFC driver.
-
-``SENSOR_SAMPLE`` payload
--------------------------
-
-The payload is a 16-byte payload header followed by ``4 * channel_count`` bytes
-of sample data.
-
-.. list-table::
-   :header-rows: 1
-
-   * - Offset
-     - Size
-     - Field
-     - Description
-   * - 0
-     - 2
-     - sensor_type
-     - Sensor type ID
-   * - 2
-     - 2
-     - sensor_index
-     - Instance index
-   * - 4
-     - 2
-     - channel_count
-     - Number of ``s32`` channels
-   * - 6
-     - 2
-     - sample_format
-     - Must be ``1`` (``s32``)
-   * - 8
-     - 4
-     - scale_nano
-     - Scale factor in nano-units
-   * - 12
-     - 4
-     - reserved
-     - Must be zero for v0
-   * - 16
-     - 4 * channel_count
-     - samples
-     - Signed 32-bit channel samples
-
-The current RFC driver accepts only ``sample_format = s32`` and only the fixed
-channel counts used by its supported IIO devices.
-
-``DEVICE_STATUS`` payload
--------------------------
-
-The payload size is 20 bytes. Fields are ``uptime_s``, ``status_flags``,
-``error_flags``, ``dropped_frames``, and a reserved field. Each field is
-32 bits. The reserved field must be zero for v0.
-
-``CAPABILITY_REPORT`` payload
------------------------------
-
-The base payload size is 4 bytes. It contains ``capability_count`` and a
-reserved field. The reserved field must be zero for v0. Each capability entry
-is 20 bytes:
-
-.. list-table::
-   :header-rows: 1
-
-   * - Offset
-     - Size
-     - Field
-     - Description
-   * - 0
-     - 2
-     - sensor_type
-     - Sensor type ID
-   * - 2
-     - 2
-     - sensor_index
-     - Instance index
-   * - 4
-     - 2
-     - channel_count
-     - Number of channels
-   * - 6
-     - 2
-     - sample_format
-     - Must be ``1`` (``s32``)
-   * - 8
-     - 4
-     - scale_nano
-     - Scale factor in nano-units
-   * - 12
-     - 4
-     - flags
-     - Capability flags
-   * - 16
-     - 4
-     - reserved
-     - Must be zero for v0
-
-Capability flag bit 0 means enabled by default. Bit 1 means calibrated data can
-be provided by the device. Other bits are invalid for v0.
-
-Sensor type IDs
----------------
-
-.. list-table::
-   :header-rows: 1
-
-   * - Value
-     - Sensor
-     - Current RFC driver mapping
-   * - ``0x0001``
-     - accelerometer
-     - ``IIO_ACCEL``, X/Y/Z
-   * - ``0x0002``
-     - gyroscope
-     - ``IIO_ANGL_VEL``, X/Y/Z
-   * - ``0x0003``
-     - magnetometer
-     - ``IIO_MAGN``, X/Y/Z
-   * - ``0x0004``
-     - barometer
-     - not mapped
-   * - ``0x0005``
-     - temperature
-     - ``IIO_TEMP``
-   * - ``0x0006``
-     - humidity
-     - not mapped
-   * - ``0x0007``
-     - ambient light
-     - not mapped
-   * - ``0x0008``
-     - proximity
-     - not mapped
-
-Scaling
--------
-
-``scale_nano`` is the per-channel scale value in nano-units. The Linux driver
-maps it to ``IIO_CHAN_INFO_SCALE`` as integer plus nano. The exact physical
-unit depends on the IIO channel type.
-
-Timestamps
-----------
-
-The frame header carries ``timestamp_us``, a device-side timestamp in
-microseconds. UART buffering and host scheduling can add delay before a frame
-is processed by the host.
-
-The current RFC driver does not claim production-grade host/device timestamp
-correlation. Buffered IIO timestamps are taken from IIO timestamp clock handling
-when samples are pushed to IIO buffers.
-
-Non-goals for v0 upstream
--------------------------
-
-The v0 upstream driver does not include USB transport, fusion output, Attitude
-and Heading Reference System (AHRS) output, Kalman output, calibration command
-ABI, custom sysfs control surface, production timestamp correlation, or runtime
-capability removal.
diff --git a/Documentation/iio/open-sensor-fusion.rst b/Documentation/iio/open-sensor-fusion.rst
new file mode 100644
index 000000000..244a4fecb
--- /dev/null
+++ b/Documentation/iio/open-sensor-fusion.rst
@@ -0,0 +1,62 @@
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
+is not the Linux driver identity. Protocol versioning is carried by the
+``protocol_major`` and ``protocol_minor`` fields in the frame header.
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
diff --git a/MAINTAINERS b/MAINTAINERS
index e227b9aff..2ddefc42d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20015,7 +20015,7 @@ OPEN SENSOR FUSION IIO DRIVER
 M:	Jinseob Kim <kimjinseob88@gmail.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/iio/opensensorfusion,osf.yaml
-F:	Documentation/iio/open-sensor-fusion-protocol-v0.rst
+F:	Documentation/iio/open-sensor-fusion.rst
 F:	drivers/iio/opensensorfusion/Kconfig
 F:	drivers/iio/opensensorfusion/Makefile
 F:	drivers/iio/opensensorfusion/osf_core.*
@@ -20024,7 +20024,6 @@ F:	drivers/iio/opensensorfusion/osf_protocol.*
 F:	drivers/iio/opensensorfusion/osf_serdev.c
 F:	drivers/iio/opensensorfusion/osf_stream.*
 
-
 OPENCOMPUTE PTP CLOCK DRIVER
 M:	Vadim Fedorenko <vadim.fedorenko@linux.dev>
 L:	netdev@vger.kernel.org
-- 
2.43.0

