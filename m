Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8407B30BB9F
	for <linux-doc@vger.kernel.org>; Wed, 12 Nov 2025 11:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762946287; cv=none; b=ZK+FisFGHVyM4nSJVae/ooOEeQQvcSzSHyOlNBHX30p0AsSgkzVUlW0typ/zcAl0MUWI/jeQbdlU6nZZ66NwZqwtpPre6LOnX6bjNoP2EqE8UWL8VpVkIRPerwK8Bszl/O47SCSelCsrHxH2NVScRZySrb4Vsq9gvE71pEZjNVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762946287; c=relaxed/simple;
	bh=0X8ztOxPIoLqy18jxO5aLU25sae5cz22Tql+G03LG0c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VhAqmnmN8QsopmMUM8LSTNwhQFMTK3buGYhMRkPhE79Qp0NRf0cjhwGEokSkPeHcryfndf0lmz1VbMTs67lRRs7BaVEl6kuaUUZQGWh/FQ0gqGNUTu/hohwFAPtjeGfBlc1p+J2kGj7/j5Uu/EX+4+Hpf1zxG7+dklI8vQGlye4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I2ch7Ctl; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I2ch7Ctl"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b553412a19bso453503a12.1
        for <linux-doc@vger.kernel.org>; Wed, 12 Nov 2025 03:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762946285; x=1763551085; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TfBBll7plQVG4jmIJcdQk3DSYpimQWr9oy8pKjz02Aw=;
        b=I2ch7CtltF7ZjK8PZWnMl98TvD+vcCsYo2nQMCkMSJfgU+/XI4nsU8MeXURmvBMj0V
         dggQ52R1mlyS00dRB/AokCUpPEKXsb3WsP19jw+GnufzI3SVI4CsAvbIdrCHrDhwPrNU
         QG9O2wYsoM1bqcKVJwpT1vF2ZuehqtiayXshaPda2+Cz6kqz1sOsT7NKRSwD6nizSoF2
         L+CPQBUGGrJ/H2fFiGjaCypKEfbxHK3Ry4GxQ52QPFma2CrPA5Z2PR6VBDtr/jNdDRFg
         VBu/cJnWDGfx+92e40SEdgke9g2+qLGaUA31i+iP0QElbq6HdjJpfCYi/fgY4QHquRg0
         hs/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762946285; x=1763551085;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TfBBll7plQVG4jmIJcdQk3DSYpimQWr9oy8pKjz02Aw=;
        b=j0dmxV0QbhN9xMCOwyM/R8vM565u9PCYBWQ7vh/YR7JHidS92HnUIq8xo5snqh/io+
         U2IqBSH7V6Iq0vYpNsbaEKX7ciFnPKWFLd51Fez3ku11Uj8wn9C8uG2i4HpszSivYo5t
         mWAjvj8ckp7oPSc1qsDktCRhE/p3fZxg4NhLwEZSe86xWhLqwniDHSC/n07MuGfKscIE
         Fzy/QOShRSXeCo4rTX6Uk9nzu2pjsgBvwpM97H6s+29AQrDGMvmdm0Heo+Q/i4eEW/nh
         7UtQ5bC+yRcll5SdaJ8D/s0zHO3cfsXw+OXxZHkoJA7A9T8dmhrmJZs5MKXZZ8Kh8PuG
         /HwA==
X-Forwarded-Encrypted: i=1; AJvYcCUPEWKm5crsEjydBii/y9TJuv4O0o4ku/TU9p82eoWrhc5hCoDJHubUuN4nQl0Y2PXxYyGzF5/Ekp8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp42aiut9kj5N5IiL7JOVLQP3UhW5soB295ygFD6U4tITIEzw7
	kEZl8pDid+uiH6+Z2Fm8gXb6Hy/RBmURzskrsBwO5gqj1SUPQFQmHcNh
X-Gm-Gg: ASbGnctl+jSnuHiNfKQywy6zvmW/GOEWOX/QmU07/2fTK32G9zJo/VK/4lT+dbSPg9M
	V+wp9tCSIwy7B6xKtRXBMF7pooUvtcn1Di/rYaClI61YBp0pgUmiAWKebw40hn74iTtWWnQnzp+
	oFTZDJugZjJKcrwSypfPcMw1/gnVCgzvT3BDkV38yCpAqhomtD+ikkOGwRUtvPdmMIeWR2r+hz0
	JiUKyf/LbNmSYqh8+7n2eDQpQyWX0qhbpdzEtaxIFY0YrrCJIJF9xL5MmC3OelQ9icOdq8n3vPD
	Ll2OppGDYAflhvrWYoDAQ7OS6a0oAMfIizVemZRmqNp/EUeOeU10PM/S4Zwi4r0dS3NTz4jOvXn
	g89Ib4zmcvKDui0MFjfxnG4/QmlPQKDlpS5umzagKA+U0qQq/i+S3w+JcD1lyPMMzu2wI4FTkWD
	W3/d/10Bru8FMXwo/UenWLS8zHsItVi/gaFgiHOa9fjxoHkBQFlV4b2MtFGM0HzczyfgcXkzxwT
	rIZngedH3bvqlvR+iqywGc7fUbTJydC/gmirUxCYFcKGwbDJmOrJ5o=
X-Google-Smtp-Source: AGHT+IHA0P4UnsPFIhj4utJwEq6rWs7Nkg1EY8pIQ9eKSlMotkC1tp8iAeDrvqrEcOWVVi+EwKFK9w==
X-Received: by 2002:a17:903:2f88:b0:274:5030:2906 with SMTP id d9443c01a7336-2984edcd3a1mr35066775ad.46.1762946284740;
        Wed, 12 Nov 2025 03:18:04 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2984dca0f28sm27386695ad.60.2025.11.12.03.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 03:18:04 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Wed, 12 Nov 2025 21:16:50 +1000
Subject: [PATCH v5 04/11] mfd: macsmc: Wire up Apple SMC RTC subdevice
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-macsmc-subdevs-v5-4-728e4b91fe81@gmail.com>
References: <20251112-macsmc-subdevs-v5-0-728e4b91fe81@gmail.com>
In-Reply-To: <20251112-macsmc-subdevs-v5-0-728e4b91fe81@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, 
 James Calligeros <jcalligeros99@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=747;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=0X8ztOxPIoLqy18jxO5aLU25sae5cz22Tql+G03LG0c=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJkiOUeYXSp6HTiumdkXFc1P4lS9PK9pZfHi1fzZ2ef4u
 HINXwV1TGRhEONisBRTZNnQJOQx24jtZr9I5V6YOaxMIEOkRRoYgICFgS83Ma/USMdIz1TbUM/Q
 UMdYx4iBi1MAptrWmuF/hdDOyUmTfkptiMp9whlc1h/rFWiQ075Z8Ps7E5W4r7/9GRkmt8XcOv9
 ZLjFA4cGDV3ZBzGeuTKy/kmDxwz4r+r3ILmcmAA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Add the new SMC RTC function to the mfd device

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 drivers/mfd/macsmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/macsmc.c b/drivers/mfd/macsmc.c
index e6cdae221f1d..500395bb48da 100644
--- a/drivers/mfd/macsmc.c
+++ b/drivers/mfd/macsmc.c
@@ -47,6 +47,7 @@
 static const struct mfd_cell apple_smc_devs[] = {
 	MFD_CELL_OF("macsmc-gpio", NULL, NULL, 0, 0, "apple,smc-gpio"),
 	MFD_CELL_OF("macsmc-reboot", NULL, NULL, 0, 0, "apple,smc-reboot"),
+	MFD_CELL_OF("macsmc-rtc", NULL, NULL, 0, 0, "apple,smc-rtc"),
 };
 
 static int apple_smc_cmd_locked(struct apple_smc *smc, u64 cmd, u64 arg,

-- 
2.51.2

