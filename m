Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E50332EB1
	for <linux-doc@vger.kernel.org>; Wed,  6 May 2026 19:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778096054; cv=none; b=AVvH6dbVXfNdeSkNTGyfgT7ITxOC+mT4R2F+neEvQD3KvCSepC9knU7h++3vK6r5O7HcrZ/JImvdBjYVWVHBi/bskMCyzNBcPvkgGb7r5kBGXhCLk/atjykNOH7JSj6V5kgUUcKKlEPgoty/x8nz+6u9cH1lYZn6N2cPSkjEQ3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778096054; c=relaxed/simple;
	bh=fcg5dGJNBAQyU4b2cL0nA3wqgVJTqz/EfkeGsaL9qZo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aR0FMd+X0xZEGInIGLBSfGs557sfFWcMUzsZdHM3vwnwdFOIY3q83is+MKfJYLv7Yv/XRU572JvxpWKacVSoox51bP2fGXxlBRi77+7fg+s5HkyqHNEvrWzMTZsL6G2pvdCJQZO0fcFB1YZwlcoWOTVKUHsKZ+ojQ1zdDM+STNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LKKjWVgZ; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LKKjWVgZ"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-44c350a5b87so49418f8f.3
        for <linux-doc@vger.kernel.org>; Wed, 06 May 2026 12:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778096046; x=1778700846; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ilUL26n1rjGYeNrOGQ28D9s1uztNCB3AEwbB2W2pXWM=;
        b=LKKjWVgZgIjPuIEvU+thxJDZmQLzWhTsBA+LUk8k6orVYqIOJiL5rqNKi4iEoAtftH
         9xJaCK0qfa2pGQwCGhB6wcri0Jv5ys5z/EeQ5/qaJ4b75xwAFFDkH7LCU8hgZvK4xZMe
         ZDfxEyY/zkpCwKDlP99vlJPuqx7XiKzvDqyODYhCzwdDqnfkUM6fL+mFILbh5JPN7Aen
         0H3jT7YoxnXtUqN3LH1gLU9vIHQLC3acWST3nwZ+xzhSrkftzFkMNK8Vu5vjrTqvphSq
         N2j8gBzQKLg3LYR1VXJP6NcbVOQ0kTcx4Xlbdwp0HdfJosWzlLzbPxl0tNjJvpujvhx/
         6AYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778096046; x=1778700846;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ilUL26n1rjGYeNrOGQ28D9s1uztNCB3AEwbB2W2pXWM=;
        b=MX0E5RjJ236UzVicw2TUYG+MckFeYtNvGYNqJ85g84VNY7xZidTsNC+E6HdroF/DRq
         rt1zU9yRN5TFz5y6+MA8W3WKlpbwn+CommnjYTMxY1HPpDEDsj6tbgybbbt+rMK2ze0z
         N91Zk9GWYnVR1QSSa7SaFilXR8r5v6Lw6dHZGnPNvl0b+ymOGc+pskPXd3VpLgE7uVeT
         FUt6EYwOu3Zm5rId2D7AfFcnbxsHQMy2FVbnfekVLBr3Ri/rIlplr6gD/MJDtPHjXdUp
         pkpe6ZDjNAfvM2gFWinSw56XGavWgaucnDMfsTnevSWnsTYwz6WuVHMCrUEUQaIRlNnY
         Wubw==
X-Gm-Message-State: AOJu0Yxw/VGAd/8zFjUvL2cJVt6Kguz8a706V4xfRQBbTgw9+QohJcY+
	Zeb6Bb0xelHYHQ1nPYR08dNdTOkjdmrmHdjG/BWbP0jH1+iL6ExQriBY
X-Gm-Gg: AeBDieveAfFPw2CEtjvQhWsAtb5hbJeE4sHmmFXIxTuwuHO70cph3TRfjTDFWqKqvRf
	cibASOwO8UAd5AOGQLoDSxC/25WWnDMkbVjjuQw+ITL1Pvx8t4gzxJBlNZ45INjPrlVyxkZZAs7
	dN1GjVlb49M0+6uIi3xy8HlaF7oByqXIoSMqJ+l4FmiFntqg09lTdNfehz9y9Bxn9L+L4Iqi35h
	wEhGBEjZ1561DZEpMQmWR5ZZEW53WckGAs4J4nzGMT4iHo65Py/DIHpwEigzFKw/aB1ew+UP1Qv
	WZbHGzqrsu1z+2BD0sKX1vQTKNwYbInTpBdD3W9BDxV6zrY5eChoqvDv6q54CM9+m9zKx6o4bLO
	vM71CaNlIE/NXAy0gbdCyVaIARRLbIJ4z6SojfOogwkXXbSKpOb/a6EGXYUnjPwqUaSCqskAW7i
	tKXfhpR6+03Qe/QjO/HdwCO5WHIEWmQgADKZKFZCu7Ss4=
X-Received: by 2002:a05:6000:290c:b0:43b:4982:fc73 with SMTP id ffacd0b85a97d-4515c57465amr8159966f8f.25.1778096045780;
        Wed, 06 May 2026 12:34:05 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.29])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45055960022sm14895673f8f.26.2026.05.06.12.34.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 12:34:05 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Wed, 06 May 2026 22:33:20 +0300
Subject: [PATCH v8 3/6] ARM: zte: Add support for zx29 low level debug
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260506-send-v8-3-f1bdf3243b34@gmail.com>
References: <20260506-send-v8-0-f1bdf3243b34@gmail.com>
In-Reply-To: <20260506-send-v8-0-f1bdf3243b34@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2902;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=fcg5dGJNBAQyU4b2cL0nA3wqgVJTqz/EfkeGsaL9qZo=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBp+5eWHMnqBAGLcyW54UYM1CAyGLQMWIHuikrQl
 y0IeI0wWVCJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCafuXlhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiKoNg//WNV3zil9essnB/1w2NGojHfI3ct0p7k
 s7kK2TKGuBVgMsUetJH7xCF8c94Nm2AUnnEPsAnWf2ORenjfzAdvqtuDTw7JbVtCCtEoMnm8JwF
 GepqzU6j4p4z9t1hiNP615EHi0cY+N435sJnmOvXK/+WPKwThqx7rCFaakJlr4TdvuxULALOOXx
 pdqSI0dvr8DzynlLLQyc6nPmm0dGtNAZ31NkyoavEiDa6CnoZJtovW4U5OPyp4RS+NNHj+Et3ln
 Yw1qcLBkhYr3KpmzA/qxpFUtgrP1XOxuJweDcPJT0RB9I3UBl/1HpTYmt4uNEIB6QuwDaV1yjI3
 XWPKMwZ4NjPb1uuM2Y+ioJTzAxewvaXU0R1WTmsnnOU3U1qnvqfIpnIcHhP1c6kQi+IXnNyAAnh
 /TBWYv4ajE5JdtAAr0B12Ordg/FiOMm9DfDnhQnlNUaM564a93xn1iMFnH7df8Rk99mIL3kwiEf
 p01lGtGtq+w6+I0gBaDGzzgur+b5yxijspBSodKyeddnGLtUiT05+yWRkvPSJ5fUeasctGdRBQm
 O8+Dx/rgTRRYlBL+rOf5UeDw1v01Jd9dz0HokUTWomjidhZBzCYQCQjeWHWw0e1zxzPPJgugrwD
 ZHx/OHabjruoyJ6LFV/e9OCJiEfpbi+049Ae3I/wZKG+qjcNqHbc=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

This is based on the removed zx29 code. A separate (more complicated)
patch will re-add the register map to the pl011 serial driver.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

---

Patch changelog:
v8: Adjust UART01x_FR_BUSY to match the different ZX UART registers
(Sashiko). I am unsure about UART01x_FR_TXFF and my boards do not expose
flow control pins to allow me to test if it works.

I am unsure about the virtual address. It doesn't seem to matter, as
long as it is a valid address. This address is based on the old removed
code. Is there a rule-of-thumb physical to virtual mapping I can use to
give a sensible default value?
---
 arch/arm/Kconfig.debug         | 12 ++++++++++++
 arch/arm/include/debug/pl01x.S |  9 +++++++++
 2 files changed, 21 insertions(+)

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
index c7e02d0628bf..9dcdeed2357d 100644
--- a/arch/arm/include/debug/pl01x.S
+++ b/arch/arm/include/debug/pl01x.S
@@ -8,6 +8,15 @@
 */
 #include <linux/amba/serial.h>
 
+#ifdef CONFIG_DEBUG_ZTE_ZX
+#undef UART01x_DR
+#undef UART01x_FR
+#undef UART01x_FR_BUSY
+#define UART01x_DR		0x04
+#define UART01x_FR		0x14
+#define UART01x_FR_BUSY		(1<<8)
+#endif
+
 #ifdef CONFIG_DEBUG_UART_PHYS
 		.macro	addruart, rp, rv, tmp
 		ldr	\rp, =CONFIG_DEBUG_UART_PHYS

-- 
2.53.0

