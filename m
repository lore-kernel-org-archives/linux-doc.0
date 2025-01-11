Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A81AA14F9D9
	for <linux-doc@vger.kernel.org>; Sat, 11 Jan 2025 04:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736569571; cv=none; b=uYiZZUi/srRdeZlMJw3lVqdtagJpi3u6QoIbTesRoFB/QmMYa4yr6kXQL9f/xy/BGFbakflxIkk/uSWivSVr8m481LsjukZdWWx0PEcl/IXVCuh1deL1nPkdHxnPs9RxJOy/Z5wVhGfeGcPNZaM5U7IqlsBWAYGYN77BVvS6H4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736569571; c=relaxed/simple;
	bh=C5ZD3398Zp5+ncvzyj/UUyzkvcoTTXB9UQFDhQPLrfk=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=q7v+5bs2gPAmpi09mzfX/7sdGfA+aRTrFJSxRBaJE77qa4/pwN5gGl6L7DaQS774uINo9qgauezpvHnsUL403GXKvhM6tDstMdKwk4/ZBvFDu1fhg/J8D3yezce1F0r2qW/Kxn8w3B9uLSL01hXdz0DcmwG3IkENv73FMofCTKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=G/DA+C9/; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="G/DA+C9/"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2efa0eb9dacso4966617a91.1
        for <linux-doc@vger.kernel.org>; Fri, 10 Jan 2025 20:26:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736569568; x=1737174368; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Eu5sbhl2ySOPh1lykrtQeEYkFdZ3PTKUjmg3zzYCqEk=;
        b=G/DA+C9/ScYfgKJmp3idMo270By1KcqwLxJEt5EKhGSr1+5McH9yj0eNADAggagqcS
         G98SmC69b5dvm2WqQtYoTiRczRYxWIl78KoScL2q3HL2BdIlgStTbZCAKkF3wkYdiA2/
         sJPo3rLufZMk3CmPqmyjndL/DIIL3XXqTXCH3jcKHfTxl6wepFC9g4OcB1gbKBVhBZm7
         0wBF0i118MJ8+82Oq0drtHGsh6XwrWsht7XL82D+H0cU1/4/UHyBJJP2NFXHtkBxLKpJ
         rxdMGaxY6fTOL71epxai9PDvXUR+BB4+ZYB7GGL19YcweRvLWpRqTxX9iKYdnC1AN54A
         I8IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736569568; x=1737174368;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Eu5sbhl2ySOPh1lykrtQeEYkFdZ3PTKUjmg3zzYCqEk=;
        b=FNnOLnuZ/gUyUtzQ6VP3rlKowpEnO5mYxsYMnxZiX6N4tuS6K/onDr9uNsL3YAIKQs
         wRaG706dnRz8A68/GEn6k44k2FcYwDtgt3hg6Ty048cwcX0UbZM/AVpwzfwebveGENZt
         TKFk6JtM2XpmZZgtvVRLvUDqVHg1GI0HxK/mAUCQTPzkSCLswUH8EsG17rC4VPN7GfFR
         0NO+zD2iCWiYIFhUOx8lYeErtg4OXgaHx8EhHAoYN16++VjJ9nUEuqcHdLON4+xxhDm2
         y5QPp9u51c1dVIXHEPO0rufebtUFdjWtH9jru1u65bUFrO/sZG9mwjcsr/WUwsoHZPQf
         NGGw==
X-Forwarded-Encrypted: i=1; AJvYcCVr3Cf9QV7fT9mhO+sbQw/+ySYjnnLSBGHMoIX+9lvGXdQM+vbKur7vEDNDq3PI+btbKRdCeVQSiw0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPuedxyxKT+oGj5D9vUqVYoHQah7Us5XOW0C0iiHz7P1+A2/mM
	fGpjF7COzOQgQ9qdPSCWtqnpmvSp5XC827ytqaL1cv9BaoVsXQ3+3p0OyGloAlJI41uyfW62fui
	Qww==
X-Google-Smtp-Source: AGHT+IHCKkNsg7Je2tguAx3Fa2vj4+MV11mRFGblDUn+ozDW/D6XKXXy3Bs9jHU9xB/vfmoUDos+532mwNU=
X-Received: from pgyy67.prod.google.com ([2002:a63:3246:0:b0:801:9268:c344])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:8cc3:b0:1d9:2b51:3ccd
 with SMTP id adf61e73a8af0-1e88cf7ba29mr22017767637.7.1736569568042; Fri, 10
 Jan 2025 20:26:08 -0800 (PST)
Date: Fri, 10 Jan 2025 20:25:47 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250111042604.3230628-1-surenb@google.com>
Subject: [PATCH v9 00/17] reimplement per-vma lock as a refcount
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Cc: peterz@infradead.org, willy@infradead.org, liam.howlett@oracle.com, 
	lorenzo.stoakes@oracle.com, david.laight.linux@gmail.com, mhocko@suse.com, 
	vbabka@suse.cz, hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com, 
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com, 
	oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org, brauner@kernel.org, 
	dhowells@redhat.com, hdanton@sina.com, hughd@google.com, 
	lokeshgidra@google.com, minchan@google.com, jannh@google.com, 
	shakeel.butt@linux.dev, souravpanda@google.com, pasha.tatashin@soleen.com, 
	klarasmodin@gmail.com, richard.weiyang@gmail.com, corbet@lwn.net, 
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
3. replaces vm_lock and vma->detached flag with a reference counter;
4. regroups vm_area_struct members to fit them into 3 cachelines;
5. changes vm_area_struct cache to SLAB_TYPESAFE_BY_RCU to allow for their
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

Changes since v8 [4]:
- Change subject for the cover letter, per Vlastimil Babka
- Added Reviewed-by and Acked-by, per Vlastimil Babka
- Added static check for no-limit case in __refcount_add_not_zero_limited,
per David Laight
- Fixed vma_refcount_put() to call rwsem_release() unconditionally,
per Hillf Danton and Vlastimil Babka
- Use a copy of vma->vm_mm in vma_refcount_put() in case vma is freed from
under us, per Vlastimil Babka
- Removed extra rcu_read_lock()/rcu_read_unlock() in vma_end_read(),
per Vlastimil Babka
- Changed __vma_enter_locked() parameter to centralize refcount logic,
per Vlastimil Babka
- Amended description in vm_lock replacement patch explaining the effects
of the patch on vm_area_struct size, per Vlastimil Babka
- Added vm_area_struct member regrouping patch [5] into the series
- Renamed vma_copy() into vm_area_init_from(), per Liam R. Howlett
- Added a comment for vm_area_struct to update vm_area_init_from() when
adding new members, per Vlastimil Babka
- Updated a comment about unstable src->shared.rb when copying a vma in
vm_area_init_from(), per Vlastimil Babka

[1] https://lore.kernel.org/all/20230227173632.3292573-34-surenb@google.com/
[2] https://lore.kernel.org/all/ZsQyI%2F087V34JoIt@xsang-OptiPlex-9020/
[3] https://lore.kernel.org/all/CAJuCfpEisU8Lfe96AYJDZ+OM4NoPmnw9bP53cT_kbfP_pR+-2g@mail.gmail.com/
[4] https://lore.kernel.org/all/20250109023025.2242447-1-surenb@google.com/
[5] https://lore.kernel.org/all/20241111205506.3404479-5-surenb@google.com/

Patchset applies over mm-unstable after reverting v8
(current SHA range: 235b5129cb7b - 9e6b24c58985)

Suren Baghdasaryan (17):
  mm: introduce vma_start_read_locked{_nested} helpers
  mm: move per-vma lock into vm_area_struct
  mm: mark vma as detached until it's added into vma tree
  mm: introduce vma_iter_store_attached() to use with attached vmas
  mm: mark vmas detached upon exit
  types: move struct rcuwait into types.h
  mm: allow vma_start_read_locked/vma_start_read_locked_nested to fail
  mm: move mmap_init_lock() out of the header file
  mm: uninline the main body of vma_start_write()
  refcount: introduce __refcount_{add|inc}_not_zero_limited
  mm: replace vm_lock and detached flag with a reference count
  mm: move lesser used vma_area_struct members into the last cacheline
  mm/debug: print vm_refcnt state when dumping the vma
  mm: remove extra vma_numab_state_init() call
  mm: prepare lock_vma_under_rcu() for vma reuse possibility
  mm: make vma cache SLAB_TYPESAFE_BY_RCU
  docs/mm: document latest changes to vm_lock

 Documentation/mm/process_addrs.rst |  44 ++++----
 include/linux/mm.h                 | 156 ++++++++++++++++++++++-------
 include/linux/mm_types.h           |  75 +++++++-------
 include/linux/mmap_lock.h          |   6 --
 include/linux/rcuwait.h            |  13 +--
 include/linux/refcount.h           |  24 ++++-
 include/linux/slab.h               |   6 --
 include/linux/types.h              |  12 +++
 kernel/fork.c                      | 129 +++++++++++-------------
 mm/debug.c                         |  12 +++
 mm/init-mm.c                       |   1 +
 mm/memory.c                        |  97 ++++++++++++++++--
 mm/mmap.c                          |   3 +-
 mm/userfaultfd.c                   |  32 +++---
 mm/vma.c                           |  23 ++---
 mm/vma.h                           |  15 ++-
 tools/testing/vma/linux/atomic.h   |   5 +
 tools/testing/vma/vma_internal.h   |  93 ++++++++---------
 18 files changed, 465 insertions(+), 281 deletions(-)

-- 
2.47.1.613.gc27f4b7a9f-goog

