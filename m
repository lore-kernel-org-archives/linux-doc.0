Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792646241;
	b=RVuPH3st54K7nfyUw03o/4CdtubIX255OwLamJoxNWs7SGzAGred4hTrm5j6c3d/unp9
	 YM6wU9hJMZRo6W0hLx/5DYCzrqNFmzRXOLs+r0MpPIX6GwvQYVNQE9B7ar74MpJrw5yuP
	 /RzW1kg3Em0iSAh+hyLE1qIKR4CluAiNlZCXw9yvAOSV28lAU08PeXoxQrRaaR99nMawl
	 t2yYiVuSN6XeRU7366PPb+H1Y9Y+FtJWQ+Gqo0MWjYhfOn0dEeEdGAtwYEFgLIOB5VWgF
	 yuHBF8SQyhb3zPqEZb2CUsm/YWH37AAme0RnkRQYpCEfwE2/AZxLBb3NtTy6FaUogeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792646241;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FHADbTy4zikl0HljBSmGkN/GzMWvpwiot6dr8kUaUas=;
	b=zkKdJsT/uW3vQCl/vhdE0OEpxZwv1Ve5AUZH5uCYxKG339w816hHJa9igmthZnf3ymYM
	 eQ+Ho1xKp0G2lPsiuijUIM4dyvteet+A/UQCydMHPuKrJ6o4GclOosgeqFqycZ1t2ZvAW
	 C9KIoco4c7PB24BmKFX9VFdrEgG5TR/WDACCyvR7++C8nPVqOCCJxVo7lYMCRtoEnRv+0
	 FIVkMfkR8VSOpo6ZaXSbjfwqut1YrtYRRDApvfJeDTsXVDEeFQlnnKEHb58jXfhs/ugJ2
	 2u03Y+h9X5hXhtKZwepOciNjgfhqq3XkeJsCuQtKZo+qVyD2O3OWQlHWn81xOBUfpqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GJ8MVNqh;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C298660A2602
	for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 05:17:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C298660A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GJ8MVNqh
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a1df4c0966so2693715e9.1
        for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 22:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792646239; x=1793251039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FHADbTy4zikl0HljBSmGkN/GzMWvpwiot6dr8kUaUas=;
        b=GJ8MVNqhnRrntr8SgM6UXidafF9eU+ZQd0Vc/ExGUloc15ICieAVftx4JAH7vssIeT
         gpv1uP2i99q9zJ7GxU1h5yYfKyuzVcFR7Pf5JBSLyLK829+VLlQ12Z7kIXurKA4HG4ss
         osOi8laCeLfIQtlnhFnufp/2cCQIsFivtIAPydAIib6/CYQSsgoilMYGcNVyRFWISaqG
         dzpiVJwT8C8qKYJuoSEyx5NflmKu369uj7BXTlEhpeqeV/LD+TqcsWtCVBIxlPNVIajX
         19LhZq/cRLgIIj8i7ZTD3NJvMpJClkpLPaeViTVwH6vouvhThL2rGV3cGBO7lTEyIHKV
         K6jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792646239; x=1793251039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FHADbTy4zikl0HljBSmGkN/GzMWvpwiot6dr8kUaUas=;
        b=aDSnAk4HKguSBToKivgxrmiQAqVlcKMufefMyv+HdOj5KselzBrVDybheoYP7F4rQv
         LNsZVh5+yYGL3dJsgpaNJ+wZIhB8yBxFhQ7aVQY2/z/JWR48Cuk4UOdTIcGAfBYkISnu
         JXq5zo2dqmVCDyB4Zhfqy27Okzy0vRCo+ozU5zpb75/tbwI0Jo0EbrO+aNqetd18pDIc
         D+uaW8RcmUch8F5Yeg0/3hXbWj3hxi6OzRt16oIr7fmGHAkcoDJjXOkiLLPUPAkvwp+1
         Pp4bjmldtbjlwjttsqFUEAq1c3qXPj06ZeF1xaehewH/1zkhK58VcGtuYM561DTQBlUX
         +7gg==
X-Forwarded-Encrypted: i=1; AKwUvBw9B+Qv8m4Iq1QAove0zuGDw2bYs+EMLCUC3h1i7hWCtYBtrqPaj5z0NH4vQq6A1WsNzt1ASccrrEM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKZLQhoE1D8EZoBNREm8HcScdLvz2/zVR4wjGM1jtRnrE0ohi4H
	Fcl8UwjCijPAEk620VTZtRfpaPKx4ZFLbpE1xcPpgLlhSopWhAQWNPy0
X-Gm-Gg: AYBFou3RnOjl2yc3mo4TKVqX8QA5CMa8liazNKq/neZU/Ff2H3oB92eW0fkXGZuQqAz
	gjE3u4wSJR2nJAYZ/6wTJ3niWk0hfvSoGnnpEgJzmZN7mptTAWAHJBUXM1KgqkutomOtNycdL7O
	Wnql/5sCgVC7F0sV8eTqAHPaucrGfW/8auARamo7WPgQNFOxFrIPJN59eKMFw/X9MN4MYC13AyI
	mbs2RhJ8h6fKfYd8jUUT3cvqznV1YvGs94SsBxP2eg2lhRclMXIAICRUKwjhmj6mEZWVnBxVx+a
	RDbbGHM4Ruqb1Hp7PU2AbX3Bs1BI52uM1DkX4C6V4+9LNKdxE5FqDIPpY5rZi2gXAeGzqU9/Wqf
	tVe2EybqOyWqrMaBuEmNNgKRe0vAkH+rPZvNsPN1gaAnXUjlKBrGI+kn9giPL+ZXMzXNyIHeIJQ
	R+bCQrHDrKwhE6EMyjV7mMyV48aP532Yhu4L2ahcg9NnO0YhKJ3KMgAvI/lbnmLlQTWbaIhkl1X
	/T+6YNk/85DNQbRiMgMXeGqVbYm9U1MLCWkvhkwSslUsbi94WxFQ9QhZqbUglmPPcNjO6yBTKBO
	WW1eJ5+ArXseNmsu75+mM5dGnc2VMTHcixb9JpjH3FIpYrDzgjKvtWQkqno6F7S7rcqhTi6nj1h
	A1Dg21Qcr3d0gyfxn5ekseecoGfM3e6SU3gUkiz248dUtKkyXsyxMQ1G3nvc=
X-Received: by 2002:a05:600c:4fc9:b0:4a1:efbe:529c with SMTP id 5b1f17b1804b1-4a204b2032cmr26718835e9.12.1792646239093;
        Wed, 21 Oct 2026 22:17:19 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad43-d501-2c28-bb72-120d-420e.310.pool.telefonica.de. [2a02:3100:ad43:d501:2c28:bb72:120d:420e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fd0f4427sm90362275e9.3.2026.10.21.22.17.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 21 Oct 2026 22:17:18 -0700 (PDT)
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
Subject: [RFC PATCH 02/12] lockdep: Use raw access for pinned hardirq state
Date: Thu, 22 Oct 2026 07:16:44 +0200
Message-Id: <20261022051654.79224-3-kmehltretter@gmail.com>
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

irqentry_nmi_enter() reads lockdep's hardirq state before __nmi_enter()
establishes NMI context. Arm64 does the same for its NMI-like EL1 debug
entry. Both paths run with interrupts disabled and cannot migrate.

lockdep_hardirqs_enabled() uses this_cpu_read(), whose preemption checks
are unnecessary for these callers. Add a raw accessor and use it in the
two entry paths and in lockdep_hardirqs_off(). Keep the existing accessor
for callers which are not already pinned.

Check the interrupt state before accessing per-CPU state in
lockdep_hardirqs_off(), independently of warning suppression.

On arm64, this change does not by itself make the call chain noinstr-safe:
__kern_my_cpu_offset() must also be forced inline. That prerequisite is
listed in the cover letter.

Assisted-by: LLM
---
 arch/arm64/kernel/entry-common.c | 2 +-
 include/linux/irqflags.h         | 3 +++
 kernel/entry/common.c            | 2 +-
 kernel/locking/lockdep.c         | 6 ++++--
 4 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
index 72c03ccea59fe..93056a766fb20 100644
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -141,7 +141,7 @@ static noinstr irqentry_state_t arm64_enter_el1_dbg(struct pt_regs *regs)
 {
 	irqentry_state_t state;
 
-	state.lockdep = lockdep_hardirqs_enabled();
+	state.lockdep = lockdep_hardirqs_enabled_raw();
 
 	lockdep_hardirqs_off(CALLER_ADDR0);
 	ct_nmi_enter();
diff --git a/include/linux/irqflags.h b/include/linux/irqflags.h
index 57b074e0cfbbb..5bc179a88e513 100644
--- a/include/linux/irqflags.h
+++ b/include/linux/irqflags.h
@@ -52,6 +52,8 @@ extern void trace_hardirqs_off(void);
 # define lockdep_hardirq_context()	(raw_cpu_read(hardirq_context))
 # define lockdep_softirq_context(p)	((p)->softirq_context)
 # define lockdep_hardirqs_enabled()	(this_cpu_read(hardirqs_enabled))
+/* The caller must already be pinned to the current CPU. */
+# define lockdep_hardirqs_enabled_raw()	(raw_cpu_read(hardirqs_enabled))
 # define lockdep_softirqs_enabled(p)	((p)->softirqs_enabled)
 # define lockdep_hardirq_enter()			\
 do {							\
@@ -113,6 +115,7 @@ do {						\
 # define lockdep_hardirq_context()		0
 # define lockdep_softirq_context(p)		0
 # define lockdep_hardirqs_enabled()		0
+# define lockdep_hardirqs_enabled_raw()		0
 # define lockdep_softirqs_enabled(p)		0
 # define lockdep_hardirq_enter()		do { } while (0)
 # define lockdep_hardirq_threaded()		do { } while (0)
diff --git a/kernel/entry/common.c b/kernel/entry/common.c
index e3d381fd3d251..28399c41ebfb1 100644
--- a/kernel/entry/common.c
+++ b/kernel/entry/common.c
@@ -171,7 +171,7 @@ irqentry_state_t noinstr irqentry_nmi_enter(struct pt_regs *regs)
 {
 	irqentry_state_t irq_state;
 
-	irq_state.lockdep = lockdep_hardirqs_enabled();
+	irq_state.lockdep = lockdep_hardirqs_enabled_raw();
 
 	__nmi_enter();
 	lockdep_hardirqs_off(CALLER_ADDR0);
diff --git a/kernel/locking/lockdep.c b/kernel/locking/lockdep.c
index c3dc84a7cef26..01dba8fb32a90 100644
--- a/kernel/locking/lockdep.c
+++ b/kernel/locking/lockdep.c
@@ -4543,10 +4543,12 @@ void noinstr lockdep_hardirqs_off(unsigned long ip)
 	 * So we're supposed to get called after you mask local IRQs, but for
 	 * some reason the hardware doesn't quite think you did a proper job.
 	 */
-	if (DEBUG_LOCKS_WARN_ON(!irqs_disabled()))
+	if (unlikely(!irqs_disabled())) {
+		DEBUG_LOCKS_WARN_ON(1);
 		return;
+	}
 
-	if (lockdep_hardirqs_enabled()) {
+	if (lockdep_hardirqs_enabled_raw()) {
 		struct irqtrace_events *trace = &current->irqtrace;
 
 		/*
-- 
2.39.5 (Apple Git-154)

