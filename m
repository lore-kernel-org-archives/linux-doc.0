Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E213A4267
	for <linux-doc@vger.kernel.org>; Sun, 12 Jul 2026 10:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783851661; cv=none; b=T3uz+SwCD4g7WMLFesTNcfBUN7AeP/BUpix59BKinx7n+5kHae648s31Ow+yxqbD6nOOeyrEoDl1SlSHnzl6v6PayG+z31VmiLQZn2LRjnutiRPYclRdDmOHcdQ6Db2PS/xMyp/mYK6g2W5VUiFYfqYPQQzsaiqyMtHA8OptXcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783851661; c=relaxed/simple;
	bh=sFOAnCZDwHdC19ns4aSgMCtOItVvq2/+tYcVxQatFt0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qkmfzkgtkGwQ7d77g1ZlVeNnYFjpqgUTwlxU0JJ0QovCGkU2FCpoi6vCAbvfVr3m7WF+Jhw0ZJDRgyDFQjgMpLnxxg/vqRoJRY7Mnea/efh3g2k9SEsBnRGQ98xGWLZ24ECfCr37yGrnSlo2stTn3imVciMZyUqDe6myruGGMZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=j9MAdSUq; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="j9MAdSUq"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-470174001a0so1299957f8f.0
        for <linux-doc@vger.kernel.org>; Sun, 12 Jul 2026 03:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1783851653; x=1784456453; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3cmEd88xf+2l2ruWrORJ5dbUfpxyjcxhWXUHf6Cknms=;
        b=j9MAdSUq54ceTmof0EWA0cv1i6IN/bOLTX/uqi5K6K6Nv0SKJkza+Po0c98vs9pRW+
         52tfCk9QwS4cUJwynJ23vp/r8W0aGMIZNYGXGs+l+w3Bpk/wRr5P1+/wVjCTNGlshLjd
         eNEcht4ExcNPX6ipdhAINjsTAddQbk13aNRjTGtDD8tWRwOsIh+nFTFdtC5B5NokFR9W
         Jmd6gJPZMQm2JMtRYqe2DQbP8aFIqkb54Yiip6tVQ/ScDFzhnsYCaFMXadV0EZCn37GW
         Wc2tOGrAnOkQeCLvd3uD2h2MofKGEuEqTwaCvUhYhWCODtOUmhIbr0sxMZZR6CPRChDw
         KP9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783851653; x=1784456453;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3cmEd88xf+2l2ruWrORJ5dbUfpxyjcxhWXUHf6Cknms=;
        b=F/JwOg5tzwP9I+goAEmuBWoRcNjc/YaHvHjTPTNBCDkFR/RIDy2uc5OgfeVtH7v/fR
         NnQrbI9wlC2VM+sw3tSTySA4EgbasnqRbzUEAT0qdJaKqjsniDHI1LwjzX7HmopST0yB
         oJ+rwjwO0fT7XoZCH3Pbv+b9q9NmUcZZU1pxStE+L0bbPPqcbzVfJopKHx3s+FeX/ZIV
         FSrxMolsV91RSICyz6gO9l8mB+q2zkGQJQoG57c+Lcupx4QjmhXNxDVYRT5DkPDeznsS
         V3/VuvW9Nwm5glx1m0QD2runMszIkRPZJSO9tXcH8raNACw6cQHT8zwm/zIaRU9vMCav
         OmNw==
X-Forwarded-Encrypted: i=1; AHgh+RrsBzHcckEdCnrchQc0E7EhyZgk160Sp9k8Q6hHKYpe232ffaqYL47ms/3pjSh9N6ovpVXz72dukOo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQyf7op+BJLCbEyJNxUNn3/CAIThMBNjV3fC85o5QHBXK7xN2v
	HdMghnO4LEJOSBVL4LV1IpIsuqjHRobuFeQNGs9uZHjymvZAPINwh00blaO7dqHBnfM=
X-Gm-Gg: AfdE7cm1DQ77slYg6SAwWLgHfbRdjBoUnKW07/NJ/Z/wO0pPuD24UZkC7IfYFumHE8l
	4FMYkjTngj+M12uldZMZh2CqcUImV0kdLwDreccRhWqRjbC5UFPOdRkWaUYV51jaC62X2/DlTbA
	+rCnOYGiN0AwrU5b7KP4T90Bxzge94eBPnqujepWlieUfZY18T215tGgjbtuuxqK6F7ITuYv1Bo
	pjijGfYWjqZF+eulspvvdC7YSfhJyAuJnvjMNmZIRa05DfjFtTz+UO3cCovUORwswaVY0fqthuL
	FSMeUuFtlQhA8hJI1M3Hyzz7lmL9EMu2K4R2uv3TP4s2PPLbp/GoXrQuvVVTzziXmccHGpPtE1l
	REmomXsUD4cuZVQRKUHLp0adQr8dE37CaQoRmZWJViXn8r7eA9jays+hCzL8sCZRwld3A63qWlH
	nFr6xJrcbCLuQLqqMFY73/1GnsdMo1FBHyoMwxi2uX9LoTtvqCnHb8APrT02wEWr3LXLgWnA6hF
	82QsP81/0BFc2zXYNaTe0vDwRku
X-Received: by 2002:a05:6000:26c7:b0:47f:250f:7210 with SMTP id ffacd0b85a97d-47f2dce6d0bmr5100042f8f.49.1783851652901;
        Sun, 12 Jul 2026 03:20:52 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c5:7815:1301:f27:e3a8:2334:314d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039ad21sm75005672f8f.20.2026.07.12.03.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 03:20:52 -0700 (PDT)
From: Andrew Murray <amurray@thegoodpenguin.co.uk>
Date: Sun, 12 Jul 2026 11:20:34 +0100
Subject: [PATCH v3 3/6] printk: remove BOOT_PRINTK_DELAY config option
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260712-printkcleanup-v3-3-574547b8f71b@thegoodpenguin.co.uk>
References: <20260712-printkcleanup-v3-0-574547b8f71b@thegoodpenguin.co.uk>
In-Reply-To: <20260712-printkcleanup-v3-0-574547b8f71b@thegoodpenguin.co.uk>
To: Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
 John Ogness <john.ogness@linutronix.de>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Russell King <linux@armlinux.org.uk>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, 
 linux-rt-devel@lists.linux.dev, 
 Andrew Murray <amurray@thegoodpenguin.co.uk>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783851647; l=3877;
 i=amurray@thegoodpenguin.co.uk; s=20250914; h=from:subject:message-id;
 bh=sFOAnCZDwHdC19ns4aSgMCtOItVvq2/+tYcVxQatFt0=;
 b=JKb1iOGr9kGtjxMDMvrvtANAc8vp0NlTGXG0rX2XOwciPJR5PpOP2CekRiXUGIAQ8Y8GlldxR
 Dq43rpx2y6RBA5c1bioF14CFC9NgxihKT+Osu3Zk9ZrVt16Z7X8I6Ch
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
index 8be562c9be277670ba3209ed1f810fc87175848a..28e6dff2faa7d4294c1b2ebe2844ce5d4dc0e05a 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -1289,7 +1289,7 @@ static bool suppress_message_printing(int level)
 	return (level >= console_loglevel && !ignore_loglevel);
 }
 
-#ifdef CONFIG_BOOT_PRINTK_DELAY
+#ifdef CONFIG_GENERIC_CALIBRATE_DELAY
 
 static unsigned int boot_delay; /* msecs delay after each printk during bootup */
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

