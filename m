Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B779376A10
	for <linux-doc@vger.kernel.org>; Sun, 31 May 2026 23:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780269484; cv=none; b=IGdolUouzPQiU/QCX4bdf69sE8nn85A5ONzabXZx1o7u9oYZi4SJk2i/RvVqEpeqpxdlUgTApa3ncAHCXjL51jmEKKymasDx/YGCAjKt93/UigwrlNy8RFFQHovBDBnDCdG7PgKyEcswIp3fWusA6JBcMAyR8Dj8GmTPoIZdjUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780269484; c=relaxed/simple;
	bh=iIdrzIpbtLvWz4MDbsc58aNL3F6fTnbJs47tQmnDnOs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A1X6DmKV+KoBLgZMIPOD9O0V3Q2DiL1SgK3UJIjIElH70EDOnJvxRls4s5mTLb1A+RpMhgEVHEFnV1zVbvMyrUO+9xMopYfs4plqJRBtnP+60Zv8RXDgIkDmHL/gHAUU1obpiSkZdluVcP/EwTCdrdKrlyXNBYbcAemYtOFEfV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=PEqnNnLm; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="PEqnNnLm"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-45ef41adbc1so1399983f8f.0
        for <linux-doc@vger.kernel.org>; Sun, 31 May 2026 16:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1780269479; x=1780874279; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OIFmAzxejQrp6RSd8J5lsgupOjIxf+PM9ArBTVLQHLA=;
        b=PEqnNnLmHl0S8gvWvHCtfxtMm3OjAg0V0T1ATBEvcb+BDVEu98VuXwp0r7akRVSXrJ
         MOWsK+3eLO2Dxej0lJPBhOCZTHWx8VQAnqPJezDCJrCdMyLbcsSzNOakdNA3amFtfHMw
         ttksN8t1YXot/GyjWpvtPKTyjZQ0eQ33a2CivW2BWicx341hqzHaWa/qolrDGL1G2oOR
         PZybPB2zyx1k+KdDeNuLrCwyRs6Jl2fiiWnv6/N/g362b6NN5SseAKYo3R9iMLhxTqKf
         Ppi6sbtZXKG4By8GRtl4HCCTatBFT7PbQPSSjDitHcHGWgCipLBPp66qeVMhf91I4apk
         4w6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780269479; x=1780874279;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OIFmAzxejQrp6RSd8J5lsgupOjIxf+PM9ArBTVLQHLA=;
        b=pwqQRO/PCElFTk9hXjU1aj07zi+7JrykabnLL5Ygu7NihdRX32rxfKR6Eh4QZe9d2t
         mc0G+omVUFMrnioO370gqD5t4T7ZWAgcCDo2R5umgyb93yqNtqg02PgogQ1MYOrBVXnC
         0H2PMqJlmmiaHdlXd7ul0yOIrHQdi6+ugiMWho4/COieRyT0uRI3IwwgEmuYNS9trG3q
         DQSyCSIFPrarswN0QsCdlvhrwzlWRp58stZidMLDWi7vV1k9ZiXMFQUAnDaxsvulbN2+
         1SdqGDBwni1x0f/BqljZvgTGCCElo/TVat9JSNQR3Jsncm2w40G8aDpVhOr2DMILBVg+
         PWqg==
X-Gm-Message-State: AOJu0YxilO55SYjIDApok9KsUZlEE2kQz6APs76XcZUV/SXVEUxCa+zx
	CUrLlIK8ijAwQFuPvCDsWOyrzFY31/yLs85BdvDNOpoIGVMurDV3EpRge5ryVYAlwIQ=
X-Gm-Gg: Acq92OG5s1MvzN9fYWGMnx6oij1kaNZuUjHhnE1wvIlKDkJEPGmofzn5MK8kb/qjCth
	7ombpdJDQzIR+QTu4boUwKaAgCQSdGJu/wBGedBUoKp4T+V1QQAzukR79JQkGGiOT7OG16GAGvL
	i+KQTavNUytecPtIVbUrIXc6rtRRfWijDQIausrZkoGyWmqyg7FuOgoWwcCpO8pEllFpRXeYTPg
	EGIBPTq6hjRC5o/05NF1+2ZJTFoWRVIx8/oZNn/w+u+fPAlwAbbiMc5IPnJhFqpuD6qSPhoL/C5
	bgIHkWnfv41Ww/ZytBMbbb4QiT79rV8uCZUujAcgoXEOBjTimDd5TT5YZcvroEhvZaVo+iNyEKy
	l1ESygQKGsrlUgZy8l+nffjeb8LtIUyjYXKGqwk0GlIr+3qU4Uro+3KsAURn7tILboJouljVr7C
	GAQeTrQF/TXeasw/v2Y6FgXNaD77FXCUW6LlBW0bSPSXaz5LMfPm/Taq6aN37EKT23ldR8nw517
	r8Wu3Zg7OfiELQrRdATf7gx5jIq8cDqF4nPPza4U8BisZc84Ysqe3D6ul+R
X-Received: by 2002:a5d:50ce:0:b0:45e:ec18:f207 with SMTP id ffacd0b85a97d-45ef6b58394mr13286575f8f.25.1780269478978;
        Sun, 31 May 2026 16:17:58 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c5:7815:1301:f27:e3a8:2334:314d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef34b834esm20496544f8f.11.2026.05.31.16.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 16:17:58 -0700 (PDT)
From: Andrew Murray <amurray@thegoodpenguin.co.uk>
Date: Mon, 01 Jun 2026 00:17:39 +0100
Subject: [PATCH RFC 3/4] printk: nbcon: move printk_delay to console
 emiting code
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-deprecate_boot_delay-v1-3-c34c187142a6@thegoodpenguin.co.uk>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780269471; l=4826;
 i=amurray@thegoodpenguin.co.uk; s=20250914; h=from:subject:message-id;
 bh=iIdrzIpbtLvWz4MDbsc58aNL3F6fTnbJs47tQmnDnOs=;
 b=CxvG+4JeIkfc9bjfcipdZnVZu7SXaVegXQCnK10t1RHUldU1+VRTlLNyK3ajoLsSgkqu8OUZe
 rJ5HYDCjexuDZ2X4RQnZDoGf2ca1dMBWG5Bdu9Baj3Go2bX8E9BqZbu
X-Developer-Key: i=amurray@thegoodpenguin.co.uk; a=ed25519;
 pk=0SU0Q8S/uEiCdbXbXS+PvJGUCaBG1nDszD+HPU3Js0Q=

The printk_delay and boot_delay features are helpful for debugging
as kernel output can be slowed down during boot allowing messages to
be seen before scrolling off the screen, or to correlate timing between
some physical event and console output.

However, since the introduction of nbcon and the legacy printer thread
for PREEMPT_RT kernels, printk records are now emited to the console
asynchronously to the caller of printk. Thus, any printk delay added by
boot_delay/printk_delay continues to slow down the calling process but
may not have any impact to the rate in which records are emited to the
console.

Let's address this by moving the printk delay from the calling code
to the console emiting code instead. Whilst this ensures that delays
are still observed (especially for slower consoles), it doesn't improve
the use-case of using boot_delay/printk_delay to correlate timings
between physical events and console output.

Signed-off-by: Andrew Murray <amurray@thegoodpenguin.co.uk>
---
 include/linux/printk.h |  4 ++++
 kernel/printk/nbcon.c  | 13 ++++++++++++-
 kernel/printk/printk.c | 15 +++++++--------
 3 files changed, 23 insertions(+), 9 deletions(-)

diff --git a/include/linux/printk.h b/include/linux/printk.h
index f594c1266bfd411f2238b45374e8a71222f0407c..8ea3ac8201ad541912547305e241e3661f4d8e05 100644
--- a/include/linux/printk.h
+++ b/include/linux/printk.h
@@ -209,6 +209,7 @@ extern bool nbcon_device_try_acquire(struct console *con);
 extern void nbcon_device_release(struct console *con);
 void nbcon_atomic_flush_unsafe(void);
 bool pr_flush(int timeout_ms, bool reset_on_progress);
+void printk_delay(bool use_atomic);
 #else
 static inline __printf(1, 0)
 int vprintk(const char *s, va_list args)
@@ -326,6 +327,9 @@ static inline bool pr_flush(int timeout_ms, bool reset_on_progress)
 {
 	return true;
 }
+static inline void printk_delay(bool use_atomic)
+{
+}
 
 #endif
 
diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
index d7044a7a214bdd4537a5e20d876d99bc3ffe8b3a..a507a2fed5bf4366e24330f763b842a698ecf6f7 100644
--- a/kernel/printk/nbcon.c
+++ b/kernel/printk/nbcon.c
@@ -1267,11 +1267,16 @@ static int nbcon_kthread_func(void *__console)
 
 		con_flags = console_srcu_read_flags(con);
 
+		wctxt.len = 0;
+
 		if (console_is_usable(con, con_flags, false))
 			backlog = nbcon_emit_one(&wctxt, false);
 
 		console_srcu_read_unlock(cookie);
 
+		if (backlog && wctxt.len > 0)
+			printk_delay(false);
+
 		cond_resched();
 
 	} while (backlog);
@@ -1525,6 +1530,8 @@ bool nbcon_legacy_emit_next_record(struct console *con, bool *handover,
 	}
 
 	progress = nbcon_emit_one(&wctxt, use_atomic);
+	if (progress && wctxt.len > 0)
+		printk_delay(use_atomic);
 
 	if (use_atomic) {
 		start_critical_timings();
@@ -1584,6 +1591,8 @@ static int __nbcon_atomic_flush_pending_con(struct console *con, u64 stop_seq)
 			if (!nbcon_context_try_acquire(ctxt, false))
 				return -EPERM;
 
+			wctxt.len = 0;
+
 			/*
 			 * nbcon_emit_next_record() returns false when
 			 * the console was handed over or taken over.
@@ -1595,7 +1604,9 @@ static int __nbcon_atomic_flush_pending_con(struct console *con, u64 stop_seq)
 			nbcon_context_release(ctxt);
 		}
 
-		if (!ctxt->backlog) {
+		if (ctxt->backlog && wctxt.len > 0) {
+			printk_delay(true);
+		} else {
 			/* Are there reserved but not yet finalized records? */
 			if (nbcon_seq_read(con) < stop_seq)
 				err = -ENOENT;
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index ca510b9c76458f5c1e059200060d9d6be4c859b3..5154da85537438905231f829ed8f2ea2550daf77 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -2140,18 +2140,17 @@ static inline void late_boot_delay_msec(void)
 	}
 }
 
-static inline void printk_delay(int level)
+void printk_delay(bool use_atomic)
 {
-	bool suppress = !is_printk_force_console() &&
-			suppress_message_printing(level);
-
-	if (likely(!printk_delay_msec) || suppress)
+	if (likely(!printk_delay_msec))
 		return;
 
 	if (system_state < SYSTEM_RUNNING)
 		early_boot_delay_msec();
-	else
+	else if (use_atomic)
 		late_boot_delay_msec();
+	else
+		msleep(printk_delay_msec);
 }
 
 #define CALLER_ID_MASK 0x80000000
@@ -2471,8 +2470,6 @@ asmlinkage int vprintk_emit(int facility, int level,
 		ft.legacy_direct = false;
 	}
 
-	printk_delay(level);
-
 	printed_len = vprintk_store(facility, level, dev_info, fmt, args);
 
 	if (ft.nbcon_atomic)
@@ -3171,6 +3168,8 @@ static bool console_emit_next_record(struct console *con, bool *handover, int co
 		con->dropped = 0;
 	}
 
+	printk_delay(true);
+
 	/* Write everything out to the hardware. */
 
 	if (force_legacy_kthread() && !panic_in_progress()) {

-- 
2.34.1

