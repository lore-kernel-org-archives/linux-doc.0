Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D553DD537
	for <linux-doc@vger.kernel.org>; Tue, 21 Apr 2026 20:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776803059; cv=none; b=n+SNZmPQ6izVyN1IqD4ELXXWs4PYsM2etAfzsWK8loa5S6knpcl7V1avJ+L0sfrEsudLm86mYl8WKBaLmQj9dqVyik9Vp+RZGCNZuMdrNXA3N9IUqnxwI2NBe2Fc02ytSKJW0Cm5qkLTXhGsByw7NJWWE0x/ibNfVw0Dlpm4548=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776803059; c=relaxed/simple;
	bh=bcZL6JaMJmYjP1GrCucF3MvLsGgnYnN6AERlSCKFxuw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t3g/hXTloE45lx7VCpo8sZjAPfYi1ARVEHfqOKx2qXCjyJedWMEZxqAhorfEBFbXhnV2oyfYlrcJByxj2/eS0TT8PZavyYfbv+Y6NlTkLkAtOkjXSBAuuu5JzM6QpI3BR6/w+m/KCfF3mVHA2u+2+/ckYOsQ4Pn/CSFQcR1MN6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=brkvMHfj; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="brkvMHfj"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4891cd41959so27631525e9.3
        for <linux-doc@vger.kernel.org>; Tue, 21 Apr 2026 13:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776803056; x=1777407856; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hrKQc7l+XFg4iIUWlxu0BOHb3VOIwsvvvVOXDcvZfFI=;
        b=brkvMHfjcZqDET7b79OMCFsKAy6vrP2MNCwMlRBim13ohygZMblsiu7VFSn46DCTJH
         FPi42AT+vi7q5tA953o9VWFwz6kvs5HLtHKuGC1DroY7zswbg5fHhGQVMgBnmdvxSYM9
         EInS6nGAAnaNyq7D+/ooLAuKpDPGrrYRzzWk6aSXSMpt/Bj9TV6sUufnLB2MWyVjdp/3
         WcaXgwqkW0vjLoxzC7Kjkb0OGJrmZSAWn0aB4I9+/loJ+uVZuokMK0KCq/bVJ7zLdOpz
         pz/updRTmYS2kqKOgOJOmj1fkIri6d6ka9SbV+Uem+4J7qy+C1/ziyX23xBZiDw78m86
         xOhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776803056; x=1777407856;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hrKQc7l+XFg4iIUWlxu0BOHb3VOIwsvvvVOXDcvZfFI=;
        b=UReCES7nirpIPdi2Xett/ZSh99YHYCLUJXUY3mLEKi/OCpSabro9wi5HzDzZXtAKcT
         w2mZo4AHCI5U6G0dPCWGdSdvtsmy39Em3zxppNRT3gjxyVfJJQgTdNAhtdwBGW7z+Ov5
         Tu/qnB+yVuxLcNvlGATFyFh4slp/bG/FP5nKDCN29UOaNa9i2Hbpr/HUpfhq1cZgGMCN
         KqaMl88HmI4aa4IhJflXhoC6y/O+xCRfpdbqonTYuyO8XoXquqT4ejdIz+nrVIOUMDXQ
         LwcTOdmoVruVQOzYnnc19KmtKVm5gnVEzsGu9gZTTKFfvqPDUnOTbSMiAsfYGpwNxu42
         yLkg==
X-Gm-Message-State: AOJu0Yy1FkgPOCpnp5rnaUEdlcrzRZiKxpKybIXymQdoZBnnShPhkJh/
	ayaaqLWda/QCeuOFQRDpS/00mu9kHs/bGftMskXJbjuyPHvUAUt7mErr
X-Gm-Gg: AeBDietnYwRxAbaunkdlMnE3SmBc6V3xWI8K7SZDlX7ELDFH7Xzhfx+WwiWN+7eVQiy
	Pd9vdHMG4k7cR7ueQN2XnDY03dllDPnEbX4iP1qqtoxyB5oamR2Z0EGvuK8D+qr/s8/1yG2KeQU
	Omf8Ak04j80+RQyFfPzl8dkMChrxHQ3gZ3kF//UwsyATGWdv5Vb3P5B89QNt8PEDG5Epvm0Kz4M
	FBpWQjD2OTNyciWuf5jEJe8ZbYDBC42Ly27ycbzVZfAtZ2cqbLWGP2mmzUsqtEpTGALQfW0M9Lr
	k/KjgbfwaYke1x2r1dV8fiIq5BLmxiaxPf5al0QRBK83THnwtuAy6uD0DmgP8pmMNOiTTXl7Qbe
	cOaM5L8Abk/33bkybP5RP6yvO9JfONJrcXuGhXFLA8npzBCF/suMK8WqcOizinqxPtRPnm/8s6P
	7uY+0Wfe9jTpjqggkUd3MTHvPyYoM0MdoQ+JQwsU9v0/lu
X-Received: by 2002:a05:600c:3f0c:b0:48a:563c:c8e0 with SMTP id 5b1f17b1804b1-48a563cd16bmr52543355e9.1.1776803055952;
        Tue, 21 Apr 2026 13:24:15 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.227.85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc0f82bbsm655989805e9.3.2026.04.21.13.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 13:24:15 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Tue, 21 Apr 2026 23:23:12 +0300
Subject: [PATCH v5 4/8] ARM: zte: Add support for zx29 low level debug
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260421-send-v5-4-ace038e63515@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2584;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=bcZL6JaMJmYjP1GrCucF3MvLsGgnYnN6AERlSCKFxuw=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBp59zX4XZpqJm/bAck0HkLxUrrrjMXwXBe3jhd+
 SHDrsE5S+qJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCaefc1xsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiJOKQ//cKJXPZhc6xj89Aoz835lqG/ynjMUHt6
 m+E4crpk2fLayoYewo/esnT1CN+EW18PmLWs2kxLtjPm7ivJsdINaSAt512JIMU+6Lk7RBB8ebq
 oQJiAjOmKStP5gNkjU1Uc6Ul98pwLsp/0nypp4W5wU6txNObDrPjy0YFxviB2gmzw0Qlnz+o7QZ
 gP2OP5ZOgnakYatT+mw1Fp7HxBEp7DkRBlnnsYzI9mIWqlrAJrEuW178f2GPHtb7SQ9WEmRgOLJ
 wAuR+UDtQ9QDLSRlx5ZLPsWRMDzcPJikQrqMnPUydkKOu6N/2s8XLrQANMzUFDt/Q5IepmjVcUL
 R8mIvJ2+AQNHo6GJ6BKEb0z/eeKZjymfS95I9KB7dr5ZehhWMmqu5VBxCjrTkJtW0osneBBCqPJ
 UJLk0Air00jviSGTxAQf/WTGI+bLFD2ETmiTG/sJdmtEQdPxRjp3kuhyTLMj8rYdcpKUJ6P9Gpi
 OkiPaqH5p+TiWQEQNgMJI16HYEwrHAmk1GJef/Adw+PX0Vb3AI+egyO3noWsqj+3ZwIigHOg0k0
 ATBaLiK0NtV1enGb6UP4wCPfXGpJZskWqSZk/2djdGBcDBhfuF1alsUWhz5wljPRhCFXFzmZ4uG
 NVms2xfe3dKoVbBFPyIkZi83bhOddBLuLbZUK8/QJ+sSTN9XrxEw=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

This is based on the removed zx29 code. A separate (more complicated)
patch will re-add the register map to the pl011 serial driver.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

---

I am unsure about the virtual address. It doesn't seem to matter, as
long as it is a valid address. This address is based on the old removed
code. Is there a rule-of-thumb physical to virtual mapping I can use to
give a sensible default value?
---
 arch/arm/Kconfig.debug         | 12 ++++++++++++
 arch/arm/include/debug/pl01x.S |  7 +++++++
 2 files changed, 19 insertions(+)

diff --git a/arch/arm/Kconfig.debug b/arch/arm/Kconfig.debug
index 366f162e147d..98d8a5a60048 100644
--- a/arch/arm/Kconfig.debug
+++ b/arch/arm/Kconfig.debug
@@ -1331,6 +1331,16 @@ choice
 		  This option selects UART0 on VIA/Wondermedia System-on-a-chip
 		  devices, including VT8500, WM8505, WM8650 and WM8850.
 
+	config DEBUG_ZTE_ZX
+		bool "Kernel low-level debugging via zx29 UART"
+		select DEBUG_UART_PL01X
+		depends on ARCH_ZTE
+		help
+		  Say Y here if you are enabling ZTE zx297520v3 SOC and need
+		  debug UART support. This UART is a PL011 with different
+		  register addresses. The UART for boot messages on zx29 boards
+		  is usually UART1 and is operating at 921600 8N1.
+
 	config DEBUG_ZYNQ_UART0
 		bool "Kernel low-level debugging on Xilinx Zynq using UART0"
 		depends on ARCH_ZYNQ
@@ -1545,6 +1555,7 @@ config DEBUG_UART_8250
 
 config DEBUG_UART_PHYS
 	hex "Physical base address of debug UART"
+	default 0x01408000 if DEBUG_ZTE_ZX
 	default 0x01c28000 if DEBUG_SUNXI_UART0
 	default 0x01c28400 if DEBUG_SUNXI_UART1
 	default 0x01d0c000 if DEBUG_DAVINCI_DA8XX_UART1
@@ -1701,6 +1712,7 @@ config DEBUG_UART_VIRT
 	default 0xf31004c0 if DEBUG_MESON_UARTAO
 	default 0xf4090000 if DEBUG_LPC32XX
 	default 0xf4200000 if DEBUG_GEMINI
+	default 0xf4708000 if DEBUG_ZTE_ZX
 	default 0xf6200000 if DEBUG_PXA_UART1
 	default 0xf7000000 if DEBUG_SUN9I_UART0
 	default 0xf7000000 if DEBUG_S3C64XX_UART && DEBUG_S3C_UART0
diff --git a/arch/arm/include/debug/pl01x.S b/arch/arm/include/debug/pl01x.S
index c7e02d0628bf..0c7bfa4c10db 100644
--- a/arch/arm/include/debug/pl01x.S
+++ b/arch/arm/include/debug/pl01x.S
@@ -8,6 +8,13 @@
 */
 #include <linux/amba/serial.h>
 
+#ifdef CONFIG_DEBUG_ZTE_ZX
+#undef UART01x_DR
+#undef UART01x_FR
+#define UART01x_DR     0x04
+#define UART01x_FR     0x14
+#endif
+
 #ifdef CONFIG_DEBUG_UART_PHYS
 		.macro	addruart, rp, rv, tmp
 		ldr	\rp, =CONFIG_DEBUG_UART_PHYS

-- 
2.53.0

