Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7AF22B8BD
	for <linux-doc@vger.kernel.org>; Mon, 29 Dec 2025 03:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766978281; cv=none; b=a7LoGNaCGd7UzQlcqFrhyXJcsKLzKQ+B930hwcyZq8LW4S3zSfr8v/JgdBYYbV5qlN1a5W72a8sfKLJmyGvN4zJy/mOCVFVQ+maQF5HXtesN5DKELpTrMdF/IDv4+cDCn4ZUXFqUIoIgxVAj+IJNFOxOgddDBCedB/ql+0S72vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766978281; c=relaxed/simple;
	bh=Fi1/c+5lSJRCZBIiUrBN1mpzajLsCL9UqBkvUPkS5b4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YBnpwpW+NcAG0ECMgLNPPdRy73+IUa9SyJ5nw3SNuAHM1gaMbqEZXACsn0HzbR59c0hmMH51XsnWQZS0y4StvBb6hh3XPqtAoxCF0IgLwYfWV96/eiD/wac5z1wmhLqQSGMXucZYcimx4U+yl02D1gX9xSE2suY5shWH66HX5hA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gGc3vwWG; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gGc3vwWG"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c1e7cdf0905so6277589a12.0
        for <linux-doc@vger.kernel.org>; Sun, 28 Dec 2025 19:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766978278; x=1767583078; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e4njMGO/PyNpyvXlYB1fabh5xuHzurbGIcIZcVdujAA=;
        b=gGc3vwWGyOW9A3w6reEt1atG7BI2z1WaoluRTxtG/z+VMfb5AiqdnGaZtG3G8L66G+
         3S1C9JRwpSs1EzLSEq9MQVRA7EJF4PoQdbz1ryyR5u6rip/lZodYZY6YjGCEEssEmVBr
         q4inaSx2HN5SLB5NP/bJd4hDcabBCpKbee11cistCXPVBSEOG9UXiR3BjMZmKLWodKyy
         OEKMNzzCvhGQGmoVmn3ZWUl1L2ZENFxPFO8X/IE+tMbGU/pjHP/+xezrM+dBZtGRjZm3
         avgcfmk7iOKdrIM/yJyzoOCIYUoaLy46kmsG9UdS5HRqC6uDoBnwpUODBBhHEYoaLIc9
         WZrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766978278; x=1767583078;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e4njMGO/PyNpyvXlYB1fabh5xuHzurbGIcIZcVdujAA=;
        b=NSBCSJU7wLwcmqdfe1ZvvMh1t3EjKtgcmjCBX5iZ+GQNk7nyVbfkscZX5vk38sUNgV
         JPr6VS+W1gbkUwl8XTbaMPAOYNSjgXjP6KaMUkdcle0gKSVcPbH2ZnALlHAkQIotYFex
         iee5m2MoD6IfcSt/25mvOBKdSYAfPKrGTE/pE1GxmjVvGl/MRXWoloT9xsFtI6OysLto
         C9KEAxXhI/PMmOIvSOA7ccvNfTQRGlxkJlbSpo8wFifh69Fm3Vuats49iRdHGY06/IT2
         ywYe2dqoDYX4KBeQ6sx44G1ZuPH7mVEbLOsrqXSVCBWYUP9SrPORbp7Hj/9NIY8w/hZT
         57zg==
X-Forwarded-Encrypted: i=1; AJvYcCWbdOqPHV6o4Zyfv7R57qVORDL26Pa6GSFqw8Mlpq2rIj1z2AHVvJcnT3HIE10Qb/zCBbAY7wc0160=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ2siW1lDr9d9E46b36K3PGtP3JnvxNrTPghwKxyjX7GmtPSB+
	+GQuqzLSIANo73ZV92JrYiPod7xSOls6aktY30SsUwZq5Y6SmNGigVkA
X-Gm-Gg: AY/fxX4xAFSIcUdGWivTcHkoKuSyDvCA3dE4h7vhQfRHdhVecy5F2H00vwBba4u0MjF
	b/UjprggDlVYjf1xyBC4cAuKmaiEAgV6X1xjBEoA3gc7TtDWmFlq7p9WLkAQGktn0Z04y5l5F4m
	idDZ/3C5JwB0XAYb84VwJGBAYOnJkW1uhW4zeAY7Va6+CLRnU5kj3z/5loPh4ZCixDgThYWZr5U
	4dzvW946VvFCa8Q1Wxp9PJUEWMsSet+zbQVoAVz7aqIC5ah10J4KTx93zh4IjK3aw0L/LXanSG8
	DzPSR4sD+UnGj6hMevWksG5xP2tOmdK5y4OTawnaZMIIVxyR9+fNedh90QP2k6hfpvlwUJHJCNk
	YF7lTc057Jz+XCpCkR+JH6aCy04jInxUu67BCUtY9heOEizxopY0BTnmnZ79L4hVu+mVaCxF/XR
	t2hK9kjZDadXc7Ak4YxMo7hRUFQkOyCCb5OMI0CPGoY7k9QssJ59Yy38nOm0FjBUE=
X-Google-Smtp-Source: AGHT+IEebuW+IoiqvysUUZpmQxpgODLTsT/ms2sf/R2csAsWQCDmJTAj3MxHtbH/H+wZXUKnXjdEGQ==
X-Received: by 2002:a05:7022:2481:b0:11e:3e9:3e8a with SMTP id a92af1059eb24-12172312a5amr39517734c88.49.1766978277912;
        Sun, 28 Dec 2025 19:17:57 -0800 (PST)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724dd7f5sm112992785c88.5.2025.12.28.19.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 19:17:57 -0800 (PST)
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
Subject: [PATCH v2 00/16] HID: Add Legion Go and Go S Drivers
Date: Mon, 29 Dec 2025 03:17:37 +0000
Message-ID: <20251229031753.581664-1-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.51.2
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

Finally, there are some checkpatch warnings that will need to be surpressed:
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
V2:
  - Break up adding the Go S driver into feature specific patches
  - Drop the arbitrary uevent properties patch
  - Add Go serires driver
  - Move DEVICE_ATTR_NAMED macros to device.h
V1:

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
 MAINTAINERS                                   |    9 +
 drivers/hid/Kconfig                           |   24 +
 drivers/hid/Makefile                          |    2 +
 drivers/hid/hid-core.c                        |    5 +
 drivers/hid/hid-ids.h                         |    7 +
 drivers/hid/hid-lenovo-go-s.c                 | 1577 +++++++++++
 drivers/hid/hid-lenovo-go.c                   | 2399 +++++++++++++++++
 include/linux/device.h                        |   46 +
 include/linux/hid.h                           |    1 +
 11 files changed, 5098 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-hid-lenovo-go
 create mode 100644 Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s
 create mode 100644 drivers/hid/hid-lenovo-go-s.c
 create mode 100644 drivers/hid/hid-lenovo-go.c

-- 
2.51.2

