Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792646276;
	b=tzHYLEb5/xER+aEsMVKLwgGhq4wZKCuNDMGHxOauVwanVOQomlS6n5LbXGoNo3nF88jE
	 BfVm/q9L5Wjfqys+M14+Rxk9P0m5AAMvUk6E/ulinVRyFPyaipWWpyb79GyiXfyP6ZF3i
	 +ZoLlgXcIN0wUpHWngOkdsp1Gfx8GixIIfx49bk37/XgZmkvU9hMrrkvniHFbcrCXP/JE
	 zssfmyQt2i+vBCLmxUgmm3jXoSOnvpNhbv/8yj6rGAguMsbmtddYriOxPXM5NH7qIRFOn
	 sGDoo1UJl+JqgyTzg3j3PpMHKUbaKkwbMd0eENfoBUQnDtnwfOOotAHFUJf4iuIziZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792646276;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Mo4ijoE4/zyX2xv2dQEbhTN41cna2GSZkZljd09Fpk4=;
	b=sfDRcKNv4QeDkWakv+jjyVuNqTqgbgRmp3vfLyP/r+vYoWJmttod7TMKJzO0ix+qopDQ
	 1UIWIU3c91/dMLNL2nSGz1zqDb1j1nWszZsa0fuwYNu2SA2E29sICcgECuw4065Tb/uBl
	 sXWhZUSrpefu6NqfzL5NIIP1uoMN/5Q/4HZACstokslyCvjQqnOz1aLcclfy67EByHGWT
	 wZLYHyU7h3bWpJPjSsnSQkcH+HSCGRoh4Sim89uP6EjDAFX/vBcTGAFE8Fss6qqU/UWMt
	 fTWupwXG47i2pStqeLWHTV7HIQsAteu0uMJGuRCZ4YpS0Yid3q7Al84Y+n6tV9polOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PrEznyt3;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E95360A2612
	for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 05:17:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E95360A2612
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PrEznyt3
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1dede3c2cso18117585e9.2
        for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 22:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792646274; x=1793251074; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mo4ijoE4/zyX2xv2dQEbhTN41cna2GSZkZljd09Fpk4=;
        b=PrEznyt3V0Td5d9mPQAr6GTSP8KU/wwhLLQOftyeTLWqx9zUFisZ+lIkfVCM/A68nJ
         j9v1XOQuZeLHYD3KRntWHTA4EyohSUpujaqZKhQCzmD+PucpLXzrsFhAnvayYWoy/PRO
         /ShIPkXt6F+g/JfZNNmweaTq+DTNmB/MxjZUH57bA6hQY/ah4jJQsc4XNYgVKBjR5+Eo
         qxTiqhD+C+7fFnA06O4Oxlzp67o5bk9MP9UI0T6QZ+ZV2VvRlocC/sbwWDR14bCETXQd
         XnggQdCI0wcO6hAin7ygVQmG5i+DrLXDbGrHiruPWt0Pxs7jAcLonBHV0wLuMaVtmp4M
         v+Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792646274; x=1793251074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mo4ijoE4/zyX2xv2dQEbhTN41cna2GSZkZljd09Fpk4=;
        b=XN+MuYi4D/n3pGQN9axR4Dv9jeLwdJr/vcgMDaFUsNjIz/y5y7k1Ds+veNTd7PeQOK
         BabbLs02Y09g1lMmEagxdH0FV1XbFkrt9dkHIRXwVYScRzgfYgduYCOjwtDHXEvu+BZp
         1+VxCjB4OoOsLnxf7W43Pt77mtAe200usMqC/DQHcsBIFUCajdhp9hGM7gkR/s3C7jsw
         gjWRXacuuT/ZDdoJvVXnlRJVZPAGy/eOwSzasc7UR+88RXnk8l/Xo1mP5Qte7jYwTn24
         Y0YORfBx2+jJzj6SANbZODn2S2LdqzerrJRB4R1CWHZWI1YrfKOcbrPffu6YEAl/QvjZ
         E7HQ==
X-Forwarded-Encrypted: i=1; AKwUvBwBZWtkgEwDNA9MJ4iePA5qg5Ol5LVK+okru2g52Qvtr44jmaMbzQrX3C4bhHtOOebmnaezVZ7AUd8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJjoFHrjKnaVfOFttSOygByZ+7ObqxpcHlrNOV0cdZDhnJ+o4cV
	m0qOKDz8+t9EsnMegi5xtUoXf96f4/lNAcddq8WTC8EZtgF3M6l2SuPt
X-Gm-Gg: AYBFou3vyVUg+Q2D+9BrhetsPOiJPYQurN4C3v9nk7XlVphaH9gH7gls4yiGZMl+Hu7
	iXRlko0rJsSt73ozrZfs/dCuhz2yNZC+JurH8u35Js3Czh1/2Ir8Wtu05tyBNajaTF6gFVPeVoW
	a+mkCKGGdmIyppk3iK4dvWAAnN7K/99IY9SGaalB3hudJ0GIw2acgzDeBPk2qDkLPCuOYSkZeWI
	jNUjbL6+h3JjiNWQs57zUKh3RTyd0q2zMlMlcgtVcZOlSvJullbOalOEYWa27pV1fHTU1Yzbo1z
	rWoPm/f9XATWKP37b/aRfhxnwuhEela8m7k7pVo2+pCQGNsLmc4IHiFDvBSMh7eI/FSYriKM2mV
	4FPovnPFumsUUOl4SfE7hEKSp+DU9W8iQs6VQZPw8HMDomWm+WP0aOm/6n5c4FTHR1aT1G1nn0W
	Trt17W2nJTLem4npN00l1PXBmPiWrbupV+XXGFxB1ys29C3cj/alBJLiQImyxoXfL0GxVkL76sl
	Hae5S7jwdSXMk76+sCKL4l5dWL3CZSGDCcaaYHHRyjLIG8nWHdzJ2DEg46p94h6/jYiIsQMZOen
	pz/YIHtQEXdjI/WqXL+IzZmgvCYVqRqKROICcddyuNGSokVlvWGKVW65U609K2xx1I0ZPdcJjfo
	2zDdU3uqOb1gc3Ob1b6bCucaoFjzHnC5+5rMllVog0J15rQCsvc0Mf5sS2C3r
X-Received: by 2002:a05:600c:1c09:b0:4a1:e00b:a10b with SMTP id 5b1f17b1804b1-4a1fdd2468bmr84667645e9.7.1792646274255;
        Wed, 21 Oct 2026 22:17:54 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad43-d501-2c28-bb72-120d-420e.310.pool.telefonica.de. [2a02:3100:ad43:d501:2c28:bb72:120d:420e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fd0f4427sm90362275e9.3.2026.10.21.22.17.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 21 Oct 2026 22:17:53 -0700 (PDT)
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
Subject: [RFC PATCH 12/12] tracing: Pin recursion state for its complete lifetime
Date: Thu, 22 Oct 2026 07:16:54 +0200
Message-Id: <20261022051654.79224-13-kmehltretter@gmail.com>
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

trace_test_and_set_recursion() publishes the task recursion bit before it
disables preemption. Scheduler tracing can therefore run while acquisition
is in progress. Conversely, trace_clear_recursion() enables preemption
before clearing the bit, so a reschedule can observe stale recursion state
during release.

CONFIG_FTRACE_VALIDATE_RCU_IS_WATCHING also validates RCU state before the
outer preemption disable. rcu_is_watching() drops its internal preemption
reference before returning, and the warning path accesses
TRACE_RECORD_RECURSION_BIT outside the protected lifetime.

Disable preemption before validation and retain that reference until the
recursion bit is cleared. Balance both rejection paths. This keeps
validation and published recursion state inside one preemption-disabled
interval.

Keep the transition slot unchanged. It remains necessary for
interrupt-entry intervals whose context is not yet reflected in
preempt_count().

Use preempt_enable_notrace() because this inline API is also used by
modules. The no-reschedule variant is unavailable there.

Assisted-by: LLM
---
 include/linux/trace_recursion.h | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/include/linux/trace_recursion.h b/include/linux/trace_recursion.h
index e6ca052b2a85a..fd14380751404 100644
--- a/include/linux/trace_recursion.h
+++ b/include/linux/trace_recursion.h
@@ -126,11 +126,16 @@ extern void ftrace_record_recursion(unsigned long ip, unsigned long parent_ip);
 static __always_inline int trace_test_and_set_recursion(unsigned long ip, unsigned long pip,
 							int start)
 {
-	unsigned int val = READ_ONCE(current->trace_recursion);
+	unsigned int val;
 	int bit;
 
-	if (trace_warn_on_no_rcu(ip))
+	preempt_disable_notrace();
+	if (trace_warn_on_no_rcu(ip)) {
+		preempt_enable_notrace();
 		return -1;
+	}
+
+	val = READ_ONCE(current->trace_recursion);
 
 	bit = trace_get_context_bit() + start;
 	if (unlikely(val & (1 << bit))) {
@@ -145,6 +150,7 @@ static __always_inline int trace_test_and_set_recursion(unsigned long ip, unsign
 		bit = TRACE_CTX_TRANSITION + start;
 		if (val & (1 << bit)) {
 			do_ftrace_record_recursion(ip, pip);
+			preempt_enable_notrace();
 			return -1;
 		}
 	}
@@ -153,8 +159,6 @@ static __always_inline int trace_test_and_set_recursion(unsigned long ip, unsign
 	current->trace_recursion = val;
 	barrier();
 
-	preempt_disable_notrace();
-
 	return bit;
 }
 
@@ -163,9 +167,9 @@ static __always_inline int trace_test_and_set_recursion(unsigned long ip, unsign
  */
 static __always_inline void trace_clear_recursion(int bit)
 {
-	preempt_enable_notrace();
 	barrier();
 	trace_recursion_clear(bit);
+	preempt_enable_notrace();
 }
 
 /**
-- 
2.39.5 (Apple Git-154)

