Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793158329;
	b=Ncb6zJybHoOjzKBwGaklO76mYJRzNLUroeK48UJH52K+wff7JyDwHTKSCQhWQYVX1rpp
	 sn+GYBk5NZh0JZ4sHvQY0DSxJEeXJ+PrnzpoXEafYRKW5tMbk9DtiSZ6xagLD9opcS04K
	 DHQLgKMOh1q6HJJ035ZnQKrysb5eXJXAp0CV+S1oXx/f4rMoidrU2W/I/jvEUL6wvZuPP
	 5P7j7EXzjDnbhlRZOCu2Dv5ZeAcm6B0LLbXCzF6ntgM3gHEWIn6AUyBRr/lRwckf+yLDU
	 QvwH8AZYIv1GA5OoIz7mwmNukJyK0OK/dAdQse9PxN2m3W/canfQxIwghAKpbXYS+Lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793158329;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=gbskEFrs/q8sEy5EcDMb9bqLWWCDi117BEzygxdkUw4=;
	b=cHngTOTjAnlltDMJGo4FMS8VkwIshICnIGciw42TbyzWtHkd3DR49M9dRoXOO6cAJt7Y
	 XrGsx6EW8K6BhZEB5QAC2DE/SYjvz+Q+G+y0ZvQFoAHoz8R8L8NL3zOhIIqLaa5FX4c7q
	 8HtxKTkOaun8DvgBQI95hifMczGcrebNpQRtl7S1KRyo1QBcZZzEN6aEv97rbJqmsowDy
	 6SxKsqz1Vh4gLzYk7Mfj+7L5UCapVNkRR3BqIbcm15VHpW31mLoB9jYJ7aqrpNbD7WBVt
	 GC6DxNw69e+X/+68jacjt7X03NlG3vDaDkNIXcl30WD/StdAmaa0ZjcYv46pzgfH9cA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G7XYMGBq;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F846606A31F
	for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 03:32:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F846606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G7XYMGBq
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48afcfc4bf5so403100f8f.1
        for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 20:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793158328; x=1793763128; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gbskEFrs/q8sEy5EcDMb9bqLWWCDi117BEzygxdkUw4=;
        b=G7XYMGBqJmubaJh8YPmweABf9WZGYmShKWmI+xTWhoK57zVk8AINXQEr0ADgOQCEQH
         vlx7pYyUdyopPBa0wb/fKAvL7xshDUwLGdRQyY2wFwIJcQPS8Bl1bm7KXwlloCUZoZ6F
         DsHWLv1FiAKw2KBgPXdxC+/LIb2ZhtoRaD2RCUm58duTMKwubNKXEOlRHzEVIYFq2Xs3
         j0qX+3PTSTF6AbOsSSHqzH+KpGEo5+JVDeZNQiTFlmSN0lzk+vXUPX05IaGc/Clw8LEX
         LZWLAu0BxdyJhBM6g/2BfP3tmKJAokJXze0WRQGJ8GeV4YR4PePF3dIaujw1yw68x30F
         6bNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793158328; x=1793763128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gbskEFrs/q8sEy5EcDMb9bqLWWCDi117BEzygxdkUw4=;
        b=yDWRmeTEvXREDFcjSSwcdNpdxCNjiSqmKupsS58W+G0nNDp3YnaRLPpfEf2WGOt/26
         FTWaKduwzOkwGDmGhgr3QAAs8yQoz0orwVtYVSSmpQa//1PUplgdeD3qSsl1V+Rlnwgc
         Y0DEjwMU5e7UpD+CU7xdGyA/Fds9EepP6tq1mdncYlBit682JEMdmIdT0V8lxDKdvReX
         TkvgeH7LD4eAaI4kv4WassPmb+B5p35UPJqB/zN000sDRPfdxLSHNDh+uG7JCcKRTDN6
         N2r6rfJkbhCEYxwzVzy/T3kDc6l/p834ET3lO9Kj0Eix93YB58DusasecthuSPL8BaHt
         tqEA==
X-Forwarded-Encrypted: i=1; AKwUvBxaGBLc7XaaxX/6MU/N3i9meNmO33tK1yV0Gq2gR+yvv0cwAEv/uuwtnMbpWz5y6wwvmauPH9Uj/xo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIM7WKmC1DYPVk4ahxr7JbXGJR8PJlFxfnUJlvuRQ1pwv6+V96f
	+/fwXAUB1cGOIT5iFI3R1Xnq7/uhq+0TcqH77TgBmzUmJRmkYqaDLd6z
X-Gm-Gg: AYBFou3vo1W9QUl7QYfiBNPC01QUrINlKs5ypNPjCBq6QjLzauK/Dwd++J3TXPD431M
	tTJH+fFGYUpXsblKqgzImrNEPs9GwFxAhWvC2+AA2X+QzpTKpajeaYGT0wPbNN/cAQ2MZEw+98l
	bNQEewtv2c6cddy2ZfHhug9ldJSoyYTJnD7MIBXAF3eGoWwpfS5hbGTuIQGUJmITP7p8sV+nr7X
	Hj4NwgBTgVwfZMDgPy8Tj8XI493gAExCneMsshoE4WBfAXsna9TjKalrRIwcM00jtK7Xj72ZVnf
	zSJq6bX40/OUQ/0/o87aaPMh9JTsJcGmyM5J3IIPbxz6OJKA5QLEm3HeV/vVQo0rqhRV+EUT1Be
	CnTaGxHhOReG85ILaDoYPdLbhYNPHK6A4C1vMHq29D6jZdvujBBreqMTV1Kn2g/FUCx9RqTxl/2
	dDQix/UGAvqXWVpX6aYiosrgNbrR+gMR3gPfESResYpcDU0MBWm8zfwvl41yGbFvuPE3YmQUTk0
	2hchoIFIyUUVkqKsS2KolZqkYy2UJjU4A2Lt2RiIRTiVJCj0Sh+OD0VReLBR8OXWwwXT6h5zYn0
	PVX+NQrEelgHVOrNqlnqSrDUJODluNMMagoB/LYEtwyLSju/JxTp252Zw4LRorIcMtsXcgbv3DZ
	zk79+ASaRMcvJM1UCFzjYXMZvHa1i982QaEs7+e7n0vN1qAgF4tjUWyawPMG/gSXvfuF2T8f/7a
	l05ukwgVMnYqrDfjsQW3DoINzmrIA3HeeQ
X-Received: by 2002:a5d:5e8d:0:b0:48d:f464:6989 with SMTP id ffacd0b85a97d-48e5d45a4edmr2964330f8f.27.1793158327517;
        Tue, 27 Oct 2026 20:32:07 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a45b-7d01-5035-b393-698f-53f0.310.pool.telefonica.de. [2a02:3100:a45b:7d01:5035:b393:698f:53f0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdfd8dsm24290569f8f.56.2026.10.27.20.32.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 20:32:06 -0700 (PDT)
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
Subject: [RFC PATCH v2 09/13] entry: Carry ordinary-hardirq provenance through kernel return
Date: Wed, 28 Oct 2026 04:31:23 +0100
Message-Id: <20261028033127.82193-10-kmehltretter@gmail.com>
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

The entry state can cross hardirq teardown and a possible reschedule before
the architecture completes its return tail. At that point preempt_count()
no longer identifies whether the original entry was an ordinary hardirq, a
synchronous exception, or an NMI-like event.

Initialize the hardirq state in every entry path so irqentry_state_t
distinguishes ordinary hardirqs from other entries across kernel return
while keeping the two-byte generic state layout. A later return tail can
restore hardirq classification only for entries which established the
pre-counted hardirq lifecycle.

Assisted-by: LLM
---
 include/linux/irq-entry-common.h | 6 ++++--
 kernel/entry/common.c            | 6 +++++-
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/include/linux/irq-entry-common.h b/include/linux/irq-entry-common.h
index e1fd9155410c1..6f649f6613312 100644
--- a/include/linux/irq-entry-common.h
+++ b/include/linux/irq-entry-common.h
@@ -341,8 +341,8 @@ enum irqentry_hardirq_state {
  *            exit path has to invoke ct_irq_exit().
  * @lockdep: Used exclusively in the irqentry_nmi_*() calls; ensures that
  *           lockdep state is restored correctly on exit from nmi.
- * @hardirq: Encodes whether the current staged hardirq-count attempt was
- *           applied.
+ * @hardirq: Encodes ordinary-hardirq provenance and whether the current
+ *           staged hardirq-count attempt was applied.
  *
  * This opaque object is filled in by the irqentry_*_enter() functions and
  * must be passed back into the corresponding irqentry_*_exit() functions
@@ -412,6 +412,8 @@ __irqentry_enter_from_kernel_mode(struct pt_regs *regs, bool hardirq)
 {
 	irqentry_state_t ret = {
 		.exit_rcu = false,
+		.hardirq = hardirq ? IRQENTRY_HARDIRQ_APPLIED :
+				      IRQENTRY_HARDIRQ_NONE,
 	};
 
 	/*
diff --git a/kernel/entry/common.c b/kernel/entry/common.c
index 9d207c37c5707..c7814c51bb35d 100644
--- a/kernel/entry/common.c
+++ b/kernel/entry/common.c
@@ -112,6 +112,7 @@ noinstr irqentry_state_t irqentry_enter(struct pt_regs *regs)
 	if (user_mode(regs)) {
 		irqentry_state_t ret = {
 			.exit_rcu = false,
+			.hardirq = IRQENTRY_HARDIRQ_NONE,
 		};
 
 		irqentry_enter_from_user_mode(regs);
@@ -144,6 +145,7 @@ noinstr irqentry_state_t irqentry_hardirq_enter(struct pt_regs *regs)
 	if (user_mode(regs)) {
 		ret = (irqentry_state_t) {
 			.exit_rcu = false,
+			.hardirq = IRQENTRY_HARDIRQ_APPLIED,
 		};
 		irqentry_hardirq_count_state_set(&ret, cookie);
 
@@ -193,7 +195,9 @@ noinstr void irqentry_exit(struct pt_regs *regs, irqentry_state_t state)
 
 irqentry_state_t noinstr irqentry_nmi_enter(struct pt_regs *regs)
 {
-	irqentry_state_t irq_state;
+	irqentry_state_t irq_state = {
+		.hardirq = IRQENTRY_HARDIRQ_NONE,
+	};
 
 	irq_state.lockdep = lockdep_hardirqs_enabled_raw();
 
-- 
2.39.5 (Apple Git-154)

