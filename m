Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792646263;
	b=xA1+R68lhSO3V5BMh6pRYxbAlQoZ98qKlwd+DGZzW2/HweBzOKGFbs0eGm9kN1d27s8F
	 h9jzCi0W/E6duCHSYSMoHw6HWPhsinu8eU6+W8hUYjz6TsKw7aEgI9GzWKnRxfjKxqiqo
	 BwIpwiAQTypKYS923MEF6xdFx7dvGQJ+gA52ak00bCK9jPm+2uVS3Kq6ZHYT6M3+U4ULB
	 R8jFqacvBS9Z6tI6LYdexCoU8rqF5OvpZfOEOFAZzi0kTEcDTR7faqYzWLC3tPjA71qC3
	 aLIzxcgNkG5gzAWOw14XnX9EC8r4FkGv1zYIdezO4zbI7kTdM3E9/WKMRNkhC0ymVLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792646263;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kNAQ43P7mOXqvjFIm1UIgh+LHBg4TUD3j/lYh+CFxWo=;
	b=n1dA0WBKwHxOhPmbn6dT+jfUAOnwzYry5wX+mUfNv7VqxSly4vb7lN1bTRGWEanKvN/r
	 lEk7UGV7n67FhEsMW7Se4kaMEQxuXwI5kuRto0TjCQ+AOOOGTePyuZoyDBSTuUV2v9Ixe
	 z/7Mz01ubPi7lZBCbkm+7EXBB+6vxxOueIrgHCMX7jEbxr7bNXpSdCkQcx+xTkw2qpWIX
	 +1dCFGVCGxDIlIXA2t08Bn3asqzCzishs1XrmsMYe41sA6XlfoRIpM+bhuO9vQHOs/Naq
	 bc/GY7VFx0EBUEgNMWmbGUwjTAdNuXwyDk02l4sPLRkZIZv6q6TYqhIaiA6C2qb4uEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sVoa5sPI;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417F260A261F
	for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 05:17:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 417F260A261F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sVoa5sPI
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a2001dd4e7so14050425e9.3
        for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 22:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792646262; x=1793251062; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kNAQ43P7mOXqvjFIm1UIgh+LHBg4TUD3j/lYh+CFxWo=;
        b=sVoa5sPIaKdctHZpZqX/Tr/a3nD/WcLeHZH9WemG0HXKqTdFFgQaFQZ4Cur//1TVtP
         +IJn6IC0dDP6m4vxjQWZ5aR79dbKnXLHOPNUVurEmFnZV/yqzsl/muVxW+cMH/0zPQdd
         dK/8pqIuUUk9dLZUuIQTWEglQ5bCKqg/XsY7lVX/kuRlghT8EUfinDMS4f2mkQ8Mt9Fz
         EmXEQVQ/l6Wtatrq/tc7Is3h3kRt4DHc0JnYD0UP1IIfrpj77eW+iAD7w+r8XxYlAHrZ
         EElQx2RYSJCa1tDUa2Y9+3pFcnzxyHS/dBzXaHOgb2gR8NWlTrnSbb607yDipz8V6BfE
         WVNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792646262; x=1793251062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kNAQ43P7mOXqvjFIm1UIgh+LHBg4TUD3j/lYh+CFxWo=;
        b=lJqAmgeGjxRiNnP8pWiWGWb4Qft5Rxje1BlXNnm0E1UxtEiObBEJfbPGE2wWdZNV7p
         9ILVRkN6hjRZSAWotQgzo6dTeqj4UC97wxqkEqYU5m1cZKNtLQELzMZCBlHc0X/uKtCn
         vyKH8i/+SKHoUMGEgMztgmrnSlsw4ssn4yAhiYhbA/NPaR8MVrwkbfn63Cd4b+nealcI
         tnxC2rNTnu+zQVvNsHuziwzfF10+C77jU2ECOmkB6AFQNe4HYb2Eo1AIUmflYsOoa7It
         yJMZs5N1MMHdRyRmdPYqXPKqzqwVAP7n0erFCCDonWOWb5feVgA4c1PIso0eW5VnTXU4
         N00w==
X-Forwarded-Encrypted: i=1; AKwUvBwSaFD4H17bWIcOTmHr5VUjd4eNevDl8ECip82+PjRqloIJYqhWORBF7JNonj0xAGdQlxB70Upk0ZU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLOA7ThTbOPIZKamiTvsclAscL3AEsuW3hN7Dl+H11cJKc7sDuy
	Cf0eYXQi7eNYw9LsMxHTF8OjZC/Fmicdyr5WEBwudze+Gk1wXlQWnjJo
X-Gm-Gg: AYBFou0SYi1LCVfLkkHBMjRXPQQOmIsaRftpDYM4B0gDvuU/Se796VkSHXf1RLP8P3O
	jAlamXFbem2sPlvE8RSN8UIM23smK3Aevnkm3Zm0xOqjKjFoEFZDnHz+3rXOWKcJS6+Ofu4SroR
	wYFzhV274Utbco1o/e7FDD0fPu9l+Yb8fl8WmOdWuLj+/HQwdDCBNVVxqIievuZG9U38Pf59Nlv
	o9S383gdjYuiACrNl2VpKLJfEenfRACT4dimKgqfvBrcQSRwSFG3bdwpALRpzNeCYFN+IkX3fZo
	r7k85swKyYT9U+PUC4AGIVdmB1KvhODqHKVUcSELRu8DYBeWyWeASntALcFNa+ypfBNni47Hetb
	mKj5qiMXrD1r12Q9DUKNkHIaQWXTBkc2ssNsIBAgTXzDELa2hupxdraIQHqC3KVmAQujxNfSldv
	m8lOzCKVLtDqbZpZGPcjYnGS33QIJI4Nxhxe85eCFOzdCXNBisSBodu6+YQQVkBJDho4hySwMqT
	fA/3ApAJAT0njh3RQHuEjozgdZow53u9QNizv8YtrIKSeU4OOGsrpvlnoAyxFzTqXyhyx9ZAG83
	zoYcpFzghO0JXtrLa8l/QY5l8S+BUZx52GRnh4VeUGGg4abdDCH6K22/ot9zgMmG0WEPETF0+Z0
	Q4AtVuM79hGjGpuckkM4bf+ehWTUvKHmdWQhRhrT7h0MV6tM5mmPh75rr7k23Y3tQ2+gWUaHA+m
	lAV6oifQ==
X-Received: by 2002:a05:600c:8b4c:b0:4a2:729:f7ce with SMTP id 5b1f17b1804b1-4a20729f92bmr16486165e9.8.1792646261504;
        Wed, 21 Oct 2026 22:17:41 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad43-d501-2c28-bb72-120d-420e.310.pool.telefonica.de. [2a02:3100:ad43:d501:2c28:bb72:120d:420e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fd0f4427sm90362275e9.3.2026.10.21.22.17.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 21 Oct 2026 22:17:41 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Ingo Molnar <mingo@redhat.com>,
	Andy Lutomirski <luto@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
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
Subject: [RFC PATCH 09/12] arm64: Use the pre-counted hardirq lifecycle
Date: Thu, 22 Oct 2026 07:16:51 +0200
Message-Id: <20261022051654.79224-10-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261022051654.79224-1-kmehltretter@gmail.com>
References: <20261022051654.79224-1-kmehltretter@gmail.com>
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
irqentry_hardirq_enter(). Complete delayed timer and accounting work with
irq_enter_rcu_preempt_counted(). Use the retained exit preparation followed
immediately by raw count and lockdep teardown.

For kernel returns, restore return-tail classification after masking DAIF
and before MTE exit tracing. Keep the pseudo-NMI lifecycle unchanged. Force
arm64 preempt_count() inline so noinstr callers cannot be outlined into
instrumentable text.

The noinstr path also depends on the raw preempt-count and
__kern_my_cpu_offset() inlining changes carried as patches 1 and 2. Keep
them separate because they are externally authored fixes.

Link: https://lore.kernel.org/all/c3a90368dd6c096af9d918e036a27728696fb8a4.1786603168.git.hongyan.xia@transsion.com/
Link: https://lore.kernel.org/r/20260918161407.2300-12-will@kernel.org
Assisted-by: LLM
---
 arch/arm64/include/asm/preempt.h |  2 +-
 arch/arm64/kernel/entry-common.c | 23 +++++++++++++++++------
 2 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/include/asm/preempt.h b/arch/arm64/include/asm/preempt.h
index 4f917596f387d..3d61be0f825fb 100644
--- a/arch/arm64/include/asm/preempt.h
+++ b/arch/arm64/include/asm/preempt.h
@@ -7,7 +7,7 @@
 #define PREEMPT_NEED_RESCHED	BIT(32)
 #define PREEMPT_ENABLED	(PREEMPT_NEED_RESCHED)
 
-static inline int preempt_count(void)
+static __always_inline int preempt_count(void)
 {
 	return READ_ONCE(current_thread_info()->preempt.count);
 }
diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
index 93056a766fb20..fda807c61ff27 100644
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -56,6 +56,8 @@ static void noinstr __arm64_exit_to_kernel_mode(struct pt_regs *regs,
 						irqentry_state_t state)
 {
 	local_daif_mask();
+	/* arm64 uses the split exit API, so enter the tail before MTE tracing. */
+	irqentry_hardirq_tail_enter(state);
 	mte_check_tfsr_exit();
 	irqentry_exit_to_kernel_mode_after_preempt(regs, state);
 }
@@ -523,12 +525,16 @@ static __always_inline void __el1_irq(struct pt_regs *regs,
 				      void (*handler)(struct pt_regs *))
 {
 	irqentry_state_t state;
+	bool do_sub;
 
-	state = arm64_enter_from_kernel_mode(regs);
+	state = irqentry_hardirq_enter(regs);
+	mte_check_tfsr_entry();
+	mte_disable_tco_entry(current);
 
-	irq_enter_rcu();
+	irq_enter_rcu_preempt_counted();
 	do_interrupt_handler(regs, handler);
-	irq_exit_rcu();
+	do_sub = irq_exit_rcu_preempt_counted_prepare();
+	irqentry_hardirq_exit_finish(do_sub);
 
 	arm64_exit_to_kernel_mode_preempt(regs, state);
 }
@@ -839,16 +845,21 @@ asmlinkage void noinstr el0t_64_sync_handler(struct pt_regs *regs)
 static void noinstr el0_interrupt(struct pt_regs *regs,
 				  void (*handler)(struct pt_regs *))
 {
-	arm64_enter_from_user_mode(regs);
+	bool do_sub;
+
+	(void)irqentry_hardirq_enter(regs);
+	mte_disable_tco_entry(current);
+	sme_enter_from_user_mode();
 
 	write_sysreg(DAIF_PROCCTX_NOIRQ, daif);
 
 	if (regs->pc & BIT(55))
 		arm64_apply_bp_hardening();
 
-	irq_enter_rcu();
+	irq_enter_rcu_preempt_counted();
 	do_interrupt_handler(regs, handler);
-	irq_exit_rcu();
+	do_sub = irq_exit_rcu_preempt_counted_prepare();
+	irqentry_hardirq_exit_finish(do_sub);
 
 	arm64_exit_to_user_mode(regs);
 }
-- 
2.39.5 (Apple Git-154)

