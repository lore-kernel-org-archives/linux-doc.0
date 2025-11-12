Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6902630DD3B
	for <linux-doc@vger.kernel.org>; Wed, 12 Nov 2025 11:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762946332; cv=none; b=QipoWP6hmx9HpPCpX8aG7LP15f5QE2eNdkMYW3aNcqWqo4xSKxUozZE/V5K/J6VvjiA4bfbMWHEIplTmc+7iloJMbBEVmBL48j2X8PtRx8Ek3M/DN/cExd6t3fxv8nafUDE7+mKweWpHYb/v6x7eaHYPyqIMFs/hg9Yu1n/Ena0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762946332; c=relaxed/simple;
	bh=cV5fF0qJO7pdpT8f2yzJ48FKOMe3eNyb1yjLf5hwPSc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jcHLDdCn0gpGFlwe8hl0EBO/2xWHhIhcLQN3gXepHxdY2pbETIAQqyV5TE5U+anqzK92suMpSCW3Xw6ly4TUFY2iZtuG147hEUq7E+lVrSh7ZP4kgaW8StB1rSMVWwV09dOFcR9zOcfHv/iPoM585/sQUpO4yy7ZOJ5DFeWZGSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bk06i2YK; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bk06i2YK"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-297e982506fso8454695ad.2
        for <linux-doc@vger.kernel.org>; Wed, 12 Nov 2025 03:18:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762946330; x=1763551130; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iA6BDAFFSivvDJvfncgF5ApGj9cWDmXDuEaDbWv5cik=;
        b=Bk06i2YK/4G/N1zND76g9QO5VYP4E2cJr4Ycaf3iPh96lkebMG1smw/LdCmWt8LXbL
         sqIm5CrUhGgM0dJSbDY4k7bmjFKHcuaV7vwccX3DU+6QDIHjBB2CbNizL91vNtffTV8f
         FmgwcS2eCOL039z49ENwAo9ulu6EKmJKFs5ePfSRb0o4IuaKdEibaCN/tI7xPKHejQVn
         +PrLKryD4kTzOT2ZWgEqytkReKLETaAWF33u7HJJ7ufsXyWh2Qk7F8svPasvZFgbVI+x
         JgNolEaIVvgmyiqBlQR8ePgZMm0m+yrpPD1cqDENZ1Iz8TIVUzoA8mSs/XSEJFzqHxyJ
         DzfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762946330; x=1763551130;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iA6BDAFFSivvDJvfncgF5ApGj9cWDmXDuEaDbWv5cik=;
        b=r1HZh/4zddMb2rh1AiHFsMH2kU1oRPupnDugP309thal2hbTA/o1nb3CUz0KBm5uUV
         a0a0JTbMlXiL7zPIbNJSQbQGZYxzxzE4Y4FbOkLIxIgooxW/0rLrENExFgm4py2Zkfoq
         K5KJ03O9/192DzLmWizepE+hs5IXJC6CqdYGGfimkYC+KnlrhBVA24/wgmh9H6Vuko5h
         MJI2g86DT1KhlxyRW4BWbFxQir7eSvhWl0XMhx032/jfbsecWJtgFndHDoQFQtoHB6f/
         fz+ew3jFT7LUtaZYfSMA4lnuec6Q0BK4g1Km24hJQ3l/mAdEb+TO58IKIjcIEOdtp1ka
         LsZw==
X-Forwarded-Encrypted: i=1; AJvYcCUNfxCBERyw1Fx4BjKZZqQBthvsgs+1Mo++l+0xNtiOhYbIhhQJGDu0tnax6wOr+7BkYOmN1ICDOuA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzB9v4bAgQEibG3i62mxW1avj21qr0WARMGRpFglbwOoQGJUOfS
	hqq6DxnF+IGEeknwa5J+Hxy7BmEKmzVTP1FO+ghf8m6yqzXGGNR3QbjC
X-Gm-Gg: ASbGncvDZTu9blAkPPT6cNrE1jWBHz+kJCydH5tx0MbY0fYm/e61zxsSToWPj71Q+Sy
	Vx2e8FFKPhmQWJVoZs6pfArXi6GkyZyXY48olv7U6YFMCWRgiXVVOe5hXSkwJWyjDUhd0mXkQX7
	C+SFBVmznJf6qbeButnn5JmCMFci1fqlRRw6Cj40+ctPYqMugUhySZsfZeAxGBaRJQ19bcR/4/1
	/JIYc4Dhyq0w4nGV/NmqvNp48AdjGkUCQQE6IiNd5r7UA605XOJn8t5CWUYHPbmP3nES6UYdUzy
	+BlAEt4pn1VkIGSH26a67JSpgK+pAJWYzl4/NxKwmraPhfwOGez4yCSrkrg5p0YzVHnFAck9kgx
	sY77KsKP0CrnTIS+tcVp1BMvfo5gQybze0txIfeoIqouwAoCQTSXp7zmaVOlKYX/fbxYQOlx4LB
	J8CjJWoVCruoVUJYGqIK3nmPc5qE0/08dnWJMveO/BTbgIgGOh23pOQo8BpIYJpblP4+0C6d8OP
	o0xLjLPTm1vtNiAUOZMjKgOEr51Sq5O4G8Rb3G3QIpYsTjP+vRYMN4=
X-Google-Smtp-Source: AGHT+IFR7QWTTs3Zcb/5ft94/X6vbUaJNlBlezavBVdQ/3VzVvLaCae6d4kQA/Kg2GnApMGUCG81qQ==
X-Received: by 2002:a17:902:e543:b0:295:2cb6:f4a8 with SMTP id d9443c01a7336-2984ee16a71mr33782855ad.51.1762946329798;
        Wed, 12 Nov 2025 03:18:49 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2984dca0f28sm27386695ad.60.2025.11.12.03.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 03:18:49 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Wed, 12 Nov 2025 21:16:56 +1000
Subject: [PATCH v5 10/11] arm64: dts: apple: t8103,t60xx,t8112: Add SMC RTC
 node
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-macsmc-subdevs-v5-10-728e4b91fe81@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2689;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=WbLk+4olybI4wwc+d0lxY+Dd90gh9RgPWEprBEz0Yao=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJkiOcfOlYr8bFj60khS+5UQ9+ndU0LetjI3h5jenRAds
 vHv9vyajoksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GuoY6xgxcHEKwFTPsGBk2Hnku/XnVYdT5a8tbZ2TVdjOzRLv9rKet/G+5L3EV+bhcYwM3TMD+QP
 1Wg9YbJ+ZoGimuWT1km1Luw48U79aPqHg7cRgRgA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Sven Peter <sven@kernel.org>

The System Manager Controller of all M1/M2 SoCs supports the RTC
sub-device.

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Sven Peter <sven@kernel.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../arm64/boot/dts/apple/t600x-die0.dtsi | 6 ++++++
 .../arm64/boot/dts/apple/t602x-die0.dtsi | 6 ++++++
 arch/arm64/boot/dts/apple/t8103.dtsi     | 6 ++++++
 arch/arm64/boot/dts/apple/t8112.dtsi     | 6 ++++++
 4 files changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t600x-die0.dtsi b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
index 3603b276a2ab..f715b19efd16 100644
--- a/arch/arm64/boot/dts/apple/t600x-die0.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
@@ -44,6 +44,12 @@ smc_reboot: reboot {
 			nvmem-cell-names = "shutdown_flag", "boot_stage",
 				"boot_error_count", "panic_count";
 		};
+
+		rtc {
+			compatible = "apple,smc-rtc";
+			nvmem-cells = <&rtc_offset>;
+			nvmem-cell-names = "rtc_offset";
+		};
 	};
 
 	smc_mbox: mbox@290408000 {
diff --git a/arch/arm64/boot/dts/apple/t602x-die0.dtsi b/arch/arm64/boot/dts/apple/t602x-die0.dtsi
index 2e7d2bf08ddc..8622ddea7b44 100644
--- a/arch/arm64/boot/dts/apple/t602x-die0.dtsi
+++ b/arch/arm64/boot/dts/apple/t602x-die0.dtsi
@@ -121,6 +121,12 @@ smc_reboot: reboot {
 			nvmem-cell-names = "shutdown_flag", "boot_stage",
 				"boot_error_count", "panic_count";
 		};
+
+		rtc {
+			compatible = "apple,smc-rtc";
+			nvmem-cells = <&rtc_offset>;
+			nvmem-cell-names = "rtc_offset";
+		};
 	};
 
 	pinctrl_smc: pinctrl@2a2820000 {
diff --git a/arch/arm64/boot/dts/apple/t8103.dtsi b/arch/arm64/boot/dts/apple/t8103.dtsi
index 8b7b27887968..59f2678639cf 100644
--- a/arch/arm64/boot/dts/apple/t8103.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103.dtsi
@@ -916,6 +916,12 @@ smc_reboot: reboot {
 				nvmem-cell-names = "shutdown_flag", "boot_stage",
 					"boot_error_count", "panic_count";
 			};
+
+			rtc {
+				compatible = "apple,smc-rtc";
+				nvmem-cells = <&rtc_offset>;
+				nvmem-cell-names = "rtc_offset";
+			};
 		};
 
 		smc_mbox: mbox@23e408000 {
diff --git a/arch/arm64/boot/dts/apple/t8112.dtsi b/arch/arm64/boot/dts/apple/t8112.dtsi
index 3f79878b25af..6bc3f58b06f7 100644
--- a/arch/arm64/boot/dts/apple/t8112.dtsi
+++ b/arch/arm64/boot/dts/apple/t8112.dtsi
@@ -919,6 +919,12 @@ smc_reboot: reboot {
 				nvmem-cell-names = "shutdown_flag", "boot_stage",
 					"boot_error_count", "panic_count";
 			};
+
+			rtc {
+				compatible = "apple,smc-rtc";
+				nvmem-cells = <&rtc_offset>;
+				nvmem-cell-names = "rtc_offset";
+			};
 		};
 
 		smc_mbox: mbox@23e408000 {

-- 
2.51.2

