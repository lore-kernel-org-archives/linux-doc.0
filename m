Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31647E0E8
	for <linux-doc@vger.kernel.org>; Thu,  9 Jan 2025 02:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736389966; cv=none; b=Wx8D30pxRSH09k15oMXeIu69N1hBlyA1epKGfjshoRPT9ej4js0iOdzDEPLQpXgGiFoe6auNwDOe50ryWYdHUNuBBipXbv+Wi9K70L70wj5dZJUt2xiqS0ybqltOdo1tq3xE3w//2ouVJP/T2Rub4LK+v0rruBjC6jJ4hMhIffQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736389966; c=relaxed/simple;
	bh=ZAGALXZau5L0JwchcsOctjQ7GYF4ZElzle+KbrpJXSc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ijYHmy0YfK4dBuUdhmrb2dO02V2E5UPCksO72CtpP6kIHOWS+eHoZEg0xhfV4t1bzIaeA/Ui8KdW2l4QZQvgGmpAIXWrIhaszE595QYPt/Lz4gFzVe/wxa/G+w2nGeG13KKDJje7qWLwjC+EOi/chtL5l0JNtGd/wL1SKf7TqjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=i+LP+u5B; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="i+LP+u5B"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4678c9310afso79331cf.1
        for <linux-doc@vger.kernel.org>; Wed, 08 Jan 2025 18:32:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736389962; x=1736994762; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kHrbsakMUyUhUtfojeMHFZoQ67su4b13YWHH4z/fGBI=;
        b=i+LP+u5BZQw2PcYryTG18ob4vXo8dOGnURmNUXtRaFSXG4MZ92ZHagBV+NUbWA6TeE
         VuZbYF7xXnKj+S2x3FamLCpmhljT1zw5ykivWEkZzwiKULeGzKS9MrGsgrx7CWJa1EUf
         eP8uRE9ljAyerId+ykM2wuCi5dbXRIiUPDSqK8ibHcTBBFaePTl/FHkmu3iPc3vmGbiR
         n8twvAvy9Wg6pn+tx5F1qZPHTSTOo0sKBzew5e9AY/ySiel3n1RZjm6N6vFGUSJ6biCO
         iFyTvWwMXXp7MprC7xepGJLphhKWiIlTXXEGT1p0hOZARVtgcxzBwtBIqHWzHq2PSoRd
         PQ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736389962; x=1736994762;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kHrbsakMUyUhUtfojeMHFZoQ67su4b13YWHH4z/fGBI=;
        b=S732BwO97T2cC8K93rjHLsQf/DNwbjyslK4tJkAC9eD5J1IhN+oQwX8MzUTvBIJ+x3
         4qaGhp+y1tBcEuqUjs18U0z8vgJq6dPF+O88Bp2fbsctvcgUIptSHPA17/3+m+H7sjp8
         0Mi6VON4wpZqXI5eKfR7u6x9KRzFMo1sYjsSP5Ya7IbZ6wkSr5AvRnxKUWlSfILf3UB7
         kcxIAmQF48H511DSmSMUc/W6Ucp1/pcqbQxQteisCLZAG4E/NqLLVZHaenOS8rxWqlot
         WxU297r/RDOSA7I/II8UBSaA7wqj6wetnds87uYvhWfbvvniHH/Q847Osvmu7IUwweAN
         0zwA==
X-Forwarded-Encrypted: i=1; AJvYcCWs2b3CT9Lxt3llguTPLf52OXn5NJr3CI4GVUuaecarz8+5/duheql4+giGNOVRqD4igbxtjPgtnYA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi9NOr4pF3WYwp46knfpN6mZfyeag+7dqH4DhubU3kQooipJe6
	alsysPOSM/rPU5LS80P1fl8IxkhNcOLWITU0I471zZGJzwyUesO3TDi5s6r5b4olsLBSxjneELp
	Z8XE54yqL99Yyk8+aaaQEIEyBM714qKi5cA/y
X-Gm-Gg: ASbGncvOVaStclzrzdsOaE4Yfmmhyrgjt9DA8lY3f71ZLturmn2uQAWY2xonPR0BtLL
	XoBh92aXLBIK9zgMtAGlr7b2rW3eWHSrpu1xJfllHAVLEXjcIMCYc7v4udv6pEWTXE6I=
X-Google-Smtp-Source: AGHT+IGQATD3rtk7a2/kU7mE1nJxm3MeXJmCuUfEH3kCePw/J6JcsC5zZ5VygDcpnO+vHBqn4e/KnRhFso4RxF/u8hQ=
X-Received: by 2002:a05:622a:5cf:b0:467:8f1e:7304 with SMTP id
 d75a77b69052e-46c7cf3d965mr863061cf.13.1736389961559; Wed, 08 Jan 2025
 18:32:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250109023025.2242447-1-surenb@google.com>
In-Reply-To: <20250109023025.2242447-1-surenb@google.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 8 Jan 2025 18:32:29 -0800
X-Gm-Features: AbW1kvYkK7SZe4-TwmVQFLKcuQgZE5KKkcowOifh-d8LBFXGEuFb8-H-EYVLZCM
Message-ID: <CAJuCfpEM_+AkWFhSBTNo+n6oLmMeSAQAfDtiX=4cmRd44PUckg@mail.gmail.com>
Subject: Re: [PATCH v8 00/16] move per-vma lock into vm_area_struct
To: akpm@linux-foundation.org
Cc: peterz@infradead.org, willy@infradead.org, liam.howlett@oracle.com, 
	lorenzo.stoakes@oracle.com, mhocko@suse.com, vbabka@suse.cz, 
	hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com, 
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com, 
	oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org, brauner@kernel.org, 
	dhowells@redhat.com, hdanton@sina.com, hughd@google.com, 
	lokeshgidra@google.com, minchan@google.com, jannh@google.com, 
	shakeel.butt@linux.dev, souravpanda@google.com, pasha.tatashin@soleen.com, 
	klarasmodin@gmail.com, richard.weiyang@gmail.com, corbet@lwn.net, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 8, 2025 at 6:30=E2=80=AFPM Suren Baghdasaryan <surenb@google.co=
m> wrote:
>
> Back when per-vma locks were introduces, vm_lock was moved out of
> vm_area_struct in [1] because of the performance regression caused by
> false cacheline sharing. Recent investigation [2] revealed that the
> regressions is limited to a rather old Broadwell microarchitecture and
> even there it can be mitigated by disabling adjacent cacheline
> prefetching, see [3].
> Splitting single logical structure into multiple ones leads to more
> complicated management, extra pointer dereferences and overall less
> maintainable code. When that split-away part is a lock, it complicates
> things even further. With no performance benefits, there are no reasons
> for this split. Merging the vm_lock back into vm_area_struct also allows
> vm_area_struct to use SLAB_TYPESAFE_BY_RCU later in this patchset.
> This patchset:
> 1. moves vm_lock back into vm_area_struct, aligning it at the cacheline
> boundary and changing the cache to be cacheline-aligned to minimize
> cacheline sharing;
> 2. changes vm_area_struct initialization to mark new vma as detached unti=
l
> it is inserted into vma tree;
> 3. replaces vm_lock and vma->detached flag with a reference counter;
> 4. changes vm_area_struct cache to SLAB_TYPESAFE_BY_RCU to allow for thei=
r
> reuse and to minimize call_rcu() calls.
>
> Pagefault microbenchmarks show performance improvement:
> Hmean     faults/cpu-1    507926.5547 (   0.00%)   506519.3692 *  -0.28%*
> Hmean     faults/cpu-4    479119.7051 (   0.00%)   481333.6802 *   0.46%*
> Hmean     faults/cpu-7    452880.2961 (   0.00%)   455845.6211 *   0.65%*
> Hmean     faults/cpu-12   347639.1021 (   0.00%)   352004.2254 *   1.26%*
> Hmean     faults/cpu-21   200061.2238 (   0.00%)   229597.0317 *  14.76%*
> Hmean     faults/cpu-30   145251.2001 (   0.00%)   164202.5067 *  13.05%*
> Hmean     faults/cpu-48   106848.4434 (   0.00%)   120641.5504 *  12.91%*
> Hmean     faults/cpu-56    92472.3835 (   0.00%)   103464.7916 *  11.89%*
> Hmean     faults/sec-1    507566.1468 (   0.00%)   506139.0811 *  -0.28%*
> Hmean     faults/sec-4   1880478.2402 (   0.00%)  1886795.6329 *   0.34%*
> Hmean     faults/sec-7   3106394.3438 (   0.00%)  3140550.7485 *   1.10%*
> Hmean     faults/sec-12  4061358.4795 (   0.00%)  4112477.0206 *   1.26%*
> Hmean     faults/sec-21  3988619.1169 (   0.00%)  4577747.1436 *  14.77%*
> Hmean     faults/sec-30  3909839.5449 (   0.00%)  4311052.2787 *  10.26%*
> Hmean     faults/sec-48  4761108.4691 (   0.00%)  5283790.5026 *  10.98%*
> Hmean     faults/sec-56  4885561.4590 (   0.00%)  5415839.4045 *  10.85%*
>
> Changes since v7 [4]:
> - Removed additional parameter for vma_iter_store() and introduced
> vma_iter_store_attached() instead, per Vlastimil Babka and
> Liam R. Howlett
> - Fixed coding style nits, per Vlastimil Babka
> - Added Reviewed-bys and Acked-bys, per Vlastimil Babka
> - Added Reviewed-bys and Acked-bys, per Liam R. Howlett
> - Added Acked-by, per Davidlohr Bueso
> - Removed unnecessary patch changeing nommu.c
> - Folded a fixup patch [5] into the patch it was fixing
> - Changed calculation in __refcount_add_not_zero_limited() to avoid
> overflow, to change the limit to be inclusive and to use INT_MAX to
> indicate no limits, per Vlastimil Babka and Matthew Wilcox
> - Folded a fixup patch [6] into the patch it was fixing
> - Added vm_refcnt rules summary in the changelog, per Liam R. Howlett
> - Changed writers to not increment vm_refcnt and adjusted VMA_REF_LIMIT
> to not reserve one count for a writer, per Liam R. Howlett
> - Changed vma_refcount_put() to wake up writers only when the last reader
> is leaving, per Liam R. Howlett
> - Fixed rwsem_acquire_read() parameters when read-locking a vma to match
> the way down_read_trylock() does lockdep, per Vlastimil Babka
> - Folded vma_lockdep_init() into vma_lock_init() for simplicity
> - Brought back vma_copy() to keep vm_refcount at 0 during reuse,
> per Vlastimil Babka
>
> What I did not include in this patchset:
> - Liam's suggestion to change dump_vma() output since it's unclear to me
> how it should look like. The patch is for debug only and not critical for
> the rest of the series, we can change the output later or even drop it if
> necessary.
>
> [1] https://lore.kernel.org/all/20230227173632.3292573-34-surenb@google.c=
om/
> [2] https://lore.kernel.org/all/ZsQyI%2F087V34JoIt@xsang-OptiPlex-9020/
> [3] https://lore.kernel.org/all/CAJuCfpEisU8Lfe96AYJDZ+OM4NoPmnw9bP53cT_k=
bfP_pR+-2g@mail.gmail.com/
> [4] https://lore.kernel.org/all/20241226170710.1159679-1-surenb@google.co=
m/
> [5] https://lore.kernel.org/all/20250107030415.721474-1-surenb@google.com=
/
> [6] https://lore.kernel.org/all/20241226200335.1250078-1-surenb@google.co=
m/
>
> Patchset applies over mm-unstable after reverting v7
> (current SHA range: 588f0086398e - fb2270654630)

^^^ Please note that to apply this patchset over mm-unstable you
should revert the previous version. Thanks!

>
> Suren Baghdasaryan (16):
>   mm: introduce vma_start_read_locked{_nested} helpers
>   mm: move per-vma lock into vm_area_struct
>   mm: mark vma as detached until it's added into vma tree
>   mm: introduce vma_iter_store_attached() to use with attached vmas
>   mm: mark vmas detached upon exit
>   types: move struct rcuwait into types.h
>   mm: allow vma_start_read_locked/vma_start_read_locked_nested to fail
>   mm: move mmap_init_lock() out of the header file
>   mm: uninline the main body of vma_start_write()
>   refcount: introduce __refcount_{add|inc}_not_zero_limited
>   mm: replace vm_lock and detached flag with a reference count
>   mm/debug: print vm_refcnt state when dumping the vma
>   mm: remove extra vma_numab_state_init() call
>   mm: prepare lock_vma_under_rcu() for vma reuse possibility
>   mm: make vma cache SLAB_TYPESAFE_BY_RCU
>   docs/mm: document latest changes to vm_lock
>
>  Documentation/mm/process_addrs.rst |  44 +++++----
>  include/linux/mm.h                 | 152 ++++++++++++++++++++++-------
>  include/linux/mm_types.h           |  36 ++++---
>  include/linux/mmap_lock.h          |   6 --
>  include/linux/rcuwait.h            |  13 +--
>  include/linux/refcount.h           |  20 +++-
>  include/linux/slab.h               |   6 --
>  include/linux/types.h              |  12 +++
>  kernel/fork.c                      | 128 +++++++++++-------------
>  mm/debug.c                         |  12 +++
>  mm/init-mm.c                       |   1 +
>  mm/memory.c                        |  94 +++++++++++++++---
>  mm/mmap.c                          |   3 +-
>  mm/userfaultfd.c                   |  32 +++---
>  mm/vma.c                           |  23 ++---
>  mm/vma.h                           |  15 ++-
>  tools/testing/vma/linux/atomic.h   |   5 +
>  tools/testing/vma/vma_internal.h   |  93 ++++++++----------
>  18 files changed, 435 insertions(+), 260 deletions(-)
>
> --
> 2.47.1.613.gc27f4b7a9f-goog
>
