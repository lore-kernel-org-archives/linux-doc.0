Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3195113D503
	for <linux-doc@vger.kernel.org>; Sun, 17 May 2026 08:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779005106; cv=none; b=KzSHEtVlViKQRdWv4a4g+MCZoyXfATmyF1G0bJ0JZSn5AiaHY1q4KeG+UiI7w56wrRcle1tVNMA0ob+E41AMwg/kIQTadApS+u5N3dfOYnW9zF1YQxOe/y4Cr1CQuWKb2jqG9aKGF2s6JUzgODV8Q2Nz/DoTUpo2uq/lNpHyo/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779005106; c=relaxed/simple;
	bh=DDnLVn9KE0r6n+8qdAW6um++L3c2y7QGNd7NAvWSOzc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JFEnQEnusXWzYs2YnjSOlWKUP5VX+LXh5cHq7YmehTe9YMHkMHtSC+24SduJYEsMOGBxavV+LhlEk5RVQKTm5rqm2LtptCmtsNPDcDVXQXJndsGnRy09k3GIJFX4hKxdE+AAvAFDvKg7teXi+mvg7Bzu2uEaamw7tR3bpdw74us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dZzIkHyJ; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dZzIkHyJ"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2b458ca2296so8860455ad.0
        for <linux-doc@vger.kernel.org>; Sun, 17 May 2026 01:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779005104; x=1779609904; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rx2QX5K9is5rKmLAU+EuwGG/waj5UvUtwnyY95MhkWg=;
        b=dZzIkHyJwIwKjRtAACmqjHKejKi6O+KAouItx2LW0EzOK6kz/wjPaoF2EO0TjPTsVr
         zkR0M6TnHN8SSPl7YJGeYPTVJwgS2eOSXUGgD24hOVrXbGsGQ1lRRBwp6+jtyh1ytMLO
         iplwYaUmFDKxgvyFW7XfEG/5puhGRGCW942tTRqUbxyYkFaiJg95EMWtkH1zRnu3jGxw
         OrrZukARW8WxIcoWsQEvz8yN1aHHBxg9DPGojgQFuKMcI6vRgNbKR4OWk8fsuZ3Jfwfp
         yb4Il7J3hWXkurOiEaHz9VAtmD89cZAy2sVw/7B0lWpqABbhzMKPBMDpah9mIrOXT3fi
         ojRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779005104; x=1779609904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Rx2QX5K9is5rKmLAU+EuwGG/waj5UvUtwnyY95MhkWg=;
        b=Rc+5bD/NoZKvCZLS+j5xGINr0t1bIVE9NnQjBmAEPruJxbYuctC5R/DJeVk7Gls1ie
         vMM86zKNW+2q7yXKyVSN4pLR8sFo3jIkhDQXKGs5QLnSLwgb7KGaVuNp6ELukmPPLJ6J
         sC6N3Cmy4V20f/CHIv8YTf6EDQTzzp7GpDOYnqCLgX/tOWBsVenytN2/RlsVLAC8w5BM
         jPi+pQI/8pF0mI4en5iKgnNJhI5lveP/Yz034EPgr9A/2aARXrwzrne64C0M02X+nRpA
         ksAdYp0gCL+xgCNzQ2Va8fbl5kwz2JURuiUBVl0tWdR2YLerJJh2DFtdgfm41Ye/XcZU
         ruSQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Ti6tz0Oy0r+7tJsEMz+17cmo7GiykJjVb6NLssUKDjBmuRJ1CyPhbgfeTdeiz0IbeOKioH64NnU8=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywdk6TSziYP6BykR+UwcOJI52FwLkgEsJ5Gj2Ql5KwyNjU6q1JL
	yifkVU8XX9SPROe9fqfTykUwUMfJ/zDkBwqNfnZ7nfSrLjTWovr+47gT
X-Gm-Gg: Acq92OG1OFRL/ZUYlOTYQDiMYlPWt0JQ0RDPVxRNSG+RkDxUaKHNi/5c4yLy00SH1M1
	dRVI1PPV/pUuKm0ICvwqOkie1fs2wndGDAkVWdo9EQE38rM+tYetVSS0t4IzrWFx7rCXCyFxa46
	zscd4yRIZQsUwR1FrYc1eecCDQ3MZlBIeqiBGuztW9wk+dEUEGy7UjIVTooSAao4U1irZ8EAL4v
	Qqw8lzcHq5Jwxk/0vVrKD3icyGKAnQD7/XZuU/cvE3AnnbeYMuNjixBOjhxHJ9O0c3Z9wQCUkJh
	7Hz5KxZ7HGuCALVFQJvz5KnoluUha28tUDxuFS2zzPyWDIa1FqXCD+udfG5N4Xob2/w1lsTlBJB
	3TojzDctgEx3DlLtT77lrWDZetM3ju2LszHix+D9v80N3g6jE9CATkQKXvMsPdJ0tVAwy6UOMCJ
	oJpfpiC0voaZ4RTDb8m0U8omejqXyQL5AgJQBtJUR9kThp/kbRG7eACW6EeFnvj4v0o/flLUw=
X-Received: by 2002:a17:903:2ec5:b0:2bd:9061:d544 with SMTP id d9443c01a7336-2bd9061d6bbmr91383835ad.34.1779005104454;
        Sun, 17 May 2026 01:05:04 -0700 (PDT)
Received: from fedora.taildae27b.ts.net ([2409:4064:2d80:75ca:8541:272f:2bb3:5e55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5bd5fb17sm109834595ad.1.2026.05.17.01.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 01:05:03 -0700 (PDT)
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
Subject: [PATCH v3 1/3] soc: bcm2835: raspberrypi-firmware: Add voltage domain IDs
Date: Sun, 17 May 2026 13:34:43 +0530
Message-ID: <20260517080445.103962-2-chakrabortyshubham66@gmail.com>
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

Add Raspberry Pi firmware voltage domain identifiers for the mailbox
property interface.

Also add the voltage request structure used with
RPI_FIRMWARE_GET_VOLTAGE so firmware clients can share the common API
definition from the firmware header.

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 include/soc/bcm2835/raspberrypi-firmware.h | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/include/soc/bcm2835/raspberrypi-firmware.h b/include/soc/bcm2835/raspberrypi-firmware.h
index e1f87fbfe554..975bef529854 100644
--- a/include/soc/bcm2835/raspberrypi-firmware.h
+++ b/include/soc/bcm2835/raspberrypi-firmware.h
@@ -156,6 +156,31 @@ enum rpi_firmware_clk_id {
 	RPI_FIRMWARE_NUM_CLK_ID,
 };
 
+enum rpi_firmware_volt_id {
+	RPI_FIRMWARE_VOLT_ID_CORE = 1,
+	RPI_FIRMWARE_VOLT_ID_SDRAM_C = 2,
+	RPI_FIRMWARE_VOLT_ID_SDRAM_P = 3,
+	RPI_FIRMWARE_VOLT_ID_SDRAM_I = 4,
+	RPI_FIRMWARE_NUM_VOLT_ID,
+};
+
+/**
+ * struct rpi_firmware_get_voltage_request - Firmware request for a voltage
+ * @id:		ID of the voltage being queried
+ * @value:	Voltage in microvolts. Set by the firmware.
+ *
+ * Used by @RPI_FIRMWARE_GET_VOLTAGE.
+ */
+struct rpi_firmware_get_voltage_request {
+	__le32 id;
+	__le32 value;
+} __packed;
+
+#define RPI_FIRMWARE_GET_VOLTAGE_REQUEST(_id)	\
+	{					\
+		.id = cpu_to_le32(_id),		\
+	}
+
 /**
  * struct rpi_firmware_clk_rate_request - Firmware Request for a rate
  * @id:	ID of the clock being queried
-- 
2.54.0

