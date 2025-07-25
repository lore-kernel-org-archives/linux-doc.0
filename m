Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E570B18A6CF
	for <linux-doc@vger.kernel.org>; Fri, 25 Jul 2025 13:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753451403; cv=none; b=gm55qjlt+PdyIqNDOWNZmd3bhh5/aCRSpaV1zKv7Gl6e+Iwq8OI5k5T1elwKqsT64d2FsBZImMuCnvV71+usbPalcNX9IRkXugW/UNe0hN30/aYsjDZ0eMPZ/ZdusU3yjYFY5Me3pYvPS2vjHm0dd8C81VGmzoniKP4olayatYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753451403; c=relaxed/simple;
	bh=Sr50NcJXDS17kme4FzpL0Cqb3DQXZa/KOF9yp/4S9tM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SApfuo6QxljXNGv1nHNlgP+kcNoY4kalEGAhjWbhQO5PyOLsuOJtveWyj5528BfwgjdgCm8kA0bznmOJPG86BGhtUH3i/GVWBQzK9tQ1UCKdJ1t6McjVAXBDQnvTwkgoK/62gs7ag1WyPp1d1BQhFtQMoKHpDhKKilxdByhT1Rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=He2M7vyU; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="He2M7vyU"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2352b04c7c1so765225ad.3
        for <linux-doc@vger.kernel.org>; Fri, 25 Jul 2025 06:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753451401; x=1754056201; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YXMpnjUdG4Kw9ubj5TtD46UoMTtWbLtFnmHMligTI9c=;
        b=He2M7vyUJ+PdPk5IIOTXn+lt12JBu4RqjZXcbyrtHDps1BX1MVRtlxe6ysMWALnrEz
         WZhrg0D3/oeUDCuemJA3t9CMoguuMJ/tZDFmg158vNRymr2G2Cko1Q1KIRArUcqM2kLn
         BtfVq6mQbsLnSx+NE70hhffhbphlLO0r7f/47hoizkJfqET+enPcEjc2EUKs8psMz0fj
         xNZ9Xi8Na9MQ1V1zU/0crkx1W/v408OhxAsw69NmvJQIXsS+GWJFjwsCY58uWLTHWIVr
         6xV2NVa8+YSmdAvQSXGjaD/QYIdMTzpv00XEUJLpZbADteV99vfISMrZA2lv9CZShJd/
         co6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753451401; x=1754056201;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YXMpnjUdG4Kw9ubj5TtD46UoMTtWbLtFnmHMligTI9c=;
        b=hj0cjtHppb4wOeEi+rHJ7abJFg4lxOSYs3vdyclCMylx9zx/vRxGnnE7oNH59li5ID
         9sGBLgOGQ4ekgrrHevFo5QzZa6G+F23NQcN55/POK/c3vMOJGTzwLbsQJ8zXmZhqDS7N
         U0nuJPR0PfaNa8E0L+Bd0EWiAvokEooI/HGINTgn88agrHk45X1Aq2CTRFL5FMoRnAvc
         vWc42BuC5QGF4IJ8MAlEIm1jqvT+aIOEOHJVgNaAzxnSPNgPi7yhmCdDmUnyXQGUwQqO
         /bXtR0VikPQImfX54X6Kr+RLnab3DOLDnpmDgZ/5qHqqovctIcD2tJ30wxtFnaU2WaUb
         I9dQ==
X-Gm-Message-State: AOJu0YwJFCJTrW78ae/doFtvgX67JGr2hxV2SA/a4qd9fLIjX7jLMD2i
	+njlPdbzw88mR3P3g0KXLGdiXaagenbBbCwi5BRsebpoEVP8ZvD6VbmX
X-Gm-Gg: ASbGncsf6+3meAfpoe5L0oEY52geGhvanF4Fp58NoAhVkW1rPEIcuEe1ueAopTiNFIj
	N/K9VpFY9Z4EooF5wnZZKnna/6su1LgQR7N4IlZLSrdnlOyWIgwb+z+1vzcBwPFgJpwqQfVaR/L
	kwW7vubudzFkaclPPpB5KPv3uzyuN6PwAyBPmkO57SCLgOzSFGJBDjBQYdz0lRBKSpODndgXnkb
	cY9kDaz0EW9VQAJVOwnch9k3bQdedEqdqzZv4B4dzgkTPLJ++UcIl1goyH8qsB5uREnvPqB/8op
	7fOXagozetVKARgjMsG7q+mfg3pocCUW9EBY6/SDucsjCGCzgAIGVLo4MCjlX43oAA6ebqEcnpe
	ZJdsMdvXzMOIHtI8s9UHrFkjQOU9zXA==
X-Google-Smtp-Source: AGHT+IHe2wHoEDWeA2K0xii926CeSkBkqXuzndVLC83/VUS0MCi7b2T+8npnEF5p/dhu6WZbMIisrg==
X-Received: by 2002:a17:903:185:b0:23f:8bcc:e4fd with SMTP id d9443c01a7336-23fb3178ea6mr13927535ad.10.1753451400989;
        Fri, 25 Jul 2025 06:50:00 -0700 (PDT)
Received: from ranganath.. ([2406:7400:98:d071:5938:d7e3:9db4:a3eb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa48bc8c0sm37785085ad.100.2025.07.25.06.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 06:50:00 -0700 (PDT)
From: Ranganath V N <vnranganath.20@gmail.com>
To: corbet@lwn.net
Cc: linux-doc@vger.kernel.org,
	Ranganath V N <vnranganath.20@gmail.com>
Subject: [PATCH] Documentation: Fix minor typos
Date: Fri, 25 Jul 2025 19:19:40 +0530
Message-ID: <20250725134940.12106-1-vnranganath.20@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Corrected a few spelling errors and improved the phrasing

Signed-off-by: Ranganath V N <vnranganath.20@gmail.com>
---
 Documentation/arch/loongarch/irq-chip-model.rst | 4 ++--
 Documentation/arch/x86/cpuinfo.rst              | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/arch/loongarch/irq-chip-model.rst b/Documentation/arch/loongarch/irq-chip-model.rst
index a7ecce11e445..8f5c3345109e 100644
--- a/Documentation/arch/loongarch/irq-chip-model.rst
+++ b/Documentation/arch/loongarch/irq-chip-model.rst
@@ -139,13 +139,13 @@ Feature EXTIOI_HAS_INT_ENCODE is part of standard EIOINTC. If it is 1, it
 indicates that CPU Interrupt Pin selection can be normal method rather than
 bitmap method, so interrupt can be routed to IP0 - IP15.
 
-Feature EXTIOI_HAS_CPU_ENCODE is entension of V-EIOINTC. If it is 1, it
+Feature EXTIOI_HAS_CPU_ENCODE is extension of V-EIOINTC. If it is 1, it
 indicates that CPU selection can be normal method rather than bitmap method,
 so interrupt can be routed to CPU0 - CPU255.
 
 EXTIOI_VIRT_CONFIG
 ------------------
-This register is read-write register, for compatibility intterupt routed uses
+This register is read-write register, for compatibility interrupt routed uses
 the default method which is the same with standard EIOINTC. If the bit is set
 with 1, it indicated HW to use normal method rather than bitmap method.
 
diff --git a/Documentation/arch/x86/cpuinfo.rst b/Documentation/arch/x86/cpuinfo.rst
index dd8b7806944e..3d61b9d06f7b 100644
--- a/Documentation/arch/x86/cpuinfo.rst
+++ b/Documentation/arch/x86/cpuinfo.rst
@@ -11,7 +11,7 @@ The list of feature flags in /proc/cpuinfo is not complete and
 represents an ill-fated attempt from long time ago to put feature flags
 in an easy to find place for userspace.
 
-However, the amount of feature flags is growing by the CPU generation,
+However, the number of feature flags is growing with the CPU generation,
 leading to unparseable and unwieldy /proc/cpuinfo.
 
 What is more, those feature flags do not even need to be in that file
-- 
2.43.0

