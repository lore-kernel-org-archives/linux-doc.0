Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C393DE423
	for <linux-doc@vger.kernel.org>; Tue, 21 Apr 2026 20:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776803075; cv=none; b=D2by9JRwC4hYyDwWrFY/9GuE71TZjvMlGJ/PU9GU6w6tvy5BAdnmFLfTKjSXUVQSvJUU9YZR8SPSbwPvq9yeK8M0bV6KxqpOxU42Ml9qDjaHXXuP6jDx9ySG3J0WNF0U8Uxj9auTvE3QIgfRLL4yXloHSm/Y/Z1VL+e84wPS7G0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776803075; c=relaxed/simple;
	bh=+LNOv45vrQbMiDCXtxIdZ1Z4wULCgyg45rbtYEUkz2k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XMGXiTO8rHJvou6NWlKUSoakLasr+KoRAx9OqeCKncfvDUeQfWT4Qrb9DhYyk0hTjeixUzqQJzmOflMjp2Z6xb2yuiKXbNqqqrW9+GHK1Lodldd+Hy0dlXOEv8dxcu/Cl0ePK4cpNFLxvQwdAp/A/ijUZDazJ4gIuhJ4LPVLU1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=phOmhqZv; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="phOmhqZv"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso26063225e9.2
        for <linux-doc@vger.kernel.org>; Tue, 21 Apr 2026 13:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776803071; x=1777407871; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=prSl3YomUAP/O+c4YIncfvP9MWtenSiESKpVMQ4hE6Q=;
        b=phOmhqZvRNW3/gvKWq3/PhaBaw0k142a764RBetik1hf+7yQ9283sqgnbursCsNBYM
         ifasrsYk3eHbmCgFiGf1SdPUBItOp1a5J2F7951CTd4l0vb4vrNBrlfqbQsGhR7Xd2Qb
         N4dXl08iKTGYpEBA2z03Oay4nFNWny1xGhF2PwDzCLzK5Ni4BAfbhucwphehzCM5Xles
         gs7YsXVeu9bEGOB3nVgbtnjUkKi3NMcFVEY0SifqGzEMSc/OIS8n3E3QW6h+arTtoWfe
         QAm6WXMFfwB6wGRESLuQWSsgQNddncBlyeeeOfbgeuZMC5DVrwNf6kNChH27ZYMSyunQ
         vlwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776803071; x=1777407871;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=prSl3YomUAP/O+c4YIncfvP9MWtenSiESKpVMQ4hE6Q=;
        b=KO9FcFPHUMdA1ifu2zNLgiqoJTWxukguhjXVHc1NC5xvwQSCFAMuMwq6YMpZSx5u12
         OlnW0tlpgHAfay3WItML0jw0RIOeP3VhFKe0joaRk10ZZPtPtfDGxqbdnGWGtnPaqRMS
         Flb+j+8a7OSWEUaYiIddN48JeXQVJm93+fYwYR92647n+1h9ZWAuTL8vNEvJZZNozvJk
         4RYzfhRtZutuS9jVaMpWFY5XSlk6n7Hz3V6nFO1XuUj/vFfKmORWpkUiedb0gAAQ5Vwk
         ihpP7EEZ3qG0MpawgrteHGZbMtA23WvKeTWrhMk61go6jF9WlJGFrrtwpLkQb5Iwo/8q
         6+DA==
X-Gm-Message-State: AOJu0YzSeerBgpm6T3R6ILNGqjwDJwpbLouDb4xp4Jxo6RkTdGqaQqth
	CLGdDvSb7CEGZfU8+uQYdQ8HhD8DN+ZlfOfIfPy9AZbEQElYESmqfBQN
X-Gm-Gg: AeBDietEaDca0JUy0RgAScxMSQX5HE+YU6EaBrRfto4fh/26+DUm9gKkKJ3BeKwnk7W
	cMhG3hOPT0KKUQh2zZS6vqvhhWq4MtWzA8DifNAvJlru6lq0NrJOBlaV2tohFnynW7uvWIgAMD1
	p5wkt3RmMfFfwd0he+lAkotiSuVg0W2vrKYz+IRmIZmhZfx1T74kEYgG5GAisH53Y+vCynHnZ8W
	vL/FaUPavbBzXsBWkXalwsOfwTQu1bPpiWEjr4Ct5/bOO/90h1VpSkTrGQac6B/yZf2M/ogJwDx
	3f843Z5zNRe69huG+qiDzQ17yejeBHv+J7hwxxM5gsQy+ol68vDl88XXLUY5/SfF4NzqWMc0dOO
	TDsD285KC+r+gEajdpaaAPt6FGE1GDRNM9XETaVKuYQxivLw74IthfK4pYogyetx3bNb/rpV/V+
	DFGco+ZvjvahuGLP9nZkXtrcu0QdXbjnP8xD9UCPIwE4jb
X-Received: by 2002:a05:600c:c0c8:b0:488:a824:fe04 with SMTP id 5b1f17b1804b1-488fb787bfdmr213701545e9.26.1776803071290;
        Tue, 21 Apr 2026 13:24:31 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.227.85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc0f82bbsm655989805e9.3.2026.04.21.13.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 13:24:30 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Tue, 21 Apr 2026 23:23:15 +0300
Subject: [PATCH v5 7/8] ARM: dts: Declare UARTs on zx297520v3 boards
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260421-send-v5-7-ace038e63515@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2509;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=+LNOv45vrQbMiDCXtxIdZ1Z4wULCgyg45rbtYEUkz2k=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBp59zXfrQzEUhybTMkuA5I94/3Ymni5D6AUZPwC
 aINr5DnuqWJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCaefc1xsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiIQLBAAh13d/JcWPxwb69Uu73n5XpfiUQ8mnSS
 jTntxCjqPXK4oMz2E6WWElqupU9dACH3H2OwKhUt4gX31WdDFm5uhI/zaXfY0IinGaI3Zvm8nVJ
 ySf/MATiAvZ4zlu1Y0SrQIcYLGtu+/ZNa+C3OziXKgQndPs9pHGQgrcQi5WSYoGYGIugmEUJgza
 9xgnC6N81uTZ5JHFF5AO43J4EpHi/sdgcMzh1HW93NAmKbMfdJA7eRyj70Qg8sOU0DSMrLY6gYl
 WGEfZ1JdnKuGovZpgCzN6bjOPUpS86gq+1sm1S5uUkQdrsYkDHYjD5qYcYOVw0P5/92/ZExfaTh
 wTPr1DzMeIMN4hJqcRwbK4mPrMosRnfPnvf8Rm5bPP4BAZZUIsKacTAYBMCTmB0Y/uywOsbFyul
 bFEZBPdT+6FiGmozmvdzRVcsaKI4Mt82WstZTJPzzxKiESlehgZ41wwJuzydwGe+foprt+IW/+U
 guJu8ff/D6qrdW/2jM1BxM2amnNfJYj8huLkoeK0iOFVNVCWKGu/Sh3/wBe4dP8pgQXeeZ/ZTzx
 cfRPkEnGBQ8vu3E8D7uEWyf8hK/eXqD9WLskT5FpXn/vHz8sVZWuc5IjMf2c+w1bAdrKAEiTGQR
 GIcqUtRIb31dHmISZVwQ6G0hrTHPM99QmoF5IvKMQGWRREWSsPOI=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

---

Changes since v4:
* Declare all uarts
* Remove the UART aliases for now. I can revisit this when I get my
hands on a board that exposes two UARTs.
---
 arch/arm/boot/dts/zte/zx297520v3-dlink-dwr932m.dts |  4 +++
 arch/arm/boot/dts/zte/zx297520v3.dtsi              | 39 ++++++++++++++++++++++
 2 files changed, 43 insertions(+)

diff --git a/arch/arm/boot/dts/zte/zx297520v3-dlink-dwr932m.dts b/arch/arm/boot/dts/zte/zx297520v3-dlink-dwr932m.dts
index ac20215fddef..1700f46aba86 100644
--- a/arch/arm/boot/dts/zte/zx297520v3-dlink-dwr932m.dts
+++ b/arch/arm/boot/dts/zte/zx297520v3-dlink-dwr932m.dts
@@ -16,3 +16,7 @@ memory@20000000 {
 		reg = <0x20000000 0x04000000>;
 	};
 };
+
+&uart1 {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/zte/zx297520v3.dtsi b/arch/arm/boot/dts/zte/zx297520v3.dtsi
index 903050c684cb..ca65797ed926 100644
--- a/arch/arm/boot/dts/zte/zx297520v3.dtsi
+++ b/arch/arm/boot/dts/zte/zx297520v3.dtsi
@@ -20,6 +20,15 @@ cpu@0 {
 		};
 	};
 
+	/* Base bus clock and default for the UART. It will be replaced once a clock driver has
+	 * been added.
+	 */
+	uartclk: uartclk: uartclk-26000000 {
+		#clock-cells = <0>;
+		compatible = "fixed-clock";
+		clock-frequency = <26000000>;
+	};
+
 	timer {
 		compatible = "arm,armv7-timer";
 		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
@@ -60,5 +69,35 @@ gic: interrupt-controller@f2000000 {
 			reg = <0xf2000000 0x10000>,
 			      <0xf2040000 0x20000>;
 		};
+
+		uart0: serial@131000 {
+			compatible = "arm,primecell";
+			arm,primecell-periphid = <0x0018c011>;
+			reg = <0x00131000 0x1000>;
+			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&uartclk>, <&uartclk>;
+			clock-names = "uartclk", "apb_pclk";
+			status = "disabled";
+		};
+
+		uart1: serial@1408000 {
+			compatible = "arm,pl011", "arm,primecell";
+			arm,primecell-periphid = <0x0018c011>;
+			reg = <0x01408000 0x1000>;
+			interrupts = <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&uartclk>, <&uartclk>;
+			clock-names = "uartclk", "apb_pclk";
+			status = "disabled";
+		};
+
+		uart2: serial@140d000 {
+			compatible = "arm,primecell";
+			arm,primecell-periphid = <0x0018c011>;
+			reg = <0x0140d000 0x1000>;
+			interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&uartclk>, <&uartclk>;
+			clock-names = "uartclk", "apb_pclk";
+			status = "disabled";
+		};
 	};
 };

-- 
2.53.0

