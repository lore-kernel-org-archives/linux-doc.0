Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988BD3A2E2B
	for <linux-doc@vger.kernel.org>; Tue, 30 Jun 2026 16:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782837374; cv=none; b=Z3164Z3wtVxTEb70aIdTGclsH2TP6j/6Htid0gnPg4RvV14QjrnqdC8TAOuWeir8BFwPJaVg36OUBMln25pq+qBTzimiPFR+uPIsv5YKfieCPbFIwC4uROnPuexCCugqY3JPuLChaKJs8CHLI6jtHTQUGAeF8VrRsC+F4NN9meY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782837374; c=relaxed/simple;
	bh=fa53dM+rpvCnSCIlkhyVqKxgkdTEtZE5kFS5Pn17HPI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ngmUCkZyKtTrA0SNEV/lP/1fR3xC/9MMW8wFWWD0W6O/lbQlxoY78PwBQpA3KyvUhYKqA6v0An1VGR0xCf+AZn7yNFMgsTFm/uqJ/D7RhvKsYbuIFVFE3EoxN+S9emymlXGLU64TG3rS03dUFU0lElipFnNTLicaN6dETqNL1BY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=Cs+mkN5l; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="Cs+mkN5l"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49395888c7bso42174125e9.0
        for <linux-doc@vger.kernel.org>; Tue, 30 Jun 2026 09:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1782837370; x=1783442170; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NUr0KGUBOGHUMcB7KRl2iY6u1RQhl1nD/YRpGEGvCLE=;
        b=Cs+mkN5lA1O0n+D64kh4cz9xvuMGwAOHc1xZRH3qCtMrhsH2JePSJxbabdRjCPbMh+
         2UIv0X4qDKbkjZAd4w7nNjwj5ftHbDZM4ARRuS1p2DEyXJkUo2D/OCokFPFfuMxe7tR1
         0hMIvtnXvp3OQkePczWryV4Rov+vXCxSYcF09THkUUEtHC5TDGjq0o5t6cAr+kjVbRVY
         WYVUDBZ8yAmSA9lPuUOZ43aQ13vlc8dLXxq5icHNS6w2gJ2eVq2XNxHAKDZGWhiRFrGn
         IQGNnMG4Odo7aLvopMi4if+tJL0JqeC6WQjPdhs+BKhGZ0LxSR4S2MsTlx1zZtmN3bO0
         QiNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782837370; x=1783442170;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NUr0KGUBOGHUMcB7KRl2iY6u1RQhl1nD/YRpGEGvCLE=;
        b=sKDrZKDkH4Vctixp0QReIB7Q3apYs3+Jud9sCcFrxs/rl4cyj4J3Rri2B7ApyTpIG1
         Le93Vw5Ucpa6mRqHVyc5NxH0TZONChtWKZiDs1kWgCTnoJVtdfESrD8gNkJNYl0SErIZ
         FvBTYNNpbloXquUSyquF0loc3D7W1pU38wNG+hzmCVvf0E5r9o8Ycyf4mQ5Lby1Nah5F
         e6qUdSTwomWLsjMWkBGHRTgKRAw1G/6Zw03Kv/AWHyEkwj+uZlxPsA6eOHTNfpm782Iu
         p+VKktfssTm98tyIbOhz0x7K+3q3sQ2j7BubSu2eSbmt7mt0LPGQbdwyv9CISBjNRr5L
         ekSQ==
X-Gm-Message-State: AOJu0YzhPKZGUtDU9JWtpmzNfyTo3eueCWAWjQBAHtKjyAyR98OwozJG
	BsomYZi45DosZLR7+JUOd8SsS7HALUyRDQb1ZS7vt36v8RmKQqzhB7T69C5TxQGjqCE=
X-Gm-Gg: AfdE7cl+qkTWFPg7gfaOek/S6qgbTQ2JXRe52IVfPpklUnPa8L4lpFxTc1F+G6MJEf9
	Z1FGt9LITv79W9HB0yJVgYbyt4b4ie8TDVBUoPU4lOqM12/tvY1yEUxW9EpOhHXTpETPZZtxgy1
	xZVpXoBZQKmdeaX0xJpw9/o8KN0Hv5iHBO7AQbgzb3pSy9xiyCj84Dz7n8Bfq9OEFQoC/yLdQLX
	puJFOtZq6xpwm50T88aG7A3T/rdaButLP0/Lbj54kVo54Vfk3whj/LZinpvSMRSJ95hsyieVh6o
	TF4NNV6qVIy5sX7Ac+qkiDDbAXVOsOcySKRLzFHLyIgwS6CGqfyTT8pVhP8oquv9x997W6l3kqJ
	OEqFIYA3tJPa/lurU/m4QzFT45exv/Z/UiRaWQIQtCPxGM60oOysrJ3Y5F62toBsndOS1E21bzp
	1bkdSGXGwp4cDEIHuyZ8pj5M0HTPlPV8fzHQHrH8oMv0K+MeYX+JlfnDVXITELgzImlfmPYA94L
	jnZvH6jmsv4mjJOi32nO1f1GRPVKq0mvjbxAwk=
X-Received: by 2002:a05:600c:4f89:b0:492:3763:aeb9 with SMTP id 5b1f17b1804b1-493bda9e892mr21136745e9.21.1782837369591;
        Tue, 30 Jun 2026 09:36:09 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c5:7815:1301:f27:e3a8:2334:314d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be486f52sm8452225e9.0.2026.06.30.09.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 09:36:08 -0700 (PDT)
From: Andrew Murray <amurray@thegoodpenguin.co.uk>
Date: Tue, 30 Jun 2026 17:35:58 +0100
Subject: [PATCH v2 2/4] printk: deprecate boot_delay in favour of
 printk_delay
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-deprecate_boot_delay-v2-2-f9883d36aa4b@thegoodpenguin.co.uk>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782837365; l=4687;
 i=amurray@thegoodpenguin.co.uk; s=20250914; h=from:subject:message-id;
 bh=fa53dM+rpvCnSCIlkhyVqKxgkdTEtZE5kFS5Pn17HPI=;
 b=v0okkg//jb9/3sAuGQFKqBJJ4+Du6WkipeM3urzg6uNKJCrYjcqHh/QH/cIXSY1AZK/39kLw3
 eOYek5wOwMcDwMv12lHqWZwJNz+jNhR5AmRDZRbehAYwJeZ47v11Nnv
X-Developer-Key: i=amurray@thegoodpenguin.co.uk; a=ed25519;
 pk=0SU0Q8S/uEiCdbXbXS+PvJGUCaBG1nDszD+HPU3Js0Q=

The boot_delay (BOOT_PRINTK_DELAY) kernel parameter and printk_delay sysctl
are two distinct mechanisms for providing similar functionality which add a
delay prior to each printed printk message.

boot_delay provides a kernel parameter for delaying printk output from
kernel start through to boot (SYSTEM_RUNNING), whereas printk_delay is
configurable only via sysctl and thus is only used post boot.

Let's deprecate the boot_delay feature in favour of printk_delay. In order
to preserve functionality, we'll also extend printk_delay such that it can
additionally configured via an early kernel parameter.

Behavior change:

The delay enabled by both "boot_delay" and "printk_delay" continues
working even in SYSTEM_RUNNING state. It must be explicitly stopped
by setting printk_delay=0 via sysctl.

The delay is skipped when the message is suppressed in all system
states. It used to skipped only for the boot_delay.

Signed-off-by: Andrew Murray <amurray@thegoodpenguin.co.uk>
---
 kernel/printk/printk.c | 77 ++++++++++++++++++++++++++++++++------------------
 1 file changed, 49 insertions(+), 28 deletions(-)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 77f53eaed13216c6c3946adabc0c8fdba6401d91..cc203327247aa4f81f55b907c66ac88f30ce6da8 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -1291,40 +1291,28 @@ static bool suppress_message_printing(int level)
 
 #ifdef CONFIG_GENERIC_CALIBRATE_DELAY
 
-static int boot_delay; /* msecs delay after each printk during bootup */
 static unsigned long long loops_per_msec;	/* based on boot_delay */
 
-static int __init boot_delay_setup(char *str)
+static void __init printk_delay_calculate(void)
 {
 	unsigned long lpj;
 
 	lpj = preset_lpj ? preset_lpj : 1000000;	/* some guess */
 	loops_per_msec = (unsigned long long)lpj / 1000 * HZ;
 
-	get_option(&str, &boot_delay);
-	if (boot_delay > 10 * 1000)
-		boot_delay = 0;
-
-	pr_debug("boot_delay: %u, preset_lpj: %ld, lpj: %lu, "
+	pr_debug("printk_delay: %u, preset_lpj: %ld, lpj: %lu, "
 		"HZ: %d, loops_per_msec: %llu\n",
-		boot_delay, preset_lpj, lpj, HZ, loops_per_msec);
-	return 0;
+		printk_delay_msec, preset_lpj, lpj, HZ, loops_per_msec);
 }
-early_param("boot_delay", boot_delay_setup);
 
-static void boot_delay_msec(int level)
+static void early_boot_delay_msec(void)
 {
 	unsigned long long k;
 	unsigned long timeout;
-	bool suppress = !is_printk_force_console() &&
-			suppress_message_printing(level);
-
-	if ((boot_delay == 0 || system_state >= SYSTEM_RUNNING) || suppress)
-		return;
 
-	k = (unsigned long long)loops_per_msec * boot_delay;
+	k = (unsigned long long)loops_per_msec * printk_delay_msec;
 
-	timeout = jiffies + msecs_to_jiffies(boot_delay);
+	timeout = jiffies + msecs_to_jiffies(printk_delay_msec);
 	while (k) {
 		k--;
 		cpu_relax();
@@ -1339,11 +1327,34 @@ static void boot_delay_msec(int level)
 	}
 }
 #else
-static inline void boot_delay_msec(int level)
+static inline void __init printk_delay_calculate(void)
+{
+}
+
+static inline void early_boot_delay_msec(void)
 {
 }
 #endif
 
+static int __init printk_delay_setup(char *str)
+{
+	get_option(&str, &printk_delay_msec);
+	if (printk_delay_msec > 10 * 1000)
+		printk_delay_msec = 0;
+
+	printk_delay_calculate();
+
+	return 0;
+}
+early_param("printk_delay", printk_delay_setup);
+
+static int __init boot_delay_setup(char *str)
+{
+	pr_warn("boot_delay will soon be deprecated, please use printk_delay instead\n");
+	return printk_delay_setup(str);
+}
+early_param("boot_delay", boot_delay_setup);
+
 static bool printk_time = IS_ENABLED(CONFIG_PRINTK_TIME);
 module_param_named(time, printk_time, bool, S_IRUGO | S_IWUSR);
 
@@ -2117,20 +2128,30 @@ static u8 *__printk_recursion_counter(void)
 		local_irq_restore(flags);		\
 	} while (0)
 
-int printk_delay_msec __read_mostly;
+unsigned int printk_delay_msec __read_mostly;
+
+static inline void late_boot_delay_msec(void)
+{
+	unsigned int m = printk_delay_msec;
+
+	while (m--) {
+		mdelay(1);
+		touch_nmi_watchdog();
+	}
+}
 
 static inline void printk_delay(int level)
 {
-	boot_delay_msec(level);
+	bool suppress = !is_printk_force_console() &&
+			suppress_message_printing(level);
 
-	if (unlikely(printk_delay_msec)) {
-		int m = printk_delay_msec;
+	if (likely(!printk_delay_msec) || suppress)
+		return;
 
-		while (m--) {
-			mdelay(1);
-			touch_nmi_watchdog();
-		}
-	}
+	if (system_state < SYSTEM_RUNNING)
+		early_boot_delay_msec();
+	else
+		late_boot_delay_msec();
 }
 
 #define CALLER_ID_MASK 0x80000000

-- 
2.34.1

