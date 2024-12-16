Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C65207DE0
	for <linux-doc@vger.kernel.org>; Mon, 16 Dec 2024 19:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734377970; cv=none; b=TEvAyTuDaagYfkhEdBtzh3FV45Y8QbI7XK8ynWJ7Kk6+48qIU9puU+zedSE4sDI95iItrnIhuS0OeMZZ3bkHwARkDm+IxmTgfYb0TY3fR5s+x/rvLLH7AtRb5kX2uag776CT6SabPpjN7nZxi9ynxnEUiCMnhv658CvOMlk3krM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734377970; c=relaxed/simple;
	bh=GOF2jXLTWPrA3aCK4tq0pIV7Re4Ou/xviKOHruQEGBU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pO/6nB3XD53OB25JK71Wq4k1eQU31ve+rIJ1kP0lKCxFNLMeNnp4OZBLqbFihTnBlsGtPMQxOGMKztzsWEV6BwHAvTF7uni5YGp0kiZHjyjJd4mGGeSd9qzU0uOABM8lul/rQlFf3IVSOJhARpn5fllhrEv5eLIMv+Ro/nRUGDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JC1AcWgo; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JC1AcWgo"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-467abce2ef9so41111cf.0
        for <linux-doc@vger.kernel.org>; Mon, 16 Dec 2024 11:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734377967; x=1734982767; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vxsLhkMEY2Zp6oM7FkFNS9xb8JI1WJZFeg+OPjEp8Jo=;
        b=JC1AcWgoYMOt+5TudhsOT+LA1Rgul2lE/+XlEWTiuX0ojPgjOOs/AI3ln3Fa5PSKCx
         zJ514RlQ0Q7gjUkUWeEMcC9BiFfDRHncjUz+M8sqiW3hDhESLgr0VZTgHrxHPksElg6m
         wc0iFgBwiJZYy3mdbOGwJCHXBdLD0PCIk6UTNHTPdx1ZDMQ5MZURgZmnkCaljC+jOJDq
         29l3u1RSlwW1W7fjgzkEJqFte0QPWwoyIZ7ISqVQxkpJD2fJa85mv8cUutlH54iogHQX
         F0eXVVtogFqoemN2vn/sjsAMWsFewgckAD2FhYkA7LjasxXVSXBZwjdTTp9ym/BQ3Cy0
         x8Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734377967; x=1734982767;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vxsLhkMEY2Zp6oM7FkFNS9xb8JI1WJZFeg+OPjEp8Jo=;
        b=f0v1jNq7u1r2CGF6GfpUIAJ5x37uXcZjMFD3DnTbbTO81MQ2c3/WoiW/rKiWjUprON
         3vZqxoS325cLhexPyg29/YwGSoUT7eSO5zVhD5nEDjKh9DIaiHjUGs3NYvvjYl1iZ9YN
         tM7YARCSy0twQ8J872Zcrhsbxd2BpIljFQ/7q9Jn+qpZhcE+S9Ps3MRPzBTJB6Z9aANG
         DT0a2KDTHlWrh54VCWKeTc5w1HTvJCEswiXfTWlK4rJxFH9e2gpQGMajrCt8Y2Jl9lhG
         qOUR07oBqOhyQmF510vlp/SunVmtqSCiKNhskhp4AGPCXIDNymy1wd9bpv1V2hyq/hdz
         15jQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQqE7FFcZ0svxwZ637DWiGqzUAr55iOoxUcrgRea5RDRMOID5leoQ8TDIsRmdKEj3fcqzLMDh1z2w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVJTy+rp50WUy+fy2Qcq1y5SKDEJ/R+0jBiAV8MYfqH9HmtP30
	hoYqwFtxk+hy0KXP6rfpI7LC/DtEQ4fPPpUoGaePjBcBKt1Oe6osTymgFTSe38TxuJzHqUHqQJM
	gEEtCSFPrshc84mHuK3z3HM5/Vd0/+5k08xBh
X-Gm-Gg: ASbGncsBfci2EK9k7GbbpQpTbgfvlTJbqiIeDjst4WQQfW4YThfAApuKgQLXhGe9f3c
	ANAyCKraagzWigG7Q/I9Zc1Qb4ad9DW6/rDtfQg==
X-Google-Smtp-Source: AGHT+IFH/hDXA3VN4NX+G7/8PqmoGlyT+OXmmeRMbT/6WrJVGm8SJlGtE8wzNFYlrPKuNcV05CkFmEAczwuPhwwbWOI=
X-Received: by 2002:ac8:7d92:0:b0:461:3311:8986 with SMTP id
 d75a77b69052e-468f979bbc4mr380911cf.18.1734377967323; Mon, 16 Dec 2024
 11:39:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241216192419.2970941-1-surenb@google.com>
In-Reply-To: <20241216192419.2970941-1-surenb@google.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 16 Dec 2024 11:39:16 -0800
Message-ID: <CAJuCfpHL33E_=hHmM-4sgcG892j3NS+J69RWHJNmJs-N16y4Lg@mail.gmail.com>
Subject: Re: [PATCH v6 00/16] move per-vma lock into vm_area_struct
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
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 16, 2024 at 11:24=E2=80=AFAM Suren Baghdasaryan <surenb@google.=
com> wrote:
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
> Changes since v5 [4]
> - Added Reviewed-by, per Vlastimil Babka;
> - Added replacement of vm_lock and vma->detached flag with vm_refcnt,
> per Peter Zijlstra and Matthew Wilcox
> - Marked vmas detached during exit_mmap;
> - Ensureed vmas are in detached state before they are freed;
> - Changed SLAB_TYPESAFE_BY_RCU patch to not require ctor, leading to a
> much simpler code;
> - Removed unnecessary patch [5]
> - Updated documentation to reflect changes to vm_lock;
>
> Patchset applies over mm-unstable after reverting v5 of this patchset [4]
> (currently 687e99a5faa5-905ab222508a)

^^^
Please be aware of this if trying to apply to a branch. mm-unstable
contains an older version of this patchset which needs to be reverted
before this one can be applied.

>
> [1] https://lore.kernel.org/all/20230227173632.3292573-34-surenb@google.c=
om/
> [2] https://lore.kernel.org/all/ZsQyI%2F087V34JoIt@xsang-OptiPlex-9020/
> [3] https://lore.kernel.org/all/CAJuCfpEisU8Lfe96AYJDZ+OM4NoPmnw9bP53cT_k=
bfP_pR+-2g@mail.gmail.com/
> [4] https://lore.kernel.org/all/20241206225204.4008261-1-surenb@google.co=
m/
> [5] https://lore.kernel.org/all/20241206225204.4008261-6-surenb@google.co=
m/
>
> Suren Baghdasaryan (16):
>   mm: introduce vma_start_read_locked{_nested} helpers
>   mm: move per-vma lock into vm_area_struct
>   mm: mark vma as detached until it's added into vma tree
>   mm/nommu: fix the last places where vma is not locked before being
>     attached
>   types: move struct rcuwait into types.h
>   mm: allow vma_start_read_locked/vma_start_read_locked_nested to fail
>   mm: move mmap_init_lock() out of the header file
>   mm: uninline the main body of vma_start_write()
>   refcount: introduce __refcount_{add|inc}_not_zero_limited
>   mm: replace vm_lock and detached flag with a reference count
>   mm: enforce vma to be in detached state before freeing
>   mm: remove extra vma_numab_state_init() call
>   mm: introduce vma_ensure_detached()
>   mm: prepare lock_vma_under_rcu() for vma reuse possibility
>   mm: make vma cache SLAB_TYPESAFE_BY_RCU
>   docs/mm: document latest changes to vm_lock
>
>  Documentation/mm/process_addrs.rst |  44 ++++----
>  include/linux/mm.h                 | 162 +++++++++++++++++++++++------
>  include/linux/mm_types.h           |  37 ++++---
>  include/linux/mmap_lock.h          |   6 --
>  include/linux/rcuwait.h            |  13 +--
>  include/linux/refcount.h           |  20 +++-
>  include/linux/slab.h               |   6 --
>  include/linux/types.h              |  12 +++
>  kernel/fork.c                      |  88 ++++------------
>  mm/init-mm.c                       |   1 +
>  mm/memory.c                        |  75 +++++++++++--
>  mm/mmap.c                          |   8 +-
>  mm/nommu.c                         |   2 +
>  mm/userfaultfd.c                   |  31 +++---
>  mm/vma.c                           |  15 ++-
>  mm/vma.h                           |   4 +-
>  tools/testing/vma/linux/atomic.h   |   5 +
>  tools/testing/vma/vma_internal.h   |  96 +++++++++--------
>  18 files changed, 378 insertions(+), 247 deletions(-)
>
> --
> 2.47.1.613.gc27f4b7a9f-goog
>
