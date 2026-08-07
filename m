Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A7B23A561
	for <linux-doc@vger.kernel.org>; Fri,  7 Aug 2026 16:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786119579; cv=none; b=UEl9ejSU7GwOAmueHgYwWOshtr1j0ubrEmL3dJKf+h/bt2AakDbBWh1O1WCAv2ULZoxwbCyb5/YwFxZTRe3sXpGMXJzZUzKl/pWlgUjb5OHLLsXWkh6Ek9gAdN7XGasWAPOdGJsXUceRQfw/xzY8q1vRNYpD3FVUHhiaySdBg7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786119579; c=relaxed/simple;
	bh=dEpKf7v329BrXdPs9AJn8DwSnEo1KjYommT4Au6roLA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fB/atLhFf2B7jhdPvHCLxNopblI2ZPqi1S7xo76kg3O7p2z6SpSqk7HGu9NRCO95mewqwtjE8sy0MnhiP1ePZ37ZnrTodEEQ+t/wc1ZbWFYhSadioyBx2qQ2+M+yGF91sHVtXJQ0c7ZyJIqGZVwfu+zGjWLEnqEcyvlugpn7Bl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SSXaIUAf; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SSXaIUAf"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-84e0688b7e8so3429475b3a.1
        for <linux-doc@vger.kernel.org>; Fri, 07 Aug 2026 09:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786119577; x=1786724377; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fM3zY6Yx/Bjknh43MLjZGdkrP5Xjj8XZi4L5KKoZ5Gk=;
        b=SSXaIUAfULKdK/qALvM1HAuu4rj5ZfndhdQF9r+BQZkkflbn70URWCVZEh1o0i060f
         ngHTr+rk9LhlrLNOqfUHqH+NivvhItoWoxBuwxX3kZDP2PTxCNuGUL3pLrS6iNFWwQ7O
         VWeX5z3d+sOBX1f40tV/8EcbFFNq+tw1RtNTKxsq3ED321zuMJlNw+xpbCgZJ7epGlD5
         4PJ/cYZNkWaCUMS2tu7ZsVeHQyCQUlJmpQYywd1Se1uwHEK22Gd+Qv9GtpSa9joDdZYG
         6xLN0oet/uRy/0+AAUFFYtGO8jafr4Kt1uqdXhsJWXMmuHHYhYLtjTvPQvfvhEQKOs/R
         0iHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786119577; x=1786724377;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fM3zY6Yx/Bjknh43MLjZGdkrP5Xjj8XZi4L5KKoZ5Gk=;
        b=JHwV048+VljZUSPFBwfgF6ieFFqjzIlQEDwBcuIVa4kaJG7LOg8GHTrGg/Dbxgxmua
         eMRHrX/e0V/487MQ2o8VmG8m2A7aDUIaAN7JJCCCjNhEOXhQy0BSMdKuo1qpxCL7niKG
         XiPPOXQP1qWBWwUf53V9G/4bVYf6DT87wSDduhH/X/H9XAi+H3FPwbGnZNFiFK9fDiDW
         NplrSV6vy/CNB1F1CYxcJbFUHgGV03HgSsYr6jsrdg0Kr9+kvnDH7lBEees0znrsstwx
         vCCUWicKTRGgIq0dq5UFRPbnwLL1sB0gv0lSwJukMlIC9cV6xYJCk/Ik0+MAK2ZEYkGL
         SReA==
X-Forwarded-Encrypted: i=1; AHgh+RrWYiS6W8sIUCKA0ghngA5Z4CoNIJY7fR9uTTCQM2zkuOi/MayJhI9f2kIKuihE/OEaU3tib0DWluE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVw7jbIQaf4daOrI+fiRGL3eC3MaOsbbjuZzFsuY5kbyAPdRIy
	9w4EZH6NPv70ExNO1LMlK5ebeLEfgtZ/NNRvO79eSD89oaK8svDxrlfH
X-Gm-Gg: AR+sD10UetHNx6LAEk6MSRNwTrTA1ztbSi2eb5jn6w9R4BPMnyWMwQrhktNbKCY8Tyd
	cY/J+pqfokyfMLWfub4z633zCkNpIm0ahLRGklYm1S01qiCkdKIpnR/tHEVF2/c/ecCwBXciBCb
	QctBp6U+MaFpIWZ+peNFxDSwrLguxM2gfsPjYWqsTxdTrkJOWKJv1aiKrQU6oBF0JvsUuS46au3
	WCZloEXhnBHuRQcwPHTrjJpjit/UtfSwbEyftvcKCF9LVeNukmYjZFX2f1thzJYmBYS5vcz0k46
	uti8lqVSxJl04A4WnSPXliPfjKbgbEqDPEyhtPKQdxnTLyAlt8HdG7+k0+y+aCpUjiwtctkxWwt
	nVBr5NetA/pHfY728wKirEbAtPB2ZsthDOnIq5+tQhkD6/J83CEHssEL+lqh+BobZkB/U6Q2J2y
	Ye+O0ghQanTz8EF3Ft9YdaUOuyvMXCIungZEJVcgbfDLl+KxDIkIQToKfrKagmwp6KqVai9aElA
	Q==
X-Received: by 2002:a05:6a00:3cce:b0:847:711f:49ab with SMTP id d2e1a72fcca58-84f2e006c85mr24601093b3a.22.1786119576732;
        Fri, 07 Aug 2026 09:19:36 -0700 (PDT)
Received: from localhost ([220.196.228.78])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a3a1911sm1285011b3a.3.2026.08.07.09.19.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 09:19:36 -0700 (PDT)
From: Liang Hao <haohlliang@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Clark Williams <clrkwllms@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	Liang Hao <haohlliang@gmail.com>
Subject: [PATCH] docs: timers: hrtimers: clarify expiry modes and ktimersd on PREEMPT_RT
Date: Sat,  8 Aug 2026 00:19:29 +0800
Message-ID: <20260807161929.49913-1-haohlliang@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Documentation/timers/hrtimers.rst described the high-resolution timer
subsystem but did not cover the PREEMPT_RT expiry-mode semantics.  On a
PREEMPT_RT kernel a timer that is not explicitly marked
HRTIMER_MODE_HARD is forced into softirq expiry and its callback runs on
the per-CPU ktimers/%u thread at SCHED_FIFO priority 1, regardless of
the priority of the task that armed it -- a SCHED_FIFO task's priority
does not extend into its timer callback.  This is a recurring source of
hard-to-diagnose latency for RT/DL authors who assume the opposite.

Add a dedicated "Expiry modes and PREEMPT_RT" section that documents:

 - the distinction between HRTIMER_MODE_HARD and HRTIMER_MODE_SOFT;
 - the fact that unmarked timers are forced into softirq expiry on
   PREEMPT_RT (__hrtimer_setup());
 - the role of the per-CPU ktimers/%u thread and its fixed SCHED_FIFO
   priority 1 (sched_set_fifo_low());
 - the absence of priority inheritance between the arming task and the
   timer callback on RT;
 - the sleeper exception, where hrtimer_setup_sleeper() automatically
   marks RT/DL-armed timers HRTIMER_MODE_HARD
   (__hrtimer_setup_sleeper());
 - the critical distinction between the *requested* expiry mode (passed
   by the caller) and the *effective* execution context (chosen by the
   kernel and stored in timer->is_soft).

The hrtimer_start tracepoint logs the *requested* mode, not the
effective one.  On PREEMPT_RT a timer armed with the default mode
(e.g. ABS or REL without HARD/SOFT flags) is implicitly forced into
softirq expiry, so the effective soft nature must be inferred from the
*absence* of explicit mode flags in the trace rather than read directly.

Documentation only; no code or behaviour change.

Signed-off-by: Liang Hao <haohlliang@gmail.com>
---
 Documentation/timers/hrtimers.rst | 66 +++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/Documentation/timers/hrtimers.rst b/Documentation/timers/hrtimers.rst
index f88ff8bae89c..ff42377668c1 100644
--- a/Documentation/timers/hrtimers.rst
+++ b/Documentation/timers/hrtimers.rst
@@ -171,3 +171,69 @@ hrtimers-based high-resolution clock implementation, so the hrtimers
 code got a healthy amount of testing and use in practice.
 
 	Thomas Gleixner, Ingo Molnar
+
+
+Expiry modes and PREEMPT_RT
+---------------------------
+
+Each hrtimer carries an expiry mode that determines the execution context
+of its callback:
+
+  * ``HRTIMER_MODE_HARD`` -- the callback runs in hard interrupt context.
+    It must be hardirq-safe (no sleeping locks, no allocations, no
+    scheduling).
+  * ``HRTIMER_MODE_SOFT`` -- the callback runs in softirq context and may
+    use operations that are not hardirq-safe.
+  * Default (neither flag) -- the mode is selected by the subsystem or
+    the kernel configuration.
+
+On ``CONFIG_PREEMPT_RT`` the choice is not optional for most timers:
+any timer not explicitly marked ``HRTIMER_MODE_HARD`` is forced into
+softirq expiry (see ``__hrtimer_setup()``). Instead of executing in
+hardirq context or within the context of the task that armed it, the
+callback runs on the per-CPU ``ktimers/%u`` thread.
+
+The ``ktimersd`` thread operates at ``SCHED_FIFO`` priority 1 (established
+via ``sched_set_fifo_low()``). This priority is fixed and **does not
+inherit the priority of the task that armed the timer**. The effective
+execution context is determined internally by the hrtimer subsystem at
+setup time and is reflected in ``timer->is_soft``; it is not directly
+visible as a mode flag at arming time.
+
+Consequently, even if a timer is armed by a ``SCHED_FIFO`` task with
+priority 99, its callback will execute only when the ``ktimersd`` thread
+(priority 1) is selected to run.
+
+This design ensures that timer processing does not interfere with
+higher-priority real-time workloads, while still providing bounded
+latency relative to ``SCHED_OTHER`` tasks. However, it also means that
+latency-sensitive processing must not rely on implicit priority
+inheritance through the timer arming path.
+
+A notable exception is the sleeper path: a timer set up via
+``hrtimer_setup_sleeper()`` (used by ``clock_nanosleep()`` and similar)
+that is armed by an RT or DEADLINE task is automatically marked
+``HRTIMER_MODE_HARD``, so its wakeup runs in hardirq context and does
+not go through ``ktimersd`` (see ``__hrtimer_setup_sleeper()``).
+
+**Guidelines for RT authors:**
+
+- If the timer callback contains logic that must execute at the priority
+  of the owning RT task, the timer must be declared as
+  ``HRTIMER_MODE_HARD``. Ensure the callback adheres to hardirq context
+  constraints.
+- Alternatively, move the latency-sensitive logic out of the timer
+  callback and into a dedicated, properly prioritized kthread which is
+  woken by the timer.
+
+**Debugging context:** The ``hrtimer_start`` tracepoint logs the
+*requested* expiry mode passed by the caller (e.g. ``ABS``, ``REL``,
+``ABS|HARD``), not the effective mode chosen by the kernel. On
+PREEMPT_RT, any timer armed with the default mode (i.e. the trace shows
+``ABS`` or ``REL`` without ``|SOFT`` or ``|HARD``) is implicitly forced
+into softirq expiry. When such a timer is armed by an RT or DEADLINE
+task, the consequence -- the callback running at ``ktimersd`` priority
+rather than the arming task's -- is the case to watch. The effective
+soft nature of such timers is inferred from the *absence* of an explicit
+mode flag in the trace, combined with the ``CONFIG_PREEMPT_RT``
+configuration.
-- 
2.50.1 (Apple Git-155)

