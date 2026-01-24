Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F7F1487E9
	for <linux-doc@vger.kernel.org>; Sat, 24 Jan 2026 01:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769219355; cv=none; b=EEUj5fmtNfQeUEr5of9hlWzL16qRSqbZLnldAoFt0lvUPuNaWwOIyV1wNsXrWMkGLqf8dKR9H6si3Gf2Gz3nzKrx5ivLESjTU3x1ljxBktRxljaT7/OpUYC3JXcf3hBskJxt1k6z3uYRGBH4ytgZ+UYYQ8pencHFszdt1jL1dxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769219355; c=relaxed/simple;
	bh=Iz/O24RRXRopA/iYdltADd1JWiRCy/cbu+LwfrkUwAw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qTQxfr11OAdZtb1dkgXO9xfBOzjY9PIhH6mEgBak5etoT/3zovwPwa0fCxmA3F1nJpd9u00/A4Br6qJ+3n0n8D2FkwRelnDZ2+Fbfn2WFLSjTaGKLnAQvi6fsOXdiw+QJPVZ/6duk78qCYOgSkuuYgrbEWBY5+gcIqddgKvrXIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cGaagszN; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cGaagszN"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2b4520f6b32so4540711eec.0
        for <linux-doc@vger.kernel.org>; Fri, 23 Jan 2026 17:49:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769219352; x=1769824152; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Uo6jHEB3ezzd+BlMZazV0yjnUEyUOn6k4aOM+PmOEkM=;
        b=cGaagszNxVMFiSgF8MuB2EjFKKMtEHfjVJl99s2cLFrSGV66ItGwhAckoHwVN7phN4
         8P/L8wQ/b0U9LyAuNsdxRCG+w74g4frGfaSmkxMAzhIZk5wtN8tGpas89w83mrYitUdZ
         IomeE41Xs3KXNVq89guZFaRm7iWi3Cyzh6Pf+3rWG6/a4BvQ8chA17cIc8AH/zadEG+0
         Ahy7o88W4Cmxbs+2lugORLbHr2N2euOWExT4mh4xNwKvGtobDbR8eFCUaZGBWfezo5Vr
         MYO8f2ExIIcgbvyCwROHhk77GIKyQ3Xpzrn6bi5iyE7iCBLqHJ4AKV6QULkNtRX210q/
         To4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769219352; x=1769824152;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uo6jHEB3ezzd+BlMZazV0yjnUEyUOn6k4aOM+PmOEkM=;
        b=YPn17Acm/8DM9bkNPbsnQrSdVntplsgI+uijg3CXZDmZIePnIGcpcJnQY698tlDzer
         XfKCOOi5jUOpkdkx1KAZQGYfYvuF8GxzXcewnj5b0fGR7DLgirI1AVwQ5G7iFrZ8vNhj
         4dTVtzEcmamtD8b5UsGOjhb0YUokfrniRTU612m3vVxMkpnB3w5+JDrKtaRMPrwEFHUh
         GSXpoZ+sGYJoh50jMhbvN0rdaQsHwVgwaI/+Gp4KaNAVX7Chxc4JzGUWWRzTDqbnaokG
         /eXUxYYP9veG0dhvtaJ2DF4mqxrqafzPwhfiD7YQ4AVRQj01qn4Y+gLtpYyUEh+2gjH2
         jFCw==
X-Forwarded-Encrypted: i=1; AJvYcCUb96HM+ask8d3im+4BMXpx2/2wPxzF3dxlYS48BhTUq9IYZqSv5txady8vH8tc7gqAa0MbdB57s+k=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBQs0KhajBA5ThS8Q0pxtFd89WOuQzK+YkqwlWQbq9tYUpHiPV
	rRfUnVyqzQEJwIFaCpoEMch90g27O2RSjsDnkxhy5l12/oa91KCnZ2/L
X-Gm-Gg: AZuq6aIy1V3ww9QA291NSzgVorFOUFucU8NrVnYao3MOw9eAGwe7S4JJ39KHT0I1fJp
	ornrRrhZF06C8V/ET8s4D8eqZAjyd7YtAn7rbhY6/rLZ3yjvEYdM6iOL7Jtf9ilRNQGrtdB7+Zu
	vDsp0EhtrqWyqc3ioWk9xdp8lKqPKEgl+PePTX+tSS5otBB19hk7R3e6yjtFGid/QomszL+4EqX
	oDoVGF+Otq9elzr+Hw/agViOwbWEmpXwKJWyP8Q1ETuDmKrSMVjKLAeLMtusAHplXmnb2lFWqHG
	NGgw/nCLMoE/2B6vk2cM+IoQt5hsFb8Ha9vRwNvWy+0HsKRAfdd7Ma1INlZanh2JiwOAckVu8wQ
	qPk0/dIRdNVwYcqDehpmMVzzY7GXLVxQ8lTovMBtfVuFpL3BB5Q+15rMAUrvrsy5Nuu7Xs8JxSF
	Qp7SS1LFh9Bw5dydpn2hKxgi+c/4JF8ea3k1+hZ7VYT8rbs/RQb6CeosRCHGD265I=
X-Received: by 2002:a05:7300:8183:b0:2b6:b23b:d488 with SMTP id 5a478bee46e88-2b739b71186mr3129087eec.25.1769219352182;
        Fri, 23 Jan 2026 17:49:12 -0800 (PST)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b73aa22707sm5160014eec.29.2026.01.23.17.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 17:49:11 -0800 (PST)
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
Subject: [PATCH v3 00/16] HID: Add Legion Go and Go S Drivers
Date: Sat, 24 Jan 2026 01:48:51 +0000
Message-ID: <20260124014907.991265-1-derekjohn.clark@gmail.com>
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

Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
Change Log
V3:
  - Fix Documentation formatting by removing extra + characters
  - Fix bugs in hid-lenovo-go-s IMU & TP RO attributes being tied to the
    wrong _show function.
  - Rename enume os_mode_index to os_mode_types_index to fix collision
    with os_mode_index attribute.
  - Remove accidental rename for enabled->enable attributes in patch 4
  - Add SOB for Mario in patch 10 as Co-Developer
V2: https://lore.kernel.org/linux-input/20251229031753.581664-1-derekjohn.clark@gmail.com/
  - Break up adding the Go S driver into feature specific patches
  - Rename Go S driver from lenovo-legos-hid to hid-lenovo-go-s
  - Drop the arbitrary uevent properties patch
  - Add Go serires driver
  - Move DEVICE_ATTR_NAMED macros to device.h
V1: https://lore.kernel.org/linux-input/20250703004943.515919-1-derekjohn.clark@gmail.com/


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
 drivers/hid/hid-lenovo-go-s.c                 | 1577 +++++++++++
 drivers/hid/hid-lenovo-go.c                   | 2399 +++++++++++++++++
 include/linux/device.h                        |   46 +
 include/linux/hid.h                           |    1 +
 11 files changed, 5100 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-hid-lenovo-go
 create mode 100644 Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s
 create mode 100644 drivers/hid/hid-lenovo-go-s.c
 create mode 100644 drivers/hid/hid-lenovo-go.c

-- 
2.52.0

