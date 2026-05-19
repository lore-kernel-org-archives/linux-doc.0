Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1582F84F
	for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 00:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779149270; cv=none; b=I7d3WuaWOESqI8oYa3C2+tvwe0djEpTGFX+uWaLXOQcIPwALHL0hy8Lb5ReMPiBjTWW3oAknlnZg1cERsewYS2VXj6+efTYQpu2BaBQUoKuxMG8rGdjhAw0PCdVoiCrCJTRzGg2X+ENImhmAXTc1OdqbqlQ8r5B/GKLMCQ+HHF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779149270; c=relaxed/simple;
	bh=Kiklfbf/mOtWhM3nzZ61qTH+SlUMKusCDgEcCZ/kXsA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GxjaaDlOa0hpWKPV2teeX+LU639Dzqw738BrSvNjEVL3xu+mf3Y/4kB7TJzUr3xmtQrH+ni4VWEf660ntz4L/d8M1rdKQLu6O+h3Ft0s78uOREFjdjLffHh/t4pi5uIw3xG+LzUpcolmX1eylCAOOwVjSqc6LRgB+zQf5CZnvvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VTKgYWsy; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VTKgYWsy"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ba4a1a0325so18627595ad.0
        for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 17:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779149269; x=1779754069; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZMisq1x8LSsDQmwweu++ThsrVVeqT8H4PNPNw49rVmw=;
        b=VTKgYWsyEcNjJnNzMND/nDwD74GG3fjp/gGHyxHxBsRW2PnA4wZ++eGb3NqLGWUQl5
         GfsUrpgHNwmnweki8ASoZkxqwc3lwEf7NkWiyykNE7vN7Bj2gMXkrOEcwZrZr5lMBtEE
         JkR/ubwSd0J++7Nn4gi5ZSfUloNn8/oG3pBquQblwGI5bGEnOIbX7uC/5pgbQmq9tyjr
         CttxRLUpnDS5JLG9FTSf1dGZXGANEhOWssU7WJXDzvtY/p3gjuWwDBuZsBJ1SwWKRdVT
         FPGALtkzI4l9x3xV6o1HYIq1OXr7+ScVh53poiWDQghrNlE8vGa2zn4kFAvLQx1aEWQe
         5rsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779149269; x=1779754069;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZMisq1x8LSsDQmwweu++ThsrVVeqT8H4PNPNw49rVmw=;
        b=DpYRKnvMx/w8X9cH7ZRjY3T8KdcpGlDaECwB8ft6EyVw+FmiExI0rD1iycHlFzKaHA
         x+FN2f5hii1JCpA5SeTIGNC/LkLzlxzNFKwlbfq3o8zG5nKVJN/9JsC1qIBgoWbhEmX/
         D7YZqhY5HF45KDzcQzAOQpdvjHk1W+G2uhvWBd/mlnXTQQoOgNdY2rQyjNxcHkSOJhVp
         ubOnmplHXodcOpWvfJxO8gSqn+6JmZGATTFiV8xVmpySFgwV8sJXRiV+KHsFQHM/O+i9
         4USR39T1pGyXgWZoOc5yomuIvVphrvLxL6lW8RkUOGfjOTRpQhCotrOqPU3yC9qolCIf
         JB8A==
X-Forwarded-Encrypted: i=1; AFNElJ+oloXIrsCtcVj/mWGczNFvRw6FtHXHFhi1HMQmWheCJPLnHQRDPY9HsVu2vCRhFInropm9XRYMSo0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZcJSBPrIbtB7IlER8/qfKnr+MgfnQ/NSawagHvpGR+EbV6+9z
	RMEScLRc7UMq6Qh6trV3hPhd6g7lsBNkRfGIXJybXuFUJEHTPgJkIoRH
X-Gm-Gg: Acq92OGAAkqDqtKgdA0+cASTCwf7ili05JXBaIB5aJaxYIcUCm3zW8uXzyiOQAAoYa1
	2JNdpiRp0eDbV+4tMsZgiAk11GVvhYxxfbUhhoxRqqvEwTxYK6Sox0VCP951sMSpDYLJzX0+l4/
	hPwLA+xUzZM+/uqWfEvhmUcnd1XtkhZ2IeFYHERFGHzvQYaTGSOMVyaO/N5wPi8XY4aP4C+EJ/1
	zhXqUvx/2Dr/sGk1u201t01GS+HyOdAory3QrcTEGN1fZyGSMUnL/LdMD3PlCvvvrzYT1zvN+Ik
	0Oj8UbZKRSBIK8eg7ZGlQqr/nSQ1e2KbMvgLQiem5w56e2pDpDJuq6p43/S3XgjufEgVOf5vZRe
	m+2JQq9rhgAm9eRdXhyCl6VE516onLE1oVicpm5M1Qfqks++6Ua4RQKbyIwLf1Fy1fKo+0jJJRP
	MWvfurp41o10qId92FDWBn3g==
X-Received: by 2002:a17:902:db06:b0:2b7:aba0:ac10 with SMTP id d9443c01a7336-2bd7e7bdd1cmr181280395ad.11.1779149268954;
        Mon, 18 May 2026 17:07:48 -0700 (PDT)
Received: from mincom1 ([119.214.48.64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bdc58575dfsm79021755ad.20.2026.05.18.17.07.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 17:07:48 -0700 (PDT)
From: Jihong Min <hurryman2212@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mathias Nyman <mathias.nyman@intel.com>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
	Michal Pecio <michal.pecio@gmail.com>,
	Mario Limonciello <superm1@kernel.org>,
	Yaroslav Isakov <yaroslav.isakov@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jihong Min <hurryman2212@gmail.com>
Subject: [PATCH v7 0/2] AMD Promontory 21 xHCI temperature sensor support
Date: Tue, 19 May 2026 09:07:30 +0900
Message-ID: <20260519000732.2334711-1-hurryman2212@gmail.com>
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

Changes in v7:
- Tie the hidden PROM21 PCI glue option to the user-visible
  SENSORS_PROM21_XHCI option instead of enabling it for all x86 builds.
- Drop an unnecessary NULL check after successful xhci_pci_common_probe().
- Use a goto-based cleanup path in prom21_xhci_create_auxdev().

Jihong Min (2):
  usb: xhci-pci: add AMD Promontory 21 PCI glue
  hwmon: add AMD Promontory 21 xHCI temperature sensor support

 Documentation/hwmon/index.rst                 |   1 +
 Documentation/hwmon/prom21-xhci.rst           | 101 ++++++++
 drivers/hwmon/Kconfig                         |  10 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/prom21-xhci.c                   | 239 ++++++++++++++++++
 drivers/usb/host/Kconfig                      |   6 +
 drivers/usb/host/Makefile                     |   1 +
 drivers/usb/host/xhci-pci-prom21.c            | 137 ++++++++++
 drivers/usb/host/xhci-pci.c                   |  11 +
 drivers/usb/host/xhci-pci.h                   |   3 +
 include/linux/platform_data/usb-xhci-prom21.h |  22 ++
 11 files changed, 532 insertions(+)
 create mode 100644 Documentation/hwmon/prom21-xhci.rst
 create mode 100644 drivers/hwmon/prom21-xhci.c
 create mode 100644 drivers/usb/host/xhci-pci-prom21.c
 create mode 100644 include/linux/platform_data/usb-xhci-prom21.h


base-commit: 4d3a2a466b8d68d852a1f3bbf11204b718428dc4
-- 
2.53.0
