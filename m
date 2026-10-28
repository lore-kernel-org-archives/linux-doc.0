Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793158335;
	b=vPh6rQns/I1IsLJ89IBtMU+LqTIudl8qg4S02PiI2VnxnrGIZykhExJVnHXZjF2h2mW/
	 sJZsSCJp2H9wYUcWqdhuwzq2+T0I71/KB+kkALcGwQrxj8j1w6h/LvVOdtqf9lqzlcuX7
	 0Oe/uAkNmnbEqQD4+/kDz5U+25EqtEEvM4ZMOTXnlfPeXrUVE0KeOi4baSJQlYF6L4NkB
	 nKZrL2HvIodPuSaUxP+j3aSUrbBkkpyFToe57EO9KLvn/DQuibGzTDkeE54wLC2F3lmwO
	 EgNzZCQMO0kxXrUISXynMIs8Kl1x/2QpebZ0jfdxTMiFHNeHk5rd1w1nJ9JAY9BJgoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793158335;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WCtCiCeMvqleVCPGIStS9YbFBYnceHXr+HhJDm7YwVI=;
	b=JXyMA7GeMBK2ltlNXQQhfYxm545RYS4aj9uyUlmwDNVMoY11zQN0A76fI9fhyXcgLScw
	 wpTgUORwyi2nKIaG855nnPEfLyAkfFZwZKaL96fAjIsMIjSI9JX/ayM0Hyjj615pDjCuR
	 km7rRy5Y/MLaFQmGL/+mUjJGSB0e3fckZZS2TbwU1B8SRliy8DswQqIsrw29FaWOBKVK6
	 8CjDHBhx5GacYt8m3eDLXTu1iTs7bq0o3wQ1mVNO15FBWXT6UHPLLQwsJj47/WXMygZOQ
	 b32MXiPuFtvY2K+YYqKOcaN1064qnC/7fBS5O1VSGUbI6LjxmfuxvV6eDEHN92rMnBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m6rhB1DT;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2953E606A33F
	for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 03:32:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2953E606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m6rhB1DT
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48e0d1da913so402080f8f.1
        for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 20:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793158333; x=1793763133; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WCtCiCeMvqleVCPGIStS9YbFBYnceHXr+HhJDm7YwVI=;
        b=m6rhB1DTxD/frThV3rkb81u9I768z3nILRhLvGcghPRdtT0iqdaHBK3PiE4u2uhfb3
         cU6Ijw38u6Gx8Qm3+T1UAB36f54YQtQB/O0yC7YCx4ypqHuDOZyaWkXW/PTDe2HZaU2p
         QS+PE3tT+t8MDIrOMiNDpgStB8k3C/tVX+nJuXvpIV1Ps9OdVA0JUbkdodzdootAOlRp
         23ukxHzOIdJW3xo5xO8MC4ejW9Y283YuV/JkWq9IRoYScVwEJypmIfH9rSADkOq2es6y
         kZq5CVkR0TxB120nYsFh+kUeV8YvBaRJFnbeHA+YPkGtCaBPPfP6rXL6ACX6otHLxNNR
         zomA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793158333; x=1793763133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WCtCiCeMvqleVCPGIStS9YbFBYnceHXr+HhJDm7YwVI=;
        b=jKsKj9NwPFt92L4ej3GNsPCrCc4GIuCEdnEcOq0AEdAEAXlupU0NzX9I3IUbS8x9zf
         B+I1yMJyZ5EltdR03fvsxKhFetSNym+8u9xTUO/qI7238dKnQyxLAiqoFq4oZ/9L80sf
         +xl+SpzaBC+bPO4K+Cqg7VNg6GqJ0JiDONRZ70t5Zvvo5OlSmHUuHX+RIvyQLga3x4jC
         sS7YYy4P44MaL2uz9WvejAqqCKG34oEMluhs0S0HzjlD9wdG2xSQVJKJScBNzJ5Wf3w4
         qlUsza3g0vX1NfZWC7D5r62m3J4VRNTZcxVLABtsijtQGnyzcqVdIvSFZJJ1ju/IOxbX
         tsag==
X-Forwarded-Encrypted: i=1; AKwUvBzcxIGRvY/6i88XK1YIctu+YVc/dgr7lVeLWJOyTpuaxzaDCG1LQ7Ulj27S0zhyJV95QDIwTDF5VhY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLBPiQEo1n3Ix+98FQLhWXRjtT8NHNIfR3kxkAKB5/nCDI5Cuys
	+NBiSmMqf90MpMz5YgnFbKvBbJk2BFoabz6at/ZBQ+iQkyCHKo5jYuy+
X-Gm-Gg: AYBFou2/yQiP++ppOZeOH3iG6Ow1pVjaf0j3eIZR0K11C6tT/0MsgWvRKWkMtl1ubEe
	obg7e8ELuQJ6jAFRt+4m7CoBFNEuPOdOhfqq2PaTF8oR+5t/k+Dr8zG6AVEw8//j2Q5BIhPAoEE
	IC4ffp/LPSmrHvaSNaC2IE0NAhS30NWErCRT6Y1d8btd1y3xtoELc0Ml/S45YBclFQ79NaCB47K
	vRuVG0j+T8+19XzPfDsfIHKZ3nfdiRdQHtoOiFNF4SbqtIzg78azImmg9GPt3E2acZMDjOR6f7O
	r8mpJhhr72Bwn8YVgMXzcLoQGvm1/k41y/wPCnxbc3bSv3/Yb+DmgvnOaOVPMEDkg57KxEajvnF
	RBz83BEvMod9Unz1fJ+r9I0ENCGqkKPHOAIC27w+Ix9ZXms0HYVLYAa5iXEvFOc6xxuIDSg8t4O
	ZJNkMHA+ZEMZpdQEtFxUNsYNep43ESwS4w6Pgf+uyM0DPBRmkbQ3UNzOchRqWJxkL+9rwLmig1c
	rB+eyzgYSzwxFSITUwJ1WdJ2rg96ctzYFoTxnEfWjaNULK2Q9aY/gUJWcelgQQiebHqkqOufF7f
	eNygXuOrntdDNYCIuPIiKpqej69fKQRxoWoLMN1nQh3bTKAgRkfJixlIFC3nyNDANN8WYc8aJbV
	n/vuuBnGLryYWK+xqY6/P9cZYQubJXrbAOEAZx3XKnPQ32Z+0jvCA9uDDuQ+DdCrnXKp7K028xX
	6I7iXSpk59GsfkQOq5o/pDV3zPNGcrCdq8
X-Received: by 2002:a5d:5d88:0:b0:48e:5c9b:f12c with SMTP id ffacd0b85a97d-48e60212fb8mr338598f8f.16.1793158333537;
        Tue, 27 Oct 2026 20:32:13 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a45b-7d01-5035-b393-698f-53f0.310.pool.telefonica.de. [2a02:3100:a45b:7d01:5035:b393:698f:53f0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdfd8dsm24290569f8f.56.2026.10.27.20.32.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 20:32:13 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Ingo Molnar <mingo@redhat.com>,
	Andy Lutomirski <luto@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Hongyan Xia <hongyan.xia@transsion.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	linux-doc@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 11/13] arm64: Use the pre-counted hardirq lifecycle
Date: Wed, 28 Oct 2026 04:31:25 +0100
Message-Id: <20261028033127.82193-12-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261028033127.82193-1-kmehltretter@gmail.com>
References: <20261028033127.82193-1-kmehltretter@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ordinary EL0 and EL1 interrupt paths establish generic entry state before
irq_enter_rcu() adds HARDIRQ_OFFSET and lockdep nesting. Callbacks in that
early window are therefore not classified as hardirq work. Their exit paths
also drop the classification before function-graph return callbacks and the
kernel return tail have completed.

After the EL1 pseudo-NMI decision, enter ordinary interrupts through
irqentry_hardirq_enter(). Finish the staged count update and delayed timer
and accounting work with irq_enter_rcu_preempt_counted(). Use the retained
exit preparation followed immediately by conditional raw count and lockdep
teardown.

For kernel returns, preserve the existing per-CPU register adjustment, then
stage hardirq return-tail classification before MTE exit tracing. Keep the
pseudo-NMI lifecycle unchanged.

The noinstr path also depends on the raw preempt-count and
__kern_my_cpu_offset() inlining prerequisites earlier in this series.

Link: https://lore.kernel.org/all/c3a90368dd6c096af9d918e036a27728696fb8a4.1786603168.git.hongyan.xia@transsion.com/
Link: https://lore.kernel.org/r/20260918161407.2300-12-will@kernel.org
Assisted-by: LLM
---
 arch/arm64/kernel/entry-common.c | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
index 003f84109a913..d70cffffe71c6 100644
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -94,6 +94,8 @@ static void noinstr __arm64_exit_to_kernel_mode(struct pt_regs *regs,
 {
 	local_daif_mask();
 	irqentry_exit_pcpu_adjust(regs);
+	/* arm64 uses the split exit API, so enter the tail before MTE tracing. */
+	irqentry_hardirq_tail_enter(&state);
 	mte_check_tfsr_exit();
 	irqentry_exit_to_kernel_mode_after_preempt(regs, state);
 }
@@ -560,13 +562,19 @@ static __always_inline void __el1_pnmi(struct pt_regs *regs,
 static __always_inline void __el1_irq(struct pt_regs *regs,
 				      void (*handler)(struct pt_regs *))
 {
+	struct irqentry_hardirq_cookie cookie;
 	irqentry_state_t state;
+	bool do_sub;
 
-	state = arm64_enter_from_kernel_mode(regs);
+	state = irqentry_hardirq_enter(regs);
+	cookie = irqentry_hardirq_count_state(state);
+	mte_check_tfsr_entry();
+	mte_disable_tco_entry(current);
 
-	irq_enter_rcu();
+	irq_enter_rcu_preempt_counted(cookie);
 	do_interrupt_handler(regs, handler);
-	irq_exit_rcu();
+	do_sub = irq_exit_rcu_preempt_counted_prepare(cookie);
+	irqentry_hardirq_exit_finish(do_sub);
 
 	arm64_exit_to_kernel_mode_preempt(regs, state);
 }
@@ -877,16 +885,24 @@ asmlinkage void noinstr el0t_64_sync_handler(struct pt_regs *regs)
 static void noinstr el0_interrupt(struct pt_regs *regs,
 				  void (*handler)(struct pt_regs *))
 {
-	arm64_enter_from_user_mode(regs);
+	struct irqentry_hardirq_cookie cookie;
+	irqentry_state_t state;
+	bool do_sub;
+
+	state = irqentry_hardirq_enter(regs);
+	cookie = irqentry_hardirq_count_state(state);
+	mte_disable_tco_entry(current);
+	sme_enter_from_user_mode();
 
 	write_sysreg(DAIF_PROCCTX_NOIRQ, daif);
 
 	if (regs->pc & BIT(55))
 		arm64_apply_bp_hardening();
 
-	irq_enter_rcu();
+	irq_enter_rcu_preempt_counted(cookie);
 	do_interrupt_handler(regs, handler);
-	irq_exit_rcu();
+	do_sub = irq_exit_rcu_preempt_counted_prepare(cookie);
+	irqentry_hardirq_exit_finish(do_sub);
 
 	arm64_exit_to_user_mode(regs);
 }
-- 
2.39.5 (Apple Git-154)

