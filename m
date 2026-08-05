Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC9B73B2FFE
	for <linux-doc@vger.kernel.org>; Wed,  5 Aug 2026 09:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785920652; cv=none; b=gBNNjo+U53LScBeBgRuHK/ewLlpc1ZYt/DGikdvC9SMQIzK5xXr/0SA5zPy21D/3PAOLVPjeEzpZlL1aehfUtTCTmhTEhZ5CuKsjYmzVE6+2qCAk5aVLkV419+V2KYuH264ET3FahoePaPQecmCZf2IFh4w35Heh1Zqv0po0xFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785920652; c=relaxed/simple;
	bh=BrPSZgHrp26DXRe+wCiZ1hWOkSPTszZwjRSrkVF+IJA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KOV3Sh0GT2s4gqHCTd6xGH7OCYNFnQehb5fcr+qJrOaXs3x0JmztJrCQFIDlJYliKsqsF7fle+Lxh3O61QWHb3ucLZcXlLH/3f6gwfYPaUFu9J3/X1iMKtXAbJy/Ars9ZiftPJsICHnoRSeFOttZcAH31biEWJzBUlBT/5hu6xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=SZgpHfR1; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="SZgpHfR1"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49553515a8bso10234075e9.1
        for <linux-doc@vger.kernel.org>; Wed, 05 Aug 2026 02:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785920646; x=1786525446; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FDJsuYD5gYv2hkvet8UFFexByKmS2paW12lnOAiNWD4=;
        b=SZgpHfR123SoFVtHAhzgPJXJY+ipPwWD5hmMDDv+bFAj8Dhel1uiCZll5rdBtMq73+
         Y1ugouI5y8rGVbLP+QjGMHf/jbYgnR+WT4TR4BEETvHJUgsTJ+9pevI2VtRbb/2CEwAi
         sAGNnyXAJXyHsO8CrDI7fj+bP/oszU1KOj/MnRsUOX7aTYC8x2X/MNhy6SB/Y3WOIrY1
         7swhoaKt7yscz+vAYKBJ/CjXVhMoERMfQ57/43L0Ef2VkBw0H5RMW0t0EtDL8zV2PFtP
         HBEeaij5Oig87C9Jq0BdtHX7O9PLsYAn8LKY0DGWaF/qytdssZAvgoLfq3ihwUCLSgJx
         Kx2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785920646; x=1786525446;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FDJsuYD5gYv2hkvet8UFFexByKmS2paW12lnOAiNWD4=;
        b=GH/nZMfvdTh+Nk3rp8oszC/SkeOX+f2p1oBQ/fYwTf8yNsCpUvy97iicsk3R8snfsD
         OMPEiSneGJ6Qj7wQfwYvxYS6WI86SkYFp4DPTIubeKirQfU3dQ+e4FeOS9Q7tQ6KG5lp
         BqIEs8XbLKSmO3sUgvGdwesCUebUR0dFMYc5jsEIdBdxMdj00mBopBp7wNN3Su+2okFC
         VFel/Tb0ejHsLNPiA97TpZ+9Ik7dCrBYj7C8a0SGC53enbNVnQD/5wDCBJcdyT5ZNwI6
         JrmCxIw+T86SZETmsHq7Uw9gFsGPkU87BJgjoX62au4alBAdgFnUS0ZDCNfiz4DbmfUR
         uLPg==
X-Forwarded-Encrypted: i=1; AHgh+Rraw8hckMmujMRmYTGQ9WPtMgddFmCK+OtbAW/jJFmapeFB49cRcHQqydD7tKKhPb6/OLPvMRUjH+I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEGzCK2MuA/EWsynBE2V/Bgiw2FJNJTprLAUcLERzI/h8tmFqI
	Td7AuFzC3ivhJVYAwxFbhuPyG+hxy9agtSINf3aZ6ZnDeYzraP2OctN9XmVDKiIdYkap1fdD1sL
	6WSCkFhY=
X-Gm-Gg: AR+sD10b0yX7gqwttb6AzPr469mawkfVKdwnZytK3cp76wPhutmcnm2DpKFFI8047RD
	TZUXvbfbWzlZUrnbi0EZo3z+Pkxlim+6QD+8PxQIKTwTAT41a2/NrfqdXA6AT+kbNdNphkVfdJY
	Veswu+YLkjab6LdPHst4GiX6hbWZ56vqEIO2EOl+44aT1eGz2RnWdWFA/HpIqm7B7ZZLYlq9OL+
	yLYnrUmf052hwX0B3LUa+hdKrZe+J5s17DHik/U3vPG2jfkoWO7BgELTcZ3FwdM7O0gRuZdz4Z/
	z847RgMDEW1bD5uIyrsh0MKs1Xo56uwhLSJKwxspLI233DPqjVyRXzdqz6ZX9rUbMzampTs6n1K
	9qKXZ62BM9rop9gYhwE+9IyccoFd/x5oiPNm6ltZmao84p8BwtP6BzWERHnAzKUl4b34jOwwiRh
	WMzj3fFcHEsF+PxTiRt7hQgs91LxX5UgpaRfHJFksojvG2gpia6OPLB19ZPPqd+bT31Fw8kGNJW
	8JHgs1PGQ6e5+UCROQvB50vsATHFNy7aUxiMuryoT7Z11F61EJRfpAQKynedav+ji8PfJ3Crish
	+jg3BmfctgrvAZnwlyer5DQQ2gtWNaNhgQCIPF2f
X-Received: by 2002:a05:600c:6298:b0:499:484a:7644 with SMTP id 5b1f17b1804b1-4994e7cca25mr49897635e9.9.1785920646111;
        Wed, 05 Aug 2026 02:04:06 -0700 (PDT)
Received: from silence.. ([46.10.240.40])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4994e99319bsm34082105e9.3.2026.08.05.02.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 02:04:05 -0700 (PDT)
From: Stoyan Bogdanov <sbogdanov@baylibre.com>
To: jbrunet@baylibre.com,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stoyan Bogdanov <sbogdanov@baylibre.com>
Subject: [PATCH v6 0/3] Rework TPS25990 direct conversions and add TPS1689 support
Date: Wed,  5 Aug 2026 12:03:54 +0300
Message-ID: <20260805090400.2059006-1-sbogdanov@baylibre.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series reworks the TPS25990 PMBus driver and adds TPS1689 support.
Both devices share most internal functionality, differing mainly in
supported voltage and current operating ranges.

Link to V5 at [3]

v6:
- Remove special-case conditioning for IIN_OCF so both TPS25990 and
  TPS1689 use the same logic.
- Add scaling for TPS1689 VIN_OV_FAULT according to the datasheet
  VIN_OV_FLT table, keep the existing behavior for TPS25990.
- Fix incorrect PMBus Direct format conversion coefficients (m, b, R)
  for TPS1689 PSC_VOLTAGE_IN in struct pmbus_driver_info.
- Add missing PMBUS_HAVE_IOUT flag in pmbus_driver_info .func for TPS1689
- Restore the const qualifier on struct pmbus_driver_info, which was
  removed unintentionally.
- Update i2c_device_id to follow I2C subsystem coding style by using the
  .name and .driver_data initializers.

Link to V4 at [2]

v5:
- Simplify implementation and remove calculations from the driver, as
  they are not needed and were implemented incorrectly. Thanks Guenter
  for taking the time to explain.
- Drop pmbus API changes, as they are not actually needed.
- Add conditioning to separate TPS1689 and TPS25990 by chip_id in
  tps25990_read_word_data() and tps25990_write_word_data() for
  PMBUS_VIN_OV_FAULT_LIMIT and PMBUS_IIN_OC_FAULT_LIMIT. The TPS1689
  value is not 4-bit, so it does not need adjusting. Keep the current
  adjustment logic only for TPS25990.

Link to V3 at [1]

v4:
- Fix non-devicetree support as reported by Guenter Roeck
- Rework direct conversion handling to use exported PMBus core helpers
  instead of driver-local implementations
- Update dt-bindings commit message and ti,tps25990.yaml
- Clarify commit messages to better reflect the final implementation
- Add and export direct conversion helpers from pmbus_core
- Eliminate duplicated conversion code in the driver

V3:
- Fix error detected from kernel test bot regarding division

Tests:
- Test builds for x86_64, arm64, i386
- Retest driver on arm64
- Validate driver direct conversion functions manualy

V2:
- Fix error detected from kernel test bot
- Add Acked-by to dt-bindings commit
- Drop "support" from dt-bindings commit subject

[1] https://lore.kernel.org/all/20260217081203.1792025-1-sbogdanov@baylibre.com/
[2] https://lore.kernel.org/all/20260522082349.2749970-1-sbogdanov@baylibre.com/
[3] https://lore.kernel.org/all/20260728015857.193890-1-sbogdanov@baylibre.com/

Stoyan Bogdanov (3):
  hwmon: (pmbus/tps25990): Rework driver for multi-device support
  dt-bindings: hwmon: pmbus/tps25990: Add TPS1689
  hwmon: (pmbus/tps25990): Add TPS1689 support

 .../bindings/hwmon/pmbus/ti,tps25990.yaml     |   8 +-
 Documentation/hwmon/tps25990.rst              |  15 +-
 drivers/hwmon/pmbus/tps25990.c                | 227 +++++++++++++-----
 3 files changed, 181 insertions(+), 69 deletions(-)

-- 
2.43.0

