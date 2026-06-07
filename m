Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B46C33E35F
	for <linux-doc@vger.kernel.org>; Sun,  7 Jun 2026 23:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780875933; cv=none; b=nmpw05HdDdX6eq+o8kPHjsG23t3xvu3tJfxrAvk/SklkJdVRACT8KUcTYLEh0pu95lCmTwRWmV2pvcmkAU4CQ+ew84sfQdPjn4dpScgQoc7kqaBZCPTeISmMVZgijPWgzSwJ5my/PNtLuLpVm9TQkX2MEMPQLGs4TLaCzumn7Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780875933; c=relaxed/simple;
	bh=Io7D5KkHYqvenZqIL6Z7P+QZrmOBRoracJ76uWfi0JU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gfpk8hJHdANnBgF0xap1rzDFrEiW1CHom7l6gO2WF/smSwS+n9bQC3T7tnRqEnooum7hwS0PdbujylWvMTrQ0GlHELstdENLiak+P6Bwp4oEjFalagLMf5CqiguCuuaczYX6afcK2cHfvriIjPKLpKyIQyftyZxT0y17EAFqeJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FvvgAz8n; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FvvgAz8n"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-36dd65b95f2so2505441a91.0
        for <linux-doc@vger.kernel.org>; Sun, 07 Jun 2026 16:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780875931; x=1781480731; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q5OiZytJs8xCHWwIF7i0RCUYGoDtUsdsRhvMvvj/Vak=;
        b=FvvgAz8naXUNVfwWOhxdTpGzgl5nfFCrU3tbfBrRCrRbNy4Uhq5r5hmo6BGxt/rGxN
         HWkJY7otsUGfN6nFAW9f0eOV6kBVj3deIHXi11F3R2RF4RXLevcnG1aQlMzjieams9vJ
         xVLW9f9hkRbQJSr6Ugxli5gKwWXuKQNlPn6quWyPfMbgu1xNBBNIkkqrJYBWQY8fcoFq
         t85yA/0sRdIWx0TNaDU7o8VsRIXihAZiFdUqTxGxVk55Ujve/1wmD1hCoXiSw1zrhsWN
         DcMcPWC8aEZaxUaAtenWQaxdAC/NZvRnCm+r2TVje1pHmp6wy4BR5S5iUGQek9CZS5I2
         RfWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780875931; x=1781480731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q5OiZytJs8xCHWwIF7i0RCUYGoDtUsdsRhvMvvj/Vak=;
        b=KAx8Oz1Zcm+V2Sa3u4zxwkxEmXxljIesJ4k64q58mXPB5gXISNcPSnwlm7CYj1sO8+
         oFvw4CtAx5ib9yVrrWSYqVaJCrZeb7ger/oNfbUeKO8zZozcIUdhLe788JABJ2h5Z5/A
         k4kZ7K0vkaVqHP5NyYLqDCn0N3PHAmVRJXu3Ar+KmKeMva5OLOuXPa4psLVmG1Te7VTy
         1mnr3amMLWzV2WXI0dnHFkTU/YSm8ZI+pHitjcVTmOlN1CEagh+z83wrswa42ww2AHEC
         O3l6tsg5logTFi9L/KPhrdAfqOiYvroew4+RItovU8NBaHqUx1c88mhJoEutOI7Rsli2
         oToQ==
X-Forwarded-Encrypted: i=1; AFNElJ9DSUZe4gN3j5d2qOz8J0+3Ta1WfuRp3qxkBZKSSXU74PVnBBEEtLtEWXEDs6tIBDpfgFf7ooxXddQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5IyrVn51dyn8iwQkMlHLZaeoPZQyt7x8lxXX4DPI/8CoRWTKJ
	kD/rrmrlCu4kMClbFwyA/6WUAoeGmTK+d4WZKeVhRLWzrDNl9CGDdz6A
X-Gm-Gg: Acq92OFcHZlVes6utf8VuXCFgSfMu9aJ/qWBTmz2+cV1j/bZj7CZHug/TnKMowkl++W
	QiaZGeopS76Oaesla2J2cG71G8+Ng4yPAqWcsYh4omse1kXHwesJ5JSFqfamp9B1+Y9U7Pokkgb
	Rc0oz/eroB04BgjK8SPz/Qa/TIgxeBDYQNWje0x8R04mukfaDV6kO9NWz5l0BYOaLZ59humufy9
	VsaRYu6cnA6gplcivzzI3dVbmyNRmaEVa1tGsabdwyju/7KSPNvPdIC3dobrE0sXaD0/5v/34iP
	/IbUcOg+0MBBDpsZ07cH/Mbda+yMqRNbiF31Vb4QKvgET/kG3H1EtSssX3lpnl/3CM1t4TwgpCl
	5NYTiJrPrQzp3w59msssIoq4pXxGMPujP3XQIeFw2lfO32hWpd+YBjwXRYXrZ4vU4GXv/N1tYkK
	mLoxlERXOIZ/pyMapiwTTmsnN4ztOBsw4+rz/PjFEnzKvqUHyAokIWVwRD8jBlg69fL3b2bcuzP
	9jig02S6AZBfAMPbMOf/lEeb5VHg8SGCKBoWRbJ1N8GTWMz
X-Received: by 2002:a17:90a:d003:b0:368:65d1:893 with SMTP id 98e67ed59e1d1-371306869a2mr10501438a91.5.1780875931310;
        Sun, 07 Jun 2026 16:45:31 -0700 (PDT)
Received: from DESKTOP-G3E0OSP.localdomain ([112.172.255.242])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828d6bd1sm19257732b3a.44.2026.06.07.16.45.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 16:45:31 -0700 (PDT)
From: Jinseob Kim <kimjinseob88@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	linux-iio@vger.kernel.org
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH RFC v4 5/6] iio: osf: add UART transport
Date: Mon,  8 Jun 2026 08:43:42 +0900
Message-ID: <20260607234343.22109-6-kimjinseob88@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260607234343.22109-1-kimjinseob88@gmail.com>
References: <20260607234343.22109-1-kimjinseob88@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the generic Open Sensor Fusion compatible.

Avoid board-specific DT compatibles.

Signed-off-by: Jinseob Kim <kimjinseob88@gmail.com>
---
 drivers/iio/opensensorfusion/Kconfig      | 4 ++--
 drivers/iio/opensensorfusion/osf_serdev.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/opensensorfusion/Kconfig b/drivers/iio/opensensorfusion/Kconfig
index 957caed2b..8b9376d28 100644
--- a/drivers/iio/opensensorfusion/Kconfig
+++ b/drivers/iio/opensensorfusion/Kconfig
@@ -10,5 +10,5 @@ config OPEN_SENSOR_FUSION
 	help
 	  Build the Open Sensor Fusion UART IIO driver.
 
-	  The driver receives OSF0 frames over a serdev UART and registers
-	  IIO devices for supported capability entries.
+	  The driver receives OSF protocol frames over a serdev UART and
+	  registers IIO devices for supported capability entries.
diff --git a/drivers/iio/opensensorfusion/osf_serdev.c b/drivers/iio/opensensorfusion/osf_serdev.c
index 1ac93548d..fd36acd1b 100644
--- a/drivers/iio/opensensorfusion/osf_serdev.c
+++ b/drivers/iio/opensensorfusion/osf_serdev.c
@@ -91,7 +91,7 @@ static void osf_serdev_remove(struct serdev_device *serdev)
 }
 
 static const struct of_device_id osf_serdev_of_match[] = {
-	{ .compatible = "opensensorfusion,osf-green" },
+	{ .compatible = "opensensorfusion,osf" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, osf_serdev_of_match);
-- 
2.43.0

