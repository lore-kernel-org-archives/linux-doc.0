Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19E1365A19
	for <linux-doc@vger.kernel.org>; Mon,  5 Oct 2026 07:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791183996; cv=none; b=Q4f3KrjahTSjx2khA+9cJPkcJrWNVQXhsqg21Gbv91uXEbwx7VycNQ7gfQTAjniYpoE/XIHKGa+lcTLTvCTkLEwwgDsxTbdyNM/Hpio5XgCGL+ZYWjxxOmOnEQUnzLdNUZoQ8hAjp3racl4GKpYkZpGIH8dZrx3lmkYwrwYV5Qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791183996; c=relaxed/simple;
	bh=05kHoko/nqMI072En1PJNukfGt9/4zUx6GVdib+NbNo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ePNYejCSro2sQNcXbL1+Ie02EVBZl3T/WXzVkg8Ew9tXcNO5zO1XX+qpHqWU3x4XptZds1IjxwukjZ56bREgzAV3YRxEVTLB9jcfRMXUqszDyHoBHiJeY/TOZIA07zSSj5B6uRYkmHxa9Mriv5Aljf10EczZtA3LOyYaGzqfzs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o9OikwFl; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o9OikwFl"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-4a1742171d5so977125e9.1
        for <linux-doc@vger.kernel.org>; Mon, 05 Oct 2026 00:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791183993; x=1791788793; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+vg5y7TFdC/oAYFLNYNMU7By8Gx4IwKuOI2ehF5mxV8=;
        b=o9OikwFlJm20JBMrFsPyBqtt36XEsmOcUdkVWn6tJW7rgN7ouWHKhhwSMQy6Lk7Q1m
         c7Mre0y/sNHdNeu5+uYMrwH2rpjeMrWhlxT1lUvEC35HcuitDDK6M5WpV7Tat3f1q9x+
         +mV7hGdHU/ZF1zVilNbW2ZTYBok5yk3kVFV6gsNb4HJ6spBmxOKCFtZgNYLwEDVKmmb5
         2APkXVlCx6kY0E5BGdnFnL+pIElnZJC70+RFteRJtmFqtRIPBOd05bj2s1CC0waYqevD
         RLx1LoIngjQySglANuKJS8Aehk3DC8+yL8jS5K5G7ASRplpyegIDKItLr689Lb4FcvCh
         liZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791183993; x=1791788793;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+vg5y7TFdC/oAYFLNYNMU7By8Gx4IwKuOI2ehF5mxV8=;
        b=0Q7GFDlRH+LHLJjKyt3+t9orX181MyiNIENJD32jC8V5PL8CKhVYEH2sREiD+XCUDl
         EVv08A8XVBKCpLd4FkxfX4NotqMjeAXUyMBq+CTI3Ucb+DuEWpLpLuVU2mp74rtS9Z35
         CgZIHmOMx/5bv9p3/HgW93yl4tiBOONlylVAnOi8VATnScGdo3ba4FOeMztbR3FFvAB1
         hY4bjx6Lv254zY/rAJKtrWzvIjZjC3kuMyCvnQQxwbJDmFLEgJ61xarJF+dxHAJarNur
         XmMd4t1uR1eHgP6V0lo+uni3rf3cI60e5GH4Pzg4Aox2pGFJ4gm+rWzvPzrHiAJDiB4O
         he/A==
X-Forwarded-Encrypted: i=1; AKwUvBxoVWJ16349qefYK0TNGVLWzwl3g7AQ0/4gG6mcFYe1r7Q4WB8yBtkRY99NnufUoCbw4EYXEBOXRhQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kddC0WCexl4gT8XrkiqnbJebzx+KDuSwwoyAiuTglR82NEd3v8
	ffGbd/mQabDzi1Ak07zGhX9cDGh6wmtow0jqhQDB5fvtAtXtzkJDFPIv
X-Gm-Gg: AYBFou2aAs0dYZ2UU6oif5GUCHKTyQf0SifgwB8zgIybDpQIWigNVKa9QMjccaTwQfN
	/fKt5yIwt0cq37WOshrx6+3zGpXMvTxDcsOIDH5povVIb27GJz3EEbhaclaE58iaS+4eH5Di8tW
	T24/DofZATK08tM9ytf0HySVA4vJWJIYULLa4ZrUXbdZNxCpCJ8l88YTv9BJRigtEw2i3pZSbQl
	5TWcARVBy4nc6EB65RH0HsP34Eih0zzJmfN4KlvD1DlqG3rFMNqQnbRmGYI9khmKhW7WG2oEyGS
	m1Oh1O+jsaLqc9xUrN0BHTxJvTfIws1EDa/HmFMzDYPr7jIo71Fyq3rXqMLezHYFZg6C2KW6/7y
	06FvFi0L5DbU0z6ChcRTqyCLT1v+5kCM23ynEuSHxVyDV5NzbW1SZrRbkZXsyZo2MvKmUoxUQLS
	t2qqcTRIF642Z1Q6/fewRNmWHBYZJ9ojbcNo8a1nvFC/M7Xoj2osilPUYxmGsXnxfgpuwRgA3IH
	UHcLPedXOCzbrjLutPGZjL0ZnvYvxYASOx2eVrDwxV+vy1j+9Oe6R2wQ7JkXy3Z+vkez1mJJWDd
	VptmuDv1xYs5TMyeMWQRdjtvlmNdkhBnbXBfjOxWgzq5CdTt6rWqVBjd1juvH+sYogAfyvLULX2
	oiQ==
X-Received: by 2002:a05:600c:c4a6:b0:4a0:25e9:bc47 with SMTP id 5b1f17b1804b1-4a02759a443mr172676745e9.19.1791183992976;
        Mon, 05 Oct 2026 00:06:32 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b305-2001-39fa-3d24-821a-4eae.310.pool.telefonica.de. [2a02:3100:b305:2001:39fa:3d24:821a:4eae])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a16bcb9a21sm283461465e9.10.2026.10.05.00.06.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 05 Oct 2026 00:06:32 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Harry Yoo <harry@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	David Hildenbrand <david@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	David Stevens <stevensd@google.com>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Shuah Khan <shuah@kernel.org>,
	Amery Hung <ameryhung@gmail.com>,
	Swaraj Gaikwad <swarajgaikwad1925@gmail.com>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-mm@kvack.org,
	linux-rt-devel@lists.linux.dev,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	cgroups@vger.kernel.org
Subject: [RFC PATCH v2 0/3] locking, mm: Add atomic allocator trylocks on RT
Date: Mon,  5 Oct 2026 09:06:22 +0200
Message-Id: <20261005070625.8871-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On PREEMPT_RT, a BPF task-storage program attached to sched_waking
can deadlock when kmalloc_nolock() obtains an rtmutex-backed allocator
spinlock while try_to_wake_up() holds p->pi_lock. Releasing the allocator
lock can enter priority-inheritance or wakeup code and re-enter scheduler
locking.

The first RFC [1] rejected every non-preemptible caller. That prevents the
deadlock, but it also rejects BPF arena allocation and faults under the
arena's ordinary raw lock.

This RFC instead adds an atomic owner state for bounded PREEMPT_RT spinlock
trylocks. Atomic acquisition succeeds only from the completely free state.
A regular waiter sets HAS_WAITERS before waiting, which prevents a later
atomic owner from barging. Atomic release preserves HAS_WAITERS and does
not enter priority inheritance or wake a task. Preemption and local
interrupts remain disabled for the atomic-owner section.

The design tradeoff is that a regular waiter cannot boost an atomic owner
and spins with interrupts disabled until the bounded allocator section
finishes. I would value locking review of whether that owner state and
handoff are acceptable, or whether the no-lock allocator should instead
fail in these contexts.

Patch 2 uses the new operation for global SLUB and page-allocator locks. It
avoids regular per-CPU RT local-lock slow paths and reuses centralized
objcg credit when the per-CPU stock is unavailable. Patch 3 adds a BPF
selftest for task-storage allocation from hrtimer_start while the hrtimer
base raw lock is held.

The series has one prerequisite, recorded by prerequisite-patch-id in this
cover letter:

  mm/page_alloc: skip shuffling and reporting for no-lock frees

That independent fix has been posted as a normal patch [2]. It keeps a
successful no-lock page free out of allocator shuffling and page-reporting
notification. It is separate because the issue begins with the v6.15
free_pages_nolock() API rather than the v7.0 slab regression addressed by
patch 2.

Patch 2 should also be evaluated with David Stevens's pending memory.high
deferral fix [3]. There is no build dependency, but bypassing the per-CPU
stock can make a no-lock charge reach that pre-existing schedule_work()
hazard more often.

The pre-rebase version of these atomic-owner changes passed four-vCPU
x86-64 PREEMPT_RT QEMU in release and lockdep/debug-rtmutex builds. Tests
completed 5,000 forced waiter handoffs without barging, kept asynchronous
IPIs out of atomic-owner sections and passed the BPF hrtimer workload.

After rebasing onto current mainline and the prerequisite, the affected
locking and MM objects build with PREEMPT_RT and lockdep. I have not
repeated the runtime campaigns for this RFC rebase.

If this direction is accepted, patches 1 and 2 would need joint stable
backports for v7.0 and later.

Changes since the RFC v1:

  - replace the blanket context rejection with an atomic rtmutex owner
  - preserve local IRQ state across a successful atomic trylock
  - cover the global slab, page allocator and memcg-cache paths
  - bound shared objcg credit when the per-CPU stock is skipped
  - add forced-handoff, caller-attribution and BPF hrtimer tests
  - keep the independent no-lock page-free fix as a prerequisite

[1] https://lore.kernel.org/r/20260919171443.90512-1-kmehltretter@gmail.com
[2] https://lore.kernel.org/r/20261005063515.6312-1-kmehltretter@gmail.com
[3] https://lore.kernel.org/r/20260904173145.2028377-1-stevensd@google.com

Karl Mehltretter (3):
  locking/rtmutex: Support atomic PREEMPT_RT spin trylocks
  mm: use atomic RT trylocks for no-lock allocation
  selftests/bpf: exercise task storage from hrtimer_start

 Documentation/locking/rt-mutex.rst            |  40 ++--
 include/linux/rtmutex.h                       |   4 +-
 include/linux/spinlock.h                      |   3 +
 include/linux/spinlock_rt.h                   |  28 ++-
 kernel/locking/rtmutex.c                      | 211 ++++++++++--------
 kernel/locking/spinlock_rt.c                  |  66 +++++-
 mm/internal.h                                 |  27 ++-
 mm/memcontrol.c                               |  90 ++++++--
 mm/page_alloc.c                               |  33 ++-
 mm/slub.c                                     |  36 +--
 .../bpf/prog_tests/task_storage_hrtimer.c     |  50 +++++
 .../bpf/progs/task_storage_hrtimer.c          |  48 ++++
 12 files changed, 479 insertions(+), 157 deletions(-)
 create mode 100644 tools/testing/selftests/bpf/prog_tests/task_storage_hrtimer.c
 create mode 100644 tools/testing/selftests/bpf/progs/task_storage_hrtimer.c


base-commit: e767a4ea70a3992c37ed604157d32f0dfbf9b1e3
prerequisite-patch-id: 33838040c410e5de0aef855a2719a092b561a5c4
-- 
2.53.0

