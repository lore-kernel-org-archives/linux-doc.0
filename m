Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614553672AC
	for <linux-doc@vger.kernel.org>; Fri, 10 Jul 2026 03:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783654141; cv=none; b=FIHgCPFQ6K5ci9AW/8YUG/0Zh2SYfFzKS0wyZOaU0ZADoHGohRaTMnc8ckVVDF+gCIlLUaWodC/HxuPxJx+W7gK8OyIm+qH1mO3pH07tazQBN3K7Nje+ZIxUC/j+ivlh77jdJ2nhTPr4ijTg0ORPB1IrARD6kIxZXbVDvSckMeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783654141; c=relaxed/simple;
	bh=/7g5rPjTXZCVa2/uRZYg9xonGTIXf23dBk7iXIO7Ns0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wym8fHKf8iCNOp8wCNatq+OmBJ+mj4QgX5P366eA8x82GJXoMe2VzJ3wFYjCiob1R8MtJ2zlq2C8S0BJ9RhY4U03GQEZJcviKKW3kehf/X5mGmTatDQwrs1+COxzmCYnWJpqC2Y7mfqfX5ownjZ225U0ql+O7SOhpfwWUyzi/50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ctctuR/1; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ctctuR/1"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cabc0a1ab6so5830305ad.0
        for <linux-doc@vger.kernel.org>; Thu, 09 Jul 2026 20:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783654140; x=1784258940; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CdWcLivIGaN7u5tA3Cryx3dVQvByPYpqsiikxpuxuiQ=;
        b=ctctuR/1r3DuO1xZ+F+26ZuVuh9k62emAj6nfw8tg4tNihn5UI3STRkKRb7pJEHgKO
         gTg8x9kqXW+KRyQ7hLsgTCUsuxyHRHJ1qz2/ibVxZFUgRqxU98LpMP7OVP9mtfG8WCJu
         Kwf8nz/PZ7JkWKLwoDFxFWzgTG6mq/V3ofvtzsQ9TUT61VYhBXSaDN55rZSWLYdfxsE/
         9hG6mKhIQuie5XEYE7PcILmUD/t7gytXx8qzqrxLF4li2f8zcCSdJxFJX6sBDNdSqAVU
         z6IEDwN9h8XvV1ZXOPqPtTprZDy/g+52goUjSwKSI4dP24HyBdIxgU/DqWx4/MKdsFi9
         tVLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783654140; x=1784258940;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CdWcLivIGaN7u5tA3Cryx3dVQvByPYpqsiikxpuxuiQ=;
        b=QY6l3Y4bUcE7kx9QOT6euOveKZ5wpu0kN+WqyeBMyjJMPPmSJsOkdg/Acg/5eSWWRI
         UyB7JEsOwMv7yZkOE9+W+mekYe7L43nIRts7v0Uj09GYOY0T8YK8+AlsqjQdZvRaWk6L
         R7c+dDhhwTsN7VCwYvuJQRMK5zpW/QtjTfcHYFu7ckXM1Zan+pFsBRUArE1YPho2GbyR
         yin2Eji4m47u+nzbcd7Vu9y8I7f4AzQtTSIeFh+Z9aSCRd2h2t9jI+i7iB0uVBZEevmj
         8Pb9zx9U2XwzlXprYgC0em31wK3OptoV+lsI//VqRN/2+AZ+AEwjYo7IP9GUtlCAGwiF
         lQxQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr7mmZn7yncjCcjBxPf42/YzTpnJbsjQfWqdjTvoAV8CEQf89k2jrpF/HNjC09Halz1EcdI96n+kss=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmFi0HCn12oEwbrU+jTZpGmTcFI9LvgjbmRdrv56zM0Kk/4odx
	DJEr+i7CCQL5un6Wdop9BC/esnc/FkQzijPM2mHqpJZC5RvzhUgWk6fj
X-Gm-Gg: AfdE7ck464euWzUeH/pZAz6wYAj9lJY/nldazy/JLW6ahE0t+CJ7N2T5ACnOxxKhvaU
	VCbciU/3vbDj9Dp8AgMb5l+8SR4DIrGSc9FYFH3WLNsOTZax9NSLN8rEIj/7kFOq6WqHnOrimYJ
	xK1G3IUWGzQs4lW2Tu0MLZkDiFHlV2gdxmhuZcRXQevhpHZWMMsFdBkjHc8uCdyBlj1h4JNagXw
	5Ot4iXargaRkafWUv1B9tt+tLVwA1hyui0NHj4OmwPxuDCRb55XJaovc+sVFRP6JlzMfqfUWwSq
	kzKzvTjsrXhtMdEeAfRNXy2LrggJR4Tcgng/8SqOkVlbVreRF2i/DJWetmzYU8SduP13hyUc/3N
	Hgywb5tj+U3nqnS2iFesJR8AUUAWzb5mBZ0OBDB71TYCnHPRyPKg0cOrQS24MEJTagAusWgTHM4
	QK0kZ5/2qMMgI=
X-Received: by 2002:a17:903:22c1:b0:2bf:9760:b94d with SMTP id d9443c01a7336-2ccea37ace4mr104298875ad.15.1783654139660;
        Thu, 09 Jul 2026 20:28:59 -0700 (PDT)
Received: from [127.0.1.1] ([138.199.21.246])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bdb56fsm53436465ad.15.2026.07.09.20.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 20:28:59 -0700 (PDT)
From: Jing Wu <realwujing@gmail.com>
Date: Fri, 10 Jul 2026 11:28:15 +0800
Subject: [PATCH v4 04/11] context_tracking: allow runtime per-CPU user
 tracking enable/disable
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-wujing-dhm-v4-4-2e912e5d9645@gmail.com>
References: <20260710-wujing-dhm-v4-0-2e912e5d9645@gmail.com>
In-Reply-To: <20260710-wujing-dhm-v4-0-2e912e5d9645@gmail.com>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
 Juri Lelli <juri.lelli@redhat.com>, 
 Vincent Guittot <vincent.guittot@linaro.org>, 
 Dietmar Eggemann <dietmar.eggemann@arm.com>, 
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, 
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, 
 "Paul E. McKenney" <paulmck@kernel.org>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
 Joel Fernandes <joelagnelf@nvidia.com>, 
 Josh Triplett <josh@joshtriplett.org>, Boqun Feng <boqun@kernel.org>, 
 Uladzislau Rezki <urezki@gmail.com>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang@linux.dev>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, Tejun Heo <tj@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Shuah Khan <shuah@kernel.org>, Thomas Gleixner <tglx@kernel.org>
Cc: Waiman Long <longman@redhat.com>, linux-kernel@vger.kernel.org, 
 rcu@vger.kernel.org, cgroups@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Jing Wu <realwujing@gmail.com>, 
 Qiliang Yuan <yuanql9@chinatelecom.cn>
X-Mailer: b4 0.13.0

ct_cpu_track_user() and the context_tracking_key static key are currently
restricted to boot-time use: the key is __ro_after_init and the function
is __init with __initdata state.  This prevents enabling nohz_full context
tracking for CPUs isolated at runtime via cpuset partitions.

Split ct_cpu_track_user() into three functions:

  ct_cpu_track_user(cpu)      - sets per_cpu(context_tracking.active) and
                                increments context_tracking_key; callable
                                at runtime with the CPU offline.

  ct_cpu_untrack_user(cpu)    - reverses the above; for de-isolation.

  ct_cpu_track_user_init(cpu) - __init wrapper; calls ct_cpu_track_user()
                                and handles TIF_NOHZ / tasklist setup.

Change context_tracking_key from DEFINE_STATIC_KEY_FALSE_RO to
DEFINE_STATIC_KEY_FALSE so that static_branch_inc/dec() can be called
after the __ro_after_init window closes.

Update tick_nohz_init() to call ct_cpu_track_user_init() so boot
behaviour is unchanged.

This is a prerequisite for DHM (Dynamic Housekeeping Management) runtime
CPU noise isolation without boot parameters.

Co-developed-by: Qiliang Yuan <yuanql9@chinatelecom.cn>
Signed-off-by: Qiliang Yuan <yuanql9@chinatelecom.cn>
Signed-off-by: Jing Wu <realwujing@gmail.com>
---
 include/linux/context_tracking.h |  2 ++
 kernel/context_tracking.c        | 38 ++++++++++++++++++++++++++++++++++----
 kernel/time/tick-sched.c         |  2 +-
 3 files changed, 37 insertions(+), 5 deletions(-)

diff --git a/include/linux/context_tracking.h b/include/linux/context_tracking.h
index af9fe87a09225..735d353d87560 100644
--- a/include/linux/context_tracking.h
+++ b/include/linux/context_tracking.h
@@ -12,6 +12,8 @@
 
 #ifdef CONFIG_CONTEXT_TRACKING_USER
 extern void ct_cpu_track_user(int cpu);
+extern void ct_cpu_untrack_user(int cpu);
+extern void __init ct_cpu_track_user_init(int cpu);
 
 /* Called with interrupts disabled.  */
 extern void __ct_user_enter(enum ctx_state state);
diff --git a/kernel/context_tracking.c b/kernel/context_tracking.c
index a743e7ffa6c00..a81d9f8b85eed 100644
--- a/kernel/context_tracking.c
+++ b/kernel/context_tracking.c
@@ -411,7 +411,7 @@ static __always_inline void ct_kernel_enter(bool user, int offset) { }
 #define CREATE_TRACE_POINTS
 #include <trace/events/context_tracking.h>
 
-DEFINE_STATIC_KEY_FALSE_RO(context_tracking_key);
+DEFINE_STATIC_KEY_FALSE(context_tracking_key);
 EXPORT_SYMBOL_GPL(context_tracking_key);
 
 static noinstr bool context_tracking_recursion_enter(void)
@@ -674,14 +674,44 @@ void user_exit_callable(void)
 }
 NOKPROBE_SYMBOL(user_exit_callable);
 
-void __init ct_cpu_track_user(int cpu)
+/**
+ * ct_cpu_track_user - enable context tracking for a CPU
+ * @cpu: target CPU (must be offline when called at runtime)
+ *
+ * Marks @cpu as actively tracking user/kernel transitions and increments
+ * the context_tracking_key refcount.  Safe to call at runtime provided
+ * the CPU is offline so no context-tracking readers are active on it.
+ */
+void ct_cpu_track_user(int cpu)
 {
-	static __initdata bool initialized = false;
-
 	if (!per_cpu(context_tracking.active, cpu)) {
 		per_cpu(context_tracking.active, cpu) = true;
 		static_branch_inc(&context_tracking_key);
 	}
+}
+EXPORT_SYMBOL_GPL(ct_cpu_track_user);
+
+/**
+ * ct_cpu_untrack_user - disable context tracking for a CPU
+ * @cpu: target CPU (must be offline when called)
+ *
+ * Reverses ct_cpu_track_user().  The CPU must be offline so that no
+ * context-tracking readers are active on it.
+ */
+void ct_cpu_untrack_user(int cpu)
+{
+	if (per_cpu(context_tracking.active, cpu)) {
+		per_cpu(context_tracking.active, cpu) = false;
+		static_branch_dec(&context_tracking_key);
+	}
+}
+EXPORT_SYMBOL_GPL(ct_cpu_untrack_user);
+
+void __init ct_cpu_track_user_init(int cpu)
+{
+	static __initdata bool initialized = false;
+
+	ct_cpu_track_user(cpu);
 
 	if (initialized)
 		return;
diff --git a/kernel/time/tick-sched.c b/kernel/time/tick-sched.c
index cbbb87a0c6e7c..ba7adc671c580 100644
--- a/kernel/time/tick-sched.c
+++ b/kernel/time/tick-sched.c
@@ -677,7 +677,7 @@ void __init tick_nohz_init(void)
 	}
 
 	for_each_cpu(cpu, tick_nohz_full_mask)
-		ct_cpu_track_user(cpu);
+		ct_cpu_track_user_init(cpu);
 
 	ret = cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN,
 					"kernel/nohz:predown", NULL,

-- 
2.43.0

