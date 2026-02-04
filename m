Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0408438E5FF
	for <linux-doc@vger.kernel.org>; Wed,  4 Feb 2026 21:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770241205; cv=pass; b=kCXJn+0s/USUBtNLNNKzTZgoPg1QXxNGVVp7uvJGZ8gCTUcFCwZqP407ff+oTGSU3N8qL8vKeeBniKv0dhCiUfJEtB5OeTp8aCoPU/AfGra9zx9dFqN5AZkaXIRpLM0QmYGQj+u+TcGqg9ZqCLHGuCXP9nXWmmUiEmiI0PIFNII=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770241205; c=relaxed/simple;
	bh=sBrgGJZeRGpCcKQa1Nkipjs2qjlNQKQCOxzY/hPe9PQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jN5mkxvBAXKS/fzF2SHEkI3RGqUKeAXUrmCUalBQMN0FB/ayd3xZC0ctXNWy8rTUsxeT1Km1In7otInKs8OTKU6MyZ1sAjJQ1iEieRlqeImXSGImixCz2xkdS+3L/Yk5sjTln9abmo4v/33/cB0BfVZB4pXxa31G3Ic2pqcBOXM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZgUTEF7G; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=t2MZP9kO; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZgUTEF7G";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="t2MZP9kO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770241204;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u/RRR9VLmVAaUDYnt9wwOlgiAGyPDV2RrmGH4fySXkM=;
	b=ZgUTEF7GGy1B3Btts//LgO2RkRS5N+Y0adqkJ700AShFeVJMOHFUQXLTMRnSNL2iIrPASv
	mrqCAypYM2tIgVuqSicVf+Cmp+mFmmJsUfy7UDlYD4TM75XwmqZJ6s6r/kS0UfmAj6h85M
	3Obn42iBygIvpqYXw/PC3+H0fpcuJAM=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-630-cmzRadUXMZ2-1QM5z8TLHQ-1; Wed, 04 Feb 2026 16:40:02 -0500
X-MC-Unique: cmzRadUXMZ2-1QM5z8TLHQ-1
X-Mimecast-MFC-AGG-ID: cmzRadUXMZ2-1QM5z8TLHQ_1770241202
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-79508c7def0so3545557b3.2
        for <linux-doc@vger.kernel.org>; Wed, 04 Feb 2026 13:40:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770241202; cv=none;
        d=google.com; s=arc-20240605;
        b=lnZ4dxv4lsfAja8w0Zr2ZHyEQJ0wrdyI+Mg0r+LQ1sgwl0eO1sxV22D5bMS6cj95yR
         b99gZyvmGkNsiyGEQXa3DiQNAADfnPhKqQkJpvX/ZBJR5Z723od4dZSidEEKADDzJ4Cz
         Z5fypbp66XGLbFlRezwtdmczXor5mrftPNu9V/dkp4PIi3/UBU1K64D3WzwPeBzf6x8s
         uxty1IBbfC+iHkcteMBEzqzuBJCcEsMsvb+i0kfVULRQBdFzwYEyTd5H3GJsu/6yBeZl
         FBoYQvYaf7pLYyrCd1lxCM6ZThfSRYxcm8URlsSXGjjmxkLXdbyKIkZgr7mZhqbpY28d
         EILQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u/RRR9VLmVAaUDYnt9wwOlgiAGyPDV2RrmGH4fySXkM=;
        fh=2TSyDXwz2MlhuvWxcnFZK3ATMmeUwHZ61tFvb7+s6Go=;
        b=kMl1D7N1OuX0bB1cG4EBdmGsaH9LL6kPKbBsSTHCeQQvKXpaFsF4wRnannzvESedE9
         O/zTOuV/oN1W5KbY7R8izPp77hHmrZc0Qh+gBmvAyuhEiSYvJKosZPg5l6QBC8TaBvax
         ik0WkmaHFNK/dl7YcJ+sXt6k/JB6X3WmpLgO7Pt9wFTEJUkBFys4p+OaKOO2DA3kKenm
         ymiUMfqvt23kEO4Q6MuNBpLbt19d4Ovw+yY9lPxs6iSf6M/tCGWiERUZtRe3a4h1gLN6
         QoFYXZ5019h5ns0reaYWB77jadyUxyvgBAIz36JL4SoYxfEj1QjSxdUsy1xJfboC+bwq
         fAug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1770241202; x=1770846002; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u/RRR9VLmVAaUDYnt9wwOlgiAGyPDV2RrmGH4fySXkM=;
        b=t2MZP9kOX+dWvT6howJRVX0dbw1opT6tlKJKg8+b+bQgP8vmGNKiaFsjOp6eB/MpQi
         /TXj4pUauCfNkBtiWAVxqAnD4S96QcAaiLvpZglBYSQr2y7t98U7QeSVxtNnBmCGYJL6
         m0wtBPky0z/ZBpnDlujAj4svn0/Qu41bEkaLBgHy2psDjt9cKuVT1eR6Whod5FiCC+ae
         BLKGefe7AO3nhgpa8ueygLO9DWqT2OcIzux44cjh/ggG4FK2+WjYbA6yQ+nHT0to05Qc
         g9pAs2Ha8heWwnruIMqC8Ti4gOHc/7RopTS3yyPVOFR3KT4vN9jb+/G7atmpBt3FJw11
         SKVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770241202; x=1770846002;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u/RRR9VLmVAaUDYnt9wwOlgiAGyPDV2RrmGH4fySXkM=;
        b=EkHszy/HbutPPQijAXzhPQqrPpprcAlUjLcHgUlGuw64Q82mrJyvQKzNA4U9/LtxbY
         92FQ0RYk8EqV8SBp/KMBF47cCkNajCtegJP3EjBYNPNNKQtCUMMvluKMhkEhLxd4wi8a
         JDEpb4scBcav1lQcxTeaiWPGQhjV7FpT5D/bgUXBsGj96EiRqy4s7rJWFkCNNpiD3KpD
         0WsJ0uaRejP41GvhNb2IYcev4q5UfIF2SEJNpekCqTZ2QfYpaswXV1zOZHUi0Cbtl4zX
         fwuNNBhh8ql+dxrJS5Cxi0MV6xrfrqdxW649TSDcT6BzhWP0WDUKD5e1z1ghmk7sWeqW
         VYRw==
X-Forwarded-Encrypted: i=1; AJvYcCUEgS6LCwqaBkhbCyb1oGkmdt/6yUB0xOF5w2TcQTlVVxmHJqe56R1w7jn7kXeeuMdMy7PJsiWF+nU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/5/qRLMmSM+U5dUDRgsDxNwcJHNXkEtSiHFoa04y7DLmDKylP
	zxeg5XyqSrOvBCigHIXud4YCBDcR6LG4MbNS0TyPIS/EVyZ4Qn9PIzAd46k01TibY0X2w0Pj460
	tW0V5o/gD0QrYBkSAQv7pVFZXjtc8sMAFViVyiTBGb1ICOnwotrunwQ3sR0ICc7tFSNl1d4/AYP
	epCsoQBqgW604S8Zrc7kmjkbO8oeDh8QBF2FGu
X-Gm-Gg: AZuq6aIfuZnF77uTaYLybGdGhBzi6AMC5Jbgiijyfww/EM3bMC1OcICMuGNqDV9qXPe
	uiMjjNDQYWtAP5jRFjLtndjb2maFJBKDeQyCB35Dbblev9YESIiR/0ofnrzJEk8IiUoaok70Yxb
	UFkkzylqD4d5J4fGKyqpFYH8qDWohfUId9LDBP7mG5nv/IwG5bCM9M984aTRkNVVic
X-Received: by 2002:a05:690c:e3cb:b0:794:eeba:55af with SMTP id 00721157ae682-794fe763e45mr43273487b3.39.1770241202063;
        Wed, 04 Feb 2026 13:40:02 -0800 (PST)
X-Received: by 2002:a05:690c:e3cb:b0:794:eeba:55af with SMTP id
 00721157ae682-794fe763e45mr43273167b3.39.1770241201601; Wed, 04 Feb 2026
 13:40:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260122192841.128719-1-npache@redhat.com> <20260122192841.128719-8-npache@redhat.com>
 <db10946c-9743-49e0-a845-7f53a60778a6@lucifer.local>
In-Reply-To: <db10946c-9743-49e0-a845-7f53a60778a6@lucifer.local>
From: Nico Pache <npache@redhat.com>
Date: Wed, 4 Feb 2026 14:39:35 -0700
X-Gm-Features: AZwV_QiWF5a0ic6AE73ER09Zi2Q0iEGOziUo-C9Qoix8T3UNqNr91IEvUAcICs0
Message-ID: <CAA1CXcAEc4McCq5iCeF69-Kc6R-5Sxk9-+QrkW1Ht+00ACJjfg@mail.gmail.com>
Subject: Re: [PATCH mm-unstable v14 07/16] khugepaged: introduce
 collapse_max_ptes_none helper function
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	akpm@linux-foundation.org, david@kernel.org, ziy@nvidia.com, 
	baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com, ryan.roberts@arm.com, 
	dev.jain@arm.com, baohua@kernel.org, lance.yang@linux.dev, vbabka@suse.cz, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, corbet@lwn.net, 
	rostedt@goodmis.org, mhiramat@kernel.org, mathieu.desnoyers@efficios.com, 
	matthew.brost@intel.com, joshua.hahnjy@gmail.com, rakie.kim@sk.com, 
	byungchul@sk.com, gourry@gourry.net, ying.huang@linux.alibaba.com, 
	apopple@nvidia.com, jannh@google.com, pfalcato@suse.de, jackmanb@google.com, 
	hannes@cmpxchg.org, willy@infradead.org, peterx@redhat.com, 
	wangkefeng.wang@huawei.com, usamaarif642@gmail.com, sunnanyong@huawei.com, 
	vishal.moola@gmail.com, thomas.hellstrom@linux.intel.com, 
	yang@os.amperecomputing.com, kas@kernel.org, aarcange@redhat.com, 
	raquini@redhat.com, anshuman.khandual@arm.com, catalin.marinas@arm.com, 
	tiwai@suse.de, will@kernel.org, dave.hansen@linux.intel.com, jack@suse.cz, 
	cl@gentwo.org, jglisse@google.com, zokeefe@google.com, rientjes@google.com, 
	rdunlap@infradead.org, hughd@google.com, richard.weiyang@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 3, 2026 at 5:09=E2=80=AFAM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> On Thu, Jan 22, 2026 at 12:28:32PM -0700, Nico Pache wrote:
> > The current mechanism for determining mTHP collapse scales the
> > khugepaged_max_ptes_none value based on the target order. This
> > introduces an undesirable feedback loop, or "creep", when max_ptes_none
> > is set to a value greater than HPAGE_PMD_NR / 2.
> >
> > With this configuration, a successful collapse to order N will populate
> > enough pages to satisfy the collapse condition on order N+1 on the next
> > scan. This leads to unnecessary work and memory churn.
> >
> > To fix this issue introduce a helper function that will limit mTHP
> > collapse support to two max_ptes_none values, 0 and HPAGE_PMD_NR - 1.
> > This effectively supports two modes:
> >
> > - max_ptes_none=3D0: never introduce new none-pages for mTHP collapse.
> > - max_ptes_none=3D511 (on 4k pagesz): Always collapse to the highest
> >   available mTHP order.
> >
> > This removes the possiblilty of "creep", while not modifying any uAPI
> > expectations. A warning will be emitted if any non-supported
> > max_ptes_none value is configured with mTHP enabled.
> >
> > The limits can be ignored by passing full_scan=3Dtrue, this is useful f=
or
> > madvise_collapse (which ignores limits), or in the case of
> > collapse_scan_pmd(), allows the full PMD to be scanned when mTHP
> > collapse is available.
>
> Thanks, great commit msg!
>
> >
> > Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> > Signed-off-by: Nico Pache <npache@redhat.com>
>
> This LGTM in terms of logic, some nits below, with those addressed feel
> free to add:
>
> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

Thanks :)

>
> Cheers, Lorenzo
>
> > ---
> >  mm/khugepaged.c | 43 ++++++++++++++++++++++++++++++++++++++++++-
> >  1 file changed, 42 insertions(+), 1 deletion(-)
> >
> > diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> > index 0f68902edd9a..9b7e05827749 100644
> > --- a/mm/khugepaged.c
> > +++ b/mm/khugepaged.c
> > @@ -460,6 +460,44 @@ void __khugepaged_enter(struct mm_struct *mm)
> >               wake_up_interruptible(&khugepaged_wait);
> >  }
> >
> > +/**
> > + * collapse_max_ptes_none - Calculate maximum allowed empty PTEs for c=
ollapse
> > + * @order: The folio order being collapsed to
> > + * @full_scan: Whether this is a full scan (ignore limits)
> > + *
> > + * For madvise-triggered collapses (full_scan=3Dtrue), all limits are =
bypassed
> > + * and allow up to HPAGE_PMD_NR - 1 empty PTEs.
> > + *
> > + * For PMD-sized collapses (order =3D=3D HPAGE_PMD_ORDER), use the con=
figured
> > + * khugepaged_max_ptes_none value.
> > + *
> > + * For mTHP collapses, we currently only support khugepaged_max_pte_no=
ne values
> > + * of 0 or (HPAGE_PMD_NR - 1). Any other value will emit a warning and=
 no mTHP
> > + * collapse will be attempted
> > + *
> > + * Return: Maximum number of empty PTEs allowed for the collapse opera=
tion
> > + */
> > +static unsigned int collapse_max_ptes_none(unsigned int order, bool fu=
ll_scan)
> > +{
> > +     /* ignore max_ptes_none limits */
> > +     if (full_scan)
> > +             return HPAGE_PMD_NR - 1;
>
> I wonder if, given we are effectively doing:
>
>         const unsigned int nr_pages =3D collapse_max_ptes_none(order, /*f=
ull_scan=3D*/true);
>
>         ...
>
>         foo(nr_pages);
>
> In places where we ignore limits, whether we would be better off putting
> HPAGE_PMD_NR - 1 into a define and just using that in these cases, like:
>
> #define COLLAPSE_MAX_PTES_LIM (HPAGE_PMD_NR - 1)
>
> Then instead doing:
>
>         foo(COLLAPSE_MAX_PTES_LIM);
>
> ?
>
> Seems somewhat silly to pass in a boolean that makes it return a set valu=
e in
> cases where you know that should be the case at the outset.
>
> > +
> > +     if (is_pmd_order(order))
> > +             return khugepaged_max_ptes_none;
> > +
> > +     /* Zero/non-present collapse disabled. */
> > +     if (!khugepaged_max_ptes_none)
> > +             return 0;
> > +
> > +     if (khugepaged_max_ptes_none =3D=3D HPAGE_PMD_NR - 1)
>
> Having a define for HPAGE_PMD_NR - 1 would also be handy here...
>
> > +             return (1 << order) - 1;
> > +
> > +     pr_warn_once("mTHP collapse only supports max_ptes_none values of=
 0 or %d\n",
> > +                   HPAGE_PMD_NR - 1);
>
> ...and here.
>
> Also a MICRO nit here - the function returns unsigned int and thus we
> express PTEs in this unit, so maybe use %u rather than %d?
>
> > +     return -EINVAL;
> > +}
>
> Logic of this function looks correct though!
>
> > +
> >  void khugepaged_enter_vma(struct vm_area_struct *vma,
> >                         vm_flags_t vm_flags)
> >  {
> > @@ -548,7 +586,10 @@ static enum scan_result __collapse_huge_page_isola=
te(struct vm_area_struct *vma,
> >       int none_or_zero =3D 0, shared =3D 0, referenced =3D 0;
> >       enum scan_result result =3D SCAN_FAIL;
> >       const unsigned long nr_pages =3D 1UL << order;
> > -     int max_ptes_none =3D khugepaged_max_ptes_none >> (HPAGE_PMD_ORDE=
R - order);
> > +     int max_ptes_none =3D collapse_max_ptes_none(order, !cc->is_khuge=
paged);
>
> Yeah, the !cc->is_khugepaged is a bit gross here, so as per the above, ma=
ybe do:

Ok sounds good! I'll make the recommended changes.

Thanks!

-- Nico

>
>         int max_ptes_none;
>
>         if (cc->is_khugepaged)
>                 max_ptes_none =3D collapse_max_ptes_none(order);
>         else    /* MADV_COLLAPSE is not limited. */
>                 max_ptes_none =3D COLLAPSE_MAX_PTES_LIM;
>
> > +
> > +     if (max_ptes_none =3D=3D -EINVAL)
> > +             return result;
> >
> >       for (_pte =3D pte; _pte < pte + nr_pages;
> >            _pte++, addr +=3D PAGE_SIZE) {
> > --
> > 2.52.0
> >
>

