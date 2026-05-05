Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA8E2459DC
	for <linux-doc@vger.kernel.org>; Tue,  5 May 2026 13:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777988716; cv=none; b=CqNfxAVm3ZOvKI5r7fdsTsurlLvFku/p+clIMbjENXtwsMmsTtqVjQM0YXvWYA9FUw48diEZ1H6D3fkQnaEct6HL8tgc25MEY1PC3uodXWGhKp+r37QPRpPsIrGJFxV3B+AXrkw7/4MCsnLr1sAfOGQ0F+MPdp+o1XuJHrrYSAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777988716; c=relaxed/simple;
	bh=OO2wnaK4mcEYjb+iiWNgPvHCYFazRH7X6rVJNuFlFgk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Mmuou2EAxD1TDxBRgyARAOgYT+qn6XpqR0p5LXDfm3DrHUV0styG3KAVLt2f1KVeIdaML2y6gGiMTMqoa4K+m57Mvk/8cM72OrjiGrzxZ53G/xXTD0/6XJzukBmL0U5nZsAtqjYIbvrsqEP5y5WiYs+/UGCY7bqFuh4S990LuPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=lnD8aJVj; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="lnD8aJVj"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43d7e23defbso2993786f8f.0
        for <linux-doc@vger.kernel.org>; Tue, 05 May 2026 06:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1777988711; x=1778593511; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PYkIP1Kvmjl9SAF9O37JxjxuW1pir4kJK6yjtigDUqI=;
        b=lnD8aJVjEGKGDlDubVtMztIUhNZbMG/L+x8dfYhGWNDcoFu2inNbwatGzPkqAI/Aol
         YfCDCPwFXL+MW1SCQMWol9V0EySZ+8Vjyk78t6eV8ACUaHGCK9A2GUj7XsxHek41CT8h
         xRAhrWKjQftcECXVZOsRJViVTEuAXc+yH7hWuj3Il9NuNAmI+ipwmBYEqdN1SPNdY4Fs
         LG7dzzXTsDJC6G0fboB4ZhKD8gR1TS0xITCeHJMWzZ1AZCPkFOaXSoQJuY7Xz6XT163S
         Yzwjyz68GzxEBseh8pU2iQBvSxA21sOn7Cc6bJtxUtIPhDTXfKvfOA3/exYwi0SKhAUH
         Pudw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777988711; x=1778593511;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PYkIP1Kvmjl9SAF9O37JxjxuW1pir4kJK6yjtigDUqI=;
        b=OvU0wojeW3wViQYinViH3zDTSGY31EYjfaJdqFIr2EsAfGHCF3zspeZ/DBjlA400qC
         jIvfCZSnhFKNOMMGUYd8vq2XBEzkvOZVTAJGB8f/4ddBQjVVbstV103lfSmseox8GNwf
         /kraFOSTNOCi0W5GUW+P6sB/cVfQGxMPc1DDxLCIORYtw1+3nPdZ9/cl+5AhqgolHKFk
         PDBq5A30jk61ff3YOz3OIae78r8nUa6mjWkh8f8eliCpEiU8qwUFt2POA2w3TgXKE6tH
         da+LrfXwPOdM4n8Bfpl+Uwp/K9vj8tzwagOvz3ybMpucLT8LHbuU7JluEXrhg3EkT6JK
         grhg==
X-Gm-Message-State: AOJu0Yzc7pumNzJztPNv9PvhZYRlELrif/QXOlX/pOdhG4S4mxLDnE56
	DUw/4Mb+F+cuIPofqNWi1/E6nOsSRG7ztM1Puw31t5erRQfhDqtQaNUGcTP1QpNqKOo=
X-Gm-Gg: AeBDiesxWnHI+bEXxTuRfDzX9hqC6BgAKlfq6oUI/5l/RpJByyMfnbKRPdleVuTkrhy
	xM/x3xctAA5X1+Rh1oWJRMfUbChdh8Cy699pgDqNhn+XA4DqslAory4cHP688ypbCAEk6fkPUs0
	7mdKmLBE/HV/5kfEbRzBqBCcWI07YEt8hnsWUqjJp0NBvQB4KhU4eDe1hDU8BK7v+G6O6OfYRaC
	nYhrnpeZQUENj7K4zpOroRX7jQ3rpkZQ5My6aevO2nU/LZ0NWz0BRR7ltSIHjPON+sPYk8+iNWr
	uW/qu3avZp3VchWus/1EkiAw/W16dQzO6rXcYGfDTpn1QKHnRbBULFghseWy/KBClh5utlV18+V
	Zy1i3o5CrxRpEawOOqYZJ0veNQpdQY2akD4KsQtlZVO5zbgF7lVF0gbcXMbxXZUAF8MbNhVvlty
	gcQYvXhMvZT6pTZaRb4vPPi6Lba1EA97CZZ9Rkbcu3t+VJm8PcrqFf8Af22j6jWjOitcIOFZoG2
	dGYAzjCHKGhYwcAnBLtJr7xQbf90XmbPlc2yireD//RGG3p/Q==
X-Received: by 2002:a05:6000:61e:b0:43d:7b90:fa23 with SMTP id ffacd0b85a97d-44bb65df7c8mr23463107f8f.29.1777988711101;
        Tue, 05 May 2026 06:45:11 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c5:7815:1301:f27:e3a8:2334:314d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45055960aa2sm4573113f8f.29.2026.05.05.06.45.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 06:45:09 -0700 (PDT)
From: Andrew Murray <amurray@thegoodpenguin.co.uk>
Date: Tue, 05 May 2026 14:45:00 +0100
Subject: [PATCH RFC] printk: remove BOOT_PRINTK_DELAY
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-printk_delay-v1-1-5dba51d7f17c@thegoodpenguin.co.uk>
X-B4-Tracking: v=1; b=H4sIAFv0+WkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDUwNT3YKizLyS7PiU1JzESl1zCwsLk5TERPPUJAsloJaCotS0zAqwcdF
 KQW7OSrG1tQA9efpKYwAAAA==
X-Change-ID: 20260505-printk_delay-78884daa7eb8
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Russell King <linux@armlinux.org.uk>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
 John Ogness <john.ogness@linutronix.de>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, 
 linux-rt-devel@lists.linux.dev, 
 Andrew Murray <amurray@thegoodpenguin.co.uk>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777988708; l=9156;
 i=amurray@thegoodpenguin.co.uk; s=20250914; h=from:subject:message-id;
 bh=OO2wnaK4mcEYjb+iiWNgPvHCYFazRH7X6rVJNuFlFgk=;
 b=1mSO9+z1xZYnd2PD5ecHPzA8luCmG2iHBUBqwUQ5I3+cllJwsPhB1Y9WQns3lz8TMTmjpPXQv
 aiA/4aN1W1TD+b75eMJwqxoQxpqFNYYzZrL7z2rMU7VnG0f83XfVSBI
X-Developer-Key: i=amurray@thegoodpenguin.co.uk; a=ed25519;
 pk=0SU0Q8S/uEiCdbXbXS+PvJGUCaBG1nDszD+HPU3Js0Q=

The CONFIG_BOOT_PRINTK_DELAY option enables support for the boot_delay
kernel parameter, this allows for a configurable delay to be added before
each and every printk is emitted. This is DEBUG_KERNEL option that is
helpful for debugging as kernel output can be slowed down during boot
allowing messages to be seen before scrolling off the screen, or to
correlate timing between some physical event and console output.

However, since the introduction of nbcon and the legacy printer thread for
PREEMPT_RT kernels, printk records are now emited to the console
asynchronously to the caller of printk and its boot_delay. The delay added
by boot_delay continues to slow down the calling process, but may not have
any impact to the rate in which records are emited to the console. For
example, if delay_use is set to 100ms, and the printer thread has a
backlog of more than 100ms, perhaps due to a slow serial console, then the
records will appear to be printed without any delay between them.

It would be unhelpful to add a delay to the printer thread, and it would
not be possible to disallow selection of CONFIG_BOOT_PRINTK_DELAY at build
time as it's not possible to detect which consoles are nbcon enabled at
build time. Therefore, let's remove this feature.

Signed-off-by: Andrew Murray <amurray@thegoodpenguin.co.uk>
---
 Documentation/admin-guide/kernel-parameters.txt |  8 ---
 Documentation/admin-guide/sysctl/kernel.rst     |  8 ---
 arch/arm/configs/bcm2835_defconfig              |  1 -
 include/linux/printk.h                          |  1 -
 kernel/printk/printk.c                          | 73 -------------------------
 kernel/printk/sysctl.c                          |  9 ---
 lib/Kconfig.debug                               | 18 ------
 7 files changed, 118 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 4d0f545fb3ec5a1750d9112a851deb8fd976d32d..afdf443094fc3d74c0220548357c000fafadcb19 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -654,14 +654,6 @@ Kernel parameters
 			embedded devices based on command line input.
 			See Documentation/block/cmdline-partition.rst
 
-	boot_delay=	[KNL,EARLY]
-			Milliseconds to delay each printk during boot.
-			Only works if CONFIG_BOOT_PRINTK_DELAY is enabled,
-			and you may also have to specify "lpj=".  Boot_delay
-			values larger than 10 seconds (10000) are assumed
-			erroneous and ignored.
-			Format: integer
-
 	bootconfig	[KNL,EARLY]
 			Extended command line options can be added to an initrd
 			and this will cause the kernel to look for it.
diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
index c6994e55d1411b1a3b708b3e2439144bac814e6a..fa1ca90105ab58a2143c3b223c023eb429371474 100644
--- a/Documentation/admin-guide/sysctl/kernel.rst
+++ b/Documentation/admin-guide/sysctl/kernel.rst
@@ -1125,14 +1125,6 @@ default_console_loglevel default value for console_loglevel
 ======================== =====================================
 
 
-printk_delay
-============
-
-Delay each printk message in ``printk_delay`` milliseconds
-
-Value from 0 - 10000 is allowed.
-
-
 printk_ratelimit
 ================
 
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
diff --git a/include/linux/printk.h b/include/linux/printk.h
index f594c1266bfd411f2238b45374e8a71222f0407c..8885e11367d50ea1cd7642249852d011e589adb4 100644
--- a/include/linux/printk.h
+++ b/include/linux/printk.h
@@ -188,7 +188,6 @@ extern int __printk_ratelimit(const char *func);
 extern bool printk_timed_ratelimit(unsigned long *caller_jiffies,
 				   unsigned int interval_msec);
 
-extern int printk_delay_msec;
 extern int dmesg_restrict;
 
 extern void wake_up_klogd(void);
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 0323149548f6a4dbcdd80029478b809d44de9b62..47c38575176c944b231f47c034a0c1ff899cbec8 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -1289,61 +1289,6 @@ static bool suppress_message_printing(int level)
 	return (level >= console_loglevel && !ignore_loglevel);
 }
 
-#ifdef CONFIG_BOOT_PRINTK_DELAY
-
-static int boot_delay; /* msecs delay after each printk during bootup */
-static unsigned long long loops_per_msec;	/* based on boot_delay */
-
-static int __init boot_delay_setup(char *str)
-{
-	unsigned long lpj;
-
-	lpj = preset_lpj ? preset_lpj : 1000000;	/* some guess */
-	loops_per_msec = (unsigned long long)lpj / 1000 * HZ;
-
-	get_option(&str, &boot_delay);
-	if (boot_delay > 10 * 1000)
-		boot_delay = 0;
-
-	pr_debug("boot_delay: %u, preset_lpj: %ld, lpj: %lu, "
-		"HZ: %d, loops_per_msec: %llu\n",
-		boot_delay, preset_lpj, lpj, HZ, loops_per_msec);
-	return 0;
-}
-early_param("boot_delay", boot_delay_setup);
-
-static void boot_delay_msec(int level)
-{
-	unsigned long long k;
-	unsigned long timeout;
-	bool suppress = !is_printk_force_console() &&
-			suppress_message_printing(level);
-
-	if ((boot_delay == 0 || system_state >= SYSTEM_RUNNING) || suppress)
-		return;
-
-	k = (unsigned long long)loops_per_msec * boot_delay;
-
-	timeout = jiffies + msecs_to_jiffies(boot_delay);
-	while (k) {
-		k--;
-		cpu_relax();
-		/*
-		 * use (volatile) jiffies to prevent
-		 * compiler reduction; loop termination via jiffies
-		 * is secondary and may or may not happen.
-		 */
-		if (time_after(jiffies, timeout))
-			break;
-		touch_nmi_watchdog();
-	}
-}
-#else
-static inline void boot_delay_msec(int level)
-{
-}
-#endif
-
 static bool printk_time = IS_ENABLED(CONFIG_PRINTK_TIME);
 module_param_named(time, printk_time, bool, S_IRUGO | S_IWUSR);
 
@@ -2117,22 +2062,6 @@ static u8 *__printk_recursion_counter(void)
 		local_irq_restore(flags);		\
 	} while (0)
 
-int printk_delay_msec __read_mostly;
-
-static inline void printk_delay(int level)
-{
-	boot_delay_msec(level);
-
-	if (unlikely(printk_delay_msec)) {
-		int m = printk_delay_msec;
-
-		while (m--) {
-			mdelay(1);
-			touch_nmi_watchdog();
-		}
-	}
-}
-
 #define CALLER_ID_MASK 0x80000000
 
 static inline u32 printk_caller_id(void)
@@ -2450,8 +2379,6 @@ asmlinkage int vprintk_emit(int facility, int level,
 		ft.legacy_direct = false;
 	}
 
-	printk_delay(level);
-
 	printed_len = vprintk_store(facility, level, dev_info, fmt, args);
 
 	if (ft.nbcon_atomic)
diff --git a/kernel/printk/sysctl.c b/kernel/printk/sysctl.c
index f15732e93c2e9c0865c42e4af9cb6458d4402c0a..5178540b2643d1b1a51dfef3f0444414889d7a3e 100644
--- a/kernel/printk/sysctl.c
+++ b/kernel/printk/sysctl.c
@@ -41,15 +41,6 @@ static const struct ctl_table printk_sysctls[] = {
 		.mode		= 0644,
 		.proc_handler	= proc_dointvec,
 	},
-	{
-		.procname	= "printk_delay",
-		.data		= &printk_delay_msec,
-		.maxlen		= sizeof(int),
-		.mode		= 0644,
-		.proc_handler	= proc_dointvec_minmax,
-		.extra1		= SYSCTL_ZERO,
-		.extra2		= (void *)&ten_thousand,
-	},
 	{
 		.procname	= "printk_devkmsg",
 		.data		= devkmsg_log_str,
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

---
base-commit: 7fd2df204f342fc17d1a0bfcd474b24232fb0f32
change-id: 20260505-printk_delay-78884daa7eb8

Best regards,
-- 
Andrew Murray <amurray@thegoodpenguin.co.uk>

