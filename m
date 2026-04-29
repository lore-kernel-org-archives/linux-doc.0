Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D820A423A64
	for <linux-doc@vger.kernel.org>; Wed, 29 Apr 2026 19:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777490080; cv=none; b=D7SlsWNpA+xC0Sbba22gdMYhoRpPNaAcUHj3Paz1XYgWUSrS57KXI+ayF/h3e8Z3Z9Zv8OikmmpKvvbM7dS4By9EIRoZ19Jio+p9Syu7t8ISuY8QE0z5wwNAvII/3leY8GGeTl1ktM5ytomv3po0g4CGyOcJoATi6pT9N2TnqTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777490080; c=relaxed/simple;
	bh=Raw3nnG6txGxRT2tuucK4Vyk8RJ3aJNJodqKknAtnWs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=etaShJtKCfwL1mYSLDxrrnCuhmBx44GDxPPZEw1u2Sdr9AmGHVeIWj05oAnC6TaFSHWj2F04Q8JPsjpOyYb7W3j40crK+uaPNGGv3zLpvpUaazTwze0c9Xq1s5q6J/+zkdfKwZ1Bygm1fq14Om9y8RyL5lmKxWQq+Y79W/BGp7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fH502bVa; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fH502bVa"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488e1a8ac40so897005e9.2
        for <linux-doc@vger.kernel.org>; Wed, 29 Apr 2026 12:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777490077; x=1778094877; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6fKUgxBCx0mNxBEJyRtsEMEQ1iRhj1qvL3+7BPzmL+U=;
        b=fH502bVa3+gNxhIob4IOre3rUEmgRL9V3GaLlY7rO7PV2KdQy69LcCjMC1osfFnCva
         +xd++tqIYgMW5ULkBNnw6F57uTJ9NDdlBLUkI2Ct508tiuCB0JPlwq/LBcSbaXNinbdV
         4bqSbNCPvXf6/piu0mgHEbbQsyqgA0co4FG1E8TbAZR3/CmftIGyYY+hko9OPzb1ifiT
         RhozoOBVBuz4w5oJUHUb8Pc0/7l79daS7WMn5AMKTdWQRrNpzbz44bRc6jvFMHRYJTZH
         BWeEdkCsrAFeTzjDKKXF7VbJMWIHAqh+JEZZS6DwG9Q1rbbkCJuHrq7S+a9WhXfwqxgq
         nJrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777490077; x=1778094877;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6fKUgxBCx0mNxBEJyRtsEMEQ1iRhj1qvL3+7BPzmL+U=;
        b=hGif5iKbzRSj4SPdLMsDeyABsZ/LPQpuK0OGiWdqH35L0x8j/EjNL68pJL0bM5+1Bg
         4ta35tdbpS5IiaHa3qk4tiGsgB++BRmdVveaASIGV18J03y0YWV52iIGO2qadxteeiDL
         r79jGNsEpRaMJ6UOynBW41iJdNb4isj8LNbQrLbETb1EFXiwc3BId7uS1dNGbd2j58fO
         7gjYqatpobaD/xmXVSbNDXnWNbtFIck9Vso4UA5ZnAxdKNG1JiVmwMtgPoUtBVOgrRj6
         4vyc3Y8I35VZdCZYeW6R3B1fqg0+pIl3YhbSBsZ7+VbyFWfMf7nGd2ayCvJBfgaZCuWb
         4aKg==
X-Gm-Message-State: AOJu0YxOeJFvHc0znYLq65hPhmx8AcGb5XCWKYdBHq2uoLNz4IabeIqD
	XHacsc19Dow47TGpFkYdeIuo4Wy7poQwV4SzRpcu5capxh8EiIu0lV7g
X-Gm-Gg: AeBDiet7HRToL3Gn7swNtWvThtLv0YhMIkSKBGnM/v9h8LSHhDAkBKPeqNiNTRHzFI/
	bq09K6yk319qbrQBp/Gz5h2SMpG+f9+IDBsDZj7Mg9sactfNG9kGf9vT66kjFA3+Ri1salCh48O
	nakyN4b/oO8LSA6csWhdG5hSAjsXd8JHUuMTESnXVSjf5TAPQKnhsn5mQ8LuTg8zjMvbRrLytxE
	mHkwNQGPhMFKQSHRRuf70Z/yWMTeJCgdeqbyt+tkw23+3gbp/EUZRkkJGklCiVVpoJxcalEH2Kd
	lWgwB7BvM720ukWpeLkZrdD5fPHl+9dosBVm57i8WnR06rXL8GQQh/xMojVTtic0GVczOrHUfJv
	4o2lU9XvlBmcbp8ahn2Fpl/lQSoM7XZhdR7Ms8CAD8XJjJvoDwmn/PNtOZwFIKqgZuzZQ+FmAcJ
	7Av1Z33Bk0qLaNPVcBEPKtT0JVC465aAImqi/RX/uJDFE=
X-Received: by 2002:a05:600c:630a:b0:487:1fb4:7e1 with SMTP id 5b1f17b1804b1-48a77b0ee3emr168084865e9.22.1777490077103;
        Wed, 29 Apr 2026 12:14:37 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7c316d7esm23315005e9.24.2026.04.29.12.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 12:14:36 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Wed, 29 Apr 2026 22:13:17 +0300
Subject: [PATCH v7 6/6] ARM: zte: defconfig: Add a zx29 defconfig file
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260429-send-v7-6-b432e00d2db8@gmail.com>
References: <20260429-send-v7-0-b432e00d2db8@gmail.com>
In-Reply-To: <20260429-send-v7-0-b432e00d2db8@gmail.com>
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
 bh=Raw3nnG6txGxRT2tuucK4Vyk8RJ3aJNJodqKknAtnWs=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBp8lh1EhYS/FI32IlxLUBQvJ1l9b49Dbf2N5b5b
 0+0yQRveI2JAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCafJYdRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiLTUQ/9H4sDaDcI8rzJTKhDFNRttj29vxe6POt
 eevQdOL+WQaWNV5Iq+5n/XsbP0bp2cuqUwCUbr8sRr+s1kFz2TB0YjWQCjT3eLTpU5F5xZ32V0n
 LM2hx7oOK5tvlCn8EScXp2v/0t3G+WwS+PJT5JkKKJj670Z+5PbBWmdkRRqR3eCZ8LkVWsJAO3y
 T6ya+d2yGv+jVfZmp6Cm7nsdVINKlFQ9bKmBEqOHwXwpNK35xPEsHUqYselJ7Y6ijIHTAQWSPSs
 m3HtYNJPJcw2how9p084rusWqFS6qVPgWGEBCEZ1+5Y2FdKepgvjuVRUqAOUxU6EOBIVKYz+Zup
 ksAoJGRzMC/o2/w4J7l9+9Eyqv6UdS3yu3HgiBloNGM8fiQDDFDkI9tdLK/sn5YjiIaSs96IY3H
 MrPisngXDE6JCyVlGzNlHzB1PZZXYm3TiGr8Lw04HhyawjbA8bad7k+IpOJmFlGULDQ4ais+Tkx
 4ByKHcTaCM9V7eUzaK2vsVsDGstcn8lKV26t78yeQ5Szmy8+uZJEUhVdjd5ue6j2JYuiG4EeOjq
 Tieiv8xSuv6EmymMgSguk0s87VQE1xZ01bcYbN84JI/M4Snh3oh9SBKL2PESxrMa0NIfilYH5Vk
 VQ6/qQIFKNYuUoKSGqwlOh9qd8IC9QthvqlEMv8q/soMTaUMkvFE=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

This enables existing drivers for hardware that is present on this board
even if it is not present in the DT yet.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

---

Changes: v5 to v6: Regenerate the file with make savedefconfig.

An open question: What's the appropriate name? zx29_defconfig?
zte_defconfig? zte_zx29_defconfig? There's e.g. stm32_defconfig without
an extra mention of STMicro in the name.
---
 MAINTAINERS                     |  1 +
 arch/arm/configs/zx29_defconfig | 54 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 55 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6f51ba1c5ada..5dc52b84cc09 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3776,6 +3776,7 @@ ARM/ZTE ZX29 SOC SUPPORT
 M:	Stefan Dösinger <stefandoesinger@gmail.com>
 F:	Documentation/devicetree/bindings/arm/zte.yaml
 F:	arch/arm/boot/dts/zte/
+F:	arch/arm/configs/zx29_defconfig
 F:	arch/arm/mach-zte/
 
 ARM/ZYNQ ARCHITECTURE
diff --git a/arch/arm/configs/zx29_defconfig b/arch/arm/configs/zx29_defconfig
new file mode 100644
index 000000000000..54fa62ed56e7
--- /dev/null
+++ b/arch/arm/configs/zx29_defconfig
@@ -0,0 +1,54 @@
+CONFIG_SYSVIPC=y
+CONFIG_BLK_DEV_INITRD=y
+# CONFIG_RD_BZIP2 is not set
+# CONFIG_RD_LZMA is not set
+# CONFIG_RD_XZ is not set
+# CONFIG_RD_LZ4 is not set
+CONFIG_EXPERT=y
+CONFIG_KALLSYMS_ALL=y
+CONFIG_ARCH_ZTE=y
+CONFIG_ARM_PSCI=y
+CONFIG_ARM_APPENDED_DTB=y
+CONFIG_CMDLINE="console=ttyAMA0 earlyprintk root=/dev/ram rw"
+CONFIG_CPU_FREQ=y
+CONFIG_CPUFREQ_DT_PLATDEV=y
+# CONFIG_SUSPEND is not set
+CONFIG_PM=y
+CONFIG_BINFMT_FLAT=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+# CONFIG_STANDALONE is not set
+# CONFIG_PREVENT_FIRMWARE_BUILD is not set
+# CONFIG_ALLOW_DEV_COREDUMP is not set
+CONFIG_MTD=y
+CONFIG_MTD_BLOCK=y
+CONFIG_BLK_DEV_RAM=y
+CONFIG_BLK_DEV_RAM_COUNT=4
+CONFIG_SRAM=y
+CONFIG_KEYBOARD_GPIO_POLLED=y
+# CONFIG_INPUT_MOUSE is not set
+CONFIG_VT_HW_CONSOLE_BINDING=y
+CONFIG_SERIAL_AMBA_PL011=y
+CONFIG_SERIAL_AMBA_PL011_CONSOLE=y
+CONFIG_SERIAL_DEV_BUS=y
+# CONFIG_HW_RANDOM is not set
+CONFIG_PINCTRL=y
+CONFIG_GPIOLIB=y
+CONFIG_GPIO_GENERIC_PLATFORM=y
+CONFIG_POWER_RESET=y
+CONFIG_MFD_SYSCON=y
+CONFIG_REGULATOR=y
+CONFIG_REGULATOR_FIXED_VOLTAGE=y
+# CONFIG_HID is not set
+CONFIG_USB_DWC2=y
+CONFIG_USB_GADGET=y
+CONFIG_MMC=y
+CONFIG_MMC_DW=y
+CONFIG_RESET_CONTROLLER=y
+CONFIG_RESET_SIMPLE=y
+CONFIG_JFFS2_FS=y
+CONFIG_PRINTK_TIME=y
+CONFIG_DEBUG_LL=y
+CONFIG_EARLY_PRINTK=y

-- 
2.53.0

