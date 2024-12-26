Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F362582D66
	for <linux-doc@vger.kernel.org>; Thu, 26 Dec 2024 17:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735232835; cv=none; b=hpc2iGurkfMD67xyd9s4zbMZeHfeuhgQLIEVHmIgygQ8EfB6JxBSSKWza2GTM4e1nNTgd5OjmUJW+7POzLRgl2cpz7Bsu6VhfOVRgSH19SeHmLUQpihXUK5Ti4/tWwZFUUEKUNbya6UcnYCdqVlc27Yi8i8UsEy8BeGYadJZPb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735232835; c=relaxed/simple;
	bh=AoReHOQMV8B1tv/96Lahr0/4fxnfswyzXe9675SQ5w4=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=e3AbYcMjCMGLGxeTKPzCnbv3Pqp9SFwbysd9HRK5T6KNtKnL4PVDkqSacU1ekoj9rf4t86lyPyWF0i63HKBxlNXSw83DGVmx+GGK5lqgbGFgbR6oTRF0ExPqXWkFTQvJKUsrL7HZG8xBHOI9whPgLpckuws/N05hFxLn+V2Di8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KqBsTyjV; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KqBsTyjV"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2166a1a5cc4so77350405ad.3
        for <linux-doc@vger.kernel.org>; Thu, 26 Dec 2024 09:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1735232833; x=1735837633; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ODP42SKDHXV3hxOWWJxtaKBxGzn2PPEC/z3NvFn3uUE=;
        b=KqBsTyjVAl6uskCVUUlc1WmKE5lcv9vy3ZW49xCO7vDuM6O1xuhzGsMsfyO85lGH8T
         J0imkzX/cdxHv8BEA1JJtjE0ovii0MUWaIKpypQLYur0emPS1CozyKlRIPcz7mvgAjgk
         oINlvD5+dHaW+L22FErvrTyWz4SJ6XLlboyimV+pYuiNxbi5bnPQH/vy4dHhK4MXRWIC
         wMF1motZE/epa13ZWh+sEa6cgWO3EnIvfmDgntR4q9MBL0XewwprLy2HpY8F5NUH0sAg
         KajKrG3OxT4bfbfVexjt9jdER0cgkNQ5nLYtk2FOUIEzWd8ICrjeeBELXcrwaBL24xY8
         lsRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735232833; x=1735837633;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ODP42SKDHXV3hxOWWJxtaKBxGzn2PPEC/z3NvFn3uUE=;
        b=McjyMYZY1HBlJz6A/PHFVJGBjEJ+Yc66sMLbrjB52NSZRFsgq/KUMM+u2vqstlhlqa
         ExHMnCYUYtkhzwwiO9Dd99FWD4DhHdADoZgn2cwQ2dYASMX4xrrV1/35QWooN1GlGPe7
         WS8lb/WJPr7/k9KENrUAfkrjaFiQaCLFvYPuadaa9NstTgjrEr1Ax+1kibqHcbVH+2Dl
         /YdNXbaKjqAaYWQPHm7ROyucofoi/mxCn8gJNd8RSBfigWlrOpeAlN6Ahh4GCvfJw5F8
         d4wvW5MXL/ATI17ezzkYZuIiadyrov27lwtNFSZjrkfql1XhAoTVEp5RZWLhB0P847oo
         lWWQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2yf4T1xAYCmh3CabDgJf61MVR/XNWe43YRK1YZs+ATjipsBcUtaqUvXkEKHctSMWl0BxEyPRNehQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9tBdphQdGdxtXW0TKOX7+clNkhcDV0+1rx4uhZ7h0oKWSelDu
	pHSqcCGJ3r4kspQ+fLNxA8Ice9/LqL7JJAYYn+9AHE2C9JW/FSxmLIEzg7Gl4o7Q4rmdNZx2dnO
	cDw==
X-Google-Smtp-Source: AGHT+IES5fMpd18ac55lXlGTxpVigji00REq0R3j/VnBIPKrZwlOFUxdfKFQVkDuQKi2HlmyiSdRMGJNgUg=
X-Received: from pfwz9.prod.google.com ([2002:a05:6a00:1d89:b0:72a:9fce:4f44])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:2443:b0:1e1:f40d:9783
 with SMTP id adf61e73a8af0-1e5e081f331mr43831486637.40.1735232833310; Thu, 26
 Dec 2024 09:07:13 -0800 (PST)
Date: Thu, 26 Dec 2024 09:06:52 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241226170710.1159679-1-surenb@google.com>
Subject: [PATCH v7 00/17] move per-vma lock into vm_area_struct
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

Changes since v6 [4]
- Fixed vma_start_read_locked() condition in uffd_move_lock(),
per Lokesh Gidra
- Moved more conditions into unlikely() in vma_start_read(),
per Peter
- Renamed VMA_LOCK_LOCKED into VMA_LOCK_OFFSET, removed
VMA_STATE_{A|DE}TACHED, introduced VMA_REF_LIMIT, per Peter
- Made sure no re-attach or re-detach operation is happening, added
assertions to catch such cases, per Peter
- Added a parameter to vma_iter_store{_gfp} to indicate when a new vma is
being added or existing being modified, to avoid re-attaching existing vma
- Refactored patches to implement detached guarantees in the single patch

What I did not include in this patchset:
- Changing of vma locking patterns;
- Changing do_vmi_align_munmap() to avoid reattach_vmas()
This cleanup needs more discussion and can be done independently as this
patchset is already quite large.

Patchset applies over mm-unstable.

[1] https://lore.kernel.org/all/20230227173632.3292573-34-surenb@google.com/
[2] https://lore.kernel.org/all/ZsQyI%2F087V34JoIt@xsang-OptiPlex-9020/
[3] https://lore.kernel.org/all/CAJuCfpEisU8Lfe96AYJDZ+OM4NoPmnw9bP53cT_kbfP_pR+-2g@mail.gmail.com/
[4] https://lore.kernel.org/all/20241216192419.2970941-1-surenb@google.com/

Suren Baghdasaryan (17):
  mm: introduce vma_start_read_locked{_nested} helpers
  mm: move per-vma lock into vm_area_struct
  mm: mark vma as detached until it's added into vma tree
  mm: modify vma_iter_store{_gfp} to indicate if it's storing a new vma
  mm: mark vmas detached upon exit
  mm/nommu: fix the last places where vma is not locked before being
    attached
  types: move struct rcuwait into types.h
  mm: allow vma_start_read_locked/vma_start_read_locked_nested to fail
  mm: move mmap_init_lock() out of the header file
  mm: uninline the main body of vma_start_write()
  refcount: introduce __refcount_{add|inc}_not_zero_limited
  mm: replace vm_lock and detached flag with a reference count
  mm/debug: print vm_refcnt state when dumping the vma
  mm: remove extra vma_numab_state_init() call
  mm: prepare lock_vma_under_rcu() for vma reuse possibility
  mm: make vma cache SLAB_TYPESAFE_BY_RCU
  docs/mm: document latest changes to vm_lock

 Documentation/mm/process_addrs.rst |  44 +++++----
 include/linux/mm.h                 | 152 ++++++++++++++++++++++-------
 include/linux/mm_types.h           |  36 ++++---
 include/linux/mmap_lock.h          |   6 --
 include/linux/rcuwait.h            |  13 +--
 include/linux/refcount.h           |  20 +++-
 include/linux/slab.h               |   6 --
 include/linux/types.h              |  12 +++
 kernel/fork.c                      |  87 +++++------------
 mm/debug.c                         |   4 +-
 mm/init-mm.c                       |   1 +
 mm/memory.c                        |  85 +++++++++++++---
 mm/mmap.c                          |   3 +-
 mm/nommu.c                         |   6 +-
 mm/userfaultfd.c                   |  31 +++---
 mm/vma.c                           |  31 +++---
 mm/vma.h                           |  13 ++-
 tools/testing/vma/linux/atomic.h   |   5 +
 tools/testing/vma/vma_internal.h   |  93 ++++++++----------
 19 files changed, 385 insertions(+), 263 deletions(-)


base-commit: 431614f1580a03c1a653340c55ea76bd12a9403f
-- 
2.47.1.613.gc27f4b7a9f-goog

