Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0CE91DF755
	for <linux-doc@vger.kernel.org>; Fri, 20 Feb 2026 07:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771571158; cv=none; b=S5vaaIGIAMaVvTmGFyF98YvsJ6iCSOtmGXqkGx63Vxjpc/sPOoVJVadryzRiRU3UP/8P2mL/TxJi/P1jwiVQMJQfhXzeMEPbXhahLej8ZGrCC1b7l+3bFxx3JXDnAS5A6ciCyIR2y8TIiRGyDuhW7gTg/Nnc5BV+/7d/F6/YTos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771571158; c=relaxed/simple;
	bh=m4HDAOcKPODaBXvsaq62AV5hGzCNMN403tNNb4nzSBI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hlaUX+fTjOdO/ssZJVGvj1HzxzO7XOGeEDiy0JqzJUIJGTZOhPGQ5ABOeVep/IWg9ltmZbmIYpxDHQYCJzthUzz5C3khDiL1MD4fhIuxfz8h0ZKJ+GCLrDPZ1yRPcofuxbdtAVn305SmfkvnNx0cR081kws99l/uAbMnfgV/y90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GK6Z6+7G; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GK6Z6+7G"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2bd3b0bc201so4106213eec.1
        for <linux-doc@vger.kernel.org>; Thu, 19 Feb 2026 23:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771571156; x=1772175956; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LlJFw9o/nUtRdl6k0ZyQShyhGYr3G6NcBejagNa77zc=;
        b=GK6Z6+7GA4pgLKQqZMuN5lcc0v1ZCwqVRauglq7uQ1ygxJ3X1O2KweCGROhRMlwxKJ
         j0Ze0UCfpjXghNYdIRB3DLJzcrwN3k1Rl0j2hBVHVYwKNS2n02iwl9B4vdQcopnHEPCW
         /JFSztyd43/5WlJORmrvRhepTuloUBXMqFhPS/s+FJ3FJiatqiSTxz/z+iFUQW13KTaM
         iFaRXxz7gOk+DULkOk68BvFG3ELnly1BsJzNngTg4aYbbphXzP0oKsE92k/zU2zeJPz2
         Dok/aw4GBDqnKMnziRHvWW19rmY13LVmB0NkrMgDlDorVhmlenAFEHYnMdYaD7bdbORZ
         LAaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771571156; x=1772175956;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LlJFw9o/nUtRdl6k0ZyQShyhGYr3G6NcBejagNa77zc=;
        b=WGwW0gqIH46w3wd32nL4A9PUyEryzIJYuG/Og+MrL7+DJSsDSciW1MJRWk4Yvgipei
         KW/4yAbl+n3+QP/YyywmnEfOZ+AnteJ1irQYLZsaAC8CCjE+0qk3k0ONvpR3XBnV6X6o
         73K1TAvCJm35ixvJD+epHeloUjdqP92tU1tU4X2HfrU6OIRyvhFG2TYLJCk5KMW9wuy8
         7h3nd7Yb1kspx36COUf7PlqGCm/eGftdqkZ2woWj1n40QwolDOHwJzdc3IRIw6JpHLSK
         uidqaQA5wNUvO8LLs4ZAUaGHM1YI1VXADSsKbgH0kXRjw1n3ebkbWy5lKryIbEcn0BeM
         M5Pg==
X-Forwarded-Encrypted: i=1; AJvYcCVr95lFdosUUFm1ofd2UIk/HxMrIAM+3I2uHUyKhbVUyK5p75vl5aClkZ4jCK/UawU2ZxreY3UvgYo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4hYXnLICA7z07LcbX8DqAMYgaUW8Uci3X0ClyesdAA9pEuTQi
	Xrpvgn3a8eBvuhaBdYeN34vqG9KJvv3LDm6q5YyoNqRbT4zPw5cDMc+2
X-Gm-Gg: AZuq6aL0I6CaEG03RsRIs53ITFKyF5QIOkTNObYefDUNLWkYm2uYbrAIht88kylcSH4
	ds5DMTOS9bHIZc4myEAi82alrpyhPyeZyB6mMa4rqQQgUL9ygoZYWMonwWIB5J8Bmt6IeELzvAS
	xGeKcmaoAqRfPYIztW6i0plDxV8skjH+lWr9f4+qaMdgjJaIdrdUsIqezH8gXwOf9dxNnI//J5e
	L09xdAepx1rTWIaEeERuAtN49K70M7hv87z/vfgDlfT/3yafH4sBcIUYKJ4k6RbMaJ8RMtL9R28
	w3WjXfe9GPVt1VmH0Jlz9o0caHwZut0iFmW9koI0P5KOtj2XCKZz/LRvL4rPEwKepPTN/Y+vboV
	Nf83shzGKgL8H+oaSYk87JqKRrwCiB50+yvLRsHg41gU+GwhbXbxEezEpGlrDEm6GfEcKNyiP1V
	TUa1mV5EyWIXt1FHWJm0O7OvUnOjTIrS6MaYeH0Of88uaxo9l8xxAyiLuBaPKjcni0A2LRifdNU
	Gc=
X-Received: by 2002:a05:7301:7bc4:b0:2b8:2910:dcae with SMTP id 5a478bee46e88-2bd5b2b1460mr3330150eec.13.1771571155744;
        Thu, 19 Feb 2026 23:05:55 -0800 (PST)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bacb669f7dsm22163335eec.23.2026.02.19.23.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 23:05:55 -0800 (PST)
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
Subject: [PATCH v4 00/16] HID: Add Legion Go and Go S Drivers
Date: Fri, 20 Feb 2026 07:05:13 +0000
Message-ID: <20260220070533.4083667-1-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds configuration driver support for the Legion Go S,
Legion Go, and Legion Go 2 built-in controller HID interfaces. This
allows for configuring hardware specific attributes such as the auso
sleep timeout, rumble intensity, etc. non-configuration reports are
forwarded to the HID subsystem to ensure no loss of functionality in
userspace. Basic gamepad functionality is provided through xpad, while
advanced features are currently only implemented in userspace daemons
such as InputPlumber[1]. I plan to move this functionality into the
kernel in a later patch series.

Three new device.h macros are added that solve a fairly specific
problem. Many of the attributes need to have the same name as other
attributes when they are in separate attribute subdirectories. The
previous version of this series, along with the upcoming his-asus-ally
driver[2] use this macro to simplify the sysfs by removing redundancy.
An upcoming out of tree driver for the Zotac Zone [3] also found this
macro to be useful. This greatly reduces the path length and term
redundancy of file paths in the sysfs, while also allowing for cleaner
subdirectories that are grouped by functionality. Rather than carry the
same macro in four drivers, it seems beneficial to me that we include the
macro with the other device macros.

A new HID uevent property is also added, HID_FIRMWARE_VERSION, so as to
permit fwupd to read the firmware version of the Go S HID interface without
detaching the kernel driver.

Finally, there are some checkpatch warnings that will need to be supressed:
WARNING: ENOSYS means 'invalid syscall nr' and nothing else
1292: FILE: drivers/hid/lenovo-legos-hid/lenovo-legos-hid-config.c:1085:
+       case -ENOSYS: /* during rmmod -ENOSYS is expected */

This error handling case was added as it is experienced in the real world
when the driver is rmmod. The LED subsystem produces this error code in
its legacy code and this is not a new novel use of -ENOSYS, we are simply
catching the case to avoid spurious errors in dmesg when the drivers are
removed.

[1]: https://github.com/ShadowBlip/InputPlumber/tree/main/src/drivers/lego
[2]: https://lore.kernel.org/all/20240806081212.56860-1-luke@ljones.dev/
[3]: https://github.com/flukejones/linux/tree/wip/zotac-zone-6.15/drivers/hid/zotac-zone-hid

Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
Change Log
v4:
  - Use dmabuf allocated per request for both drivers instead of a devm
    preallocated buffer that is reused. This solves a bug where some
    attributes couldn't be restored without manual writing after resume.
  - Reduce the number of quirks and flags in the Go S init to only those
    necessary. Previously they were duplicated from the Go driver but
    everything except HID_CONNECT_HIDRAW was found to be unnessary
    during operational testing.
  - Clean up formatting for debug prints in Go S driver.
  - Fix bugs in RGB driver for Go that caused the effect to switch to
    solid when the speed or brightness was changed.
  - Remove extraneous setting of os_mode member of drvdata when setting
    os_mode. It will be read from the hardware in _show.
v3: https://lore.kernel.org/linux-input/20260124014907.991265-1-derekjohn.clark@gmail.com/
  - Fix Documentation formatting by removing extra + characters.
  - Fix bugs in hid-lenovo-go-s IMU & TP RO attributes being tied to the
    wrong _show function.
  - Rename enume os_mode_index to os_mode_types_index to fix collision
    with os_mode_index attribute.
  - Remove accidental rename for enabled->enable attributes in patch 4
  - Add SOB for Mario in patch 10 as Co-Developer.
v2: https://lore.kernel.org/linux-input/20251229031753.581664-1-derekjohn.clark@gmail.com/
  - Break up adding the Go S driver into feature specific patches.
  - Rename Go S driver from lenovo-legos-hid to hid-lenovo-go-s and move
    it out of a subdirectory.
  - Drop the arbitrary uevent properties patch.
  - Add Go series driver.
  - Move DEVICE_ATTR_NAMED macros to device.h.
v1: https://lore.kernel.org/linux-input/20250703004943.515919-1-derekjohn.clark@gmail.com/

Derek J. Clark (15):
  include: device.h: Add named device attributes
  HID: hid-lenovo-go: Add Lenovo Legion Go Series HID Driver
  HID: hid-lenovo-go: Add Feature Status Attributes
  HID: hid-lenovo-go: Add Rumble and Haptic Settings
  HID: hid-lenovo-go: Add FPS Mode DPI settings
  HID: hid-lenovo-go: Add RGB LED control interface
  HID: hid-lenovo-go: Add Calibration Settings
  HID: hid-lenovo-go: Add OS Mode Toggle
  HID: hid-lenovo-go-s: Add Lenovo Legion Go S Series HID Driver
  HID: hid-lenovo-go-s: Add MCU ID Attribute
  HID: hid-lenovo-go-s: Add Feature Status Attributes
  HID: hid-lenovo-go-s: Add Touchpad Mode Attributes
  HID: hid-lenovo-go-s: Add RGB LED control interface
  HID: hid-lenovo-go-s: Add IMU and Touchpad RO Attributes
  HID: Add documentation for Lenovo Legion Go drivers

Mario Limonciello (1):
  HID: Include firmware version in the uevent

 .../ABI/testing/sysfs-driver-hid-lenovo-go    |  724 +++++
 .../ABI/testing/sysfs-driver-hid-lenovo-go-s  |  304 +++
 MAINTAINERS                                   |   11 +
 drivers/hid/Kconfig                           |   24 +
 drivers/hid/Makefile                          |    2 +
 drivers/hid/hid-core.c                        |    5 +
 drivers/hid/hid-ids.h                         |    7 +
 drivers/hid/hid-lenovo-go-s.c                 | 1586 +++++++++++
 drivers/hid/hid-lenovo-go.c                   | 2403 +++++++++++++++++
 include/linux/device.h                        |   46 +
 include/linux/hid.h                           |    1 +
 11 files changed, 5113 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-hid-lenovo-go
 create mode 100644 Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s
 create mode 100644 drivers/hid/hid-lenovo-go-s.c
 create mode 100644 drivers/hid/hid-lenovo-go.c

-- 
2.52.0

