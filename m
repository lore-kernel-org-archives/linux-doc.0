Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EECDE206F35
	for <linux-doc@vger.kernel.org>; Mon, 16 Dec 2024 19:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734377065; cv=none; b=kXMVzVNoSXqMXVr4XPNfCMNASanznap/ZLhvq3MP6+7G/+S1HpftCldC1gEbOaE7Y/DvmD/a1yHtJnbNe76x39CpwyydVu8ZNG1C7Qkf3mssBjFbIFc64grHgGatJNGutIdtIaaMksnCunyULotTPjkcHsF5KJzGsGSwvuG9zYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734377065; c=relaxed/simple;
	bh=i4Bny9SBcGw3ZAI7XkeBeLxDCh5GAJ0KyJxJ6P++Ano=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=B8fXwYNAER6x3jAcK50gq9587rMRuTOMArZj98Al2PkFFiIsYUwX2zxu1LI9MjVCoEnhDRqusOHxLltCmhVgmH+ELFO6StDwJHZ+DLMjU7rpEg6FeAHTOfm2706B1L+D/xFXz+Wtp26c30AIfZOm/x3xttVqOs4xkpuI4edMfkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4RS3r0mk; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4RS3r0mk"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2f2a9743093so2042123a91.3
        for <linux-doc@vger.kernel.org>; Mon, 16 Dec 2024 11:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734377063; x=1734981863; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LeGomQCdTlzqmvFZ6fy5rq2UtmzZcMIBE5Kh+oHkUdg=;
        b=4RS3r0mk7gobEpS8uUycKEIskaSvvsOFWoKCwBMci3ZpQMd/GRp5z0Qtl1RHBjeTYB
         Ve0utMr+5PvnMF2LnQgAnee7raZM+q8jtE12F6MRXy3sAFZUkraEfQAz8YnsY9w+DYb4
         JvnokzKav9lOUJid9DPXPCvZwyFO6HXSdYlzYGY9tQ3SN/R7M7qJ2XZ5cjZyoaIyy/mL
         cHzTH3evQ2To5XoRz2llmEAja7Ald6lYjS6rJDvOuwro4bBVvol8+rHNkcOj5Al9VMNb
         UAqfkFX+lxG+zT4uL6sUJbus2WG4eo5eQ8ZUvcyJJxqH8gn8BX6J4MPsbk/xmAomp3yF
         JlhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734377063; x=1734981863;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LeGomQCdTlzqmvFZ6fy5rq2UtmzZcMIBE5Kh+oHkUdg=;
        b=ejwEc1GM8VLOqz22R4WTv8OwvKbloAJazlI5DfTatHK5gWJ+hSz7s+CNbZwuKpXoUJ
         OijFuHXdfDO2EZdc/izZe7HG6GHpBKdOn/9JnxRjkp7AIDE0NtGhq3NZ4Qdy0huspD6Y
         LOJRTiFMi2XzewqTKTQPVdZQnmu157hkqufalO2odiveFFvcnPzvsKsWEB8gZ3QGZ8dA
         MfSLY3e5t+d/VUJm9vQGTxxVo/1AY5do93PxDmg+mmFUrngcSJFTw5/mLPzb6+fNuOwi
         kviEfB7uijoqjoNKrA+WVfiuWAjpzagMb64IhX+0fz1vRTzIPCFiSa/u7HPeIEn83JBu
         lNKw==
X-Forwarded-Encrypted: i=1; AJvYcCVtu0aw3ndArpYxN0uAOhM9+C8TBLDfJcrtdBr875IICakF1aOBv9SmhOaw2OtLNvzaSWf8sUa59yY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQFzMlA8uDCO4QvweBHPrZtRneJBtoUVyAMHCtYcxro7lBOs+1
	sVTcO0l0FoAAmbxxT70kJXLcbm/uBqAMDW8QQAiQyeyVRwaFdxWR7Cnhwo+cwv6wUlSAFlSi1m4
	F+A==
X-Google-Smtp-Source: AGHT+IEdDvpLmKrEQvDiFjGzeYKKUg0/T8qcx1CuYCjryvPmhtOLq4Mr6xjJ+BU35VHJ2P4yHAcB9T2GqoI=
X-Received: from pjbsy3.prod.google.com ([2002:a17:90b:2d03:b0:2ef:8d43:14d8])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:ec84:b0:2ee:f80c:6889
 with SMTP id 98e67ed59e1d1-2f290dbce03mr20770436a91.33.1734377063393; Mon, 16
 Dec 2024 11:24:23 -0800 (PST)
Date: Mon, 16 Dec 2024 11:24:03 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241216192419.2970941-1-surenb@google.com>
Subject: [PATCH v6 00/16] move per-vma lock into vm_area_struct
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Cc: peterz@infradead.org, willy@infradead.org, liam.howlett@oracle.com, 
	lorenzo.stoakes@oracle.com, mhocko@suse.com, vbabka@suse.cz, 
	hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com, 
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com, 
	oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org, brauner@kernel.org, 
	dhowells@redhat.com, hdanton@sina.com, hughd@google.com, 
	lokeshgidra@google.com, minchan@google.com, jannh@google.com, 
	shakeel.butt@linux.dev, souravpanda@google.com, pasha.tatashin@soleen.com, 
	klarasmodin@gmail.com, corbet@lwn.net, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@android.com, 
	surenb@google.com
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
3. replaces vm_lock and vma->detached flag with a reference counter;
4. changes vm_area_struct cache to SLAB_TYPESAFE_BY_RCU to allow for their
reuse and to minimize call_rcu() calls.

Pagefault microbenchmarks show performance improvement:
Hmean     faults/cpu-1    507926.5547 (   0.00%)   506519.3692 *  -0.28%*
Hmean     faults/cpu-4    479119.7051 (   0.00%)   481333.6802 *   0.46%*
Hmean     faults/cpu-7    452880.2961 (   0.00%)   455845.6211 *   0.65%*
Hmean     faults/cpu-12   347639.1021 (   0.00%)   352004.2254 *   1.26%*
Hmean     faults/cpu-21   200061.2238 (   0.00%)   229597.0317 *  14.76%*
Hmean     faults/cpu-30   145251.2001 (   0.00%)   164202.5067 *  13.05%*
Hmean     faults/cpu-48   106848.4434 (   0.00%)   120641.5504 *  12.91%*
Hmean     faults/cpu-56    92472.3835 (   0.00%)   103464.7916 *  11.89%*
Hmean     faults/sec-1    507566.1468 (   0.00%)   506139.0811 *  -0.28%*
Hmean     faults/sec-4   1880478.2402 (   0.00%)  1886795.6329 *   0.34%*
Hmean     faults/sec-7   3106394.3438 (   0.00%)  3140550.7485 *   1.10%*
Hmean     faults/sec-12  4061358.4795 (   0.00%)  4112477.0206 *   1.26%*
Hmean     faults/sec-21  3988619.1169 (   0.00%)  4577747.1436 *  14.77%*
Hmean     faults/sec-30  3909839.5449 (   0.00%)  4311052.2787 *  10.26%*
Hmean     faults/sec-48  4761108.4691 (   0.00%)  5283790.5026 *  10.98%*
Hmean     faults/sec-56  4885561.4590 (   0.00%)  5415839.4045 *  10.85%*

Changes since v5 [4]
- Added Reviewed-by, per Vlastimil Babka;
- Added replacement of vm_lock and vma->detached flag with vm_refcnt,
per Peter Zijlstra and Matthew Wilcox
- Marked vmas detached during exit_mmap;
- Ensureed vmas are in detached state before they are freed;
- Changed SLAB_TYPESAFE_BY_RCU patch to not require ctor, leading to a
much simpler code;
- Removed unnecessary patch [5]
- Updated documentation to reflect changes to vm_lock;

Patchset applies over mm-unstable after reverting v5 of this patchset [4]
(currently 687e99a5faa5-905ab222508a)

[1] https://lore.kernel.org/all/20230227173632.3292573-34-surenb@google.com/
[2] https://lore.kernel.org/all/ZsQyI%2F087V34JoIt@xsang-OptiPlex-9020/
[3] https://lore.kernel.org/all/CAJuCfpEisU8Lfe96AYJDZ+OM4NoPmnw9bP53cT_kbfP_pR+-2g@mail.gmail.com/
[4] https://lore.kernel.org/all/20241206225204.4008261-1-surenb@google.com/
[5] https://lore.kernel.org/all/20241206225204.4008261-6-surenb@google.com/

Suren Baghdasaryan (16):
  mm: introduce vma_start_read_locked{_nested} helpers
  mm: move per-vma lock into vm_area_struct
  mm: mark vma as detached until it's added into vma tree
  mm/nommu: fix the last places where vma is not locked before being
    attached
  types: move struct rcuwait into types.h
  mm: allow vma_start_read_locked/vma_start_read_locked_nested to fail
  mm: move mmap_init_lock() out of the header file
  mm: uninline the main body of vma_start_write()
  refcount: introduce __refcount_{add|inc}_not_zero_limited
  mm: replace vm_lock and detached flag with a reference count
  mm: enforce vma to be in detached state before freeing
  mm: remove extra vma_numab_state_init() call
  mm: introduce vma_ensure_detached()
  mm: prepare lock_vma_under_rcu() for vma reuse possibility
  mm: make vma cache SLAB_TYPESAFE_BY_RCU
  docs/mm: document latest changes to vm_lock

 Documentation/mm/process_addrs.rst |  44 ++++----
 include/linux/mm.h                 | 162 +++++++++++++++++++++++------
 include/linux/mm_types.h           |  37 ++++---
 include/linux/mmap_lock.h          |   6 --
 include/linux/rcuwait.h            |  13 +--
 include/linux/refcount.h           |  20 +++-
 include/linux/slab.h               |   6 --
 include/linux/types.h              |  12 +++
 kernel/fork.c                      |  88 ++++------------
 mm/init-mm.c                       |   1 +
 mm/memory.c                        |  75 +++++++++++--
 mm/mmap.c                          |   8 +-
 mm/nommu.c                         |   2 +
 mm/userfaultfd.c                   |  31 +++---
 mm/vma.c                           |  15 ++-
 mm/vma.h                           |   4 +-
 tools/testing/vma/linux/atomic.h   |   5 +
 tools/testing/vma/vma_internal.h   |  96 +++++++++--------
 18 files changed, 378 insertions(+), 247 deletions(-)

-- 
2.47.1.613.gc27f4b7a9f-goog

