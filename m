Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793158321;
	b=oomqu85ztnVddDJdjIS/mFvV2xSAJz5TfknUa2mhwDWJocT90zncFUJkCq3+ilseTQjZ
	 ztpfcxKYxGRD51ZcVWBCN4vOFKkg1Q90H701lvYzYo5iurmuKqaXrnjTbYtj09pAwDRTL
	 UhSKhBV077NftEd5DwX5Fj7eYouQVy6/cjkuNIm1FFWprufhw+AYJgpJ3th28IY/v8W5h
	 rxtNB1iELqE3nWCj66DceMXp9fNsRZDnSBXuiQSf9c8VilDSQCgh0ZML1caxP63Xcdzak
	 a8cejTqiMnSa1iRu88ufJkX8tOAyPYAhtdFki+tTi/HKazpt43MUteE106cjnpy+16w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793158321;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Uboz3++C7Vd9eZqJpqK4o7EY0U6A0LogLMvrqlbwgTM=;
	b=k4HSOdUlWhOBwl8cMPwoXhXUmRogukYDOhoMW+vqPasdJSInGHVLIkX32KywE2wpf5lg
	 gB+zkSaD+dV2dnjiau0k5aQUOpllKFtkMLj2vTcjLJ9bFpA5/weGi8+XLIVZlbhCpMGZD
	 HhmADj11WVgSZT045E7YHfnbLnlR1MiNkuCGrimsX0z5u6an6z0OdfEol/LlRjYOUdvXd
	 ioV1hcXrEOqJqCCFEfdIbACRMzuXxgfPlUo9x0iycsUdcTcuG3sZIVYSWPcqJvQrWHOJ/
	 yAlBu5tBLPCo+kZm2NIiy+2MggXnhVV4urrW6biYl9NzKqv8Q/zOX4ZhVF16quGoloA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=byqKZ7W5;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148E9606A337
	for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 03:32:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 148E9606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=byqKZ7W5
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so381993f8f.1
        for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 20:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793158319; x=1793763119; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uboz3++C7Vd9eZqJpqK4o7EY0U6A0LogLMvrqlbwgTM=;
        b=byqKZ7W5UhcRnSu2xxUZbE+yuSVLG5xXpLtK7cb7czM3NOEXtb6wKc6iXFz2DKpwA9
         wMMJxxbtH2nyjid4h+HCiHZrWvG6538k/yc0/3xF2bGRJU15yX+EkqfA/n7BgmD1DBrP
         dG70rDNxKUrsvvDyFunqI4goaCGmjZi+m6z3O1PPT4yqwNsRZq8epZYulFKe6vkGnX+B
         cQVOJZQbjs1l+qhuLvjydugvN0jOJT0WzPUeM76lU27qI496W7dQCLgrZAN0HctCTGOU
         lsLtoQb7vHfYkb61UEwwYTNpU7Cnf+YP7WdGSPAdz5DB9aQ5KdYnYi1tjAfnoB9zzXV/
         i1ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793158319; x=1793763119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Uboz3++C7Vd9eZqJpqK4o7EY0U6A0LogLMvrqlbwgTM=;
        b=dU5vHck9IiisMqUVuAVRKcYof7nmQm+XfHTzD/2tcXpIWstWPz2hiDdlLWl9qJuIxK
         WSdevD6pJqlvaIdd28rm7NwDyK6a/N8IwNyJkSGV1f+cHo1lNaCtzwXSH3kv8r25zoY9
         MMVWk+pMWkzQEHQZlhtkiJ7KyEhLcZXw+23xzbd8jdU2JJlxWzFptScjneX4tmRKpSBH
         HBKejhqQBSMY0/u9Zj3A6NOH2a9UtDpeos+QkeErWxf/3ldO4EFsbTacZEYRXEO5R+qC
         t9ZTy8YTqrpg/+ETbGsCd25OkZ/L4bSWrQkYyAuCC71XeL68x44yaHj6dWyhtRma2RVy
         5zSA==
X-Forwarded-Encrypted: i=1; AKwUvByYVqnSgo2CtHCbuE4l75vCmLxW1CjAXAky9lGMUq0/29QGuuCZfxUuBLSVxNkXg1vShtJEzKOhRgU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJKAMpkTRaL+rsMcviCrz3YFQQ3FZ1pSu52qPkdzDciQXyRMM9V
	LdXyQkjOlDJFq3IjpEpFvbs9C+IRwWLTPgxHbWXALLPUQ7aAA/xKHq89
X-Gm-Gg: AYBFou14BGjo/P4uOIpdV4D2MEYHX3IkbPaYY+mr2fOA+nqZHjGokejXsAnnQZxNeMb
	bRzMyDutcP/JfiFnABIO8b/G4sZgQLLT88xa3ljnGMHg7waVnjAivB4t1lEyX/mNh+2M5lvcqX6
	3ckstbSZm1sMy7sLE8joGI4jrCumTEeAIuTu1nCTE17ft3Wecb53HPm3873+gG11fEMCEKX3KUm
	eCM6L06OVj0vMqjqJXmdVSv2MGosEMINxr21mdXmpIbFX4zUpqrE/zSokcJ0yih85DqagYNcUZ1
	aQkKT93oz8qcLpyyQvGPLLz+lBMmnHjjQtUCRZGMtr+Y0+MSjdyq0NjnJIDu0C7mzRNhsW02do9
	8VLPY/iPAV3r3qx1Wchg2y3ZejPSmX9XU1spwF7+AQBP+ngWhBTiZatADPcyqyieWyrrKsGlRaS
	9Yt9Xq84hiLb0qyI2S7Etv44zQPPc3eMXSC6gCK+z8kcXLsXQxjAl6HkQ9mjicPGLDmf790jqvy
	8arzOCYE6B+70QengQaVwpAKOi7ZUxkBPwI1VoB+9BvDGtsa6zLYI1Zja/gup+iwE2dsgEbJmLP
	W6Po1uVPbSlWBmIvFWb3wtA7Er4FXnijoXU3GAVLlSjAnitutz0rbR1a5x7okP9YBuSdS4vEuMK
	98BpuGVOD4ot7LmR432oDuZG1n7kz5H8m+iBc5tg28GjX9ZjtXNZM2ThjeIaczH5t7ONWtFJPYP
	MFKZyqCekXXb65py81LLEscwRHSSoUswJU
X-Received: by 2002:a5d:6f04:0:b0:48d:f7ef:cd1d with SMTP id ffacd0b85a97d-48e5d2e7526mr2965587f8f.9.1793158319122;
        Tue, 27 Oct 2026 20:31:59 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a45b-7d01-5035-b393-698f-53f0.310.pool.telefonica.de. [2a02:3100:a45b:7d01:5035:b393:698f:53f0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdfd8dsm24290569f8f.56.2026.10.27.20.31.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 20:31:58 -0700 (PDT)
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
Subject: [RFC PATCH v2 06/13] entry: Skip inactive IRQ-return reschedule calls
Date: Wed, 28 Oct 2026 04:31:20 +0100
Message-Id: <20261028033127.82193-7-kmehltretter@gmail.com>
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

irqentry_exit_to_kernel_mode_preempt() calls the reschedule helper when
preemption is enabled even if the preempt count is nonzero. The helper
returns immediately, but its call and return remain traceable after hardirq
context has been removed.

Check the preempt count in the inline caller and avoid the inactive call.
Keep the existing check in the helper for its other callers. This does not
change whether IRQ return schedules.

Arm64 invokes this caller from noinstr code. Force its preempt_count()
implementation inline so Clang cannot outline the new check into
instrumentable text.

Assisted-by: LLM
---
 arch/arm64/include/asm/preempt.h | 2 +-
 include/linux/irq-entry-common.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/preempt.h b/arch/arm64/include/asm/preempt.h
index f3a5c2cd1936d..3e9bcc6e76625 100644
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
diff --git a/include/linux/irq-entry-common.h b/include/linux/irq-entry-common.h
index 289e308d2d46c..e1fd9155410c1 100644
--- a/include/linux/irq-entry-common.h
+++ b/include/linux/irq-entry-common.h
@@ -503,7 +503,7 @@ static inline void irqentry_exit_to_kernel_mode_preempt(struct pt_regs *regs,
 	if (regs_irqs_disabled(regs) || state.exit_rcu)
 		return;
 
-	if (IS_ENABLED(CONFIG_PREEMPTION))
+	if (IS_ENABLED(CONFIG_PREEMPTION) && !preempt_count())
 		irqentry_exit_cond_resched();
 }
 
-- 
2.39.5 (Apple Git-154)

