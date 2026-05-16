Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55142DEA7B
	for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 19:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778958980; cv=none; b=bv2pNeEMg3BWo75ZEBE1DKGETcyRdl+Y56pjhbcTYctRW6R+1m6UPb8j0B6knjUcDpiiGsqh+SHQxjGA+BgOqFdYTSGCptFNxv5U0aM3DZy7MA7sBmkPRgk9JGlyreDRaP73Rcb8e6XSzMB8YKohOZHLO4eeN//squwdwzwSTjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778958980; c=relaxed/simple;
	bh=MRPV5zUu6yyUdxum0e8Ue6sn/wJJi1vCfLPQouP7Bo4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OwSFsbLuqEbx0IxLhmLQfIWZy7UuxNoRK9DVRRGWjvYbJGixhzmb9+pEA7DnZREca3WR+oPA0XaHzIAV+CoiMU8hhD5u32bPVb5yVBGRQKz8A1Max+/9q7rEXKEte8DN1foDZvhek+tbWuLb891whE4Xo8B4fRNJvh8wYkSNYCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KFt45YnW; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KFt45YnW"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8383fb7143aso391641b3a.3
        for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 12:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778958977; x=1779563777; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A7JFWJeo/pdX1qMY2KKRekWYJYWmJZk+1tkiUe+PVAk=;
        b=KFt45YnWqo7F+zO3SCctwisCK5KUv2v7So6efS5tquxDQ8MHreTLKDbvBi6Lf2axCb
         poHv1e+LYFW8S+InNjjBkMPqrJ9Yst7SzshdYL82J6K4e31kKZVH2Et4LYm2C7pj7RFt
         BCmhPsqABLteMmMQAt/6c9Tu4WbZrXaWuPEd4/XUZoWmVzXuz2LZXGcvzOyiw1sXmQMr
         36HAuozw8KhfV6Vfh2QiImenGDN614iiyYxMmDMGT8DA39Zah40q5ZANUh1huUWcfYhv
         xkcTUkHIda5wm0jVI90eWI9xwpPPWL838atd919lHKay0hi8s0Vc4GrNKsQVpW6HQ+T5
         P7cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778958977; x=1779563777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=A7JFWJeo/pdX1qMY2KKRekWYJYWmJZk+1tkiUe+PVAk=;
        b=XYiCLzLCswGxtURcSN/9UZKA7f9ovVp3ce1t22eWFaBdOBgffglgflm24akX8Mgwej
         Y2/6/xI3Zi13sUF5LxcsRrhgu5VoJofE6JCK66qG1ruBNDM0uTKbATAhok5vxTocSHv/
         NAFwe/M6GKpJv3OQ0cPv+uY5QD8GbJogXJEl96rH44OWcR4cB2bq/L9kjyxnxx29MY9Z
         mS7oA6h0zQXbHMAybO7wVSVS//zDv8U4+UsQlgqXmamZ26a2G1yezAokIPHhVBXmwjTn
         HHH7dpv2DhZnndJupcZl1Mpmi/d1AiUSB2mO7KxAlXqVD5YMbNBWBBoUNb4qtZ8nu1Vf
         TUig==
X-Forwarded-Encrypted: i=1; AFNElJ+qX/sU/KDBcsGWSKNyflsfdZdGYO9GfI5bUE+tZjQ33v8MNM+rzaw42FRaaMcG673yhtr5n6cQl9A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxpy1YIkIZUz6B2Xy6gZOBrrKpLl8KjTlTCgBUsYL6gR3hUozrJ
	JlOtbuiuMnP2v3A/Zj4ZtvorKWPvLQM16cBb+tjsySjWFKfWaZ876FZx3rY9OHBROXFNgg==
X-Gm-Gg: Acq92OH8pvjvanyoJxl73GmbIKp4Pe6n2o5XDRc7xLNHDHwRgcbPGS9gOBdsJi9Yswm
	yfd9oca83/1DAj2aVuesFV7SGHXkXh4+f4JcaTfPqdn19DipbBC+71cX8/iXW0QFDgBR8uZ4OgG
	8+xyT1bcRc9uWL8NiaTlCswd5yWsrs/llM0V4x9GG0b1iNNd66PPZvkKa7l2X2Uldiih+4cBHrX
	+k7k9+e6ecs6mUg0Xy+hr1TYRiP9Gj8jO8PcEFV2BEcPpaUUydL9Yjyxz3pbw9M246D4weMrUE9
	IXGb5k+5vIB6xzsrHBD/2ZGo8qqycM8cWaKJErJ/4pmEdlCFMB196p58xI0XUn8oBCBFUqKm7r/
	xyl0FaUWFOFSDgNeAwH4uiHjrYGq3rBQSwYSiv1f/ESd6+FqApx1hJ73tokJsAcowAzt9l/GnZX
	22nzILphesiFJmHpiRAXZz9oTHlg7PfT51i677ZbBYy5ax5rAxwoCnuEhbEw==
X-Received: by 2002:a05:6a00:44c3:b0:82c:6da7:2d3d with SMTP id d2e1a72fcca58-83f33c2a8fdmr8270653b3a.11.1778958977236;
        Sat, 16 May 2026 12:16:17 -0700 (PDT)
Received: from fedora.taildae27b.ts.net ([2409:40e5:100a:b5ee:87c:e578:2b2e:422b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19661261sm12297625b3a.3.2026.05.16.12.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 12:16:16 -0700 (PDT)
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
Subject: [PATCH v2 1/2] soc: bcm2835: raspberrypi-firmware: Add voltage domain IDs
Date: Sun, 17 May 2026 00:45:54 +0530
Message-ID: <20260516191555.17978-2-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260516191555.17978-1-chakrabortyshubham66@gmail.com>
References: <20260516164407.25255-1-chakrabortyshubham66@gmail.com>
 <20260516191555.17978-1-chakrabortyshubham66@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add firmware voltage domain identifiers for the Raspberry Pi
mailbox property interface.

These IDs are used by firmware clients to query voltage rails
through the RPI_FIRMWARE_GET_VOLTAGE property.

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 include/soc/bcm2835/raspberrypi-firmware.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/soc/bcm2835/raspberrypi-firmware.h b/include/soc/bcm2835/raspberrypi-firmware.h
index e1f87fbfe554..fd2e051ce05b 100644
--- a/include/soc/bcm2835/raspberrypi-firmware.h
+++ b/include/soc/bcm2835/raspberrypi-firmware.h
@@ -156,6 +156,14 @@ enum rpi_firmware_clk_id {
 	RPI_FIRMWARE_NUM_CLK_ID,
 };
 
+enum rpi_firmware_volt_id {
+	RPI_FIRMWARE_VOLT_ID_RESERVED = 0,
+	RPI_FIRMWARE_VOLT_ID_CORE = 1,
+	RPI_FIRMWARE_VOLT_ID_SDRAM_C = 2,
+	RPI_FIRMWARE_VOLT_ID_SDRAM_I = 3,
+	RPI_FIRMWARE_VOLT_ID_SDRAM_P = 4,
+};
+
 /**
  * struct rpi_firmware_clk_rate_request - Firmware Request for a rate
  * @id:	ID of the clock being queried
-- 
2.54.0

