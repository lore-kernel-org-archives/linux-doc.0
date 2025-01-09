Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2509621E085
	for <linux-doc@vger.kernel.org>; Thu,  9 Jan 2025 15:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736438379; cv=none; b=KFUO5hGLf2KmdCC/hkuJ+I3L1Xlr3KwOtWzlf1rIZkcXSgIb8jPiyCbu73uMjGAE2tqPuIvnz/swDeai6dMLOiZ74ABgKFAoK87OKoxF08REVdpNjulJQ83xVVc5DF9pVG+QTParhoweiHba2upbfXUT1yxhWueFZd11oUMlAYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736438379; c=relaxed/simple;
	bh=GTLFxJmXyojM3A11h900/oWbIhozo0ka84US+DRfxTk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hwv81A7GQvUhESOuCjjKWiN50X0cIyWhbTo36Tc9+3uRcJZ0Ds9h15DIIGvrzdqGIrSeXTvhdyfgp2fU6AKonfMfLZ1mVPWO7XmdhyfiTYOZA28QfBuwZ6HiVLIwEhYTTufosAN9nVFOWy17DIw3HBsY6HGYltQEUa7vOacHtV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qMSyJHF6; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qMSyJHF6"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4679b5c66d0so244151cf.1
        for <linux-doc@vger.kernel.org>; Thu, 09 Jan 2025 07:59:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736438376; x=1737043176; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oQ5Jfa6yJs7jfMnlDSg6VPUcr4hCBZuDyKrxBZGiXXc=;
        b=qMSyJHF6rwbnyJhOSwnZTz6r98MqcxtaxxI+s1inUyPbXF9bqAnEqwjt0bRw7XykE+
         jFILkhQNx5CzJq6mTeKunoSB0+mgWdIPXBBZeHWzSs+0Fb1oeS6EN7ORyF+VbQ8pOD+C
         0cKsYXupL/TjDawpEfAvPdNF/nwxaSp1Vxjlx5c9vRaW+Mtxdeer8/PxU5KZGulEFKBN
         foFGkWrdNDT0u1lY2Z5GH7/SyLt2dTuag0Y3RIKfqIRlh0oQoR2p6ZxgE3JOjVgEODpS
         ycyH78AseqgbTTLL4/LWw6u1n2YBf0snrzTKT5qFwrA7OeL3NHYXerjMwx5wzwAplHCk
         mTjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736438376; x=1737043176;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oQ5Jfa6yJs7jfMnlDSg6VPUcr4hCBZuDyKrxBZGiXXc=;
        b=qWeSv82W2Vi0nEE8fQtjflrIaWVGejUweo4Bc8am4vhdrBOwc/3SsqMU5UVsIyJvTb
         je1rlqopMF1yE9WJMIk279Y1TG0L/B45WioM3JgYvR3QCwH/ay53/LOnN7E14JpxxP7G
         o8egC33zJ6L9oVOaZ3di9/ng5E2d8I0sc+Pj48cWD9npNhZPSh6qEJ0CTCbbO1s7RHXX
         U2Y2CorTzwLgMwtP5z7vSuDgxNDCY7wZxWbVcG6cAosiOAE/YQzLB11dx2TFCp3eZ2gq
         cFFfd/UiK8cVi0zT6YnQiuZnrulfDk9pBw8rZC32F0JTe2AisFmPYr+Bhv77s1OZOFyo
         kJww==
X-Forwarded-Encrypted: i=1; AJvYcCXhQ9WVpbbIk1nCuABp9qhNTgl9hTWiIPyh9fOb+0jbl/V4lRolghADxWeD3Dr/jCQpkPSA00e102c=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvEVNlOWSizJJmOqyVYEI7QzKc8hbvHpTwXOrl5gniXwb5eS1a
	+mXCoJyRAQujZ+i/k7ac5axpoaYON1009BamI0rG53xVeG8/G/nBwRoZUe8yAsaZxegfQscnOAU
	FQ7ckYJS7H6bIYaU/yen0Gf3gu06560v8sqhF
X-Gm-Gg: ASbGnctG6mBy6SvPev587SGhgtOEmTnzhx6wih9nnGKViJ4wy3KpNMZPlhavqwTikbA
	ePx3YlVmg6J9M3WqzetZynMP2xyKHyP+UgI/vdw==
X-Google-Smtp-Source: AGHT+IFbE3SeEccWxfnXtdn6KqtzTi123gdRUj3JwdZsdTJwW/j6DVioWu5BS4mPtH+WOOf2BoEr0pxuAA/hjT+Q+JU=
X-Received: by 2002:ac8:7c4c:0:b0:46c:726a:14dc with SMTP id
 d75a77b69052e-46c7bda7657mr4888951cf.28.1736438375624; Thu, 09 Jan 2025
 07:59:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250109023025.2242447-1-surenb@google.com> <52ecd3fa-5978-4f4b-b969-c42b00a5b885@suse.cz>
In-Reply-To: <52ecd3fa-5978-4f4b-b969-c42b00a5b885@suse.cz>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 9 Jan 2025 07:59:24 -0800
X-Gm-Features: AbW1kvalvhfQuAc0MXMuPaqroEtXL5qkz1EwFB3F7sJl51UcD4m-zeoB0z5Fluc
Message-ID: <CAJuCfpExmxZFh_RB9t0+KmiJMiPOQ9priEx1xz63SCMTL=b8uw@mail.gmail.com>
Subject: Re: [PATCH v8 00/16] move per-vma lock into vm_area_struct
To: Vlastimil Babka <vbabka@suse.cz>
Cc: akpm@linux-foundation.org, peterz@infradead.org, willy@infradead.org, 
	liam.howlett@oracle.com, lorenzo.stoakes@oracle.com, mhocko@suse.com, 
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

On Thu, Jan 9, 2025 at 5:40=E2=80=AFAM Vlastimil Babka <vbabka@suse.cz> wro=
te:
>
> Btw the subject became rather incomplete given all the series does :)

Missed this one. What do you think is worth mentioning here? It's
true, the patchset does many small things but I wanted to outline the
main conceptual changes. Please LMK if you think there are more
changes big enough to be mentioned here.

>
> On 1/9/25 3:30 AM, Suren Baghdasaryan wrote:
> > Back when per-vma locks were introduces, vm_lock was moved out of
> > vm_area_struct in [1] because of the performance regression caused by
> > false cacheline sharing. Recent investigation [2] revealed that the
> > regressions is limited to a rather old Broadwell microarchitecture and
> > even there it can be mitigated by disabling adjacent cacheline
> > prefetching, see [3].
> > Splitting single logical structure into multiple ones leads to more
> > complicated management, extra pointer dereferences and overall less
> > maintainable code. When that split-away part is a lock, it complicates
> > things even further. With no performance benefits, there are no reasons
> > for this split. Merging the vm_lock back into vm_area_struct also allow=
s
> > vm_area_struct to use SLAB_TYPESAFE_BY_RCU later in this patchset.
> > This patchset:
> > 1. moves vm_lock back into vm_area_struct, aligning it at the cacheline
> > boundary and changing the cache to be cacheline-aligned to minimize
> > cacheline sharing;
> > 2. changes vm_area_struct initialization to mark new vma as detached un=
til
> > it is inserted into vma tree;
> > 3. replaces vm_lock and vma->detached flag with a reference counter;
> > 4. changes vm_area_struct cache to SLAB_TYPESAFE_BY_RCU to allow for th=
eir
> > reuse and to minimize call_rcu() calls.
> >
> > Pagefault microbenchmarks show performance improvement:
> > Hmean     faults/cpu-1    507926.5547 (   0.00%)   506519.3692 *  -0.28=
%*
> > Hmean     faults/cpu-4    479119.7051 (   0.00%)   481333.6802 *   0.46=
%*
> > Hmean     faults/cpu-7    452880.2961 (   0.00%)   455845.6211 *   0.65=
%*
> > Hmean     faults/cpu-12   347639.1021 (   0.00%)   352004.2254 *   1.26=
%*
> > Hmean     faults/cpu-21   200061.2238 (   0.00%)   229597.0317 *  14.76=
%*
> > Hmean     faults/cpu-30   145251.2001 (   0.00%)   164202.5067 *  13.05=
%*
> > Hmean     faults/cpu-48   106848.4434 (   0.00%)   120641.5504 *  12.91=
%*
> > Hmean     faults/cpu-56    92472.3835 (   0.00%)   103464.7916 *  11.89=
%*
> > Hmean     faults/sec-1    507566.1468 (   0.00%)   506139.0811 *  -0.28=
%*
> > Hmean     faults/sec-4   1880478.2402 (   0.00%)  1886795.6329 *   0.34=
%*
> > Hmean     faults/sec-7   3106394.3438 (   0.00%)  3140550.7485 *   1.10=
%*
> > Hmean     faults/sec-12  4061358.4795 (   0.00%)  4112477.0206 *   1.26=
%*
> > Hmean     faults/sec-21  3988619.1169 (   0.00%)  4577747.1436 *  14.77=
%*
> > Hmean     faults/sec-30  3909839.5449 (   0.00%)  4311052.2787 *  10.26=
%*
> > Hmean     faults/sec-48  4761108.4691 (   0.00%)  5283790.5026 *  10.98=
%*
> > Hmean     faults/sec-56  4885561.4590 (   0.00%)  5415839.4045 *  10.85=
%*
>
> Given how patch 2 discusses memory growth due to moving the lock, should
> also patch 11 discuss how the replacement with refcount reduces the
> memory footprint? And/or the cover letter could summarize the impact of
> the whole series in that aspect? Perhaps the refcount doesn't reduce
> anything as it's smaller but sits alone in the cacheline? Could it be
> grouped with some non-hot fields instead as a followup, so could we get
> to <=3D192 (non-debug) size without impacting performance?
>
> > Changes since v7 [4]:
> > - Removed additional parameter for vma_iter_store() and introduced
> > vma_iter_store_attached() instead, per Vlastimil Babka and
> > Liam R. Howlett
> > - Fixed coding style nits, per Vlastimil Babka
> > - Added Reviewed-bys and Acked-bys, per Vlastimil Babka
> > - Added Reviewed-bys and Acked-bys, per Liam R. Howlett
> > - Added Acked-by, per Davidlohr Bueso
> > - Removed unnecessary patch changeing nommu.c
> > - Folded a fixup patch [5] into the patch it was fixing
> > - Changed calculation in __refcount_add_not_zero_limited() to avoid
> > overflow, to change the limit to be inclusive and to use INT_MAX to
> > indicate no limits, per Vlastimil Babka and Matthew Wilcox
> > - Folded a fixup patch [6] into the patch it was fixing
> > - Added vm_refcnt rules summary in the changelog, per Liam R. Howlett
> > - Changed writers to not increment vm_refcnt and adjusted VMA_REF_LIMIT
> > to not reserve one count for a writer, per Liam R. Howlett
> > - Changed vma_refcount_put() to wake up writers only when the last read=
er
> > is leaving, per Liam R. Howlett
> > - Fixed rwsem_acquire_read() parameters when read-locking a vma to matc=
h
> > the way down_read_trylock() does lockdep, per Vlastimil Babka
> > - Folded vma_lockdep_init() into vma_lock_init() for simplicity
> > - Brought back vma_copy() to keep vm_refcount at 0 during reuse,
> > per Vlastimil Babka
> >
> > What I did not include in this patchset:
> > - Liam's suggestion to change dump_vma() output since it's unclear to m=
e
> > how it should look like. The patch is for debug only and not critical f=
or
> > the rest of the series, we can change the output later or even drop it =
if
> > necessary.
> >
> > [1] https://lore.kernel.org/all/20230227173632.3292573-34-surenb@google=
.com/
> > [2] https://lore.kernel.org/all/ZsQyI%2F087V34JoIt@xsang-OptiPlex-9020/
> > [3] https://lore.kernel.org/all/CAJuCfpEisU8Lfe96AYJDZ+OM4NoPmnw9bP53cT=
_kbfP_pR+-2g@mail.gmail.com/
> > [4] https://lore.kernel.org/all/20241226170710.1159679-1-surenb@google.=
com/
> > [5] https://lore.kernel.org/all/20250107030415.721474-1-surenb@google.c=
om/
> > [6] https://lore.kernel.org/all/20241226200335.1250078-1-surenb@google.=
com/
> >
> > Patchset applies over mm-unstable after reverting v7
> > (current SHA range: 588f0086398e - fb2270654630)
> >
> > Suren Baghdasaryan (16):
> >   mm: introduce vma_start_read_locked{_nested} helpers
> >   mm: move per-vma lock into vm_area_struct
> >   mm: mark vma as detached until it's added into vma tree
> >   mm: introduce vma_iter_store_attached() to use with attached vmas
> >   mm: mark vmas detached upon exit
> >   types: move struct rcuwait into types.h
> >   mm: allow vma_start_read_locked/vma_start_read_locked_nested to fail
> >   mm: move mmap_init_lock() out of the header file
> >   mm: uninline the main body of vma_start_write()
> >   refcount: introduce __refcount_{add|inc}_not_zero_limited
> >   mm: replace vm_lock and detached flag with a reference count
> >   mm/debug: print vm_refcnt state when dumping the vma
> >   mm: remove extra vma_numab_state_init() call
> >   mm: prepare lock_vma_under_rcu() for vma reuse possibility
> >   mm: make vma cache SLAB_TYPESAFE_BY_RCU
> >   docs/mm: document latest changes to vm_lock
> >
> >  Documentation/mm/process_addrs.rst |  44 +++++----
> >  include/linux/mm.h                 | 152 ++++++++++++++++++++++-------
> >  include/linux/mm_types.h           |  36 ++++---
> >  include/linux/mmap_lock.h          |   6 --
> >  include/linux/rcuwait.h            |  13 +--
> >  include/linux/refcount.h           |  20 +++-
> >  include/linux/slab.h               |   6 --
> >  include/linux/types.h              |  12 +++
> >  kernel/fork.c                      | 128 +++++++++++-------------
> >  mm/debug.c                         |  12 +++
> >  mm/init-mm.c                       |   1 +
> >  mm/memory.c                        |  94 +++++++++++++++---
> >  mm/mmap.c                          |   3 +-
> >  mm/userfaultfd.c                   |  32 +++---
> >  mm/vma.c                           |  23 ++---
> >  mm/vma.h                           |  15 ++-
> >  tools/testing/vma/linux/atomic.h   |   5 +
> >  tools/testing/vma/vma_internal.h   |  93 ++++++++----------
> >  18 files changed, 435 insertions(+), 260 deletions(-)
> >
>
