Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8493C0610
	for <linux-doc@vger.kernel.org>; Tue, 30 Jun 2026 16:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782837373; cv=none; b=TvUwItsNiGf+xKXBcXiN3LAHxPJsBEgGo+y6EfXuGcWyfXSazAwFXw5pfkqtfbREsIF7+82oN4v9c5dg7Xz5S6OEy2eBDfkSRAkou0tYY6eTUOLpHVxIPGFgd+oaKW9o9UgXSAH1lQaQglxFKPB26KsD0TQtK2F4PVSV319DgQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782837373; c=relaxed/simple;
	bh=yYoOA2lmEA/zlY9ztKWvlJHJjmdn+UKneaZgldiSEqY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bmoroMsv9L0FRWd+gGp8WfyHhog5j3xLCHNq3D9yTwq1D8/dBkGprCr32T+t0tqo1i2EcHHgNXDynPCDzfuATtjCPcL9EFqVDDPnIrnIf2Onp2oymM8mzBllHfrmSB7IeHfauUjPuGbbCmXIiJKFpHSDyt87wN+V9AYz8SwSTK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=hTK6k+Ce; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="hTK6k+Ce"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-493be364394so1116985e9.1
        for <linux-doc@vger.kernel.org>; Tue, 30 Jun 2026 09:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1782837368; x=1783442168; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZXudV9Gg3kSdcIdzsisUUkPsE1uNKk24eiCajEsGRHQ=;
        b=hTK6k+CeZVPbI+e3PmRnPZKFJWxjF+IP1vSTOu630z37S/auzNFcd8wrTbj3T+bdiI
         VYoEXiBT9TUrQ1QQrrAzticYb/0kjVjueWnfUClnZ3+aq+xw3quVG5ayuDBxtL4itxwZ
         GBQMXT1+Uoo6cOibf5achTZlHOXzPNLs9fRoHMfrxtACU9Flb5zd562xFRbrfChed0Oz
         Fl3ucVRWZ8dnAHta7of1tX7HD7XFePvLaYJG/Ztj07pkEB4hdVZ1Yj8frnxtubN0mEsf
         2dQRpNLWpl1V6ahafgchXr1ziKbRuJgb7yNWW3Q1Uvp1Kh+pil4J7Mdz375ASkqZf9Ew
         MrHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782837368; x=1783442168;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZXudV9Gg3kSdcIdzsisUUkPsE1uNKk24eiCajEsGRHQ=;
        b=Qbr2yFUvIBpBlUirLxf8eM4hu/lSIWHz62yc7brVFE6Vm/cbvI9LS4sPz9l1VOJDSK
         Q3a8ZKccvJiD/TyIJWFgtaxEbEQeXKMZbg1M9vP2Zv2puMd/+9y7nxNFQbcDr1jw2p7G
         2VYfT5yBuT4RBC0LuW+5muepnMgsssBXjRIIlCfWJhYNRiDsfbYBeLP3tWKHjUGqXOva
         ah8dXxcWGJp0k+67zBkgbRBPjJls049JxVoqDEKHWdHKZtYxZOlIpoQho50oly/g/sPn
         fxe+xN2mEKOgROL6ZnFbVCvee7k29Y2hbFnxLdvCYS84awB4kv1uLEdPACoGAnBgbR0A
         vhpw==
X-Gm-Message-State: AOJu0Yy4OJeRaQHfKkiAH3b4/f3W9OIUNGyMQeDiSKI8e3AZIhWYfX2z
	l4COpG1pXZJuASgDIXwCoAzJLQ7Xm6HIRGR+Nx1v8YPQ+lU+mjorUMPyVFslW5nX7HU=
X-Gm-Gg: AfdE7cnmor/MF+8iEKqmSjt9qlfnckLJwfp+aNbvAP+tHOGPTNg1nYCUqGKKhnfvJ4e
	tuuY3/Kq1kfnDS10UceCq4HwkK7yf/pbEvTrjPU600tbuxb2ANcTZrGcdRjHdaAcXZsMtLPlsER
	FNNE6Xw/N3LYjd5MDBA5UG4A0UAzhpvaBvrHjLojvCH3nNdyyto+pF089kTbWmu8703S0lbmI7c
	nI0j7UUJ10XY1C9BGZ1taKZOq8Fo0uVZsxuqhdFDYw4H58GFpmrqdUx1e6kkBNOWBGbFdOfTMy4
	SZ9NkoAYvRJNET7NeAONWbOD5KKFBr3fxFDDx2XRg2cGgnmpZt/yuhHuXtLcEbSE62y2sPmLdiQ
	bVap/WBo8I/DbEj5PkDs/XFDk5ovreV9doywYrbuC1LeyUV6/T9ZFlaofT5RCWZsAuljP6Fr7Uj
	1AbleoZDI2NK2DlS/5o7bKgSbOor36H56VSEYgBjOAn/OQD5jl0xw1aIU8c1OjxP2NSwCoDuIfU
	4XoaxnpavxzBgryZlhwIBus5bF9
X-Received: by 2002:a05:600c:c491:b0:493:a43d:6a2e with SMTP id 5b1f17b1804b1-493bc53486emr32913265e9.8.1782837368312;
        Tue, 30 Jun 2026 09:36:08 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c5:7815:1301:f27:e3a8:2334:314d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be486f52sm8452225e9.0.2026.06.30.09.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 09:36:07 -0700 (PDT)
From: Andrew Murray <amurray@thegoodpenguin.co.uk>
Date: Tue, 30 Jun 2026 17:35:57 +0100
Subject: [PATCH v2 1/4] printk: remove BOOT_PRINTK_DELAY config option
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-deprecate_boot_delay-v2-1-f9883d36aa4b@thegoodpenguin.co.uk>
References: <20260630-deprecate_boot_delay-v2-0-f9883d36aa4b@thegoodpenguin.co.uk>
In-Reply-To: <20260630-deprecate_boot_delay-v2-0-f9883d36aa4b@thegoodpenguin.co.uk>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Russell King <linux@armlinux.org.uk>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
 John Ogness <john.ogness@linutronix.de>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
 Linus Torvalds <torvalds@linux-foundation.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, 
 linux-rt-devel@lists.linux.dev, 
 Andrew Murray <amurray@thegoodpenguin.co.uk>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782837365; l=3868;
 i=amurray@thegoodpenguin.co.uk; s=20250914; h=from:subject:message-id;
 bh=yYoOA2lmEA/zlY9ztKWvlJHJjmdn+UKneaZgldiSEqY=;
 b=tIVy2D7qSph+SB/d2oZUbUbYo/M9aCbYpqRMKAajQJAv9Y4kMRiblxvshg3oHIsoMle9n8UXV
 3syb16Mbz+VC5jBPoJ59uagKLXQ8CWPlIC1wu/1BuvVQKicQDOc3t8k
X-Developer-Key: i=amurray@thegoodpenguin.co.uk; a=ed25519;
 pk=0SU0Q8S/uEiCdbXbXS+PvJGUCaBG1nDszD+HPU3Js0Q=

The boot_delay (BOOT_PRINTK_DELAY) kernel parameter and printk_delay sysctl
are two distinct mechanisms for providing similar functionality which add a
delay prior to each printed printk message.

In preparation of combining them into a single configurable feature, let's
first remove the kconfig option BOOT_PRINTK_DELAY.

Reviewed-by: Petr Mladek <pmladek@suse.com>
Signed-off-by: Andrew Murray <amurray@thegoodpenguin.co.uk>
---
 Documentation/admin-guide/kernel-parameters.txt |  2 +-
 arch/arm/configs/bcm2835_defconfig              |  1 -
 kernel/printk/printk.c                          |  2 +-
 lib/Kconfig.debug                               | 18 ------------------
 4 files changed, 2 insertions(+), 21 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index b5493a7f8f22812833308b22f2cc35b0a42e55b2..2884103b93bca7b76cd3a93946276074cf62d0a1 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -651,7 +651,7 @@ Kernel parameters
 
 	boot_delay=	[KNL,EARLY]
 			Milliseconds to delay each printk during boot.
-			Only works if CONFIG_BOOT_PRINTK_DELAY is enabled,
+			Only works if GENERIC_CALIBRATE_DELAY is enabled,
 			and you may also have to specify "lpj=".  Boot_delay
 			values larger than 10 seconds (10000) are assumed
 			erroneous and ignored.
diff --git a/arch/arm/configs/bcm2835_defconfig b/arch/arm/configs/bcm2835_defconfig
index 4a8ac09843d73280cc42dbbf63fe3cc9f31dacd2..51a1e94d5aa6c22202778082b877a202a6b9c04d 100644
--- a/arch/arm/configs/bcm2835_defconfig
+++ b/arch/arm/configs/bcm2835_defconfig
@@ -174,7 +174,6 @@ CONFIG_NLS_UTF8=y
 CONFIG_DMA_CMA=y
 CONFIG_CMA_SIZE_MBYTES=32
 CONFIG_PRINTK_TIME=y
-CONFIG_BOOT_PRINTK_DELAY=y
 CONFIG_DYNAMIC_DEBUG=y
 CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
 # CONFIG_ENABLE_MUST_CHECK is not set
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 2fe9a963c823a41e7df10c29939a2abb55462859..77f53eaed13216c6c3946adabc0c8fdba6401d91 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -1289,7 +1289,7 @@ static bool suppress_message_printing(int level)
 	return (level >= console_loglevel && !ignore_loglevel);
 }
 
-#ifdef CONFIG_BOOT_PRINTK_DELAY
+#ifdef CONFIG_GENERIC_CALIBRATE_DELAY
 
 static int boot_delay; /* msecs delay after each printk during bootup */
 static unsigned long long loops_per_msec;	/* based on boot_delay */
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 1244dcac2294ad99fda37fa6767c9e76f16a4d14..b552ea51cd53b79cf5d58b8c4deff409b1982862 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -99,24 +99,6 @@ config MESSAGE_LOGLEVEL_DEFAULT
 	  by default. To change that, use loglevel=<x> in the kernel bootargs,
 	  or pick a different CONSOLE_LOGLEVEL_DEFAULT configuration value.
 
-config BOOT_PRINTK_DELAY
-	bool "Delay each boot printk message by N milliseconds"
-	depends on DEBUG_KERNEL && PRINTK && GENERIC_CALIBRATE_DELAY
-	help
-	  This build option allows you to read kernel boot messages
-	  by inserting a short delay after each one.  The delay is
-	  specified in milliseconds on the kernel command line,
-	  using "boot_delay=N".
-
-	  It is likely that you would also need to use "lpj=M" to preset
-	  the "loops per jiffy" value.
-	  See a previous boot log for the "lpj" value to use for your
-	  system, and then set "lpj=M" before setting "boot_delay=N".
-	  NOTE:  Using this option may adversely affect SMP systems.
-	  I.e., processors other than the first one may not boot up.
-	  BOOT_PRINTK_DELAY also may cause LOCKUP_DETECTOR to detect
-	  what it believes to be lockup conditions.
-
 config DYNAMIC_DEBUG
 	bool "Enable dynamic printk() support"
 	default n

-- 
2.34.1

