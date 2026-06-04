Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5422B3BFAE8
	for <linux-doc@vger.kernel.org>; Thu,  4 Jun 2026 16:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780590479; cv=pass; b=kFcjqmsdsbi6KPsJwFTkhHaryP7c7ECMXaUTB4dY1A08yVmBd5p9Z5OOE4BtXVWZoTlMad4i5xyL0d9ldIIgRYJB2hDpnlJ8v26Lm6ychCa8KJAZgXgPK0VHfPnZ1MgWQxPsRgx2TZYOqe8WsKnrnVrd7HW3P53BKqUYaoIzT3o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780590479; c=relaxed/simple;
	bh=5G47YxpAV56Qp2tW5GOCdQQevw4zG9pd9g1zkjxzvtE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tj1ObyUhjGVVD4YO+Q7+fOSDeSALrz2xwzb7DncInssLpcDCF/J/7cLOXmnf00xVa1+Qt1hQDSc/vuVP6AaDO9oiwgExUsURshDv+g8W4ONxAo9oy0OdSK8A05Ji94K+e2Y+/MAyTJ6LnOumnj5G1tvkKw8MaGqXFAumDTB1mqc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eLmyQArA; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=MjGL3umR; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eLmyQArA";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="MjGL3umR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780590476;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BA145V9KjUZKy0xmmK5N0uGNrCBkGuvTTNL7wjmfvAY=;
	b=eLmyQArACKwY22X/jD09yFUg2AtRH2dOR+Guqt2e9qyoB1vSQf1TQoTUXajJhnmDyX5lKe
	YmLgeaabSnMBK7S+KOZXybZq/O1M2hBBFg5V7n6oSLfvmyRURYO96oGaPlBClrg9TZh2Re
	dBurHp16ntFi8iAf5ttJPyWGwgTsoPA=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-576-YAzwd1dSMRSSS16HFTp-9w-1; Thu, 04 Jun 2026 12:27:55 -0400
X-MC-Unique: YAzwd1dSMRSSS16HFTp-9w-1
X-Mimecast-MFC-AGG-ID: YAzwd1dSMRSSS16HFTp-9w_1780590475
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-7e9234db3bfso15728407b3.2
        for <linux-doc@vger.kernel.org>; Thu, 04 Jun 2026 09:27:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780590474; cv=none;
        d=google.com; s=arc-20240605;
        b=Vykfpo6gfbwkx4fsW+yNMkPOw80BZqpLUMU9tfy2LVwesSP85I2IQmQFQl3IpIfF3S
         eS3bzaFvF1sbNtVJFAnbwkDTOLo8eHg+hwIkwT5a2wDvU9xKRBV6cbOeFUUhemT2oXoE
         FA2uAThfAwe3UE8Pk1yi0+qfwT58/rGUxf5w3iaIylj0twtusFZ0iTWa91e1D72SYqsP
         umZwRjvXpVQh0wrmFZ3hOVAmPQ41x/v+HhnoOQK2kyK2c3e+LJo6tFLogQb1NSqv4RjL
         Z3G4A3kaYnO860DMYUmcG8ySZY6j5rEykaq5VON9FVBEFhgVTaFviX6VwnfeskwERi2P
         4mGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BA145V9KjUZKy0xmmK5N0uGNrCBkGuvTTNL7wjmfvAY=;
        fh=SN3n3EequSa9DX5CejsKRCFb/ziW0CpiMzfLPVxQdT4=;
        b=d7o5b3z9lu+MfzEbp4crJMb/z/VuvHDuF4dA11gABPydnPh8Pakk3uR1e99I+g3YSr
         wnDTWChhGi6Z4cod4v/rmXwoONXf8B4vieZqG4Wn0SzfXXcbsQ4j9fsD8rhrEOlN4nOc
         ZmxyhrDq5wKSGv7/F+vjst6CqEcpUFH9Y38iiwGuAOPyBbfI4MUcT8vKYKDq8NmZ3DtL
         1ukVyM+doVzzFqBPbFpE0SwkXpbeKEEuqz2UaXSTwSEUlhm7WaUN6/DQdptThiDSibR+
         15zLjxQUyE251zua1i8XBaPwSZZBtrLTC4yxwM1sxCf+cbmBcUVx8qzUGLnMglZwuYzM
         Axog==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1780590474; x=1781195274; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BA145V9KjUZKy0xmmK5N0uGNrCBkGuvTTNL7wjmfvAY=;
        b=MjGL3umRaZppVNcc8l9hMpNIyVk5sv5uIbtdrx7bN7/27D14WXTi5qpS7RQBNO3ZYy
         u7qXg0b4h14Bep1Fu//GptheZ8UgxSFtP84SQXCLWTQcKrhL2c5YZzqPHdgI58vo3DHV
         e5/QmksEC9/UDyFldc8HwxgQhCayd6Zh5Ah+9y7FENr9DAw+w2yzAmaQDjy5dE0iAwC/
         BQ/04Z1FreSbeBxBdmaVBHYtlONYpS69Z2bmZ1jZ/CAUACGER6selgVQBbXYZu3xNxUX
         WXzg1esQN0oZWyWJRbyD6Na26N9x5FN7vxwiLeOcH/ATk11t6zuGl265ACMH5dDxk/Lh
         ZzgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780590474; x=1781195274;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BA145V9KjUZKy0xmmK5N0uGNrCBkGuvTTNL7wjmfvAY=;
        b=Fm6dMPNxL8lljpOcCAuEdsr4A7J+hXccoTHIc3YFdXVzWfwMtMaX4UxOcDLnT66PWI
         WPuDllxofOgyku3Ta80sfBt/aHl8Y5baHPT0vNDhhELKm1aPduXf03sksF10QO2++urr
         Yxp8lw+ZBGguprJTSUBGD2Hal3yvgoElnI2YKhJITL/rEVAQAUFpRqayA+EjxtGlwl+T
         tyWasSY4fxCJbIFdPf7yQWEz+lEJYctvewfVj9ix23vSExtlGy/GEZC2PB9M/HAt2vP7
         hoyYwVTs3CpZ/qlxbXuJ+bMVUbvGQFhOkTC7ER2Gi5n2pHcPBdgu4VhX2TmWRHDnmG5/
         KxCQ==
X-Gm-Message-State: AOJu0YwsnsxZo22SijbtXn5gPux0JM2amMLMj14pZjfxkldxmyPcYYjq
	xfqFYbSJ2aC2SJJDFCICam4ruxmM65YmeKcL8xB0zbMVGE7GCJUXUjnSqG3lt9y1VMS/FHzfpkD
	g+652ZXVPdeJN+ju7O5dY69jicRMXBbeZS3UJdzEBlHGGt8ZnJ+LEIwl0EZxC7ywz7YXdGOJdRK
	N2eD6Ue2kI+cZZO/2wPy5g/hsmosB54NaCqJU0
X-Gm-Gg: Acq92OFPTtfqUxrHekiSy0D6D10S27fY4dKzcJDDzis5b7so9muyvOMHKXUOBIonV7f
	JmfAslXqYWlaeq2l6+hLaEQBgpMXmeFx/8j5IaugSiHqrxn/gTFIfasYKKvrX9GMyzT8QeYtOgN
	wy2Hb4dRMBIkJ9318eFpYUK35sc6GFC4n8djCPjVVF8X/q6LWoaBW+eGZNWekTNqyukexyj3qo1
	tZUvXs7VM06srg=
X-Received: by 2002:a05:690e:d8d:b0:660:5dc3:3fe0 with SMTP id 956f58d0204a3-660dbfbd3a5mr7618436d50.14.1780590474261;
        Thu, 04 Jun 2026 09:27:54 -0700 (PDT)
X-Received: by 2002:a05:690e:d8d:b0:660:5dc3:3fe0 with SMTP id
 956f58d0204a3-660dbfbd3a5mr7618389d50.14.1780590473572; Thu, 04 Jun 2026
 09:27:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522150009.121603-1-npache@redhat.com> <20260522150009.121603-7-npache@redhat.com>
 <aiFTSLb0kkTR7I9A@lucifer> <aiFw80oLty6F_-8m@lucifer> <CAA1CXcDxZEmWtmGFiKDKSPSae8pN0at4vYV24FOs+t_GTGkZ6g@mail.gmail.com>
 <aiFz-VSKSQ-zBfN7@lucifer>
In-Reply-To: <aiFz-VSKSQ-zBfN7@lucifer>
From: Nico Pache <npache@redhat.com>
Date: Thu, 4 Jun 2026 10:28:35 -0600
X-Gm-Features: AVHnY4Le_mcjGdC3DL2MK-mvBxkw7z_nSZsHoQmJnPcOIGLqDyjwHBHEtYP4b4s
Message-ID: <CAA1CXcCN5NtFUyLA1oSTmX_1csGEAviadKmNHCcnmAa=OmKHbQ@mail.gmail.com>
Subject: Re: [PATCH mm-unstable v18 06/14] mm/khugepaged: generalize
 collapse_huge_page for mTHP collapse
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-trace-kernel@vger.kernel.org, aarcange@redhat.com, 
	akpm@linux-foundation.org, anshuman.khandual@arm.com, apopple@nvidia.com, 
	baohua@kernel.org, baolin.wang@linux.alibaba.com, byungchul@sk.com, 
	catalin.marinas@arm.com, cl@gentwo.org, corbet@lwn.net, 
	dave.hansen@linux.intel.com, david@kernel.org, dev.jain@arm.com, 
	gourry@gourry.net, hannes@cmpxchg.org, hughd@google.com, jack@suse.cz, 
	jackmanb@google.com, jannh@google.com, jglisse@google.com, 
	joshua.hahnjy@gmail.com, kas@kernel.org, lance.yang@linux.dev, 
	liam@infradead.org, mathieu.desnoyers@efficios.com, matthew.brost@intel.com, 
	mhiramat@kernel.org, mhocko@suse.com, peterx@redhat.com, pfalcato@suse.de, 
	rakie.kim@sk.com, raquini@redhat.com, rdunlap@infradead.org, 
	richard.weiyang@gmail.com, rientjes@google.com, rostedt@goodmis.org, 
	rppt@kernel.org, ryan.roberts@arm.com, shivankg@amd.com, 
	sunnanyong@huawei.com, surenb@google.com, thomas.hellstrom@linux.intel.com, 
	tiwai@suse.de, usamaarif642@gmail.com, vbabka@suse.cz, vishal.moola@gmail.com, 
	wangkefeng.wang@huawei.com, will@kernel.org, willy@infradead.org, 
	yang@os.amperecomputing.com, ying.huang@linux.alibaba.com, ziy@nvidia.com, 
	zokeefe@google.com, Usama Arif <usama.arif@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 4, 2026 at 6:56=E2=80=AFAM Lorenzo Stoakes <ljs@kernel.org> wro=
te:
>
> On Thu, Jun 04, 2026 at 06:45:58AM -0600, Nico Pache wrote:
> > On Thu, Jun 4, 2026 at 6:40=E2=80=AFAM Lorenzo Stoakes <ljs@kernel.org>=
 wrote:
> > >
> > > On Thu, Jun 04, 2026 at 12:38:30PM +0100, Lorenzo Stoakes wrote:
> > > > I will go review the thread about the cache maintenance separately =
and
> > > > respond about that.
> > > >
> > > > On Fri, May 22, 2026 at 09:00:01AM -0600, Nico Pache wrote:
> > > > > Pass an order and offset to collapse_huge_page to support collaps=
ing anon
> > > > > memory to arbitrary orders within a PMD. order indicates what mTH=
P size we
> > > > > are attempting to collapse to, and offset indicates were in the P=
MD to
> > > > > start the collapse attempt.
> > > > >
> > > > > For non-PMD collapse we must leave the anon VMA write locked unti=
l after
> > > > > we collapse the mTHP-- in the PMD case all the pages are isolated=
, but in
> > > > > the mTHP case this is not true, and we must keep the lock to prev=
ent
> > > > > access/changes to the page tables. This can happen if the rmap wa=
lkers hit
> > > > > a pmd_none while the PMD entry is currently unavailable due to be=
ing
> > > > > temporarily removed during the collapse phase.
> > > > >
> > > > > Acked-by: Usama Arif <usama.arif@linux.dev>
> > > > > Signed-off-by: Nico Pache <npache@redhat.com>
> > > >
> > > > The logic LGTM generally, some questions for understanding below, a=
nd of
> > > > course as per above I want to review the Lance/David subthread.
> > > >
> > > > Thanks!
> > > >
> > > > > ---
> > > > >  mm/khugepaged.c | 93 +++++++++++++++++++++++++++++--------------=
------
> > > > >  1 file changed, 55 insertions(+), 38 deletions(-)
> > > > >
> > > > > diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> > > > > index fab35d318641..d64f42f66236 100644
> > > > > --- a/mm/khugepaged.c
> > > > > +++ b/mm/khugepaged.c
> > > > > @@ -1214,34 +1214,36 @@ static enum scan_result alloc_charge_foli=
o(struct folio **foliop, struct mm_stru
> > > > >   * while allocating a THP, as that could trigger direct reclaim/=
compaction.
> > > > >   * Note that the VMA must be rechecked after grabbing the mmap_l=
ock again.
> > > > >   */
> > > > > -static enum scan_result collapse_huge_page(struct mm_struct *mm,=
 unsigned long address,
> > > > > -           int referenced, int unmapped, struct collapse_control=
 *cc)
> > > > > +static enum scan_result collapse_huge_page(struct mm_struct *mm,=
 unsigned long start_addr,
> > > > > +           int referenced, int unmapped, struct collapse_control=
 *cc,
> > > > > +           unsigned int order)
> > > > >  {
> > > > > +   const unsigned long pmd_addr =3D start_addr & HPAGE_PMD_MASK;
> > > > > +   const unsigned long end_addr =3D start_addr + (PAGE_SIZE << o=
rder);
> > > > >     LIST_HEAD(compound_pagelist);
> > > > >     pmd_t *pmd, _pmd;
> > > > > -   pte_t *pte;
> > > > > +   pte_t *pte =3D NULL;
> > > >
> > > > As mentioned elsewhere for some reason this was dropped in
> > > > mm-unstable. Maybe a bad conflict resolution?
> > > >
> > > > >     pgtable_t pgtable;
> > > > >     struct folio *folio;
> > > > >     spinlock_t *pmd_ptl, *pte_ptl;
> > > > >     enum scan_result result =3D SCAN_FAIL;
> > > > >     struct vm_area_struct *vma;
> > > > >     struct mmu_notifier_range range;
> > > > > +   bool anon_vma_locked =3D false;
> > > > >
> > > > > -   VM_BUG_ON(address & ~HPAGE_PMD_MASK);
> > > > > -
> > > > > -   result =3D alloc_charge_folio(&folio, mm, cc, HPAGE_PMD_ORDER=
);
> > > > > +   result =3D alloc_charge_folio(&folio, mm, cc, order);
> > > > >     if (result !=3D SCAN_SUCCEED)
> > > > >             goto out_nolock;
> > > > >
> > > > >     mmap_read_lock(mm);
> > > > > -   result =3D hugepage_vma_revalidate(mm, address, true, &vma, c=
c,
> > > > > -                                    HPAGE_PMD_ORDER);
> > > > > +   result =3D hugepage_vma_revalidate(mm, pmd_addr, /*expect_ano=
n=3D*/ true,
> > > > > +                                    &vma, cc, order);
> > > > >     if (result !=3D SCAN_SUCCEED) {
> > > > >             mmap_read_unlock(mm);
> > > > >             goto out_nolock;
> > > > >     }
> > > > >
> > > > > -   result =3D find_pmd_or_thp_or_none(mm, address, &pmd);
> > > > > +   result =3D find_pmd_or_thp_or_none(mm, pmd_addr, &pmd);
> > > > >     if (result !=3D SCAN_SUCCEED) {
> > > > >             mmap_read_unlock(mm);
> > > > >             goto out_nolock;
> > > > > @@ -1253,8 +1255,8 @@ static enum scan_result collapse_huge_page(=
struct mm_struct *mm, unsigned long a
> > > > >              * released when it fails. So we jump out_nolock dire=
ctly in
> > > > >              * that case.  Continuing to collapse causes inconsis=
tency.
> > > > >              */
> > > > > -           result =3D __collapse_huge_page_swapin(mm, vma, addre=
ss, pmd,
> > > > > -                                                referenced, HPAG=
E_PMD_ORDER);
> > > > > +           result =3D __collapse_huge_page_swapin(mm, vma, start=
_addr, pmd,
> > > > > +                                                referenced, orde=
r);
> > > > >             if (result !=3D SCAN_SUCCEED)
> > > > >                     goto out_nolock;
> > > > >     }
> > > > > @@ -1269,20 +1271,21 @@ static enum scan_result collapse_huge_pag=
e(struct mm_struct *mm, unsigned long a
> > > > >      * mmap_lock.
> > > > >      */
> > > > >     mmap_write_lock(mm);
> > > > > -   result =3D hugepage_vma_revalidate(mm, address, true, &vma, c=
c,
> > > > > -                                    HPAGE_PMD_ORDER);
> > > > > +   result =3D hugepage_vma_revalidate(mm, pmd_addr, /*expect_ano=
n=3D*/ true,
> > > > > +                                    &vma, cc, order);
> > > > >     if (result !=3D SCAN_SUCCEED)
> > > > >             goto out_up_write;
> > > > >     /* check if the pmd is still valid */
> > > > >     vma_start_write(vma);
> > >
> > > Hmm actually I think we have another problem here.
> > >
> > > For PMD THP this is fine. Only a single VMA can span the range we nee=
d, and it
> > > will span the entire PMD.
> > >
> > > But for mTHP we have an issue...
> > >
> > > See below...
> > >
> > > > > -   result =3D check_pmd_still_valid(mm, address, pmd);
> > > > > +   result =3D check_pmd_still_valid(mm, pmd_addr, pmd);
> > > > >     if (result !=3D SCAN_SUCCEED)
> > > > >             goto out_up_write;
> > > > >
> > > > >     anon_vma_lock_write(vma->anon_vma);
> > > > > +   anon_vma_locked =3D true;
> > > >
> > > > I worry that we hold this lock a lot longer now? Maybe the algorith=
mic
> > > > change alters that, but Claude did suggest on the s390 bug that lon=
ger lock
> > > > hold might be an issue.
> > > >
> > > > I wonder if we'll observe lock contention as a result?
> > > >
> > > > Correct me if I'm wrong and we're not holding longer than previousl=
y,
> > > > however. Just appears that we do.
> > > >
> > > > >
> > > > > -   mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, mm, addr=
ess,
> > > > > -                           address + HPAGE_PMD_SIZE);
> > > > > +   mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, mm, star=
t_addr,
> > > > > +                           end_addr);
> > > > >     mmu_notifier_invalidate_range_start(&range);
> > > > >
> > > > >     pmd_ptl =3D pmd_lock(mm, pmd); /* probably unnecessary */
> > > > > @@ -1294,26 +1297,23 @@ static enum scan_result collapse_huge_pag=
e(struct mm_struct *mm, unsigned long a
> > > > >      * Parallel GUP-fast is fine since GUP-fast will back off whe=
n
> > > > >      * it detects PMD is changed.
> > > > >      */
> > > > > -   _pmd =3D pmdp_collapse_flush(vma, address, pmd);
> > > > > +   _pmd =3D pmdp_collapse_flush(vma, pmd_addr, pmd);
> > >
> > > ...So we exclude VMA locked faults faulting in a new PMD entry for PM=
D-sized THP
> > > but for mTHP we might have _another_ VMA that spans another part of t=
he range
> > > mapped by the same PMD entry.
> > >
> > > So we clear this, but we do not have a write lock on any other VMA, a=
nd so
> > > racing VMA read locks can install a new PMD entry.
> > >
> > > > >     spin_unlock(pmd_ptl);
> > >
> > > Especially since you unlock this :)
> > >
> > > And...
> > >
> > > > >     mmu_notifier_invalidate_range_end(&range);
> > > > >     tlb_remove_table_sync_one();
> > > > >
> > > > > -   pte =3D pte_offset_map_lock(mm, &_pmd, address, &pte_ptl);
> > > > > +   pte =3D pte_offset_map_lock(mm, &_pmd, start_addr, &pte_ptl);
> > > > >     if (pte) {
> > > > > -           result =3D __collapse_huge_page_isolate(vma, address,=
 pte, cc,
> > > > > -                                                 HPAGE_PMD_ORDER=
,
> > > > > -                                                 &compound_pagel=
ist);
> > > > > +           result =3D __collapse_huge_page_isolate(vma, start_ad=
dr, pte, cc,
> > > > > +                                                 order, &compoun=
d_pagelist);
> > > > >             spin_unlock(pte_ptl);
> > > > >     } else {
> > > > >             result =3D SCAN_NO_PTE_TABLE;
> > > > >     }
> > > > >
> > > > >     if (unlikely(result !=3D SCAN_SUCCEED)) {
> > > > > -           if (pte)
> > > > > -                   pte_unmap(pte);
> > > >
> > > > OK I seem to remember this is because we're holding the anon_vma lo=
ck
> > > > longer. That does imply that on e.g. x86-64 the RCU lock is being h=
eld a
> > > > bit longer also as well as the anon_vma loc.
> > > >
> > > > I guess it's also because we need to hold anon_vma and pte lock bec=
ause
> > > > we're fiddling around at PTE level for mTHP not just PMD level as '=
classic'
> > > > THP did.
> > > >
> > > > (Rememberings going on here :)
> > > >
> > > > >             spin_lock(pmd_ptl);
> > > > > -           BUG_ON(!pmd_none(*pmd));
> > > > > +           WARN_ON_ONCE(!pmd_none(*pmd));
> > >
> > > ...this will get triggered.
> > >
> > > I don't know whether we can safely hold the PMD lock across everythin=
g here for
> > > mTHP?
> > >
> > > Maybe the solution would have to be to scan through VMAs in the range=
 of the PMD
> > > and VMA write lock each of them?
> >
> > I believe we've spoken about this before, but because we always make
>
> Maybe worth a comment then...? Ah how rewarding review is :)

I'll expand the commit message and comment in commit 1 of the series! thank=
s

>
> This is something that somebody else might very well wonder about and
> forget that it happens to be covered there.
>
> Also:
>
> /* Always check the PMD order to ensure its not shared by another VMA */
>
> Is pretty lightweight there. Something about avoiding racing page faults
> would be helpful.

yeah fair enough the commit message of patch 1 also doesnt really do
it justice on the *why*

>
> > sure the VMA spans the full PMD we won't ever hit this issue. If we
> > wanted to support mTHP collapse on regions smaller than a PMD, the
> > locking gets tricky (hence the design choice to not do that for now).
> >
> > This is handled by the HPAGE_ORDER in hugepage_vma_revalidate().
>
> The existing code is atrocious, and sticking this on top has added to the
> pile of assumptions and conventions and having to go check a bunch of
> functions to 'just know' you're safe for X, Y, Z.
>
> We really need to see some cleanup series coming after this and I'm going
> to get pretty grumpy(ier) if we don't.

Many more to come :) Improvements too but cleanups first!

Cheers,
-- Nico

>
> >
> > /* Always check the PMD order to ensure its not shared by another VMA *=
/
> > if (!thp_vma_suitable_order(vma, address, PMD_ORDER))
> >
> > -- Nico
> >
> > >
> > > That could cause some 'interesting' lock contention issues though? Th=
en again,
> > > we will be releasing the mmap write lock soon enough which will drop =
the VMA
> > > write locks.
> > >
> > > > >             /*
> > > > >              * We can only use set_pmd_at when establishing
> > > > >              * hugepmds and never for establishing regular pmds t=
hat
> > > > > @@ -1321,21 +1321,24 @@ static enum scan_result collapse_huge_pag=
e(struct mm_struct *mm, unsigned long a
> > > > >              */
> > > > >             pmd_populate(mm, pmd, pmd_pgtable(_pmd));
> > > > >             spin_unlock(pmd_ptl);
> > > > > -           anon_vma_unlock_write(vma->anon_vma);
> > > > >             goto out_up_write;
> > > > >     }
> > > > >
> > > > >     /*
> > > > > -    * All pages are isolated and locked so anon_vma rmap
> > > > > -    * can't run anymore.
> > > > > +    * For PMD collapse all pages are isolated and locked so anon=
_vma
> > > > > +    * rmap can't run anymore. For mTHP collapse the PMD entry ha=
s been
> > > > > +    * removed and not all pages are isolated and locked, so we m=
ust hold
> > > >
> > > > Right because some PTE entries be unaffected by the change.
> > > >
> > > > > +    * the lock to prevent neighboring folios from attempting to =
access
> > > > > +    * this PMD until its reinstalled.
> > > >
> > > > OK. This is slightly annoying for my CoW context work as it means t=
here's
> > > > another case where we need to explicitly hold an anon_vma lock for
> > > > correctness :)
> > > >
> > > > Anyway I will think about that separately, is what it is. And in fa=
ct
> > > > motivates to want this merged earlier so I can work against it :)
> > > >
> > > >
> > > > >      */
> > > > > -   anon_vma_unlock_write(vma->anon_vma);
> > > > > +   if (is_pmd_order(order)) {
> > > > > +           anon_vma_unlock_write(vma->anon_vma);
> > > > > +           anon_vma_locked =3D false;
> > > > > +   }
> > > > >
> > > > >     result =3D __collapse_huge_page_copy(pte, folio, pmd, _pmd,
> > > > > -                                      vma, address, pte_ptl,
> > > > > -                                      HPAGE_PMD_ORDER,
> > > > > -                                      &compound_pagelist);
> > > > > -   pte_unmap(pte);
> > > > > +                                      vma, start_addr, pte_ptl,
> > > > > +                                      order, &compound_pagelist)=
;
> > > > >     if (unlikely(result !=3D SCAN_SUCCEED))
> > > > >             goto out_up_write;
> > > > >
> > > > > @@ -1345,18 +1348,32 @@ static enum scan_result collapse_huge_pag=
e(struct mm_struct *mm, unsigned long a
> > > > >      * write.
> > > > >      */
> > > > >     __folio_mark_uptodate(folio);
> > > > > -   pgtable =3D pmd_pgtable(_pmd);
> > > > > -
> > > > >     spin_lock(pmd_ptl);
> > > > > -   BUG_ON(!pmd_none(*pmd));
> > > > > -   pgtable_trans_huge_deposit(mm, pmd, pgtable);
> > > > > -   map_anon_folio_pmd_nopf(folio, pmd, vma, address);
> > > > > +   WARN_ON_ONCE(!pmd_none(*pmd));
> > > > > +   if (is_pmd_order(order)) {
> > > > > +           pgtable =3D pmd_pgtable(_pmd);
> > > > > +           pgtable_trans_huge_deposit(mm, pmd, pgtable);
> > > > > +           map_anon_folio_pmd_nopf(folio, pmd, vma, pmd_addr);
> > > > > +   } else {
> > > > > +           /*
> > > > > +            * set_ptes is called in map_anon_folio_pte_nopf with=
 the
> > > > > +            * pmd_ptl lock still held; this is safe as the PMD i=
s expected
> > > >
> > > > PMD entry you mean?
> > > >
> > > > > +            * to be none. The pmd entry is then repopulated belo=
w.
> > > > > +            */
> > > > > +           map_anon_folio_pte_nopf(folio, pte, vma, start_addr, =
/*uffd_wp=3D*/ false);
> > > >
> > > > So here we populate entries in the existing PTE _table_ to point at=
 the new
> > > > order>0 folio? With arm64 of course doing transparent contpte stuff=
?
> > > >
> > > > > +           smp_wmb(); /* make PTEs visible before PMD. See pmd_i=
nstall() */
> > > > > +           pmd_populate(mm, pmd, pmd_pgtable(_pmd));
> > > >
> > > > And then we reinstall the pre-existing PMD _entry_ from none -> wha=
t it was
> > > > before?
> > > >
> > > > > +   }
> > > > >     spin_unlock(pmd_ptl);
> > > > >
> > > > >     folio =3D NULL;
> > > > >
> > > > >     result =3D SCAN_SUCCEED;
> > > > >  out_up_write:
> > > > > +   if (anon_vma_locked)
> > > > > +           anon_vma_unlock_write(vma->anon_vma);
> > > > > +   if (pte)
> > > > > +           pte_unmap(pte);
> > > > >     mmap_write_unlock(mm);
> > > > >  out_nolock:
> > > > >     if (folio)
> > > > > @@ -1536,7 +1553,7 @@ static enum scan_result collapse_scan_pmd(s=
truct mm_struct *mm,
> > > > >             /* collapse_huge_page expects the lock to be dropped =
before calling */
> > > > >             mmap_read_unlock(mm);
> > > > >             result =3D collapse_huge_page(mm, start_addr, referen=
ced,
> > > > > -                                       unmapped, cc);
> > > > > +                                       unmapped, cc, HPAGE_PMD_O=
RDER);
> > > > >             /* collapse_huge_page will return with the mmap_lock =
released */
> > > > >             *lock_dropped =3D true;
> > > > >     }
> > > > > --
> > > > > 2.54.0
> > > > >
> > >
> > > Thanks, Lorenzo
> > >
> >
>

