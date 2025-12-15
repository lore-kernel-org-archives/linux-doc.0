Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15315329E79
	for <linux-doc@vger.kernel.org>; Mon, 15 Dec 2025 09:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765791516; cv=none; b=ET7FV9wULNNuT1cHQiR94dS3zpzbuGbXeuXgVVIOAdCHb3nNvlEyILZSOkeg2rPpViS2d0C2AKC1/UeXBFWS2VtV7JmueE9RXgty1wXs7nUSVVvmwMrnqUH+keV3yKp89vklXf8nhXPVqtGLfp4mxuC2+IcxJ+THkBrPfl2JENw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765791516; c=relaxed/simple;
	bh=zrs/6kJawMZ2MFguV+AuLC+A2VRjOPQuG4CKOsgbB0c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AXykZr2iM/VPzcg/CI2yJhNbLHsZ2Llu9jcQhUJr8t0yazdyX+WJckxnDbtOJazIEmTO6BvyA4cjgMJAzy6/f4eaP1mTIFcA9i83BLGMMYotHB75QCVbfGGB+uBdgFfuqMPvHmiNJEzq1U+P1eRVGGR1RsbGM/F0SQRAsH19xEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gy8jFwWd; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gy8jFwWd"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2a0d06ffa2aso11930805ad.3
        for <linux-doc@vger.kernel.org>; Mon, 15 Dec 2025 01:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765791514; x=1766396314; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rWL/R9H5BUG2NYa4jn/zKUUS6RMYKLuzBStU1FlVeTE=;
        b=Gy8jFwWdyq01jOa0Q0ynLuujy0EuGZlIlHRAIGA4IjNavpV6M4Z2HxeRwZP48HyrHN
         PGKQoXOpAPpyCUFpawZTnsxSSgi4VZ3AC710mJUNN+yA1Jtb8hJ1YSrEipnT467pYBqb
         dqI4HgWloWGOD8fPxlt4RtJx0jrWvBvx0itxg4ysmbFEXtRm8zHPNNxB3dRyCM3Xfswu
         ZCdY2fALE8oxTPzoUjKBfDBUd848jRK1YaCpoJfrnQeZn5xsbuhQH7ILUBIHMcomwf8V
         QWrIVSX4CVoxQesKL6rwuMAND9oAbgakExzi0mM5Zdq3TEQco2ZJIrV9wyazqBd5F0qL
         o+Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765791514; x=1766396314;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rWL/R9H5BUG2NYa4jn/zKUUS6RMYKLuzBStU1FlVeTE=;
        b=lY7U3moKoYNaD9ChtUvIHZ/WSANfQuFZYlORyvKM5BRm1mgyvBFbhGbkJqHQB8q7gc
         M1NYT3Jlu6R9FsvQw3orZVxR/lRYRIqdeTdswNzyWbV6y+gEUM6ObPKCzKDfdHp+e1qQ
         tPA2wuXJToygSDg18U2aL7tIRI71HAwfGmiE/U6Pz64bj35oTsPNSsOHaGL5y1+c0Gi4
         x4FcvWWHqXadFZSBKlsoXa0S03dKFumbXeiuKJf8BCfzRsrJfYmDgThqEchzL+/4RSHM
         7oEngVGGsexQWhxJmc3hseLP5ZOWnbm6bEWRYdAJk2fDR8mXHvS4Dvqf3fhrX9ZdeoHn
         Tnrg==
X-Forwarded-Encrypted: i=1; AJvYcCU3owAA6cWWiKVJl4YJph2abc4fWkjlfqsPSD92/b1KyGn0AD2qPxADY41BPyTvthXg6Jr14Mh0ic4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzV8S9p68x+rWokrSlZ20ua4gKKlsk5vRcnW22d4A9WldQujogy
	cvoam0K6JWheTNe5NvBH5I6ee0fLmxvh9cetlgVv3y5/PnErJiuurQgU
X-Gm-Gg: AY/fxX6AEZdTP/HmB3hE188VmLpMfiQ9qlyQ6yHNNgtPmcwj8/hOmy5HoE+Hg5hZ9iH
	Ydy3SkP82sd0DMYkTV6PwoaHZUsU7nGsx1sU+3RadXcIpJV+AAaKaLjLh5g3E8tgQAjqZWtXOT4
	vzjYgr3Z8NiLbjer0GBfuiqN68rDd8SD7505/HH01yuMk1PyX30ypwBHPKSVeUeC1Cdm0ObjjW/
	BpVkghxpY4TLn3As1hxtug0sNyvg+X1K/2vjQMoN+Bf3Vw/hUeMzOT/7+WN9+6GNzCJGkC0GnyD
	BTXrcN1ZA/ssmLA0tP+aSYjydAc+DqQRouKCZ9796fR+fWXwtdJOVn7nyvTMWyE2JtRbnhy38K/
	ORsfygmFSnIjbAQmVJXJlxwzJAzhNqarz5KGkRAkduIepJolwgceGVuCpvdHVHyvbdPILxGdD4o
	6u43dwjtURUHgOmGn+EGgrVzHETKYnUfZfeCJ7V2hZta99aEneN9Wa/GhVnIGmvGrNlstB9fABi
	Dab8sqRQjVbCQqh6FmHEjFlxif2jO5PCHCuANHKvcT3pma9zH5zE4cmUHp1QGbFWM66Kh3otfO5
	pCzMshftF/i5z9lJBkFJXBSgDZxMSGO9PZBtrhQa6WR/kEQHIY0=
X-Google-Smtp-Source: AGHT+IHCWcOyM5Z8EFFrTYBLBI/0yDbLna48TS9+7DgDOr+UeDJqde5BU1SxSQK1fSOkyBfxFjFufQ==
X-Received: by 2002:a17:902:c40f:b0:298:6a9b:238b with SMTP id d9443c01a7336-29f23d12fd6mr91903265ad.51.1765791514107;
        Mon, 15 Dec 2025 01:38:34 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29efd74f5e1sm113017705ad.16.2025.12.15.01.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 01:38:33 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Mon, 15 Dec 2025 19:37:46 +1000
Subject: [PATCH v6 2/7] mfd: macsmc: Wire up Apple SMC RTC subdevice
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-macsmc-subdevs-v6-2-0518cb5f28ae@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=747;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=zrs/6kJawMZ2MFguV+AuLC+A2VRjOPQuG4CKOsgbB0c=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJn215nvvLy0yve6ff3amrhrC/MEs/XVOlOearId3L73z
 ZXPa/xqOiayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKhjrGPEwMUpAFMtVcHIcO7jXJNT6ydzK7gs3uBz8fN7s5dxvHcn5/gV9zZPuPmj+Q0jw5UGyV0
 R228vqDuoltO+7rvPRi+Wc5+OZAcpMMaal/3s5AEA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Add the new SMC RTC function to the mfd device

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 drivers/mfd/macsmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/macsmc.c b/drivers/mfd/macsmc.c
index e3893e255ce5..9099a7a22f1f 100644
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
2.52.0

