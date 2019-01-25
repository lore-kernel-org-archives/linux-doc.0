Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5EFCE7D08A
	for <lwn-linux-doc@archive.lwn.net>; Fri, 25 Jan 2019 16:18:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726887AbfAYQSP (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 25 Jan 2019 11:18:15 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:36762 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726122AbfAYQSO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 25 Jan 2019 11:18:14 -0500
Received: by mail-wr1-f68.google.com with SMTP id u4so10922271wrp.3
        for <linux-doc@vger.kernel.org>; Fri, 25 Jan 2019 08:18:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kXfEZq52cZ0/nqk4AkmgAb2q1S2R98chAyM1XAevOXo=;
        b=ZcZ4Pgwp+nsetNADwvYWavI5DWF/gHaBCp3w2iW0cguhbDQEbkm4ArLIZ5gHZ2nOHD
         n2eu23bT55JCaib488W1/G9Ku2GaIbQtiyAX+tGPlMA4m99Wb5cflWAyaVuQrSv5b8Sb
         09WG7YER+P7BcVJUfFun1D+DVSTjJfJAWJPdA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kXfEZq52cZ0/nqk4AkmgAb2q1S2R98chAyM1XAevOXo=;
        b=a5ZiIN+q8qlgZUOyNSeHKl30F6wlg5E4c5PZGfmXHOgAHLtG6ZiHQWRuSNoPTzxrP1
         fFvghAoekMT73Km+vDpqruvdlT6blBbjNKHkFXIRSVVmp93+hlJQb6RmkoY2ulUWxk3u
         SJHhcH9Z8fMUhVuqEZvEmmTgZtT1geWeZyHsgnlmIFhEMo0JQUcLSWBIvUUMRDGAWEpu
         NioGgdE52Jh/3xc6qjcu7kQd6+WDSaTUY4aTpUuOfrBVsY70GhmusKM0+TdibSkgl9Jr
         WxJP2ojtp0Ld20rZpMDkboS91RX5nGjrVvfgBA6aC5eMjCeRpFLgzpjXnxu/NV8olvJ5
         WLwA==
X-Gm-Message-State: AJcUukcUBg8q3KXTzf2EQyMDAMGDA9+Io/mxGaY8M7Bf0MzGek+PC8bJ
        B3G0Uwfzbyg40TSWcnTY/4Y0Yg==
X-Google-Smtp-Source: ALg8bN5q2NVnuOcuW6UetfxKWmUh9viVjRKpWeXslhGgNEGu5Vxmyc4++duQym44Y/h2ZUenKUolTA==
X-Received: by 2002:adf:8001:: with SMTP id 1mr11668254wrk.23.1548433092208;
        Fri, 25 Jan 2019 08:18:12 -0800 (PST)
Received: from localhost.localdomain (laubervilliers-657-1-83-120.w92-154.abo.wanadoo.fr. [92.154.90.120])
        by smtp.gmail.com with ESMTPSA id t76sm68987212wme.33.2019.01.25.08.18.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 Jan 2019 08:18:11 -0800 (PST)
From:   Ard Biesheuvel <ard.biesheuvel@linaro.org>
To:     linux-efi@vger.kernel.org
Cc:     corbet@lwn.net, leif.lindholm@linaro.org,
        graeme.gregory@linaro.org, mingo@redhat.com, tglx@linutronix.de,
        linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        agraf@suse.de, pjones@redhat.com,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>
Subject: [PATCH 1/2] efi: x86: move EFI earlyprintk code to shared location
Date:   Fri, 25 Jan 2019 17:18:05 +0100
Message-Id: <20190125161806.13472-2-ard.biesheuvel@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190125161806.13472-1-ard.biesheuvel@linaro.org>
References: <20190125161806.13472-1-ard.biesheuvel@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Move the x86 EFI earlyprintk to a shared location under drivers/firmware
and tweak it slightly so we can easily reuse it for other architectures
going forward.

Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
---
 arch/x86/Kconfig.debug                                                  |  2 +-
 arch/x86/include/asm/efi.h                                              |  6 +++++
 arch/x86/platform/efi/Makefile                                          |  1 -
 drivers/firmware/efi/Kconfig                                            |  4 +++
 drivers/firmware/efi/Makefile                                           |  1 +
 arch/x86/platform/efi/early_printk.c => drivers/firmware/efi/earlycon.c | 26 ++++++++++----------
 6 files changed, 25 insertions(+), 15 deletions(-)

diff --git a/arch/x86/Kconfig.debug b/arch/x86/Kconfig.debug
index 0723dff17e6c..078c633771e6 100644
--- a/arch/x86/Kconfig.debug
+++ b/arch/x86/Kconfig.debug
@@ -43,7 +43,7 @@ config EARLY_PRINTK_DBGP
 config EARLY_PRINTK_EFI
 	bool "Early printk via the EFI framebuffer"
 	depends on EFI && EARLY_PRINTK
-	select FONT_SUPPORT
+	select UEFI_EARLYCON
 	---help---
 	  Write kernel log output directly into the EFI framebuffer.
 
diff --git a/arch/x86/include/asm/efi.h b/arch/x86/include/asm/efi.h
index 107283b1eb1e..79e9b5b10cb5 100644
--- a/arch/x86/include/asm/efi.h
+++ b/arch/x86/include/asm/efi.h
@@ -8,6 +8,7 @@
 #include <asm/tlb.h>
 #include <asm/nospec-branch.h>
 #include <asm/mmu_context.h>
+#include <asm/setup.h>
 
 /*
  * We map the EFI regions needed for runtime services non-contiguously,
@@ -244,6 +245,11 @@ static inline bool efi_is_64bit(void)
 
 extern bool efi_reboot_required(void);
 
+static inline struct screen_info *efi_get_screen_info(void)
+{
+	return &boot_params.screen_info;
+}
+
 #else
 static inline void parse_efi_setup(u64 phys_addr, u32 data_len) {}
 static inline bool efi_reboot_required(void)
diff --git a/arch/x86/platform/efi/Makefile b/arch/x86/platform/efi/Makefile
index e4dc3862d423..fe29f3f5d384 100644
--- a/arch/x86/platform/efi/Makefile
+++ b/arch/x86/platform/efi/Makefile
@@ -3,5 +3,4 @@ OBJECT_FILES_NON_STANDARD_efi_thunk_$(BITS).o := y
 OBJECT_FILES_NON_STANDARD_efi_stub_$(BITS).o := y
 
 obj-$(CONFIG_EFI) 		+= quirks.o efi.o efi_$(BITS).o efi_stub_$(BITS).o
-obj-$(CONFIG_EARLY_PRINTK_EFI)	+= early_printk.o
 obj-$(CONFIG_EFI_MIXED)		+= efi_thunk_$(BITS).o
diff --git a/drivers/firmware/efi/Kconfig b/drivers/firmware/efi/Kconfig
index 89110dfc7127..70335c7f0fe4 100644
--- a/drivers/firmware/efi/Kconfig
+++ b/drivers/firmware/efi/Kconfig
@@ -198,3 +198,7 @@ config EFI_DEV_PATH_PARSER
 	bool
 	depends on ACPI
 	default n
+
+config UEFI_EARLYCON
+	bool
+	select FONT_SUPPORT
diff --git a/drivers/firmware/efi/Makefile b/drivers/firmware/efi/Makefile
index 5f9f5039de50..d18cfd83155c 100644
--- a/drivers/firmware/efi/Makefile
+++ b/drivers/firmware/efi/Makefile
@@ -32,3 +32,4 @@ obj-$(CONFIG_ARM64)			+= $(arm-obj-y)
 obj-$(CONFIG_EFI_CAPSULE_LOADER)	+= capsule-loader.o
 obj-$(CONFIG_UEFI_CPER_ARM)		+= cper-arm.o
 obj-$(CONFIG_UEFI_CPER_X86)		+= cper-x86.o
+obj-$(CONFIG_UEFI_EARLYCON)		+= earlycon.o
diff --git a/arch/x86/platform/efi/early_printk.c b/drivers/firmware/efi/earlycon.c
similarity index 87%
rename from arch/x86/platform/efi/early_printk.c
rename to drivers/firmware/efi/earlycon.c
index 7138bc7a265c..c065c482d12b 100644
--- a/arch/x86/platform/efi/early_printk.c
+++ b/drivers/firmware/efi/earlycon.c
@@ -10,7 +10,7 @@
 #include <linux/font.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
-#include <asm/setup.h>
+#include <asm/efi.h>
 
 static const struct font_desc *font;
 static u32 efi_x, efi_y;
@@ -31,10 +31,10 @@ static __init int early_efi_map_fb(void)
 	if (!early_efi_keep)
 		return 0;
 
-	base = boot_params.screen_info.lfb_base;
-	if (boot_params.screen_info.capabilities & VIDEO_CAPABILITY_64BIT_BASE)
-		base |= (u64)boot_params.screen_info.ext_lfb_base << 32;
-	size = boot_params.screen_info.lfb_size;
+	base = efi_get_screen_info()->lfb_base;
+	if (efi_get_screen_info()->capabilities & VIDEO_CAPABILITY_64BIT_BASE)
+		base |= (u64)efi_get_screen_info()->ext_lfb_base << 32;
+	size = efi_get_screen_info()->lfb_size;
 	efi_fb = ioremap(base, size);
 
 	return efi_fb ? 0 : -ENOMEM;
@@ -50,9 +50,9 @@ static __ref void *early_efi_map(unsigned long start, unsigned long len)
 {
 	u64 base;
 
-	base = boot_params.screen_info.lfb_base;
-	if (boot_params.screen_info.capabilities & VIDEO_CAPABILITY_64BIT_BASE)
-		base |= (u64)boot_params.screen_info.ext_lfb_base << 32;
+	base = efi_get_screen_info()->lfb_base;
+	if (efi_get_screen_info()->capabilities & VIDEO_CAPABILITY_64BIT_BASE)
+		base |= (u64)efi_get_screen_info()->ext_lfb_base << 32;
 
 	if (efi_fb)
 		return (efi_fb + start);
@@ -71,7 +71,7 @@ static void early_efi_clear_scanline(unsigned int y)
 	unsigned long *dst;
 	u16 len;
 
-	len = boot_params.screen_info.lfb_linelength;
+	len = efi_get_screen_info()->lfb_linelength;
 	dst = early_efi_map(y*len, len);
 	if (!dst)
 		return;
@@ -86,8 +86,8 @@ static void early_efi_scroll_up(void)
 	u16 len;
 	u32 i, height;
 
-	len = boot_params.screen_info.lfb_linelength;
-	height = boot_params.screen_info.lfb_height;
+	len = efi_get_screen_info()->lfb_linelength;
+	height = efi_get_screen_info()->lfb_height;
 
 	for (i = 0; i < height - font->height; i++) {
 		dst = early_efi_map(i*len, len);
@@ -135,7 +135,7 @@ early_efi_write(struct console *con, const char *str, unsigned int num)
 	const char *s;
 	void *dst;
 
-	si = &boot_params.screen_info;
+	si = efi_get_screen_info();
 	len = si->lfb_linelength;
 
 	while (num) {
@@ -206,7 +206,7 @@ static __init int early_efi_setup(struct console *con, char *options)
 	u16 xres, yres;
 	u32 i;
 
-	si = &boot_params.screen_info;
+	si = efi_get_screen_info();
 	xres = si->lfb_width;
 	yres = si->lfb_height;
 
-- 
2.20.1

