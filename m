Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FBCA358D36
	for <linux-doc@vger.kernel.org>; Thu, 20 Nov 2025 15:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763651529; cv=none; b=PXkJEw6UxP3UJhmVKPVDXHYij0NGiKy0hhPijqi1yrgRI2lGRnXR2vEQx8HpvA4m1aM+iPAqezpd9N8XBlvaNtIy9CAjp1mGFxozrMDstJslrIy3UqlMAHulVvlb7cBFM8zkZjdN/QZMc8acisogD0Hc6idi+woVRE2uaAYyyyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763651529; c=relaxed/simple;
	bh=EwfXd6yRg4bFKtUUrXe0W+ENNOKQmqy6Ot7CBhxbXoQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=p/T/1mXVA5+A4F5j6u21Apx8bVOiy4mvxAJ6LqMke2Kcih3/1A8HhBY2AYQLfDwnqu73T3bSEifNVMli5vttn8k7OMcrNdZn9yiZchS8fDSx/MY8KKADHuufWMQBXZDJ5So6HJ+sZmM8kCVJrheheywjrQSUQZ7pDv230+wAMZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IKXituHo; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IKXituHo"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-42b3339cab7so681049f8f.0
        for <linux-doc@vger.kernel.org>; Thu, 20 Nov 2025 07:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763651519; x=1764256319; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=sW5aRQBUT1YS/p7X2M8vu94/jdaGEDQWZc189ONsN2k=;
        b=IKXituHozgqyNbK+KjWaX/Tinx4O4O7aSbR/oHa+EADAVCu7lFCnYiYi4skqxGbSI/
         0Se2VAMJYPj6gD6b97R973H+fypzOH45mJ2cCecZDl5dUn6HpwkGx/7TnPvi93/GCzhY
         +b/19F2kxunBpKtEndwE10N025eEMk9m+Y2ssUWIXNQJW8wU94V7FaU9Ldyk8Xtowyzc
         bbGl5+AsNqjtHXCanoG2VnG+W+Rp/1+/5Ep3/5klAnN7S9Up2jlQwACuAIfRhOXHV4Az
         dmdKE2RKGh98OcCt1Qi568IYsfXtfJCd8Ha88THG012a1Dc4ULxPwAMSAcOESbYFZLTI
         eGOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763651519; x=1764256319;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sW5aRQBUT1YS/p7X2M8vu94/jdaGEDQWZc189ONsN2k=;
        b=lb1vK58YfaEbIGJdvgt6GPsoCi5CQXdSTKedgB5YyeN8Sld++wvhUj1Fp+rqxLdp+t
         JVL17kBov8meZUKZaEZm8STcPXcJJTYD4IBRKcRxnqGtDQJwa9lqmdFfS0ZkA8Yt8Rxa
         aCyUQmTu0jPHMZY243M6m0EA+8eV3B4trs1kakxxZ57kCWw8zcc68GNI26W+v9+ZpJvP
         Oj255ZVth1sWdNr/n/EkpTBiQ2J4EOb2KXZ+sXCrEhulug3t7KdzeorXinRufa9B4793
         oTi7BLyrZSEPN+u5/EenEYz0rD9NdiTBKWv76Jit668h4HlcvMdoj4Jc2y1i6rWMfUfH
         ex2A==
X-Forwarded-Encrypted: i=1; AJvYcCXbg2sefsgkPDc0DtDz9RPjByrOJxqG6rZBY5m0bFqJV+MdcQYP8CqRtEBZkdWj6/DXgHvcNRViyUg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHq4BRpnY661xe2EoJZB3ebW9a/0cq9z/UcB3hDaTq1l2/2iip
	sziYcSFUaYF4GbzLTaKPf5+Ce7XvLEY1rlakPOtw71fYo8W8MdBvVvyhFzairXHFGcGfJTMdGbf
	PQA==
X-Google-Smtp-Source: AGHT+IER1f7gc9WQ7LnpbrPIA/y0BLZGbO4bUsdn+Ne1pOxE592x9Yu2PvTpMRh0Noc8+8JrQHGkxnvByA==
X-Received: from wrsz10.prod.google.com ([2002:a5d:4c8a:0:b0:42b:3a01:7808])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:adf:f290:0:b0:42b:3e0a:64b7
 with SMTP id ffacd0b85a97d-42cb9a560c2mr2413997f8f.53.1763651508025; Thu, 20
 Nov 2025 07:11:48 -0800 (PST)
Date: Thu, 20 Nov 2025 16:09:32 +0100
In-Reply-To: <20251120151033.3840508-7-elver@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251120145835.3833031-2-elver@google.com> <20251120151033.3840508-7-elver@google.com>
X-Mailer: git-send-email 2.52.0.rc1.455.g30608eb744-goog
Message-ID: <20251120151033.3840508-8-elver@google.com>
Subject: [PATCH v4 07/35] lockdep: Annotate lockdep assertions for context analysis
From: Marco Elver <elver@google.com>
To: elver@google.com, Peter Zijlstra <peterz@infradead.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Ingo Molnar <mingo@kernel.org>, Will Deacon <will@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, 
	Chris Li <sparse@chrisli.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Alexander Potapenko <glider@google.com>, Arnd Bergmann <arnd@arndb.de>, Bart Van Assche <bvanassche@acm.org>, 
	Christoph Hellwig <hch@lst.de>, Dmitry Vyukov <dvyukov@google.com>, Eric Dumazet <edumazet@google.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Ian Rogers <irogers@google.com>, 
	Jann Horn <jannh@google.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Johannes Berg <johannes.berg@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
	Josh Triplett <josh@joshtriplett.org>, Justin Stitt <justinstitt@google.com>, 
	Kees Cook <kees@kernel.org>, Kentaro Takeda <takedakn@nttdata.co.jp>, 
	Lukas Bulwahn <lukas.bulwahn@gmail.com>, Mark Rutland <mark.rutland@arm.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>, Thomas Gleixner <tglx@linutronix.de>, 
	Thomas Graf <tgraf@suug.ch>, Uladzislau Rezki <urezki@gmail.com>, Waiman Long <longman@redhat.com>, 
	kasan-dev@googlegroups.com, linux-crypto@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, linux-sparse@vger.kernel.org, 
	linux-wireless@vger.kernel.org, llvm@lists.linux.dev, rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Clang's context analysis can be made aware of functions that assert that
locks are held.

Presence of these annotations causes the analysis to assume the context
guard is held after calls to the annotated function, and avoid false
positives with complex control-flow; for example, where not all
control-flow paths in a function require a held lock, and therefore
marking the function with __must_hold(..) is inappropriate.

Signed-off-by: Marco Elver <elver@google.com>
---
v4:
* Rename capability -> context analysis.

v3:
* __assert -> __assume rename
---
 include/linux/lockdep.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/linux/lockdep.h b/include/linux/lockdep.h
index 67964dc4db95..2c99a6823161 100644
--- a/include/linux/lockdep.h
+++ b/include/linux/lockdep.h
@@ -282,16 +282,16 @@ extern void lock_unpin_lock(struct lockdep_map *lock, struct pin_cookie);
 	do { WARN_ON_ONCE(debug_locks && !(cond)); } while (0)
 
 #define lockdep_assert_held(l)		\
-	lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
+	do { lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD); __assume_ctx_guard(l); } while (0)
 
 #define lockdep_assert_not_held(l)	\
 	lockdep_assert(lockdep_is_held(l) != LOCK_STATE_HELD)
 
 #define lockdep_assert_held_write(l)	\
-	lockdep_assert(lockdep_is_held_type(l, 0))
+	do { lockdep_assert(lockdep_is_held_type(l, 0)); __assume_ctx_guard(l); } while (0)
 
 #define lockdep_assert_held_read(l)	\
-	lockdep_assert(lockdep_is_held_type(l, 1))
+	do { lockdep_assert(lockdep_is_held_type(l, 1)); __assume_shared_ctx_guard(l); } while (0)
 
 #define lockdep_assert_held_once(l)		\
 	lockdep_assert_once(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
@@ -389,10 +389,10 @@ extern int lockdep_is_held(const void *);
 #define lockdep_assert(c)			do { } while (0)
 #define lockdep_assert_once(c)			do { } while (0)
 
-#define lockdep_assert_held(l)			do { (void)(l); } while (0)
+#define lockdep_assert_held(l)			__assume_ctx_guard(l)
 #define lockdep_assert_not_held(l)		do { (void)(l); } while (0)
-#define lockdep_assert_held_write(l)		do { (void)(l); } while (0)
-#define lockdep_assert_held_read(l)		do { (void)(l); } while (0)
+#define lockdep_assert_held_write(l)		__assume_ctx_guard(l)
+#define lockdep_assert_held_read(l)		__assume_shared_ctx_guard(l)
 #define lockdep_assert_held_once(l)		do { (void)(l); } while (0)
 #define lockdep_assert_none_held_once()	do { } while (0)
 
-- 
2.52.0.rc1.455.g30608eb744-goog

