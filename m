Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8366A48BD39
	for <linux-doc@vger.kernel.org>; Fri, 14 Aug 2026 16:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786723971; cv=none; b=F6CEZQiXZrxc9ZEmo7ceT+q1kyLr7GOL9Qfdu701pavW3XTDMNqR68g+t9wJxKXnLYBOhyxqOOlFv2AYCRu5epUIeIfW4yysTwWMa675n/bYPThzd/NSTeJQdk6ADRftM4G+dV+PL9LUjQOIetsxfsb/Qyx8r9ZwWCgcZQJfZZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786723971; c=relaxed/simple;
	bh=hBoTlJskC3yTAUQrqdc/RwBmCeeh3r4SPWGRRWjMR10=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TedTW9gs4jc+qBbdlA5NR1A383J3MU3Fin+uZjqj6IM+jN7kZnz0kMOm0jfus7iPPkBy80NyGoATWpj/wbst+LAPz6UPMyMHMKccwoZCQfXRQQVzep6rv8fBzVVssoZ0Ma3Bo2QmohhP682lskcJsIg3dZEX6wuEK+4WS8xBzgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZYu4gekV; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZYu4gekV"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2caed617615so16924895ad.3
        for <linux-doc@vger.kernel.org>; Fri, 14 Aug 2026 09:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786723967; x=1787328767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AntyT1xcB6lPLO8SgF8lHn/f8LIO7sUmv8TB1AYj/jE=;
        b=ZYu4gekVzXPzLbhju2z4FnWiKK0uXFo4KIFT2DI8Ef3VE7f6k/2XBir4Xgic0Pisq/
         IUNzluF998fD40upsAjvRzKe7W6tsJxkGGweRFLNRqyvoaOlNPJGBaOvWAy7lYow8rvf
         EWDwEQSXq2HlM1ELVQ0oQe/4mQ9Aqnsq9vR7p64vFtTtc/U6l0oxoUr6HoONyF6bsJCJ
         4LP6OpfJGdvAuNwbv0nmhqaHIX83KRgToRI3FPkE3mIHI8gG0lNNBBGBwiS8ZMhidDBO
         lOCW2VbBc4SX0b0smnIhXG23/zXXTF4I2oGmTLuU5xOrp0EcZtwQg8u3jYRlxAjm1xZb
         LSCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786723967; x=1787328767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AntyT1xcB6lPLO8SgF8lHn/f8LIO7sUmv8TB1AYj/jE=;
        b=DLe8dtFrTaUbLF6DXetgnu6WDgkdUnO4oCC52PtOMKAlSgAvY8zftQBrCH3it/kB/v
         9Gd/gz8u8KROxd3uhsE3nW/RPNv5bqw2iAzwJWmWUCzFQzzzMurQyjqdyaF9vKMfzWXy
         a4jQglypNPw4foqAoMom3J89erRx+wUzdDE09ANfEj/Hi5ufSqt1MiTH4mte1Gf2Gko/
         oyzzf66VUkhs9/BVnftxPEG2cfOIjEMSI2+eFNLJV/yPCxvs6qSncYZyB2NJBrDkYyA0
         /2LDCnR/YUB0/GjXqAYZBXc9X4QjMTOoWAi69zy6P9QW7HxNAaFKh2GotzicRoWfRnYg
         k32g==
X-Forwarded-Encrypted: i=1; AHgh+RpAbmUH0Dp76BgaxYwAXLBMbztzPK4OwKRHBWSnNO7WOL24bON7UnnW7h+JZASAwxJw7SoAveN0Uyc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMSKw5zMyMDPs5zWzVUuEmvPRczHpTofALEdfk9xQ223AWEyEe
	8IjGjU962Q2ED8xN/IjmxMQRVb8sAY/fDlAgPuvvIJuxBZ9bCf0vnbTu
X-Gm-Gg: AR+sD11zI68N4mcl+LPTyjdKaFMaBGkbngE49AXdXKuNMM4RsxDzbDv4u/gcy+fb4uV
	Pm+IK4Zk+DF/gA0U3pf9GHnOFabRSKhLNogAqT+ZRStFHw+odRT923lrOzx0h/w3HnjNpOHw8ao
	fZe6Eqd3SLPRTSZkTRbeEfMPh8UUsC0EZuPFcelzElfYLaFwwLputoSArbCXgbxUatrPCivd6Y4
	OTXgXZay2czb+Ed87D+mKslsGjQLBnM8KOo+rn3vldzyRpGCA5MwZ+pfDuvlo9ihs+VRB7tml13
	aXm0tvyIxNTAW3EfpN77HSzTk0KsHdeiaLbYz9V+k12kQIsqkZlGqOmg4v+XOhjG/yIwChK714d
	1Ga9oSnVatgUe9zw4jZNulCExcrIOZ0bEGWOHs4SAnPDsLDPaCJXKdUFwopdxbr/UsnDamHHjgd
	4ARtxDEVkteE7YNpZfAeiSotUjq4Q0Rrqo2odjM7wSB/eK6ARyvBneszE1Pgps8cIu/pouv9Mug
	VF1knY=
X-Received: by 2002:a17:903:2c0f:b0:2c7:ebfb:618f with SMTP id d9443c01a7336-2d3b0eec2f6mr92007415ad.14.1786723966514;
        Fri, 14 Aug 2026 09:12:46 -0700 (PDT)
Received: from localhost ([220.196.228.78])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d3aeb887aasm12260415ad.61.2026.08.14.09.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 09:12:46 -0700 (PDT)
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
Subject: [PATCH v4] docs: real-time: mention the hrtimer sleeper HARD path
Date: Sat, 15 Aug 2026 00:12:40 +0800
Message-ID: <20260814161240.33774-1-haohlliang@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260814094910.akPMAqd4@linutronix.de>
References: <20260814094910.akPMAqd4@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Timers section of Documentation/core-api/real-time/differences.rst
describes the PREEMPT_RT default (softirq / ktimers) and HRTIMER_MODE_HARD,
but not the sleeper helper: hrtimer_setup_sleeper_on_stack() marks the
timer HRTIMER_MODE_HARD when the current task is RT or DEADLINE and
HRTIMER_MODE_SOFT was not requested, so the wakeup runs in hard interrupt
context.

Document that behaviour. Also rename "ktimersd" to "ktimers/%u" to match
the per-CPU thread name.

No code or behaviour change.

Signed-off-by: Liang Hao <haohlliang@gmail.com>
---
v3 -> v4:
- drop the Documentation/timers/hrtimers.rst section; extend differences.rst
  instead, per review
- add only the sleeper HARD wording and the ktimers/%u rename
- do not restate lowest-priority / cancel-PI points already covered elsewhere
- avoid vague "and similar" caller lists

 Documentation/core-api/real-time/differences.rst | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/core-api/real-time/differences.rst b/Documentation/core-api/real-time/differences.rst
index a129570dab5a..c8acfba051eb 100644
--- a/Documentation/core-api/real-time/differences.rst
+++ b/Documentation/core-api/real-time/differences.rst
@@ -119,12 +119,17 @@ timers initialized with the HRTIMER_MODE_SOFT flag, which are executed in
 softirq context.
 
 On a PREEMPT_RT kernel, this behavior is reversed: hrtimers are executed in
-softirq context by default, typically within the ktimersd thread. This thread
-runs at the lowest real-time priority, ensuring it executes before any
-SCHED_OTHER tasks but does not interfere with higher-priority real-time
+softirq context by default, typically within the per-CPU ktimers/%u thread.
+This thread runs at the lowest real-time priority, ensuring it executes before
+any SCHED_OTHER tasks but does not interfere with higher-priority real-time
 threads. To explicitly request execution in hard interrupt context on
 PREEMPT_RT, the timer must be marked with the HRTIMER_MODE_HARD flag.
 
+hrtimer_setup_sleeper_on_stack() marks the sleeper HRTIMER_MODE_HARD when the
+current task is in a real-time or deadline scheduling class and
+HRTIMER_MODE_SOFT was not requested, so the wakeup runs in hard interrupt
+context rather than on ktimers/%u.
+
 Memory allocation
 -----------------
 
-- 
2.50.1 (Apple Git-155)

