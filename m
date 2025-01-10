Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E891FA4
	for <linux-doc@vger.kernel.org>; Fri, 10 Jan 2025 00:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736468070; cv=none; b=LCWNOOj7DBcVkNwNlyc9s6P1pD2reGWUiWQlSK0tOL9cKcxsC4G1t9L3baocLY3xq8xai8rV9zJm9VpePalmEjcMRR03Zffn9CJQQz878U9PJT0jWZ1vfcirC3OePZVZpzqfvlscmz05ZcEhIhsTuFTCP2JeF+YszY+RogQ4ank=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736468070; c=relaxed/simple;
	bh=silsxb0MvSFX7p16LpfnphbtBB+6XTilVkLN9Xa1dR0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IaD6j+1EAjN7x1DFKPYiKGUZKVS8qaCFhe8Jy9FslByDcEmZKZ5imrWyaMudOUnqG+5m8SSdsiszcEGune5L5mAVPalRB8y+AfebwwbyueocZBAmIPyvU+fN0a/DNtHsLt1W+GX23wPHELDcAzIkQtYdW2LIg702XfE1OZUfU+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ivq5WRMm; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ivq5WRMm"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4678c9310afso53841cf.1
        for <linux-doc@vger.kernel.org>; Thu, 09 Jan 2025 16:14:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736468067; x=1737072867; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mdWUWGjEp0u35Kq0kqOhWpdsZYERSQmiKG8hjbVEAMY=;
        b=Ivq5WRMmQrE58ogDYVAgUJ7eu5ZuBzV4THIjfF5KW30bZEPyZOL9M6dSBtaODYLXnW
         2u8AHfkpdKzwNbyEiIvV5F6VSib+MwfTBnnZ5hBuTET7MsN+iTC93r8X9DZJoOkStC/5
         qEXX8hX2w5wlHmGhp6UkgPU3XhFM03kuEiRBBsUqR3dcmVPsRdXwhsjnXKn/jnJcO8bs
         887FNhCLvMh7KNNAch7QBhBuRD+d4taWqj6UVmiEhNt3Kvvcbbn8qmoGcz7vnTcZWBxK
         YsNRzbOqk/imLFr5SSaEHytfRJfit//b29ID7oAGjVQXXCBR6mgjnZ0R5MhHmoY/0mnv
         sEkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736468067; x=1737072867;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mdWUWGjEp0u35Kq0kqOhWpdsZYERSQmiKG8hjbVEAMY=;
        b=UxopJLuBRplPBx9RSepOQEpuBziZcstg4MMii6x1bZY3Dv75CiAOi+2EYYVDtCb7ML
         Wpw+HrvMx/9B16AIRUBRoBa2v12lr77n9eezZFUV9qQv9XflKRMXWOrYa4dnCQmVigyn
         uneMxnu2p9J9SWErdd6iQLh8eNNuWsfgoDZtdDFaQixQrD68aRk/8Js1YppVyavydyWP
         i6gL79mQDyMz7/AHYBGx7L6jxYylAnVagtX/l8cl1G+G2bfWt04fkMgU6XCJej1KlA0m
         F+akueD5/FPt2DlD/QHKoedW87XKcsLxoVVq9mZvzr8GDe2ri6IWhwLnuwpA2LppJifN
         Pi6A==
X-Forwarded-Encrypted: i=1; AJvYcCVB/1CjhK/gR3k+8SJ0e47MjaWjyBEGmouzMHbwGlSBoYxk4maZdZVZ/rLnLTObJaJndXn47gMs4hc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqV9DMighLFQZDQqDBp2zgG4sXg7o7RrJb7WAWeKX0SiDOoj70
	7GqMlZnqcOA2uIhVPHe6WRkQ5aPoBAEvUwnXzgSTDcGPW2tKsUlXAdjAAT9NxesTpnFZiEHWahP
	fZJ3rjzXY8O+sM2PkXFFyL9RMNOV/jHr2i9+3
X-Gm-Gg: ASbGncsqlO/KIhq6MX9Pm/kmW5U9dAHf4LGrX3hEZB3CK8RFGTYz2sluuRmyPWAB41n
	+bNSXP8EE03yUXxhCvVy8gB/CuFXh1E7DpBEQ1A==
X-Google-Smtp-Source: AGHT+IGqsd0Sw+8GQX35HNMH/e3MXzrIz3DETmJWOPPU00vYr0aaeTpKUDll46SQuWc7IAEGcu5yRidQF9Dz49rLB3g=
X-Received: by 2002:ac8:7c46:0:b0:465:18f3:79cc with SMTP id
 d75a77b69052e-46c89dad861mr506781cf.11.1736468067016; Thu, 09 Jan 2025
 16:14:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250109023025.2242447-1-surenb@google.com> <52ecd3fa-5978-4f4b-b969-c42b00a5b885@suse.cz>
 <CAJuCfpGwL1rnLRNG=CTfvfi75rsAn-f0mupnZUhm5nDi19Nk-A@mail.gmail.com>
In-Reply-To: <CAJuCfpGwL1rnLRNG=CTfvfi75rsAn-f0mupnZUhm5nDi19Nk-A@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 9 Jan 2025 16:14:15 -0800
X-Gm-Features: AbW1kvZyYGz79_D0l7gUPtzr64ay41aoj4Qg9BbkeZM_pHCyyWhlLdeBlMVSQ9I
Message-ID: <CAJuCfpGJFsA4y4PA-eDtUubAYer3pSqYCF9uvQBpXu+UwKPLgw@mail.gmail.com>
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

On Thu, Jan 9, 2025 at 7:57=E2=80=AFAM Suren Baghdasaryan <surenb@google.co=
m> wrote:
>
> On Thu, Jan 9, 2025 at 5:40=E2=80=AFAM Vlastimil Babka <vbabka@suse.cz> w=
rote:
> >
> > Btw the subject became rather incomplete given all the series does :)
> >
> > On 1/9/25 3:30 AM, Suren Baghdasaryan wrote:
> > > Back when per-vma locks were introduces, vm_lock was moved out of
> > > vm_area_struct in [1] because of the performance regression caused by
> > > false cacheline sharing. Recent investigation [2] revealed that the
> > > regressions is limited to a rather old Broadwell microarchitecture an=
d
> > > even there it can be mitigated by disabling adjacent cacheline
> > > prefetching, see [3].
> > > Splitting single logical structure into multiple ones leads to more
> > > complicated management, extra pointer dereferences and overall less
> > > maintainable code. When that split-away part is a lock, it complicate=
s
> > > things even further. With no performance benefits, there are no reaso=
ns
> > > for this split. Merging the vm_lock back into vm_area_struct also all=
ows
> > > vm_area_struct to use SLAB_TYPESAFE_BY_RCU later in this patchset.
> > > This patchset:
> > > 1. moves vm_lock back into vm_area_struct, aligning it at the cacheli=
ne
> > > boundary and changing the cache to be cacheline-aligned to minimize
> > > cacheline sharing;
> > > 2. changes vm_area_struct initialization to mark new vma as detached =
until
> > > it is inserted into vma tree;
> > > 3. replaces vm_lock and vma->detached flag with a reference counter;
> > > 4. changes vm_area_struct cache to SLAB_TYPESAFE_BY_RCU to allow for =
their
> > > reuse and to minimize call_rcu() calls.
> > >
> > > Pagefault microbenchmarks show performance improvement:
> > > Hmean     faults/cpu-1    507926.5547 (   0.00%)   506519.3692 *  -0.=
28%*
> > > Hmean     faults/cpu-4    479119.7051 (   0.00%)   481333.6802 *   0.=
46%*
> > > Hmean     faults/cpu-7    452880.2961 (   0.00%)   455845.6211 *   0.=
65%*
> > > Hmean     faults/cpu-12   347639.1021 (   0.00%)   352004.2254 *   1.=
26%*
> > > Hmean     faults/cpu-21   200061.2238 (   0.00%)   229597.0317 *  14.=
76%*
> > > Hmean     faults/cpu-30   145251.2001 (   0.00%)   164202.5067 *  13.=
05%*
> > > Hmean     faults/cpu-48   106848.4434 (   0.00%)   120641.5504 *  12.=
91%*
> > > Hmean     faults/cpu-56    92472.3835 (   0.00%)   103464.7916 *  11.=
89%*
> > > Hmean     faults/sec-1    507566.1468 (   0.00%)   506139.0811 *  -0.=
28%*
> > > Hmean     faults/sec-4   1880478.2402 (   0.00%)  1886795.6329 *   0.=
34%*
> > > Hmean     faults/sec-7   3106394.3438 (   0.00%)  3140550.7485 *   1.=
10%*
> > > Hmean     faults/sec-12  4061358.4795 (   0.00%)  4112477.0206 *   1.=
26%*
> > > Hmean     faults/sec-21  3988619.1169 (   0.00%)  4577747.1436 *  14.=
77%*
> > > Hmean     faults/sec-30  3909839.5449 (   0.00%)  4311052.2787 *  10.=
26%*
> > > Hmean     faults/sec-48  4761108.4691 (   0.00%)  5283790.5026 *  10.=
98%*
> > > Hmean     faults/sec-56  4885561.4590 (   0.00%)  5415839.4045 *  10.=
85%*
> >
> > Given how patch 2 discusses memory growth due to moving the lock, shoul=
d
> > also patch 11 discuss how the replacement with refcount reduces the
> > memory footprint? And/or the cover letter could summarize the impact of
> > the whole series in that aspect?
>
> That's a good idea. I can amend the cover letter and the description
> of patch 11 to include size information.
>
> > Perhaps the refcount doesn't reduce
> > anything as it's smaller but sits alone in the cacheline? Could it be
> > grouped with some non-hot fields instead as a followup, so could we get
> > to <=3D192 (non-debug) size without impacting performance?
>
> Yes, absolutely. Before this series, vm_area_struct was roughly 168
> bytes and vm_lock was 40 bytes. After the changes vm_area_struct
> becomes 256 bytes. I was planning to pack the fields as a follow-up
> patch similar to an earlier one [1] and bring the size of
> vm_area_struct to < 192. I felt this patchset already does many things
> and did not include it here but I can add it at the end of this
> patchset if you think it's essential.
>
> [1] https://lore.kernel.org/all/20241111205506.3404479-5-surenb@google.co=
m/

Actually I tried to rewrite the above patch [1] over the latest
patchset and it's pretty much the same. I think I should include it at
the end of this patchset as it's pretty simple. Planning to post v9
tomorrow morning, so if you don't want it in this patchset, please let
me know.
Thanks!

>
> >
> > > Changes since v7 [4]:
> > > - Removed additional parameter for vma_iter_store() and introduced
> > > vma_iter_store_attached() instead, per Vlastimil Babka and
> > > Liam R. Howlett
> > > - Fixed coding style nits, per Vlastimil Babka
> > > - Added Reviewed-bys and Acked-bys, per Vlastimil Babka
> > > - Added Reviewed-bys and Acked-bys, per Liam R. Howlett
> > > - Added Acked-by, per Davidlohr Bueso
> > > - Removed unnecessary patch changeing nommu.c
> > > - Folded a fixup patch [5] into the patch it was fixing
> > > - Changed calculation in __refcount_add_not_zero_limited() to avoid
> > > overflow, to change the limit to be inclusive and to use INT_MAX to
> > > indicate no limits, per Vlastimil Babka and Matthew Wilcox
> > > - Folded a fixup patch [6] into the patch it was fixing
> > > - Added vm_refcnt rules summary in the changelog, per Liam R. Howlett
> > > - Changed writers to not increment vm_refcnt and adjusted VMA_REF_LIM=
IT
> > > to not reserve one count for a writer, per Liam R. Howlett
> > > - Changed vma_refcount_put() to wake up writers only when the last re=
ader
> > > is leaving, per Liam R. Howlett
> > > - Fixed rwsem_acquire_read() parameters when read-locking a vma to ma=
tch
> > > the way down_read_trylock() does lockdep, per Vlastimil Babka
> > > - Folded vma_lockdep_init() into vma_lock_init() for simplicity
> > > - Brought back vma_copy() to keep vm_refcount at 0 during reuse,
> > > per Vlastimil Babka
> > >
> > > What I did not include in this patchset:
> > > - Liam's suggestion to change dump_vma() output since it's unclear to=
 me
> > > how it should look like. The patch is for debug only and not critical=
 for
> > > the rest of the series, we can change the output later or even drop i=
t if
> > > necessary.
> > >
> > > [1] https://lore.kernel.org/all/20230227173632.3292573-34-surenb@goog=
le.com/
> > > [2] https://lore.kernel.org/all/ZsQyI%2F087V34JoIt@xsang-OptiPlex-902=
0/
> > > [3] https://lore.kernel.org/all/CAJuCfpEisU8Lfe96AYJDZ+OM4NoPmnw9bP53=
cT_kbfP_pR+-2g@mail.gmail.com/
> > > [4] https://lore.kernel.org/all/20241226170710.1159679-1-surenb@googl=
e.com/
> > > [5] https://lore.kernel.org/all/20250107030415.721474-1-surenb@google=
.com/
> > > [6] https://lore.kernel.org/all/20241226200335.1250078-1-surenb@googl=
e.com/
> > >
> > > Patchset applies over mm-unstable after reverting v7
> > > (current SHA range: 588f0086398e - fb2270654630)
> > >
> > > Suren Baghdasaryan (16):
> > >   mm: introduce vma_start_read_locked{_nested} helpers
> > >   mm: move per-vma lock into vm_area_struct
> > >   mm: mark vma as detached until it's added into vma tree
> > >   mm: introduce vma_iter_store_attached() to use with attached vmas
> > >   mm: mark vmas detached upon exit
> > >   types: move struct rcuwait into types.h
> > >   mm: allow vma_start_read_locked/vma_start_read_locked_nested to fai=
l
> > >   mm: move mmap_init_lock() out of the header file
> > >   mm: uninline the main body of vma_start_write()
> > >   refcount: introduce __refcount_{add|inc}_not_zero_limited
> > >   mm: replace vm_lock and detached flag with a reference count
> > >   mm/debug: print vm_refcnt state when dumping the vma
> > >   mm: remove extra vma_numab_state_init() call
> > >   mm: prepare lock_vma_under_rcu() for vma reuse possibility
> > >   mm: make vma cache SLAB_TYPESAFE_BY_RCU
> > >   docs/mm: document latest changes to vm_lock
> > >
> > >  Documentation/mm/process_addrs.rst |  44 +++++----
> > >  include/linux/mm.h                 | 152 ++++++++++++++++++++++-----=
--
> > >  include/linux/mm_types.h           |  36 ++++---
> > >  include/linux/mmap_lock.h          |   6 --
> > >  include/linux/rcuwait.h            |  13 +--
> > >  include/linux/refcount.h           |  20 +++-
> > >  include/linux/slab.h               |   6 --
> > >  include/linux/types.h              |  12 +++
> > >  kernel/fork.c                      | 128 +++++++++++-------------
> > >  mm/debug.c                         |  12 +++
> > >  mm/init-mm.c                       |   1 +
> > >  mm/memory.c                        |  94 +++++++++++++++---
> > >  mm/mmap.c                          |   3 +-
> > >  mm/userfaultfd.c                   |  32 +++---
> > >  mm/vma.c                           |  23 ++---
> > >  mm/vma.h                           |  15 ++-
> > >  tools/testing/vma/linux/atomic.h   |   5 +
> > >  tools/testing/vma/vma_internal.h   |  93 ++++++++----------
> > >  18 files changed, 435 insertions(+), 260 deletions(-)
> > >
> >
