Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2D33E0C77
	for <linux-doc@vger.kernel.org>; Mon,  1 Jun 2026 17:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780335914; cv=pass; b=j79BCiguHzk93SdUEHk9xKWze2jsI3oQEg+F6sMbDSYGoKZuvqa5bjjx5S2fyUIVFtOX60P2+L+n1o+5+WESDOmrihMEzUs1t+I1Cc1dQZGkGZvLBNHgRsb8o8MSuFPxgiXoIjSle3AEfP8AmVV5tm3QvRXVl/esi2K7dqD5dsY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780335914; c=relaxed/simple;
	bh=b1X1Wus+CRdmVfPWGZGamYBMPYzTklUo5EaQiNtkQw4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BgOLLbVgAo4LU+7ACSvXcnl/NIAv7fh2YT6EHEVddc2s1LO8mU4wkgQoivK9oWagfT6tV/eQNUstkovwS7HfLN5ynqL3vk63SIOxV0242Rnzrg91yBxl5O69qGcibxNc5YmYwoVBtJb03hEoQduMJH1b+2rrxIu24ZlKzg9HcaY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aRGaizGG; arc=pass smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aRGaizGG"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-bebde89cfd3so252620866b.2
        for <linux-doc@vger.kernel.org>; Mon, 01 Jun 2026 10:45:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780335911; cv=none;
        d=google.com; s=arc-20240605;
        b=PlahJkLiCOLkWJIxnmmQIViN+mKXH+aRIPXdUc0jYzNHLWXd5zl5rbqEJUVYy3Y8Dl
         /xe7AlC0Wk1dKuQN7l5fQ8U5mJKh0DQGFl50aZe77K4Wq5A4xWwiV4BXjlVN9M0sAvjH
         O4ezlpkecJemP73Q4uN0v+OWuQtYHGkGsfgOFG7yQeFpH3Hb5YiF7vlp790q7GmjtXpM
         NAdtSxPUnQ16YLciH2iIPUhBhAopgVSoj8VDbDBCu4P3mgv9i7LcN9PPvIGgf3ii0tQi
         GCTY3zktc3ffhZBcAOPCX2CDKq6Ams5W9tFtRoFSkfFcgq3bUiPPYHy21zsRBRV2/1X4
         5vSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zdBZDiQ9N2o+gUmeLxVAthNWp/fmNi0DwM5ZWNlvs8Q=;
        fh=KATZkB7ZQGiyZrcOUoHa++Cu01FnWNEq9kR3y/3r0YY=;
        b=FO/SurUCqBEAAUiyTTlnT9h3yCq+mAcmtOJDS6ElBfgBmiGPJeeKGHjEenY3WdP8JA
         OK3hZ57VbZVc/8lYCRh7OW8DAow4nSf333Tyk+0qzoXYk7maujLctedAq5Pr9pBO4GgQ
         E5ghqI/hHWUGG+qvJzFZ3iDjqyrPDBSvDAVHKI577BaUADX/po1De7dJRAZOF8405vuQ
         tAIWkQsgCZ/1gobZri9PN9hcKFD8PZRrXZMtD/PdYS/V7V4hN9rINUVyUjYQhyFF8no/
         ATzzhInVyRVCDJ5UK3X7cItf0LVE8norEnRBF65LecM409VNC/26Z74w7x61DiwxPj+r
         pxmg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780335911; x=1780940711; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zdBZDiQ9N2o+gUmeLxVAthNWp/fmNi0DwM5ZWNlvs8Q=;
        b=aRGaizGGW9utm+OAF7/91XcRpLUQ9G6XbQCgREzwRnR63v/8HGTgZQgfGWIKZteXes
         2cYap3JTmzWbdjWJR84reTZZE+BOL5RKTdCnDE3qRj6gVaB145rWLK2Uc7Qv3Hm9AQso
         XqiuGT4uCMv0Mkd+zMP46saDywyscGZgS2Bsxz4rP+euAewvEopBHU55HoevmC7gXtor
         FewybKWASpPZo5Q6dVoLnSuSE+GVnwtiCfHMDDZNta7YZMAldheQUAPW7cqwZimbtV3V
         uMxqa0svctAZogHBRUaUDkXFi+fqEurM/eZUSMM15BW6hUSXgbnguoJJqzSRude7PMlK
         rdoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780335911; x=1780940711;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zdBZDiQ9N2o+gUmeLxVAthNWp/fmNi0DwM5ZWNlvs8Q=;
        b=XctrK5Kg3KnMgK6P+Y/G7rXyZ+6rRc/SWcwGcxHdxX9VqUGBOKojjeH3IA1MHEjuQt
         4S6GNO7+/nX4r+w7i4Fc48VpcyT67/7yQmgy7nizsrGbvXEHzo4p4lMk8TImaGjO7P0q
         i4mymhgOSxpgVqbFvvV/caiZJQP9FUjs7EyybgL8fC4lQWDaoqtI3rLctHObG/JdRmRh
         lUuYOCSlr08Vf7q0cbHKty5Wj/NmvxxdHlKJ71WWgSXZfMpraRmJMR8pCuzwEppyAj3T
         8LAFURZChqAQdaOA8H/7n2CMoKm5VvJa7LTKexBAQrXw6gEil5V1XYg4olJJhg4zQN1j
         JB3A==
X-Forwarded-Encrypted: i=1; AFNElJ+AZzdbIHnojLSZLQAFefUS6T9+rV5GIUxeQhcKmJ3750NAVHCe9OK4DVZXPC7HEh7HOQybnRFvCeQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+NHnmAid0VAKJ1wldjSHm/h6hSCQRbZaj62vNUdMXQ4RsBHeJ
	2vDOS2huey7RsH5Wil5EWJku9aTq8c5Zy05pImPV6R0B3M+pODPsGnndcl+iZp0r6A3y1OV+MTB
	XxcxL30IczgB9yjto1AA9TzKCI9ak6Qg=
X-Gm-Gg: Acq92OFp+3NqHXNH1ttGBniVjTFnabDOXqPF9NnMAxnHpv6henHhqKExmWnw+/bRohm
	YpZZmH85amxnRdJ/GNWUXIZVL62z26ua3462B4mlnhVTLFkw/vmG9fNw8vUGVQlkNAFQFUgN40C
	DsiLKX79Hss5OIh9+UnrdVrEeOzN7aS86wvPgjUfpBknceNk9nswM9FB88cVMYkRIVBp7ZkYSM0
	twAl0JBBzmCFTWeGT7+N0NBZ08Pcr9ZFqIWkpMxw7RiRBETouNxj4QnMI9lWtvATVL2PFVjQKI6
	kCvns2wu4R24wWKZiyNkNzM4B5j9KGIrYMFu9fOK+tly4OcXBNU=
X-Received: by 2002:a17:907:d24:b0:bed:83ee:922a with SMTP id
 a640c23a62f3a-bed83ee9b81mr309677466b.16.1780335910507; Mon, 01 Jun 2026
 10:45:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260528212955.1912856-1-nphamcs@gmail.com> <ahz_iYG4lqWL4g-J@KASONG-MC4>
 <CAKEwX=PzMwXXgq=ULAkFD9UqMz+ewLqhKt+xdGxkV7OmA2QG6w@mail.gmail.com>
In-Reply-To: <CAKEwX=PzMwXXgq=ULAkFD9UqMz+ewLqhKt+xdGxkV7OmA2QG6w@mail.gmail.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Tue, 2 Jun 2026 01:44:31 +0800
X-Gm-Features: AVHnY4IUw3nIoySauxI6MLfil3rr6hgOs7Yvxi0fLc_FDWPMh1u4pdIwbMn_l88
Message-ID: <CAMgjq7BhOn48xEyC=2j837R7qddfjeBVHMiRqdx8no4ZEBpBLg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/5] mm, swap: Virtual Swap Space (Swap Table Edition)
To: Nhat Pham <nphamcs@gmail.com>
Cc: Liam.Howlett@oracle.com, akpm@linux-foundation.org, apopple@nvidia.com, 
	axelrasmussen@google.com, baohua@kernel.org, baolin.wang@linux.alibaba.com, 
	bhe@redhat.com, byungchul@sk.com, cgroups@vger.kernel.org, 
	chengming.zhou@linux.dev, chrisl@kernel.org, corbet@lwn.net, david@kernel.org, 
	dev.jain@arm.com, gourry@gourry.net, hannes@cmpxchg.org, hughd@google.com, 
	jannh@google.com, joshua.hahnjy@gmail.com, lance.yang@linux.dev, 
	lenb@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-pm@vger.kernel.org, lorenzo.stoakes@oracle.com, 
	matthew.brost@intel.com, mhocko@suse.com, muchun.song@linux.dev, 
	npache@redhat.com, pavel@kernel.org, peterx@redhat.com, peterz@infradead.org, 
	pfalcato@suse.de, rafael@kernel.org, rakie.kim@sk.com, 
	roman.gushchin@linux.dev, rppt@kernel.org, ryan.roberts@arm.com, 
	shakeel.butt@linux.dev, shikemeng@huaweicloud.com, surenb@google.com, 
	tglx@kernel.org, vbabka@suse.cz, weixugc@google.com, 
	ying.huang@linux.alibaba.com, yosry.ahmed@linux.dev, yuanchu@google.com, 
	zhengqi.arch@bytedance.com, ziy@nvidia.com, kernel-team@meta.com, 
	riel@surriel.com, haowenchao22@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 1, 2026 at 11:57=E2=80=AFPM Nhat Pham <nphamcs@gmail.com> wrote=
:
>
> On Mon, Jun 1, 2026 at 12:34=E2=80=AFAM Kairui Song <ryncsn@gmail.com> wr=
ote:
> >
> > For the format part, PHYS don't need that much bits I think,
> > so by slightly adjust the format vswap device could be share
> > mostly the same format with ordinary device.
> >
> > For example typical modern system don't have a address space larger
> > than 52 bit. (Even with full 64 bits used for addressing, shift it
> > by 12 we get 52). Plus 5 for type, you get 57, so you can have a
> > marker that should work as long as it shorter than 1000000 for PHYS,
> > and shared for all table format since it's not in conflict with
> > anything. You have also use a few extra bits so a single swap space
> > can be 8 times larger than RAM space, and since we can help
> > multiple swap type I think that should be far than enough?
> >
> > Then you have Shadow back at 001, and zero bit in shadow. The only
> > special one is Zswap, which will be 100 now, and that's exactly the
> > reserved pointer format in current swap table format, on seeing
> > si->flags & VSWAP && is_pointer(swp_tb) you know that's zswap :)
>
> Are you suggesting we merge the virtual table with main swap table?
>
> Man, I'd love to do this. There is a problem though - we have a case
> where we occupy both backing physical swap AND swap cache. Do you
> think we can fit both the physical swap slot handle and the swap cache
> PFN into the same slot in virtual table? Maybe with some expanding...?

I don't really get why we would need to do that? If you put the PFN
info in the virtual / upper layer, then the count info, locking, and
all swap IO synchronization (via folio lock), dup (current protected
by ci lock / folio lock), and allocation (folio_alloc_swap), are all
handled in this layer.

The physical / lower layer will just hold a reverse entry on
folio_realloc_swap, or no entry at all (no physical layer used, zswap,
or after swap allocation but before IO) right?

Looking up the actual folio from the physical layer will be a bit
slower since it needs to resolve the reverse entry, but the only place
we need to do that is things like migrate, compaction (none of them
exist yet) which seems totally fine?

> > This could be imporved by per-si percpu cluster. Both YoungJun's
> > tiering and Baoquan's previous swap ops mentioned this is needed,
> > and now vswap also need that. If the vswap is also a si, then it will
> > make use of this too.
>
> Yeah I made the same recommendation when I review swap tier last week:
>
> https://lore.kernel.org/all/CAKEwX=3DN2XcMHN1jatppOk6wnmz-Shab5XMtTtzgYOz=
RvU_6YFw@mail.gmail.com/
>
> I like it, but yeah it will be complicated. That said, I think not
> fixing the fast path for tiering/vswap will seriously restrict their
> usefulness. We don't want to go back to the old swap allocator days :)

Thanks. Not too complicated, actually our internal kernel
implementation still using si->percpu cluster, and use a counter for
the rotation and each order have a counter :P, it's a bit ugly but
works fine. It still serves pretty well just like the global percpu
cluster, YoungJun's previous per ci percpu cluster also still provides
the fast path, many ways to do that.

>
> >
> > YoungJun posted this a few month before:
> > https://lore.kernel.org/linux-mm/20260131125454.3187546-5-youngjun.park=
@lge.com/
> >
> > The concern is that some locking contention could be heavier, or maybe
> > that's just a hypothetical problem though.
>
> I don't think it's hypothetical. At least with vswap, it's very easy
> to get into a state where the shared per-cpu cache gets invalidated
> constantly if phys swap and vswap allocation alternates (which is
> actually very possible under heavy memory pressure), hammering the
> slow paths...

I mean if the per-cpu cache is moved to si level, then whoever enters
the allocation path of a si will almost always get a stable percpu
cache to use, even if the last used si changes.

We might better have a more explicit per si fast path for that. The
plist rotation should better be done in a different (will be even
better if lockless) way.

>
> >
> > >
> > > - Runtime enable/disable of the vswap device. To be honest, I don't
> > >   know if there is a value in this. My preference is vswap can be
> > >   optimized to the point that any overhead is negligible. Failing tha=
t,
> > >   maybe we can come up with some simple heuristics that automatically
> > >   decides for users?
> > >
> > >   In this RFC, CONFIG_VSWAP=3Dy means the vswap device is always crea=
ted at
> > >   boot, and CONFIG_VSWAP=3Dn means the vswap device is never created.=
 This
> > >   *might* be enough just on its own.
> > >
> > >   Is a runtime knob (sysfs or sysctl) worth the complexity beyond
> > >   these heuristics? I'm not sure yet. Maintaining both cases
> >
> > I checked the code and I think it's not hard to do, patch 1 already
> > handling the meta data dynamically, everything will still just work
> > even if you remove vswap at runtime. The rest of patches need adaption
> > but might not end up being complex, it other comments here
> > are considered.
>
> Yeah, it's not terribily hard to do. I'm more wondering if it's worth
> the effort, both for the implementer and the user :)
>
> As I said here, if we want vswap, just enable it at boot time and get
> a vast (but dynamic) device. We can make it optional per-cgroup
> through Youngjun's interface, and that would be good enough?
>
> >
> > For patch 2, a few routines like vswap_can_swapin_thp seems not
> > needed or should be moved to __swap_cache_alloc? VSWAP_FOLIO is
> > same as swap cache folio check, which is already covered. Same for
> > zero checking, and VSWAP_NONE which is same as swap count check
> > I think. That way we not only save a lot of code, we also no
> > longer need to treat vswap specially.
>
> Unfortunately, I think a lot of this complexity is still needed. Vswap
> adds a new layer, which means new complications :)
>
> For instance, I think you still need vswap_can_swapin_thp. It
> basically enforces that the backend must be something
> swap_read_folio() can handle. That means:
>
> 1. No zswap.
>
> 2. No mixed backend.

If mixed backend means phys vs zero vs zswap, then we already have
part of that covered with the current swap cache except for the phys
part (zswap part seems very doable with fujunjie's work).
swap_cache_alloc_folio will ensure there is no mixed zerobit, it can
be easily extended to ensure there is no mixed zswap as well
(according to what I've learned from fujunjie's code). Similar logic
for phys detection I think.

> > For memcg table allocation, on demand seems a good idea, and actually
> > we are not far from there, I tried to generalize the
> > alloc-then-retry-sleep-alloc in swap_alloc_table but still not generic
> > enough I guess.. Good new is the allocation of the table is already
> > kind of ondemand, just need to split the detection of these two kind
> > of table.
>
> I have a prototype of this, but I have not tested, so I do not want to
> send it out. :)
>
> TLDR is - I still want to record the memcg for vswap (just not charge
> it towards the counter). So we still need memcg_table at both level,
> generally - just not allocating until needed (basically if a physical
> swap slot in the cluster is directly mapped into PTE). You can kinda
> tell, since you pass the folio into the allocation path - with some
> care you can distinguish between:
>
> 1. Virtual swap, or directly maped physical swap -> need memcg_table
>
> 2. Physical swap, backing vswap -> does not memcg_table.
>
> Another alternative is you can defer this allocation until the point
> where you have to do the charging action. But then you have to be
> careful with failure handling, and need to backoff ya di da di da.
> Funsies.
>
> I think I did a mixed of these 2 strategies. Anyway, I'll include the
> patch in v2 (if folks like this approach).
>
> >
> > Mean while I also remember we once discussed about splitting the
> > accounting for vswap / physical swap? If we went that approach we
> > don't need to treat memcg_table specially.
>
> For the charging behavior, I already have a patch for it actually in
> this series (just not the dynamic allocation of the memcg_table field
> yet).
>
> Basically:
>
> 1. For vswap entry, not backed by phys swap: record swap memcg, hold
> reference to pin the memcg, but not charging towards swap.current.

Maybe you don't need to record memcg here since folio->memcg already
have that info?

I previously had a patch:
https://lore.kernel.org/linux-mm/20260220-swap-table-p4-v1-7-104795d19815@t=
encent.com/

The defers the recording of memcg, the behavior is almost identical to
before, but charging & recording should be cleaner and you don't need
to record memcg at allocation time hence maybe reduce the possibility
of pinning a memcg. I didn't include that in P4 just to reduce LOC,
maybe can be resent or included.

> 2. For phys swap backing vswap: charging towards swap.current, but
> does not record the memcg in its memcg_table, nor does it hold
> reference to memcg (its vswap entry holds the reference already)
>
> 2. For phys swap directly mapped to PTE: charges, records, and holds refe=
rence.
>
> The motivation here is I do not want vswap entry to shares the same
> limit as phys swap counter. If we think of it as "infinite" or
> "dynamic", it should not be capped at all, but even if it is charged,
> it should be something separate.

Good to know, it's not too messy to make everything dynamic, but if
our ultimate goal is to account for them separately, maybe we can save
some effort here.

>
> >
> > > - Widen swap_info_struct->max to unsigned long. The vswap device's
> > >   max is currently clamped to ALIGN_DOWN(UINT_MAX, SWAPFILE_CLUSTER)
> > >   (~16 TiB) to fit in unsigned int. 16 TiB is small for vswap,
> > >   especially when we're getting increasingly big machines memory-wise=
.
> >
> > This should be very easy to do, just replace unsigned int with
> > unsigned long, a lot of place to touch though :)
>
> Agree. I'm just lazy, and this sounds like a simple patch as a
> follow-up. This RFC is already 2000 LoCs - I do not want to burden
> reviewers with extra useless details :)

No problem, good to see progress here :)
