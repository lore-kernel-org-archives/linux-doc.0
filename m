Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D3020F062
	for <linux-doc@vger.kernel.org>; Mon, 13 Jan 2025 16:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736787533; cv=none; b=Wc1ONX6pK+7IamMyPp1YOp28nqHRHIssfNd2AhOvjB0z/zZdwFNkyROvOF9/YQd4zV4HWadqLYf/BQjqA333ULT5oJqeEwfl3qjI69V+4Edvm2EvmuSZfAvCtdaI5DoIzGfcrvJVabhkVTx629+obgZMUglGcBAwJvll9jywNrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736787533; c=relaxed/simple;
	bh=X8PLkIpNqDqX2XKtBSb+JoR9ijvEbVQt257VQQDbQdM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FgfAlMUZrsDozRzTXyFNs9kK4VPs09DOkQqH0wmbWIVClO3IVBshM6swTswNe62pGWvrIfsRH94CUOEVMjvO5v3QFn5Um9WxLbUyaED76SBsmoy+aysT5RCgBw3NWrvubrhUk2z81kByBPdPUnvi+5P/ba/hug5pGqXe6Kd3jCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Kxfj4P99; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Kxfj4P99"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4678c9310afso388041cf.1
        for <linux-doc@vger.kernel.org>; Mon, 13 Jan 2025 08:58:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736787529; x=1737392329; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L+3yGJ9wp0ZAL1DPFZ3nOEivZmp/hLUvHqP1IwpGx1I=;
        b=Kxfj4P991irRXZAECA/7gd1iTuvAMUcqCJOX05AhPguadxuy6MkgqtQuSouaYJK3TN
         zGiWSDZkOzDSpKmH7zXgfUkzbFcZUfeOZMgVUdLsJkwZzwJkYfiLCwa2dkAKe2y/PZdg
         19LSuMQ4AxwZaB2BG5ofQpeAt2DALLm7jALfhJpy9TarpDCtxGFdwYZitELYkLD2rWl4
         rD08YAw/Y5rziXMwqvBYE4vLixfGYiVtgdLv+z5kSJkLyW7Aq46pkpLi5hsELu6k0vjd
         GetOqAkC4DYzF+H9d+PdzxoY7All8/aAInH1jING8JGNMeCqR4aJ90s/4XzoMSAFR/S1
         /vcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736787529; x=1737392329;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L+3yGJ9wp0ZAL1DPFZ3nOEivZmp/hLUvHqP1IwpGx1I=;
        b=SZQEaADDfNhCoBAwWJP3YHb12mnuexHNN0Lwjr8QaeyV1yDq//isfPzAr1R88w+BqR
         g5E0GD0oiQMzrkNtrRkSwUq0dYHrn9aipc+bm9O7hggkAQn2GgClOEAoiq/Sgx2E38xk
         SQqij0iEDzJzYQQjQwECUL0S92qG9n+LGf3Bhtd8UkUChGg44SN+767uFwzlsZ0TKDMz
         wbI+D0wX3O5gCuqEmcdFxf1b5tEOnbhMbj5pVn7a0ai9WxKTccPD+sVZg2AkIAMr/WMX
         NRh1XPy0VTJdBMQgwJtkgvv2wnLsY9mQgSsLbuxO0DuMexyd8ETUkKXWfC36FkHUSjZ/
         VFTg==
X-Forwarded-Encrypted: i=1; AJvYcCUGTM4ATNdiLes6gjLylkwVy6I5ootbcZlmHuk0Rqi++B774zOrpVrkaM4BlXixoxshxZZ1JAGUFEc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yytv8dBDrktthMm1WyK5d1j5LcVSeoV5EF3+eqLDZdiYRIwDn49
	zhQ3wS3V53Na6EqUMzHUQoqBD9A309sMuA3mwF7t9pF8eYka+Sku4M6JeeLmoN6p3EyJ3YbxdDF
	aFdtnjnw4gMqi0yfQRPRfLPJvam5pUaZaNFlE
X-Gm-Gg: ASbGncsTsLGCaw8iZvpEWFgid5POSMBo3mR1CzMC0zH9U8ZfVM8KTkkWi+zikE0CfAy
	JSAdu6ZFqhdfDtslOhoWzIxOSzCQum49ipE/2gA==
X-Google-Smtp-Source: AGHT+IGMYriKJGiL+z/c6B33XidONyAH43wU9SC3++dEyeW/0+5hfSmhVMiCSsSOI+bubDqq4wS8DD1oTN7LHbzXXFM=
X-Received: by 2002:a05:622a:10e:b0:467:8f1e:7304 with SMTP id
 d75a77b69052e-46c89dadd09mr11144171cf.13.1736787529162; Mon, 13 Jan 2025
 08:58:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250111042604.3230628-1-surenb@google.com> <f5e26a57-ec77-4df8-8b4f-5a718a046894@lucifer.local>
In-Reply-To: <f5e26a57-ec77-4df8-8b4f-5a718a046894@lucifer.local>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 13 Jan 2025 08:58:37 -0800
X-Gm-Features: AbW1kvY2X4XRSvzGagbBFmWFRwUVl7Smo8F6aRYwcH_9kUfRHWWmIfVBvmOAemI
Message-ID: <CAJuCfpEf4SZVCH+HfJsvJLbvvMFnm0tyh0P1YwjMeYk-nP0RdA@mail.gmail.com>
Subject: Re: [PATCH v9 00/17] reimplement per-vma lock as a refcount
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: akpm@linux-foundation.org, peterz@infradead.org, willy@infradead.org, 
	liam.howlett@oracle.com, david.laight.linux@gmail.com, mhocko@suse.com, 
	vbabka@suse.cz, hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com, 
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

On Mon, Jan 13, 2025 at 4:14=E2=80=AFAM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> A nit on subject, I mean this is part of what this series does, and hey -
> we have only so much text to put in here - but isn't this both
> reimplementing per-VMA lock as a refcount _and_ importantly allocating VM=
As
> using the RCU typesafe mechanism?
>
> Do we have to do both in one series? Can we split this out? I mean maybe
> that's just churny and unnecessary, but to me this series is 'allocate VM=
As
> RCU safe and refcount VMA lock' or something like this. Maybe this is
> nitty... but still :)

There is "motivational dependency" because one of the main reasons I'm
converting the vm_lock into vm_refcnt is to make it easier to add
SLAB_TYPESAFE_BY_RCU (see my last reply to Hillf). But technically we
can leave the SLAB_TYPESAFE_BY_RCU out of this series if that makes
thighs easier. That would be the 2 patches at the end:

mm: prepare lock_vma_under_rcu() for vma reuse possibility
mm: make vma cache SLAB_TYPESAFE_BY_RCU

I made sure that each patch is bisectable, so there should not be a
problem with tracking issues.

>
> One general comment here - this is a really major change in how this stuf=
f
> works, and yet I don't see any tests anywhere in the series.

Hmm. I was diligently updating the tests to reflect the replacement of
vm_lock with vm_refcnt and adding assertions for detach/attach cases.
This actually reminds me that I missed updading vm_area_struct in
vma_internal.h for the member regrouping patch; will add that. I think
the only part that did not affect tests is SLAB_TYPESAFE_BY_RCU but I
was not sure what kind of testing I can add for that. Any suggestions
would be welcomed.

>
> I know it's tricky to write tests for this, but the new VMA testing
> environment should make it possible to test a _lot_ more than we previous=
ly
> could.
>
> However due to some (*ahem*) interesting distribution of where functions
> are, most notably stuff in kernel/fork.c, I guess we can't test
> _everything_ there effectively.
>
> But I do feel like we should be able to do better than having absolutely =
no
> testing added for this?

Again, I'm open to suggestions for SLAB_TYPESAFE_BY_RCU testing but
for the rest I thought the tests were modified accordingly.

>
> I think there's definitely quite a bit you could test now, at least in
> asserting fundamentals in tools/testing/vma/vma.c.
>
> This can cover at least detached state asserts in various scenarios.

Ok, you mean to check that VMA re-attachment/re-detachment would
trigger assertions? I'll look into adding tests for that.

>
> But that won't cover off the really gnarly stuff here around RCU slab
> allocation, and determining precisely how to test that in a sensible way =
is
> maybe less clear.
>
> But I'd like to see _something_ here please, this is more or less
> fundamentally changing how all VMAs are allocated and to just have nothin=
g
> feels unfortunate.

Again, I'm open to suggestions on what kind of testing I can add for
SLAB_TYPESAFE_BY_RCU change.

>
> I'm already nervous because we've hit issues coming up to v9 and we're no=
t
> 100% sure if a recent syzkaller is related to these changes or not, I'm n=
ot
> sure how much we can get assurances with tests but I'd like something.

If you are referring to the issue at [1], I think David ran the
syzcaller against mm-stable that does not contain this patchset and
the issue still triggered (see [2]). This of course does not guarantee
that this patchset has no other issues :) I'll try adding tests for
re-attaching, re-detaching and welcome ideas on how to test
SLAB_TYPESAFE_BY_RCU transition.
Thanks,
Suren.

[1] https://lore.kernel.org/all/6758f0cc.050a0220.17f54a.0001.GAE@google.co=
m/
[2] https://lore.kernel.org/all/67823fba.050a0220.216c54.001c.GAE@google.co=
m/

>
> Thanks!
>
> On Fri, Jan 10, 2025 at 08:25:47PM -0800, Suren Baghdasaryan wrote:
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
> > 4. regroups vm_area_struct members to fit them into 3 cachelines;
> > 5. changes vm_area_struct cache to SLAB_TYPESAFE_BY_RCU to allow for th=
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
> >
> > Changes since v8 [4]:
> > - Change subject for the cover letter, per Vlastimil Babka
> > - Added Reviewed-by and Acked-by, per Vlastimil Babka
> > - Added static check for no-limit case in __refcount_add_not_zero_limit=
ed,
> > per David Laight
> > - Fixed vma_refcount_put() to call rwsem_release() unconditionally,
> > per Hillf Danton and Vlastimil Babka
> > - Use a copy of vma->vm_mm in vma_refcount_put() in case vma is freed f=
rom
> > under us, per Vlastimil Babka
> > - Removed extra rcu_read_lock()/rcu_read_unlock() in vma_end_read(),
> > per Vlastimil Babka
> > - Changed __vma_enter_locked() parameter to centralize refcount logic,
> > per Vlastimil Babka
> > - Amended description in vm_lock replacement patch explaining the effec=
ts
> > of the patch on vm_area_struct size, per Vlastimil Babka
> > - Added vm_area_struct member regrouping patch [5] into the series
> > - Renamed vma_copy() into vm_area_init_from(), per Liam R. Howlett
> > - Added a comment for vm_area_struct to update vm_area_init_from() when
> > adding new members, per Vlastimil Babka
> > - Updated a comment about unstable src->shared.rb when copying a vma in
> > vm_area_init_from(), per Vlastimil Babka
> >
> > [1] https://lore.kernel.org/all/20230227173632.3292573-34-surenb@google=
.com/
> > [2] https://lore.kernel.org/all/ZsQyI%2F087V34JoIt@xsang-OptiPlex-9020/
> > [3] https://lore.kernel.org/all/CAJuCfpEisU8Lfe96AYJDZ+OM4NoPmnw9bP53cT=
_kbfP_pR+-2g@mail.gmail.com/
> > [4] https://lore.kernel.org/all/20250109023025.2242447-1-surenb@google.=
com/
> > [5] https://lore.kernel.org/all/20241111205506.3404479-5-surenb@google.=
com/
> >
> > Patchset applies over mm-unstable after reverting v8
> > (current SHA range: 235b5129cb7b - 9e6b24c58985)
> >
> > Suren Baghdasaryan (17):
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
> >   mm: move lesser used vma_area_struct members into the last cacheline
> >   mm/debug: print vm_refcnt state when dumping the vma
> >   mm: remove extra vma_numab_state_init() call
> >   mm: prepare lock_vma_under_rcu() for vma reuse possibility
> >   mm: make vma cache SLAB_TYPESAFE_BY_RCU
> >   docs/mm: document latest changes to vm_lock
> >
> >  Documentation/mm/process_addrs.rst |  44 ++++----
> >  include/linux/mm.h                 | 156 ++++++++++++++++++++++-------
> >  include/linux/mm_types.h           |  75 +++++++-------
> >  include/linux/mmap_lock.h          |   6 --
> >  include/linux/rcuwait.h            |  13 +--
> >  include/linux/refcount.h           |  24 ++++-
> >  include/linux/slab.h               |   6 --
> >  include/linux/types.h              |  12 +++
> >  kernel/fork.c                      | 129 +++++++++++-------------
> >  mm/debug.c                         |  12 +++
> >  mm/init-mm.c                       |   1 +
> >  mm/memory.c                        |  97 ++++++++++++++++--
> >  mm/mmap.c                          |   3 +-
> >  mm/userfaultfd.c                   |  32 +++---
> >  mm/vma.c                           |  23 ++---
> >  mm/vma.h                           |  15 ++-
> >  tools/testing/vma/linux/atomic.h   |   5 +
> >  tools/testing/vma/vma_internal.h   |  93 ++++++++---------
> >  18 files changed, 465 insertions(+), 281 deletions(-)
> >
> > --
> > 2.47.1.613.gc27f4b7a9f-goog
> >
