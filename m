Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D143749E9
	for <linux-doc@vger.kernel.org>; Thu, 20 Aug 2026 14:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787237222; cv=none; b=mqfQ9er2+vIB4Y0IZ6SD1hTQjA7sFdOEwwKGNdMdQI85iQ4YMudvCupvX2U4YcHkzdrRWkDdakwmXilFdfsNiZUem8unBVMyI885HBsSSZtCwy+xNOJYfR2JXbiXcUAeHtKH5UMZXfZ02IWKjs7QtH/E6YedS2uEhFf4/wLs95g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787237222; c=relaxed/simple;
	bh=Ftej52SklxTXozfvmwOfHn0CtfseigpuDEQMNnD7W1o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Om3LJtg3QLH9I9SRbbFY0YuMJuTn6rNgMNo47Ywod405U7GtQYRXGG6PtIoPW7KNuivs9tErbaoTcSnQpxtB/MAdaEpCp9hry76Xewx+np1eYK8yNXF58vtoq9ZWEbcEOIukw5B2KUi5rYRYUfEX1y68j1LGyz4Cs6UUFKbexpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bD+YaKOD; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bD+YaKOD"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-84874b52eabso2862897b3a.0
        for <linux-doc@vger.kernel.org>; Thu, 20 Aug 2026 07:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787237220; x=1787842020; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LVfSuQvXyLuniL2nm4D/+95VYDhWOHF3K6aMyMIHSIs=;
        b=bD+YaKOD5w8N0E+d55NiVMfaAAqJLscptEtGsl7naB4ynkmGwgm/mLDoeLch/LZbjb
         PFITIi8an1ba2ps7CaxgC8Ur1Xf7+0KrnbpN1Pn3KUtpxCibBGTFs6FQ3ssf2b1g9Ni+
         L0X0ToTeGcFhxinFdhd1AgDbaXVEi9g99PVjJrII28wkGBz+tyr/lmk0tO2Rm2HEIifz
         Y58vBbnvjJ9TPjuK9mON80K/aPyf5EISpCTPMxCXXwXXsnDKwFiuRncVOS/UK1czDYVk
         Tysd6+iSxWJ1mUgqjy9cnFm4eSJdawCIJqYw9NX4tPJ6BwsE306xDjtF1Tx7xjtIjfWw
         M68w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787237220; x=1787842020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LVfSuQvXyLuniL2nm4D/+95VYDhWOHF3K6aMyMIHSIs=;
        b=rcZMlkYWoinFKH9Qt8OvR+VOQXD7cEsbHQ152s2PiPb/wrhawxhXkTxKhvC2vXW17P
         O0HNmNVMn2QASw5n20MHNmZ0hpxaHQfOEC02/G4cb4KORhdMRxMtip0RKwNWxQg+f6Kt
         0vgxhJ2oiyKmkZc9zgtv/XYY0xPLruFhTX3uqDemhN/qfjVwdgdD1GFffI0kaDlmwDdv
         d0QPmp2xl2pY9EBmTxnUoLyZ66Av/n412YMuOx1pbUJVx9gHKLqPFjPMjPlOn4SNiIp4
         RauyZZURil3nQKs9udTciQZ5wH6UmIyS4+pUdF+5fhwocpxQ34jBNsn4CQXNNrUXQ4YM
         U7Jg==
X-Forwarded-Encrypted: i=1; AHgh+RoBM4c/3ljF015mL2sehnzbIuYCi8uCmI6EvoPkxJE/FSPx3sCc+JpRvbHdQAfONsiJh22ssZKSazk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzDoTt/38LFNeH4NazSUABJ/vng/sZ+U2yqUfLXqBIFGbJCZ8V
	rYu5Lh++h3LXU5JPqg1RNgzwzXmsRkwSnoVJd4qfa3qNw9KN80fqFUbg
X-Gm-Gg: AR+sD12jYUW0qiuhs1pGvrjpvS5C187SV4NhGqsKLclqUhETnCJ5MxdWo55BEULZ7zq
	ypCoa9gg0q/Gom7klf2hzqR3Qt7nYtyxtX+M8C5i7U6X403FVVCorhqCO0iv3xYtEzeMta2piS2
	N76EstRKX+b9mcIQDqZyZYHUPzlBRRUamJCjWSrILQZO/8kUN3MPj1tou2hDIKagCyKx3q3L3lw
	TI9EQPGRCKKl0zw9r0Gd3/+763QyTO24mm4AYhrJ4140WohtVpdDnw2pPbdGLXX04WaNOn6emqh
	00fjU6Fx3IaEcjE1gdPC+FGXQs7WiVUvEfikNss0dD9AdFsUZm1/K25nwalMC9wHZDhqFFutCp/
	CpUePfTo2buhoDj+HgKV1XFoP15lgdiu+IHz4kGADI1rhuDmY7aCHM9zhRWmSLtsCSfBceNbQ+W
	Q+VZSC91tvLh2JQkziYOdUf74Brpob/XCYJnME7blT0/jT6Y3t1daubsh7VOpHSmYm8FDVrGsRr
	A==
X-Received: by 2002:a05:6a00:2d8f:b0:84f:dfce:966b with SMTP id d2e1a72fcca58-851d387fed3mr21945328b3a.8.1787237220112;
        Thu, 20 Aug 2026 07:47:00 -0700 (PDT)
Received: from localhost ([220.196.228.78])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851d3640a4bsm1800099b3a.42.2026.08.20.07.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 07:46:59 -0700 (PDT)
From: Liang Hao <haohlliang@gmail.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	Liang Hao <haohlliang@gmail.com>
Subject: [PATCH v5] docs: real-time: mention the hrtimer sleeper HARD path
Date: Thu, 20 Aug 2026 22:46:55 +0800
Message-ID: <20260820144655.22492-1-haohlliang@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260820082114.QIiSu8n5@linutronix.de>
References: <20260820082114.QIiSu8n5@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Timers section documents the PREEMPT_RT softirq default and
HRTIMER_MODE_HARD, but not the sleeper helper used by userspace sleeps.
Describe that path, and rename "ktimersd" to "ktimers" to match
ksoftirqd naming in this document.

No code or behaviour change.

Signed-off-by: Liang Hao <haohlliang@gmail.com>
---
Thanks!

v4 -> v5:
- use "ktimers" instead of "ktimers/%u"
- replace the sleeper paragraph with wording suggested by Sebastian

 Documentation/core-api/real-time/differences.rst | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/core-api/real-time/differences.rst b/Documentation/core-api/real-time/differences.rst
index a129570dab5a..04be5789b5fc 100644
--- a/Documentation/core-api/real-time/differences.rst
+++ b/Documentation/core-api/real-time/differences.rst
@@ -119,12 +119,20 @@ timers initialized with the HRTIMER_MODE_SOFT flag, which are executed in
 softirq context.
 
 On a PREEMPT_RT kernel, this behavior is reversed: hrtimers are executed in
-softirq context by default, typically within the ktimersd thread. This thread
+softirq context by default, typically within the ktimers thread. This thread
 runs at the lowest real-time priority, ensuring it executes before any
 SCHED_OTHER tasks but does not interfere with higher-priority real-time
 threads. To explicitly request execution in hard interrupt context on
 PREEMPT_RT, the timer must be marked with the HRTIMER_MODE_HARD flag.
 
+Userland sleepers usually deploy a hrtimer to guarantee a precise wakeup
+time. The timer is initialized with hrtimer_setup_sleeper_on_stack(), which
+distinguishes between real-time and regular tasks. The hrtimer of a task
+without a real-time priority is initialized with HRTIMER_MODE_SOFT, but for
+real-time priorities HRTIMER_MODE_HARD is used. This ensures that real-time
+tasks are woken up as soon as possible while ordinary tasks cannot block the
+CPU with a thundering herd of wakeups.
+
 Memory allocation
 -----------------
 
-- 
2.50.1 (Apple Git-155)

