Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BDD2189509
	for <linux-doc@vger.kernel.org>; Mon, 26 Aug 2024 15:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724686840; cv=none; b=mTi3YTTGZ7dUqrF/91ZZaXDo82K+P9jgNlx+kRBAjkmzkkueztfrMrmAUFkQuIRyuH/22hke/PXUVNzVtC3DlYpdsscB+yNM1xmdZudUzDAxEv9gUOfzOfGg87NSpzbFM4OIkQidLVLCXq04CRtqo+T5+2O8XttwwV4Se8Jn0sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724686840; c=relaxed/simple;
	bh=v6aBNEgkD+yCxRyLqlLsqt9Me9mghklxGM1HvPv9Lb4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s1mkXcnn/TeUStJtyUAK1CbXnEn3aalr0NcifeQP7pOPQYOdRK01olHJJpF5Ptt1aU+09IpTiVWaxaE7yV7zAaARux37UZgE1HeqpfBo/w/jFx8iLcivMoqRPwB49qc69QUlhoz5yxLmoPl7TwungR5/cxc5oKtV47C3h3kTD5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eU65gLjg; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eU65gLjg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724686837;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=27eVj2Z6RNgb00mecDqw/aDsuiUwWuk/YVU/+hWWgVg=;
	b=eU65gLjgJrp4BwYkxc5ZO9dfPYNCKLPcYqd3wpj32MZV0ULJpIeChNcDXyLMG9Exw5pTof
	Xydogdq+KfuXfPKQgCOeiKYqmdfiA3r5TBiIbqXUPo6U4lO7Oy3XN554Q/TOhSSnfDz5wY
	+v2ix02cIjqn6eHQ7IGHctQ8nqN+ibE=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-436-x5vkVTGFM-KOWwG0SlqrcQ-1; Mon, 26 Aug 2024 11:40:36 -0400
X-MC-Unique: x5vkVTGFM-KOWwG0SlqrcQ-1
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-6b71aa9349dso81696467b3.1
        for <linux-doc@vger.kernel.org>; Mon, 26 Aug 2024 08:40:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724686835; x=1725291635;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=27eVj2Z6RNgb00mecDqw/aDsuiUwWuk/YVU/+hWWgVg=;
        b=Eskae1crEsxONiC57DRGGKRU55mxzgft+WI1mYNwj8h/ufqOyg2fU4DYAmmvZTxPEK
         OLcfNenCD6lSzN8vKke4Dbj83HQKydcacP7XUGh3bCdRP7gK4zuSw5Q0/+MU+WLwOl6d
         xGz+cou6hiI5aHiNSVgSzyIK8+BpydTW5j3lpuXTsehZgUoylM/5iM/rjp4KcyHmBhO7
         f+3yE1zoALED/zd7dQvZeQ5mVbk+K9E5ZWqOZVbs3FZyy2ucoN/e2XJPEMwN6/zywm6R
         foeYr3lbzjMEvOtWwZaoy0wYFvPU30Bl319qJ2O7DiwdI3Xx/q4EAsLmGVmu/m/a0q1s
         OL1Q==
X-Gm-Message-State: AOJu0YzkV9n4o0IEsfAHhSqW06qxeSaXaO9SwS/6NrqFk3497igR408O
	foZI14pATrgbP/7atWQCl14nKFvF1DS19F0nVESKPDbxCLc+ZcCm/CgzFlFw3Jlg8j0QOq2jOR/
	SbsZeQ1haS7L+ZYOXrJqJHKvy+YjNiFUzhAx8TvvmdBtGdPErSWjVp2K85YocvC51bBfqNiSABG
	l4PXkfB3n5ZM1dMNvq1L0Ir4su9b3nJThJ
X-Received: by 2002:a05:690c:ecb:b0:6ae:1e27:c994 with SMTP id 00721157ae682-6c6248e8e21mr102812557b3.3.1724686835472;
        Mon, 26 Aug 2024 08:40:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHHo5xy1tCcPATzjwKv562swJ8qdcQ3hXU/FJ7I5SxAT5TQe0vT7bwPymRwDqoI/eR5G7ezSBJ8+GTy4PeNLRU=
X-Received: by 2002:a05:690c:ecb:b0:6ae:1e27:c994 with SMTP id
 00721157ae682-6c6248e8e21mr102812327b3.3.1724686835153; Mon, 26 Aug 2024
 08:40:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240729222727.64319-1-npache@redhat.com> <72320F9D-9B6A-4ABA-9B18-E59B8382A262@nvidia.com>
 <CAA1CXcCD798gkLoZuz3Cd5-Wf2MRfnAG_EB0U3nbScZeFv09dw@mail.gmail.com>
In-Reply-To: <CAA1CXcCD798gkLoZuz3Cd5-Wf2MRfnAG_EB0U3nbScZeFv09dw@mail.gmail.com>
From: Nico Pache <npache@redhat.com>
Date: Mon, 26 Aug 2024 09:40:09 -0600
Message-ID: <CAA1CXcCCOS8-aqcm+w8Aoqe2P5q005wMrgmtx=xjzJgjKFb7mg@mail.gmail.com>
Subject: Re: [RFC 0/2] mm: introduce THP deferred setting
To: linux-mm@kvack.org, linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, Matthew Wilcox <willy@infradead.org>, Barry Song <baohua@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Lance Yang <ioworker0@gmail.com>, Peter Xu <peterx@redhat.com>, 
	Rafael Aquini <aquini@redhat.com>, Andrea Arcangeli <aarcange@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, 
	Zi Yan <ziy@nvidia.com>, usamaarif642@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 30, 2024 at 4:37=E2=80=AFPM Nico Pache <npache@redhat.com> wrot=
e:
>
> Hi Zi Yan,
> On Mon, Jul 29, 2024 at 7:26=E2=80=AFPM Zi Yan <ziy@nvidia.com> wrote:
> >
> > +Kirill
> >
> > On 29 Jul 2024, at 18:27, Nico Pache wrote:
> >
> > > We've seen cases were customers switching from RHEL7 to RHEL8 see a
> > > significant increase in the memory footprint for the same workloads.
> > >
> > > Through our investigations we found that a large contributing factor =
to
> > > the increase in RSS was an increase in THP usage.
> >
> > Any knob is changed from RHEL7 to RHEL8 to cause more THP usage?
> IIRC, most of the systems tuning is the same. We attributed the
> increase in THP usage to a combination of improvements in the kernel,
> and improvements in the libraries (better alignments). That allowed
> THP allocations to succeed at a higher rate. I can go back and confirm
> this tomorrow though.
> >
> > >
> > > For workloads like MySQL, or when using allocators like jemalloc, it =
is
> > > often recommended to set /transparent_hugepages/enabled=3Dnever. This=
 is
> > > in part due to performance degradations and increased memory waste.
> > >
> > > This series introduces enabled=3Ddefer, this setting acts as a middle
> > > ground between always and madvise. If the mapping is MADV_HUGEPAGE, t=
he
> > > page fault handler will act normally, making a hugepage if possible. =
If
> > > the allocation is not MADV_HUGEPAGE, then the page fault handler will
> > > default to the base size allocation. The caveat is that khugepaged ca=
n
> > > still operate on pages thats not MADV_HUGEPAGE.
> >
> > Why? If user does not explicitly want huge page, why bother providing h=
uge
> > pages? Wouldn't it increase memory footprint?
>
> So we have "always", which will always try to allocate a THP when it
> can. This setting gives good performance in a lot of conditions, but
> tends to waste memory. Additionally applications DON'T need to be
> modified to take advantage of THPs.
>
> We have "madvise" which will only satisfy allocations that are
> MADV_HUGEPAGE, this gives you granular control, and a lot of times
> these madvises come from libraries. Unlike "always" you DO need to
> modify your application if you want to use THPs.
>
> Then we have "never", which of course, never allocates THPs.
>
> Ok. back to your question, like "madvise", "defer" gives you the
> benefits of THPs when you specifically know you want them
> (madv_hugepage), but also benefits applications that dont specifically
> ask for them (or cant be modified to ask for them), like "always"
> does. The applications that dont ask for THPs must wait for khugepaged
> to get them (avoid insertions at PF time)-- this curbs a lot of memory
> waste, and gives an increased tunability over "always". Another added
> benefit is that khugepaged will most likely not operate on short lived
> allocations, meaning that only longstanding memory will be collapsed
> to THPs.
>
> The memory waste can be tuned with max_ptes_none... lets say you want
> ~90% of your PMD to be full before collapsing into a huge page. simply
> set max_ptes_none=3D64. or no waste, set max_ptes_none=3D0, requiring the
> 512 pages to be present before being collapsed.
>
> >
> > >
> > > This allows for two things... one, applications specifically designed=
 to
> > > use hugepages will get them, and two, applications that don't use
> > > hugepages can still benefit from them without aggressively inserting
> > > THPs at every possible chance. This curbs the memory waste, and defer=
s
> > > the use of hugepages to khugepaged. Khugepaged can then scan the memo=
ry
> > > for eligible collapsing.
> >
> > khugepaged would replace application memory with huge pages without spe=
cific
> > goal. Why not use a user space agent with process_madvise() to collapse
> > huge pages? Admin might have more knobs to tweak than khugepaged.
>
> The benefits of "always" are that no userspace agent is needed, and
> applications dont have to be modified to use madvise(MADV_HUGEPAGE) to
> benefit from THPs. This setting hopes to gain some of the same
> benefits without the significant waste of memory and an increased
> tunability.
>
> future changes I have in the works are to make khugepaged more
> "smart". Moving it away from the round robin fashion it currently
> operates in, to instead make smart and informed decisions of what
> memory to collapse (and potentially split).
>
> Hopefully that helped explain the motivation for this new setting!

Any last comments before I resend this?

Ive been made aware of
https://lore.kernel.org/all/20240730125346.1580150-1-usamaarif642@gmail.com=
/T/#u
which introduces THP splitting. These are both trying to achieve the
same thing through different means. Our approach leverages khugepaged
to promote pages, while Usama's uses the reclaim path to demote
hugepages and shrink the underlying memory.

I will leave it up to reviewers to determine which is better; However,
we can't have both, as we'd be introducing trashing conditions.

Cheers,
-- Nico





>
> Cheer!
> -- Nico
> >
> > >
> > > Admins may want to lower max_ptes_none, if not, khugepaged may
> > > aggressively collapse single allocations into hugepages.
> > >
> > > RFC note
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > Im not sure if im missing anything related to the mTHP
> > > changes. I think now that we have hugepage_pmd_enabled in
> > > commit 00f58104202c ("mm: fix khugepaged activation policy") everythi=
ng
> > > should work as expected.
> > >
> > > Nico Pache (2):
> > >   mm: defer THP insertion to khugepaged
> > >   mm: document transparent_hugepage=3Ddefer usage
> > >
> > >  Documentation/admin-guide/mm/transhuge.rst | 18 ++++++++++---
> > >  include/linux/huge_mm.h                    | 15 +++++++++--
> > >  mm/huge_memory.c                           | 31 +++++++++++++++++++-=
--
> > >  3 files changed, 55 insertions(+), 9 deletions(-)
> > >
> > > Cc: Andrew Morton <akpm@linux-foundation.org>
> > > Cc: David Hildenbrand <david@redhat.com>
> > > Cc: Matthew Wilcox <willy@infradead.org>
> > > Cc: Barry Song <baohua@kernel.org>
> > > Cc: Ryan Roberts <ryan.roberts@arm.com>
> > > Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
> > > Cc: Lance Yang <ioworker0@gmail.com>
> > > Cc: Peter Xu <peterx@redhat.com>
> > > Cc: Zi Yan <ziy@nvidia.com>
> > > Cc: Rafael Aquini <aquini@redhat.com>
> > > Cc: Andrea Arcangeli <aarcange@redhat.com>
> > > Cc: Jonathan Corbet <corbet@lwn.net>
> > > --
> > > 2.45.2
> >
> > --
> > Best Regards,
> > Yan, Zi

