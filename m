Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5FA628469F
	for <linux-doc@vger.kernel.org>; Mon, 20 Oct 2025 20:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760991447; cv=none; b=Ty8uz32igg4gptC2zsCMBQdrAPyTfL3MA+ajCfOqda3kxZHG33qTlq/6KBVAnqHMw03iwootxqxyrH1rSzvDudZp7151NXu8YNSWk6eGQKSAZbQTc45/OGW7Fj1wPy4mDuic9N7/z7ULD7SiaAdqt1rrPpYKUUwzyli+4jTozHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760991447; c=relaxed/simple;
	bh=eir2cELdE6ctxydT2A/YX9aeKQVEZfkkSYcoewgfQYE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OkBAuM/yFHSpx8zFPMDWKb8OvpyWx+urXuZezKC5HXllNIhK/dyexym5P1hK/FuWPjM3iJ8EniVNsExoze2/JJzDZ1DOhI8rJ24kbe585T3jU0FMHQu797ewaJloZOiJ8Mau79P/EHQj4CXlQm2MwTIye6i+5dB6zI0jG4HcxxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LI0FsbUI; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LI0FsbUI"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-77f5d497692so5837857b3a.1
        for <linux-doc@vger.kernel.org>; Mon, 20 Oct 2025 13:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760991445; x=1761596245; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PXI3yOz2/6xxfRvTcNICPRU7XaRQOsBCnm/A8qDs1ro=;
        b=LI0FsbUIR5lqNzvLvL+OOd10gNBZSSLWxu9VYAcR6XkDcw46yo652LUjRhZDbswG73
         /pigvx1tqZ3CGKTsMkULYPdO7keEBlIzOo+ax7OnhFjHeG50AuQvFKYVRZPL9pDxLX8V
         x7xUtKIu+gmagY+spPosHu8t0OjArHV4FFGQHPCnIaH7p8fnabOy+eHeT5ovMi5BXJUj
         ZT2fj+fCJJXSPahOZEWbxEb+zFocOZ2zNuJ4NHzKqH2QPXHAogHy8KkLumkkI64tNya6
         hCUIOD8vBe6Bzj0U3tAYmXgfSCrAtirIqL2hP0ge+J1HqI+mhR9k1zOAtNUcOBfPAA6a
         bLtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760991445; x=1761596245;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PXI3yOz2/6xxfRvTcNICPRU7XaRQOsBCnm/A8qDs1ro=;
        b=CuEI1q2enVajpbOWhJNj/T2K+1g3sSkehFarpSn+mBi0xCI6ZYFDVsltRSQ0Y6N25G
         Ix1FsfeJSzJn7fuWD+zGAzXK4Jfm397v6VWzsz6JUu7WD7dpnp2mQS9q32w5AvBpTJhZ
         ygSSsC90zAEsnIjQbum1mhxQzyVmSvEZIpCa2APOX6MOIgolgOhtTkCGnqpBMZAFKPEy
         9es6p47ZSfVu8iWfBSmgfartXN2ZanbP9pGRvRgqM9Vt49OOgZMUVNqpnMqBUoFZ6190
         Xf205bwA/tLK4BbwIyWHW9UwCyoXtUCJB5s7GRUmtandCbbrOxWEBrEFGI4Aac2KJTAf
         MJrw==
X-Forwarded-Encrypted: i=1; AJvYcCUM5um0rQj4WMI3TnQOIEv/6pL5Z+Yi45v04oUCTlN1ojFGY3cwFZ30lxCAdOAf2jQijU4MIfJV4yg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJR5Qf09rJ+MK50CehKg0ZVViR7lS74sPFKNB3NfdwmKGuidQW
	yV3c8SxthbTJNj8mM7IEFkc8qkh63YV8dbd/FAUJJN4JhNy83/05yzD2
X-Gm-Gg: ASbGncs2jzDVB7/gZ34vWTGGdBL+/ltveRm2Ks3E4Ifxr/BKNwW8Jj+m5eb7Cmbvauf
	ctrZ+VebQRyJtjVMnkJpMBMCexHh102Y3I/K7mRIVFBkAEvPkYhstIK+524eVNV7MgN5lRmfhCp
	uORFwUntARf5XlSH6KjKDbWJVajIQnhq1b5SFOFNHfisIPXnSmIXQ+5yJHbMJacMzFUJIvGye0T
	sSnIEg2+ahr9HfcW52daWfPeVMsP6YzKqJXbhaB+m91LLEXy7WEcFPKNktwkG6HkkiRPiJZirGn
	pnEsO3hYAoANiHF5UZhmCfChel3Mp8wK800RrU5jAb39cf7meQnQ51NWirBv5z22NtGJHDU/rsj
	6sU/XtKhZLi5/MSc3plmIKXrRVs1tW7SBbgSMz3FC2r40GB7UmMnjEv0W67doUXTAE2SJBuG3iX
	HdVIF7x+WeBpo=
X-Google-Smtp-Source: AGHT+IH2Vu7r+p87tUPq6VF6+nbRh0pDhjMUf60C3OqTCJquCWzcP76GusrxnipnDCr3SE1kNgrVqQ==
X-Received: by 2002:a05:6a00:2e1f:b0:78a:eff2:6c0 with SMTP id d2e1a72fcca58-7a220b1dd00mr16143036b3a.25.1760991444707;
        Mon, 20 Oct 2025 13:17:24 -0700 (PDT)
Received: from pop-os.. ([106.222.200.146])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a23010df83sm9104263b3a.59.2025.10.20.13.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 13:17:24 -0700 (PDT)
From: Aditya Dutt <duttaditya18@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Frank Zago <frank@zago.net>
Cc: Aditya Dutt <duttaditya18@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH 0/2] New driver for ams AS5600 Position Sensor
Date: Tue, 21 Oct 2025 01:46:51 +0530
Message-Id: <20251020201653.86181-1-duttaditya18@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds support for the ams AS5600 Position Sensor.

The AS5600 is a Hall-based rotary magnetic position sensor using
planar sensors that convert the magnetic field component perpendicular
to the surface of the chip into a voltage, or a numerical value
available through i2c.

The driver registers the chip as an IIO_ANGL device.
It also exposes the raw registers through debugfs for further configuration.

Datasheet: https://ams-osram.com/products/sensor-solutions/position-sensors/ams-as5600-position-sensor
Co-developed-by: Frank Zago <frank@zago.net> 
Signed-off-by: Frank Zago <frank@zago.net>
Signed-off-by: Aditya Dutt <duttaditya18@gmail.com>
---

This patch is based on the work done by Frank Zago:
v2: https://lore.kernel.org/all/20211225175353.4254-1-frank@zago.net/
v1: https://lore.kernel.org/all/20211216202651.120172-1-frank@zago.net/

I have done the changes suggested by Jonathan Cameron in the follow-ups.

I picked this up because there has been no progress on this since 2021 and
Frank Zago has previously stated he isn't trying to upstream his drivers:
https://lore.kernel.org/all/e052d872-6de2-42f4-8b36-d1e2f8359624@zago.net/

Currently, I have not added support for:
- OUT (PWM)
- PGO (GPIO used for OTP)
- DIR (GPIO used for clockwise/anti-clockwise detection)

I have tested this on a Beaglebone Black with as5600 support compiled as a
kernel module (m) as well as in-kernel (y).

changes since Frank Zago's v2:
- direct register access in debugfs is now raw register access without any
  mappings as suggested by Jonathan Cameron
- added device tree support and bindings
- in as5600_probe(), reading ZPOS and MPOS should be a word not a byte
- removed "Read then write" behavior in as5600_reg_access_write() since
  register access is now raw, reading and manipulating the correct bits and
  writing is now the duty of userspace.
- changed "Datasheet" links to the product page instead of the direct PDF
  since the PDF links are not stable


Aditya Dutt (2):
  dt-bindings: iio: position: Add ams AS5600 Position Sensor
  iio: position: Add support for ams AS5600 angle sensor

 .../bindings/iio/position/ams,as5600.yaml     |  42 ++
 Documentation/iio/as5600.rst                  |  84 ++++
 Documentation/iio/index.rst                   |   1 +
 MAINTAINERS                                   |   8 +
 drivers/iio/position/Kconfig                  |  10 +
 drivers/iio/position/Makefile                 |   1 +
 drivers/iio/position/as5600.c                 | 373 ++++++++++++++++++
 7 files changed, 519 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/position/ams,as5600.yaml
 create mode 100644 Documentation/iio/as5600.rst
 create mode 100644 drivers/iio/position/as5600.c

-- 
2.34.1

