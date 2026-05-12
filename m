Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1039D386575
	for <linux-doc@vger.kernel.org>; Tue, 12 May 2026 21:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778622025; cv=none; b=q1XlM6DgYVrllOEVU06Ud3v1CwO/uUi1bFV9qb7FzzIZLjOUihCz4FDFngQp0fU8wsqXPMJ3UlwYFcJ8HI6J0Ct0M32UtW0Uq92pNiuLcozQqx6ARIfdsgpvybhHcco4iVx+RopwCRRziNGfjO3ZBu8mHk1P2HePtdssC6XKo3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778622025; c=relaxed/simple;
	bh=sTJxJ/xasIqDRCeYM0JtmkGU7hXrTwpbCDass0bVHps=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Js/PE7V0+XFSSMenvFRqYpW5iLF1P4jN8s1N2pg16578FjVTE9BuhKplKtFaQkpTHY//pm4lbtkwGfYj/V6LhhD+5WVCxJdzc0y3K3tn7L924w55R0oqCC57ERrYPvfwXNjGxH/MdeSbkW0ifT7quGYH0OYOhqfFYcrn+cMKQew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OQWdnaij; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OQWdnaij"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c8016d642b2so3306896a12.0
        for <linux-doc@vger.kernel.org>; Tue, 12 May 2026 14:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778622022; x=1779226822; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LuJpPqhDcONg49vri+mgJGghvc2o/ilLGU2ZfssziEI=;
        b=OQWdnaijZ1h7L8r1EP1KKJUSbtDYxqsiw2/0vKLvMvQLdrb9ZVGnOOp2Gbe+jUMvYP
         PVCkgYSFZtaLFcaLWJxW4EL95IZznbDnPWDEsv845ZFoxjpn+JZSxi2ASVX/asrez5N3
         C++ah2Bt+sYUOE4mVfIa3Hiovmzn8uVee1VKr8VwD2DQFKyJ9B/UAWk4wH7g121HrhSb
         9EnoRB2tI4jdGbHrVW1IT0Q6ChG15TTtxdvMgF+15GAdv/tyoXrKB+reAvow7lj5cgx0
         e9IzOSlonqDlYRfOaIVga0qdurXUtBxkpjQKvhUPhCp7xT82X3TCCo/X0gP7wMsORNae
         mZlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778622022; x=1779226822;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LuJpPqhDcONg49vri+mgJGghvc2o/ilLGU2ZfssziEI=;
        b=mM92tL+h24XlgomBrLB/1FJkXbm1/y03lvNLvQu47UrYBfNCVkzWBRkFo2HvYKr18z
         6uJnpxC13nYr4wCsAiQ+ZxvpoF7cOSXfbHVZYFQ61zYktu43uts8xCZzM6vr66UjvE5H
         UZ7NsGVH7CPQe6YyJpJbo6W3Z/ObNpYfuQZIVBCplJd3tmiqbX8nddHooMXBtd+KRNrm
         7FNSzGPu64CoQbQOw0qH3+iknCBnO4V6WQbGz3bNaRkV+uSgvzy4UzoQGOhsxewuPZuS
         yp7pMWSWWOohGwmxs+ykWnIe0+xF7qKJPYujJNPLoXiPEaPe3cRbnWGXjgPbUl/quG/C
         XLYg==
X-Forwarded-Encrypted: i=1; AFNElJ/BtVJuWEJFkkNnfizPQA+Wd3hXBtySFs5b+Tp+uceCAzk7+J4Fk1Rl603Ruprd1wzLvuWOUmIZy7c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxgoulIahJtorSdLrRfqP1TTGkMSC83CV/uaBv3FJSdU3BHABL
	P4FqyjwEYhK7bDzclcWvcAMT5FKQJ4t50q2pfswirTqFFxqjfuoadZrV
X-Gm-Gg: Acq92OEV3cb2kYJuf4xfutQkO+iCgPMBkfzv3JOrCFb5TIdmNFUlSSwtPsyhfwangdf
	9qs5Ms2oYeChOs/ivkmz7rEqubEG/LRruleOCSXkOpobq1GfQ9EJsRT993uZWzzEGsjWMAcvIWs
	UPtKiZRb0NdX4+B7QHMZG5rKjgk0YKqdeNdsWAo1l5X8XL9kUo4ogQyvxwcZOvXnk/TqztxAlxt
	djQxSE0ErtLTLCE6aKI9Az9Y9Rl1iqxZLkE3YXB2T7ffS98rC+JHNLDPwVA7Erp1mnrkSYrdl0g
	JUd3KenILBwHqHvF8rtr9ZYsrcC4uFBqzYlWN68B/0sU8CHAtcRdux0mMcosohE/KT0Y2JhefQk
	ICZQNcQ0sYJaBDa6J05PY4AA7Q2/cvKeHgjF0JZixHlASOhxyzegWl5Q6EOQtVFFt91xLcc+80h
	BxjWWu86lyJ3hfX89qUbb6lwtJAqIjFLc=
X-Received: by 2002:a17:903:3b8e:b0:2ba:7617:a755 with SMTP id d9443c01a7336-2bcfd48ace8mr55972255ad.25.1778622022203;
        Tue, 12 May 2026 14:40:22 -0700 (PDT)
Received: from mincom1 ([27.232.220.10])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d409eesm143949895ad.32.2026.05.12.14.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 14:40:21 -0700 (PDT)
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
Subject: [PATCH v5 0/2] AMD Promontory 21 xHCI temperature sensor support
Date: Wed, 13 May 2026 06:39:08 +0900
Message-ID: <20260512213910.871859-1-hurryman2212@gmail.com>
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

Changes in v5:
- Add support for AMD 1022:43fc PROM21 xHCI controllers and document the
  new PCI ID.
- Make USB_XHCI_PCI_PROM21 depend on X86 and default to USB_XHCI_PCI.
- Keep the PROM21 PCI glue built-in-only when enabled, while allowing the
  hwmon sensor driver to be built as a separate module.
- Move PROM21 xHCI PCI device IDs to xhci-pci.h so xhci-pci.c and
  xhci-pci-prom21.c use shared definitions.
- Pass the parent PCI device, MMIO base, and resource length to the hwmon
  driver through platform data defined in a common header, instead of
  inspecting the parent driver's drvdata from the hwmon driver.
- Remove the private hwmon mutex and rely on hwmon core serialization for
  this driver's callbacks.
- Clarify that the driver only serializes its own hwmon callbacks and does
  not synchronize with firmware, SMM, ACPI AML, or other possible users of
  the PROM21 vendor index/data register pair.
- Use readb() for the temperature data register, validate the value before
  writing the output pointer, and drop the 0xff invalid-value check.
- Use pm_runtime_put() after successful reads with the parent device active
  so the PM core can re-evaluate the parent device's idle state.
- Simplify the documentation and use more precise terminology for the
  supported device.

Jihong Min (2):
  usb: xhci-pci: add AMD Promontory 21 PCI glue
  hwmon: add AMD Promontory 21 xHCI temperature sensor support

 Documentation/hwmon/index.rst                 |   1 +
 Documentation/hwmon/prom21-xhci.rst           | 101 ++++++++
 drivers/hwmon/Kconfig                         |  10 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/prom21-xhci.c                   | 238 ++++++++++++++++++
 drivers/usb/host/Kconfig                      |  20 ++
 drivers/usb/host/Makefile                     |   1 +
 drivers/usb/host/xhci-pci-prom21.c            | 123 +++++++++
 drivers/usb/host/xhci-pci.c                   |  11 +
 drivers/usb/host/xhci-pci.h                   |   3 +
 include/linux/platform_data/usb-xhci-prom21.h |  22 ++
 11 files changed, 531 insertions(+)
 create mode 100644 Documentation/hwmon/prom21-xhci.rst
 create mode 100644 drivers/hwmon/prom21-xhci.c
 create mode 100644 drivers/usb/host/xhci-pci-prom21.c
 create mode 100644 include/linux/platform_data/usb-xhci-prom21.h

-- 
2.53.0
