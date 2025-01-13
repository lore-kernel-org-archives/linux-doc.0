Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5B41CD210
	for <linux-doc@vger.kernel.org>; Mon, 13 Jan 2025 19:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736794828; cv=none; b=lJsGF6AVaZj2p/8VgECSVgaR0iR6b/3RX71C8EW7/72EdhT/FrXI+JInghUMDGcyju57GQTRZbWOEQzgx/7FzaslipV4+qDSzLQEZkECZvMa9ZPHOMiP5IbYmFv5Q0/R1pyWtxfotuFrMGAX3w8EcFcfVrOEGHqfnP0awv19qVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736794828; c=relaxed/simple;
	bh=Uk8bHfgtYjEjUNXGTgw5n/3M1iC0/QUU9h7O3uED9fc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SQUeQmUZCRLQEBNXDD4u0NpdFydB45AivrXJ8HWkAu8jDfIXbgvaF+I+XMUbSSu58iJ2T0bqD/juf+9OSy9bWIvT9ODRc9knx4mIO/n7JsNDcydCttBlh2uWFMOkcivLLRMAFdRPP7rrbB02UdNoNwfyoYjbS/eSe+2vb6mKNeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xKffSBeZ; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xKffSBeZ"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-467abce2ef9so25541cf.0
        for <linux-doc@vger.kernel.org>; Mon, 13 Jan 2025 11:00:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736794819; x=1737399619; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ouVlFUZRREhIoHjGwLjVd+KkkJaABABdY0WLsWGy1pI=;
        b=xKffSBeZt8BaiG+/21Df/w2NrlO0GDXb23n/hEQXjRdJlUpXDq+y0RX5YpC9tCeulA
         QT/FooAf+JhwgtRTt/IG560sorX+8TAnhUQIYv3ov9IkDfE4gyhZscqGlF7PstmAL60w
         oavDi17qthBTQVdLHWIkrqAztG2R01QMdmaak5m/STWJHkkiLiNYy1rE5xrYVV39o1Td
         yqm1d3MXPLUADAYTE4QhIGRwrdFNGFKFVA0gaHeWZQCGeaWgUX9x0w60EjMkrj7QKtrC
         v8mjt7XR4A7FztXsyo5WP3+RVh3sq+ghO7/VNwKoWOnDc1bqLn3bkdxU4mjHLJu6L2dh
         sKiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736794819; x=1737399619;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ouVlFUZRREhIoHjGwLjVd+KkkJaABABdY0WLsWGy1pI=;
        b=uxWlGHn7GFO5dTmwrofEoqsPOOl3+Y8qJVH16nTH+uf23T2k6klwlN8712Kdo+0XvE
         VAs1aHnForEfqX3jkAn1BC1Ac5F4MJ06qU9wuzNN1FazzqLNxcKf9nWSaKAw5Pyyp4MV
         YH8knSSWJM0LNNck9QHWpbomCMJ3Hrv8Yi+WorMYFo+dCjwRouZifjrKspAJHzVpA4CC
         8sxHxMqk+jI99yW86NzI30xZNXhGMBZHsjInsFHeDRX4/pVnLXeh8g0PiUaM/MemySMn
         oVgJhmFqc7yd6MIhG7jVsPeI3UdUblJEbSUdf0bKrzHe+7InePcdu6wx4AwcMcrBBmvS
         tFMg==
X-Forwarded-Encrypted: i=1; AJvYcCU+PvEAGx4Sfe946lKiqGOBirGiCFOSce+Zpf3vjnYnmhlg86TNGKOyT8+lW7Lww2/ekQUyyG3d6k4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZbYwcafJO3ogQYs3IlwJRX5ws4pbKqy3pAKU6+8ZavCTvJfuv
	eZ5kHxHxiBKAADzl3HYNIBKZyRliL4s2pYWUwgHT8sIRdbRIne0RulT6EpYwDcn5eMj8uI0x5i5
	KFMe8D1wGhEx/02wOGS5nsl5lPazmnI/ZrVbs
X-Gm-Gg: ASbGncseCnSKZ9XTvsQCMI55K//X6S8eydQciLrj6eousNfUpu6cwPy1CYQRVFherdr
	UXJzZm7XwAAX+6U50pYGkWggu82gXEAnS+Qh+IA==
X-Google-Smtp-Source: AGHT+IFiFwIAJreck2eXuGVLCOpCUJxrqm617YL59uzixOqSrS1FvAoVIadqd4lHXuvB/ws5gDgj75RK3fW/jzook1c=
X-Received: by 2002:ac8:5d50:0:b0:466:7926:c69 with SMTP id
 d75a77b69052e-46de97879d8mr46011cf.20.1736794818718; Mon, 13 Jan 2025
 11:00:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250111042604.3230628-1-surenb@google.com> <f5e26a57-ec77-4df8-8b4f-5a718a046894@lucifer.local>
 <CAJuCfpEf4SZVCH+HfJsvJLbvvMFnm0tyh0P1YwjMeYk-nP0RdA@mail.gmail.com> <5aecdfec-5939-4627-a27b-f2057a95fb65@lucifer.local>
In-Reply-To: <5aecdfec-5939-4627-a27b-f2057a95fb65@lucifer.local>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 13 Jan 2025 11:00:07 -0800
X-Gm-Features: AbW1kvbdq65ih4O_ouYS9lC3SM0GkRt4MwWyHNynzPPrbMuh3Qv-A3rG0pdfQLU
Message-ID: <CAJuCfpH-tj-=_E1rjt+WTVWffY3hH0sAkeORB4oZos13CwJMkA@mail.gmail.com>
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

On Mon, Jan 13, 2025 at 9:11=E2=80=AFAM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> On Mon, Jan 13, 2025 at 08:58:37AM -0800, Suren Baghdasaryan wrote:
> > On Mon, Jan 13, 2025 at 4:14=E2=80=AFAM Lorenzo Stoakes
> > <lorenzo.stoakes@oracle.com> wrote:
> > >
> > > A nit on subject, I mean this is part of what this series does, and h=
ey -
> > > we have only so much text to put in here - but isn't this both
> > > reimplementing per-VMA lock as a refcount _and_ importantly allocatin=
g VMAs
> > > using the RCU typesafe mechanism?
> > >
> > > Do we have to do both in one series? Can we split this out? I mean ma=
ybe
> > > that's just churny and unnecessary, but to me this series is 'allocat=
e VMAs
> > > RCU safe and refcount VMA lock' or something like this. Maybe this is
> > > nitty... but still :)
> >
> > There is "motivational dependency" because one of the main reasons I'm
> > converting the vm_lock into vm_refcnt is to make it easier to add
> > SLAB_TYPESAFE_BY_RCU (see my last reply to Hillf). But technically we
> > can leave the SLAB_TYPESAFE_BY_RCU out of this series if that makes
> > thighs easier. That would be the 2 patches at the end:
>
> Right yeah... maybe it's better to do it in one hit.
>
> >
> > mm: prepare lock_vma_under_rcu() for vma reuse possibility
> > mm: make vma cache SLAB_TYPESAFE_BY_RCU
> >
> > I made sure that each patch is bisectable, so there should not be a
> > problem with tracking issues.
> >
> > >
> > > One general comment here - this is a really major change in how this =
stuff
> > > works, and yet I don't see any tests anywhere in the series.
> >
> > Hmm. I was diligently updating the tests to reflect the replacement of
> > vm_lock with vm_refcnt and adding assertions for detach/attach cases.
> > This actually reminds me that I missed updading vm_area_struct in
> > vma_internal.h for the member regrouping patch; will add that. I think
> > the only part that did not affect tests is SLAB_TYPESAFE_BY_RCU but I
> > was not sure what kind of testing I can add for that. Any suggestions
> > would be welcomed.
>
> And to be clear I'm super grateful you did that :) thanks, be good to
> change the member regrouping thing also.
>
> But that doesn't change the fact that this series has exactly zero tests
> for it. And for something so broad, it feels like a big issue, we really
> want to be careful with something so big here.
>
> You've also noticed that I've cleverly failed to _actually_ suggest
> SLAB_TYPESAFE_BY_RCU tests, and mea culpa - it's super hard to think of h=
ow
> to test that.
>
> Liam has experience doing RCU testing this for the maple tree stuff, but =
it
> wasn't pretty and wasn't easy and would probably require massive rework t=
o
> expose this stuff to some viable testing environment, or in other words -
> is unworkable.
>
> HOWEVER, I feel like maybe we could try to create scenarios where we migh=
t
> trigger reuse bugs?
>
> Perhaps some userland code, perhaps even constrained by cgroup, that maps=
 a
> ton of stuff and unmaps in a loop in parallel?
>
> Perhaps create scenarios with shared memory where we up refcounts a lot t=
oo?

I have this old spf_test
(https://github.com/surenbaghdasaryan/spf_test/blob/main/spf_test.c)
which I often use to weed out vma locking issues because it starts
multiple threads doing mmap + page faults. Perhaps we can repackage it
into a test/benchmark for testing contention on mmap/vma locks?

>
> Anyway, this is necessarily nebulous without further investigation, what =
I
> was thinking more concretely is:
>
> Using the VMA userland testing:
>
> 1. Assert reference count correctness across locking scenarios and variou=
s
>    VMA operations.
> 2. Assert correct detached/not detached state across different scenarios.
>
> This won't quite be complete as not everything is separated out quite
> enough to allow things like process tear down/forking etc. to be explicit=
ly
> tested but you can unit tests the VMA bits at least.
>
> One note on this, I intend to split the vma.c file into multiple files in
> tools/testing/vma/ so if you add tests here it'd be worth probably puttin=
g
> them into a new file.
>
> I'm happy to help with this if you need any assistance, feel free to ping=
!

As a starting point I was thinking of changing
vma_assert_attached()/vma_assert_detached() and
vma_mark_attached()/vma_mark_detached() to return a bool and use
WARN_ON_ONCE() (to address your concern about asserts being dependent
on CONFIG_DEBUG_VM) like this:

static inline bool vma_assert_detached()
{
    return !WARN_ON_ONCE(atomic_read(&vma->vm_refcnt));
}

static inline bool vma_mark_attached(struct vm_area_struct *vma)
{
    vma_assert_write_locked(vma);
    if (!vma_assert_detached(vma))
        return false;

    atomic_set(&vma->vm_refcnt, 1);
    return true;
}

With that we can add correctness checks in the tools/testing/vma/vma.c
for different states, for example in the alloc_and_link_vma() we can
check that after vma_link() the vma is indeed attached:

ASSERT_TRUE(vma_assert_attached(vma));

This might not cover all states but is probably a good starting point. WDYT=
?

>
> Sorry to put this on you so late in the series, I realise it's annoying,
> but I feel like things have changed a lot and obviously aggregated with t=
wo
> series in one in effect and these are genuine concerns that at this stage=
 I
> feel like we need to try to at least make some headway on.
>
> >
> > >
> > > I know it's tricky to write tests for this, but the new VMA testing
> > > environment should make it possible to test a _lot_ more than we prev=
iously
> > > could.
> > >
> > > However due to some (*ahem*) interesting distribution of where functi=
ons
> > > are, most notably stuff in kernel/fork.c, I guess we can't test
> > > _everything_ there effectively.
> > >
> > > But I do feel like we should be able to do better than having absolut=
ely no
> > > testing added for this?
> >
> > Again, I'm open to suggestions for SLAB_TYPESAFE_BY_RCU testing but
> > for the rest I thought the tests were modified accordingly.
>
> See above ^
>
> >
> > >
> > > I think there's definitely quite a bit you could test now, at least i=
n
> > > asserting fundamentals in tools/testing/vma/vma.c.
> > >
> > > This can cover at least detached state asserts in various scenarios.
> >
> > Ok, you mean to check that VMA re-attachment/re-detachment would
> > trigger assertions? I'll look into adding tests for that.
>
> Yeah this is one, see above :)
>
> >
> > >
> > > But that won't cover off the really gnarly stuff here around RCU slab
> > > allocation, and determining precisely how to test that in a sensible =
way is
> > > maybe less clear.
> > >
> > > But I'd like to see _something_ here please, this is more or less
> > > fundamentally changing how all VMAs are allocated and to just have no=
thing
> > > feels unfortunate.
> >
> > Again, I'm open to suggestions on what kind of testing I can add for
> > SLAB_TYPESAFE_BY_RCU change.
>
> See above
>
> >
> > >
> > > I'm already nervous because we've hit issues coming up to v9 and we'r=
e not
> > > 100% sure if a recent syzkaller is related to these changes or not, I=
'm not
> > > sure how much we can get assurances with tests but I'd like something=
.
> >
> > If you are referring to the issue at [1], I think David ran the
> > syzcaller against mm-stable that does not contain this patchset and
> > the issue still triggered (see [2]). This of course does not guarantee
> > that this patchset has no other issues :) I'll try adding tests for
> > re-attaching, re-detaching and welcome ideas on how to test
> > SLAB_TYPESAFE_BY_RCU transition.
> > Thanks,
> > Suren.
>
> OK that's reassuring!
>
> >
> > [1] https://lore.kernel.org/all/6758f0cc.050a0220.17f54a.0001.GAE@googl=
e.com/
> > [2] https://lore.kernel.org/all/67823fba.050a0220.216c54.001c.GAE@googl=
e.com/
> >
> > >
> > > Thanks!
> > >
> > > On Fri, Jan 10, 2025 at 08:25:47PM -0800, Suren Baghdasaryan wrote:
> > > > Back when per-vma locks were introduces, vm_lock was moved out of
> > > > vm_area_struct in [1] because of the performance regression caused =
by
> > > > false cacheline sharing. Recent investigation [2] revealed that the
> > > > regressions is limited to a rather old Broadwell microarchitecture =
and
> > > > even there it can be mitigated by disabling adjacent cacheline
> > > > prefetching, see [3].
> > > > Splitting single logical structure into multiple ones leads to more
> > > > complicated management, extra pointer dereferences and overall less
> > > > maintainable code. When that split-away part is a lock, it complica=
tes
> > > > things even further. With no performance benefits, there are no rea=
sons
> > > > for this split. Merging the vm_lock back into vm_area_struct also a=
llows
> > > > vm_area_struct to use SLAB_TYPESAFE_BY_RCU later in this patchset.
> > > > This patchset:
> > > > 1. moves vm_lock back into vm_area_struct, aligning it at the cache=
line
> > > > boundary and changing the cache to be cacheline-aligned to minimize
> > > > cacheline sharing;
> > > > 2. changes vm_area_struct initialization to mark new vma as detache=
d until
> > > > it is inserted into vma tree;
> > > > 3. replaces vm_lock and vma->detached flag with a reference counter=
;
> > > > 4. regroups vm_area_struct members to fit them into 3 cachelines;
> > > > 5. changes vm_area_struct cache to SLAB_TYPESAFE_BY_RCU to allow fo=
r their
> > > > reuse and to minimize call_rcu() calls.
> > > >
> > > > Pagefault microbenchmarks show performance improvement:
> > > > Hmean     faults/cpu-1    507926.5547 (   0.00%)   506519.3692 *  -=
0.28%*
> > > > Hmean     faults/cpu-4    479119.7051 (   0.00%)   481333.6802 *   =
0.46%*
> > > > Hmean     faults/cpu-7    452880.2961 (   0.00%)   455845.6211 *   =
0.65%*
> > > > Hmean     faults/cpu-12   347639.1021 (   0.00%)   352004.2254 *   =
1.26%*
> > > > Hmean     faults/cpu-21   200061.2238 (   0.00%)   229597.0317 *  1=
4.76%*
> > > > Hmean     faults/cpu-30   145251.2001 (   0.00%)   164202.5067 *  1=
3.05%*
> > > > Hmean     faults/cpu-48   106848.4434 (   0.00%)   120641.5504 *  1=
2.91%*
> > > > Hmean     faults/cpu-56    92472.3835 (   0.00%)   103464.7916 *  1=
1.89%*
> > > > Hmean     faults/sec-1    507566.1468 (   0.00%)   506139.0811 *  -=
0.28%*
> > > > Hmean     faults/sec-4   1880478.2402 (   0.00%)  1886795.6329 *   =
0.34%*
> > > > Hmean     faults/sec-7   3106394.3438 (   0.00%)  3140550.7485 *   =
1.10%*
> > > > Hmean     faults/sec-12  4061358.4795 (   0.00%)  4112477.0206 *   =
1.26%*
> > > > Hmean     faults/sec-21  3988619.1169 (   0.00%)  4577747.1436 *  1=
4.77%*
> > > > Hmean     faults/sec-30  3909839.5449 (   0.00%)  4311052.2787 *  1=
0.26%*
> > > > Hmean     faults/sec-48  4761108.4691 (   0.00%)  5283790.5026 *  1=
0.98%*
> > > > Hmean     faults/sec-56  4885561.4590 (   0.00%)  5415839.4045 *  1=
0.85%*
> > > >
> > > > Changes since v8 [4]:
> > > > - Change subject for the cover letter, per Vlastimil Babka
> > > > - Added Reviewed-by and Acked-by, per Vlastimil Babka
> > > > - Added static check for no-limit case in __refcount_add_not_zero_l=
imited,
> > > > per David Laight
> > > > - Fixed vma_refcount_put() to call rwsem_release() unconditionally,
> > > > per Hillf Danton and Vlastimil Babka
> > > > - Use a copy of vma->vm_mm in vma_refcount_put() in case vma is fre=
ed from
> > > > under us, per Vlastimil Babka
> > > > - Removed extra rcu_read_lock()/rcu_read_unlock() in vma_end_read()=
,
> > > > per Vlastimil Babka
> > > > - Changed __vma_enter_locked() parameter to centralize refcount log=
ic,
> > > > per Vlastimil Babka
> > > > - Amended description in vm_lock replacement patch explaining the e=
ffects
> > > > of the patch on vm_area_struct size, per Vlastimil Babka
> > > > - Added vm_area_struct member regrouping patch [5] into the series
> > > > - Renamed vma_copy() into vm_area_init_from(), per Liam R. Howlett
> > > > - Added a comment for vm_area_struct to update vm_area_init_from() =
when
> > > > adding new members, per Vlastimil Babka
> > > > - Updated a comment about unstable src->shared.rb when copying a vm=
a in
> > > > vm_area_init_from(), per Vlastimil Babka
> > > >
> > > > [1] https://lore.kernel.org/all/20230227173632.3292573-34-surenb@go=
ogle.com/
> > > > [2] https://lore.kernel.org/all/ZsQyI%2F087V34JoIt@xsang-OptiPlex-9=
020/
> > > > [3] https://lore.kernel.org/all/CAJuCfpEisU8Lfe96AYJDZ+OM4NoPmnw9bP=
53cT_kbfP_pR+-2g@mail.gmail.com/
> > > > [4] https://lore.kernel.org/all/20250109023025.2242447-1-surenb@goo=
gle.com/
> > > > [5] https://lore.kernel.org/all/20241111205506.3404479-5-surenb@goo=
gle.com/
> > > >
> > > > Patchset applies over mm-unstable after reverting v8
> > > > (current SHA range: 235b5129cb7b - 9e6b24c58985)
> > > >
> > > > Suren Baghdasaryan (17):
> > > >   mm: introduce vma_start_read_locked{_nested} helpers
> > > >   mm: move per-vma lock into vm_area_struct
> > > >   mm: mark vma as detached until it's added into vma tree
> > > >   mm: introduce vma_iter_store_attached() to use with attached vmas
> > > >   mm: mark vmas detached upon exit
> > > >   types: move struct rcuwait into types.h
> > > >   mm: allow vma_start_read_locked/vma_start_read_locked_nested to f=
ail
> > > >   mm: move mmap_init_lock() out of the header file
> > > >   mm: uninline the main body of vma_start_write()
> > > >   refcount: introduce __refcount_{add|inc}_not_zero_limited
> > > >   mm: replace vm_lock and detached flag with a reference count
> > > >   mm: move lesser used vma_area_struct members into the last cachel=
ine
> > > >   mm/debug: print vm_refcnt state when dumping the vma
> > > >   mm: remove extra vma_numab_state_init() call
> > > >   mm: prepare lock_vma_under_rcu() for vma reuse possibility
> > > >   mm: make vma cache SLAB_TYPESAFE_BY_RCU
> > > >   docs/mm: document latest changes to vm_lock
> > > >
> > > >  Documentation/mm/process_addrs.rst |  44 ++++----
> > > >  include/linux/mm.h                 | 156 ++++++++++++++++++++++---=
----
> > > >  include/linux/mm_types.h           |  75 +++++++-------
> > > >  include/linux/mmap_lock.h          |   6 --
> > > >  include/linux/rcuwait.h            |  13 +--
> > > >  include/linux/refcount.h           |  24 ++++-
> > > >  include/linux/slab.h               |   6 --
> > > >  include/linux/types.h              |  12 +++
> > > >  kernel/fork.c                      | 129 +++++++++++-------------
> > > >  mm/debug.c                         |  12 +++
> > > >  mm/init-mm.c                       |   1 +
> > > >  mm/memory.c                        |  97 ++++++++++++++++--
> > > >  mm/mmap.c                          |   3 +-
> > > >  mm/userfaultfd.c                   |  32 +++---
> > > >  mm/vma.c                           |  23 ++---
> > > >  mm/vma.h                           |  15 ++-
> > > >  tools/testing/vma/linux/atomic.h   |   5 +
> > > >  tools/testing/vma/vma_internal.h   |  93 ++++++++---------
> > > >  18 files changed, 465 insertions(+), 281 deletions(-)
> > > >
> > > > --
> > > > 2.47.1.613.gc27f4b7a9f-goog
> > > >
