Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008C92F12CE
	for <linux-doc@vger.kernel.org>; Mon,  6 Jul 2026 17:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783357908; cv=pass; b=Zwc5pv1iMzOZ9HkNz9Bmi80ku6wWHjMCS/8M/crLWX1sCRJ15E39ZPemu03z4+J2ApRV2CzF42yjcDNjMy5IRWBcy5F7ITlmF5nJnRgPmP3RHwZqI+noOqog9NpAfSc++LyJIMuoNIG3xq7+KSDqsXFIgDoj/zHvbubxbL+rgQU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783357908; c=relaxed/simple;
	bh=8wCEdB67mPSxsY4b4e51S4ibooeYUthXssu4BADehsw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nQ8HNVzNs3YRgiMvel8DRTNvmfsGs8Ud1+jYSnxoQd5Ru/EYDpvJFha/3SdqlptMFqOlZ65/0dQVUeHO1BVCQyOvQpeNeVcw6ND5ZA8Es9p/stkosPcdBOvduJ3CGm3dsqJrbsaE6fr9zmoi28fYw0v0YYk3PIlL+b46v1QlaYM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cqFLgAjO; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=MSEoMiIW; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cqFLgAjO";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="MSEoMiIW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783357905;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fnBU98aNlrYevbhd8MxC15hwUsvqjdD5Bdlyv7I0IMA=;
	b=cqFLgAjOb9EdkydzS39hUR5irRjJUYqEn5ZMeYvP7yDtCU1ABKUu6fFZx+v/6ML3jwCGxv
	U5P86mcgdkiWXZlehQ3Xtkzh6zNB1j0A7DK1c+g9NLx/PD9g1srrcFhfVDErfc26y/fv/F
	9NKn7morT3l4PC9BKQWWihHEu90TE8Y=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-568-6Mebz7itPXiEXnV2_WcqYA-1; Mon, 06 Jul 2026 13:11:44 -0400
X-MC-Unique: 6Mebz7itPXiEXnV2_WcqYA-1
X-Mimecast-MFC-AGG-ID: 6Mebz7itPXiEXnV2_WcqYA_1783357903
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-39adcede08cso14104431fa.2
        for <linux-doc@vger.kernel.org>; Mon, 06 Jul 2026 10:11:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783357903; cv=none;
        d=google.com; s=arc-20260327;
        b=Rm2mPXvrYRlX4wj6DrKWvXR4QNK0lCH6JqCste8Uh1EbEC2mtNTcGMYVQWNk8vf+sC
         bkYlIjA0I9PztuUdSjzrrUMaXnGaZKhBrG5kLGEMHtJM34WIeXkGbaTDh/OFdjB7hfDR
         jZsSVjQVgo21DVpcAOOnvGBbv5LRcFw3D6b8aj9SEfdRH+0DjNva3SR+lTCm7ACvK/Lc
         Gwt9Iu1+8qo8m2JFghRdAbOmlRSPAKARs+m4uFg59m+bsIThG0RAzim++Xa1U8VWFY6i
         mxaKAC9SRmlzeQqblQwg046gzu5nL5MjhJCALWN1vM1fF9b2CUZDmnZmAS6wwNxrkHmV
         lpCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fnBU98aNlrYevbhd8MxC15hwUsvqjdD5Bdlyv7I0IMA=;
        fh=Or0j8mwWqea6XCG91Xvba72D8+yOOC2aoKTLyg6w60g=;
        b=CnMp1PR0rLE+R+Yv8LUP0Yer+gTvHqH8eOL9x5bK3D27tk/6zBV1rmxwrHchYG4p/F
         OUg3HixDu2bJe7aXRKDy053DWnA5zJGbBsM4pNSg703/dIsOS4HSJ0ZA36oDCeTVONCX
         4yGcE2bvagt6tPl9qV6o3lBCbkApqHBe2bJO0Jk7BCuNnsRL22J5EYoAbE0cZolVnXbH
         RrSlosvziSWpDEH/+nLqvD9FW1f+Wpcut6fEbZ6SAScABm6a29n2SheCYgmvz0tEAhzo
         H5ZCFbVFY0WnbSdWxAGFTCQpL1qZLJ84boPnuKChO/2SScDp0npQUPVv6tQ+2V8CU4mE
         6WUA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1783357903; x=1783962703; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fnBU98aNlrYevbhd8MxC15hwUsvqjdD5Bdlyv7I0IMA=;
        b=MSEoMiIW7OZTu7HJuwudNie9Gw9WZTl0rA9OtxMKbBOg2R0GzFjkfKAd/jb6w4hiIH
         0SfEGK4Js3C2IyCNy4hkdDGEwUU+vPV9OY2WGhnynoa3fSbw1Rkz77qyjfceKnCmKIUg
         gKCDlIc3PQ5FBbB5y8vgKmxSqE6c7wOUKdO2crVfABAqtdoUIS70THpohtP8e7fc1qZw
         ccu9JTC5ZPlcm9V3gS1FIj5d8IydqCmpb8JhznkOxXCNO48edZhQ4w6kX1xSU+0wxoaY
         saZuUtiC+4hCx2HdJVhOviBqXQBpgrJXaEQBr8lxgBQSrp4oxdYTf+H1upASY3kuzYdA
         VCyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783357903; x=1783962703;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fnBU98aNlrYevbhd8MxC15hwUsvqjdD5Bdlyv7I0IMA=;
        b=APCWSio+Zv7qoGK0NLslrHTtFybZs3K+WT5UwAoQHky+oIp1SxDKKnhIni9kMGHJqh
         uzp1aL2bUiIo5aW+Xu3hgQ8m7WwrL0osfU7/wWKOIxd7aXWK3g3jpOeBIENUFVeSRnEm
         514DaL279Jb/oDV20oG+wIUuPt7ScP4kVxH5IZ6XS3UwHACeP7JzFvnHDDJQmPAWwr0A
         qlbvENJYQ4CHikfz6iua4Z1vgD3D++lSnJcVKV+fsNdzZY4+X8tv0NHjeAlZi1k5p9yX
         Ped9mtY3cmh/0OD7hriSTZhm4H07Wv+SJ9NFm6DTXqcSxPjyuHDtD9h+MvFAfS5+VhNu
         MHpQ==
X-Gm-Message-State: AOJu0YxnXcx993zI04oVAeaQs6pOmSfj27eTi9wJw6H8E2tXhHpM4f09
	+O+C21a5xKY387OtGDckXGqMpV+y3Z64SBz1u2yi5U38BY/p0R7lHW50T6Y0kd+zk4CwGOjnEv2
	5/LzAQAFOKGewv8+6eGFhD7FIgJhOQ9GxQ1bN3X57Lof2Y0hbek+4i2ieKBxnnwtnS/ptwReqSj
	usCAXADufknCbrOpBiUkV0K0iBQqUizR35GOSU
X-Gm-Gg: AfdE7ckOKKUzVHhiIfzucE6oN8uMgXmOtRVdZ7/oriHj527XyT+M3q7/PMbHGjWB/s2
	+ZT1PGU/dUmlrr8RG1b/iBZ+wiNZeo/USEGZIxWG+BvZH2npF+ndqHSO06Klp1Y1imFVh5Ufdcb
	/8KUY/2hVeHNRHlCqXMosoOA8UjJJGaAKSiIybczfYRp4CjJPLIGz4k+Dv7a+wJXtM
X-Received: by 2002:a2e:a410:0:b0:39a:ec61:6b71 with SMTP id 38308e7fff4ca-39c5ffb248dmr3106251fa.24.1783357903139;
        Mon, 06 Jul 2026 10:11:43 -0700 (PDT)
X-Received: by 2002:a2e:a410:0:b0:39a:ec61:6b71 with SMTP id
 38308e7fff4ca-39c5ffb248dmr3106021fa.24.1783357902639; Mon, 06 Jul 2026
 10:11:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260706154500.39178-2-npache@redhat.com> <20260706170755.3387204-1-usama.arif@linux.dev>
In-Reply-To: <20260706170755.3387204-1-usama.arif@linux.dev>
From: Nico Pache <npache@redhat.com>
Date: Mon, 6 Jul 2026 11:12:55 -0600
X-Gm-Features: AVVi8CfrAoNr9vhVuFiPXHyhULcKpIIq9uX8GaPBDKJvs6cE0dILZtuftlDNu0M
Message-ID: <CAA1CXcB+VJvEmRZ-TXKzH5zi=UssCO1ytOy4O9o0icop921VTA@mail.gmail.com>
Subject: Re: [PATCH 1/8] mm/khugepaged: refactor per-scan state clearing into collapse_control_init_scan()
To: Usama Arif <usama.arif@linux.dev>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 6, 2026 at 11:08=E2=80=AFAM Usama Arif <usama.arif@linux.dev> w=
rote:
>
> On Mon,  6 Jul 2026 09:44:48 -0600 Nico Pache <npache@redhat.com> wrote:
>
> > Extract the repeated clearing of node_load, alloc_nmask, and
> > mthp_present_ptes into a helper to reduce duplication in
> > collapse_scan_pmd() and collapse_scan_file(). Althought file scans do n=
ot
> > current use the bitmap, they will in the future, and clearing it now is
> > harmless.
> >
> > Signed-off-by: Nico Pache <npache@redhat.com>
> > ---
> >  mm/khugepaged.c | 18 +++++++++++++-----
> >  1 file changed, 13 insertions(+), 5 deletions(-)
> >
> > diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> > index 617bca76db49..b3985b854e77 100644
> > --- a/mm/khugepaged.c
> > +++ b/mm/khugepaged.c
> > @@ -628,6 +628,17 @@ void __khugepaged_exit(struct mm_struct *mm)
> >       }
> >  }
> >
> > +/*
> > + * collapse_control_init_scan() - initialize/reset collapse_control va=
riables
> > + * that require being cleared once per-scan.
> > + */
>
> Probably don't need the above comment, but apart from that

It was a last minute addition because I feared a review asking to add
a comment ;P I'm cool with either. The nice part of the comment is
that it clarifies these variables are per-scan.

>
> Acked-by: Usama Arif <usama.arif@linux.dev>

Thank you :)

>
> > +static void collapse_control_init_scan(struct collapse_control *cc)
> > +{
> > +     memset(cc->node_load, 0, sizeof(cc->node_load));
> > +     nodes_clear(cc->alloc_nmask);
> > +     bitmap_zero(cc->mthp_present_ptes, MAX_PTRS_PER_PTE);
> > +}
> > +
> >  static void release_pte_folio(struct folio *folio)
> >  {
> >       node_stat_mod_folio(folio,
> > @@ -1616,9 +1627,7 @@ static enum scan_result collapse_scan_pmd(struct =
mm_struct *mm,
> >               goto out;
> >       }
> >
> > -     bitmap_zero(cc->mthp_present_ptes, MAX_PTRS_PER_PTE);
> > -     memset(cc->node_load, 0, sizeof(cc->node_load));
> > -     nodes_clear(cc->alloc_nmask);
> > +     collapse_control_init_scan(cc);
> >
> >       enabled_orders =3D collapse_possible_orders(vma, vma->vm_flags, t=
va_flags);
> >
> > @@ -2686,8 +2695,7 @@ static enum scan_result collapse_scan_file(struct=
 mm_struct *mm,
> >
> >       present =3D 0;
> >       swap =3D 0;
> > -     memset(cc->node_load, 0, sizeof(cc->node_load));
> > -     nodes_clear(cc->alloc_nmask);
> > +     collapse_control_init_scan(cc);
> >       rcu_read_lock();
> >       xas_for_each(&xas, folio, start + HPAGE_PMD_NR - 1) {
> >               if (xas_retry(&xas, folio))
> > --
> > 2.54.0
> >
> >
>

