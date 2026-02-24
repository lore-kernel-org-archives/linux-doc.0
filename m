Received: from mail-dy1-f196.google.com (mail-dy1-f196.google.com [74.125.82.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 390AC2BE621
	for <linux-doc@vger.kernel.org>; Tue, 24 Feb 2026 01:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771896761; cv=none; b=pnZgJlC8t6X6Oh5ldqZnX4Yo9jCMYCUG7w2jDw4q1NFipDN1sLnWqspDFMrD4rWiDNHDdUb3ht4cWY1cojYOC76A1OekL0fSJkCeVP7n0WlGgvrfmoGlPdE+IJ5k7+nQ8g3h/Y8VBF4o8uZinKT/xxfdL2bNZ+KYJ5dmEwqonRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771896761; c=relaxed/simple;
	bh=ikfzksm+wLsqocEkArkkEVPF+9NtY6K0g1U6x4qnaHk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F/s2kd3KeHUp/9JTsZ7Iomz6k1K9NUTI657zthzeFFD8rcS7XvVr4hQEDGOgV56r1pn3tZI4raBEtcCdHXD3+LHMazbpVbQytpi85i7KGIzeS5v95mAt5DRYKl7ihC3VSQNOoBRavos/nzugYHS5EWRm/K36zbawL/5WPYbu71Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JEyvKQ5V; arc=none smtp.client-ip=74.125.82.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JEyvKQ5V"
Received: by mail-dy1-f196.google.com with SMTP id 5a478bee46e88-2ba895adfeaso4871874eec.0
        for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 17:32:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771896756; x=1772501556; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=22FKswPIkgTaZrxf06G8nEvQoSlteqKZSt+NVe2oBnI=;
        b=JEyvKQ5VQPJckjhpJXQb8S9MIfsIuDoKbXecAfxhrzoBCZyzUP/43RTBEPjxTwlQf9
         j6EWjQ/bsC8WOenCY1dlz9D7+YiJYbmVQeYpv+SbCAsXjs+ulOQpRoPQxAdJvR2mtcnB
         MMdECyw60vtcmkIQgoZlgIdb+UedpmIhU3uuGPbobbZ+btHuWWHnmasZs90NfjRnX0sk
         Z80ZTDNCAC1dQ2s6fjwbIOcpCwJkoMvjPhG287g/CLSkBXTl1Tj288Yy2v4fRWsFXGvn
         AiyzPnmPKkg39QyHR3dCSs8jYspDEj0el3tBRRKPxe6OD+Ra5LNPa0vOf7zaZWD6eDrl
         gHfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771896756; x=1772501556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=22FKswPIkgTaZrxf06G8nEvQoSlteqKZSt+NVe2oBnI=;
        b=W4e2iQpLj+BUtyxBoG4ei3txBhF28adjk6/ryDAcAx/rEuhdNM8Mz7UJzH5E206/Pc
         zf5jlW2F4dLFbRCfsvFp/YPKXkDiQeA3oZGRJ5ErIGFo9vWGLMC7i1sb9JCYoOuIafSL
         MFM07Sk00TpiUFsvNnSK0WCfepx+P6nh/YgP+pE/KkPUKvk8jMcL2eSw+MWATsf1EOfr
         yM9LSh/LShDTABW/Y0u6Nl1f//myEv/q8JipQXwtxuHpz7P5WmrLCvNLjHre5VSZ1XfK
         xW/xgvJha7GYeTZNVxFHHF5fEM5rJJRu92yumzZbq1sD3YasmGkUhnJeUw1H4r5T1pQM
         hsXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnTHFmL/rnwQ6egbg3yysWfDvXEWEx9KA2oNJkxPvUbC+qkmxtLkrPsCxD4PnTwgCJwW4+ZawNZgM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx79TwtO6ly2jlk0k0RZHx4T7Pr/bJhib/H7LU1KQC+szQmza5N
	UAxlDBb4LD30XHoGOUdjdFKb2Y0lPhkrQ5IHR9TPKJ0nuJJGNljurqYn
X-Gm-Gg: ATEYQzxUx6FbFqjbckiTTvlfa5xZvVHve7tAiYCdo0ewvGwwhet8DV6kJYudoR+QHjL
	Qk0C+KeuYSRp8KWxcLOyswFdOi4NRD/1tFadOLfjspAbgMd4htUPCiueeimRkICsHqovesxFpJ3
	0u6HYMnmVLJfLMXeyExusvVSG/PQQdR7jUgDWLUlYBm6KE4a+kURCjiHgkZ4WhbdZJo/l8AGDl6
	OGTvmt6JBJLRexJD8peZIrW4kceC0Unt6A9z393ILzFtr++XI18Zhf8xyUCWfeAislzuof/3MRq
	CNoobKqMWH4BZPvY1evV7z96A0a1M3C2q5QKWZv9A4GSzx+NfraHUp0whJ3Bb4dJhPDsduibECC
	K8Lnz2E5p0PqjFW4PNXPdl0ZCiO3EJbEoa+TBr/iNsmU9hBFecRlB+lxGGLp5Gm7nPh4gqx0n23
	Sz7cLZV/NRvXqR1Qgy6X5ehWLCSNRJWvMvqxGlVSLsE/gOnjn5wHVUed5fF8QP3+2eLNJIgjDqP
	n0=
X-Received: by 2002:a05:7301:3e09:b0:2ba:933d:d5c7 with SMTP id 5a478bee46e88-2bd7bd11307mr3975343eec.32.1771896755884;
        Mon, 23 Feb 2026 17:32:35 -0800 (PST)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bd7daa027fsm6485015eec.9.2026.02.23.17.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 17:32:35 -0800 (PST)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Richard Hughes <hughsient@gmail.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Zhixin Zhang <zhangzx36@lenovo.com>,
	Mia Shao <shaohz1@lenovo.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 16/16] HID: Add documentation for Lenovo Legion Go drivers
Date: Tue, 24 Feb 2026 01:32:17 +0000
Message-ID: <20260224013217.1363996-17-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260224013217.1363996-1-derekjohn.clark@gmail.com>
References: <20260224013217.1363996-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds ABI documentation for the hid-lenovo-go-s and hid-lenovo-go
drivers.

Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
V3:
 - Remove excess + from every line of patch.
---
 .../ABI/testing/sysfs-driver-hid-lenovo-go    | 724 ++++++++++++++++++
 .../ABI/testing/sysfs-driver-hid-lenovo-go-s  | 304 ++++++++
 MAINTAINERS                                   |   2 +
 3 files changed, 1030 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-hid-lenovo-go
 create mode 100644 Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s

diff --git a/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go b/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go
new file mode 100644
index 0000000000000..c8221373ef76a
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go
@@ -0,0 +1,724 @@
+What:		/sys/class/leds/go:rgb:joystick_rings/effect
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This controls the display effect of the RGB interface.
+
+		Values are monocolor, breathe, chroma, or rainbow.
+
+		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
+
+What:		/sys/class/leds/go:rgb:joystick_rings/effect_index
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This displays the available options for the effect attribute.
+
+		Values are monocolor, breathe, chroma, or rainbow.
+
+		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
+
+What:		/sys/class/leds/go:rgb:joystick_rings/enabled
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This controls enabling or disabling the RGB interface.
+
+		Values are true or false.
+
+		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
+
+What:		/sys/class/leds/go:rgb:joystick_rings/enabled_index
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This displays the available options for the enabled attribute.
+
+		Values are true or false.
+
+		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
+
+What:		/sys/class/leds/go:rgb:joystick_rings/mode
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This controls the operating mode of the RGB interface.
+
+		Values are dynamic or custom. Custom allows setting the RGB effect and color.
+    Dynamic is a Windows mode for syncing Lenovo RGB interfaces not currently
+    supported under Linux.
+
+		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
+
+What:		/sys/class/leds/go:rgb:joystick_rings/mode_index
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This displays the available options for the mode attribute.
+
+		Values are dynamic or custom.
+
+		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
+
+What:		/sys/class/leds/go:rgb:joystick_rings/profile
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This controls selecting the configured RGB profile.
+
+		Values are 1-3.
+
+		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
+
+What:		/sys/class/leds/go:rgb:joystick_rings/profile_range
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This displays the available options for the profile attribute.
+
+		Values are 1-3.
+
+		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
+
+What:		/sys/class/leds/go:rgb:joystick_rings/speed
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This controls the change rate for the breathe, chroma, and rainbow effects.
+
+		Values are 0-100.
+
+		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
+
+What:		/sys/class/leds/go:rgb:joystick_rings/speed_range
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This displays the available options for the speed attribute.
+
+		Values are 0-100.
+
+		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/firmware_version
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This displays the firmware version of the internal MCU.
+
+		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/fps_mode_dpi
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This displays the DPI of the right handle when the FPS mode switch is on.
+
+		Values are 500, 800, 1200, and 1800.
+
+		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/fps_mode_dpi_index
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This displays the available options for the fps_mode_dpi attribute.
+
+		Values are 500, 800, 1200, and 1800.
+
+		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/hardware_generation
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This displays the hardware generation of the internal MCU.
+
+		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/hardware_version
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This displays the hardware version of the internal MCU.
+
+
+		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/left_handle/auto_sleep_time
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This controls the sleep timer due to inactivity for the left removable controller.
+
+		Values are 0-255.
+
+		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/left_handle/auto_sleep_time_range
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This displays the available options for the left_handle/auto_sleep_time attribute.
+
+		Values are 0-255.
+
+		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/left_handle/calibrate_gyro
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This initiates or halts calibration of the left removable controller's IMU.
+
+		Values are start, stop.
+
+		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/left_handle/calibrate_gyro_index
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This displays the available options for the left_handle/calibrate_gyro attribute.
+
+		Values are start, stop.
+
+		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/left_handle/calibrate_gyro_status
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This displays the result of the last attempted calibration of the left removable controller's IMU.
+
+		Values are unknown, success, failure.
+
+		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/left_handle/calibrate_joystick
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This initiates or halts calibration of the left removable controller's joystick.
+
+		Values are start, stop.
+
+		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/left_handle/calibrate_joystick_index
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This displays the available options for the left_handle/calibrate_jotstick attribute.
+
+		Values are start, stop.
+
+		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/left_handle/calibrate_joystick_status
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This displays the result of the last attempted calibration of the left removable controller's joystick.
+
+		Values are unknown, success, failure.
+
+		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/left_handle/calibrate_tirgger
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This initiates or halts calibration of the left removable controller's trigger.
+
+		Values are start, stop.
+
+		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/left_handle/calibrate_gyro_trigger
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This displays the available options for the left_handle/calibrate_trigger attribute.
+
+		Values are start, stop.
+
+		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/left_handle/calibrate_trigger_status
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This displays the result of the last attempted calibration of the left removable controller's trigger.
+
+		Values are unknown, success, failure.
+
+		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/left_handle/firmware_version
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This displays the left removable controller's firmware version.
+
+		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/left_handle/hardware_generation
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This displays the hardware generation of the left removable controller.
+
+		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/left_handle/hardware_version
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This displays the hardware version of the left removable controller.
+
+		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/left_handle/imu_bypass_enabled
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This controls enabling or disabling the IMU bypass function of the left removable controller.
+
+		Values are true or false.
+
+		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/left_handle/imu_bypass_enabled_index
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This displays the available options for the left_handle/imu_bypass_enabled attribute.
+
+		Values are true or false.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/left_handle/imu_enabled
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This controls enabling or disabling the IMU of the left removable controller.
+
+		Values are true or false.
+
+		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/left_handle/imu_enabled_index
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This displays the available options for the left_handle/imu_enabled attribute.
+
+		Values are true or false.
+
+		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/left_handle/product_version
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This displays the product version of the left removable controller.
+
+		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/left_handle/protocol_version
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This displays the protocol version of the left removable controller.
+
+		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/left_handle/reset
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	Resets the left removable controller to factory defaults.
+
+		Writing 1 to this path initiates.
+
+		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/left_handle/rumble_mode
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This controls setting the response behavior for rumble events for the left removable controller.
+
+		Values are fps, racing, standarg, spg, rpg.
+
+		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/left_handle/rumble_mode_index
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This displays the available options for the left_handle/rumble_mode attribute.
+
+		Values are fps, racing, standarg, spg, rpg.
+
+		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/left_handle/rumble_notification
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This controls enabling haptic rumble events for the left removable controller.
+
+		Values are true, false.
+
+		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/left_handle/rumble_notification_index
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This displays the available options for the left_handle/rumble_notification attribute.
+
+		Values are true, false.
+
+		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/mode
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This controls the operating mode of the built-in controller.
+
+		Values are xinput or dinput.
+
+		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/left_handle/mode_index
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This displays the available options for the mode attribute.
+
+		Values are xinput or dinput.
+
+		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This controls the behavior of built in chord combinations.
+
+		Values are windows or linux.
+
+		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode_index
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This displays the available options for the os_mode attribute.
+
+		Values are windows or linux.
+
+		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/product_version
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This displays the product version of the internal MCU.
+
+		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/right_handle/protocol_version
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This displays the protocol version of the internal MCU.
+
+		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/reset_mcu
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	Resets the internal MCU to factory defaults.
+
+		Writing 1 to this path initiates.
+
+		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/right_handle/auto_sleep_time
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This controls the sleep timer due to inactivity for the right removable controller.
+
+		Values are 0-255.
+
+		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/right_handle/auto_sleep_time_range
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This displays the available options for the right_handle/auto_sleep_time attribute.
+
+		Values are 0-255.
+
+		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/right_handle/calibrate_gyro
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This initiates or halts calibration of the right removable controller's IMU.
+
+		Values are start, stop.
+
+		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/right_handle/calibrate_gyro_index
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This displays the available options for the right_handle/calibrate_gyro attribute.
+
+		Values are start, stop.
+
+		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/right_handle/calibrate_gyro_status
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This displays the result of the last attempted calibration of the right removable controller's IMU.
+
+		Values are unknown, success, failure.
+
+		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/right_handle/calibrate_joystick
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This initiates or halts calibration of the right removable controller's joystick.
+
+		Values are start, stop.
+
+		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/right_handle/calibrate_joystick_index
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This displays the available options for the right_handle/calibrate_jotstick attribute.
+
+		Values are start, stop.
+
+		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/right_handle/calibrate_joystick_status
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This displays the result of the last attempted calibration of the right removable controller's joystick.
+
+		Values are unknown, success, failure.
+
+		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/right_handle/calibrate_tirgger
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This initiates or halts calibration of the right removable controller's trigger.
+
+		Values are start, stop.
+
+		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/right_handle/calibrate_gyro_trigger
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This displays the available options for the right_handle/calibrate_trigger attribute.
+
+		Values are start, stop.
+
+		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/right_handle/calibrate_trigger_status
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This displays the result of the last attempted calibration of the right removable controller's trigger.
+
+		Values are unknown, success, failure.
+
+		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/right_handle/firmware_version
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This displays the right removable controller's firmware version.
+
+		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/right_handle/hardware_generation
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This displays the hardware generation of the right removable controller.
+
+		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/right_handle/hardware_version
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This displays the hardware version of the right removable controller.
+
+		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/right_handle/imu_bypass_enabled
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This controls enabling or disabling the IMU bypass function of the right removable controller.
+
+		Values are true or false.
+
+		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/right_handle/imu_bypass_enabled_index
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This displays the available options for the right_handle/imu_bypass_enabled attribute.
+
+		Values are true or false.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/right_handle/imu_enabled
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This controls enabling or disabling the IMU of the right removable controller.
+
+		Values are true or false.
+
+		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/right_handle/imu_enabled_index
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This displays the available options for the right_handle/imu_enabled attribute.
+
+		Values are true or false.
+
+		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/right_handle/product_version
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This displays the product version of the right removable controller.
+
+		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/right_handle/protocol_version
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This displays the protocol version of the right removable controller.
+
+		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/right_handle/reset
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	Resets the right removable controller to factory defaults.
+
+		Writing 1 to this path initiates.
+
+		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/right_handle/rumble_mode
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This controls setting the response behavior for rumble events for the right removable controller.
+
+		Values are fps, racing, standarg, spg, rpg.
+
+		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/right_handle/rumble_mode_index
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This displays the available options for the right_handle/rumble_mode attribute.
+
+		Values are fps, racing, standarg, spg, rpg.
+
+		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/right_handle/rumble_notification
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This controls enabling haptic rumble events for the right removable controller.
+
+		Values are true, false.
+
+		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/right_handle/rumble_notification_index
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This displays the available options for the right_handle/rumble_notification attribute.
+
+		Values are true, false.
+
+		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/rumble_intensity
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This controls setting the rumble intensity for both removable controllers.
+
+		Values are off, low, medium, high.
+
+		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/rumble_intensity_index
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This displays the available options for the rumble_intensity attribute.
+
+		Values are off, low, medium, high.
+
+		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This controls enabling or disabling the touchpad.
+
+		Values are true, false.
+
+		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled_index
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This displays the available options for the touchpad/enabled attribute.
+
+		Values are true, false.
+
+		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/vibration_enabled
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This controls enabling haptic rumble events for the touchpad.
+
+		Values are true, false.
+
+		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/vibration_enabled_index
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This displays the available options for the touchpad/vibration_enabled attribute.
+
+		Values are true, false.
+
+		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/vibration_intensity
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This controls setting the intensity of the touchpad haptics.
+
+		Values are off, low, medium, high.
+
+		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/vibration_intensity_index
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This displays the available options for the touchpad/vibration_intensity attribute.
+
+		Values are off, low, medium, high.
+
+		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/tx_dongle/firmware_version
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This displays the firmware version of the internal wireless transmission dongle.
+
+		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/tx_dongle/hardware_generation
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This displays the hardware generation of the internal wireless transmission dongle.
+
+		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/tx_dongle/hardware_version
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This displays the hardware version of the internal wireless transmission dongle.
+
+		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/tx_dongle/product_version
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This displays the product version of the internal wireless transmission dongle.
+
+		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/tx_dongle/protocol_version
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This displays the protocol version of the internal wireless transmission dongle.
+
+		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
+
diff --git a/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s b/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s
new file mode 100644
index 0000000000000..4d317074bb7e6
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s
@@ -0,0 +1,304 @@
+What:		/sys/class/leds/go_s:rgb:joystick_rings/effect
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This controls the display effect of the RGB interface.
+
+		Values are monocolor, breathe, chroma, or rainbow.
+
+		Applies to Lenovo Legion Go S line of handheld devices.
+
+What:		/sys/class/leds/go_s:rgb:joystick_rings/effect_index
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This displays the available options for the effect attribute.
+
+		Values are monocolor, breathe, chroma, or rainbow.
+
+		Applies to Lenovo Legion Go S line of handheld devices.
+
+What:		/sys/class/leds/go_s:rgb:joystick_rings/enabled
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This controls enabling or disabling the RGB interface.
+
+		Values are true or false.
+
+		Applies to Lenovo Legion Go S line of handheld devices.
+
+What:		/sys/class/leds/go_s:rgb:joystick_rings/enabled_index
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This displays the available options for the enabled attribute.
+
+		Values are true or false.
+
+		Applies to Lenovo Legion Go S line of handheld devices.
+
+What:		/sys/class/leds/go_s:rgb:joystick_rings/mode
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This controls the operating mode of the RGB interface.
+
+		Values are dynamic or custom. Custom allows setting the RGB effect and color.
+    Dynamic is a Windows mode for syncing Lenovo RGB interfaces not currently
+    supported under Linux.
+
+		Applies to Lenovo Legion Go S line of handheld devices.
+
+What:		/sys/class/leds/go_s:rgb:joystick_rings/mode_index
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This displays the available options for the mode attribute.
+
+		Values are dynamic or custom.
+
+		Applies to Lenovo Legion Go S line of handheld devices.
+
+What:		/sys/class/leds/go_s:rgb:joystick_rings/profile
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This controls selecting the configured RGB profile.
+
+		Values are 1-3.
+
+		Applies to Lenovo Legion Go S line of handheld devices.
+
+What:		/sys/class/leds/go_s:rgb:joystick_rings/profile_range
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This displays the available options for the profile attribute.
+
+		Values are 1-3.
+
+		Applies to Lenovo Legion Go S line of handheld devices.
+
+What:		/sys/class/leds/go_s:rgb:joystick_rings/speed
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This controls the change rate for the breathe, chroma, and rainbow effects.
+
+		Values are 0-100.
+
+		Applies to Lenovo Legion Go S line of handheld devices.
+
+What:		/sys/class/leds/go_s:rgb:joystick_rings/speed_range
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This displays the available options for the speed attribute.
+
+		Values are 0-100.
+
+		Applies to Lenovo Legion Go S line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/gamepad/auto_sleep_time
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This controls the sleep timer due to inactivity for the built-in controller.
+
+		Values are 0-255.
+
+		Applies to Lenovo Legion Go S line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/gamepad/auto_sleep_time_range
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This displays the available options for the gamepad/auto_sleep_time attribute.
+
+		Values are 0-255.
+
+		Applies to Lenovo Legion Go S line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/gamepad/dpad_mode
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This controls the operating mode of the built-in controllers D-pad.
+
+		Values are 4-way or 8-way.
+
+		Applies to Lenovo Legion Go S line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/gamepad/dpad_mode_index
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This displays the available options for the gamepad/dpad_mode attribute.
+
+		Values are 4-way or 8-way.
+
+		Applies to Lenovo Legion Go S line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/gamepad/mode
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This controls the operating mode of the built-in controller.
+
+		Values are xinput or dinput.
+
+		Applies to Lenovo Legion Go S line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/gamepad/mode_index
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This displays the available options for the gamepad/mode attribute.
+
+		Values are xinput or dinput.
+
+		Applies to Lenovo Legion Go S line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/gamepad/poll_rate
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This controls the poll rate in Hz of the built-in controller.
+
+		Values are 125, 250, 500, or 1000.
+
+		Applies to Lenovo Legion Go S line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/gamepad/poll_rate_index
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This displays the available options for the gamepad/poll_rate attribute.
+
+		Values are 125, 250, 500, or 1000.
+
+		Applies to Lenovo Legion Go S line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/imu/bypass_enabled
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This controls enabling or disabling the IMU bypass function. When enabled the IMU data is directly reported to the OS through
+an HIDRAW interface.
+
+		Values are true or false.
+
+		Applies to Lenovo Legion Go S line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/imu/bypass_enabled_index
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This displays the available options for the imu/bypass_enabled attribute.
+
+		Values are true or false.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/imu/manufacturer
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This displays the manufacturer of the intertial measurment unit.
+
+		Values are Bosch or ST.
+
+		Applies to Lenovo Legion Go S line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/imu/sensor_enabled
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This controls enabling or disabling the IMU.
+
+		Values are true, false, or wake-2s.
+
+		Applies to Lenovo Legion Go S line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/imu/sensor_enabled_index
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This displays the available options for the imu/sensor_enabled attribute.
+
+		Values are true, false, or wake-2s.
+
+		Applies to Lenovo Legion Go S line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/mcu_id
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This displays the MCU Identification Number
+
+		Applies to Lenovo Legion Go S line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/mouse/step
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This controls which value is used for the mouse sensitivity.
+
+		Values are 1-127.
+
+		Applies to Lenovo Legion Go S line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/mouse/step_range
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This displays the available options for the mouse/step attribute.
+
+		Values are 1-127.
+
+		Applies to Lenovo Legion Go S line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This controls which value is used for the touchpads operating mode.
+
+		Values are windows or linux.
+
+		Applies to Lenovo Legion Go S line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode_index
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This displays the available options for the os_mode attribute.
+
+		Values are windows or linux.
+
+		Applies to Lenovo Legion Go S line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This controls enabling or disabling the built-in touchpad.
+
+		Values are true or false.
+
+		Applies to Lenovo Legion Go S line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled_index
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This displays the available options for the touchpad/enabled attribute.
+
+		Values are true or false.
+
+		Applies to Lenovo Legion Go S line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/linux_mode
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This controls behavior of the touchpad events when os_mode is set to linux.
+
+		Values are absolute or relative.
+
+		Applies to Lenovo Legion Go S line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/linux_mode_index
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This displays the available options for the touchpad/linux_mode attribute.
+
+		Values are absolute or relative.
+
+		Applies to Lenovo Legion Go S line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/windows_mode
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This controls behavior of the touchpad events when os_mode is set to windows.
+
+		Values are absolute or relative.
+
+		Applies to Lenovo Legion Go S line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/windows_mode_index
+Date:		April 2026
+Contact:	linux-input@vger.kernel.org
+Description:	This displays the available options for the touchpad/windows_mode attribute.
+
+		Values are absolute or relative.
+
+		Applies to Lenovo Legion Go S line of handheld devices.
diff --git a/MAINTAINERS b/MAINTAINERS
index 1d0468906788a..8eea5f231e809 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14318,6 +14318,8 @@ M:	Derek J. Clark <derekjohn.clark@gmail.com>
 M:	Mark Pearson <mpearson-lenovo@squebb.ca>
 L:	linux-input@vger.kernel.org
 S:	Maintained
+F:	Documentation/ABI/testing/sysfs-driver-hid-lenovo-go
+F:	Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s
 F:	drivers/hid/hid-lenovo-go-s.c
 F:	drivers/hid/hid-lenovo-go.c
 F:	drivers/hid/hid-lenovo.c
-- 
2.52.0

