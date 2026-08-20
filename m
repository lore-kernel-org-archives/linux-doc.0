Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8130247D932
	for <linux-doc@vger.kernel.org>; Thu, 20 Aug 2026 16:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787243945; cv=none; b=jd7Imn8TPftp5PXitiA1+r6NnUggHYL/ltDPpAQ43tTAf1o7qTpG6xFMHc8C3SEyIXxLFvUW7PJh3ROfDT6p+Wml5UafRzDhrtCYfam+GqVlXiW0RrpUh9Jq2pNW3S8H6HFfOQ9iGH8h1AvznKkl0WMOogj4GoL1BAhcbdoeNYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787243945; c=relaxed/simple;
	bh=jKcxoKbIsQ7QDT2hCb635XJSw2JDoUeo20a5dXMuax8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KQjnqGICgSvlHuvyN0JZIjgmsxs4qfXbAUgyeSFN1cWnRXPx+ubqMh1QI7sFGGqW2fUtTw4qY3z9WOYByQb4B6kLbHBBr0Qr2Yezj9R/yZq+wmTdEptl2cH0fc8Koh7RiHhHXn77R2WeBZsy/qnfq5jiJ0GfYjZAaYWwDO7/Nkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NqTiRM6q; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NqTiRM6q"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2caea3f742bso1622455ad.0
        for <linux-doc@vger.kernel.org>; Thu, 20 Aug 2026 09:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787243944; x=1787848744; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fDmRvt2Dh399KldFX1CZaOl2WYAoa2VBzfFsCwhkX3k=;
        b=NqTiRM6qlROFxlkUSPd4e037YWJ+ZMZGp5na/KJ6atJRD1m4fbVbBLkrQu8MlBoKJc
         A2zct+mOh3zjtN7gGnXx5RJYHrL1EUQgdy0KEAuvou8Suh9WIieuLE31CgtQUQJDCxjM
         C6iZ7IRcB2mCjhD0BFbDx+HVJl0Gq9sEDPbHNbZoEyz6XGHXOhJqC0940FM1Wh7Cc00Q
         R5VD/jeMBr1bCzF6tP3CzCwFtl2mA8NLkcGfFQ8WhwzNFwe1IJYswHY1GgxWJcfOY0+8
         cvmueXj+y2rauEF2GIADG/lWpszLxAN/lBcdV7vrdA0TQCK4C5WYilnEPBz4b1FnB6fH
         h05Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787243944; x=1787848744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fDmRvt2Dh399KldFX1CZaOl2WYAoa2VBzfFsCwhkX3k=;
        b=ThRyuq2yEAYsebewINZrCZwbGtMQO70wBnHGghQV0/sNrN4JQOVWT4LGzC19GM1RIq
         mu8202nFKP4GcDPAwHWJ+v6CT3fAuEqnLkYDirLptw5FPRJnHQJd0rnIv874SGjnZh67
         JppKQPgF0E7DSbjH5L6CYXuHamwJ2K75lvqomkS/GGb035f+tEYeIHfE1xYIymGoqeaF
         n7PuEwHVgN21tSeys78/U5CQu1NdiflHxCscrYNHYXscRDObCuSyrkdAkS8lAZ3iTFEi
         kiBkBJYokrRrfuMRJFj9lY6h+z1iDhqmm8+sXMHUxH9u26WwgkOUwVwSeIBz1TnIWIDq
         yrsw==
X-Forwarded-Encrypted: i=1; AHgh+RolfoUaTRkRd48uck4wbgKeE+Tr++YhhrLhcJw0L1potMZ5jgI+BbAAGPJk+mQ4V3YHpAhLK5hEbnQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kZsvGifOR1DNIZ0UOTLgmjga7sGLx2nJtJE2w1vcwN8YSbLC/i
	pmvrkbsBywNQrEQUB/nBOo/leC3bz/azAokEOCTd13zLrbqjS1HnOMlmbAFujGIu
X-Gm-Gg: AR+sD12AO/QbVvGwd1msKUxI+jFJEW35YA4FICYCTmhYDmHZV7PDww2C5lSvlDUfgvl
	0QAhqX4ytAFA4bEHPzCrnhg7YgryJkfu9nmEBH8CNUeQhNerpb6+BDgsn9icxflEij8yptZjTMo
	79do9NwQcBzJiGDFuVGezHj3hiUmPXqzm2MOfZmBE8XCnpTGSp4P+6QdkYk8kLByRb3qwSVRPMN
	gV00rPx0xgbeueDE5LvtPyZv6+4PGBYQzM4PSDax6vzu7eUcRcpdTv7vLL4/80VSjZl4RzQ4iAl
	UPYE3CB98tGQfLS5p3oqS6ufF5dWscEIn9vSjxxNaHxu46vzLMu4QfoZdlYjtcGxzXP+Zo+zOu9
	+hGTFUErjdWaSifr/WMLT+zaiaqHFH21ukjYQOpi6eoQlhicNQrl0xszKnNRp/2ZKDeQwILexqS
	piqVYg27VUFuWVQkKPlEfjod6zCCWpkwIyn5jZCJLYcyUqKKOFAXpAkaG2puILwU0x0V8in+3Aq
	A==
X-Received: by 2002:a17:903:1a86:b0:2d1:1f73:3667 with SMTP id d9443c01a7336-2d5fd65fe83mr292672675ad.1.1787243943674;
        Thu, 20 Aug 2026 09:39:03 -0700 (PDT)
Received: from localhost ([220.196.228.78])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d62ec88bb8sm9500305ad.83.2026.08.20.09.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 09:39:03 -0700 (PDT)
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
Subject: [PATCH v6] docs: real-time: mention the hrtimer sleeper HARD path
Date: Fri, 21 Aug 2026 00:38:58 +0800
Message-ID: <20260820163858.27984-1-haohlliang@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260820144655.22492-1-haohlliang@gmail.com>
References: <20260820144655.22492-1-haohlliang@gmail.com>
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
v5 -> v6:
- clarify soft delivery for non-RT sleepers (softirq context, not
  HRTIMER_MODE_SOFT)

 Documentation/core-api/real-time/differences.rst | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/core-api/real-time/differences.rst b/Documentation/core-api/real-time/differences.rst
index a129570dab5a..6f5be9f0da2e 100644
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
+without a real-time priority is handled in soft interrupt context, but for
+real-time priorities HRTIMER_MODE_HARD is used. This ensures that real-time
+tasks are woken up as soon as possible while ordinary tasks cannot block the
+CPU with a thundering herd of wakeups.
+
 Memory allocation
 -----------------
 
-- 
2.50.1 (Apple Git-155)

