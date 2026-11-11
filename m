Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794413803;
	b=1BnLXq/c0uC9keDX8WW+14KqgbQgox7/R0qa4W23cgOTi2LaJKJcjaLurZ44PmpMQarc
	 xTlNUdG8kPGW9FW0r+KjQsZ79cKh9gU8MmPRAO8ELOIWsap8NmIkjhhjPDBdYCp26WlC3
	 hlWdsx5+N/gqW0Q7Tty1zBvqpgoijs9Ivc78gVtZxAfZuloRmO4B6P21b+aT/yW8KFQxx
	 6YUPmOTGD8F9Y1tOWQZ0dI065JgDFIVqkDhcSsiR0Ga3gaQusvyhp9tAWHRVixIwGevTw
	 SSm6CXGFUG1awIr8CgRAvWul+4arSceUkrAZyXQnHnfMFE/fzqXv/1QxZ7/WTPoO1yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794413803;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+dRaeVfgsyPtrbZOsuqy4B0zrN0QNLB0gPpKiOiCtw0=;
	b=PB26OqLKUTYXYq9g0SivccinMU9bDLR0jtKP2BUhxZbCFlPwHT3DMK3cgx13gG9d4Fe6
	 6cU405M33OKQappfJtXCJWy+qtzNyu5fjWMXMcCCjBHs6utNrFoP8pkklEtlfpHN5a2zm
	 OA/xEgU2sAvbIgo/dMHt+MjaJ8fsyl3HD5kdlNHqHuWY3jVXJqmo3iFdNNwVQcFrNZh06
	 DkA9Io0Bf2bgEEUA/JTMAZLA1KtYmHLrZClA3NFhC45OJUGun9rX0WuaOT+IxHEeHCpdO
	 RLqRAc20EfM6EEwFAOeaYBHqwCn/5ILt4+6YZk2BkysXJfjRrs8SeHbx7SQX0ecrNgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sartura.hr;
	spf=pass smtp.mailfrom=sartura.hr;
	dkim=pass header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b="CVimmv9/";
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CCF4606A887
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 16:16:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CCF4606A887
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=CVimmv9/
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so33007915e9.3
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 08:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1794413801; x=1795018601; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+dRaeVfgsyPtrbZOsuqy4B0zrN0QNLB0gPpKiOiCtw0=;
        b=CVimmv9/YyZU6AJwXGaip7fVyORgOVY9vHCD0+v9Wsq2yB1Mgho/tn/ThCTYFKNijG
         oV0p33U2a1daomR19trtTfpeUBCWvFTNi4+juWIcEu4kjy3hQ9AurAVAfbuEBQh0qie/
         3g0dDnORCF42d1HF4U+O4bx10ZDDeqbDtc/+bNWE68IhE2Dw1dB90XPgmcbClpwLelqw
         se75rKSVFNADxNyHo4nwo2YKPPUlO+TizaKYzva+wrIt2vlopEERzC2WC/Aw3fVFU8v2
         f5ctqoTruT+DUYX7023GtjqCUtLnlcE4np1oDxg3RJpbzwn9cw5iwvdZ6MdDjer2XkYF
         afYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794413801; x=1795018601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+dRaeVfgsyPtrbZOsuqy4B0zrN0QNLB0gPpKiOiCtw0=;
        b=RHinipYUEB0RwaIDHg5On4Y+MWB8CiVLlVt3ML+KGTdg6OIvDb3o3tGgYSkC40l96X
         ZI6t5X9eA4YjpAP53/jjr1KZ6XFBpt6k5zaMxg8SmA3rQBDHMyoTI1bxc/zBLC6IFzEz
         phFifqD0tRYr8KJDJF/XS0x54iuml5+5zYR53SJ63xvB942NczIuMwuzI+H/W+dHQ3uk
         Bxq2/B86ogyRxJDx6zTIiN5nOAh2YzotTu/m4vCZ1u/KG/P77BctYvigUp0O9eyINYTT
         rIgvIvaOSrSbyaHfDMq+VqbQJZx+lo+UVL/fBzFmI977PhDaKFRzM6HmSUUi3FcTcwlw
         sFPA==
X-Forwarded-Encrypted: i=1; AL+hErGbkzRuhmpyMTwcjGvg79CgJltcte8ESFpiMZhgi+3ubyVHuj8RzmlbEFEP2ALizJXqw6mEO0oucqk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+JlgIAhokq19qVWD5vtpnb5y6MzWJOuhU+6VesXV9kAPLJmIAq
	eX+c7cIz7Dc2AHbRh5lQ9327SYAiywU0MmGSzKv2W7fptKkHRGaGk+n2LzxfCsVopFo=
X-Gm-Gg: AYBFou0a1hYJcsIU8zKBxthBPsxQwEXV4XJMDMottU+9AIs2HeKAxfoh1zTizi7v1yE
	hO/Rjnfv+CmUK8gpKrMoPuDpsSsw5MYOVPoaKTiz/fYHWpX9paIwXrBgNZmd794A63y6kOsAMqU
	7e5Y3NIp0H5VomrnZ4iLjD4oc9aDfK/XUlsn1B/aO3f4l315yJuJbBK/vVicy/VVL/oaCWvvq/w
	1sTfqn0/ZDQ3wl5HyefKyIk9jy6KJ+4TMy+bEamOP7JcPsVvhHMJ7yRLtMoF/Dj+smowIhcMLyT
	zUnO/sRU2BlaCHd3tte6j+9bZmbcRc9UJZxZ6+1NAHe6aH65pbjNxJmfQgcUHUq/2+L/q/+7PXz
	7TQV+XsTE46YY1DNXoGec/WxCYOxT+iShYfOu339/o3gyHhH0DxOTiBsun/I0gDBj6/xVKNLhp2
	qNqxUXyH2Flu2Gb54zvLNeWiWZcQeK0z1ceZaDXozraC+16SfZMzyNo9Ftb6BhE1jCLBRy1vNWu
	JUs4gDDM739X3bbUhkozT4c5hP1e79zB5/IGFX/548HVU9ddwWtGTlCX7MI1kkRLHBFA/wYB164
	9XxxMYnQUA0oXLWR+UFnUevAan7LPT+VcmIOs++Kv0OGXeyKIS2YTqbotC1n1/qfe+tk612eQvJ
	Y2x0vD6uujm3HcbCR71/gYh/Euu6R0rpWiozOtIYK3S+v9IcUfhxtYMcmzfRZS1sh4VIddNEQ1x
	bbJZMVpfk/WuhXThQpC2LQEBJWp+Zc2dGZrtxyD5LUpdBw
X-Received: by 2002:a05:600c:1986:b0:4a2:397:73f6 with SMTP id 5b1f17b1804b1-4ba09379b69mr50759305e9.8.1794413801590;
        Wed, 11 Nov 2026 08:16:41 -0800 (PST)
Received: from threadripper-fedora-workstation (d-zg1-240.globalnet.hr. [213.149.36.254])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4c52fd01sm8374925e9.4.2026.11.11.08.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 08:16:39 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v3 4/4] arm64: dts: microchip: lan969x: add fan controller
Date: Wed, 11 Nov 2026 17:12:48 +0100
Message-ID: <20261111161619.232141-4-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111161619.232141-1-robert.marko@sartura.hr>
References: <20261111161619.232141-1-robert.marko@sartura.hr>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

LAN969x provides a PWM fan output and tachometer input in a register
block separate from the temperature sensor. Describe it as its own
fan-controller node and keep the temperature sensor compatible.

Connect the EV23X71A fan to the controller and route its pins. Use a
25 kHz normal-polarity PWM for the board low-side FET. Set cooling
levels so the fan starts at full speed.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v3:
- No DTS changes; renumber from 6/6 to 4/4.

Changes in v2:
- Split the fan controller from the temperature node.
- Add the EV23X71A fan child with board-specific PWM and cooling levels.

 arch/arm64/boot/dts/microchip/lan9691.dtsi         | 7 +++++++
 arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts | 8 +++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/microchip/lan9691.dtsi b/arch/arm64/boot/dts/microchip/lan9691.dtsi
index 52c22dd1a15d5..039c2014aa341 100644
--- a/arch/arm64/boot/dts/microchip/lan9691.dtsi
+++ b/arch/arm64/boot/dts/microchip/lan9691.dtsi
@@ -522,6 +522,13 @@ sgpio_out: gpio@1 {
 			};
 		};
 
+		fanctrl: fan-controller@e2010348 {
+			compatible = "microchip,lan9691-fan";
+			reg = <0xe2010348 0xc>;
+			clocks = <&fx100_clk>;
+			#pwm-cells = <2>;
+		};
+
 		tmon: hwmon@e2020100 {
 			compatible = "microchip,lan9691-temp", "microchip,sparx5-temp";
 			reg = <0xe2020100 0xc>;
diff --git a/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts b/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts
index abb21a8bace9e..3cbe5beebce1d 100644
--- a/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts
+++ b/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts
@@ -775,9 +775,15 @@ port29: port@29 {
 	};
 };
 
-&tmon {
+&fanctrl {
 	pinctrl-0 = <&fan_pins>;
 	pinctrl-names = "default";
+
+	fan {
+		pwms = <&fanctrl 40000 0>;
+		cooling-levels = <0 128 192 255>;
+		#cooling-cells = <2>;
+	};
 };
 
 &usart0 {
-- 
2.56.0

