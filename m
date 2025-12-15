Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07FE432ABC8
	for <linux-doc@vger.kernel.org>; Mon, 15 Dec 2025 09:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765791546; cv=none; b=SWaqvGaKvqdQbcOZoMrAUurJs47LSEd0IhpliqzKqqbt2HuutqNI/Pf+qDDg2uoTEjUszcH91mZK1l9kE2ablAcQjePmhZyEcitNVQFl4unq1+hJquXEg4UeXzN7IMRphZ9FXOy21du283hzx5i7UYTUwyfnk7YXkSCSFkF9EzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765791546; c=relaxed/simple;
	bh=WBSnoWKU3AENu5sDkwxg1gyjDJ4F54vrwnNIGBo3bkw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aTOLqKszrHOcUkqKTZvARDAZUeIK5Uf7EdkIfw0Hsn6BCSSWgTNBvqisjoa+4j+kxFdScN8o+c4MvBV0/o8o1lO5xARojkZtXSt6Lb/QdmKCrYO0ontpwSZZU8yfLGaGYxv/fNXG3r6Jz/+pXDaRd5KEjtU1kXM0YflLntHW3mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LWiv9h5N; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LWiv9h5N"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-29f0f875bc5so42697575ad.3
        for <linux-doc@vger.kernel.org>; Mon, 15 Dec 2025 01:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765791543; x=1766396343; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2bGUzMeLW/JozQ7jHBnhOnIeY8glII+n/t0VKsxF74I=;
        b=LWiv9h5NPkdPTPN/enXqezb8Pq4z+0tLzwCmTFGGHQcM2DL85g3TcFfKKB2l5qkKrd
         jsYcpuGhKGCP8pA05hhNf3IqjVhYvfWiPf0PFMYQh2zXj3mEWI1tRUE0e+KQwPekN/0q
         +9xfu2zSodjdVtrmY3pDqOy3P9Bt8IXQuF04G3McFyJvyW0jjF6ndUDTJSElXY8w3bNj
         InxW3QLJmhNdvB9AeybQXk1zD/3c7yvuZoO0qkjMCocGQuO+pixVloclYFM4R4nIixjx
         D6exkb5lvcDROnLbvD8sb7s7q2VCQ+mAf0NBUcMF8sIK92iUd9KjrSQyxLUqtdIFDqFc
         7b7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765791543; x=1766396343;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2bGUzMeLW/JozQ7jHBnhOnIeY8glII+n/t0VKsxF74I=;
        b=fF/GEYxO9mkZ5Nr/rTZtjToMqKEREER9P1l+0ugCh8CFTGaBIR+/CCgWakAPngo8f8
         OCznhzyxvMwAsV4MReoBJ+nRo7TfCldMt1A6xiDtxCedMwxDLq9HLMDRqTg0tktr+/pO
         Od8vECEg1Z5sAyJiCR0QsHyNfqquCXHh0yoD9B8n2scEsv9WYexJ+kT/HsJwv50/87t6
         OPlw7LIIpexiR7P4z6bEGseAI7NiY+PSKzolK/zqzp48gRHcLGs2VYV0klboF3QI1gpM
         p5GFzh/3ANgp4LMUQjyylx1CqJ51ojy8mx9/nFhIvR0mKaoUjQOIGg9UIVN1OYP/RYBg
         y2CQ==
X-Forwarded-Encrypted: i=1; AJvYcCVd3jsmvsqlloNslV5/KIbUMHHDVU+CFKU/ZysGuFWvAlfOj4JoR1489WLBYyAb6ZZJgFYb4Xyo6a4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTElIasOkMfu3t0aU1sSjRt4LB4eE/HOBcsHppN08LCRTi+7Wk
	veAopsJiEap2rXT4/jzbiPWO5vwb0I1JRiskPwUFpFUt7eA3JloqWPVK
X-Gm-Gg: AY/fxX4/ygzIWRUQ9axS+TtCzmxmRCDtuKvFvuPFHBcSVAI5kOa1CLMuf1nff8m7CC6
	SYcC94Fve5AZkn0XeP/tKr954H1yppSEoUkQ5yoWMDStVAarWj7f6WjQ4JSm5S+cujHHdPzZuMe
	v0JzM18JgBMyLr7dWj20+dxH/IMyVwO0WiurwSWaE4kV5TwEmtmjCXX2NOUBLpdF9JoKoEOjGBw
	Pkeoz0VbOLS+OphAbPsN/5iKNeizuzHifK8dXadwAWfR6+k8Jjjj8oIJcJgBV130ickDVXwjDrY
	sF7oFXVpp5N1lJZC+qQ73guogMkL3WMJqpyUbMwoKwf5SHlUjtBgXW7fsQ6Ra8WKQbSbD7JAy7t
	URIJXa7Ui0V+ozfZlkUrps5Yoxr/wMTg5ZusHc4AUVBHI2rykJRukwSWPpj8eRrER8wQ3D8bgSF
	FtugcPqs1otRACEim1X2RexfDbfM4mu7rSb/4XvBEXcm4bzx1f3YnH30/Jk5ziJ8cvYQ1TBlG3P
	XCSXhLd0TlJvjo0VGNh10omZEq3gp/9Y26j00OMxsJ4LDNwVuVI9Y/+e6wKJ3QU2Lk3XInyA6pl
	9fwktc2h1Ta4lg2PrZ4GGrWLnmTKku7bFPWlvGphR8l3HNmsu+4=
X-Google-Smtp-Source: AGHT+IE1ONDmMPxkmeJv8Jcwz9fHIvPtzkrv+UtHURTUiSutUD39OJoEqG9ODwNwY90PRcf4H0q9VQ==
X-Received: by 2002:a17:902:d4c5:b0:2a0:b02b:210b with SMTP id d9443c01a7336-2a0b02b21fbmr55998955ad.41.1765791543118;
        Mon, 15 Dec 2025 01:39:03 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29efd74f5e1sm113017705ad.16.2025.12.15.01.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 01:39:02 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Mon, 15 Dec 2025 19:37:50 +1000
Subject: [PATCH v6 6/7] arm64: dts: apple: t8103,t60xx,t8112: Add SMC RTC
 node
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-macsmc-subdevs-v6-6-0518cb5f28ae@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2689;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=XqyBBwDw5d8mhE2yQoV9/8OYd4bvzgC4hPOX4wfMNZ0=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJn211msN8f2hHad0eiKb84X+hTfnyV7VXJHXeN/+YV9g
 su/PGLrmMjCIMbFYCmmyLKhSchjthHbzX6Ryr0wc1iZQIZIizQwAAELA19uYl6pkY6Rnqm2oZ6h
 oY6xjhEDF6cATHVTHyPD+0CvUyukrZ1/yro1RbnqzLLbn6LQaFjJef3+56CtzwMcGRlmr667zhi
 x8ti05R2ebR0CvAtj48yMnqznmsrQW6/0t4ARAA==
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
2.52.0

