Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A63AA241695
	for <linux-doc@vger.kernel.org>; Wed, 29 Oct 2025 21:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761772253; cv=none; b=qo+j07gwzv3xAY2N9ndUsBmBKH9LKo9SktW23dvUaHki/+dQl6HZfnxtkC20TXwPvebH87KYt8U+rSc7WeSbc4TJhAZm72ihhJBYIQ5hooMF2Noq89R9ApaavHi6TwPcx40dExysRi1SkgXkIQ3aZctXudx4nd1/2bJd3M4pox4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761772253; c=relaxed/simple;
	bh=DEqsM77RjN9n8i/CaQqgFXbPhwvjxKLUi4ap91xbIDw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=slGaAi3tVWv6fCzRxV1ZObtfu8O+KER0PMvKSgF2CINXAXF+l7raFstqKh/VBkmEqFlzJQ+YiibMCKfKZ2kfgXgtO0IwboAaGwdUKxda5ofOYgxLmGe6RAYxj3RU1TjYm1xKah4BZGig2hgm9ZTuaM/viRN2veahuu3DgRar7ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Al7lhu05; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Al7lhu05"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761772250;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=avdi1SDxRzcVG3w1/eurHaCf3/7WeJ6JAjuETAbD6Cs=;
	b=Al7lhu05cLhKyu4vlnOYLgjIz0VdYHOZJvHJtgZuJ5eMoA3NpmrvHsDqVRGAkaj7kd3oS6
	AMdfpjtD/5agcsFMBaEeqPbuaW5938qQ+5n0B/iQSx4qEbNhKtQOzudZd0v00q7T2o4Pkz
	JnKbyjFYCr7BEwdQpHEfQNPYnjqtoZI=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-622-p9YWXMtjPUSyYEM3FT3gmQ-1; Wed, 29 Oct 2025 17:10:49 -0400
X-MC-Unique: p9YWXMtjPUSyYEM3FT3gmQ-1
X-Mimecast-MFC-AGG-ID: p9YWXMtjPUSyYEM3FT3gmQ_1761772248
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-37773b477c6so1073181fa.2
        for <linux-doc@vger.kernel.org>; Wed, 29 Oct 2025 14:10:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761772247; x=1762377047;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=avdi1SDxRzcVG3w1/eurHaCf3/7WeJ6JAjuETAbD6Cs=;
        b=E/xJvDVYBu1iAyaC3Zy4lhhmXNaAzL4lq3ktdrC/XJwtd1R4xOvAMcAay1mc+dB/bY
         xyrEC0/RdWQElRQ8zC0T/PphPZ4aS+AgmkLnZ/7iont0CYGPq4ygnodGyKejNy7U17TV
         0E0VF3h9Reu67vRt8Yrmu9P/TSPWQ2nUa5Dcy3jAxVwYjVJ35cRYlQlliv6EjswK5A6k
         VBwWIOuVEWHyJQQ1/h/1YIPn+Te/T4Jw7PueYmU/zNK//+NpFIKmv8/zfssT+jtb+Q00
         fXDn3Me8w4k1R1GW3b6s6oHv/5raqzBMayMooku/kSZ5M56G8itdKWwd9JgpQNCCIo1+
         nJOA==
X-Forwarded-Encrypted: i=1; AJvYcCXVSRtkrNnjirxXi0B3pAFnjwqaVji99GrIc5Tf8ZA3D68bGo06b1qPG3ka4xcJsPQAXhM6B4UPu1Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNgLRsvqITPGBbVDaL4ts/He+goM4y47x8XRZn+FE47mJoGrhU
	e+g1wRCj5L2IW+/yDRVUNxP7V1sc7kKaU9juSeam5GJLMfYo1r7ECTOcOJFNs3NNmWnq8JGVatu
	e8H7+xXsD7nWrrVsoe3C2x8DjRMwgk3ZTZIfzPbgfUKvHNlRTSBTQQe3Thg1orN9nv7I2K/F4Sl
	SSFg5k+C1wwJriNo2svx6ryNOSmmlFupY5ldQW
X-Gm-Gg: ASbGncscuVbxivvKlPAt0saaWpMYARTaTdgQmTA57VrXmaXTg0pqRMZ/0PjaNHbQaiE
	JKUrzj8rMXGrmUHih6XGGgQW7KMkIo6Uiqht8SwfYODkj4R1/OKuBqtyJqRVns23RTbfDdDnoG1
	3ALP5V4qkg47ElglGLulPRRt7+F39neXDVUfh1Zh8vLLeq2Ym+XG/v+Bu4X6TWAS2joIwORQ==
X-Received: by 2002:a05:651c:1107:10b0:36f:4c94:b583 with SMTP id 38308e7fff4ca-37a052cfe5emr11314261fa.16.1761772247358;
        Wed, 29 Oct 2025 14:10:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHx30FcSE7653NJNEG/awVid+z8H5190kU3yQFYjauIhANLUFAhYgtBHdEMhlV44DmBq+JFhA98wGc4dv9PI4Y=
X-Received: by 2002:a05:651c:1107:10b0:36f:4c94:b583 with SMTP id
 38308e7fff4ca-37a052cfe5emr11314031fa.16.1761772246842; Wed, 29 Oct 2025
 14:10:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251022183717.70829-1-npache@redhat.com> <20251022183717.70829-7-npache@redhat.com>
 <5f8c69c1-d07b-4957-b671-b37fccf729f1@lucifer.local> <063f8369-96c7-4345-ab28-7265ed7214cb@linux.alibaba.com>
 <9a3f2d8d-abd1-488c-8550-21cd12efff3e@lucifer.local> <e2a89e74-1533-4a83-8d0f-3f4821750e25@redhat.com>
 <64b9a6cd-d2e4-4142-bf41-abe80bf1f61a@lucifer.local> <dc002ef9-53ee-4466-b963-baadfd5162b7@redhat.com>
 <a97780ab-6256-43b7-8c0a-80ecbdc3d52d@lucifer.local> <2d8ed924-6d06-42e4-a876-381fb331f926@redhat.com>
 <3d6c013c-5592-4bb8-b438-e29787b1ab48@lucifer.local>
In-Reply-To: <3d6c013c-5592-4bb8-b438-e29787b1ab48@lucifer.local>
From: Nico Pache <npache@redhat.com>
Date: Wed, 29 Oct 2025 15:10:19 -0600
X-Gm-Features: AWmQ_bkZvIDA2jjMvnu1DvkEOw51bJxTkNORzbWV2_C6vMtJ7P55tMuec_GXDEA
Message-ID: <CAA1CXcCtrgCqYg+WzJv9ZJs1FKcpRWLy3QL3T2E4_5m-CRT9zQ@mail.gmail.com>
Subject: Re: [PATCH v12 mm-new 06/15] khugepaged: introduce
 collapse_max_ptes_none helper function
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: David Hildenbrand <david@redhat.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-doc@vger.kernel.org, ziy@nvidia.com, 
	Liam.Howlett@oracle.com, ryan.roberts@arm.com, dev.jain@arm.com, 
	corbet@lwn.net, rostedt@goodmis.org, mhiramat@kernel.org, 
	mathieu.desnoyers@efficios.com, akpm@linux-foundation.org, baohua@kernel.org, 
	willy@infradead.org, peterx@redhat.com, wangkefeng.wang@huawei.com, 
	usamaarif642@gmail.com, sunnanyong@huawei.com, vishal.moola@gmail.com, 
	thomas.hellstrom@linux.intel.com, yang@os.amperecomputing.com, kas@kernel.org, 
	aarcange@redhat.com, raquini@redhat.com, anshuman.khandual@arm.com, 
	catalin.marinas@arm.com, tiwai@suse.de, will@kernel.org, 
	dave.hansen@linux.intel.com, jack@suse.cz, cl@gentwo.org, jglisse@google.com, 
	surenb@google.com, zokeefe@google.com, hannes@cmpxchg.org, 
	rientjes@google.com, mhocko@suse.com, rdunlap@infradead.org, hughd@google.com, 
	richard.weiyang@gmail.com, lance.yang@linux.dev, vbabka@suse.cz, 
	rppt@kernel.org, jannh@google.com, pfalcato@suse.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 29, 2025 at 12:42=E2=80=AFPM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> On Wed, Oct 29, 2025 at 04:04:06PM +0100, David Hildenbrand wrote:
> > > >
> > > > No creep, because you'll always collapse.
> > >
> > > OK so in the 511 scenario, do we simply immediately collapse to the l=
argest
> > > possible _mTHP_ page size if based on adjacent none/zero page entries=
 in the
> > > PTE, and _never_ collapse to PMD on this basis even if we do have suf=
ficient
> > > none/zero PTE entries to do so?
> >
> > Right. And if we fail to allocate a PMD, we would collapse to smaller s=
izes,
> > and later, once a PMD is possible, collapse to a PMD.
> >
> > But there is no creep, as we would have collapsed a PMD right from the =
start
> > either way.
>
> Hmm, would this mean at 511 mTHP collapse _across zero entries_ would onl=
y
> ever collapse to PMD, except in cases where, for instance, PTE entries
> belong to distinct VMAs and so you have to collapse to mTHP as a result?

There are a few failure cases, like exceeding thresholds, or
allocations failures, but yes your assessment is correct.

At 511, the PMD collapse will be satisfied by a single PTE. If the
collapse fails we will try both sides of the PMD (1024kb , 1024kb).
the one that contains the non-none PTE will collapse

This is where the (HPAGE_PMD_ORDER - order) comes from.
imagine the 511 case above
511 >> HPAGE_PMD_ORDER - 9 =3D=3D 511 >> 0 =3D 511 max ptes none
511 >> PMD_ORDER - 8 (1024kb) =3D=3D 511 >> 1 =3D 255 max_ptes_none

both of these align to the orders size minus 1.

>
> Or IOW 'always collapse to the largest size you can I don't care if it
> takes up more memory'
>
> And at 0, we'd never collapse anything across zero entries, and only when
> adjacent present entries can be collapse to mTHP/PMD do we do so?

Yep!

max_pte_none =3D0 + all mTHP sizes enabled, gives you a really good
distribution of mTHP sizes in the systems, as zero memory will be
wasted and the most optimal size (space wise) will eb found. At least
for the memory allocated through khugepaged. The Defer patchset I had
on top of this series was exactly for that purpose-- Allow khugepaged
to determine all the THP usage in the system (other than madvise), and
allow granular control of memory waste.

>
> >
> > >
> > > And only collapse to PMD size if we have sufficient adjacent PTE entr=
ies that
> > > are populated?
> > >
> > > Let's really nail this down actually so we can be super clear what th=
e issue is
> > > here.
> > >
> >
> > I hope what I wrote above made sense.
>
> Asking some q's still, probably more a me thing :)
>
> >
> > >
> > > >
> > > > Creep only happens if you wouldn't collapse a PMD without prior mTH=
P
> > > > collapse, but suddenly would in the same scenario simply because yo=
u had
> > > > prior mTHP collapse.
> > > >
> > > > At least that's my understanding.
> > >
> > > OK, that makes sense, is the logic (this may be part of the bit I hav=
en't
> > > reviewed yet tbh) then that for khugepaged mTHP we have the system wh=
ere we
> > > always require prior mTHP collapse _first_?
> >
> > So I would describe creep as
> >
> > "we would not collapse a PMD THP because max_ptes_none is violated, but
> > because we collapsed smaller mTHP THPs before, we essentially suddenly =
have
> > more PTEs that are not none-or-zero, making us suddenly collapse a PMD =
THP
> > at the same place".
>
> Yeah that makes sense.
>
> >
> > Assume the following: max_ptes_none =3D 256
> >
> > This means we would only collapse if at most half (256/512) of the PTEs=
 are
> > none-or-zero.
> >
> > But imagine the (simplified) PTE layout with PMD =3D 8 entries to simpl=
ify:
> >
> > [ P Z P Z P Z Z Z ]
> >
> > 3 Present vs. 5 Zero -> do not collapse a PMD (8)
>
> OK I'm thinking this is more about /ratio/ than anything else.
>
> PMD - <=3D50% - ok 5/8 =3D 62.5% no collapse.

                < 50%*.

At 50% it's 256 which is actually the worst case scenario. But I read
further, and it seems like you grasped the issue.

>
> >
> > But sssume we collapse smaller mTHP (2 entries) first
> >
> > [ P P P P P P Z Z ]
>
> ...512 KB mTHP (2 entries) - <=3D 50% means we can do...
>
> >
> > We collapsed 3x "P Z" into "P P" because the ratio allowed for it.
>
> Yes so that's:
>
> [ P Z P Z P Z Z Z ]
>
> ->
>
> [ P P P P P P Z Z ]
>
> Right?
>
> >
> > Suddenly we have
> >
> > 6 Present vs 2 Zero and we collapse a PMD (8)
> >
> > [ P P P P P P P P ]
> >
> > That's the "creep" problem.
>
> I guess we try PMD collapse first then mTHP, but the worry is another pas=
s
> will collapse to PMD right?
>
>
> Whereas < 50% ratio means we never end up 'propagating' or 'creeping' lik=
e
> this because each collapse never provides enough reduction in zero entrie=
s
> to allow for higher order collapse.
>
> Hence the idea of capping at 255

Yep! We've discussed other solutions, like tracking collapsed pages,
or the solutions brought up by David. But this seemed like the most
logical to me, as it keeps some of the tunability. I now understand
the concern wasnt so much the capping, but rather the silent nature of
it, and the uAPI expectations surrounding enforcing such a limit (for
both past and future behavioral expectations).

>
> >
> > >
> > > >
> > > > >
> > > > > > max_ptes_none =3D=3D 0 -> collapse mTHP only if all non-none/ze=
ro
> > > > > >
> > > > > > And for the intermediate values
> > > > > >
> > > > > > (1) pr_warn() when mTHPs are enabled, stating that mTHP collaps=
e is not
> > > > > > supported yet with other values
> > > > >
> > > > > It feels a bit much to issue a kernel warning every time somebody=
 twiddles that
> > > > > value, and it's kind of against user expectation a bit.
> > > >
> > > > pr_warn_once() is what I meant.
> > >
> > > Right, but even then it feels a bit extreme, warnings are pretty seri=
ous
> > > things. Then again there's precedent for this, and it may be the leas=
t worse
> > > solution.
> > >
> > > I just picture a cloud provider turning this on with mTHP then gettin=
g their
> > > monitoring team reporting some urgent communication about warnings in=
 dmesg :)
> >
> > I mean, one could make the states mutually, maybe?
> >
> > Disallow enabling mTHP with max_ptes_none set to unsupported values and=
 the
> > other way around.
> >
> > That would probably be cleanest, although the implementation might get =
a bit
> > more involved (but it's solvable).
> >
> > But the concern could be that there are configs that could suddenly bre=
ak:
> > someone that set max_ptes_none and enabled mTHP.
>
> Yeah we could always return an error on setting to an unsupported value.
>
> I mean pr_warn() is nasty but maybe necessary.
>
> >
> >
> > I'll note that we could also consider only supporting "max_ptes_none =
=3D 511"
> > (default) to start with.
> >
> > The nice thing about that value is that it us fully supported with the
> > underused shrinker, because max_ptes_none=3D511 -> never shrink.
>
> It feels like =3D 0 would be useful though?

I personally think the default of 511 is wrong and should be on the
lower end of the scale. The exception being thp=3Dalways, where I
believe the kernel should treat it as 511.

But the second part of that would also violate the users max_ptes_none
setting, so it's probably much harder in practice, and also not really
part of this series, just my opinion.

Cheers.
-- Nico

>
> >
> > --
> > Cheers
> >
> > David / dhildenb
> >
>
> Thanks, Lorenzo
>

