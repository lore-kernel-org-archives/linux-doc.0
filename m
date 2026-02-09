Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523BD2D9494
	for <linux-doc@vger.kernel.org>; Mon,  9 Feb 2026 06:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770618879; cv=none; b=nttyKbKGWBOvlcM4jktgeEHtBwj6vYpXv2Vl7UWMaFamy0cJlS7ZFk4cgfczDjkp9EvQFQPSDkgSroiYyEc73+sxpPUfJtzBy2a0hNxytdchGe6kfIhzhyV9X4dKACBRXxL3rRt74Gi4E7YnxJ3FDAuKb0w6+RWK8B/nlBfY90g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770618879; c=relaxed/simple;
	bh=DWif77Ano7kpJBBh5wh4HFaGwnwScHY3xJyOq4XoBj0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Criy/Ncc56+6/vjQVuFDE4ieMKsZpzUJcg043+0+FflpSQQ4V54pGN1oplxUvNSttUVRm9cjxGsOqkVQvR9ldu4fHwh6BIhGiIWZV1stdy1GZyWr4oBUmWV2KOVay9pM+yoojtfQe8mw1DrS2RaQpQa9uShdMvw3Q5YtTehopWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nc5Kqi0C; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nc5Kqi0C"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c6788f3db37so1471938a12.1
        for <linux-doc@vger.kernel.org>; Sun, 08 Feb 2026 22:34:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770618879; x=1771223679; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NY4eK16EbJpbVZRu/k6DFIXaDmDtR8rLx4eN0dTlAKE=;
        b=nc5Kqi0C3+v3kgzbbUXtLkBDhNhdaTCVhbnAiZKqaXbufQeBqPiENf4o2fgOcm/vQy
         exT900/6WhTPg6tKuNr4mKxPivn+dWxT6Ossi5L32Fl416VP5TiEBBt8p4ZJ185HHjkO
         GHwQL2jdwsD0mHlWqZjECiREJ83VdH1H+rWHCME8Yq/8BwF7TngbljLpBU33n1G8/w3b
         y8i3AAfHfqbDz/lU22ad0S0sjHVjf50V3c/v0QvNALMYaNG+jFtRNw1/Ah/3+fnRTKcG
         Q/8XHlCAUla5oS1LxnqMGEvJgK51+UtDoXep2nhZ39xUYapD3xlqqa3BJBq6bZIQN3Dk
         f+jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770618879; x=1771223679;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NY4eK16EbJpbVZRu/k6DFIXaDmDtR8rLx4eN0dTlAKE=;
        b=j7m15wGIKzDNRxUbfRWjV/DaC/oWtRaqPBMef4g1rpWboSw9r7PBtzfjdYIZJwU58o
         hKuKrwG/YM+BOtSb8CRI+tpAKHUifGn9Cq8NqM1NqLjgTODh8wsy9FgrPUtd4A8fiwWN
         JYwPvK3NcWtyvCPrtrecAJLk8oV3AuzKiO7XDwBmkiUjcX8O1x+JseacmKKiYNP/G0Gf
         K5pU7hT2QwRfOITY8ZHC3802UJPS88Q0jcD18w+bJi7k0Y0myPYCk6yo1b6XdTWSfd2G
         yPWG72DopxWJUG/C7R0t4GZQJ017Cj4uKZuw4EHQ2/G9+vX5fHko+VL2K3z5E5Trla3F
         usmg==
X-Forwarded-Encrypted: i=1; AJvYcCX5DduhFTuEqM21IKQI0fr7FmBbd+TdLf3JzzSeEEtEykxeAgOcYij43HSYOKwu7zSVlRLiWtOMFUU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuMyE6pgDf3CV8lkX1oXNK0mnTVo2jsfWx8ztwqRIqMGzXCJw/
	JA5fL3ltlo3U9FoKB+VDdfHkiadznsNZZim5zpa4yPGnh6HFTqMk0E3s
X-Gm-Gg: AZuq6aLMkpDAL/MIlHGMbd9AKCiHg2dFDvoVMzEPOTMI79AM/YEUtmSiTnN/N/8PDQ3
	rAbowE4nPkrbnbEnPLyaJnBMxtDQdQCld7XfdAnAEdtiCI6KN6J2aEilZW3xPiT6kgKqlLd/bdw
	jC2JsxUwPfhJU3hiqAD1FfcivskVYvGQyQB+TXge/npGrc/dh5wsrmzATplp5wX3ClAGNbHwYtw
	pw89ZfsrKcHTukxJkcw7u/6/wmlJZc9oIae2GGGm80Qqaebw6C9s09AR8Ic2JWVfuP1i2blKSPU
	osPO3fRGOgCgl19wImLHhhGT1cdwYrG7TLhuTnkN3STwcPuVFeWxvykeivm9s8jBEZTrP7TNn5d
	yjCjToHk9PbV2PULO7WvMk8ticKdZHC2cURyhP+n8N4asbnWRaHCoLwKLDFbrjiSY68x/+ChFgy
	NGAmpgP1QjQgBbQ7koXY3/wiy2RCnd7YLXqHGPeQ==
X-Received: by 2002:a17:903:234d:b0:2aa:ea3d:a37b with SMTP id d9443c01a7336-2aaea3db331mr21479775ad.2.1770618878498;
        Sun, 08 Feb 2026 22:34:38 -0800 (PST)
Received: from c12-ThinkPad-X1-Carbon-Gen-12 ([2400:2410:5f2b:700:e705:6ccd:6241:6a0a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aa3ec42e2asm83440455ad.53.2026.02.08.22.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 22:34:37 -0800 (PST)
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
Subject: [PATCH v7 0/3] TrackPoint doubletap enablement and user control
Date: Mon,  9 Feb 2026 15:33:52 +0900
Message-ID: <20260209063355.491189-1-vishnuocv@gmail.com>
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
 drivers/input/mouse/trackpoint.c              | 45 +++++++++++++++++++
 drivers/input/mouse/trackpoint.h              |  5 +++
 drivers/platform/x86/lenovo/thinkpad_acpi.c   | 42 ++++++++++++++---
 4 files changed, 106 insertions(+), 7 deletions(-)

-- 
2.51.0

