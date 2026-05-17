Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B430A37D10F
	for <linux-doc@vger.kernel.org>; Sun, 17 May 2026 13:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779023077; cv=none; b=oFi0N8uqfMaptNY9uNow2QQFJD9VqstxxXi4pdUVL53fG/eJOQ+SJi++sFH+BOcYZ5DwhGFWa2yxrE/4uPZtdnAlvN+WN6x4C7Xk6Fl5QBh2fv7Coa32k4TowIsVi2FavFlqWJaoQ1c/aaSQ8CwqFhzmBSKKEZtkUpkodPpwbOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779023077; c=relaxed/simple;
	bh=LeWHHqCWtRB6/iOFzUEGlxNN/mbW1NUBtdf1HtpuOvA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VfU7n0yEZ1CRqiPS8U/FBL8hRu2aF4rHGb+SeVugQ2h3ZueY1y+0RgOs3VkMbFb/KRC6RZzSYh+P6YgJveibVV0ThNvhc460gS0k/FCHq0Sn5dJLu89ogmlqod36p0OQ5xGhxdhWAGySma7gBEiNwiZfI3mr+9VCVzUflLJWkkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KI3IXRyF; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KI3IXRyF"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c7b9f54d3deso1061739a12.1
        for <linux-doc@vger.kernel.org>; Sun, 17 May 2026 06:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779023062; x=1779627862; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NmrD4XCw/ddiD1eD+XE4KxmCSjyDbYSOCXwkAExthfA=;
        b=KI3IXRyFIToM1BOabyqiJXZANtjQirFVaVz9VJPHyxWo6dBbqtfnNR78d7kmpz45Wa
         mobSq+A+ZwugG184a5IK6RoJ+T18iNaEvnOWcB5JJ9XJ8mJGG+gEvpXHZET1oA8uaiUM
         Ktxt57oqZp8kBCDkS5w7wke+34eC77LMIoDvmXUVxMaP6ONZRA9CxCXopZO+RUCSSYNN
         YleCpuRh5Bo0L8e0NH4w2dEg+y3h7ixHKfDkolY0rVAFv2em3nWHPm5LMf4FzjOuLs9p
         QqLKpXdfAMO56q9c7yRfpry+APnNq0xnhAz3C5+ZBLRJdqS8IKhuEwx8XFVqRafxVt5K
         +jjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779023062; x=1779627862;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NmrD4XCw/ddiD1eD+XE4KxmCSjyDbYSOCXwkAExthfA=;
        b=RkuGk9cjFWDu4X7LsWXZYP3U32DxJA5wgOgaxp03TaT12kNVLXdNTxZG6KZvpjG3VS
         63rQQB6nGDMCKe/EdfoecL2chWGwKk/CoCTLxIOJ8qs0EQzVmpuUhZf+p1F3EOIttOC2
         Sa7hyNn5cumVlLgt4EeMgFPlYdQZuyvM3gTd9t4MJ5vsBri0fDn2sOdcB8X1hB/HHKDR
         epHXxGZ/9USOXfi6nDSceXoqVmtL1z3XVBRxFsBhGdCqSGK5Xkt/vTSLyqmTzXR9ypV8
         AUZaR51Li7qDlL/lH6SXePtPuxd8kZkTVzamd4wJLrEaUGFQILFPFQ2DqPFqZKzXI4ul
         /2tQ==
X-Forwarded-Encrypted: i=1; AFNElJ9MmwN+4YprX42pLdYc/fd0DqBiA+rBb8Ivg7WnGQdWFCQd3ZLZt3Qhg9v9fL5nxdMKrIhubAwB0TI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3WNM4ysXvw+muiXBWLzpkcsW1P96QdRIUHNnZDZ3SQbNYLpJS
	EUrDxe+oW+K/gpNo88pfmffP1vfDu0cXt167ba5N0TguhalK3rWRLKc5N/0QPHfn
X-Gm-Gg: Acq92OEpTvTQqaBUFhP51UzfSWiT0o772eAft+D8LabMQd/uDa078oJ5aTBQKMBbtD9
	eM754i9hF4y+204nmsxDx0ZupwFu27Gnrz8tbN1FWtqjPp0tXPG8UJT6xuvnHlEZFf/CuG17Zzg
	kAbfsBWTjmS2LaPxC9b3m/B/dVLqNFIsR2ULawHGLEsu0hwWzSeMXpenFk3BWc0pAxx+Hy2TXgl
	Gv5qQNDdBxLTzt0pvCmc6AiIApuI0dBaNBXgPeWNJugHO6Dwu2gcacBRDoJkQJjjVpE1BIPUAd7
	eR4C5mnpU/X2CVY018VBX3iu7qYY8uEIi7R5hw/JqGR4Xt8Te1AITp6wIaYfH6gzMwJ48VvcbTe
	5l8g3vGks8Ahy0639qnj1lLeKUaH2sn8pw1e0s1QWjpYjWosQex0mmBLCXH2l1j8mEUeOq7zAyx
	+swQ5T9W71NEWDfVjgDN9eQQ==
X-Received: by 2002:a05:6a21:3386:b0:39f:794f:94d8 with SMTP id adf61e73a8af0-3b22ec9aecemr12673319637.29.1779023062153;
        Sun, 17 May 2026 06:04:22 -0700 (PDT)
Received: from mincom1 ([119.214.48.64])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c77822sm11712607b3a.41.2026.05.17.06.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 06:04:21 -0700 (PDT)
From: Jihong Min <hurryman2212@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mathias Nyman <mathias.nyman@intel.com>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
	linux-usb@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jihong Min <hurryman2212@gmail.com>
Subject: [PATCH v6 0/2] AMD Promontory 21 xHCI temperature sensor support
Date: Sun, 17 May 2026 22:04:05 +0900
Message-ID: <20260517130407.795157-1-hurryman2212@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This series adds temperature monitoring for AMD Promontory 21 (PROM21)
xHCI PCI functions.

Patch 1 adds a small PROM21-specific xHCI PCI glue driver. USB host
operation is delegated to the common xhci-pci code, while the PROM21 glue
publishes an auxiliary device for optional sensor support.

Patch 2 adds an auxiliary-bus hwmon driver that binds to that auxiliary
device and exposes the PROM21 xHCI temperature value as temp1_input.

The hwmon driver reads the sensor through a vendor index/data register pair
in the xHCI PCI MMIO BAR. It does not wake the parent PCI device for hwmon
reads; if the parent is suspended, the read returns -ENODATA.

Changes in v6:
- Make USB_XHCI_PCI_PROM21 a hidden tristate that follows USB_XHCI_PCI,
  so the PROM21 PCI glue is built in with a built-in xhci-pci core and
  built as a module with a modular xhci-pci core.
- Use an IDA-allocated auxiliary device id instead of encoding the PCI
  domain/BDF into the auxiliary id.
- Use a 32-bit read for the PROM21 vendor data register and mask the low
  byte instead of using readb().

Jihong Min (2):
  usb: xhci-pci: add AMD Promontory 21 PCI glue
  hwmon: add AMD Promontory 21 xHCI temperature sensor support

 Documentation/hwmon/index.rst                 |   1 +
 Documentation/hwmon/prom21-xhci.rst           | 101 ++++++++
 drivers/hwmon/Kconfig                         |  10 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/prom21-xhci.c                   | 239 ++++++++++++++++++
 drivers/usb/host/Kconfig                      |   7 +
 drivers/usb/host/Makefile                     |   1 +
 drivers/usb/host/xhci-pci-prom21.c            | 136 ++++++++++
 drivers/usb/host/xhci-pci.c                   |  11 +
 drivers/usb/host/xhci-pci.h                   |   3 +
 include/linux/platform_data/usb-xhci-prom21.h |  22 ++
 11 files changed, 532 insertions(+)
 create mode 100644 Documentation/hwmon/prom21-xhci.rst
 create mode 100644 drivers/hwmon/prom21-xhci.c
 create mode 100644 drivers/usb/host/xhci-pci-prom21.c
 create mode 100644 include/linux/platform_data/usb-xhci-prom21.h

-- 
2.53.0
