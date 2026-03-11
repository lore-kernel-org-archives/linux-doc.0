Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A631DA60D
	for <linux-doc@vger.kernel.org>; Wed, 11 Mar 2026 14:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773239690; cv=none; b=QzqpMz+GhZTM5Vph+NInX30ziZLd5RlMmMR2Jg96zzDrXkVcNl6LQmJQN9Y+oYXgIlLPQlgzKKgG7P5xoPJgVDourORF8EoIZHkf3YGseXnP/ViP0eHWRHnYUZduel08CQTLCYsvNT9Yo5CgvdcCeDzFmurlclcaZJu2Yc2x97g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773239690; c=relaxed/simple;
	bh=glYFtw0ChtLtDYmcz54w9/XuNBlw2ZfDfkh2yo0dps0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YHKz7WhuJKbSLNIRHUROOlVpOVcimY7bGoi6d7bGGc1MaKUR7IAuzUnBJQ2sVzFVB/h4ze+ECL9Tu9fCocjoaWwSgR453UjJcTR+BjA1PH0cI6gCTDljwyjWR6IPWxi51yy+jFwSkXYTD+kvO7jIDZnKOT8LDAv9MqoZCKe8UVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M+i1VXZW; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M+i1VXZW"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2aaf43014d0so104078105ad.2
        for <linux-doc@vger.kernel.org>; Wed, 11 Mar 2026 07:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773239687; x=1773844487; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=px8rXXbWKUNDQohmf88G75oyBAXUA4ooe+T2HAoytjc=;
        b=M+i1VXZWQAMhuV2da01DMt/egTMffFR5Y5H3SS6CFa5HFcDQ2CY6U07ClTNlK3JRTX
         PIXugskVfvFQnz0BpvdrxnQf8LYxDYxfO0WYcTQyRtj4f9vcW6TQbqAxVTz6UT5tss6A
         rgI+doj7xTBJnNrgenrQd5oYsf3q6BfMqYwDCzrt34fwABxg3fzeOCfgLMyabqIbM9O6
         NHqXZus7IBHsSN/QKix3VkWTeWib4MzBcL7KrqUmE6pm54f3x3O+7NDRis8oeLrxv8l/
         +cr7vNoKlYG07H7Rlh8E2PzG9la/ej02bhvJW1irCfGIewuFIygJ7Yj2UjXBwqHth2U0
         JEDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773239687; x=1773844487;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=px8rXXbWKUNDQohmf88G75oyBAXUA4ooe+T2HAoytjc=;
        b=s/D+W/D+jeSWum92LXO5NGg2ckzU0cpqLeUSk/Wrl70Cd8SlfP8be136LnOWE4hsMW
         QAAwntrjx3CcQ9PZJMdgITaHcw8HZ8gFsWvu/Zl+1T7BRXJhC57bHXW1Ka3BaNzXYfYk
         B3lQjQDL+d5gBR1lM5JkS2WIFIahx1sx/yXb6PlWelPN6nZSXUgDJLr9+OkAUX4vWQdz
         LFHLUCbUq8w3HjvWCEbU8sw+ZsGE2H8Nq7UJnP9QxnBp9oRxlXDDGuH8eAMkaz9ooZGo
         +dpZmwkxl65zWzhh17aVlrnxELDUrmoN68eRy++MONI9hcSPmepnQlEY8vysHn8ZshIH
         TV8w==
X-Forwarded-Encrypted: i=1; AJvYcCXs1sqahOCIApr+XyuZzv2Xk+MKQIDwrGIxFzZY5trPCSLbBjkFCpGk3eghxRFgwrRrsJYx5Y8OUAY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxe6g6QF3oYuxENVh1fTvd4wGQXq/2GOB29tKPdQAgh7aYuT5IH
	SoqPHB2499iRM2lukSmjGo9YRWCaP5R5INw/vdCQOH2gne9ej0yMEfVl
X-Gm-Gg: ATEYQzyDithmBn1xTPyfTo2KVfBW9mV1VNjkWGjFArSqTUpfMab2clyZ/eO2GYgm/c2
	cuVu32YqaHRqAa50otlZBVIk8yv/mlwIYbRM/tZC79v6wtxpzG+xypOglUGUbSG+xId/zzIyJyf
	weEY+FLHFmtmF1mrqSoRNauAF7QmQHuy88IOZluYk1kfaW5BAw17c/2dM8iuFlLJpYz6sAe4yRb
	diQdbVftHXuUZ5G7A5qaacYjgzqyzf7KXWH9RqJZc6r0hWv8WAIrkL2Axa4/M7U4+TcrrxmhhSh
	jtX7IedXV72bY1ieIEwZG6YnVOSpVKj9MIL5cHPD+9b2syqSV7zLjzmsZugQlFa+41mlV90EizY
	+eefBddTGMiagKNIzDVorPuNGBBgHYcMx45Zg3qPY3C5SEg/5EHwZ3AMk+5IrFDrwXrnXo/WXvX
	FwGEJ6Lm7uvn1PvfyWdDUmAgzYOruhOOl5SeZkb+n9S+b+Z5Z0eS/X/vgKcis=
X-Received: by 2002:a17:902:f70a:b0:2ab:230d:2da9 with SMTP id d9443c01a7336-2aeae8dce39mr28983155ad.48.1773239687170;
        Wed, 11 Mar 2026 07:34:47 -0700 (PDT)
Received: from c12-ThinkPad-X1-Carbon-Gen-12 ([2400:2410:5f2b:700:dd5:d7ff:1c94:3624])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aeae34e070sm26399235ad.48.2026.03.11.07.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 07:34:46 -0700 (PDT)
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
Subject: [PATCH v8 0/3] TrackPoint doubletap enablement and user control
Date: Wed, 11 Mar 2026 23:31:41 +0900
Message-ID: <20260311143144.482145-1-vishnuocv@gmail.com>
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

Changes in v8:
- Added linux/array_size.h and linux/strings.h to the include lists for 
  ARRAY_SIZE() and strstarts() respectively.
- Better formatting.
- Fix indentation in doubletap_enable sysfs documentation.

Changes in v7:
- Removed unwanted comments and logs

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
 drivers/input/mouse/trackpoint.c              | 46 +++++++++++++++++++
 drivers/input/mouse/trackpoint.h              |  5 ++
 drivers/platform/x86/lenovo/thinkpad_acpi.c   | 42 ++++++++++++++---
 4 files changed, 107 insertions(+), 7 deletions(-)

-- 
2.51.0

