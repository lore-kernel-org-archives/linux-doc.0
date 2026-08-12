Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45104657F2
	for <linux-doc@vger.kernel.org>; Wed, 12 Aug 2026 14:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786546496; cv=none; b=oZEVFJokUUlwf8+NMpHtSKj/v2OSPuHXjtPLwPM3bZ5mPUU1Syr6XTJ/SyoHfGNCT3wLO32E7G4rarcQUfrWesmBjEj9DdB8ImTiMSh3+Bc3+RlWtX+25OYC9/8qgvj3n2PbmGtt+2QecUd5ucqQ9qiUTP1qtCisSQhMjwiuH58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786546496; c=relaxed/simple;
	bh=ggZWb/rBiqtP7g2mRVkG7zh3PqK153hqDL94sI8DK4g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hF09oznD3NLL0AeMOhxMukkC/+0p2xBSHjCtS3usum2daMcW/TfjlLJVuqkN7RhYuF/m+PfWb/nuZL9bOaGr9FPC5j9bKawYXLO8OmeWSpVWB+Aax08XrCsGGC1jZ8wQa/B7YnIo0jim7eGHsA4V6yv8aRZt/szXkKACT2bu2Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ktYDDo+s; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ktYDDo+s"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38dc69c74b8so1379171a91.0
        for <linux-doc@vger.kernel.org>; Wed, 12 Aug 2026 07:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786546486; x=1787151286; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QyYu/EtrXs6+w7joY9KRy5CcVEubQhW0BF1ueyFLgVE=;
        b=ktYDDo+sE5NBjy5adEWnV5XHGQ6uYJ1ThDPWGN4+7Smz9dC/9ZcbBe8GVCEN3m5wWX
         +GpgmaU58bQVXs7V9ml6nNnrxNN22hxsNoq+V//gKgslrPzyenZSV2CTN8jPONcLtYE/
         hYHpMw5FVgBsw4DLhCBgWQkgY48dpjTaf6TQuae+5Xb4tDj1nVr8jUs/LXO9q0ACQN9p
         gRn/A5S3JigKmRcZb8E3CEhWviFsZWBdqFMx8RQl/1oMEfxG8mSkJxgY/SW/+hUNGo83
         uUM9cB4O+cbFUTFD2NihoaoqxM533mduzcmaOzJFBpxObuPHYzKpxg9tPUAJnyPolKrq
         HXZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786546486; x=1787151286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QyYu/EtrXs6+w7joY9KRy5CcVEubQhW0BF1ueyFLgVE=;
        b=seBpLVh7RyC8kJI6KMORDwiTnZpDDj+v6IVY5mXhjv3OpT8gABxOfxRJTnnb/RKPCS
         gLxdc2JefoC39sAoMIEPLR2db6oauSakb2/bIuBs2mYClCwH+qbpL8uqxvfzuRMR24wR
         EqTHomw+WSGGTIaegoOcenZAYyMIh2J+Py6TO3xfQx22Rp/LXXFmj8oU3pRHSYBbQFl4
         L3g5HXIzucbSyJVVhwArTA4O6ejEY2Nk9c8WxMqyC88uRfE4Mnzs4wKw46/iyR5RSDDJ
         vas8r8nOmZNqdLb4rcJCd5jNs6VbYHENqR0XukaX3fQzTL+iFUfnKTeKtpzW1ec9k2BW
         nsWA==
X-Forwarded-Encrypted: i=1; AHgh+RrQdJ4l3BIMkpfGb0Ao9TUA9XdocKOQRtDowWmEahcamwxM1wLYM+D9KB/au8Tmtig5p2PRw6XL47s=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOLzjjqcdmXWOGsAAACkzS3YtLmstKqcGiAxKdjGVlYRxhFmMo
	NzdWetH7Pbd+D8yZHOMS8b8LJS1/LYauaXW0f5PV7v+fzuGL4txq1zNP
X-Gm-Gg: AR+sD13eQz9L7meWelO1oAORw1QL86ladvG9TB5q8E8w8x6hAtL4kogdCzMIn8mFSpj
	djm6t5Hg77NdPiKQbfzSzFsamW4paDOlPV/BAMZz+f2Ym5LXW93OgJPxaPQeNXNA4pophWvOKaA
	xn22kypm/f8YoO3LTj03JtmAwJOkhJcuG8ykW9v2Qz4Doh77mDQBV0/QH6NQ/hNpNgoS14KlFiU
	JDL0DVGvZfwJOyjbc+Xd9SvR94p8P9AQ3MxWD/TUA4sSGC6/nWKBuO5vK46qImjy6G4gSJsRdq1
	Ity7xLagaRULYc28TTzRYbv//R81ZpfxAV/CFu226wFVb9oGplzaYkBrnio1jif8PoBI4XjOIuQ
	wd95vJeETDIR0Xa4s1wF8AwQ1oZZWB47g456Ou68l8klkDdGLXXT0XyPETi8UJ1Oy8yr+Lfhgr8
	mAALKhimoFVNhc3Rfa4hwbHLfSGwuYYXYCVpUjVw9mOE/+d/G0tX5hW3Eker+m2bePoSKJxFdL8
	A==
X-Received: by 2002:a17:90b:288b:b0:38e:f6eb:2b38 with SMTP id 98e67ed59e1d1-393014944a5mr6567009a91.17.1786546486135;
        Wed, 12 Aug 2026 07:54:46 -0700 (PDT)
Received: from localhost ([220.196.228.78])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392fe4b1659sm1334683a91.3.2026.08.12.07.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 07:54:45 -0700 (PDT)
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
Subject: [PATCH v2] docs: timers: hrtimers: clarify expiry modes and ktimersd on PREEMPT_RT
Date: Wed, 12 Aug 2026 22:54:40 +0800
Message-ID: <20260812145440.23528-1-haohlliang@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260807161929.49913-1-haohlliang@gmail.com>
References: <20260807161929.49913-1-haohlliang@gmail.com>
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
 - the sleeper exception: hrtimer_setup_sleeper() marks RT/DL-armed
   timers HRTIMER_MODE_HARD, so their wakeups do not go through
   ktimers/%u.

Documentation only; no code or behaviour change.

Signed-off-by: Liang Hao <haohlliang@gmail.com>
---
v1 -> v2:
- shorten the RT overview; link to real-time/differences
- state the arming-path priority consequence (priority not inherited;
  PI is for the cancel handshake)
- drop the hrtimer_start trace debugging section
- use the ktimers/%u thread name, with ktimersd as its doc alias

 Documentation/timers/hrtimers.rst | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/Documentation/timers/hrtimers.rst b/Documentation/timers/hrtimers.rst
index f88ff8bae89c..fae191550c5d 100644
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
+``hrtimer_setup_sleeper()`` (used by ``clock_nanosleep()`` and similar)
+is an exception: when armed by an RT or DEADLINE task it is marked
+``HRTIMER_MODE_HARD``, so the wakeup runs in hardirq context and does
+not go through ``ktimers/%u``.
+
+If callback work must run at the owning task's RT priority, either
+mark the timer ``HRTIMER_MODE_HARD`` (and keep the callback
+hardirq-safe) or wake a dedicated kthread from the callback.
-- 
2.50.1 (Apple Git-155)

