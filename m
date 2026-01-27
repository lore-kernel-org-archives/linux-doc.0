Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F2D8342507
	for <linux-doc@vger.kernel.org>; Tue, 27 Jan 2026 10:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769510419; cv=none; b=EOLVL5kjsd8BKWUK4vRlBLN+aXaRsOm5C3CMhsWVcZWWSbwh0SV98ENmT/PeGj674TDB7jttMOmTLiAAXerv5XXKoFevQTyWhyAZpvLid83e3ubroQ9SKJ2NU51qP0Msapja9CXlBF2unZ/JMdovRpFt10CGcEK/nueTDtZ3ybw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769510419; c=relaxed/simple;
	bh=P9g5e/OuAoGiuTqQFV/COqX22+aRYbcTZ9ZxgA8VVto=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Sfsh5kucXB5tQFpLI8CCKn2/yFJX37LwnO4iselEpe389dBrCyovULeEoNR+XIVC6bPwVXKwR9cQOwflNvwlJ2DA1UbNSwxzipqEP6PNRzp0k1Txx6S3oGVi1NKgR8hwKSlKGtyuewjFZJCT/OsngXmlCSEJmB8Ko/vC36gINag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ts8K3hqd; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ts8K3hqd"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-81f4ba336b4so5362092b3a.1
        for <linux-doc@vger.kernel.org>; Tue, 27 Jan 2026 02:40:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769510416; x=1770115216; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a4iJWQpRhO1oWXfwOzDLew+HQSAfx5T/zlqt/osxBI4=;
        b=Ts8K3hqdaYDGgU15AFQgKXg79ULuhVhMMThlWVDPc5ft6vGrr7WzTDQ0EbXAvCdgJw
         8h8XrFU9009WSns9Wuv68eX6YOpuhe4JoFqgWQKzJEwW8HFsv2IJ/xd+0x8y+T/mq2yW
         ZLBN2IOYF0zwHe9J3frrItf2ybOT7otk9Qq/dKDYerWo/c8sJ/44mbdnWObPAGu/1444
         g5t/CfvJ2KTF93vDWmUrvbAWZ7YxeOAcy1mt2YEttROsr9IBYRF5+Bx3T/YPb1ICUoh3
         OFzG0zHTU485PQGxKOArQ8EfQ0BqCZhjpp1/s6hrL+4w6pMy9prBMefbt0SA2tpXzyvU
         G6SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769510416; x=1770115216;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a4iJWQpRhO1oWXfwOzDLew+HQSAfx5T/zlqt/osxBI4=;
        b=TPaDbfFIzpFMphoBzGf9Ktx02YSVyd3o6Yt7EJsG2kIM93GKdfyU+lguGyAJ7Kxmy4
         G7IhyIFsoQsET8ubnQKyqwDdT7Gft+aDf1559PDcCOWDVx8F5DC+v8Gyw9selCdfbflX
         5+nQflvCZX+KlYgGZ8hbhUWoBcNKmkUS7DzhiRnFxOo8DeNPWxj41SigJMkLbrMTTibs
         KQwLnahNh+eO5kmFFLhRacuA/mQktjCwYC+OQrlSrYXtRikyqw55lMnp+QcgPuusea03
         g8Tgl53ucWrNZcsMIXgsWQhPY0t5q7dCExSpP8irE/58J3LyPvk6P+HYxlzPNJ/uFRNA
         eJhg==
X-Forwarded-Encrypted: i=1; AJvYcCXjqdFBa/XCs9o60omQFcSCNdcOfNFwp3XfKUo+Nxjg6oqtlngcYJilYCcophYLVAtnFKw9BJSZ4Y4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyB8U9kDrA2Hz2VRKBEc1OkqtGCxFwerDM9TPiqnFEoYpDQjWV2
	UeG5AGRU9wXem68prampVCUJfTMO5yxXy7ju50uMckob9yjKPzoT+k4A
X-Gm-Gg: AZuq6aItDoWZtrcBTQHuZmgby43lA4SjN3RgkO9FMB5RISy1PwGM3Kaqhdbbx6NERKj
	YeUfvMloYytgVXjzA8LnzziBwvmSqufkbXjQMVmniy4TPQYToDFzYyHif1d5g7Es6fnIG0tKG2L
	atipeaecWLkJd1zWzd+S7B86/P+q74vj0541D85s6SGzk4kCznTVtrNud9lrvNiaLyGdy3Gqsqq
	/uk5DsdLXCoWFsYhT2DxexZRam5KrKSrDkeqXUyKRSf9meP2GMkxC/nA2jRor5RY8bQmEAYHCh6
	sLpLKw2rAMqwMbIpHqPbwtA3+JK3VzF4LNOLipbpBHMid4D0BXW4I3aPvPJOdEFjjVGilxK7GkM
	jrqQGptU/ALAjy2i0wTtxxMJF72DdC64XCEzw07QrZyT6zajqt2pPdwroiE0eYaOTatVBzL8u7O
	m9A9Kpwul6OR1dA9Xjwf4x0GKlb2g4QBy2dPXatw==
X-Received: by 2002:a05:6a00:1f0f:b0:81f:4dc7:d39 with SMTP id d2e1a72fcca58-823692a3787mr1400668b3a.45.1769510416317;
        Tue, 27 Jan 2026 02:40:16 -0800 (PST)
Received: from c12-ThinkPad-X1-Carbon-Gen-12 ([2400:2410:5f2b:700:38fe:3edc:7f99:7e99])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82339095c85sm7218907b3a.67.2026.01.27.02.40.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 02:40:15 -0800 (PST)
From: Vishnu Sankar <vishnuocv@gmail.com>
To: mpearson-lenovo@squebb.ca,
	dmitry.torokhov@gmail.com,
	hmh@hmh.eng.br,
	hansg@kernel.org,
	corbet@lwn.net,
	derekjohn.clark@gmail.com,
	ilpo.jarvinen@linux.intel.com
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	linux-doc@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	vsankar@lenovo.com,
	Vishnu Sankar <vishnuocv@gmail.com>
Subject: [PATCH v6 0/3] TrackPoint doubletap enablement and user control
Date: Tue, 27 Jan 2026 19:39:04 +0900
Message-ID: <20260127103907.20269-1-vishnuocv@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds support for TrackPoint doubletap with a clear and
simple separation of responsibilities between drivers:

1. Firmware enablement (trackpoint.c):
   Automatically enables doubletap on capable hardware during device
   detection.

2. User control (thinkpad_acpi.c):
   Provides a sysfs interface to enable or disable delivery of doubletap
   events to userspace.

The approach follows the KISS principle:
- The TrackPoint driver enables hardware functionality by default.
- The thinkpad_acpi driver controls whether ACPI doubletap events are
  delivered, using existing hotkey filtering infrastructure.
- No cross-driver APIs or dual filtering paths are introduced.

Changes in v6:
- Documentation: fix formatting of the doubletap_enable sysfs attribute
  description (separate "Values" list)

Changes in v5:
- Rename sysfs attribute from doubletap_filter to doubletap_enable to
  reflect actual behavior.
- Fix inverted logic so events are delivered only when doubletap is
  enabled.
- Suppress ACPI hotkey delivery instead of injecting or filtering input
  events.
- Register the sysfs attribute via hotkey_attributes[] instead of
  device_create_file().
- Drop unnecessary helper wrappers and debug logging.
- Update Documentation to reflect the new naming and semantics.

Changes in v4:
- Complete redesign based on reviewer feedback.
- trackpoint.c: Simplified to only enable doubletap by default.
- trackpoint.c: Removed all sysfs attributes and global variables.
- trackpoint.c: Uses firmware ID detection with deny list.
- thinkpad_acpi.c: Added sysfs interface for kernel-level event control.
- thinkpad_acpi.c: No cross-driver dependencies.
- Documentation: Updated to reflect simplified sysfs approach.

Changes in v3:
- No changes.

Changes in v2:
- Improved commit messages.
- Removed unnecessary comments and debug messages.
- Switched to strstarts() usage.
- Simplified firmware capability detection logic.

This version addresses the remaining review feedback by correcting the
naming and logic inversion, aligning sysfs semantics with behavior, and
fully integrating with existing thinkpad_acpi hotkey handling.

Vishnu Sankar (3):
  input: trackpoint - Enable doubletap by default on capable devices
  platform/x86: thinkpad_acpi: Add sysfs control for TrackPoint
    double-tap
  Documentation: thinkpad-acpi - Document doubletap_enable attribute

 .../admin-guide/laptops/thinkpad-acpi.rst     | 21 +++++++++
 drivers/input/mouse/trackpoint.c              | 47 +++++++++++++++++++
 drivers/input/mouse/trackpoint.h              |  5 ++
 drivers/platform/x86/lenovo/thinkpad_acpi.c   | 42 ++++++++++++++---
 4 files changed, 108 insertions(+), 7 deletions(-)

-- 
2.51.0

