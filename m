Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646F230FC3C
	for <linux-doc@vger.kernel.org>; Fri,  6 Feb 2026 17:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770399872; cv=pass; b=R9ukGDvNQvXHEuj6IMgN1fgNchQLQjYE8aIVwgzsDKv6gsh3ZndjlmP3iE2lAMt9WSNsQWza1DXUBnINMq+8vJqrBiy+qnRu2gLRaHO4No+JVLgbNYev5jyZjFCvfzOC0F5dltt6oDX7gjlUWKOp2zHmMxrupDS+IFEfRxqqLa4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770399872; c=relaxed/simple;
	bh=7w7Xr+QbIPS4T+2UrkUWXwRRZZ/V9/Endgd0S6rlKSo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F0qT14fXU576peK364+F0khoP6bbHZlIfRudNO2I8YOeKf049sFtFjpJO/SBX6ckAF2bVneuhgyUe/kJnHY2mO2nMKEFdEkbjjLdiiBNI5POR0hXPtYVupUuTWYpV8CQ+hqcE8blhhqryqyMTo8JV9tQdwVOIwjy9yNGqdKhaok=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Eua+VPO7; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=DmeMW8K2; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Eua+VPO7";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="DmeMW8K2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770399871;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+BF3+3nS/V8JxWcSboqH9V3mdaa6NoZICmA/Jv+aI30=;
	b=Eua+VPO7gSiffGYUKGiJ0v10eV+08gbEbrZXnw3b1cN30GhBUb7l31OZvs0aAxlZ7HkBvA
	Kea50FRvQD39s/Z53YOOwK+xCuPumfno4YgvUt7IPOFBWSqmXK+QgzdBSIWfCv8iVtWDwg
	KSObZsTIo0uCq5Ukw7m8Qk74LpcNq+E=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-691-D6DQNHJCM2SQqk_87mBI2A-1; Fri, 06 Feb 2026 12:44:30 -0500
X-MC-Unique: D6DQNHJCM2SQqk_87mBI2A-1
X-Mimecast-MFC-AGG-ID: D6DQNHJCM2SQqk_87mBI2A_1770399870
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-790afc07667so28559027b3.0
        for <linux-doc@vger.kernel.org>; Fri, 06 Feb 2026 09:44:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770399870; cv=none;
        d=google.com; s=arc-20240605;
        b=Axqfkj1zDXSI8K/pgrnmxSavVLJOlDBA5PVd8wD5q/baX0hIDqfoEYNQS7sSvUYu5G
         ZiGh8zNS1CjCWrC/TCH1SO7z8QWi4N1odcFPwfbKIC2DKEZ1PsTfQWGXF6pnwQSspqBK
         oyuITY52MRsjnqLBumA3n126dR+WSySZjsn+LOyuM3MitNhqt8MwA2YpYZHP4pl0ZjK9
         BGdMbtkuXaltSCPha0wDdt8g3aCHi27TA5L1TldZqUymdy4WdBBF3QG2iFX5pB9CWWCF
         yNCmUQ+3wqrLMFHdqXqMSAdILSep77RztW6iLZPy8Lxkan2uk64sOK7LrzrldQMNkfXj
         Dgag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+BF3+3nS/V8JxWcSboqH9V3mdaa6NoZICmA/Jv+aI30=;
        fh=5+6iVMgK9u9MTPIkp1ez+eXJpuukiCUHqdXlyDnL8K8=;
        b=HknftasqQX+ZtDUaqc+Klc953xHiFAhGK99QnysD9xZSpkr0DDbotHFTQ0gHNFln24
         TMIdjZXWf9EOs/ypE5jlZb28A0Cnwb+J1iRzEII1i7oQ3ngWXsIDiPXnbA8KNazHNGQX
         Q9txcBKOkrCzY+C2/i9PYA8QTzbsilfIlRe8sIPYSvguQhXylDdFSeQvhfv110uJ+nf5
         eyGzFhkYh5GIHFOoX2tNCaeRLhOgkdMQe9aJqEJn5xO8WImQXhNgZinYTWpypw3XM8PE
         azxYuD0s6fnoCVKdUQFCs5nHppZwyqIW1X039VSN812oXYuWZGix707DnKngUGYw1vVJ
         uCJw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1770399870; x=1771004670; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+BF3+3nS/V8JxWcSboqH9V3mdaa6NoZICmA/Jv+aI30=;
        b=DmeMW8K2x+VOu61i0pSFawId9fL/3SEFKhJ7UGRSstvIodO4uSQu57HSBvu+ag0AQa
         q7FaGR10VnpfxxgN5+kJ1JQflPL/mKBqfDdFztlnd8VEO1dqB4oemxHoqWPMOboRLwfI
         +NNkBhS/Q507QkvnrsbdbfWWH93jQ+ZGws0bpS7L1Ul0960NlQhl7/iK69KvXVf/a8Lt
         ApOBvIOQTxfO93OLpUgq8BMRXReetTsxEgmmFYnBUNvj3mJOIw0Fjzah37VNHdgCL9Xt
         Lm89uFW9qFtVerNVQIfgw8/SRedWYel/4o9ywPq6z7BxSBCyn4iY+ZCJwGS73dzil4Dj
         AfGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770399870; x=1771004670;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+BF3+3nS/V8JxWcSboqH9V3mdaa6NoZICmA/Jv+aI30=;
        b=M/CKxTqa6QhfL0+6qLwmKaxd+roxyAM/wKHGLpEPAr/KvjMktjKWcf94WaKFm25Eaj
         VbEXLVris4i5FjPvLvjQQnTzDIJQbID7YqwT8n75EopTJTLWDcu2P2wzvJS3Rqkz4b6u
         BrbJ+pJG4MCL+DCMbvYutpXwvglZZCsRM0RqfI1MlYiaL9u5ZTOHjEkq6RiTKg4nXUr/
         pTyH0UmMCA+45VN2Opl71hxpAJuJ92EdpS6rrnOWJ42lmENiM9u7TZSCTq0zJN5DrTT+
         IH/j7luBh1RQqUfmxrpx/IwmIRiWZVqEFlQR5rVhMhxL1WEtP/odtZEuptslOUQBkWmc
         cPTw==
X-Forwarded-Encrypted: i=1; AJvYcCWR1nhlN9fqLKAApoFRhYD19iMIYiyj3UfNi1gpBNibZvDYjWw+qgPZlIhsXbNymJwVVvpqDb5JhK8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4z5iwGDAMHMWc6AQh92Dtjag+R6ysbmFieMzNXFLG3rRNDmLG
	BtoE6zO60s/KbIeVUUUoiV6h/8YMjB9yagg7sSSJYYXnSe2M60CXBbMZwUBe2go/F/amG8wFYAE
	lL7IJBF2ctAaiff7B8zphPug0VAkWM0qzJB5YkKZBmJ6S+gD3JzDCmN9ccK7/YnUUHtLL7xSoEx
	Ba5aVeq1Y6XI6lIk4WKD+xlEh5DTujGMvFzoG8
X-Gm-Gg: AZuq6aKFRnRgbKFI8ypsYYIvcRh8uSPvFxsL3/i0Svf7STKJZwNQ7qoxEcYrLm5Y/Mp
	40W7gWEnX0StxIN5GRJJzUUWszrUWHczWPIFrcrhcLizfvW50/3t0ZReJWLoBqfGkSSP0f8ieuq
	mNEYK9OQAeYgi9AzuVQvAZm+XJ3PE2A1/Xl6ulPwfuhV05FmMQSQrhAvKa5hkH520mSfFBgOVxe
	HajAnGO
X-Received: by 2002:a05:690c:95:b0:794:dc33:bc17 with SMTP id 00721157ae682-7952ab3fb55mr32336717b3.34.1770399869676;
        Fri, 06 Feb 2026 09:44:29 -0800 (PST)
X-Received: by 2002:a05:690c:95:b0:794:dc33:bc17 with SMTP id
 00721157ae682-7952ab3fb55mr32336437b3.34.1770399869119; Fri, 06 Feb 2026
 09:44:29 -0800 (PST)
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
Date: Fri, 6 Feb 2026 10:44:03 -0700
X-Gm-Features: AZwV_QgCX_uZwp1i-uJAy0wyCUDEIyNfRNZ14VALyUVhoxl38w4ekqWKsufLGVM
Message-ID: <CAA1CXcBQWPD=AxX9mCOdAOv85LTk+FPJQeEudQur-ymg4vbp5g@mail.gmail.com>
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

Would a shorter name be appropriate? COLLAPSE_MAX_PTES_LIM(IT) is
quite long. Can we call it MAX_PTES_LIMIT or KHUGE_MAX_PTES_LIM?

-- Nico

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

