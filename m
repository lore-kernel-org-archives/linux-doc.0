Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF00A647
	for <linux-doc@vger.kernel.org>; Wed, 20 Nov 2024 00:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732061313; cv=none; b=Vsk42V2j3I6V63DHLRCsYEyq+DsiKBHyng9XLII833XCHzG4WIEzDx1boznNrjs9FfbyA39ptofcuO2L44Xs7a1sfhpXmxEV8acabFKghxU2WN1YxZ8Eu5uOyVWOdVaJ+5+zmOTmzFoZjL8psFp8O0URVjDZYFr/q9ruqdk8Po8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732061313; c=relaxed/simple;
	bh=gT9+Manddpdas8wL4YAf6mG6SljC5580iOL9QHHp3K8=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=peR44u1Xkpn9DL8lAy9mlmzAa+GC7CjJBaKqbEmgn7hMXPoWUTYpE8Qkls30hqYLcZRHlld91KRLylnHg7CJb6reCsaiFkzc4sl/QG9YP/bAI++VCpk3wh0hfHrjZ7zLEmJw4JR9sQDmRz8USMAhyHtaQz1Y/9PEZEfswIyKccI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KsV3aqlQ; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KsV3aqlQ"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6ee6c2b65b9so30050697b3.0
        for <linux-doc@vger.kernel.org>; Tue, 19 Nov 2024 16:08:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732061311; x=1732666111; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HhkVFKaKFpcTeqNIviXTm8CkZrPqzcwTU1/BoH3xVxg=;
        b=KsV3aqlQGEJ8nYtxNtJG1YFgvAgpW869H6eogtXsX+e5/Tz7Bh4rl0Pl2FxcjXViUk
         YunxG4qL3FI4dgfta9LoUoHAnIbl+7mslcFOQjwuMFLmcFdtO2kHWcJffIQJouqD7ngD
         1/j+O5hVj6yq6a8wD93bqjD+cU/HlHDOGWa6GFHA4ZNS8pk1vb1x64Wmn4lq10sc0eyU
         KvFpF2X9nLzyTaG2Dq7IzNJQ+c9YuosCt1z2wR6o67U4jhM4zM6fr2/uugp8B9ZQy7qf
         L4PYpus2RH6FDy7pi6cVesrdXyfAVrwc3KjPS33uVJbT+LrIR4BJtFZtmzY1FSmv0txz
         Argg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732061311; x=1732666111;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HhkVFKaKFpcTeqNIviXTm8CkZrPqzcwTU1/BoH3xVxg=;
        b=n8FabalkCFhc214+a+Jlr5BJejsasPxO9KHWWiy/BnFJ/0GIlqFLJBCY+Gc8nPvhAD
         vl/wp++0Jjm29MH2MwlU2aT9/SyD4puWZ9Al1hIEL7IwOYLgS6zElFhbppqlmgGPDUrR
         P+G3AiEhKk6Bg0tdW0LYnOicX4RswWxXsqGcDSd5RL2ZVAt7NJl5j1Z8ZiNUAkxAregF
         6HJwR5ykhk1/jQFvV8zRwtHZ/aB1vgCAvH43vNoMFPiekc3wem7NALzl5VJPpr8JXRV5
         PtRb2Hl/hwJuwu5dhBESwEhWZFEybncLolW3w2nyq9sxGK/9TGhio/AslA/zLKjz11kz
         heuw==
X-Forwarded-Encrypted: i=1; AJvYcCVWmTsrdQWq0yAiULEsxJOOol7/82IfySq6EJ63v4ub8i+RyL3Ngcap2oRSTmsdDrMIyBzf+kZqY58=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbbUqL96TVKPAMftgQzDEWw+wQSVnPvQJjwaP1ZzRSZDoeyziR
	m+HgH3T+36aAyqgnlueY7WM8MdpSbBVyxXQdLze7jebYwlZY8P2yjiR3q8O8yZ1kp2xW5rCTS2r
	Ztw==
X-Google-Smtp-Source: AGHT+IFYtV6elF80k+BXreudN05LyJlyHTc3YJNvvK+QdV7SDD9vZ+RL+IezB0evCebjjGetlGWDr+ddLDI=
X-Received: from surenb-desktop.mtv.corp.google.com ([2a00:79e0:2e3f:8:af45:bbc1:fc75:e695])
 (user=surenb job=sendgmr) by 2002:a05:690c:209f:b0:6e2:12e5:356f with SMTP id
 00721157ae682-6eebd2b6dbamr4027b3.3.1732061310472; Tue, 19 Nov 2024 16:08:30
 -0800 (PST)
Date: Tue, 19 Nov 2024 16:08:21 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241120000826.335387-1-surenb@google.com>
Subject: [PATCH v4 0/5] move per-vma lock into vm_area_struct
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Cc: willy@infradead.org, liam.howlett@oracle.com, lorenzo.stoakes@oracle.com, 
	mhocko@suse.com, vbabka@suse.cz, hannes@cmpxchg.org, mjguzik@gmail.com, 
	oliver.sang@intel.com, mgorman@techsingularity.net, david@redhat.com, 
	peterx@redhat.com, oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org, 
	brauner@kernel.org, dhowells@redhat.com, hdanton@sina.com, hughd@google.com, 
	minchan@google.com, jannh@google.com, shakeel.butt@linux.dev, 
	souravpanda@google.com, pasha.tatashin@soleen.com, corbet@lwn.net, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	kernel-team@android.com, surenb@google.com
Content-Type: text/plain; charset="UTF-8"

Back when per-vma locks were introduces, vm_lock was moved out of
vm_area_struct in [1] because of the performance regression caused by
false cacheline sharing. Recent investigation [2] revealed that the
regressions is limited to a rather old Broadwell microarchitecture and
even there it can be mitigated by disabling adjacent cacheline
prefetching, see [3].
Splitting single logical structure into multiple ones leads to more
complicated management, extra pointer dereferences and overall less
maintainable code. When that split-away part is a lock, it complicates
things even further. With no performance benefits, there are no reasons
for this split. Merging the vm_lock back into vm_area_struct also allows
vm_area_struct to use SLAB_TYPESAFE_BY_RCU later in this patchset.
This patchset:
1. moves vm_lock back into vm_area_struct, aligning it at the cacheline
boundary and changing the cache to be cacheline-aligned to minimize
cacheline sharing;
2. changes vm_area_struct initialization to mark new vma as detached until
it is inserted into vma tree;
3. changes vm_area_struct cache to SLAB_TYPESAFE_BY_RCU to allow for their
reuse and to minimize call_rcu() calls.
Pagefault microbenchmarks do not show noticeable performance change.

Changes since v3 [4]
- Added SOBs, per Lorenzo Stoakes and Davidlohr Bueso;
- Replaced vma write-locking in vma_mark_attached() with memory barriers to
order accesses to vma->detached vs vm_mm/vm_start/vm_end

Patch applies over mm-unstable

[1] https://lore.kernel.org/all/20230227173632.3292573-34-surenb@google.com/
[2] https://lore.kernel.org/all/ZsQyI%2F087V34JoIt@xsang-OptiPlex-9020/
[3] https://lore.kernel.org/all/CAJuCfpEisU8Lfe96AYJDZ+OM4NoPmnw9bP53cT_kbfP_pR+-2g@mail.gmail.com/
[4] https://lore.kernel.org/all/20241117080931.600731-1-surenb@google.com/

Suren Baghdasaryan (5):
  mm: introduce vma_start_read_locked{_nested} helpers
  mm: move per-vma lock into vm_area_struct
  mm: mark vma as detached until it's added into vma tree
  mm: make vma cache SLAB_TYPESAFE_BY_RCU
  docs/mm: document latest changes to vm_lock

 Documentation/mm/process_addrs.rst |  10 ++-
 include/linux/mm.h                 | 129 ++++++++++++++++++++++++-----
 include/linux/mm_types.h           |  19 ++---
 kernel/fork.c                      |  88 +++++++-------------
 mm/memory.c                        |  17 ++--
 mm/userfaultfd.c                   |  22 ++---
 mm/vma.c                           |   8 +-
 mm/vma.h                           |   2 +
 tools/testing/vma/vma_internal.h   |  55 +++++-------
 9 files changed, 198 insertions(+), 152 deletions(-)


base-commit: 5a7056135bb69da2ce0a42eb8c07968c1331777b
-- 
2.47.0.338.g60cca15819-goog

