Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792646255;
	b=SCm5pq/RZDYfisdhgowltRp0dKO2BTguKhQy1YSgQF4ZcdfnRzWWs7PRceiEMBCyqmh6
	 pzn//eL61RFXQ+Xw37gvAR70j9zDd2RPcdkj9G0chU/J/SwN7W7Ar1dS/dC/9FYIaYbBP
	 uEhvBeWJk9+knxgKUOwCFmjCxC5UUIghgu0XzfRhwCCwpLLPhiUx7hpXKi1r97/G1HsiV
	 UZnzIvW+0XtelypAKT1Qi/GbXpjyhPuITOIsxS7OJM/DY/LtiGL4ttgU0dMBByLlu55Wl
	 6SE1T0sn4InBUBG03J9G++b4rzCUp+VKPfwC+LYe3ljzmpjLEx9aUs3lDS2qjUmwbiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792646255;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=o431Tw10LszC2V1Uv9HWe6VBCp/9n4XWQz8uJL/s53U=;
	b=aF6Kbh2nYVFRnFcYlZA848R/npQNWlRcuCi5wvtJzZIB/3LUnNBbM9+sz/SkMFyVuhCI
	 lx4CX5wdMnwLaQAeyFyAP2HObKGc5jFc53OsfKe+EwRJF10s0O6zNjAuH8mUTcd3Rt3eC
	 tMEHvRTRn00e4nUXfabhWBw5D+zpQUKO4gcJwFPUr3cu8VJ8xWm3M6oXMXYz9Jl08ENOm
	 hOifx7/ixdB1S+oErU/K5+koB9S3ee8wDhG5Iy2ZqJuFGpF4pHBqNEWSSJqt6z2cW4Z1H
	 wQUJeooxxBvkyLEVJyLRAx98H+Kei6cU+r1QpZMxCG2sBIhYCFFN9IaOP9TgwiQn63g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RzHwvSq2;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8460860A2625
	for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 05:17:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8460860A2625
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RzHwvSq2
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a1e34ecb02so9633935e9.2
        for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 22:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792646254; x=1793251054; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o431Tw10LszC2V1Uv9HWe6VBCp/9n4XWQz8uJL/s53U=;
        b=RzHwvSq2K3s5a0rf/pDlZSEgoSA7iM8cuXfaPb7r/TLPrxl+I2LC8gNwKD2BUcXCK6
         O6SFBM7XdQRVhTDql5gW8i+3zErEep5djtSe7MUTJSt4Vyy6ICuNP7imXUtDe1eoxu37
         lGbYIBJ4eI0SJoRqY6aMdinrDOvkcQvt5V45URI/IZuErdzvr1nHqsBw8dYjJGQ/O7vM
         H0+FeMdrq9hnYUszy0CA9URw0h1HNdRhElAQlXrpEXr4pD7XP5mHWnL8fzmtMarP1Z/k
         aCuub+KE0gPpACapqN9xqJrVUhZE0AabWfr98dH9+IXvjbcmPNU1oO/wg3QZcFJUKoxY
         BGng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792646254; x=1793251054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o431Tw10LszC2V1Uv9HWe6VBCp/9n4XWQz8uJL/s53U=;
        b=ralaA+DjHX25E52wCfkSZ/ocOecnDBnKHTmOCXGswDOpiesI3a2xh7B5a8hQWXSQ35
         SKZC4NGcbKhoCqNGbD56ojwSTnD/gfWsGbiUPvqG6dKEOfmWSzr5ub4s2SmITAgUQrX5
         rvy2+G0VNDPl5Gvhv0QrcDgYftin92l1926niZ2oTofm3dT8qONJbPs5mq4774PhDyfb
         WaWHm2ZRUbgN6LrlLaPQa4apptrBCH9cbHGnKTGCafE8obDH9AX3jYicDGkZ/ZEtD+Js
         0Gy5t7FY50uvnZ/8Upw7ri0qGB3eiirEGJLFanhhEvbg3Xam66Z4/2sNdZHsZN9jwyDx
         v2lQ==
X-Forwarded-Encrypted: i=1; AKwUvByf93g8Q/lUhkWbS8ckPQ2+KDI4JsQG1dns6WRxQwQxnuJdG8B1ZIatIQc6O7/ZAdJF1x97QyZPsoQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKKyn7T8AkWm1gzVWHJNHCZnxn6pOaW87qmBfKCMkneNsOkyahN
	y/Z9Ti6ucYpWkIz24LgOFyavXyTB7nvvpv9u56s0lEzP3NFjOEcDZpkY
X-Gm-Gg: AYBFou1EFBVlAa6SxHZYkIj1x/TxsN7qg0sfRGm7/O72BUi7F8HrwM9KqwqlxV8VRrW
	xDPvthqC4oOunFHIou0fqLQS/n6vwvRL+dY08CSxjMPoxBIx2+CAzxTgUCant4ZYGUQTdRi3G8B
	kaABwbH5WUeNBW4cUAJTNjbaW3q596onweXGhdmb2vTOoHerJlqJ6iKLFk+wntUPJPXKxniTCKY
	tBqwaO3KCdrnndfAONmpL8HOzPiLBoOgVuCW7b56ppc+I3CPebYRRVGOXc/YGOisIHWwu0NBtB8
	NS8n4idDKEK0GLIHY+FiIASlnwulG1YTReubu6iZL9O1oVud0P0LyK32Laf+k7c1RqXntzWHQEH
	TYsKul+ggK+z5EyrBVDWW8ssFUzczOGymffxF97dN71ka5n8yNVcGyX/bxEj/zL2RRFdTQZ6bPA
	Msfgftp9KBFl6OTZLBnzt6MEIXtGgtv5yH6MYrS90oRK4iaw9x0FuRiYkOs/iALSSmCUVrR21y5
	yG347gVfp0EqcIj+oOhZOOxiAQnlo/Q4i47evWmyhLk4zbLkzm4rtz+a1+U0xguKu7gZPmHDKie
	wtaWPuaErA7iR0g8hhvDTbBj8uPbndQU+Dy8MGNTA951SkIInWANQdlD66aYorciM+swb99WATB
	4jbEVsdDxZG3W7QS9uxOM6PH6oNtNTRiYcN3BqKK5nkbMYacE/wv6HUYMgRw=
X-Received: by 2002:a05:600c:4e03:b0:49f:fe39:5bc8 with SMTP id 5b1f17b1804b1-4a1fdd14200mr75350095e9.12.1792646253837;
        Wed, 21 Oct 2026 22:17:33 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad43-d501-2c28-bb72-120d-420e.310.pool.telefonica.de. [2a02:3100:ad43:d501:2c28:bb72:120d:420e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fd0f4427sm90362275e9.3.2026.10.21.22.17.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 21 Oct 2026 22:17:32 -0700 (PDT)
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
Subject: [RFC PATCH 07/12] entry: Carry ordinary-hardirq provenance through kernel return
Date: Thu, 22 Oct 2026 07:16:49 +0200
Message-Id: <20261022051654.79224-8-kmehltretter@gmail.com>
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

The entry state can cross hardirq teardown and a possible reschedule before
the architecture completes its return tail. At that point preempt_count()
no longer identifies whether the original entry was an ordinary hardirq, a
synchronous exception, or an NMI-like event.

Record ordinary-hardirq provenance in irqentry_state_t and initialize it
in every entry path. A later return tail can restore hardirq classification
only for entries which established the pre-counted hardirq lifecycle.

Assisted-by: LLM
---
 include/linux/irq-entry-common.h | 4 ++++
 kernel/entry/common.c            | 6 +++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/include/linux/irq-entry-common.h b/include/linux/irq-entry-common.h
index 24c2b9fdff4f4..2ed637cf66b0c 100644
--- a/include/linux/irq-entry-common.h
+++ b/include/linux/irq-entry-common.h
@@ -333,6 +333,8 @@ static __always_inline void irqentry_exit_to_user_mode(struct pt_regs *regs)
  *            exit path has to invoke ct_irq_exit().
  * @lockdep: Used exclusively in the irqentry_nmi_*() calls; ensures that
  *           lockdep state is restored correctly on exit from nmi.
+ * @hardirq: Records that irqentry_hardirq_enter() established this state for
+ *           an ordinary hard interrupt.
  *
  * This opaque object is filled in by the irqentry_*_enter() functions and
  * must be passed back into the corresponding irqentry_*_exit() functions
@@ -347,6 +349,7 @@ typedef struct irqentry_state {
 		bool	exit_rcu;
 		bool	lockdep;
 	};
+	bool		hardirq;
 } irqentry_state_t;
 #endif
 
@@ -396,6 +399,7 @@ __irqentry_enter_from_kernel_mode(struct pt_regs *regs, bool hardirq)
 {
 	irqentry_state_t ret = {
 		.exit_rcu = false,
+		.hardirq = hardirq,
 	};
 
 	/*
diff --git a/kernel/entry/common.c b/kernel/entry/common.c
index 36c43d3c76eae..ba5959a84bc4a 100644
--- a/kernel/entry/common.c
+++ b/kernel/entry/common.c
@@ -112,6 +112,7 @@ noinstr irqentry_state_t irqentry_enter(struct pt_regs *regs)
 	if (user_mode(regs)) {
 		irqentry_state_t ret = {
 			.exit_rcu = false,
+			.hardirq = false,
 		};
 
 		irqentry_enter_from_user_mode(regs);
@@ -140,6 +141,7 @@ noinstr irqentry_state_t irqentry_hardirq_enter(struct pt_regs *regs)
 	if (user_mode(regs)) {
 		irqentry_state_t ret = {
 			.exit_rcu = false,
+			.hardirq = true,
 		};
 
 		__enter_from_user_mode(regs, true);
@@ -199,7 +201,9 @@ noinstr void irqentry_exit(struct pt_regs *regs, irqentry_state_t state)
 
 irqentry_state_t noinstr irqentry_nmi_enter(struct pt_regs *regs)
 {
-	irqentry_state_t irq_state;
+	irqentry_state_t irq_state = {
+		.hardirq = false,
+	};
 
 	irq_state.lockdep = lockdep_hardirqs_enabled_raw();
 
-- 
2.39.5 (Apple Git-154)

