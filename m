Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D78A37647E
	for <linux-doc@vger.kernel.org>; Sun, 31 May 2026 23:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780269481; cv=none; b=ZZFunE/vis4l+Wv1ONF4NSJZUOZInI18BGrRv4y+0VcmQF7vv6zAIzyhychIuhD5OS7cVlI6CThkcEHnNcVCT5kORZQPl0A0Az3pX9+nOJnJWFzWMGZn+8biuHy9HRRBaSZ1gtydFCOJTm7N3edEj2xOm517Yu9YFL340VP0PXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780269481; c=relaxed/simple;
	bh=5TSr29LSwGDXLwLvDWzxI5WHv1bELD/GcXyz7uzulhE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SkqzPss5pz3skgFo8s2hvmqPrKv/YB2GCujk0OfYCMet4jbKWFMHbkcg2nYOUs+bQBXWAZzJOvQjaMAsCgvAh3z8Yy354I8OZNj8ca5/TqzSezTIUuOezI2C/Xo0yPMiiPJeFkFzWSLqYYFJGwsWngmR/hoH+O6PQaLN6a95kbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=thCNVISj; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="thCNVISj"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4904c1ce4c1so104634135e9.3
        for <linux-doc@vger.kernel.org>; Sun, 31 May 2026 16:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1780269475; x=1780874275; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BlnkV007FI48mXpf+dStqCmocIvL2i8BzMwzQ0j9H8A=;
        b=thCNVISjU0z/5ZoysjeX8phC46qjOQvqXI6q5l0AcDnhLrIABMIZQ6mpTnWlC5DQyd
         EmBd22yLx6hoYlpCCf788fU2IdyK/GzDwc+GBtIxC96+64IFuWa3jt20FF8lGFegUdqu
         Ds2JOTknzLbGrkD1RYWKpSiKnUZSfL8bLZdSBsIZ11+b1zzV2ztKKUs7uFclyeM5T8t6
         OIhto+9yg5Ke+/9jIcf3A2n0iySWjXpO2xv8FYrHOEobzTcuX1dReJTRAKzlTvAKfb82
         rrQ8Sg6m78mwIKMiYLcjpCuJgBxqHltYIIP3sIOcQzQqRB1b+G+xGh1bAmVcNldc1T0z
         GSuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780269475; x=1780874275;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BlnkV007FI48mXpf+dStqCmocIvL2i8BzMwzQ0j9H8A=;
        b=JJoZ78ZOfWf7MpCUdcFTvhzkmFxY8jFLBeJkCQIiv5QZ2Oa5GPia2JZOn+dS0V7cb7
         NeJq+rK3BLCZkLILg/lOQvZYr0OJ5+j+M5as9eZ+XcShN09bJ1fUuO5PWVMndI8FnMlZ
         UXFBkA3kebY5rdna2rbVZlAnInonjzq3Ed1svh8TGwkYP2sDkNwF/i9S7SFwBxd5ldUO
         3qgbEKe2ZcEbCA1Usj4aTXNmPixvimWV9LWQaGKV6skoqYUNH5NRDhDbuITZzkZvtkwA
         7QuYuHqUK20RySP2aBg1vtGuWAfzR4C2DgtszMp+G2+Mpv/qMEmDuSsNSB3CwjRAerSB
         xyew==
X-Gm-Message-State: AOJu0YwwNmkwYRkyQOU3UAFK86Q9BoEAVRdcUEqfW64pmLENlL7C/6+Q
	Yxyt5O1f5+ndnxrQcSup1/GXUiATj3V6QxAs8+mqaTGuscWFb0kbXY0VMSKL7ghyFLjUHKTN/5s
	C2+/bAg4+mFJP
X-Gm-Gg: Acq92OGE31rfFfyP7FFuWF4QS64zTS4hHF4RWL1/n0yikgXMT1zi/O00/2aky5EZILa
	pWU5xaj/W1ZagTgAhgE1MsagVqSwTDez/dSNJrrK3BbhpIXrF5TCwfmTJ+vSkfy08k2VjNjxLxW
	2UBIM/dkZyzm07RRHZFGvFhKa2xlCecUwaZr1UWq21ed1VV6Oa9+jKPdeO54vD9fWKfPMD7eUh5
	BOEHovYaOmXs+ATxFuYkPNvB/paSc4d5TQ+h41QlcoXq8UZcxOCV94Pz2iGfW0rq7dqXClEkNeR
	OY7esWRniYn/gJGEGGO96QrqxiJ48FmhAkTCTc5FU4tj+eo/2zTla1IXSSAl2mMV44lDzkJskDi
	haBrOGrj8qv1r4/T4fVe9wCxL/Rq0y8qRZe+L4JV5owp6yVvTABkTVxTCI55ThAAHZygE6i+RtF
	3/5xOgPP4Gp3RxcXkaGqc8SH2ufUeSatdlDT+vGMkyOXKfef4NJADW1nTlQlvfZRqs9OITBNnlv
	o0Ru8HvkvcATCzA2pZzihnH6M4QnrkztLuuCiiVOgO5VymTHQ==
X-Received: by 2002:a5d:534c:0:b0:45e:73a5:e1ed with SMTP id ffacd0b85a97d-45ef6b5b858mr11489190f8f.27.1780269475497;
        Sun, 31 May 2026 16:17:55 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c5:7815:1301:f27:e3a8:2334:314d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef34b834esm20496544f8f.11.2026.05.31.16.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 16:17:53 -0700 (PDT)
From: Andrew Murray <amurray@thegoodpenguin.co.uk>
Date: Mon, 01 Jun 2026 00:17:37 +0100
Subject: [PATCH RFC 1/4] printk: remove BOOT_PRINTK_DELAY config option
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-deprecate_boot_delay-v1-1-c34c187142a6@thegoodpenguin.co.uk>
References: <20260601-deprecate_boot_delay-v1-0-c34c187142a6@thegoodpenguin.co.uk>
In-Reply-To: <20260601-deprecate_boot_delay-v1-0-c34c187142a6@thegoodpenguin.co.uk>
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
 Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, 
 linux-rt-devel@lists.linux.dev, 
 Andrew Murray <amurray@thegoodpenguin.co.uk>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780269471; l=3823;
 i=amurray@thegoodpenguin.co.uk; s=20250914; h=from:subject:message-id;
 bh=5TSr29LSwGDXLwLvDWzxI5WHv1bELD/GcXyz7uzulhE=;
 b=RpHQjnwPlCMM2VtepAdORdFkPWqzLeIfyeSmjtS5aPXoHK3GX0Pi3LUQVR56kW6L6eodrkBg2
 zCSx9+ttsm9BHv7/kQjLkxfOiOnRPICyMwRxfmblDJUyamhDHIP9DWi
X-Developer-Key: i=amurray@thegoodpenguin.co.uk; a=ed25519;
 pk=0SU0Q8S/uEiCdbXbXS+PvJGUCaBG1nDszD+HPU3Js0Q=

The boot_delay (BOOT_PRINTK_DELAY) kernel parameter and printk_delay sysctl
are two distinct mechanisms for providing similar functionality which add a
delay prior to each printed printk message.

In preparation of combining them into a single configurable feature, let's
first remove the kconfig option BOOT_PRINTK_DELAY.

Signed-off-by: Andrew Murray <amurray@thegoodpenguin.co.uk>
---
 Documentation/admin-guide/kernel-parameters.txt |  2 +-
 arch/arm/configs/bcm2835_defconfig              |  1 -
 kernel/printk/printk.c                          |  2 +-
 lib/Kconfig.debug                               | 18 ------------------
 4 files changed, 2 insertions(+), 21 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 97007f4f69d4e8f19acaff81c9af8421a09822bf..37b618d176f1c499f457f0d8b5679c29ee7ab177 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -656,7 +656,7 @@ Kernel parameters
 
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
index 0323149548f6a4dbcdd80029478b809d44de9b62..822fcdff7b21ac00cfa655c3d9b4de2698fcb7d8 100644
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
index 8ff5adcfe1e0a2f13893c92c3b95498fedb83855..fa82d76e7de45e05e5c0d578eaa2e5807bca39d1 100644
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

