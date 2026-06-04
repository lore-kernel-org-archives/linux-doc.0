Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4759947AF63
	for <linux-doc@vger.kernel.org>; Thu,  4 Jun 2026 12:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780577125; cv=pass; b=LmcBJm2qq50Yp+NwOvv1RxImVDQRcvziCivnCVcqCzZU8m6TMFtOYFzZvaSAMFrYiH6J6r/SynguWGTqudo8QwWgefA6+4cv1Oum70vi0WoeHA6Ke74l+5Xt1MrxrRrbqVZpQW580Wlm8XGLuyLyIbyRDIirTjSYkgmjVucmTXE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780577125; c=relaxed/simple;
	bh=iIJaHTFWvmXWvUw8kf+IMTtjxQgBs3lbS6tjPT3ZkZ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t+aW3IHMSdZsxv97snAOGtpkgO5RWB0Cl2QcPpYkFOQ3uxdMHMDyvOdtbZn42EMLXDokYr7ZmvhKOYzQif/2LYFnc5xCBXMPN0ZZvJIENr7J9sjRlgVRAiOJvCoBxN23AptixqXcrycv57Lf9xk2rlMxwP1kIeHVMx8cR9p5iP4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DIR+y3YS; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=qPyeyIfr; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DIR+y3YS";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="qPyeyIfr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780577122;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9xUcbywLcE9NtRLDOc7hL0dY7/9kflpcYqqV0IQKR90=;
	b=DIR+y3YSAtvzkYuseBN9v8COIRmg1tR+rjSZLPXdkn3jsWMQAUQh4j5Er4ddCBUGlzb4lq
	5+rPtq7ka1CiSZN4ZJuKwKi3mmjpnFmfjE8U+V53/vpW7UMXmpuDy06X2V2IG6AIXPEGhS
	i97DiTwEbhSrhkGqaQ7TO8dMrPwMdsY=
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com
 [74.125.224.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-330-Awf0ZfOSOUaNkjJsOYVTnw-1; Thu, 04 Jun 2026 08:45:20 -0400
X-MC-Unique: Awf0ZfOSOUaNkjJsOYVTnw-1
X-Mimecast-MFC-AGG-ID: Awf0ZfOSOUaNkjJsOYVTnw_1780577120
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-66043ac620fso1190920d50.3
        for <linux-doc@vger.kernel.org>; Thu, 04 Jun 2026 05:45:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780577119; cv=none;
        d=google.com; s=arc-20240605;
        b=Tu7D/amWrp1F3wQ6bo9kh/yaxsBNnAXQhd3ksUCv0YxWnmRUhvo7jb43kCArI/NbtO
         F9sivFEFF8B4c9ExuDwbt7Z7kipOOeXAwe5RDtcncXSpSY9k1c2eaMfcFCnGL50TksdI
         3AmmweOzdRh+Z1IX8py8sOjkavuEq8rj3hlb18KZBLn5X9uFtf2H0OpVLCEbAUAfJ7DS
         KtmKugFgZiCwcwrmDq0+LtaqbtTyU2fMlT9NGC8vDL28rwpZBt8fZ4J9NeEJnXP5pF9j
         ZzqNLEuChcxBCELxC8dS7JgmuHZgAs3AdgBmhBtY2Hsv3ij8YDtlqLwEkeLh0I5bnQmN
         YTqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9xUcbywLcE9NtRLDOc7hL0dY7/9kflpcYqqV0IQKR90=;
        fh=SN3n3EequSa9DX5CejsKRCFb/ziW0CpiMzfLPVxQdT4=;
        b=Dr80VW+YtIsr1QVAuIMQOSugWw+j+ByrWJHrPIBQhoYRPZL8bWU3xyIduZmQloZ4kD
         VM8hViwHcs2vRTfpKc7m90vwAduqoPlarjrpT2tBiK1v5E/dRmkvBESGrTmp91NAcn7j
         CozrNoPxiBfUDQ+CXTCADvKG59czSdABTEospbBEUNU7IZKsXnpC5p8DVKxXJwRbC7f5
         yCMnfhzpM8sY40ry/U+KgE0+iqoW5iyJ5BeKNbYbL2HkRbRCqkJ1p+CSvO9Y48qJxFPw
         ZMw2C86z4T8Zw4OGQhebkKpl2BefTyzlNCP6DCHohU51ofL5HrfxMBROOlbqlgm/MHHY
         D2aQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1780577119; x=1781181919; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9xUcbywLcE9NtRLDOc7hL0dY7/9kflpcYqqV0IQKR90=;
        b=qPyeyIfrSt9SMCjO1vMJpOEFMmEHAzNrfTKUxJ9skDPzoy0zTrArrYNi5j4OlGHSTL
         U0yhGEZmtr2gLSbiioF0wyJFRo6EGd2Rpyop5oMGLMDG5+8hP5fyirES3JiUdENMFj1T
         T93aJGpqRiCTmnXGyWa4gpqudiXTfMnfedyGrXRV2wqBq53E3Mwf81yjiZ0fQco0g0sy
         YzlIsyifMjLAx9/KdnSMPH6ZL3cRDQMW0MydsO/1x+nxSPkQiPe96AXsGUy3dU5+/NgF
         QC8xll0hn45NC5ma2bXsZEfLkh7Yq2CLpeisR90uw57ACcqRIYg6Z9FDF5/pXltF7+RJ
         9N4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780577119; x=1781181919;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9xUcbywLcE9NtRLDOc7hL0dY7/9kflpcYqqV0IQKR90=;
        b=eH0NJmI7c39DGizcCIOnt51PQB1+uN2RIuQOWPI6QgXE3JpSTlr5IUls1zAVdnFO+M
         oilLghQNbtk6nBFbVBDgjNG0obdzHCj0kFsmd04bJssL4Er9fMADTwGtzrhkUIqt5Unq
         HKcAhqBQDhUyygq/g5ESyF5vv9cRDdCEhFvCmUGFc9rT0g4LTzx1r4JKc7YHYXhse2jZ
         /ggXPb18fLBQQr55erApot6kIoGZvnmqGJqsRbYUSk79V28pFAb55V384Aa54SawA5S9
         QFkvBwzLjHc9HtZgEIdAIdCxC1kpXuRVWSi1Mm4VgDgJyM0cuWT9EQjg0HJgYSG0Kx9/
         DaHA==
X-Gm-Message-State: AOJu0YxHozDiLuwSi3cTLstQB2Z9kScw7zTOaF+pxySj9MrfaeY6liTm
	Gb7KkJPyxFKexCslTQaFLUpWL8UPXJ80ls8uOoBD94NekuECXkdjVXPlpicl2CrLd8W1hAzFOe8
	o/wQIAVpI0Ls6ZoIgIzf0S7myENzwzEy9BI2b6Bjq8KbcBqTOmHYkjtAe6IZQkPW6cMIAGWCo8q
	BeiGgWnOfzSDPRHGFOcprwCBsuC0/rTdj2U/GU
X-Gm-Gg: Acq92OF98w7wgvqhOpVYJ6AySZbjm/e+o3EdWsnybgTxnIB8TPM447slrqnGIsAxbPJ
	TGEZKrJEdWlCcqk9JPundo3DXusTwGz568TrwhIRke06JZkcymkowm0swcTC5C/6sUle+YSVpF6
	VjiFpReqYRkrZZJiCKD0Xq5Yj7g/bGfJ6bJ1EUUttyGYqhAKUZIN4K1t/odGzrlosCsIx4C2KlH
	mnKHcg/k522mlE=
X-Received: by 2002:a05:690e:d5c:b0:660:a41d:d193 with SMTP id 956f58d0204a3-660dc2542a4mr6473975d50.33.1780577119418;
        Thu, 04 Jun 2026 05:45:19 -0700 (PDT)
X-Received: by 2002:a05:690e:d5c:b0:660:a41d:d193 with SMTP id
 956f58d0204a3-660dc2542a4mr6473930d50.33.1780577118704; Thu, 04 Jun 2026
 05:45:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522150009.121603-1-npache@redhat.com> <20260522150009.121603-7-npache@redhat.com>
 <aiFTSLb0kkTR7I9A@lucifer> <aiFw80oLty6F_-8m@lucifer>
In-Reply-To: <aiFw80oLty6F_-8m@lucifer>
From: Nico Pache <npache@redhat.com>
Date: Thu, 4 Jun 2026 06:45:58 -0600
X-Gm-Features: AVHnY4LSO1OdqVIyL1dRF_W_uj5b-rkDdzIgCbEj_ORHLXIHBkb9A_fLOmITpQ8
Message-ID: <CAA1CXcDxZEmWtmGFiKDKSPSae8pN0at4vYV24FOs+t_GTGkZ6g@mail.gmail.com>
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

On Thu, Jun 4, 2026 at 6:40=E2=80=AFAM Lorenzo Stoakes <ljs@kernel.org> wro=
te:
>
> On Thu, Jun 04, 2026 at 12:38:30PM +0100, Lorenzo Stoakes wrote:
> > I will go review the thread about the cache maintenance separately and
> > respond about that.
> >
> > On Fri, May 22, 2026 at 09:00:01AM -0600, Nico Pache wrote:
> > > Pass an order and offset to collapse_huge_page to support collapsing =
anon
> > > memory to arbitrary orders within a PMD. order indicates what mTHP si=
ze we
> > > are attempting to collapse to, and offset indicates were in the PMD t=
o
> > > start the collapse attempt.
> > >
> > > For non-PMD collapse we must leave the anon VMA write locked until af=
ter
> > > we collapse the mTHP-- in the PMD case all the pages are isolated, bu=
t in
> > > the mTHP case this is not true, and we must keep the lock to prevent
> > > access/changes to the page tables. This can happen if the rmap walker=
s hit
> > > a pmd_none while the PMD entry is currently unavailable due to being
> > > temporarily removed during the collapse phase.
> > >
> > > Acked-by: Usama Arif <usama.arif@linux.dev>
> > > Signed-off-by: Nico Pache <npache@redhat.com>
> >
> > The logic LGTM generally, some questions for understanding below, and o=
f
> > course as per above I want to review the Lance/David subthread.
> >
> > Thanks!
> >
> > > ---
> > >  mm/khugepaged.c | 93 +++++++++++++++++++++++++++++------------------=
--
> > >  1 file changed, 55 insertions(+), 38 deletions(-)
> > >
> > > diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> > > index fab35d318641..d64f42f66236 100644
> > > --- a/mm/khugepaged.c
> > > +++ b/mm/khugepaged.c
> > > @@ -1214,34 +1214,36 @@ static enum scan_result alloc_charge_folio(st=
ruct folio **foliop, struct mm_stru
> > >   * while allocating a THP, as that could trigger direct reclaim/comp=
action.
> > >   * Note that the VMA must be rechecked after grabbing the mmap_lock =
again.
> > >   */
> > > -static enum scan_result collapse_huge_page(struct mm_struct *mm, uns=
igned long address,
> > > -           int referenced, int unmapped, struct collapse_control *cc=
)
> > > +static enum scan_result collapse_huge_page(struct mm_struct *mm, uns=
igned long start_addr,
> > > +           int referenced, int unmapped, struct collapse_control *cc=
,
> > > +           unsigned int order)
> > >  {
> > > +   const unsigned long pmd_addr =3D start_addr & HPAGE_PMD_MASK;
> > > +   const unsigned long end_addr =3D start_addr + (PAGE_SIZE << order=
);
> > >     LIST_HEAD(compound_pagelist);
> > >     pmd_t *pmd, _pmd;
> > > -   pte_t *pte;
> > > +   pte_t *pte =3D NULL;
> >
> > As mentioned elsewhere for some reason this was dropped in
> > mm-unstable. Maybe a bad conflict resolution?
> >
> > >     pgtable_t pgtable;
> > >     struct folio *folio;
> > >     spinlock_t *pmd_ptl, *pte_ptl;
> > >     enum scan_result result =3D SCAN_FAIL;
> > >     struct vm_area_struct *vma;
> > >     struct mmu_notifier_range range;
> > > +   bool anon_vma_locked =3D false;
> > >
> > > -   VM_BUG_ON(address & ~HPAGE_PMD_MASK);
> > > -
> > > -   result =3D alloc_charge_folio(&folio, mm, cc, HPAGE_PMD_ORDER);
> > > +   result =3D alloc_charge_folio(&folio, mm, cc, order);
> > >     if (result !=3D SCAN_SUCCEED)
> > >             goto out_nolock;
> > >
> > >     mmap_read_lock(mm);
> > > -   result =3D hugepage_vma_revalidate(mm, address, true, &vma, cc,
> > > -                                    HPAGE_PMD_ORDER);
> > > +   result =3D hugepage_vma_revalidate(mm, pmd_addr, /*expect_anon=3D=
*/ true,
> > > +                                    &vma, cc, order);
> > >     if (result !=3D SCAN_SUCCEED) {
> > >             mmap_read_unlock(mm);
> > >             goto out_nolock;
> > >     }
> > >
> > > -   result =3D find_pmd_or_thp_or_none(mm, address, &pmd);
> > > +   result =3D find_pmd_or_thp_or_none(mm, pmd_addr, &pmd);
> > >     if (result !=3D SCAN_SUCCEED) {
> > >             mmap_read_unlock(mm);
> > >             goto out_nolock;
> > > @@ -1253,8 +1255,8 @@ static enum scan_result collapse_huge_page(stru=
ct mm_struct *mm, unsigned long a
> > >              * released when it fails. So we jump out_nolock directly=
 in
> > >              * that case.  Continuing to collapse causes inconsistenc=
y.
> > >              */
> > > -           result =3D __collapse_huge_page_swapin(mm, vma, address, =
pmd,
> > > -                                                referenced, HPAGE_PM=
D_ORDER);
> > > +           result =3D __collapse_huge_page_swapin(mm, vma, start_add=
r, pmd,
> > > +                                                referenced, order);
> > >             if (result !=3D SCAN_SUCCEED)
> > >                     goto out_nolock;
> > >     }
> > > @@ -1269,20 +1271,21 @@ static enum scan_result collapse_huge_page(st=
ruct mm_struct *mm, unsigned long a
> > >      * mmap_lock.
> > >      */
> > >     mmap_write_lock(mm);
> > > -   result =3D hugepage_vma_revalidate(mm, address, true, &vma, cc,
> > > -                                    HPAGE_PMD_ORDER);
> > > +   result =3D hugepage_vma_revalidate(mm, pmd_addr, /*expect_anon=3D=
*/ true,
> > > +                                    &vma, cc, order);
> > >     if (result !=3D SCAN_SUCCEED)
> > >             goto out_up_write;
> > >     /* check if the pmd is still valid */
> > >     vma_start_write(vma);
>
> Hmm actually I think we have another problem here.
>
> For PMD THP this is fine. Only a single VMA can span the range we need, a=
nd it
> will span the entire PMD.
>
> But for mTHP we have an issue...
>
> See below...
>
> > > -   result =3D check_pmd_still_valid(mm, address, pmd);
> > > +   result =3D check_pmd_still_valid(mm, pmd_addr, pmd);
> > >     if (result !=3D SCAN_SUCCEED)
> > >             goto out_up_write;
> > >
> > >     anon_vma_lock_write(vma->anon_vma);
> > > +   anon_vma_locked =3D true;
> >
> > I worry that we hold this lock a lot longer now? Maybe the algorithmic
> > change alters that, but Claude did suggest on the s390 bug that longer =
lock
> > hold might be an issue.
> >
> > I wonder if we'll observe lock contention as a result?
> >
> > Correct me if I'm wrong and we're not holding longer than previously,
> > however. Just appears that we do.
> >
> > >
> > > -   mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, mm, address,
> > > -                           address + HPAGE_PMD_SIZE);
> > > +   mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, mm, start_ad=
dr,
> > > +                           end_addr);
> > >     mmu_notifier_invalidate_range_start(&range);
> > >
> > >     pmd_ptl =3D pmd_lock(mm, pmd); /* probably unnecessary */
> > > @@ -1294,26 +1297,23 @@ static enum scan_result collapse_huge_page(st=
ruct mm_struct *mm, unsigned long a
> > >      * Parallel GUP-fast is fine since GUP-fast will back off when
> > >      * it detects PMD is changed.
> > >      */
> > > -   _pmd =3D pmdp_collapse_flush(vma, address, pmd);
> > > +   _pmd =3D pmdp_collapse_flush(vma, pmd_addr, pmd);
>
> ...So we exclude VMA locked faults faulting in a new PMD entry for PMD-si=
zed THP
> but for mTHP we might have _another_ VMA that spans another part of the r=
ange
> mapped by the same PMD entry.
>
> So we clear this, but we do not have a write lock on any other VMA, and s=
o
> racing VMA read locks can install a new PMD entry.
>
> > >     spin_unlock(pmd_ptl);
>
> Especially since you unlock this :)
>
> And...
>
> > >     mmu_notifier_invalidate_range_end(&range);
> > >     tlb_remove_table_sync_one();
> > >
> > > -   pte =3D pte_offset_map_lock(mm, &_pmd, address, &pte_ptl);
> > > +   pte =3D pte_offset_map_lock(mm, &_pmd, start_addr, &pte_ptl);
> > >     if (pte) {
> > > -           result =3D __collapse_huge_page_isolate(vma, address, pte=
, cc,
> > > -                                                 HPAGE_PMD_ORDER,
> > > -                                                 &compound_pagelist)=
;
> > > +           result =3D __collapse_huge_page_isolate(vma, start_addr, =
pte, cc,
> > > +                                                 order, &compound_pa=
gelist);
> > >             spin_unlock(pte_ptl);
> > >     } else {
> > >             result =3D SCAN_NO_PTE_TABLE;
> > >     }
> > >
> > >     if (unlikely(result !=3D SCAN_SUCCEED)) {
> > > -           if (pte)
> > > -                   pte_unmap(pte);
> >
> > OK I seem to remember this is because we're holding the anon_vma lock
> > longer. That does imply that on e.g. x86-64 the RCU lock is being held =
a
> > bit longer also as well as the anon_vma loc.
> >
> > I guess it's also because we need to hold anon_vma and pte lock because
> > we're fiddling around at PTE level for mTHP not just PMD level as 'clas=
sic'
> > THP did.
> >
> > (Rememberings going on here :)
> >
> > >             spin_lock(pmd_ptl);
> > > -           BUG_ON(!pmd_none(*pmd));
> > > +           WARN_ON_ONCE(!pmd_none(*pmd));
>
> ...this will get triggered.
>
> I don't know whether we can safely hold the PMD lock across everything he=
re for
> mTHP?
>
> Maybe the solution would have to be to scan through VMAs in the range of =
the PMD
> and VMA write lock each of them?

I believe we've spoken about this before, but because we always make
sure the VMA spans the full PMD we won't ever hit this issue. If we
wanted to support mTHP collapse on regions smaller than a PMD, the
locking gets tricky (hence the design choice to not do that for now).

This is handled by the HPAGE_ORDER in hugepage_vma_revalidate().

/* Always check the PMD order to ensure its not shared by another VMA */
if (!thp_vma_suitable_order(vma, address, PMD_ORDER))

-- Nico

>
> That could cause some 'interesting' lock contention issues though? Then a=
gain,
> we will be releasing the mmap write lock soon enough which will drop the =
VMA
> write locks.
>
> > >             /*
> > >              * We can only use set_pmd_at when establishing
> > >              * hugepmds and never for establishing regular pmds that
> > > @@ -1321,21 +1321,24 @@ static enum scan_result collapse_huge_page(st=
ruct mm_struct *mm, unsigned long a
> > >              */
> > >             pmd_populate(mm, pmd, pmd_pgtable(_pmd));
> > >             spin_unlock(pmd_ptl);
> > > -           anon_vma_unlock_write(vma->anon_vma);
> > >             goto out_up_write;
> > >     }
> > >
> > >     /*
> > > -    * All pages are isolated and locked so anon_vma rmap
> > > -    * can't run anymore.
> > > +    * For PMD collapse all pages are isolated and locked so anon_vma
> > > +    * rmap can't run anymore. For mTHP collapse the PMD entry has be=
en
> > > +    * removed and not all pages are isolated and locked, so we must =
hold
> >
> > Right because some PTE entries be unaffected by the change.
> >
> > > +    * the lock to prevent neighboring folios from attempting to acce=
ss
> > > +    * this PMD until its reinstalled.
> >
> > OK. This is slightly annoying for my CoW context work as it means there=
's
> > another case where we need to explicitly hold an anon_vma lock for
> > correctness :)
> >
> > Anyway I will think about that separately, is what it is. And in fact
> > motivates to want this merged earlier so I can work against it :)
> >
> >
> > >      */
> > > -   anon_vma_unlock_write(vma->anon_vma);
> > > +   if (is_pmd_order(order)) {
> > > +           anon_vma_unlock_write(vma->anon_vma);
> > > +           anon_vma_locked =3D false;
> > > +   }
> > >
> > >     result =3D __collapse_huge_page_copy(pte, folio, pmd, _pmd,
> > > -                                      vma, address, pte_ptl,
> > > -                                      HPAGE_PMD_ORDER,
> > > -                                      &compound_pagelist);
> > > -   pte_unmap(pte);
> > > +                                      vma, start_addr, pte_ptl,
> > > +                                      order, &compound_pagelist);
> > >     if (unlikely(result !=3D SCAN_SUCCEED))
> > >             goto out_up_write;
> > >
> > > @@ -1345,18 +1348,32 @@ static enum scan_result collapse_huge_page(st=
ruct mm_struct *mm, unsigned long a
> > >      * write.
> > >      */
> > >     __folio_mark_uptodate(folio);
> > > -   pgtable =3D pmd_pgtable(_pmd);
> > > -
> > >     spin_lock(pmd_ptl);
> > > -   BUG_ON(!pmd_none(*pmd));
> > > -   pgtable_trans_huge_deposit(mm, pmd, pgtable);
> > > -   map_anon_folio_pmd_nopf(folio, pmd, vma, address);
> > > +   WARN_ON_ONCE(!pmd_none(*pmd));
> > > +   if (is_pmd_order(order)) {
> > > +           pgtable =3D pmd_pgtable(_pmd);
> > > +           pgtable_trans_huge_deposit(mm, pmd, pgtable);
> > > +           map_anon_folio_pmd_nopf(folio, pmd, vma, pmd_addr);
> > > +   } else {
> > > +           /*
> > > +            * set_ptes is called in map_anon_folio_pte_nopf with the
> > > +            * pmd_ptl lock still held; this is safe as the PMD is ex=
pected
> >
> > PMD entry you mean?
> >
> > > +            * to be none. The pmd entry is then repopulated below.
> > > +            */
> > > +           map_anon_folio_pte_nopf(folio, pte, vma, start_addr, /*uf=
fd_wp=3D*/ false);
> >
> > So here we populate entries in the existing PTE _table_ to point at the=
 new
> > order>0 folio? With arm64 of course doing transparent contpte stuff?
> >
> > > +           smp_wmb(); /* make PTEs visible before PMD. See pmd_insta=
ll() */
> > > +           pmd_populate(mm, pmd, pmd_pgtable(_pmd));
> >
> > And then we reinstall the pre-existing PMD _entry_ from none -> what it=
 was
> > before?
> >
> > > +   }
> > >     spin_unlock(pmd_ptl);
> > >
> > >     folio =3D NULL;
> > >
> > >     result =3D SCAN_SUCCEED;
> > >  out_up_write:
> > > +   if (anon_vma_locked)
> > > +           anon_vma_unlock_write(vma->anon_vma);
> > > +   if (pte)
> > > +           pte_unmap(pte);
> > >     mmap_write_unlock(mm);
> > >  out_nolock:
> > >     if (folio)
> > > @@ -1536,7 +1553,7 @@ static enum scan_result collapse_scan_pmd(struc=
t mm_struct *mm,
> > >             /* collapse_huge_page expects the lock to be dropped befo=
re calling */
> > >             mmap_read_unlock(mm);
> > >             result =3D collapse_huge_page(mm, start_addr, referenced,
> > > -                                       unmapped, cc);
> > > +                                       unmapped, cc, HPAGE_PMD_ORDER=
);
> > >             /* collapse_huge_page will return with the mmap_lock rele=
ased */
> > >             *lock_dropped =3D true;
> > >     }
> > > --
> > > 2.54.0
> > >
>
> Thanks, Lorenzo
>

