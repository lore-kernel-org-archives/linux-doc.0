Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4E6376490
	for <linux-doc@vger.kernel.org>; Sun, 31 May 2026 23:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780269485; cv=none; b=RrSOn1tQpdUE4sySLJOaVDN/SR/FUi/r2ouqzj0G+mqxMVJvkzqNEh0ckq589TTWMm7WryRA25adWnkt+fIDSyr9RE+x/oW35yNG9Ee8P4hvzSb+UGYEC1uFzJtZDJzTVON2L8kZ5tfRZfKXv8CWlGdT45kniu/FuhvQiQ5a+7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780269485; c=relaxed/simple;
	bh=NzyYbeRmipVDUcVFnXEzhSA5L8Fjv+M/rg5sEJLce8g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kXL8M0Z4mf+7cE5akOrfQ+cdbuBTi9KiB3gA//I8tmviyzKUu5ZhEYZIyOvSgFjUo+TBkoCZrLKA+o/KiMzsN0QFvpM0T48T6NbQIrl5RhJA4RLXLIp4yOi7lXChrFCVFrtAY+ARAJ1asnsji/4+jBsE6luFqEk81kIUZAEsnAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=D4BBV8uM; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="D4BBV8uM"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4906238c62eso74786715e9.3
        for <linux-doc@vger.kernel.org>; Sun, 31 May 2026 16:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1780269477; x=1780874277; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yw1fhfSYYqzCwDV1bdu9APNnKhaP1vTsxLW0x4AdDkE=;
        b=D4BBV8uMc4b3pVACkDqxyvtmxKDnEpuWc2//GSZkcpvWFiWSMBEgIwDvxVZTX+odsg
         gkcvVOSGshOlpnqMm2ocfdKBkAUgpk/F6Ac7xEXJylgFkTPDZCsfNZBrDhMYEZ3cIXyF
         EA8dMFllT3I1tr+O76ZTZZF1C2sPNqufmT/aQFtIDdzCDpHYQRk5J5glOPaMen+58+B9
         5ww4YxMzbVmWKHd07qFNR/HZTJjbgUa7tLfnCkJze6ipKDlHlkQtoZ1obygOGcSKL2B4
         HqLGsAkJTEl7nKgulT7A+Q288xN2PiLeZkcLCx3TyM9U4gACzE8bi/4ik48vayc5DHD1
         GbRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780269477; x=1780874277;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Yw1fhfSYYqzCwDV1bdu9APNnKhaP1vTsxLW0x4AdDkE=;
        b=WF1uOQmIVjvLbWWQcIH8/UqLwUq79pNfxzlP+TbQf3k8xCOZcWs9+jZba/l3F+AEZC
         QPy+5Akx7WRHxoPSN15LsWnzfDr+myk/CTprnH8qVUrlStS1v91zQ33LI0zQOeneWZ0k
         FioyNKlQz/wryAFtS+cp+ngwBdDQatlgcXs5oo4vwMeZEgzI+jJKT1p2T4v1KFa6qzE6
         Q+PhYAbLKhyeHHaFSC0bPVEBxZNdtdox118U7rChs1QYMDLhEguooYW3WHlEo9iS8xC4
         0bT+KO++ZuEVVQFM0TXY1DJX3cY+eNzCOnMuEkuTRwDyrXmScyiHXWnDl0tzomyPMUgS
         kk/g==
X-Gm-Message-State: AOJu0Yz4EIeI8VQXt5t7qVtVQ3jDPZKyx0sjx6eMdnph4aHIH75FYRcn
	i202q6VHY16NSZkmY0LL1xlFBDY5se0jZTaAwj0WRRoQRvwNUuGIn0FhMynUVL1D+B4=
X-Gm-Gg: Acq92OFS4GvRyiis7TjJuxs+CZYPZMcJsNtK7sNtJ6kazg3Ir8oZ0IZIxpcbjGoAqGl
	Bvu25NdwrFkWUZHYwMaXmyXCyzX3ruQK6wgJ+KK/s8pov4z0etur/5QYUGVgU9AD7HN22X0MkOo
	lN32XzTby4Wxoc8HAZ9fTRCCjFvuv6Pd40nxn6msexMK6ifM3xLjPs5QEcR+Nj1cALzmBdDkYWs
	q8l3EZF0Xdf6rj3TqYW27fqs4E9QsBhGEVJaqXFw5TRh0a8KlIwS9WUKGT53uMPvo3DVtBLdZqF
	74X3wKNFXq0x3MuhVc4VKpI81+mgg49Tjf3/wXTsmBwIMKqV+fMEjvFjjPBlL9SMEmoiBWwnpBX
	ivYSiJn9FjyRaalKsFv3ufLhrKbDe1jhT6ze0GozGXjxO3t5cmb16l/OjrrC9Mwk1luvLDnyOeU
	QTAArKHkb9rVVpstujt13ExPIrV6AmNpJZAzfdrttinG5hPLmYw2SyuURY84rJk8Qb4RpHURy8L
	kfjyAaxJyjhFYXYDYr2wojo2fpkDx+l1HLw4LIFCSZ2SJX8/g==
X-Received: by 2002:a05:600c:6558:b0:48f:d5a0:284e with SMTP id 5b1f17b1804b1-490a294b864mr118910765e9.28.1780269476864;
        Sun, 31 May 2026 16:17:56 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c5:7815:1301:f27:e3a8:2334:314d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef34b834esm20496544f8f.11.2026.05.31.16.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 16:17:56 -0700 (PDT)
From: Andrew Murray <amurray@thegoodpenguin.co.uk>
Date: Mon, 01 Jun 2026 00:17:38 +0100
Subject: [PATCH RFC 2/4] printk: deprecate boot_delay in favour of
 printk_delay
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-deprecate_boot_delay-v1-2-c34c187142a6@thegoodpenguin.co.uk>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780269471; l=4252;
 i=amurray@thegoodpenguin.co.uk; s=20250914; h=from:subject:message-id;
 bh=NzyYbeRmipVDUcVFnXEzhSA5L8Fjv+M/rg5sEJLce8g=;
 b=i+GDn9CndzdObBjnvYG9EQGVKMlZ7e6Fy6BNLVupTvtxPnVqFEb/bVi2JyX2zv2+YUvaYE0j4
 OueQHamNr33BR1S1U4QUwBadcLGdUbhjHwzvBhiP9fMeOsqdMoVpSvg
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
additionally configured via a kernel parameter.

Signed-off-by: Andrew Murray <amurray@thegoodpenguin.co.uk>
---
 kernel/printk/printk.c | 75 ++++++++++++++++++++++++++++++++------------------
 1 file changed, 48 insertions(+), 27 deletions(-)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 822fcdff7b21ac00cfa655c3d9b4de2698fcb7d8..ca510b9c76458f5c1e059200060d9d6be4c859b3 100644
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
+	pr_warn("boot_delay will soon be deprecated, please use printk_delay instead");
+	return printk_delay_setup(str);
+}
+early_param("boot_delay", boot_delay_setup);
+
 static bool printk_time = IS_ENABLED(CONFIG_PRINTK_TIME);
 module_param_named(time, printk_time, bool, S_IRUGO | S_IWUSR);
 
@@ -2119,18 +2130,28 @@ static u8 *__printk_recursion_counter(void)
 
 int printk_delay_msec __read_mostly;
 
+static inline void late_boot_delay_msec(void)
+{
+	int m = printk_delay_msec;
+
+	while (m--) {
+		mdelay(1);
+		touch_nmi_watchdog();
+	}
+}
+
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

