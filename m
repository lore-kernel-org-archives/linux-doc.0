Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40CC3A75B2
	for <linux-doc@vger.kernel.org>; Fri, 22 May 2026 08:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779438252; cv=none; b=FS0DC+lZDn3KIoHKgRmVDDtHYEFRPvBMNtFEHtKbMagdnNAEVx727b2k65OZLrd9Suat7x5LbrugLstlaWMKZz1o/8/S4sQZmVRg1Bg8NzcuDDsu8rSdUM47bzPWEIO/zWj7rjyJb0L933xZVfZpX/C+Ux7rb+T22aAnbphIklg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779438252; c=relaxed/simple;
	bh=3q7Of61NRAonCCG64eOeQNKQfyhqKqxdG9RLjiPKTXM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AEsHR2JXHFx8D/nfKj0teZWV2/h7xS/WUeSxAXIi+809UXNlMhW1PcpROjpAj4tb35ODaK+Dmbpy1lTuvcYDNEzlBo9sFDeIfhpEgevqi6eMCzqvuugJMKs/1FAlJwb/rH7Kq8oBs5I9YK2mKGj/EaUnBdBbv/4r4CzkC3j5BXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=BHVo/xNt; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="BHVo/xNt"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-44a14580111so5382507f8f.0
        for <linux-doc@vger.kernel.org>; Fri, 22 May 2026 01:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779438247; x=1780043047; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0rOd1e3lZNhkcxa+BicVSQFmQVFgFvl+9kN36m8Y/6A=;
        b=BHVo/xNtTcMsYkytIFZqvOvCOqc6FOeuF9usdLM3/SS7TaSD6r66rVTV4isN4/C8/R
         A7jpg/24nHR7xqlYRJF0DwyUV17mc8TRwg/vRabI7UF8tes/MK0iwoiFSHzGFvCOgmcb
         9dSf3P9UhdZdYj+aLWgvdcLve5354JEs6v2OTbwc/IGBopjNxQ3txF+LYHrcS5E7nxM9
         c59EAnD7OCpSwgFlv/ILv+E+Eusyxk4dtGVYO6G5uox4Tl/z6o+yMw+hZHCEaW1e4Xoe
         HD9do4ASAHCfeU2dErqMOcbyBV8PMWn1nH4zTydJ9NuQ0vH1SpIlFtE27GuBL/42x3Wi
         JynQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779438247; x=1780043047;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0rOd1e3lZNhkcxa+BicVSQFmQVFgFvl+9kN36m8Y/6A=;
        b=gYPvbHZKDuSFDAqLNwfTDpLwGxnOxAg3+9XqGeNrOyGVffGG5c4Pt6wOtqJnEdP+bC
         7GJkI2PU/ZKpW+rk667VvxZ4ULe19aolnPLLix9JsmzBVktdkHkyq37KVFHZShOgCOI6
         C4aY90xOi/atKuRCvDX3PRP3suC+EUF1e6jOp54bQqWDYhnV2c7blFlE8Gjnj52opn3W
         ZbYoAe8rS6QVRcYaHd2BXFPofdNGR+SvKnSqwycMB0n7jWmNlNy8PHFzF3k7qBK9bPNS
         4reJHfjLKfxC/NkXTFumJiMvu2a1HzeNvErq+spsVgF8oxjC9JGHhxrk2lo1lDf+0Pwp
         8G3Q==
X-Forwarded-Encrypted: i=1; AFNElJ+5hC0lPSSd6mps7Dje5aMHQNu7WalW2Zft5oNSfHpQR16zt7iPup1XfQEU/NGiGPba7Mw96Wn5K7A=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJkJ+A3dkr1Lsj65FzPt+9rwqa53XafD2o/OukBdQ8mtLJHlUC
	vqQQ3EN8DgFZwGWZ78i47TUij4KgXeBSPh8lFc66JMbOTRy6BQKVnZ6Ul1QQqJCWCAY=
X-Gm-Gg: Acq92OFDzvd1SHF1dw8eXtGvs3rIGQBTA4jlh6sjclQP3YPcBel2Ilm/rqfuUwR7vcO
	Pfy+PsDMqqHKkNMgbAjisJWwujZsi5Xop1gGxUYCpHTeJJ1xkjo5zoooteaAM1tpVxgZvTC5YiF
	FGnAESCABqmIlCUoA8+nRngGC7LTnCwQ9GyS0ujOloX2OX+CG08utJ9dgCLdbvKh35tREQoGehA
	kNIJ7Lkao45eDmw/XSw+hB7pAX6xp90mR6rFvsBABRqug6PssOBfl0C94pLL72NP8/SMarqUpOJ
	ra5IXR4k0ZjWRmyK4Ntl1dNea9Wa9VMDwLMXDtSwdJelYaJvDFGvSsY55X1F9upuB7tna7rAoXu
	d/O+1fLlcsRdHv7NLF3U5WTj4KEQCbqF9iIuNroBFml4Xsvl6r1YgY4F/yXvodYAXVNtNjRyriR
	r6/sQnLz6ufHSfxZMSt41aJjyFU1DtFqs4AgtInEZWKjzzVBsamLNBuuz0bX87oCM2/QLzOi1xM
	OYzdMrVW8MhFjtxrhJnAA==
X-Received: by 2002:a05:6000:2888:b0:43d:7d6f:f529 with SMTP id ffacd0b85a97d-45eb38b796amr3607454f8f.31.1779438247244;
        Fri, 22 May 2026 01:24:07 -0700 (PDT)
Received: from silence.. ([46.10.240.40])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6c9f58dsm2398471f8f.5.2026.05.22.01.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 01:24:06 -0700 (PDT)
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
Subject: [PATCH v4 0/4] Rework TPS25990 direct conversions and add TPS1689 support
Date: Fri, 22 May 2026 11:23:35 +0300
Message-ID: <20260522082349.2749970-1-sbogdanov@baylibre.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series reworks the TPS25990 PMBus driver direct conversion
handling to provide a unified and maintainable approach for devices
using non-standard direct format conversions.

The existing TPS25990-specific conversion defines are replaced with a
generic parameter enumeration and conversion descriptor using the PMBus
direct format coefficients (m, b, R). A new local structure combines
pmbus_driver_info with direct conversion data, simplifying support
for related devices sharing the same conversion model.

To avoid duplicated conversion logic in drivers, this series also adds
and exports generic helper functions from the PMBus core:
pmbus_reg2data_direct_calc() and
pmbus_data2reg_direct_calc().

With the conversion handling generalized, support for TPS1689 is added
to the TPS25990 driver. Both devices share most internal functionality,
differing mainly in supported voltage and current operating ranges.

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

Stoyan Bogdanov (4):
  hwmon: (pmbus) Add and export direct conversion calculation helpers
  hwmon: (pmbus/tps25990): Rework TPS25990 direct conversion handling
  dt-bindings: hwmon: pmbus/tps25990: Add TPS1689
  hwmon: (pmbus/tps25990): Add TPS1689 support

 .../bindings/hwmon/pmbus/ti,tps25990.yaml     |   8 +-
 Documentation/hwmon/tps25990.rst              |  15 +-
 drivers/hwmon/pmbus/pmbus.h                   |   2 +
 drivers/hwmon/pmbus/pmbus_core.c              |  59 ++--
 drivers/hwmon/pmbus/tps25990.c                | 261 +++++++++++++-----
 5 files changed, 243 insertions(+), 102 deletions(-)

-- 
2.43.0

