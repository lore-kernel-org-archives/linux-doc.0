Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F237D2D8378
	for <linux-doc@vger.kernel.org>; Thu,  7 May 2026 03:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778124743; cv=none; b=H8oZ2e1fqqrdQ8eJSDjH6I+QABrOFyzSjHtDWWX6AVa2Db4S71ql5nOkFekqmpuxka3cr9FHpmDVQ9wQ/F5wQS1F4HrfENoh4686LllLQF8dlCtFMizXjAI5jqcbY5/69GExKUiY1KZTNA5vKCCT7BO7svnip0syIkXjWPDK2gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778124743; c=relaxed/simple;
	bh=GXflDZZtOj++0sRst0xKUH830AVIhbrLZYn/7oCG1YI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CJxdZaKvpgqMBvBWtmyl1mPH8aXZz7xt6dhPDSIncuJtB6hu8BOYi3lpd1np25tfVpJl76SHsnXQvFvkrpB8MSrPaRe7OHwub6rQMdWP/ke3QTSLv3GGxSciIAXtJBFZxx6+Ei2Y/ooggKIb0zqVYxdYQs8O74TnrrqF9R2F45w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=luqXzygQ; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="luqXzygQ"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-82fbf5d4dc2so218309b3a.1
        for <linux-doc@vger.kernel.org>; Wed, 06 May 2026 20:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778124741; x=1778729541; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/VhP1DpEaR3JO7WzlQe2Tdq2/A5+ePt/o60+NrBJM7o=;
        b=luqXzygQvDDqQO6JKgJeh8+erGDIEh/0uGuXD79oS+mm46+HPKEtLo/P0w8IkuSmY7
         5lvj1MAcNM8vKTH+km062J07QoupRDeHMcKE/U/yzoX7a0/6PuNlxpDV5j4bwNYiG+XE
         8ywAqTbAqDAffoI1K3ONp1PNHVzcIq7iIB9Jz8no2uRt0u+dzqcNiJx/4MN1SbJDxDFv
         7wiKoGphgQXlLh53TEdOAMnYmmRzFLB2ivVIJVHZB6FKAS3EYTb5JS32U/pc92kZrrxK
         Gmh2WVhf8sUuEOWEJ1bF98JLq8E3j9PhXlCRu025wU4WzQZpemAoX0SbI+FJks/dCUqf
         TJ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778124741; x=1778729541;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/VhP1DpEaR3JO7WzlQe2Tdq2/A5+ePt/o60+NrBJM7o=;
        b=IcYKev2lVLXF1smNAjZEyDFd0IyWQryMbuE87Fpd0vl4yXlzhNtXuA6jkLrCRKtp8f
         +x/fzCTU2ZI7LG1x09V0Sz7z7/4WQ9igh1V8bV5aH7Isjtjjcmj3KzuFEmDR+ZPxB0kS
         GtTOX2nbMHOfC96kvhSADBdQ5SmoyPMTSYqkG3unH1xVYEKT/yNumhUVxln9ktI+G80F
         mULiqYJeLdSvauxCdAsC+8r1zoKwBydOo0EdP/BycbxeCdNlP82g0lRht7FiwzjuXEmS
         AzUGx0i9crl2putHVBea4/ni9AH1DEvwFxeVSTV1aUYzsqIAFehOvpNgGpz5MnYCYKx4
         A91A==
X-Forwarded-Encrypted: i=1; AFNElJ9SBt7mqNEqwG7oDREdYk6yicHflYyDcg84AmZ+7ytFFYtyq+C8nS7sQWm/a72VlT3w6dZiieL3aM8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyExCVhsCqOG0BIvYn4tGCt8exRL2q/NBay0grr1cAybim1k3EL
	tu5Ryr6ahZaXLPSJ5walP4jhP1/8wN79ma2oZHYK0e2ynLflYmCgivIp
X-Gm-Gg: AeBDiet9HAtuQh1ol+yxR5NYkAbj/Oqmmq3djsh0q78exeV9Ic6KHy6Xnd7Q9FOVbMR
	A7Y30CLRyHIM3332uGOY8SsC4c+S0gJg363ZsUgNcWVhq2R3z3/Tdx+8V1no+dmrrcIdZ9SPFEf
	hHMXTtQzqklW1vH/yM5goTirxAkJSyI6ZQTofQaRY5yx71GxP/A33jD5yX8ju857okC5aJtWbQK
	6srEAjZcF2UPlDf3etK+E+ovQMAX5IrmDPI1IGn8lCA++J8ZXxtBdOSWW5K5RPKWVatM5vciGA8
	67XCfhyJVZNVi5pXRZMdtkq2FAUiBSrQmEeyU+MjNCkPTqmCx1BVsIdOzWVnS2Pd1F6Rg+zjZS1
	asUB1wDYgJspL9WdHMfVsqs/PcuoqcRypp+u2Z4qAn72izKFqFx7rDcs2vHS/kfrQgpRxkAkrHG
	1eCIuRD11DIZ0soZWVYABXDcjBpZOeD40=
X-Received: by 2002:a05:6a00:198c:b0:82c:b808:4c59 with SMTP id d2e1a72fcca58-83a5ea3fe9bmr5893529b3a.46.1778124741306;
        Wed, 06 May 2026 20:32:21 -0700 (PDT)
Received: from mincom1 ([14.67.155.79])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839682a103esm9171580b3a.51.2026.05.06.20.32.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 20:32:20 -0700 (PDT)
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
Subject: [PATCH v3 0/2] AMD Promontory 21 xHCI temperature hwmon support
Date: Thu,  7 May 2026 12:31:57 +0900
Message-ID: <cover.1778123510.git.hurryman2212@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This series adds hwmon support for the temperature sensor exposed by AMD
Promontory 21 (PROM21) xHCI controllers.

Patch 1 adds a small generic auxiliary-device registration path to xhci-pci
for selected xHCI PCI controllers.

Patch 2 adds the PROM21 hwmon driver. The driver binds through the
auxiliary bus, reads the PROM21 xHCI temperature value through the
controller MMIO BAR, and exposes it through hwmon.

Changes in v3:
- Use pci_match_id() with a plain struct pci_device_id table and
  PCI_DEVICE_DATA() for the auxiliary device name.
- Remove conditional compilation blocks from xhci-pci.c and guard the
  auxiliary add/remove call sites with IS_ENABLED().
- Use the full AMD Promontory 21 name in commit messages, Kconfig help
  text, and documentation.
- Document the PROM21 chipset IP relationship to AMD 6xx/8xx series
  chipsets.
- Change the default hwmon read behavior to not wake the xHCI PCI device.
  Return -EPERM when the device is suspended, matching the amdgpu
  precedent, and keep pm as an opt-in module parameter for runtime PM
  state changes during device memory access.
- Keep Documentation/hwmon/index.rst sorted.
- Small refactoring: remove the duplicate PROM21 PCI ID check from the
  hwmon driver and use the hwmon device name as the auxiliary device
  suffix.

v2:
https://lore.kernel.org/r/cover.1778099627.git.hurryman2212@gmail.com

v1:
https://lore.kernel.org/r/20260506032939.92351-1-hurryman2212@gmail.com

Jihong Min (2):
  usb: xhci-pci: add generic auxiliary device interface
  hwmon: add AMD Promontory 21 xHCI temperature sensor support

 Documentation/hwmon/index.rst        |   1 +
 Documentation/hwmon/prom21-hwmon.rst |  86 ++++++++
 drivers/hwmon/Kconfig                |  11 +
 drivers/hwmon/Makefile               |   1 +
 drivers/hwmon/prom21-hwmon.c         | 293 +++++++++++++++++++++++++++
 drivers/usb/host/Kconfig             |  10 +
 drivers/usb/host/xhci-pci.c          |  83 ++++++++
 7 files changed, 485 insertions(+)
 create mode 100644 Documentation/hwmon/prom21-hwmon.rst
 create mode 100644 drivers/hwmon/prom21-hwmon.c

-- 
2.53.0
