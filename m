Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A7C32E0411
	for <linux-doc@vger.kernel.org>; Wed, 20 Aug 2025 15:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755704471; cv=none; b=KRmbJFG4nDX0NZcqOsVoP7pFMVCJk8Eb9qtvS/wTZTukWTcgu1+S81msqISUvgfeVhN5Xwh12wBYGIlmidNAV3mAB9rL1DQp2pRWbOXUmraeR+1mW5W8Gem4/aSQRTAnOoWc0vr3pwgWQ9TdOrEncnAtvHEYydpKwI9EkILDWvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755704471; c=relaxed/simple;
	bh=1cTJ5YS37dXXDca+7HZLxXlAjhXuuTwagT2XyBDXiAU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l/QT7DGoJdKKvN+h9mv6mfNMpE0rurJfPti0bZgaU+ktnUJXbBZF8c5eBuMlyyxj3if3Cojx3JwZRZIOPLYEbeX9BpT/MO5ODHAWt6dkJ98tsxjTnUJGNwDiqmYa+hPRHGQEyYlWLmybPzeLBOg4ugjjkeoznc7tVkWR1nCjaHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VJrhIgTx; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VJrhIgTx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755704469;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UYSofwZAlBuy0oyzsu8d75QQkZFfweO09q+8sQkHcvo=;
	b=VJrhIgTxaKnHGn6SuA3yMtKCSbV3OFEFjot6akqx56EB5kZdI3V+PSe/o2gPejjtQssWrx
	JV8OXESnhrXsAktm4G2Bk94sIXl6sTXEHpLeKIcXYyaBUmk1qB1dGvs2F/dLEsYWjaHAXJ
	6lpAcCVXamLUWpmwAKB6+GO16gjR2Jw=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-45-tgfwHqaPOiqWt2EwliCnKw-1; Wed, 20 Aug 2025 11:41:08 -0400
X-MC-Unique: tgfwHqaPOiqWt2EwliCnKw-1
X-Mimecast-MFC-AGG-ID: tgfwHqaPOiqWt2EwliCnKw_1755704467
Received: by mail-yb1-f198.google.com with SMTP id 3f1490d57ef6-e933de388a4so5899459276.2
        for <linux-doc@vger.kernel.org>; Wed, 20 Aug 2025 08:41:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755704467; x=1756309267;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UYSofwZAlBuy0oyzsu8d75QQkZFfweO09q+8sQkHcvo=;
        b=KCd9ij+a74KNyTHZ0gUAad7566Z2n8ko/92L6iZcc4pXsCa0xTOYi8GMkU4QpWq+K3
         NtupROndR+nQ8fOuFRBG7TdFJIK+FWq6te+wf92WChJksCCobL/qWnKMBjhAfnQ5lbjF
         LQq67qIORHZFrP0UVfd174yOGZ4knGxeY4zzx1uu7UgXtcUf4mUFQmjQRD4wUf9XXulg
         siTEUD6t2uzyW+wAJNoX6sI4q+idBOv6J24LJjBtgKEPzbcIGCwHXxAT2dIC4gFmT3cX
         ClgoGsU32VBpKQRi7TUJ6m+obmAMkKyBy0iJWO04WCjPdZQYWK9k2t7fFCzV/1HqsLx9
         eVrw==
X-Forwarded-Encrypted: i=1; AJvYcCUS3glrSLXGCykGXkyme3+ICCFF4hZLp31XJ+7ESoiJ52Z1hXEUtRZ9pZ1ESyR27x3BLwtZkfQoweo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTf/QT/dQHzcxblz5b/gj8F+TLHZfSpwcv60HGWkofagT1gl1g
	svMO5yjv4eQl4WU89UX/SjlzL4Y3y5WmOyNDzc8he9SemKcdNQoKTvPP38g69uF/1auTHatDBA7
	0/uKwncGRGbZ3hG/eQpe+P/ZNH2gFN7g3ig57bgrR5/q0UoceRtB0de6SA2hxjyNDTyOEIE6WeN
	jcvRxgZKmJolzvyNgNpIV7PD29YppDRHsnfcqXvea1yJFeMmI=
X-Gm-Gg: ASbGncvMllDNvmOGml3dUgyfafBKUnfMq3ApiTSsQOY1SeBfyFPrqHh2dF5Xh9rkd0y
	3D4/E8NQ25W2Q/7HQeMD8SWyOmQPRYQGBTCUDmvhPIcLUlRFv0OcL79EijEWHb13Cd5hS1uUC40
	rvroGijVke5Smx5/B2D6jWWd8=
X-Received: by 2002:a05:6902:4a84:b0:e94:25a2:f8f5 with SMTP id 3f1490d57ef6-e94f6539a69mr3281635276.3.1755704467407;
        Wed, 20 Aug 2025 08:41:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOTBrpkhP4lXt+J3rPPABO3gkD8lKSX5VfjJLDUErExXxnxu+nUSNzUqoP1cAU7FTl4VV3oeWsS3Y6s5hhVS4=
X-Received: by 2002:a05:6902:4a84:b0:e94:25a2:f8f5 with SMTP id
 3f1490d57ef6-e94f6539a69mr3281610276.3.1755704466967; Wed, 20 Aug 2025
 08:41:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250819134205.622806-1-npache@redhat.com> <20250819134205.622806-4-npache@redhat.com>
 <cd4dd743-679f-4c55-9635-6d32e6fa5ff7@lucifer.local>
In-Reply-To: <cd4dd743-679f-4c55-9635-6d32e6fa5ff7@lucifer.local>
From: Nico Pache <npache@redhat.com>
Date: Wed, 20 Aug 2025 09:40:40 -0600
X-Gm-Features: Ac12FXzD1K71b8kZ8iPzUj6lIyXHh5PjcoNqYYPU597Q2ZwJYp0jVWP2zrGYIjI
Message-ID: <CAA1CXcDORXqm4JoHn4ZSEhT3ajsuY2MAPwefMXk3+YMXcpvqkw@mail.gmail.com>
Subject: Re: [PATCH v10 03/13] khugepaged: generalize hugepage_vma_revalidate
 for mTHP support
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	david@redhat.com, ziy@nvidia.com, baolin.wang@linux.alibaba.com, 
	Liam.Howlett@oracle.com, ryan.roberts@arm.com, dev.jain@arm.com, 
	corbet@lwn.net, rostedt@goodmis.org, mhiramat@kernel.org, 
	mathieu.desnoyers@efficios.com, akpm@linux-foundation.org, baohua@kernel.org, 
	willy@infradead.org, peterx@redhat.com, wangkefeng.wang@huawei.com, 
	usamaarif642@gmail.com, sunnanyong@huawei.com, vishal.moola@gmail.com, 
	thomas.hellstrom@linux.intel.com, yang@os.amperecomputing.com, 
	kirill.shutemov@linux.intel.com, aarcange@redhat.com, raquini@redhat.com, 
	anshuman.khandual@arm.com, catalin.marinas@arm.com, tiwai@suse.de, 
	will@kernel.org, dave.hansen@linux.intel.com, jack@suse.cz, cl@gentwo.org, 
	jglisse@google.com, surenb@google.com, zokeefe@google.com, hannes@cmpxchg.org, 
	rientjes@google.com, mhocko@suse.com, rdunlap@infradead.org, hughd@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 20, 2025 at 7:25=E2=80=AFAM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> On Tue, Aug 19, 2025 at 07:41:55AM -0600, Nico Pache wrote:
> > For khugepaged to support different mTHP orders, we must generalize thi=
s
> > to check if the PMD is not shared by another VMA and the order is enabl=
ed.
> >
> > To ensure madvise_collapse can support working on mTHP orders without t=
he
> > PMD order enabled, we need to convert hugepage_vma_revalidate to take a
> > bitmap of orders.
> >
> > No functional change in this patch.
> >
> > Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> > Acked-by: David Hildenbrand <david@redhat.com>
> > Co-developed-by: Dev Jain <dev.jain@arm.com>
> > Signed-off-by: Dev Jain <dev.jain@arm.com>
> > Signed-off-by: Nico Pache <npache@redhat.com>
>
> LGTM (modulo nit/query below) so:
>
> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Thanks :)
>
> > ---
> >  mm/khugepaged.c | 13 ++++++++-----
> >  1 file changed, 8 insertions(+), 5 deletions(-)
> >
> > diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> > index b7b98aebb670..2d192ec961d2 100644
> > --- a/mm/khugepaged.c
> > +++ b/mm/khugepaged.c
> > @@ -917,7 +917,7 @@ static int collapse_find_target_node(struct collaps=
e_control *cc)
> >  static int hugepage_vma_revalidate(struct mm_struct *mm, unsigned long=
 address,
> >                                  bool expect_anon,
> >                                  struct vm_area_struct **vmap,
> > -                                struct collapse_control *cc)
> > +                                struct collapse_control *cc, unsigned =
long orders)
> >  {
> >       struct vm_area_struct *vma;
> >       enum tva_type type =3D cc->is_khugepaged ? TVA_KHUGEPAGED :
> > @@ -930,9 +930,10 @@ static int hugepage_vma_revalidate(struct mm_struc=
t *mm, unsigned long address,
> >       if (!vma)
> >               return SCAN_VMA_NULL;
> >
> > +     /* Always check the PMD order to insure its not shared by another=
 VMA */
>
> NIT: ensure not insure.
ack, ill fix that!
>
> >       if (!thp_vma_suitable_order(vma, address, PMD_ORDER))
> >               return SCAN_ADDRESS_RANGE;
> > -     if (!thp_vma_allowable_order(vma, vma->vm_flags, type, PMD_ORDER)=
)
> > +     if (!thp_vma_allowable_orders(vma, vma->vm_flags, type, orders))
> >               return SCAN_VMA_CHECK;
> >       /*
> >        * Anon VMA expected, the address may be unmapped then
> > @@ -1134,7 +1135,8 @@ static int collapse_huge_page(struct mm_struct *m=
m, unsigned long address,
> >               goto out_nolock;
> >
> >       mmap_read_lock(mm);
> > -     result =3D hugepage_vma_revalidate(mm, address, true, &vma, cc);
> > +     result =3D hugepage_vma_revalidate(mm, address, true, &vma, cc,
> > +                                      BIT(HPAGE_PMD_ORDER));
>
> Shouldn't this be PMD order? Seems equivalent.
Yeah i'm actually not sure why we have both... they seem to be the
same thing, but perhaps there is some reason for having two...
>
> >       if (result !=3D SCAN_SUCCEED) {
> >               mmap_read_unlock(mm);
> >               goto out_nolock;
> > @@ -1168,7 +1170,8 @@ static int collapse_huge_page(struct mm_struct *m=
m, unsigned long address,
> >        * mmap_lock.
> >        */
> >       mmap_write_lock(mm);
> > -     result =3D hugepage_vma_revalidate(mm, address, true, &vma, cc);
> > +     result =3D hugepage_vma_revalidate(mm, address, true, &vma, cc,
> > +                                      BIT(HPAGE_PMD_ORDER));
> >       if (result !=3D SCAN_SUCCEED)
> >               goto out_up_write;
> >       /* check if the pmd is still valid */
> > @@ -2807,7 +2810,7 @@ int madvise_collapse(struct vm_area_struct *vma, =
unsigned long start,
> >                       mmap_read_lock(mm);
> >                       mmap_locked =3D true;
> >                       result =3D hugepage_vma_revalidate(mm, addr, fals=
e, &vma,
> > -                                                      cc);
> > +                                                      cc, BIT(HPAGE_PM=
D_ORDER));
> >                       if (result  !=3D SCAN_SUCCEED) {
> >                               last_fail =3D result;
> >                               goto out_nolock;
> > --
> > 2.50.1
> >
>

