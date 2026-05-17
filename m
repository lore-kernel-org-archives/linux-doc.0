Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825382F7F04
	for <linux-doc@vger.kernel.org>; Sun, 17 May 2026 08:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779005122; cv=none; b=cVxfnNaQIo7BpnMf9FLiNz2hU8xa+cQ+S4znBbyvuBW3e8D0UfhXv5cW1RPiCZi4oxvyNyofuxxUIr5/I42j031frNnVvIEJdArxfmAcDy+oLrYhVSj3f6Prlnfx1tTpdDOm8omcF1VtzYQYC+7x+o7kVwsh/SRa5emhpq385hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779005122; c=relaxed/simple;
	bh=NGMb25quMJA/qmhqXGV0PuyWAv1LkEiCtHZF83T9J/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G9jqw6HJN0WEup8J6Na4/wxSXg79HBo9xAdyFo+c/Ij4vKTZ4AdkSVIeu4Eh8Yw58641x0KSSnr/zW49NqTFEL7SnfkQfztx99/TkhV3s4MSvm85ZDmY0jY45Z2yMUlE084Ej6Phz2Tray3tVo5uzehqX+oe04w/IqIw+CbTf+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dX9kROA7; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dX9kROA7"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2bd2c147abaso7303775ad.3
        for <linux-doc@vger.kernel.org>; Sun, 17 May 2026 01:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779005121; x=1779609921; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yMtYakkWg6xW89eWo2V/gAFSemUpeEFr7/GQfm8tsfU=;
        b=dX9kROA7A82iVIFYb1z97RYdleh5cBn7EHgQ3KYhRKjOmWeUu581VaJpX+J98LIqIS
         PvTYGF9Hdaipk0QhkKbCUm4YAfff95W+k13r8mjdw1xemczO3PfZdNZgNb+Ql3NkW7k+
         CjF1gihNTes2g2OdLMhaREbiCpJu8Icwz/vUzMpB4EjDVu9IGgsiH93z2tLNDWDGDaFX
         WUHvdtMw5rmyNQjRaCUCxSMHoisdzVXSfurJaQVG0/uluRuP7UKUcIRuHoKtYIzMtQ0h
         8DXlvfVwiXQFgEnPu7i6hXj24XpjCMdSzWgUhamD45rFK709gc7kcUguDvaLlD456EN6
         +cNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779005121; x=1779609921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yMtYakkWg6xW89eWo2V/gAFSemUpeEFr7/GQfm8tsfU=;
        b=sSHsdhmPqCXSVdHzZ7d8EX/ELAgrtnQNJySJWYXDBd/LyEgS7kUXVtQs+GJs2DKfZS
         xB62Ev1wiz9uUa2D4SSb7VMxnXcTao9yKWtaJLMfDa2Tw0So0jMTexw2vv4/oBcPP9OP
         gyHp7X0x4+xnImwEjVAynOjfrg2xRqPp4zt3ntNS5SWhyqKJA9khx+sV5xs/1xMB3Fm6
         Xj5nkCZM6kmugB/GKmxl+6T5TGBsBZqmDh+HPmkldD9Gz7ZAAYB4j6kee54IMqPR121f
         OfH8mTqYp9zqF4PEQtubPyb30XwPLAUHr2J6rYDgPMNA1y1BJyzx358EAbPsfzjEjP2y
         PiXA==
X-Forwarded-Encrypted: i=1; AFNElJ872A6QJEKKMeu/O3Cdr5S8Bju0LxkVH5j82LaDoR4n75r1At1veczX5ev1j59MfsBwHoxON3wu2fc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGuSD8sXcCDaXfBEfIj5YXFGO1FMlhD6BbavAm0Kf4EZy3YZYm
	lBUaQUOvvBxTdd9uiPjcJxZirKW+IKJ7Hc7aUpdFZgTqMebAAKIlJiiM
X-Gm-Gg: Acq92OHQCoBm2gh3OT6ZX8n9qrx6f3Sl5bh1PIML4v9NvM0cn5WQFgItvrYpdBoDvEG
	MzYUd0JUoQ+Crx2soxkurlxehRoBAYRj5361vIhT0Wxd1J/k4pVh6YkNBGDdUvjc0Vnl7C3IClm
	b4HeijbXTdlHw61NjIcK6FEl5XDLyYd94j2+Qu8xjjuvLwZYRT2RrgX4j3FKPFYSJ1KqnWlItp5
	uY/TG7xN+2B6t+pWviSFcsVrwcLH/AFs6GoIWF9abNDu0u8Zvi/dSOTNFXoED0s1sgxQzGj4UYF
	ba1oTPSwgDel2Vs6gI67SIGPbdEJaqpZU5wrEseDaqlv/nlDGcj1ot2eZ2qwyVo+VmDERdHhPOy
	/GQL4AHueK+tpfg3Zsj0UhwKo21lYh7gehhd3np35beZAnz6qJhXHl6trA8Qlk/yb/elAMw+3lB
	ySJIq5VyVzWEQnRG2BVQuVQ0DFb9hMbEPIu8mIVAGg2qMEDb1q/IuWoa3d9cmQ
X-Received: by 2002:a17:902:7d86:b0:2bc:7486:21cf with SMTP id d9443c01a7336-2bd7e9056dfmr70871815ad.36.1779005120658;
        Sun, 17 May 2026 01:05:20 -0700 (PDT)
Received: from fedora.taildae27b.ts.net ([2409:4064:2d80:75ca:8541:272f:2bb3:5e55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5bd5fb17sm109834595ad.1.2026.05.17.01.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 01:05:20 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Subject: [PATCH v3 3/3] hwmon: raspberrypi: Fix delayed-work teardown race
Date: Sun, 17 May 2026 13:34:45 +0530
Message-ID: <20260517080445.103962-4-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260517080445.103962-1-chakrabortyshubham66@gmail.com>
References: <20260516164407.25255-1-chakrabortyshubham66@gmail.com>
 <20260517080445.103962-1-chakrabortyshubham66@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The delayed polling work rearms itself from the work function, so use
explicit delayed-work setup and cleanup instead of
devm_delayed_work_autocancel().

Initialize the delayed work with INIT_DELAYED_WORK() and register a
devres cleanup action that calls disable_delayed_work_sync() during
teardown.

This addresses the concern raised during review about the polling work
being able to requeue itself while the driver is being removed.

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 drivers/hwmon/raspberrypi-hwmon.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/raspberrypi-hwmon.c b/drivers/hwmon/raspberrypi-hwmon.c
index 8ce6dacc19b0..0bbc735f74a4 100644
--- a/drivers/hwmon/raspberrypi-hwmon.c
+++ b/drivers/hwmon/raspberrypi-hwmon.c
@@ -8,7 +8,6 @@
  * Copyright (C) 2026 Shubham Chakraborty <chakrabortyshubham66@gmail.com>
  */
 #include <linux/device.h>
-#include <linux/devm-helpers.h>
 #include <linux/err.h>
 #include <linux/hwmon.h>
 #include <linux/module.h>
@@ -96,6 +95,13 @@ static void get_values_poll(struct work_struct *work)
 	schedule_delayed_work(&data->get_values_poll_work, 2 * HZ);
 }
 
+static void rpi_hwmon_cancel_poll_work(void *res)
+{
+	struct rpi_hwmon_data *data = res;
+
+	disable_delayed_work_sync(&data->get_values_poll_work);
+}
+
 static int rpi_read(struct device *dev, enum hwmon_sensor_types type,
 		    u32 attr, int channel, long *val)
 {
@@ -237,8 +243,8 @@ static int rpi_hwmon_probe(struct platform_device *pdev)
 	if (IS_ERR(data->hwmon_dev))
 		return PTR_ERR(data->hwmon_dev);
 
-	ret = devm_delayed_work_autocancel(dev, &data->get_values_poll_work,
-					   get_values_poll);
+	INIT_DELAYED_WORK(&data->get_values_poll_work, get_values_poll);
+	ret = devm_add_action_or_reset(dev, rpi_hwmon_cancel_poll_work, data);
 	if (ret)
 		return ret;
 	platform_set_drvdata(pdev, data);
-- 
2.54.0

