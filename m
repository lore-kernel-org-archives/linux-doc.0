Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA30146D5A
	for <linux-doc@vger.kernel.org>; Fri, 23 Jan 2026 23:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769210801; cv=pass; b=sBkmTC2YG7ugT7EHl+B/b87TO2J76V/pm043kpMNGWNansUCw8jOMH48PGqcDjgQ54vDy2mBmeZuqSmDnIpho426XhLVMFNICYPT1IUV2MVPZeQwqCZDY6BgYLaVwbH6TtmVlBDPyfCC0sE1UFwSkB5sdxMA8kPlTnDHr1f52uk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769210801; c=relaxed/simple;
	bh=ZrB/w7n3BqptdE3IVUDmXzOkPHusuX5iL1stOERZdFw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xot6OVGZvFlG33Rkq1YU8/FjhtVIrXiRT7QFuhowu/nIusYykV8nuBvz24lyzQNUZefPeeHgNZfVzjIzEthA6sIUlYhwDy+28oQLl4CPxynv5EIj3S/eA2Ljh5O8Eg5BUWutSHWuzBY5pV0z/aM3vw8xUFkwjwrhDsZFn8+EGps=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CZMJMxSa; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=t7WD3Zgl; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CZMJMxSa";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="t7WD3Zgl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769210798;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k5fKzG3ZqsCU+D3GinO261WdTTeOf+jUnzeg2ypkW+0=;
	b=CZMJMxSaRfcqLM89eqYxybNn0oQ0AfqpY7y1zTsOjHlTEzqYPPISVxfHWSLt0tpb6MgzQM
	T69KkfQPWzusFzkAEZZtzGpOR6fTm/Bo02QE1kGnprXu6t79qvN8+/c7D2yE8I70QueBhl
	nz/+3szDdGd90HxHATYMeCFY28uATcA=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-392-Kbx1km42PPWCcpocKoRISw-1; Fri, 23 Jan 2026 18:26:37 -0500
X-MC-Unique: Kbx1km42PPWCcpocKoRISw-1
X-Mimecast-MFC-AGG-ID: Kbx1km42PPWCcpocKoRISw_1769210796
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-794105cd922so35503297b3.0
        for <linux-doc@vger.kernel.org>; Fri, 23 Jan 2026 15:26:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769210796; cv=none;
        d=google.com; s=arc-20240605;
        b=AhhiF1WHijQ1Y5Bq1HULTvlZ8kQdljblhCFoHZETHx04J/neSiCncGvW88QYpHkTJ4
         AO8TwEQ8SrGEvbtJR+jQ3yRb1dL+d+UXH5Ow18thY4K3cw7Iw026ijdBXX1QbUcjdTqE
         kxg/ekx+qBCCzgW0WiyyW6bOaQYOGzqQVTsfB5XigxKeTPVtnP3kf2b5npkxQ00yhrNU
         3ei5rqtc2UKN4OhfTcGOX1QkwT1QMvybyfe7c7X0o6n6ljWzkgSqhNY1sWAlUvhK2LJC
         j/Ndytkm6JHwCFMorOsAKoZBI704FEY0/wi6ZMF49gVIy9gVyjqurPjuqs4wBnzqZHQS
         MQBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=k5fKzG3ZqsCU+D3GinO261WdTTeOf+jUnzeg2ypkW+0=;
        fh=yA6IXvzg25J146X/zQDKF9Cs4U0Pm/kvJBbqUCsdAUQ=;
        b=jkNjQ1GyHOrQt+a9D4FQ2RNeqyeUZhQj4a1N75UBq8aCHvzYTYUEe+rfLGzR7M7itV
         L/JWqJdq2juaedCunPIAEA1blg89QcxsiCK2VyRYNV+QOA8lFjSiMbJvBrBHHq64WUeV
         2vjvr8g+Nq+Az4FkNB+41ouJylTW/6rfhaq6tXZMnZOoMhksf/gh/bbxuu0ZBBWUJUlI
         8QeaSM2JYGDycxCjWQFv+PHwgjFardiRj14DpIYjRTpKxob198h+hIN8zixFKRGBdkfL
         FUjOOjd8LxgZ99t/p+1QXbR6YOct/z4WaR2tcLBPEQVsdxJZkIdhzKn31UMnwUYUwuqx
         RPcw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1769210796; x=1769815596; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k5fKzG3ZqsCU+D3GinO261WdTTeOf+jUnzeg2ypkW+0=;
        b=t7WD3ZgltITdYaBmATjjcE7t1AnVxvihQQdBHZMWXmlzJJiSZLxGw+e3u/Xac4gwwr
         BT8E6ek+ugHL208h13i0Clq0FM5KNZljTcu1b1XndCD3PphPcw1XEup9MCvqr2JvbuHx
         i3UVwKXZA56vJg+zHx3dZGd0IJwO2AJt9VsRu0DGPuoQkqvVPvSAAiUBIzcmfVDZ3544
         2Idn5Y+k9UfaXzw2rmaHXoydRk9/0CFqRufqfU1H3U8APaLeqVADCh59iT3yZMGmlFUM
         x0coOXy/0088mHWJMwBX5W3uQhJdy6jwm1hu3bSLL7Bm+TzEuVYSYmVw+k7g/a3UxPBV
         3pFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769210796; x=1769815596;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=k5fKzG3ZqsCU+D3GinO261WdTTeOf+jUnzeg2ypkW+0=;
        b=oRTx0WpZpVFieTVAK26Uzeg1tm65sMpUvOfa1eutnyVslUJ1+HqeaALcjh5c9AOuqp
         AcvthtJz5aqR9bnoWKxvMq9edTIQiBmUZoEndpYxMNRYbTl8xbNyUnoqJEu3vpLogv6M
         a1mmcHuUO2O4PVF9c2avoYpZZG9jFBpb62EiUh73r8k9K+ccd75HwhCRv+CKl/+5T7fo
         OdD0mUxfRCMoUcL1ceJHpzn/Uy5AJoRahlUIXXH5n84739/GhkskwAi09c8JHyIvLeip
         meRswUwPMvXUebE/dln5FIOMYEU3qJ9gtbojcNiGwr6oNB47LFQwD2WvVEyIS/taqLjQ
         RDyA==
X-Forwarded-Encrypted: i=1; AJvYcCWXm3vbH2W/YNrS4fc1cbo0eBi8Dr9EuZi6cGTMvSidzsXJ7APLbj9IytO64pLk+fE2S3/P2wA5Gbs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNzPETz+s8TnF8IzzDdOCt2yBilQAregHCpneSbCBTpICSIY6a
	dj/28m6PvYu+an02CRFX8o3OsjHpW7V8e8vQf5YvNOhi770eSWe+itGWkfd/xHq6Ofgv47d+Kgm
	iWEu6Qe3/6jw0WrBqyGjy9Gr8k3ctjNNX6yWoiA5LflFvgRVyifuNiGXn/tpSd/pKNQR6UIeKUp
	2HhnCGRuo3gZHJtUPVNj0aWtXEtj47e3AiK7HU
X-Gm-Gg: AZuq6aKOYUxSX+8IqWe4/3/PNRo2XQ9GsIkzx8Hhzv1BJs8C/NDpdp2EAW60r6c5EnX
	5ryt2EtDPzWzdTfsL3BSK8SRsC1lWDkk8FyH6i9EMeAPpWDsvZQuoqlETEg7jSYWtjrN0u3J/On
	tmwDkCNbEKzuZFlIZMZaiIuH732ZwUx5ftC2sLHYlylcWHgDIZbhR0g02GcJpfACEU9diQHgge3
	/5aDzS9
X-Received: by 2002:a05:690c:83:b0:78f:ca4f:83b4 with SMTP id 00721157ae682-794398fd642mr44427547b3.22.1769210796321;
        Fri, 23 Jan 2026 15:26:36 -0800 (PST)
X-Received: by 2002:a05:690c:83:b0:78f:ca4f:83b4 with SMTP id
 00721157ae682-794398fd642mr44427057b3.22.1769210795499; Fri, 23 Jan 2026
 15:26:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260122192841.128719-1-npache@redhat.com> <20260122192841.128719-4-npache@redhat.com>
 <65dcf7ab-1299-411f-9cbc-438ae72ff757@linux.dev>
In-Reply-To: <65dcf7ab-1299-411f-9cbc-438ae72ff757@linux.dev>
From: Nico Pache <npache@redhat.com>
Date: Fri, 23 Jan 2026 16:26:09 -0700
X-Gm-Features: AZwV_QilZZc8j4ov7NcM2cFQPQ3LGH5hizv9DIPhiFxGNbdN2xfs0S2Fql_eYr0
Message-ID: <CAA1CXcDm75=hM_g0x7ox05nGrGykE8ry_+NbryYu=T+TY114MQ@mail.gmail.com>
Subject: Re: [PATCH mm-unstable v14 03/16] introduce collapse_single_pmd to
 unify khugepaged and madvise_collapse
To: Lance Yang <lance.yang@linux.dev>, "Garg, Shivank" <shivankg@amd.com>
Cc: akpm@linux-foundation.org, david@kernel.org, lorenzo.stoakes@oracle.com, 
	ziy@nvidia.com, baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com, 
	ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org, vbabka@suse.cz, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, corbet@lwn.net, 
	rostedt@goodmis.org, mhiramat@kernel.org, mathieu.desnoyers@efficios.com, 
	linux-kernel@vger.kernel.org, matthew.brost@intel.com, 
	joshua.hahnjy@gmail.com, rakie.kim@sk.com, byungchul@sk.com, 
	gourry@gourry.net, ying.huang@linux.alibaba.com, apopple@nvidia.com, 
	jannh@google.com, pfalcato@suse.de, jackmanb@google.com, hannes@cmpxchg.org, 
	willy@infradead.org, peterx@redhat.com, wangkefeng.wang@huawei.com, 
	usamaarif642@gmail.com, sunnanyong@huawei.com, vishal.moola@gmail.com, 
	thomas.hellstrom@linux.intel.com, yang@os.amperecomputing.com, kas@kernel.org, 
	aarcange@redhat.com, raquini@redhat.com, anshuman.khandual@arm.com, 
	catalin.marinas@arm.com, tiwai@suse.de, will@kernel.org, 
	dave.hansen@linux.intel.com, jack@suse.cz, cl@gentwo.org, jglisse@google.com, 
	zokeefe@google.com, rientjes@google.com, rdunlap@infradead.org, 
	hughd@google.com, richard.weiyang@gmail.com, 
	David Hildenbrand <david@redhat.com>, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 22, 2026 at 10:08=E2=80=AFPM Lance Yang <lance.yang@linux.dev> =
wrote:
>
>
>
> On 2026/1/23 03:28, Nico Pache wrote:
> > The khugepaged daemon and madvise_collapse have two different
> > implementations that do almost the same thing.
> >
> > Create collapse_single_pmd to increase code reuse and create an entry
> > point to these two users.
> >
> > Refactor madvise_collapse and collapse_scan_mm_slot to use the new
> > collapse_single_pmd function. This introduces a minor behavioral change
> > that is most likely an undiscovered bug. The current implementation of
> > khugepaged tests collapse_test_exit_or_disable before calling
> > collapse_pte_mapped_thp, but we weren't doing it in the madvise_collaps=
e
> > case. By unifying these two callers madvise_collapse now also performs
> > this check. We also modify the return value to be SCAN_ANY_PROCESS whic=
h
> > properly indicates that this process is no longer valid to operate on.
> >
> > We also guard the khugepaged_pages_collapsed variable to ensure its onl=
y
> > incremented for khugepaged.
> >
> > Reviewed-by: Wei Yang <richard.weiyang@gmail.com>
> > Reviewed-by: Lance Yang <lance.yang@linux.dev>
> > Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> > Reviewed-by: Zi Yan <ziy@nvidia.com>
> > Acked-by: David Hildenbrand <david@redhat.com>
> > Signed-off-by: Nico Pache <npache@redhat.com>
> > ---
>
> I think this patch introduces some functional changes compared to previou=
s
> version[1] ...
>
> Maybe we should drop the r-b tags and let folks take another look?
>
> There might be an issue with the vma access in madvise_collapse(). See
> below:
>
> [1]
> https://lore.kernel.org/linux-mm/20251201174627.23295-3-npache@redhat.com=
/
>
> >   mm/khugepaged.c | 106 +++++++++++++++++++++++++++--------------------=
-
> >   1 file changed, 60 insertions(+), 46 deletions(-)
> >
> > diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> > index fefcbdca4510..59e5a5588d85 100644
> > --- a/mm/khugepaged.c
> > +++ b/mm/khugepaged.c
> > @@ -2394,6 +2394,54 @@ static enum scan_result collapse_scan_file(struc=
t mm_struct *mm, unsigned long a
> >       return result;
> >   }
> >
> > +/*
> > + * Try to collapse a single PMD starting at a PMD aligned addr, and re=
turn
> > + * the results.
> > + */
> > +static enum scan_result collapse_single_pmd(unsigned long addr,
> > +             struct vm_area_struct *vma, bool *mmap_locked,
> > +             struct collapse_control *cc)
> > +{
> > +     struct mm_struct *mm =3D vma->vm_mm;
> > +     enum scan_result result;
> > +     struct file *file;
> > +     pgoff_t pgoff;
> > +
> > +     if (vma_is_anonymous(vma)) {
> > +             result =3D collapse_scan_pmd(mm, vma, addr, mmap_locked, =
cc);
> > +             goto end;
> > +     }
> > +
> > +     file =3D get_file(vma->vm_file);
> > +     pgoff =3D linear_page_index(vma, addr);
> > +
> > +     mmap_read_unlock(mm);
> > +     *mmap_locked =3D false;
> > +     result =3D collapse_scan_file(mm, addr, file, pgoff, cc);
> > +     fput(file);
> > +
> > +     if (result !=3D SCAN_PTE_MAPPED_HUGEPAGE)
> > +             goto end;
> > +
> > +     mmap_read_lock(mm);
> > +     *mmap_locked =3D true;
> > +     if (collapse_test_exit_or_disable(mm)) {
> > +             mmap_read_unlock(mm);
> > +             *mmap_locked =3D false;
> > +             return SCAN_ANY_PROCESS;
> > +     }
> > +     result =3D try_collapse_pte_mapped_thp(mm, addr, !cc->is_khugepag=
ed);
> > +     if (result =3D=3D SCAN_PMD_MAPPED)
> > +             result =3D SCAN_SUCCEED;
> > +     mmap_read_unlock(mm);
> > +     *mmap_locked =3D false;
> > +
> > +end:
> > +     if (cc->is_khugepaged && result =3D=3D SCAN_SUCCEED)
> > +             ++khugepaged_pages_collapsed;
> > +     return result;
> > +}
> > +
> >   static unsigned int collapse_scan_mm_slot(unsigned int pages, enum sc=
an_result *result,
> >                                           struct collapse_control *cc)
> >       __releases(&khugepaged_mm_lock)
> > @@ -2466,34 +2514,9 @@ static unsigned int collapse_scan_mm_slot(unsign=
ed int pages, enum scan_result *
> >                       VM_BUG_ON(khugepaged_scan.address < hstart ||
> >                                 khugepaged_scan.address + HPAGE_PMD_SIZ=
E >
> >                                 hend);
> > -                     if (!vma_is_anonymous(vma)) {
> > -                             struct file *file =3D get_file(vma->vm_fi=
le);
> > -                             pgoff_t pgoff =3D linear_page_index(vma,
> > -                                             khugepaged_scan.address);
> > -
> > -                             mmap_read_unlock(mm);
> > -                             mmap_locked =3D false;
> > -                             *result =3D collapse_scan_file(mm,
> > -                                     khugepaged_scan.address, file, pg=
off, cc);
> > -                             fput(file);
> > -                             if (*result =3D=3D SCAN_PTE_MAPPED_HUGEPA=
GE) {
> > -                                     mmap_read_lock(mm);
> > -                                     if (collapse_test_exit_or_disable=
(mm))
> > -                                             goto breakouterloop;
> > -                                     *result =3D try_collapse_pte_mapp=
ed_thp(mm,
> > -                                             khugepaged_scan.address, =
false);
> > -                                     if (*result =3D=3D SCAN_PMD_MAPPE=
D)
> > -                                             *result =3D SCAN_SUCCEED;
> > -                                     mmap_read_unlock(mm);
> > -                             }
> > -                     } else {
> > -                             *result =3D collapse_scan_pmd(mm, vma,
> > -                                     khugepaged_scan.address, &mmap_lo=
cked, cc);
> > -                     }
> > -
> > -                     if (*result =3D=3D SCAN_SUCCEED)
> > -                             ++khugepaged_pages_collapsed;
> >
> > +                     *result =3D collapse_single_pmd(khugepaged_scan.a=
ddress,
> > +                                                   vma, &mmap_locked, =
cc);
> >                       /* move to next address */
> >                       khugepaged_scan.address +=3D HPAGE_PMD_SIZE;
> >                       progress +=3D HPAGE_PMD_NR;
> > @@ -2799,6 +2822,7 @@ int madvise_collapse(struct vm_area_struct *vma, =
unsigned long start,
> >                       cond_resched();
> >                       mmap_read_lock(mm);
> >                       mmap_locked =3D true;
> > +                     *lock_dropped =3D true;
> >                       result =3D hugepage_vma_revalidate(mm, addr, fals=
e, &vma,
> >                                                        cc);
> >                       if (result  !=3D SCAN_SUCCEED) {
> > @@ -2809,17 +2833,17 @@ int madvise_collapse(struct vm_area_struct *vma=
, unsigned long start,
> >                       hend =3D min(hend, vma->vm_end & HPAGE_PMD_MASK);
> >               }
> >               mmap_assert_locked(mm);
> > -             if (!vma_is_anonymous(vma)) {
> > -                     struct file *file =3D get_file(vma->vm_file);
> > -                     pgoff_t pgoff =3D linear_page_index(vma, addr);
> >
> > -                     mmap_read_unlock(mm);
> > -                     mmap_locked =3D false;
> > +             result =3D collapse_single_pmd(addr, vma, &mmap_locked, c=
c);
> > +
> > +             if (!mmap_locked)
> >                       *lock_dropped =3D true;
> > -                     result =3D collapse_scan_file(mm, addr, file, pgo=
ff, cc);
> >
> > -                     if (result =3D=3D SCAN_PAGE_DIRTY_OR_WRITEBACK &&=
 !triggered_wb &&
> > -                         mapping_can_writeback(file->f_mapping)) {
> > +             if (result =3D=3D SCAN_PAGE_DIRTY_OR_WRITEBACK && !trigge=
red_wb) {
> > +                     struct file *file =3D get_file(vma->vm_file);
> > +                     pgoff_t pgoff =3D linear_page_index(vma, addr);
>
>
> After collapse_single_pmd() returns, mmap_lock might have been released.
> Between
> that unlock and here, another thread could unmap/remap the VMA, making
> the vma
> pointer stale when we access vma->vm_file?

+ Shivank, I thought they were on the CC list.

Hey! I thought of this case, but then figured it was no different than
what is currently implemented for the writeback-retry logic, since the
mmap lock is dropped and not revalidated. BUT I failed to consider
that the file reference is held throughout that time.

I thought of moving the functionality into collapse_single_pmd(), but
figured I'd keep it in madvise_collapse() as it's the sole user of
that functionality. Given the potential file ref issue, that may be
the best solution, and I dont think it should be too difficult. I'll
queue that up, and also drop the r-b tags as you suggested.

Ok, here's my solution, does this look like the right approach?:
diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 59e5a5588d85..dda9fdc35767 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -2418,6 +2418,14 @@ static enum scan_result
collapse_single_pmd(unsigned long addr,
        mmap_read_unlock(mm);
        *mmap_locked =3D false;
        result =3D collapse_scan_file(mm, addr, file, pgoff, cc);
+
+       if (!cc->is_khugepaged && result =3D=3D SCAN_PAGE_DIRTY_OR_WRITEBAC=
K &&
+           mapping_can_writeback(file->f_mapping)) {
+               loff_t lstart =3D (loff_t)pgoff << PAGE_SHIFT;
+               loff_t lend =3D lstart + HPAGE_PMD_SIZE - 1;
+
+               filemap_write_and_wait_range(file->f_mapping, lstart, lend)=
;
+       }
        fput(file);

        if (result !=3D SCAN_PTE_MAPPED_HUGEPAGE)
@@ -2840,19 +2848,8 @@ int madvise_collapse(struct vm_area_struct
*vma, unsigned long start,
                        *lock_dropped =3D true;

                if (result =3D=3D SCAN_PAGE_DIRTY_OR_WRITEBACK && !triggere=
d_wb) {
-                       struct file *file =3D get_file(vma->vm_file);
-                       pgoff_t pgoff =3D linear_page_index(vma, addr);
-
-                       if (mapping_can_writeback(file->f_mapping)) {
-                               loff_t lstart =3D (loff_t)pgoff << PAGE_SHI=
FT;
-                               loff_t lend =3D lstart + HPAGE_PMD_SIZE - 1=
;
-
-
filemap_write_and_wait_range(file->f_mapping, lstart, lend);
-                               triggered_wb =3D true;
-                               fput(file);
-                               goto retry;
-                       }
-                       fput(file);
+                       triggered_wb =3D true;
+                       goto retry;
                }

                switch (result) {



-- Nico


>
> Would it be safer to get the file reference before calling
> collapse_single_pmd()?
> Or we need to revalidate the VMA after getting the lock back?
>
>
> Thanks,
> Lance
>
> > +
> > +                     if (mapping_can_writeback(file->f_mapping)) {
> >                               loff_t lstart =3D (loff_t)pgoff << PAGE_S=
HIFT;
> >                               loff_t lend =3D lstart + HPAGE_PMD_SIZE -=
 1;
> >
> > @@ -2829,26 +2853,16 @@ int madvise_collapse(struct vm_area_struct *vma=
, unsigned long start,
> >                               goto retry;
> >                       }
> >                       fput(file);
> > -             } else {
> > -                     result =3D collapse_scan_pmd(mm, vma, addr, &mmap=
_locked, cc);
> >               }
> > -             if (!mmap_locked)
> > -                     *lock_dropped =3D true;
> >
> > -handle_result:
> >               switch (result) {
> >               case SCAN_SUCCEED:
> >               case SCAN_PMD_MAPPED:
> >                       ++thps;
> >                       break;
> > -             case SCAN_PTE_MAPPED_HUGEPAGE:
> > -                     BUG_ON(mmap_locked);
> > -                     mmap_read_lock(mm);
> > -                     result =3D try_collapse_pte_mapped_thp(mm, addr, =
true);
> > -                     mmap_read_unlock(mm);
> > -                     goto handle_result;
> >               /* Whitelisted set of results where continuing OK */
> >               case SCAN_NO_PTE_TABLE:
> > +             case SCAN_PTE_MAPPED_HUGEPAGE:
> >               case SCAN_PTE_NON_PRESENT:
> >               case SCAN_PTE_UFFD_WP:
> >               case SCAN_LACK_REFERENCED_PAGE:
>

