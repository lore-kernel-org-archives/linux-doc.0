Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 600C13A05FC
	for <linux-doc@vger.kernel.org>; Sun, 12 Jul 2026 10:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783851661; cv=none; b=OhO4Ney418wHVuWnJ3OhMKeNLhp4V4jRVKOWmqgVZqzp524MIUDD5jR+NSm/eRrlSk+8ulw6T9Kdx5wInL+PLnF/Vl1r0OWdb8obrdH02loJLv4IYtHn9a6SqvwSFVoDn5nWdDs0mhqpj+o4wgKpj6FmTxOAi1c6Lhi151BbmfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783851661; c=relaxed/simple;
	bh=xTPk7bMacGsIS4hNT11NNaci9eKHhXtcV+ZSTG0lKOA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YI6ppsEpHLjeyPhbK6ngSCJF7CS1bkLv/mtRWZS1l793kTxQjxoxw3nX/OPLRF7arKXPEpWehIzfVwIAU3EpDijL/GrjecxXp5RF1TRikDYNLRFAJrBi1vphAGY4D40makTrLkC/qGbE6It2hQ95Y+9/2ScEZyt7m4w3tIM1K2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=RsVsmPuv; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="RsVsmPuv"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47f3e6cc44aso157752f8f.3
        for <linux-doc@vger.kernel.org>; Sun, 12 Jul 2026 03:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1783851657; x=1784456457; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R4okvR3IhWuHkCCKPiXQFEOz843paGIoXKBrsbvfXgQ=;
        b=RsVsmPuvkY/M7Jy8etBEKBQOquwy0B/0jRpFxFEU8VBwzgVH5E/4gKP/W3Q+Nj29Oq
         4GtuC+rtlYF8086rmMcd/4YoU/f2YvzWltgWXYmtqrST1wcZ1/KM218DOHK++Lua97dc
         kBO/dlmkXIK00BnykFTo1qRj6R/A+TOZy6PnH/P0Hqrc3ovLoqv2bFludOKPfafl/Zp9
         OFEQvPesoSgUkcdO43LNFl6H6IAeiU/mHmsyGAX2h/SEBrPBBjPBm8B65zABcSrfjjf5
         pIjqyHTXDiG3LlmB04mXZv/8WzHuVremWA3BFYb8E7fhJQezvrSnxSEN/Nc/0QRjPgJe
         SuVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783851657; x=1784456457;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R4okvR3IhWuHkCCKPiXQFEOz843paGIoXKBrsbvfXgQ=;
        b=oGgPTMczObfEXdR9K2VXodEbz96OpCX8h/PJDkuBE7Gu/el7c5ZzSS46w4oY/5t0OM
         eLMyuL7LhfSGJT9o2QLTmoJmnwP2FgpQhZzMhcOi6DLNs+4cbccr7z5uig2450yAfnYx
         tqygHOOyXHn2ddTHpTKxuIig62Lmh1nAlyWYHIAyP7FkJqABjTLlkxSIP7cxUB6A52mS
         GZBWL0AERybSpUTt1EL1ugELehkaGiLtXLSKT8ud7jdWh1VZoTqgedQTFrP2/JafzHzb
         az0Bn46hwHQdlG5Beq/NmYGYygSsX0OsAk0TxCBsH2RApaxJ5Cg9LU+KaRYQ15m5JU4X
         l6KQ==
X-Forwarded-Encrypted: i=1; AHgh+RrmLEaC/YvBsMZv+fErN+5eNU+Ngx93x5Odx1Cnfj1cvIx77aTvvGwI3hlpR13UmGPYPjkCbPzuEFk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPST0CyJBgfME4jeu/fmHlC0YYbRvrbgfWLjNYQVTwWultWIEL
	z3Z22dxRiQx2nSxm1jSE5g6YxfHbYzSzD+nnPpZ03Jd+TQ1e8PeLA+Yu66t+nsH6pRA=
X-Gm-Gg: AfdE7cmWE7wC2wPZxE8Yrq9wnBlZrPbXqXEDhH97uEhFOmgkaQ97UbU0uMnAn+MxkxY
	Qt9U141n0hezMs0xmPJm7xHax6jeUlrHcD5Zu5c+UFvTMztBUm7hPhAppPWdIL3n772If/VyCu5
	VS06xGOWt+nthRNGQzVrkjoeqBB4zX70y2ysYE3PUp9GZ04PTI3b7ENG2Z8JGQS8mWppfbFc92b
	pitzKQVWyLw2h76hQGn/RzWa7wQ5sHam4I714kYnEKV3SLrsswz35SrpASJxrf6p0MAG+QS9u1d
	kki/QaJaYIWvT0X1oYiDxmgkP6sJCot3Jvtzf6gmftVbSqlJ91MCgO8eFnQqucSR55XScd/CIgw
	v0qitDJUT/8LZRwMHBsYTYE7iO0iHjGEMd3VLVZwX1/yQB39nhjy6ptGb7bLSCSKiqo4FjxONA/
	mI6xtbjydLoi/2XZYurTWryBG+2/ZQcHs6f4qFyx2l37doFdvME4nhvMFq7eJlrVGWQYcjBxvCj
	VB8gRvjyNAzIyJqFJhXM40tgJ1J
X-Received: by 2002:a5d:5d0c:0:b0:47e:aa3f:2c48 with SMTP id ffacd0b85a97d-47f2dcee22amr5636508f8f.51.1783851656563;
        Sun, 12 Jul 2026 03:20:56 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c5:7815:1301:f27:e3a8:2334:314d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039ad21sm75005672f8f.20.2026.07.12.03.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 03:20:55 -0700 (PDT)
From: Andrew Murray <amurray@thegoodpenguin.co.uk>
Date: Sun, 12 Jul 2026 11:20:36 +0100
Subject: [PATCH v3 5/6] printk: nbcon: move printk_delay to console emiting
 code
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260712-printkcleanup-v3-5-574547b8f71b@thegoodpenguin.co.uk>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783851647; l=7650;
 i=amurray@thegoodpenguin.co.uk; s=20250914; h=from:subject:message-id;
 bh=xTPk7bMacGsIS4hNT11NNaci9eKHhXtcV+ZSTG0lKOA=;
 b=olCuUnSskP8UUcCkrJl0aZbQZPg6LbVsW50TcUx2lh6wX1N1jyRaLr9/xYisz5o4FFw3PNpfW
 Hk7uUNFriYoBwgXf+cRf1/nZo/sd0cjr4P9/6D1KCA4Rdx2Uyc4hZnB
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

Behavior change:

Please note that printk delays now occur after messages are emitted
rather than before.

Please also note that the printk delays occur within the printk_safe
(irqs off) context.

Signed-off-by: Andrew Murray <amurray@thegoodpenguin.co.uk>
---
 include/linux/console.h  |  5 ++++-
 include/linux/printk.h   |  1 -
 kernel/printk/internal.h |  6 ++++++
 kernel/printk/nbcon.c    | 13 +++++++++++++
 kernel/printk/printk.c   | 17 +++++++++--------
 5 files changed, 32 insertions(+), 10 deletions(-)

diff --git a/include/linux/console.h b/include/linux/console.h
index d624200cfc1708bf73925892a466efe0c95c5586..0f7a69bd1a42af38208fdb28971114f76f99a968 100644
--- a/include/linux/console.h
+++ b/include/linux/console.h
@@ -266,6 +266,8 @@ struct printk_buffers;
  *				might cause a system freeze when the console
  *				is used later.
  * @backlog:			Ringbuffer has pending records
+ * @emitted:			The context attempted to emit the message. Might
+ *				be incomplete.
  * @pbufs:			Pointer to the text buffer for this context
  * @seq:			The sequence number to print for this context
  */
@@ -278,6 +280,7 @@ struct nbcon_context {
 
 	/* members set by emit */
 	unsigned int		backlog			: 1;
+	unsigned char		emitted			: 1;
 
 	/* members set by acquire */
 	struct printk_buffers	*pbufs;
@@ -298,7 +301,7 @@ struct nbcon_write_context {
 	struct nbcon_context	__private ctxt;
 	char			*outbuf;
 	unsigned int		len;
-	bool			unsafe_takeover;
+	unsigned char		unsafe_takeover : 1;
 #ifdef CONFIG_PRINTK_EXECUTION_CTX
 	int			cpu;
 	pid_t			pid;
diff --git a/include/linux/printk.h b/include/linux/printk.h
index ea52dc72b73b64898f82a0319b01c27323b18dee..8885e11367d50ea1cd7642249852d011e589adb4 100644
--- a/include/linux/printk.h
+++ b/include/linux/printk.h
@@ -188,7 +188,6 @@ extern int __printk_ratelimit(const char *func);
 extern bool printk_timed_ratelimit(unsigned long *caller_jiffies,
 				   unsigned int interval_msec);
 
-extern unsigned int printk_delay_msec;
 extern int dmesg_restrict;
 
 extern void wake_up_klogd(void);
diff --git a/kernel/printk/internal.h b/kernel/printk/internal.h
index 85fbf1801cbe070ad96d253bccdf775a11bf945a..c3586f8b8360208902bbbd4607413997bcbd5fb9 100644
--- a/kernel/printk/internal.h
+++ b/kernel/printk/internal.h
@@ -33,6 +33,8 @@ int devkmsg_sysctl_set_loglvl(const struct ctl_table *table, int write,
 # define force_legacy_kthread()	(false)
 #endif
 
+extern unsigned int printk_delay_msec;
+
 #ifdef CONFIG_PRINTK
 
 #ifdef CONFIG_PRINTK_CALLER
@@ -131,6 +133,8 @@ static inline void nbcon_kthread_wake(struct console *con)
 	rcuwait_wake_up(&con->rcuwait); /* LMM(nbcon_kthread_wake:A) */
 }
 
+void printk_delay(bool use_atomic);
+
 #else
 
 #define PRINTK_PREFIX_MAX	0
@@ -162,6 +166,8 @@ static inline bool nbcon_legacy_emit_next_record(struct console *con, bool *hand
 static inline void nbcon_kthread_wake(struct console *con) { }
 static inline void nbcon_kthreads_wake(void) { }
 
+static inline void printk_delay(bool use_atomic) { }
+
 #endif /* CONFIG_PRINTK */
 
 extern bool have_boot_console;
diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
index 4b03b019cd5ee25d68e9ace84392045e91241a7f..c8427906b1c54fb00d005ef87f7280e89fae2579 100644
--- a/kernel/printk/nbcon.c
+++ b/kernel/printk/nbcon.c
@@ -1069,6 +1069,8 @@ static bool nbcon_emit_next_record(struct nbcon_write_context *wctxt, bool use_a
 	else
 		con->write_thread(con, wctxt);
 
+	ctxt->emitted = 1;
+
 	if (!wctxt->outbuf) {
 		/*
 		 * Ownership was lost and reacquired by the driver. Handle it
@@ -1267,11 +1269,16 @@ static int nbcon_kthread_func(void *__console)
 
 		con_flags = console_srcu_read_flags(con);
 
+		ctxt->emitted = 0;
+
 		if (console_is_usable(con, con_flags, false))
 			backlog = nbcon_emit_one(&wctxt, false);
 
 		console_srcu_read_unlock(cookie);
 
+		if (backlog && ctxt->emitted)
+			printk_delay(false);
+
 		cond_resched();
 
 	} while (backlog);
@@ -1525,6 +1532,8 @@ bool nbcon_legacy_emit_next_record(struct console *con, bool *handover,
 	}
 
 	progress = nbcon_emit_one(&wctxt, use_atomic);
+	if (progress && ctxt->emitted)
+		printk_delay(use_atomic);
 
 	if (use_atomic) {
 		start_critical_timings();
@@ -1584,6 +1593,8 @@ static int __nbcon_atomic_flush_pending_con(struct console *con, u64 stop_seq)
 			if (!nbcon_context_try_acquire(ctxt, false))
 				return -EPERM;
 
+			ctxt->emitted = 0;
+
 			/*
 			 * nbcon_emit_next_record() returns false when
 			 * the console was handed over or taken over.
@@ -1600,6 +1611,8 @@ static int __nbcon_atomic_flush_pending_con(struct console *con, u64 stop_seq)
 			if (nbcon_seq_read(con) < stop_seq)
 				err = -ENOENT;
 			break;
+		} else if (ctxt->emitted) {
+			printk_delay(true);
 		}
 	}
 
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 4517266e9ca112e0dcb0163a99dd0e8d50931848..5df09e56cf8abc2d0555b6950eed4e483ba56d4b 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -2143,18 +2143,17 @@ static inline void late_boot_delay_msec(void)
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
@@ -2474,8 +2473,6 @@ asmlinkage int vprintk_emit(int facility, int level,
 		ft.legacy_direct = false;
 	}
 
-	printk_delay(level);
-
 	printed_len = vprintk_store(facility, level, dev_info, fmt, args);
 
 	if (ft.nbcon_atomic)
@@ -3185,6 +3182,8 @@ static bool console_emit_next_record(struct console *con, bool *handover, int co
 		 */
 
 		con->write(con, outbuf, pmsg.outbuf_len);
+		printk_delay(true);
+
 		con->seq = pmsg.seq + 1;
 	} else {
 		/*
@@ -3206,6 +3205,7 @@ static bool console_emit_next_record(struct console *con, bool *handover, int co
 		printk_legacy_allow_spinlock_enter();
 		con->write(con, outbuf, pmsg.outbuf_len);
 		printk_legacy_allow_spinlock_exit();
+		printk_delay(true);
 
 		start_critical_timings();
 
@@ -3214,6 +3214,7 @@ static bool console_emit_next_record(struct console *con, bool *handover, int co
 		*handover = console_lock_spinning_disable_and_check(cookie);
 		printk_safe_exit_irqrestore(flags);
 	}
+
 skip:
 	return true;
 }

-- 
2.34.1

