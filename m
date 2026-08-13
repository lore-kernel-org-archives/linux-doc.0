Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB3948424F
	for <linux-doc@vger.kernel.org>; Thu, 13 Aug 2026 14:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786633075; cv=none; b=SaancdON3rXVWg9lKdjhPPvjS4FETIk1FfTFK0I9a17SSyAWIZ5+iifqX724rSqE+U2XeUs3fgc8MB0riKp70OvSGztYz20RwbB/5S16ewl7qQ1FDLaeeZg4SMIwp+w0HzS8luj6g0TdA5/wwpN7GRM3WmNodTy/CHGBfKsOPiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786633075; c=relaxed/simple;
	bh=UzDJRYzn8/XIL+G2itjXNV/UKIkP2Zl5tn0cjd5eH1M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uPLiZa410sdQFqR3a2Wd2Bvqgt5zwUWCQJ2GrKnsltsACSntH2945LMoYq71KybuRAiqSD4nfSq3qKEeoiqUenSrI/5vu1Bj48qBGnIvcxUfCHso1f+NfT0JLW9UqMDSYM1JuobQu+5J6uKrdVx8whDQfc72i33H151XJYMx0no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SZhH/LlP; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SZhH/LlP"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ccf2360620so420115ad.3
        for <linux-doc@vger.kernel.org>; Thu, 13 Aug 2026 07:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786633071; x=1787237871; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6zYINpSgOxSLHev+n0fE2laFlkLhiN8CqX0AHvm/85M=;
        b=SZhH/LlPofaMk1OJbKlkFJeTl/nY/8lwj6vXxzKBdjT1h8yzVWXx+nb2/iBZ1yzp14
         9cTYeGak1oEf0Ir0VM6FIdCJsvjtWWUe4wCVXjMj6ULVHJlVdorhFh6v8f4Ncx2HOLYt
         w4rgTlMJYdrHt/49bbrjSjaBmZPftMIARBVlhg8y2Z4qpJXFvKYk01pnhuBO5dCwgpft
         LO5iuQk9fyrR5WPW+OkGIvy974djA6ru28+TW2PeFKVZE4qd27JDspTyuBVxzx9EAsYQ
         Pv6aq7izq7eGYJdVhISrz9/D3Zq57TXu4s6cPTRTLMJ1vex9/HpGKndkGF60RTHStA5/
         OwOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786633071; x=1787237871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6zYINpSgOxSLHev+n0fE2laFlkLhiN8CqX0AHvm/85M=;
        b=RWu26yswhslfyDdl86jA6TV4OdRpY8GPkCd6wL5jZy5OIJvlHLbUw7zeUf6WCGzbk9
         JZoEpTCIGI2jdTtN+h/vGBs+5m5unMgD4tAyV9VgDEqpVrW2EoUjDoBWJDulPQiV2Uq/
         NTK799YqaD3dbEen2A0X5jqB/TbpxsBGPbsLVyQVvn86VC2pp/FW+WuQI44M/W2qGB/v
         PmbKDEmcxRTGl0MYbXPlMHF6ixKRW92N47iQo4GTI2FAB7XALNE9Mxvwk5XZW9l3sON0
         GyCxz1lZLyQkf0LK7ghatKcpwA4iSwwNIF1d1p3NzVRFWP9JOqo7gcFAZloEMzpSqccb
         OmYg==
X-Forwarded-Encrypted: i=1; AHgh+Ro2KLniznSEOHZk1NSjZWju1n03r5lyiW+S0kqCUclrBMefkeEVa/sB+mqggDmkTxxiJxQtfdyAKzk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSgoJlbQucyU/vdlHdf198GNcPQSM1dW2etYbxj3TsuRERncTX
	9onk1d2LsB0Jw51EnE/w0jdoZgocMle0SyKgCnTa4hzSeOKkNJq6cRmN
X-Gm-Gg: AR+sD12y2IcxlBngFQ5leoVBGDeyseCWtdK/3ltegbOngcj/GiermRgyxv3HKLP2rmr
	AKkRYy7Rryoru/j6ykR289DMIMtXljNriCzmRF7/ZcSbaokMy86RjY/6UUgWTyXuhtnYZDre1m2
	9Z6QsVOOGH32pPKgK9IVH8JccVe5JhtKwUSApGrKYud9/o36kKdyd7NyOZaCx67xgsbMRHjgM6U
	/JIZV003Rlxls/R4H/jByoceWeSoxcivcBMXnoUpu27d3nsL4LDJJY+iMBNVWug1OlbENrEXhhV
	wkS3Ww0u08w35mS7Wr9M3IA7TEazj2wdv6U1Pn787+7H2yt9HHQT+W0RQMIZzuE7HqrSKOfv8tb
	h2FodBtm6B4Lb1P1gkejg1GVakxt9gnrJab6F5eBmCf1bPzcmIZbNIqzvI29++B47R2tOZnLjgI
	TXYl3zVWujOnLWca4gnSe1AIjww5IacFxeXIglNBYPV3YjEg2/vlazLvwCjEhtq5APJeYorQmTH
	CqIhDQBsiA8kw==
X-Received: by 2002:a17:902:f550:b0:2cf:7fab:3cf with SMTP id d9443c01a7336-2d37ebcefa5mr59040865ad.23.1786633071088;
        Thu, 13 Aug 2026 07:57:51 -0700 (PDT)
Received: from localhost ([220.196.228.78])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d37c40e8c4sm11313775ad.45.2026.08.13.07.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 07:57:50 -0700 (PDT)
From: Liang Hao <haohlliang@gmail.com>
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	Liang Hao <haohlliang@gmail.com>
Subject: [PATCH v3] docs: timers: hrtimers: clarify expiry modes and ktimersd on PREEMPT_RT
Date: Thu, 13 Aug 2026 22:57:46 +0800
Message-ID: <20260813145746.26612-1-haohlliang@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260812145440.23528-1-haohlliang@gmail.com>
References: <20260812145440.23528-1-haohlliang@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Documentation/timers/hrtimers.rst did not cover the PREEMPT_RT
expiry-mode semantics.  On a PREEMPT_RT kernel a timer that is not
explicitly marked HRTIMER_MODE_HARD is forced into softirq expiry and
its callback runs on the per-CPU ktimers/%u thread at the lowest
SCHED_FIFO priority (sched_set_fifo_low), regardless of the priority of
the task that armed it -- a SCHED_FIFO task running at priority 99 that
starts an unmarked timer still expires on ktimers/%u (lowest SCHED_FIFO
priority), not at priority 99.

Add an "Expiry modes and PREEMPT_RT" section that, rather than
duplicating the default-context description in
Documentation/core-api/real-time/differences.rst (Timers),
cross-references it and focuses on what that document does not spell
out:

 - the callback does not inherit the arming task's priority, and
   priority inheritance on PREEMPT_RT is used for the cancel handshake,
   not the arming path (the "Spin until ready" section of the same
   document);
 - the sleeper exception: hrtimer_setup_sleeper_on_stack() marks
   RT/DL-armed timers HRTIMER_MODE_HARD, so their wakeups do not go
   through ktimers/%u.

Documentation only; no code or behaviour change.

Signed-off-by: Liang Hao <haohlliang@gmail.com>
---
v2 -> v3:
- use hrtimer_setup_sleeper_on_stack(); there is no hrtimer_setup_sleeper()

 Documentation/timers/hrtimers.rst | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/Documentation/timers/hrtimers.rst b/Documentation/timers/hrtimers.rst
index f88ff8bae89c..b81785e0310e 100644
--- a/Documentation/timers/hrtimers.rst
+++ b/Documentation/timers/hrtimers.rst
@@ -171,3 +171,31 @@ hrtimers-based high-resolution clock implementation, so the hrtimers
 code got a healthy amount of testing and use in practice.
 
 	Thomas Gleixner, Ingo Molnar
+
+
+Expiry modes and PREEMPT_RT
+---------------------------
+
+The default expiry context on PREEMPT_RT and the role of the ktimersd
+thread are documented in :doc:`/core-api/real-time/differences`
+(Timers).  Those details are not repeated here.
+
+The per-CPU ``ktimers/%u`` thread (referred to as ktimersd in that
+document) runs at the lowest ``SCHED_FIFO`` priority via
+``sched_set_fifo_low()``.  That priority is fixed: the callback does
+not inherit the priority of the task that armed the timer.  A
+``SCHED_FIFO`` task running at priority 99 that starts an unmarked
+timer still expires on ``ktimers/%u`` (lowest ``SCHED_FIFO`` priority),
+not at priority 99.
+Priority inheritance on PREEMPT_RT is used for the cancel handshake,
+not for the arming path; see the "Spin until ready" section of the same
+document.
+
+``hrtimer_setup_sleeper_on_stack()`` (used by ``clock_nanosleep()`` and similar)
+is an exception: when armed by an RT or DEADLINE task it is marked
+``HRTIMER_MODE_HARD``, so the wakeup runs in hardirq context and does
+not go through ``ktimers/%u``.
+
+If callback work must run at the owning task's RT priority, either
+mark the timer ``HRTIMER_MODE_HARD`` (and keep the callback
+hardirq-safe) or wake a dedicated kthread from the callback.
-- 
2.50.1 (Apple Git-155)

