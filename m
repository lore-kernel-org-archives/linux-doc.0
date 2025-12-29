Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E15285404
	for <linux-doc@vger.kernel.org>; Mon, 29 Dec 2025 03:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766978298; cv=none; b=hhFyjX4x7aiKTkPSRbJThpvnCJ4rhVxHvD/wWpFJKdymlv1cEHJj5bzGjEn7wVOcpzw7lIFcLDDHOUOOi9h8pS3dnM4V0LbcRe2U/B5WI9bNrnciftBWrM+LvfGdszEAmVxP0BotKvKofGaCBYP/P8FxKu3q2BSs9SMTh1pyPbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766978298; c=relaxed/simple;
	bh=XYaXboJOIwWExtQVYjtJhShNUqA6WX7iezxCrD3Se64=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qMRA67J/Zm/iUv8an/MGNGc8l9yX8dGPTSeKLpXFqLJ3qtMf3auFomsinNHzBrvFGeh4fIHxESWklmW1lBTge6cCUZeZo9waZcUV/QDQRDB/ccLmJnX2sWde3SDsXpzDYdNneQDJf8jYJaZdSfetupjRQf6XG6Q9MSssMCHhSFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QscQB+5K; arc=none smtp.client-ip=209.85.214.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QscQB+5K"
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-29f30233d8aso101462805ad.0
        for <linux-doc@vger.kernel.org>; Sun, 28 Dec 2025 19:18:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766978291; x=1767583091; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Je7xOayPe6lie145+99KZwI9NOHLAn6kdXP9FqSG1cs=;
        b=QscQB+5K9+O9dUer3qLNZWlREZbAaZxVoyHuYENtX+Gyqp4lzDxlGaYLz1yoY1wRvL
         XCDmtvhl4BX+DU1WdGaQNxXJxl0hxb4FpgQB0M5/6ay4X7yzfb6RouUh/CTogGto5M7C
         HtCKor3cCR92R9I6Py8/TFQxj4zshknYgnW4yMW/oeW+2JD6T2WfSpQ5ilHa6tp1PvCy
         mBV4kM8JQ3WZXuHlShXOxedOpU9SkM2UZIky9cPr98j+t3YqZNLj9Cd3A4SAAE84yeiS
         F99GLTyZg9sg7ZdHhAyb65TlcoFUhBgBEdiIzhkdVrVgSpWQAsjkO6lYjJT5jbDmjC1e
         KDAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766978291; x=1767583091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Je7xOayPe6lie145+99KZwI9NOHLAn6kdXP9FqSG1cs=;
        b=IyJzkG+ndxAA+MLQb9qcA9joCIR61CTCbFbJUQbBYpvWWFe1ynpJ81kSThZOsYGCrX
         6f+hULiDjEG/OcQNeQidZ8OwIYFx2WN4I6Zy0Ff6lEU5bVpNLALR8Qe30jdOw+d9/Z9v
         AKZ7EPG4TbKqN94GvgQn2KmPIJfG32XjQO3D3JenqYJ5n8iiAHywiZDv2d4UPazL1zCG
         0oYO3L3wnyvaC4RRl5bJPABiqjvJ0BKcfSs0TEw9jPTA05LrDWDKbteuguwIks2DWTX4
         Uxa1URv8YGY9Pbo+61n/lUEXttTe5yajrTo4AtFSULKc3sz2jxL8vn28pzenXk3f1NUP
         j37g==
X-Forwarded-Encrypted: i=1; AJvYcCVY9Aa0qXafQLQ1+g2jJfVlpykYhCGxnB2fPXM5RagKMn+xWdjnufVJzqN5TgkJMvl8rgxb+lp9Sik=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/V1vIPfcGchSDi9UQ771Xa5FGM6t6tR7WUjrZ2qMfIGHBfuCo
	iVUNAV87phvdMbkYpXsKrmwTXqCfdCBYNfq25Gxl7ClmqhxHYpJ6ssFH
X-Gm-Gg: AY/fxX6CEsUIOtztiRLF+qCpiOcBfJIP2W+SzaS8SarlCHeynabHPYyyQc1GML2mMON
	2j+VBTccCP8Zt5r5KHmmihOFadOXz/czXdkd1NU3K7O9iZNuP0N7owLYcDR+yc6uhi0WD26SLJA
	rhKeWTXY/Akz4DTND/6l59HWvKsDgzmU+f8fCxl1EAyMohjeqYHm0ydAkLQU7O5cEU+SoJNQEUX
	gEIctZlEYG0B7rfrNr2U4WUMmZeGOxM7Ma0/lvd+3YdoJwikU6ODoQUphGj3OhVY0RxzDJWEixU
	srbEVCnZpJB2PbD1R90xNnh0KsD6XmPW3X+1QRt9P0P/zg2LZavBQ6VQxQuCd28+iJPYdUJRjKb
	eM2qvmtJ30TMWB/D5l2WxyTkU4IkDg+Chq8GZ7hy6urkx/CM3V0x/AZZ7vVlcji+VKQkRZW1IIu
	o/2wBqEFCFu4fJLwM1O61IVN25eSYYLKsuzx6uO+P8oth/XLERoFtZBqMEqfgD64M=
X-Google-Smtp-Source: AGHT+IESDqEdwWWq496LupX1iGYMiPcz/7pyGpkqX72E8H1V5Yam3WMu8UVCpG0PW4J/FIC8u+Nfqw==
X-Received: by 2002:a05:701a:ca0e:b0:11b:9386:a3bf with SMTP id a92af1059eb24-121722eb7f6mr27977586c88.42.1766978290223;
        Sun, 28 Dec 2025 19:18:10 -0800 (PST)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724dd7f5sm112992785c88.5.2025.12.28.19.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 19:18:09 -0800 (PST)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
	Zhixin Zhang <zhangzx36@lenovo.com>,
	Mia Shao <shaohz1@lenovo.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 16/16] HID: Add documentation for Lenovo Legion Go drivers
Date: Mon, 29 Dec 2025 03:17:53 +0000
Message-ID: <20251229031753.581664-17-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251229031753.581664-1-derekjohn.clark@gmail.com>
References: <20251229031753.581664-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds ABI documentation for the hid-lenovo-go-s and hid-lenovo-go
drivers.

Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 .../ABI/testing/sysfs-driver-hid-lenovo-go    | 724 ++++++++++++++++++
 .../ABI/testing/sysfs-driver-hid-lenovo-go-s  | 304 ++++++++
 MAINTAINERS                                   |   2 +
 3 files changed, 1030 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-hid-lenovo-go
 create mode 100644 Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s

diff --git a/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go b/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go
new file mode 100644
index 000000000000..4e298567ac40
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go
@@ -0,0 +1,724 @@
++What:		/sys/class/leds/go:rgb:joystick_rings/effect
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This controls the display effect of the RGB interface.
++
++		Values are monocolor, breathe, chroma, or rainbow.
++
++		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
++
++What:		/sys/class/leds/go:rgb:joystick_rings/effect_index
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This displays the available options for the effect attribute.
++
++		Values are monocolor, breathe, chroma, or rainbow.
++
++		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
++
++What:		/sys/class/leds/go:rgb:joystick_rings/enabled
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This controls enabling or disabling the RGB interface.
++
++		Values are true or false.
++
++		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
++
++What:		/sys/class/leds/go:rgb:joystick_rings/enabled_index
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This displays the available options for the enabled attribute.
++
++		Values are true or false.
++
++		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
++
++What:		/sys/class/leds/go:rgb:joystick_rings/mode
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This controls the operating mode of the RGB interface.
++
++		Values are dynamic or custom. Custom allows setting the RGB effect and color.
++    Dynamic is a Windows mode for syncing Lenovo RGB interfaces not currently
++    supported under Linux.
++
++		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
++
++What:		/sys/class/leds/go:rgb:joystick_rings/mode_index
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This displays the available options for the mode attribute.
++
++		Values are dynamic or custom.
++
++		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
++
++What:		/sys/class/leds/go:rgb:joystick_rings/profile
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This controls selecting the configured RGB profile.
++
++		Values are 1-3.
++
++		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
++
++What:		/sys/class/leds/go:rgb:joystick_rings/profile_range
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This displays the available options for the profile attribute.
++
++		Values are 1-3.
++
++		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
++
++What:		/sys/class/leds/go:rgb:joystick_rings/speed
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This controls the change rate for the breathe, chroma, and rainbow effects.
++
++		Values are 0-100.
++
++		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
++
++What:		/sys/class/leds/go:rgb:joystick_rings/speed_range
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This displays the available options for the speed attribute.
++
++		Values are 0-100.
++
++		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/firmware_version
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This displays the firmware version of the internal MCU.
++
++		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/fps_mode_dpi
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This displays the DPI of the right handle when the FPS mode switch is on.
++
++		Values are 500, 800, 1200, and 1800.
++
++		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/fps_mode_dpi_index
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This displays the available options for the fps_mode_dpi attribute.
++
++		Values are 500, 800, 1200, and 1800.
++
++		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/hardware_generation
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This displays the hardware generation of the internal MCU.
++
++		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/hardware_version
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This displays the hardware version of the internal MCU.
++
++
++		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/left_handle/auto_sleep_time
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This controls the sleep timer due to inactivity for the left removable controller.
++
++		Values are 0-255.
++
++		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/left_handle/auto_sleep_time_range
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This displays the available options for the left_handle/auto_sleep_time attribute.
++
++		Values are 0-255.
++
++		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/left_handle/calibrate_gyro
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This initiates or halts calibration of the left removable controller's IMU.
++
++		Values are start, stop.
++
++		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/left_handle/calibrate_gyro_index
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This displays the available options for the left_handle/calibrate_gyro attribute.
++
++		Values are start, stop.
++
++		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/left_handle/calibrate_gyro_status
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This displays the result of the last attempted calibration of the left removable controller's IMU.
++
++		Values are unknown, success, failure.
++
++		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/left_handle/calibrate_joystick
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This initiates or halts calibration of the left removable controller's joystick.
++
++		Values are start, stop.
++
++		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/left_handle/calibrate_joystick_index
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This displays the available options for the left_handle/calibrate_jotstick attribute.
++
++		Values are start, stop.
++
++		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/left_handle/calibrate_joystick_status
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This displays the result of the last attempted calibration of the left removable controller's joystick.
++
++		Values are unknown, success, failure.
++
++		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/left_handle/calibrate_tirgger
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This initiates or halts calibration of the left removable controller's trigger.
++
++		Values are start, stop.
++
++		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/left_handle/calibrate_gyro_trigger
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This displays the available options for the left_handle/calibrate_trigger attribute.
++
++		Values are start, stop.
++
++		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/left_handle/calibrate_trigger_status
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This displays the result of the last attempted calibration of the left removable controller's trigger.
++
++		Values are unknown, success, failure.
++
++		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/left_handle/firmware_version
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This displays the left removable controller's firmware version.
++
++		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/left_handle/hardware_generation
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This displays the hardware generation of the left removable controller.
++
++		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/left_handle/hardware_version
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This displays the hardware version of the left removable controller.
++
++		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/left_handle/imu_bypass_enabled
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This controls enabling or disabling the IMU bypass function of the left removable controller.
++
++		Values are true or false.
++
++		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/left_handle/imu_bypass_enabled_index
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This displays the available options for the left_handle/imu_bypass_enabled attribute.
++
++		Values are true or false.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/left_handle/imu_enabled
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This controls enabling or disabling the IMU of the left removable controller.
++
++		Values are true or false.
++
++		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/left_handle/imu_enabled_index
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This displays the available options for the left_handle/imu_enabled attribute.
++
++		Values are true or false.
++
++		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/left_handle/product_version
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This displays the product version of the left removable controller.
++
++		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/left_handle/protocol_version
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This displays the protocol version of the left removable controller.
++
++		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/left_handle/reset
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	Resets the left removable controller to factory defaults.
++
++		Writing 1 to this path initiates.
++
++		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/left_handle/rumble_mode
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This controls setting the response behavior for rumble events for the left removable controller.
++
++		Values are fps, racing, standarg, spg, rpg.
++
++		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/left_handle/rumble_mode_index
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This displays the available options for the left_handle/rumble_mode attribute.
++
++		Values are fps, racing, standarg, spg, rpg.
++
++		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/left_handle/rumble_notification
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This controls enabling haptic rumble events for the left removable controller.
++
++		Values are true, false.
++
++		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/left_handle/rumble_notification_index
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This displays the available options for the left_handle/rumble_notification attribute.
++
++		Values are true, false.
++
++		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/mode
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This controls the operating mode of the built-in controller.
++
++		Values are xinput or dinput.
++
++		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/left_handle/mode_index
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This displays the available options for the mode attribute.
++
++		Values are xinput or dinput.
++
++		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This controls the behavior of built in chord combinations.
++
++		Values are windows or linux.
++
++		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode_index
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This displays the available options for the os_mode attribute.
++
++		Values are windows or linux.
++
++		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/product_version
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This displays the product version of the internal MCU.
++
++		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/right_handle/protocol_version
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This displays the protocol version of the internal MCU.
++
++		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/reset_mcu
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	Resets the internal MCU to factory defaults.
++
++		Writing 1 to this path initiates.
++
++		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/right_handle/auto_sleep_time
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This controls the sleep timer due to inactivity for the right removable controller.
++
++		Values are 0-255.
++
++		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/right_handle/auto_sleep_time_range
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This displays the available options for the right_handle/auto_sleep_time attribute.
++
++		Values are 0-255.
++
++		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/right_handle/calibrate_gyro
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This initiates or halts calibration of the right removable controller's IMU.
++
++		Values are start, stop.
++
++		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/right_handle/calibrate_gyro_index
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This displays the available options for the right_handle/calibrate_gyro attribute.
++
++		Values are start, stop.
++
++		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/right_handle/calibrate_gyro_status
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This displays the result of the last attempted calibration of the right removable controller's IMU.
++
++		Values are unknown, success, failure.
++
++		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/right_handle/calibrate_joystick
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This initiates or halts calibration of the right removable controller's joystick.
++
++		Values are start, stop.
++
++		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/right_handle/calibrate_joystick_index
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This displays the available options for the right_handle/calibrate_jotstick attribute.
++
++		Values are start, stop.
++
++		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/right_handle/calibrate_joystick_status
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This displays the result of the last attempted calibration of the right removable controller's joystick.
++
++		Values are unknown, success, failure.
++
++		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/right_handle/calibrate_tirgger
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This initiates or halts calibration of the right removable controller's trigger.
++
++		Values are start, stop.
++
++		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/right_handle/calibrate_gyro_trigger
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This displays the available options for the right_handle/calibrate_trigger attribute.
++
++		Values are start, stop.
++
++		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/right_handle/calibrate_trigger_status
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This displays the result of the last attempted calibration of the right removable controller's trigger.
++
++		Values are unknown, success, failure.
++
++		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/right_handle/firmware_version
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This displays the right removable controller's firmware version.
++
++		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/right_handle/hardware_generation
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This displays the hardware generation of the right removable controller.
++
++		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/right_handle/hardware_version
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This displays the hardware version of the right removable controller.
++
++		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/right_handle/imu_bypass_enabled
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This controls enabling or disabling the IMU bypass function of the right removable controller.
++
++		Values are true or false.
++
++		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/right_handle/imu_bypass_enabled_index
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This displays the available options for the right_handle/imu_bypass_enabled attribute.
++
++		Values are true or false.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/right_handle/imu_enabled
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This controls enabling or disabling the IMU of the right removable controller.
++
++		Values are true or false.
++
++		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/right_handle/imu_enabled_index
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This displays the available options for the right_handle/imu_enabled attribute.
++
++		Values are true or false.
++
++		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/right_handle/product_version
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This displays the product version of the right removable controller.
++
++		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/right_handle/protocol_version
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This displays the protocol version of the right removable controller.
++
++		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/right_handle/reset
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	Resets the right removable controller to factory defaults.
++
++		Writing 1 to this path initiates.
++
++		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/right_handle/rumble_mode
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This controls setting the response behavior for rumble events for the right removable controller.
++
++		Values are fps, racing, standarg, spg, rpg.
++
++		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/right_handle/rumble_mode_index
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This displays the available options for the right_handle/rumble_mode attribute.
++
++		Values are fps, racing, standarg, spg, rpg.
++
++		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/right_handle/rumble_notification
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This controls enabling haptic rumble events for the right removable controller.
++
++		Values are true, false.
++
++		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/right_handle/rumble_notification_index
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This displays the available options for the right_handle/rumble_notification attribute.
++
++		Values are true, false.
++
++		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/rumble_intensity
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This controls setting the rumble intensity for both removable controllers.
++
++		Values are off, low, medium, high.
++
++		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/rumble_intensity_index
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This displays the available options for the rumble_intensity attribute.
++
++		Values are off, low, medium, high.
++
++		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This controls enabling or disabling the touchpad.
++
++		Values are true, false.
++
++		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled_index
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This displays the available options for the touchpad/enabled attribute.
++
++		Values are true, false.
++
++		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/vibration_enabled
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This controls enabling haptic rumble events for the touchpad.
++
++		Values are true, false.
++
++		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/vibration_enabled_index
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This displays the available options for the touchpad/vibration_enabled attribute.
++
++		Values are true, false.
++
++		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/vibration_intensity
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This controls setting the intensity of the touchpad haptics.
++
++		Values are off, low, medium, high.
++
++		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/vibration_intensity_index
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This displays the available options for the touchpad/vibration_intensity attribute.
++
++		Values are off, low, medium, high.
++
++		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/tx_dongle/firmware_version
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This displays the firmware version of the internal wireless transmission dongle.
++
++		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/tx_dongle/hardware_generation
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This displays the hardware generation of the internal wireless transmission dongle.
++
++		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/tx_dongle/hardware_version
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This displays the hardware version of the internal wireless transmission dongle.
++
++		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/tx_dongle/product_version
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This displays the product version of the internal wireless transmission dongle.
++
++		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/tx_dongle/protocol_version
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This displays the protocol version of the internal wireless transmission dongle.
++
++		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
++
diff --git a/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s b/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s
new file mode 100644
index 000000000000..c3c7b0918986
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s
@@ -0,0 +1,304 @@
++What:		/sys/class/leds/go_s:rgb:joystick_rings/effect
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This controls the display effect of the RGB interface.
++
++		Values are monocolor, breathe, chroma, or rainbow.
++
++		Applies to Lenovo Legion Go S line of handheld devices.
++
++What:		/sys/class/leds/go_s:rgb:joystick_rings/effect_index
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This displays the available options for the effect attribute.
++
++		Values are monocolor, breathe, chroma, or rainbow.
++
++		Applies to Lenovo Legion Go S line of handheld devices.
++
++What:		/sys/class/leds/go_s:rgb:joystick_rings/enabled
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This controls enabling or disabling the RGB interface.
++
++		Values are true or false.
++
++		Applies to Lenovo Legion Go S line of handheld devices.
++
++What:		/sys/class/leds/go_s:rgb:joystick_rings/enabled_index
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This displays the available options for the enabled attribute.
++
++		Values are true or false.
++
++		Applies to Lenovo Legion Go S line of handheld devices.
++
++What:		/sys/class/leds/go_s:rgb:joystick_rings/mode
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This controls the operating mode of the RGB interface.
++
++		Values are dynamic or custom. Custom allows setting the RGB effect and color.
++    Dynamic is a Windows mode for syncing Lenovo RGB interfaces not currently
++    supported under Linux.
++
++		Applies to Lenovo Legion Go S line of handheld devices.
++
++What:		/sys/class/leds/go_s:rgb:joystick_rings/mode_index
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This displays the available options for the mode attribute.
++
++		Values are dynamic or custom.
++
++		Applies to Lenovo Legion Go S line of handheld devices.
++
++What:		/sys/class/leds/go_s:rgb:joystick_rings/profile
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This controls selecting the configured RGB profile.
++
++		Values are 1-3.
++
++		Applies to Lenovo Legion Go S line of handheld devices.
++
++What:		/sys/class/leds/go_s:rgb:joystick_rings/profile_range
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This displays the available options for the profile attribute.
++
++		Values are 1-3.
++
++		Applies to Lenovo Legion Go S line of handheld devices.
++
++What:		/sys/class/leds/go_s:rgb:joystick_rings/speed
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This controls the change rate for the breathe, chroma, and rainbow effects.
++
++		Values are 0-100.
++
++		Applies to Lenovo Legion Go S line of handheld devices.
++
++What:		/sys/class/leds/go_s:rgb:joystick_rings/speed_range
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This displays the available options for the speed attribute.
++
++		Values are 0-100.
++
++		Applies to Lenovo Legion Go S line of handheld devices.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/gamepad/auto_sleep_time
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This controls the sleep timer due to inactivity for the built-in controller.
++
++		Values are 0-255.
++
++		Applies to Lenovo Legion Go S line of handheld devices.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/gamepad/auto_sleep_time_range
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This displays the available options for the gamepad/auto_sleep_time attribute.
++
++		Values are 0-255.
++
++		Applies to Lenovo Legion Go S line of handheld devices.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/gamepad/dpad_mode
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This controls the operating mode of the built-in controllers D-pad.
++
++		Values are 4-way or 8-way.
++
++		Applies to Lenovo Legion Go S line of handheld devices.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/gamepad/dpad_mode_index
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This displays the available options for the gamepad/dpad_mode attribute.
++
++		Values are 4-way or 8-way.
++
++		Applies to Lenovo Legion Go S line of handheld devices.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/gamepad/mode
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This controls the operating mode of the built-in controller.
++
++		Values are xinput or dinput.
++
++		Applies to Lenovo Legion Go S line of handheld devices.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/gamepad/mode_index
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This displays the available options for the gamepad/mode attribute.
++
++		Values are xinput or dinput.
++
++		Applies to Lenovo Legion Go S line of handheld devices.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/gamepad/poll_rate
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This controls the poll rate in Hz of the built-in controller.
++
++		Values are 125, 250, 500, or 1000.
++
++		Applies to Lenovo Legion Go S line of handheld devices.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/gamepad/poll_rate_index
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This displays the available options for the gamepad/poll_rate attribute.
++
++		Values are 125, 250, 500, or 1000.
++
++		Applies to Lenovo Legion Go S line of handheld devices.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/imu/bypass_enabled
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This controls enabling or disabling the IMU bypass function. When enabled the IMU data is directly reported to the OS through
++an HIDRAW interface.
++
++		Values are true or false.
++
++		Applies to Lenovo Legion Go S line of handheld devices.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/imu/bypass_enabled_index
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This displays the available options for the imu/bypass_enabled attribute.
++
++		Values are true or false.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/imu/manufacturer
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This displays the manufacturer of the intertial measurment unit.
++
++		Values are Bosch or ST.
++
++		Applies to Lenovo Legion Go S line of handheld devices.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/imu/sensor_enabled
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This controls enabling or disabling the IMU.
++
++		Values are true, false, or wake-2s.
++
++		Applies to Lenovo Legion Go S line of handheld devices.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/imu/sensor_enabled_index
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This displays the available options for the imu/sensor_enabled attribute.
++
++		Values are true, false, or wake-2s.
++
++		Applies to Lenovo Legion Go S line of handheld devices.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/mcu_id
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This displays the MCU Identification Number
++
++		Applies to Lenovo Legion Go S line of handheld devices.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/mouse/step
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This controls which value is used for the mouse sensitivity.
++
++		Values are 1-127.
++
++		Applies to Lenovo Legion Go S line of handheld devices.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/mouse/step_range
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This displays the available options for the mouse/step attribute.
++
++		Values are 1-127.
++
++		Applies to Lenovo Legion Go S line of handheld devices.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This controls which value is used for the touchpads operating mode.
++
++		Values are windows or linux.
++
++		Applies to Lenovo Legion Go S line of handheld devices.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode_index
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This displays the available options for the os_mode attribute.
++
++		Values are windows or linux.
++
++		Applies to Lenovo Legion Go S line of handheld devices.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This controls enabling or disabling the built-in touchpad.
++
++		Values are true or false.
++
++		Applies to Lenovo Legion Go S line of handheld devices.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled_index
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This displays the available options for the touchpad/enabled attribute.
++
++		Values are true or false.
++
++		Applies to Lenovo Legion Go S line of handheld devices.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/linux_mode
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This controls behavior of the touchpad events when os_mode is set to linux.
++
++		Values are absolute or relative.
++
++		Applies to Lenovo Legion Go S line of handheld devices.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/linux_mode_index
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This displays the available options for the touchpad/linux_mode attribute.
++
++		Values are absolute or relative.
++
++		Applies to Lenovo Legion Go S line of handheld devices.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/windows_mode
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This controls behavior of the touchpad events when os_mode is set to windows.
++
++		Values are absolute or relative.
++
++		Applies to Lenovo Legion Go S line of handheld devices.
++
++What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/windows_mode_index
++Date:		April 2026
++Contact:	linux-input@vger.kernel.org
++Description:	This displays the available options for the touchpad/windows_mode attribute.
++
++		Values are absolute or relative.
++
++		Applies to Lenovo Legion Go S line of handheld devices.
diff --git a/MAINTAINERS b/MAINTAINERS
index be4a0fcf23dd..9893d26d5434 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14139,6 +14139,8 @@ LENOVO HID drivers
 M:	Derek J. Clark <derekjohn.clark@gmail.com>
 L:	linux-input@vger.kernel.org
 S:	Maintained
+F:	Documentation/ABI/testing/sysfs-driver-hid-lenovo-go
+F:	Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s
 F:	drivers/hid/hid-lenovo-go-s.c
 F:	drivers/hid/hid-lenovo-go.c
 
-- 
2.51.2

