Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1CEC321445
	for <linux-doc@vger.kernel.org>; Mon, 15 Dec 2025 09:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765791523; cv=none; b=TUm+esqncx1x+7MImD64Zh5SixvuXNQ+iFnjeG0XndP87tDIvVVb03WwMyGI75FHA0Is2sPzwL5WHLnQezEl9mHmSYW+fMtFkuRKBytGiW6CmkkSsKLIudaubzZ5erNx3/SG8NW2e2ukYjAgi0xHmXHr2MIy/p7nPVlgH1QQpnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765791523; c=relaxed/simple;
	bh=ZLczhFCSy+m+gUzqsZBz2A7r/g5l3YzTxanZgL7vunU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r7Ug70H+WEJPj9eXCpIjGgp8RntVT64E99yktNme1UtbQnB91o+8xzks6I7QFXOkrSqalUqqjc28yOLIaXx67/CO4FRSpCVdu6EkW2uhCoDWePN3F5LONVG2UUwysyI9F5LY1PkKh+MU/EVzwObRQLFI2tBJsgiVQR16iiZAesw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WcohmrJV; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WcohmrJV"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2a0d67f1877so11067885ad.2
        for <linux-doc@vger.kernel.org>; Mon, 15 Dec 2025 01:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765791521; x=1766396321; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JyG1HrY6OxFyDwa94CYzQgXUA/ZnED6KNtKcs5HUkkc=;
        b=WcohmrJVPXOIaZoAVi/8VnUN/zIaNUmh+7pEmFpwXF8EJF9pVgdaakiL3m9NQydIm7
         miA7VWJ9INDWOIu6TPv3x5Es3Z2QGiUVmn3LF9ZcBxT8QamYi7J1KToQzeBg3PRrVDi3
         Sp6/QtNNozCrh2FM5Jt1s+udMt58eLtGpT4+RutiSwoM9ob3kiAlN6gsZHZ3h3CxiPEe
         RKKmnFtdHO5CoE4Q8QUtXV/j6SI5XO9nRp24RzOJkPYjIjTqrbOhN1E0NI6GJhGQufgA
         6lr3FUNF2QFzersiKVHnvL6Ey4l/Wat0bW1BJ8feKRuk8hij8BYfLbdRJERoswYF2fRl
         7KzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765791521; x=1766396321;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JyG1HrY6OxFyDwa94CYzQgXUA/ZnED6KNtKcs5HUkkc=;
        b=FdlqfTWbMI6Pz2K0iXMGN0SEaZ1jtoprDA+QYyQVT+z2Tc448t8mp+Ftp8dlZfd3Am
         LcATL+4+TfhBE1XzLwTO8uBjqxqra6mKCFAQNClIGKu7b1iSuwlp+ltmA4iGXnAY1/CW
         JZteWYGq/iKguacSMIGRKf7VaQxmrfzkEEs4XxQnCwbAmllNKkY0H4ZpQKB1y8ohuaUj
         pe12YvFbrI7xH6dMOxRrYFquXjAYmrvPo5XhOamtGem1gD5UcT4cxGZwRU2Dqpl7ZsKP
         0hkMc3xh+xm+WDlSMK6fcIPNQLCcS3oZal4uikq/63uKcdu9RxQfptbmJjeI02T4RX24
         nvEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjxLg7+6SwjwaIrP7kmws5Nxal69laorx5uT+aLMKu940RKEnqhlGC+5RYUeInrZQ4vLdY7utx4Po=@vger.kernel.org
X-Gm-Message-State: AOJu0YyluDZSpaymHs5LL6sKZ3V9lGNXlVJdMvbJSDzbGdk5PVe4SO/6
	vQZXjki+9r01xgwXoG9+CKYnlMWxd29DH0oNKlbTRmA1eqryFv36FjW+
X-Gm-Gg: AY/fxX5eB3lTbVY5GjTgG4djLFADrzWFe+xLZn3HmMwqkSGv2GU4NdZHPDc8bxE5F2y
	Z2V3qvXC7yC2DAGGuxucaT2T0y9/GWQJ5vyZtQa3NkbIohxpVMYUDEHV2aqEBomgzk8gLcdVuOz
	rMEZ2OgiR9keTz0oGIB50kex0bu1zzOgaaoG4wa8S6/EgzeLknBYNayU/zHVBasWbeeUCeDAMZF
	er6ZtEF3INiFcsBzcs9bk+LZH3If1HMKBLo54FcLubhdn8cJTVwBrDdoSZr2p08CcYg13Pt8vZL
	8ZzLutGAwkvKFFCm5fKxo3TexLG6P5WONVTdYlKnmQs0OunTuUgZogNiGka73pzrZL8+nWvZw11
	Q67Rwd5emt3F3xBli9NuR3KgBK4sWCM3UJgwXZx60ATChfRVGT8nmgQNJTE3Jg9gyy1efJycaUU
	ckTjhSpHRJkmgLgfL8QQrrSEHTYrGV2qwts0BORU7xqAEr31ZuyudqQ3TOdYszI+bwO2zdua350
	MeMIbcTe7nmdQG3S48SdM0dRjE6ENvhCHdHCSOLRRpJYweQWemZqZxD8VNM79kXJw38/ubnE3Gc
	vSCMPgtJLs94299nEey2VWLePffkmhGMHOktXY/06jjQSyUdR9k=
X-Google-Smtp-Source: AGHT+IGrLdLzfp2H9tiVac+SQsAe4bk4AskKgVbq1niNwYTYkBxJLkhYZNfHpCAC+5TQzOHObd9ruQ==
X-Received: by 2002:a17:903:3bac:b0:295:560a:e499 with SMTP id d9443c01a7336-29f23b1296cmr99473905ad.5.1765791521288;
        Mon, 15 Dec 2025 01:38:41 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29efd74f5e1sm113017705ad.16.2025.12.15.01.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 01:38:41 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Mon, 15 Dec 2025 19:37:47 +1000
Subject: [PATCH v6 3/7] mfd: macsmc: Wire up Apple SMC hwmon subdevice
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-macsmc-subdevs-v6-3-0518cb5f28ae@gmail.com>
References: <20251215-macsmc-subdevs-v6-0-0518cb5f28ae@gmail.com>
In-Reply-To: <20251215-macsmc-subdevs-v6-0-0518cb5f28ae@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=744;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=ZLczhFCSy+m+gUzqsZBz2A7r/g5l3YzTxanZgL7vunU=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJn215lvbGxWfZmTpGq3Lqym4EiH8s2A7af357WZxnZyZ
 uYn2O/rmMjCIMbFYCmmyLKhSchjthHbzX6Ryr0wc1iZQIZIizQwAAELA19uYl6pkY6Rnqm2oZ6h
 oY6xjhEDF6cATPWbr4wMO1zKc7g2zW7v4HwR7C559/WHjwy7/16ymvClxfJzdduSfEaGPtaOhFL
 JJzUP5q6folLGbD4z69LuKwW/Ls+1WpDgv6qMDQA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Add the SMC hwmon functionality to the mfd device

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 drivers/mfd/macsmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/macsmc.c b/drivers/mfd/macsmc.c
index 9099a7a22f1f..fa7b822d55bd 100644
--- a/drivers/mfd/macsmc.c
+++ b/drivers/mfd/macsmc.c
@@ -46,6 +46,7 @@
 
 static const struct mfd_cell apple_smc_devs[] = {
 	MFD_CELL_OF("macsmc-gpio", NULL, NULL, 0, 0, "apple,smc-gpio"),
+	MFD_CELL_OF("macsmc-hwmon", NULL, NULL, 0, 0, "apple,smc-hwmon"),
 	MFD_CELL_OF("macsmc-reboot", NULL, NULL, 0, 0, "apple,smc-reboot"),
 	MFD_CELL_OF("macsmc-rtc", NULL, NULL, 0, 0, "apple,smc-rtc"),
 };

-- 
2.52.0

