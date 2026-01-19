Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8065E3559E8
	for <linux-doc@vger.kernel.org>; Mon, 19 Jan 2026 09:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768815649; cv=none; b=EgMPG5fElszI518lL37JYICEobaUKKv/VNCR3I8DFPQTbVhNkXxyDxDSYyg8XCuAX/HPZlTNUHHbMRpC+t/v7LBVukm89cloX5eaqAL/pvERneJfWB2JfsyzUR1Af1AerKp3zpuJT69sY/TxR3lkNboAWOqEFTSkKr0NRcCYTV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768815649; c=relaxed/simple;
	bh=LFRNb1gEQo9FV1jLi6+eyd+fRn/YHv3OptpdwWFbVxE=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=tEPSC3xtbpwCFoN0/ShZMwTQfF1vEBVRq5Cz9IheDySf9J3CfxSP2dXMr2maeHpqPAHkPgDdQxEDYXY+uHQWsWmnbgTkd+lDylZAxdra8e5zYTbYrxKRJvPGfQzfoXtVE9oaDSLInRp3K7rEX3MPKaWFLSJZTpW6OIUgVxmXrGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=37uQbcQ1; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="37uQbcQ1"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-432db1a9589so2600159f8f.0
        for <linux-doc@vger.kernel.org>; Mon, 19 Jan 2026 01:40:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768815646; x=1769420446; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Tir03/0eTjGqYap+VXkH/YQyday94uYso0Z0/c7DdeU=;
        b=37uQbcQ1CKqDDkAdb1lkP+I8pU0UDUltDhqfAVpP5SPDcQYJlViZ3k3dBVEq0WO12m
         cIQccXy65LtV3IQv6H2M1jM4r7qEmkHAgILU6jRxF63kky97kNdQvKiE44GmhP27jDpp
         mg5IPaWxJXg92hXihjlaEAo8Qw6TGqtc8JdJ7B9zk6nXT4dS9isbTmf2IzKi0P6Em1UJ
         cwuT6tb5G0EslSIjR9kl6/E8R3TvBamDcsup8v/Xbqlm6ntQhsM0hI7cJiG2zwppXp1x
         lPQaGz1ZK0Q1/17NzOKTPoJhh8MZSRzU+xrLLg2G8MGBcIboKCU67EwBDWVmM1cNsRUD
         m9oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768815646; x=1769420446;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Tir03/0eTjGqYap+VXkH/YQyday94uYso0Z0/c7DdeU=;
        b=t08J7GLkS2wa1BfvjW/VUF9VvDohNDbGrPmpUfWN24DlAav9zfUJ/ZKrGSuWgETVYY
         4/7THpp9iNVL56+1L2VAjIwcs5eRJbadBB95V25DFjcT3ZbsFbV1LIahK1cQI0zumXxL
         D92rBsNDM+2pvfYUP+J0+7z8PAZPJjtb4wm1VYiQQENRfFf/1FPh0KGeOMSnpuwSARF3
         9tCjU5CHiwQSnqulkrt0wuTqzHRPtmDdXUASUy/hREkkJSROiK3EcF3eMfZCfNSmmUXJ
         AFz4t0bo6/lSRdXF9Ib6ddmNo5U09tsLUxjyRkPG+0B1Orv6MI3sRtWTRzfHLyKxrDoV
         gP8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVFflX1Ex1aijiwIrRAmSnByqsxEbQNbOyBzLc5MX3whzWdUV14NXwHnN93lxkupKR49PFN/YrO9F8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCEWNP/dLKDSq0YwooT1DEwXo22ohAntpNTlN3gxVGs1d95rgV
	JQ+yEEPTMiLjDZflgCia/8M3TSzKS0L/aDJZYaUwGRw0Lc6Jm/gyThhEKx9nSTr2LJQOyJ4uDmR
	AWw==
X-Received: from wmbil25.prod.google.com ([2002:a05:600c:a599:b0:46e:1e57:dbd6])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:358e:b0:470:fe3c:a3b7
 with SMTP id 5b1f17b1804b1-4801e2f3083mr136239335e9.5.1768815645684; Mon, 19
 Jan 2026 01:40:45 -0800 (PST)
Date: Mon, 19 Jan 2026 10:05:50 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260119094029.1344361-1-elver@google.com>
Subject: [PATCH tip/locking/core 0/6] compiler-context-analysis: Scoped init guards
From: Marco Elver <elver@google.com>
To: elver@google.com, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>, 
	Christoph Hellwig <hch@lst.de>, Steven Rostedt <rostedt@goodmis.org>, Bart Van Assche <bvanassche@acm.org>, 
	kasan-dev@googlegroups.com, llvm@lists.linux.dev, 
	linux-crypto@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Current context analysis treats lock_init() as implicitly "holding" the
lock to allow initializing guarded members. This causes false-positive
"double lock" reports if the lock is acquired immediately after
initialization in the same scope; for example:

	mutex_init(&d->mtx);
	/* ... counter is guarded by mtx ... */
	d->counter = 0;  /* ok, but mtx is now "held" */
	...
	mutex_lock(&d->mtx); /* warning: acquiring mutex already held */

This series proposes a solution to this by introducing scoped init
guards which Peter suggested, using the guard(type_init)(&lock) or
scoped_guard(type_init, ..) interface. This explicitly marks init scope
where we can initialize guarded members. With that we can revert the
"implicitly hold" after init annotations, which allows use after
initialization scope as follows:

	scoped_guard(mutex_init, &d->mtx) {
		d->counter = 0;
	}
	...
	mutex_lock(&d->mtx); /* ok */

Note: Scoped guarded initialization remains optional, and normal
initialization can still be used if no guarded members are being
initialized. Another alternative is to just disable context analysis to
initialize guarded members with `context_unsafe(var = init)` or adding
the `__context_unsafe(init)` function attribute (the latter not being
recommended for non-trivial functions due to lack of any checking):

	mutex_init(&d->mtx);
	context_unsafe(d->counter = 0);  /* ok */
	...
	mutex_lock(&d->mtx);

This series is an alternative to the approach in [1]:

   * Scoped init guards (this series): Sound interface, requires use of
     guard(type_init)(&lock) or scoped_guard(type_init, ..) for guarded
     member initialization.

   * Reentrant init [1]: Less intrusive, type_init() just works, and
     also allows guarded member initialization with later lock use in
     the same function. But unsound, and e.g. misses double-lock bugs
     immediately after init, trading false positives for false negatives.

[1] https://lore.kernel.org/all/20260115005231.1211866-1-elver@google.com/

Marco Elver (6):
  cleanup: Make __DEFINE_LOCK_GUARD handle commas in initializers
  compiler-context-analysis: Introduce scoped init guards
  kcov: Use scoped init guard
  crypto: Use scoped init guard
  tomoyo: Use scoped init guard
  compiler-context-analysis: Remove __assume_ctx_lock from initializers

 Documentation/dev-tools/context-analysis.rst | 30 ++++++++++++++++++--
 crypto/crypto_engine.c                       |  2 +-
 crypto/drbg.c                                |  2 +-
 include/linux/cleanup.h                      |  8 +++---
 include/linux/compiler-context-analysis.h    |  9 ++----
 include/linux/local_lock.h                   |  8 ++++++
 include/linux/local_lock_internal.h          |  4 +--
 include/linux/mutex.h                        |  4 ++-
 include/linux/rwlock.h                       |  3 +-
 include/linux/rwlock_rt.h                    |  1 -
 include/linux/rwsem.h                        |  6 ++--
 include/linux/seqlock.h                      |  6 +++-
 include/linux/spinlock.h                     | 17 ++++++++---
 include/linux/spinlock_rt.h                  |  1 -
 include/linux/ww_mutex.h                     |  1 -
 kernel/kcov.c                                |  2 +-
 lib/test_context-analysis.c                  | 22 ++++++--------
 security/tomoyo/common.c                     |  2 +-
 18 files changed, 80 insertions(+), 48 deletions(-)

-- 
2.52.0.457.g6b5491de43-goog

