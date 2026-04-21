Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297463DE430
	for <linux-doc@vger.kernel.org>; Tue, 21 Apr 2026 20:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776803063; cv=none; b=HrMB3KfkhUe42DmesuaaMvwcQuSbw8+whfjGdugvbV/5sgWybdpzoC+jRuXAi4L3pfawuR39+QjQMDddltSZ2tgEHA96sgkZ4O1pEecZdRZvjdyFUMdq40w3ycdjLQQoJjx8wNd3krfR/oXQZoP4XIdpvs5v1TvAhi/vgDEhJKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776803063; c=relaxed/simple;
	bh=CEUKetRzVzn2Xnwq6XKvSjU6QTqMzQIFYZ7UZd5Gyq8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F3ABxTx+072Tn7RuS1WJdY9bfpqBLJwJ/lux4uFDipE9SeSySU0DSukzlXOsJ1JwuAxMNSbAKJdTOOCiB8pfmOHGpUlVgfZeb7A+olYRz+ojRPelcwlnJiwE7vEbjinQejfgYP1QwJNmKXZfoJr1jFJJ25STtuVxKthQoGHMhGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UDW+8n8p; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UDW+8n8p"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4891e86fabeso34085625e9.1
        for <linux-doc@vger.kernel.org>; Tue, 21 Apr 2026 13:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776803060; x=1777407860; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EBJ+hPnmdJzo3k/g70RHgYIGur+PsmZcEVdmZLkZuHg=;
        b=UDW+8n8pZKTy5M5Mw+TRx1ngXKrAGqxdOSYQn1ZwnieZ2rvZbKWcAdbJPTCQfxB020
         a+4vBlN4fEjR5B2DgDAA1iE2iH/9VnBD1+WXvgBwNGYCk7O194R8a5Iiw2Aoxnw8yMaP
         Ut13+07HlQk0JrDv2C5pB0Iwahq+NSQkpL1kFXrPvC7ceg/0ixpYzbSWPHqVPraZdKuH
         JLLqLVMNjCJZ/Q5re94H134pb8MBLanOLMT873G0lTpebfxjttSI4yljyFEEP/wpDr1J
         I+tunIrVPdl4PoFxCascWS0R+B8PDValGagLQWOyAiijEhJqWgQIYLcCITryAquLfwp3
         Eqkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776803060; x=1777407860;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EBJ+hPnmdJzo3k/g70RHgYIGur+PsmZcEVdmZLkZuHg=;
        b=DWw3mzsERqEEycWm3q70Ov74LGhYz/RI2BNMM3/EmLiNs012d7B4q3Me2ebda013Uc
         ok+XMFCRIc+DEayo2KJuzOBzhjngbji6uFevNeTbsH9+RzoLDGMwwSsJ/6ItXp6Y9SGh
         AqRiQgF4wD0owcGyfL0dKRWKpcMLalZ7JGOS+rvExW2tHGqDMc3bpNRiuYz171AsE5yg
         eGBhxxq3IlG/VXBCIyf5dUEUZ+1kGgg+y7ghPo38DPpy8QRAzRGpd8rCdbspa4dA9If4
         I5mE4EeGLrQ+bMScPSYkJFTidsdK5Fl6HNRzAlNOCReqDbCkMlkBG6VVbZWF5MioXYZ+
         +U7w==
X-Gm-Message-State: AOJu0YxDVAxpYx19BIkrn0U/3wfTGOs6UX2qJjKzj6R8kcpMGA1/HyBY
	/zru7Cx+QRN9+dkHLyW1kAjppc3tI7BTlyLYsbo76yQHjfV87r4bGVty
X-Gm-Gg: AeBDieuEKU6QcWg6zT6YgiAUgKG1UUE5MhTejNeun4Aa/p8CBAnjjKE9RkN8nqQUkcf
	AFd/+xtxLeFWEsLk+JcDY+9V5n3zsA/biFbrBtDREBWbKR3hDW28UjlwYB0oK5vybZ6/07zG8Tj
	q5nGVciv3QvnplCd82QVG/Z8FE6PWrRfIs+3jJ+Uotr/LyxV96/d0sMMjiNzKJrSenWde4F5YK+
	XonCMfSiNGV2IfJbPYducZR70hVzR2RAylIxe2w2VFitDQvgpcm2bbPmYJ0WXlalxzuDkiEQgoD
	WL37Hx6FItjt3qHsWHDRdDjG5E+I0e+CO0E/frntRqeWle6kY6boe/QTHdnmF6Y6DuY8X6C2UYD
	BNPpUea68JgQkGn/VqH6UYe1xMnS83v+XSjT4wQdKK+XYVbu9yOMYSgi6ukV3d3CNHHfVDWz8mR
	aogUV72djenSB8qJ79RTne4cOZY618f6zAzmmUMdiDPp1+
X-Received: by 2002:a05:600c:308a:b0:489:6c22:e081 with SMTP id 5b1f17b1804b1-4896c22e217mr83386305e9.0.1776803060488;
        Tue, 21 Apr 2026 13:24:20 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.227.85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc0f82bbsm655989805e9.3.2026.04.21.13.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 13:24:20 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Tue, 21 Apr 2026 23:23:13 +0300
Subject: [PATCH v5 5/8] ARM: dts: Add an armv7 timer for zx297520v3
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260421-send-v5-5-ace038e63515@gmail.com>
References: <20260421-send-v5-0-ace038e63515@gmail.com>
In-Reply-To: <20260421-send-v5-0-ace038e63515@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 soc@lists.linux.dev, linux-serial@vger.kernel.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2135;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=CEUKetRzVzn2Xnwq6XKvSjU6QTqMzQIFYZ7UZd5Gyq8=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBp59zXF6GMMLpNkq4WwPjAfftYcRTaZJtkuzLOe
 KXRFnrgIfeJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCaefc1xsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiK8xhAAldsqjYe8+3h/X86yla+u17rfI//QK+v
 +A4g3kwBFOtoQ4YkoXtFlmKNU60WhO3ldAyJruXz0oONJCiUGJVhQdevJ6gJgTGtbFxWrFd62OG
 TpeCV0pwDt69klMWhqnis/g8QTr1XydLXrExyn59UcGmkzMiT+namcriwxgM7xXxZKeDxQ9w6S/
 A9+oVVuDBIfCc7ZwisT03KEmHMnhWy/mTY/9Ggzwgu23EHu63ztG+sePZ/nAI5Vqml31qmTpgox
 18zynyLmwOSAvGMPGpnfI3bq2ldQwf+JsbyS1qRvI/lNXPTEG1AgIIlXgX0qF2r4ZRtV5GqByR0
 QZzbBYy7jO4f6n3dEE/T+hrPGJpdv8edlkFOYbEv3Pu3+2tmCIa6dup5VjLjkLMS89ERRnvvW62
 c7eWCocyYyWgow/ptUwWJ5NLIhY4XsYe67F35wFukL0irgRrfDYLaKVYNS90fEPjULHLhpYpgSn
 wwnlChwvKoS9BJLqY8a3cJszrQdI03ujbootk6HZVjuE15Jx7a/P470qo6sviolSF+rmWsA0iuG
 7qWOhsm2ToVSrk5f47Fm0rI56oD9QDQLiJFXq2IIDYNSIol8ez7QWvqlvfiPZKeCHNVVGMQYcCt
 fEy9cxesmM3Pq2mT5aNKIPDB79epR6RVMymRSpe3VxKmldcfrKLU=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

The stock kernel does not use this timer, but it seems to work fine. The
board has other board-specific timers that would need a driver and I see
no reason to bother with them since the arm standard timer works.

The caveat is the non-standard GIC setup needed to handle the timer's
level-low PPI. This is the responsibility of the boot loader and
documented in Documentation/arch/arm/zte/zx297520v3.rst.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---
 arch/arm/boot/dts/zte/zx297520v3.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/zte/zx297520v3.dtsi b/arch/arm/boot/dts/zte/zx297520v3.dtsi
index 0fff00f910d6..903050c684cb 100644
--- a/arch/arm/boot/dts/zte/zx297520v3.dtsi
+++ b/arch/arm/boot/dts/zte/zx297520v3.dtsi
@@ -20,6 +20,21 @@ cpu@0 {
 		};
 	};
 
+	timer {
+		compatible = "arm,armv7-timer";
+		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
+		clock-frequency = <26000000>;
+		interrupt-parent = <&gic>;
+		/* I don't think uboot sets CNTVOFF and the stock kernel doesn't use the
+		 * arm timer at all. Since this is a single CPU system I don't think it
+		 * really matters that the offset is random though.
+		 */
+		arm,cpu-registers-not-fw-configured;
+	};
+
 	soc {
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -27,6 +42,15 @@ soc {
 		interrupt-parent = <&gic>;
 		ranges;
 
+		/* The GIC has a non-standard way of configuring ints between level-low/level
+		 * high or rising edge/falling edge at 0xf2202070 and onwards. See AP_INT_MODE_BASE
+		 * and AP_PPI_MODE_REG in the ZTE kernel, although the offsets in the kernel source
+		 * seem wrong.
+		 *
+		 * Everything defaults to active-high/rising edge, but the timer is active-low. We
+		 * currently rely on the boot loader to change timer IRQs to active-low for us for
+		 * now.
+		 */
 		gic: interrupt-controller@f2000000 {
 			compatible = "arm,gic-v3";
 			interrupt-controller;

-- 
2.53.0

