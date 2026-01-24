Received: from mail-dy1-f195.google.com (mail-dy1-f195.google.com [74.125.82.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F571A9F85
	for <linux-doc@vger.kernel.org>; Sat, 24 Jan 2026 01:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769219372; cv=none; b=litldVv2b2LaLRyIQodOLOPXKYpYMgmlwkF4x1LjHT7Rm+oAv9OuXakf9ndlLhozQre/W+/WbcszoqkR/BUpfZurf8ZfAA3CKDvROH9vQbxRlDOZ3wXK1U2hQPpdARos3qE7cymWZNirwQgMvhxKpA5HXEm2hl0xxKaj96vK5V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769219372; c=relaxed/simple;
	bh=V8oowEftJkNhkKHu/WfqaGxUPjCRUuqpH/Ki19Zz5Xw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TikUE8dG2TiwhJs6T4bEQ2vOnsWCdhDXbdm46Ss1Y7KQiPoGE46FTx9Zd3bWE0RJ75rKpNLAAr32elGDjOFoPEOQ74aATOkxt5inw4okdpwdq97QED8UNfQwl1b5JQLOyhusdx9O8EIzXYrrNH+qtJeIVRMkd1ZChZaLvrd7cAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MUh63YYu; arc=none smtp.client-ip=74.125.82.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MUh63YYu"
Received: by mail-dy1-f195.google.com with SMTP id 5a478bee46e88-2b6fd5bec41so6652768eec.1
        for <linux-doc@vger.kernel.org>; Fri, 23 Jan 2026 17:49:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769219366; x=1769824166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dpRhPjmopp8WdNWVrQHMEm+6TuZHm/P6RO8FyT4Z3j4=;
        b=MUh63YYuSyY122L47iN3fW3kKsX0XFx0dKWa+33u8gqJH726r+DfwDFdh8Ft+v+AvZ
         DPAxmXfDvd0Umg8W1XkfuPrcKCWH7BQEPS/9m2NesgTej4OxSfOARCNj/LaUyW5gGZsx
         xVKLSSmof4DZKonVwosiFPt4qvxkrEmdlwit2CHMYrXrgK/yehEZb6ZpPnc2mo8bKVNb
         131a0LQaCflOGLzjbHYBJklzIHckAqbd7dKVfNoDPEANoDeemkEjx1cDmw4D+XRCXE4w
         JyFgOBf5njHBcWLjN2XxZbEZ/RK4mANOQMKpfcfj1UBrYd03mz+O0Swbn7s1j8tZZybJ
         jAYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769219366; x=1769824166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dpRhPjmopp8WdNWVrQHMEm+6TuZHm/P6RO8FyT4Z3j4=;
        b=mNwHXUzt+w0kL0Ggo6OIyw2rhb+TXdjojbJ6/It4FYijyi6ixG1b/hcaQP8Xrwvx0G
         8e4qPtYKdIbd7TR9/RFjgyPEm7sjmh6LV479RAqixE3qDDXQsbOw9n7nXFY2eYX2lDhU
         CVqjfC56rr/92MGGcdk5oaBrBPgjZWYSZS6DpH+yw0U93DxIz3e3boMX7f5B+buNJQzO
         LC+3l+4FOwMcW1KY8kTbO11Na/epY396r/AWjG6UBq/9BONr9mXhz/q5e+Jm3XV9mEzH
         XELfZ7l04N9PLxuzgMW/KdhBr4YO+RtDv4QE1L2WA2PFMCLrT9cqeePuUc11UJi9I7qj
         gq8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWGriv5foF4GNv8/ldKikFzSkhzuUpsHBB3AXZ6ENq46SPasXcpCX597BIK3PEybuwcCH5llsD2eRI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYfUTsubWZR1egTwvq+hhJbDbpKfMuA3yWAc8bGaloztg19YKv
	Bh/biAZ5JDQrtJZSY1TXB4yLYQKR6Nt3cnBb0shvNuJmMGMJhhix6Zw5
X-Gm-Gg: AZuq6aJjQisg+V0usCc0Egy7kz/pWY1leq2NFO42eN/G1/NSJoVwlq/j/44ONk0wZ0G
	fWPJ+RuZP1cMxsbzP6ANo+5KV7AYr8NoMgQ6JiQM8npWXp/SrPYUi0NHQBHvmH5RN7M62483ALN
	wPNmXP3BehsVI+TopKNNfW1tS0eDzAq+rdZv2Pz/G25MeYA/jA5eyaZ6UCizoOegPcGW8HQO3u8
	85O//VOoAbwAtqfN1UC0rINhY67/WPg06VhDYrpRXmFKJsQQpynHTO1sdIEiDUS5UCRc8qVQpIC
	SwAlYpskwQakbFanVgAwfyglPQA9REiX4MRTnlJSouxUvrxHiZXNuoQARgxKC/eyUEKNtLRmPkL
	DFRo1UGBXLmYpYc0NcSYLn0QLoTcIQeudgi71XIe39Zc/fStmz7iFgeqbqj94d4z6YQrUSbhQ95
	aOujNRP6M0CUfjOklNVcTa6o5+LwuBdd05N9S+QElc+miA0dENzjExXOdSsdiGnuc=
X-Received: by 2002:a05:7300:748c:b0:2b0:50b1:d963 with SMTP id 5a478bee46e88-2b74274c8dfmr1455162eec.3.1769219365967;
        Fri, 23 Jan 2026 17:49:25 -0800 (PST)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b73aa22707sm5160014eec.29.2026.01.23.17.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 17:49:25 -0800 (PST)
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
Subject: [PATCH v3 16/16] HID: Add documentation for Lenovo Legion Go drivers
Date: Sat, 24 Jan 2026 01:49:07 +0000
Message-ID: <20260124014907.991265-17-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260124014907.991265-1-derekjohn.clark@gmail.com>
References: <20260124014907.991265-1-derekjohn.clark@gmail.com>
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
index 000000000000..c8221373ef76
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
index 000000000000..4d317074bb7e
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
index 723598010189..c812d79e3b28 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14140,6 +14140,8 @@ M:	Derek J. Clark <derekjohn.clark@gmail.com>
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

