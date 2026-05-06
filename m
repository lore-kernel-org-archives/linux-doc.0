Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7BF347516
	for <linux-doc@vger.kernel.org>; Wed,  6 May 2026 20:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778100052; cv=none; b=PhHnqA5I5OMb3zHq2OVRhETq5PTCLtx05S5dem9cMKMZzYtw0lho4hEBfyuknReevH+XhTQyFTv7XCnIWxmrS/zfwFAXBqPV510tZUdvO713959CVm6A/uZd63QQncxl+YZSp8cbkExw/jQwWGjYeDVkTIaSfFAvOY0yWlP6JEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778100052; c=relaxed/simple;
	bh=N1utPvEcBUC2CgJY2X87EWrYwsuzry0dWKDcX8h66DA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k4HEoHdoEy+HHSJw1sNSWSWUHsjpv53Uljj80FqpDfW57gHt5RdDhd+P2PHYDBu7nZaXr7lg+c9k6VENdW1mi708TlXMPG2ZVa2R++e6izrIMZSq1/5tZJxv2aEweFAZoFDODdK/EG0Uh3DM4vhs8k8cAkW5aEfXp/u3wkAiDM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BIMjQzpe; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BIMjQzpe"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8353fd1cb5fso47263b3a.0
        for <linux-doc@vger.kernel.org>; Wed, 06 May 2026 13:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778100050; x=1778704850; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ab/JEpZ7Fi0qyubDO84DlmrRRJltgbTbtMwqDlljXhg=;
        b=BIMjQzpeeyTopXwFqVsgfksLN2mbJuj1WTDU/RFyIVutzwgeTPvFdDxpkZC6COUobT
         Pva7KSrREIRVb5dPNEdZcuR+ZPGfAEj+TuQc+ssBZT4i1jzCxvhF9GKorY5ADvzXLo4H
         QNG4VH6NadZ2M3fbjI7+sqYdYjhfjGapfRKUSSgJ7hMaV54a9foMIggYjV9km/0hr+Hf
         cWpVabCDnYuqdjsXTgNWX6sUzYqz43gXD3mGX53BIxw4LbbEQxXXfbHBI0BKxHmDxeab
         ZWzPPZZH84U7SGlgv8lH6jwiHj237nFbrIo5mIqU5+iAO4c//z63PkM+Jw3prRWKYTKK
         yetg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778100050; x=1778704850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ab/JEpZ7Fi0qyubDO84DlmrRRJltgbTbtMwqDlljXhg=;
        b=UlyOtG7y0/0RAEfF5kA9doSACzlz1yAjhbQUu5MROgUA+P5waZIrcWWLxsJqnd9bTj
         UveEE7B+6zIbJNF+eJxvDjfXTdxH/RuSTN1pdo6hwIGseErTKDLRFShYzf2swj0RPO89
         bYX4fnYG/cJbDDjpvyui4t8pS6g5bezPTnLxvo4v6sB1LtroBeQtJgYOgohSi6J3CCM3
         pvuKz+l7LW/GSljptqiFQMORbTd6rWX86IbcOQ8CYChfcBRxJoEWJt3Mklm6Oyv40lIN
         Bxc/j4stcbQvBNUFiFO4Q/O+2LWsNlZKwTY/ZGMfsMOvCtr57EQYCionWbBuP1f7qkvx
         gDAQ==
X-Forwarded-Encrypted: i=1; AFNElJ8ivtx7NgcW+NIFe+dHgyC6DevxWepys2UF6QXp8X7PL0wxt2cEy+nk/gEyOsQzf/B2rg49HtOqfnQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkkQkJlZx4RRE+wY74VmpL/6HbrCenc0/kW000QedLzMOet+Cm
	gy4Lp3Pcjf0HyU0fknN+2LMGhcUmNBYcL+gT0SdaZFoQ3FI+Lo9Z2IEs
X-Gm-Gg: AeBDieuNiBIIvVAVlIT5iiO10N/YR7Zqo6x/z3BaU1iXAkMOGpnAxd//sKBXrg//uGq
	o1rqAlFJpKv5G7R7/+3ziIgKGORUfkaaxZUm9vyJd8gVzVVld0L9X8bHXY1wba1Ypxf7NaxDbhq
	EAeOJ6IC3QuaQl7msDYiVVk2Q7tZJk9a8g+FELANnp8jwk+AuHYxYMfHsGbPqBceXxm26c7KNVW
	VXgPJnnViL5FAh56nOOj/hReZ3J9angbBl43+rZ6Dh68r09WCiWayJepTozxFsxON7FRc9zXDkF
	qgNGSfeEGnJIdjVVUakfKaHKVASWFvBfj16tYlyw9ES/H7U0X+pgS7iAgepehg8PGzkOqS4Fu/a
	gz6r9s7EAj0Xr7DeU2VQpgtTDH9g+pDylU9IHTLlpfKFLRHDdeth8IF+qwhFppDP8do1w8oEqdX
	9DzZHltnwKQAUFAFQKHFKW4CwE8zS6LJE=
X-Received: by 2002:a05:6a00:3989:b0:837:d331:8700 with SMTP id d2e1a72fcca58-83bb65f40b2mr96595b3a.1.1778100050268;
        Wed, 06 May 2026 13:40:50 -0700 (PDT)
Received: from mincom1 ([14.67.155.79])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8396563f11csm7952185b3a.3.2026.05.06.13.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 13:40:49 -0700 (PDT)
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
Subject: [PATCH v2 0/2] AMD PROM21 xHCI temperature hwmon support
Date: Thu,  7 May 2026 05:40:32 +0900
Message-ID: <cover.1778099627.git.hurryman2212@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260506032939.92351-1-hurryman2212@gmail.com>
References: <20260506032939.92351-1-hurryman2212@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This series adds hwmon support for the temperature sensor exposed by AMD
PROM21 xHCI controllers. The temperature value is read through a
vendor-specific index/data register pair in the xHCI PCI MMIO BAR.

v1 implemented this directly under drivers/usb/host. Based on review
feedback, v2 splits the support into a generic xhci-pci auxiliary-device
interface and a standalone hwmon driver under drivers/hwmon. xhci-pci
creates the auxiliary child only for PCI IDs matched by its internal table,
currently only AMD 1022:43fd, and the hwmon driver binds to that child
through the auxiliary bus.

The PROM21 hwmon driver registers the hwmon device under the parent PCI
function so userspace reports it as a PCI adapter. The auxiliary driver
still owns the lifetime and unregisters the hwmon device before xhci-pci
tears down the HCD.

I tested register access while the parent xHCI PCI function was suspended.
The temperature register did not return a valid value without
runtime-resuming the device. v2 therefore keeps the default behavior of
allowing a temperature read to wake the xHCI PCI device, and adds
allow_pm_switch=N for users who prefer reads not to wake the device. In
that mode a read returns -EAGAIN while the device is suspended.

Changes in v2:
- split the original single patch into a two-patch series
- add a generic xhci-pci auxiliary-device interface
- move PROM21 hwmon support to drivers/hwmon as an auxiliary driver
- avoid linking hwmon-specific code into xhci-hcd
- add Documentation/hwmon/prom21-hwmon.rst
- document register offsets, conversion formula, sysfs attributes, and
  allow_pm_switch behavior

Sincerely,
Jihong Min

Jihong Min (2):
  usb: xhci-pci: add generic auxiliary device interface
  hwmon: add initial support for AMD PROM21 xHCI temperature sensor

 Documentation/hwmon/index.rst        |   1 +
 Documentation/hwmon/prom21-hwmon.rst |  84 ++++++++
 drivers/hwmon/Kconfig                |  11 +
 drivers/hwmon/Makefile               |   1 +
 drivers/hwmon/prom21-hwmon.c         | 300 +++++++++++++++++++++++++++
 drivers/usb/host/Kconfig             |  10 +
 drivers/usb/host/xhci-pci.c          | 114 ++++++++++
 7 files changed, 521 insertions(+)
 create mode 100644 Documentation/hwmon/prom21-hwmon.rst
 create mode 100644 drivers/hwmon/prom21-hwmon.c

-- 
2.53.0
