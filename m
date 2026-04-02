Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B68286D60
	for <linux-doc@vger.kernel.org>; Thu,  2 Apr 2026 01:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775095183; cv=none; b=rW49gWcuUd8Y1jbSCB+CBkHP/Omlcl6fMVUGyDC3HnjzdbHDKkx7DEs3i9gFKNwrIoFaruAHgAnRPaOfnPCNDxm0XZvupvKQ+T2BuUftaNRH22+pMf7g4lxHDCuehNgFPGfanuzq8ObHAr/AZaRcQCt59YVM58Us0kNcu12cGjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775095183; c=relaxed/simple;
	bh=kcPnsTkVz2WYNUw/b9zWUBkXiGoXKHbUTwQqyAL67tk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ALSnSoPBQmnQfQAPZoyM1TDVvHQ90FTAc7GpiX3Jhz+upjfhtEjsnrpgdbUwTNsP4KG3iMFx8fl0z6jciUw4FXI41kFEN9mJ/HTSiIcBy7+yFGE+h170ZN4/D2ApwHgsCYSyd4yz5XLOV7EQy+c3eWht3pM55jweVh6JYAD7XVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jOMRqdZO; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jOMRqdZO"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-358ed696623so127347a91.0
        for <linux-doc@vger.kernel.org>; Wed, 01 Apr 2026 18:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1775095181; x=1775699981; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4ZZBOmbN88NnDw+y/lllm24+YGKBJyhW9R/ma9g+/uA=;
        b=jOMRqdZOfhlcTBmWirxOVgRvwy2+uEhOffK9BC45/jbrVw2OwNN9KbrdyXaw2mLxgf
         Hr4VOnxjyD6HgWRho1Mr+FUyrdKLvTE6krOmnz9bx8ElyXx4/JTXHSkE4GJVR54rHYg4
         nfTpXqAPY3db//4dsOVs6LDp+Z6fsmZ1q+X2I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775095181; x=1775699981;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ZZBOmbN88NnDw+y/lllm24+YGKBJyhW9R/ma9g+/uA=;
        b=FIcBCPRXJCYJxVE9O37yAeP/vQLIWKr43tuU5sBW/9ME3pgPHFBxMaFBx3qEv6wKL2
         26r7cn9qjs7g4hGfl9kYLCVJJw1W1a+9Rvw9jmLPFAyYetYnZCGeNIWGVecePRfePmNl
         tBKVyuwBvuGT5cPq6zDQ9V9saam4WdNk67rc+7slcBT8gjcDGs0GU1Vdj9aHfngm92ZK
         T3iR+l4EMwXn2Mhdh8cO1XSOC1Gw5SClCp8eOJ62wWySqYyYK2EmKrRFB9u1UTH8tbWg
         TwiNPrBHR4vAarkVo+KIMiD0g5YBZRnV3dmM8UKPJQaTnMsoqKVx1b1Tgl2NRbATvN0T
         0DSA==
X-Forwarded-Encrypted: i=1; AJvYcCXhQ4pbzhEhRdnVWBADQCD7lZ8aZZSwaSHb0O0mIgK1ndX7QSBFY4aLsdWjM4fHjM6DKOOoizMESho=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEISPD9RGjT4hnFcK+B9nWUCBSJkPkkgQgulzZAZoGuRXuEUfR
	Z221xSQ0rwMt9RgmEwt/EU32wHMtF6d3weK96zYQYgcrVpRNvsRarmZKdr83M3YUgA==
X-Gm-Gg: ATEYQzzy9/2gYy0Ac2CH6U3g8hCfMiBdv4zE7QsWjdfxzTIPPDaDuC8Tx1LailwK15U
	t51N0Ww+Qgt+jjMDSnlosKsIpgzAF6G+faE7ML+g+OmZtEg+ipPMce4a/W770Y6MbOUDB3GpTWO
	g72vnZOxTV55tZMJqXz+dhfjE6hYzCTgKdhC0urB4IAIo/t4zq6fKq7t2qbAbMOQvHj8Ce2btGI
	RarsUCaxmcDNyik53c8P156rgl4KwFyCB9jvskD6P1P6X1OLHrKHdKM4FE99R0khE9/eMeEREll
	M3Ct5zLdBAMdgGh78APIWmZtW4je9q+ErGV6RNihZdLFCqq/5wRi2G1nFOLpw66Q6ciSIbzFend
	ufEjmtMoWaUdgVYj3vuHH+/SoBRE23g4Puz3UemSBFMPDznmZ016PNDD/Jedq6HM64cES/OqqBx
	yK9Sfhe0+0+zR+epURQuXD9oco+tNyP+LspQzmULDlwNveLU5eanUOZpoyk5nK9o2UPwDM9wVCe
	fRfInlPjRdYHjg+em2qf6iA6jLxsKBy0w==
X-Received: by 2002:a17:903:249:b0:2b0:62dd:3a93 with SMTP id d9443c01a7336-2b269ab2df0mr53061155ad.7.1775095181083;
        Wed, 01 Apr 2026 18:59:41 -0700 (PDT)
Received: from jingyliang-input-linux.c.googlers.com (111.169.168.34.bc.googleusercontent.com. [34.168.169.111])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27478cb4fsm11187535ad.29.2026.04.01.18.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 18:59:40 -0700 (PDT)
From: Jingyuan Liang <jingyliang@chromium.org>
Subject: [PATCH v3 00/11] Add spi-hid transport driver
Date: Thu, 02 Apr 2026 01:59:37 +0000
Message-Id: <20260402-send-upstream-v3-0-6091c458d357@chromium.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAInNzWkC/13MQQ6CMBCF4auQrq3pTC2CK+9hXFQ6hS6gpIVGQ
 7i7BTeG5f+S9y0sUnAU2a1YWKDkovNDDnkqWNPpoSXuTG6GAkuBgDzSYPg8ximQ7vlV2dKamky
 NxPJnDGTde/cez9ydi5MPn51PsK0/SQp5kBJwwUGBemmEykpzb7rgezf3Zx9atmEJ/wC8HAHMg
 EJoqNLW2qo8AOu6fgGYi/yK7gAAAA==
X-Change-ID: 20260212-send-upstream-75f6fd9ed92e
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Mark Brown <broonie@kernel.org>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-input@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 hbarnor@chromium.org, tfiga@chromium.org, 
 Jingyuan Liang <jingyliang@chromium.org>, 
 Jarrett Schultz <jaschultz@microsoft.com>, 
 Dmitry Antipov <dmanti@microsoft.com>, Angela Czubak <acz@semihalf.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775095180; l=3676;
 i=jingyliang@chromium.org; s=20260213; h=from:subject:message-id;
 bh=kcPnsTkVz2WYNUw/b9zWUBkXiGoXKHbUTwQqyAL67tk=;
 b=Qeo/YrMVCst9P9/JIc83OYLI11nlSbg56ENkIlVZeiA5Pw4580P+tfcbEciDAxrT+lFTtV3/O
 k0ptUq2PwHQDhCJMyeQ7xQcAKm5BCQ7LPArLr2qTsbetYPbvpAg4Ymx
X-Developer-Key: i=jingyliang@chromium.org; a=ed25519;
 pk=VTYSdqslTtYOjWWoIGgYoWupGWqNSidrggReKMgfPo4=

This series picks up the spi-hid driver work originally started by
Microsoft. The patch breakdown has been modified and the implementation
has been refactored to address upstream feedback and testing issues. We
are submitting this as a new series while keeping the original sign-off
chain to reflect the history.

Same as the original series, there is a change to HID documentation, some
HID core changes to support a SPI device, the SPI HID transport driver,
and HID over SPI Device Tree binding. We have added the HID over SPI ACPI
support, power management, panel follower, and quirks for Ilitek touch
controllers.

Original authors: Jarrett Schultz <jaschultz@microsoft.com>,
		  Dmitry Antipov <dmanti@microsoft.com>
Link: https://lore.kernel.org/r/86b63b7b-afda-d7f4-7bfa-175085d5a8ef@gmail.com

Signed-off-by: Jingyuan Liang <jingyliang@chromium.org>
---
Changes in v3:
- Add io_lock init
- Relocate tracepoints to drivers/hid/spi-hid/ and fix tracepoint macros
- Add tracepoints for sync, error handling, reset, and report processing
- Clean up internal includes and fix Makefile CFLAGS
- Add more details in v2 changelog
- Link to v2: https://lore.kernel.org/r/20260324-send-upstream-v2-0-521ce8afff86@chromium.org

Changes in v2:
- Clean up DT bindings: fix formatting and remove timing and flags properties
- Update DT binding example: use a device-specific compatible and drop
  reset_assert
- Simplify ACPI/OF match tables by removing ACPI_PTR/of_match_ptr
- Refactor OF driver to use match data for timing parameters instead
  of DT properties
- Switch to fsleep() for delays in ACPI and OF drivers
- Drop patch 12 as it is vendor specific
- Add a lock to fix input/output concurrency race
- Link to v1: https://lore.kernel.org/r/20260303-send-upstream-v1-0-1515ba218f3d@chromium.org

---
Angela Czubak (2):
      HID: spi-hid: add transport driver skeleton for HID over SPI bus
      HID: spi_hid: add ACPI support for SPI over HID

Jarrett Schultz (3):
      Documentation: Correction in HID output_report callback description.
      HID: Add BUS_SPI support and define HID_SPI_DEVICE macro
      HID: spi_hid: add device tree support for SPI over HID

Jingyuan Liang (6):
      HID: spi-hid: add spi-hid driver HID layer
      HID: spi-hid: add HID SPI protocol implementation
      HID: spi_hid: add spi_hid traces
      dt-bindings: input: Document hid-over-spi DT schema
      HID: spi-hid: add power management implementation
      HID: spi-hid: add panel follower support

 .../devicetree/bindings/input/hid-over-spi.yaml    |  126 ++
 Documentation/hid/hid-transport.rst                |    4 +-
 drivers/hid/Kconfig                                |    2 +
 drivers/hid/Makefile                               |    2 +
 drivers/hid/hid-core.c                             |    3 +
 drivers/hid/spi-hid/Kconfig                        |   45 +
 drivers/hid/spi-hid/Makefile                       |   12 +
 drivers/hid/spi-hid/spi-hid-acpi.c                 |  254 ++++
 drivers/hid/spi-hid/spi-hid-core.c                 | 1456 ++++++++++++++++++++
 drivers/hid/spi-hid/spi-hid-core.h                 |   98 ++
 drivers/hid/spi-hid/spi-hid-of.c                   |  244 ++++
 drivers/hid/spi-hid/spi-hid-trace.h                |  169 +++
 drivers/hid/spi-hid/spi-hid.h                      |   46 +
 include/linux/hid.h                                |    2 +
 14 files changed, 2461 insertions(+), 2 deletions(-)
---
base-commit: 05f7e89ab9731565d8a62e3b5d1ec206485eeb0b
change-id: 20260212-send-upstream-75f6fd9ed92e

Best regards,
-- 
Jingyuan Liang <jingyliang@chromium.org>

