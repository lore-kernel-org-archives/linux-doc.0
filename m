Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 976123128D0
	for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 02:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768358356; cv=none; b=EjdlXbkHjBjWYKfAkiyrnGHNfowX2UjpN/dnLNWEbKV0SgY4CteajzPIChxgCtXK5u2ZqanaOMPEqjKBpMFJY4SJAvbAoD+a6ke03ZBVuUGJm3TzfWMQ+YZKQ5v2GyY2cFhbkQnUE12QvoG0pBl1CLiQbWVyvXUPF4zIZG4bf28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768358356; c=relaxed/simple;
	bh=4kEiZQdMuLDYjvuzWO3Ebx5AEJmfCVbLhWyIIpWBH4Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H5CICb5F6pDgEV8en0/yhIRoF5JoiyMOCAxzOf9A5Tq/JWc0/c/pkfrxoP0WsQkotBL0PqMUg9hfoBzdCMHiQtRBeIEg2M+njcvek6DlQf9RaiXM7rn/uoWY/fgWBY2e8DP5B9su7bNG/venZH9pNIp+I+DlgwztaawfXzY9TZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aNplaCau; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=c1ltak2v; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aNplaCau";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="c1ltak2v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768358353;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GsaYDMAkcB1oPv2ajw72CMxvsVxtZEIcouIazzEAlDI=;
	b=aNplaCauykPZoqXB2UuICvkLLAMNU7jzweBAxPZGJecRpHFmW0L92C8+fQtSV8ik9DGLy6
	x5xNwyiVGFdvD3xesaz7pl1nlyo6RiioCFalFyN5qRyY2KctVIQZsdGC93AYyPPNak+1W/
	+ItoHaQrni7kE/7YDy8yollyL33LzB4=
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com
 [74.125.224.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-518-GGBL85eqNSWFi4xYsbs0bw-1; Tue, 13 Jan 2026 21:39:06 -0500
X-MC-Unique: GGBL85eqNSWFi4xYsbs0bw-1
X-Mimecast-MFC-AGG-ID: GGBL85eqNSWFi4xYsbs0bw_1768358346
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-6455731c6e0so13413631d50.1
        for <linux-doc@vger.kernel.org>; Tue, 13 Jan 2026 18:39:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1768358346; x=1768963146; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GsaYDMAkcB1oPv2ajw72CMxvsVxtZEIcouIazzEAlDI=;
        b=c1ltak2vJOQm3NOE9Kem1e1PKLsxEVG7TuL25c6jjAXADDmwdao03ZfQWoySwUSMtb
         bkd0U4Y9Lk+dw6VnaBWZHHoJwCuSyJQ3UZ7t2851QzjQ+uzV3iSr89wDxkoz6jV3Uw+F
         lJWUgqG6YblOIAg9dXmmQjXNuefaT190nZueNJiuU9K+zQP7LvT+ZI+A6Uhfx+NiMO/w
         82WZPiVKEFduljNH0bQ2HAvMQXyzrHJZXK1lDgWk4H0o6yr+Cn+lREudO7zxtua0lFna
         h3/RCevXS1vAuLrL5iyAz8tOXwFuqXVkzBxKnpyGvkjFUu8JpasBbWtet7d5QJB3lFRP
         OmDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768358346; x=1768963146;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GsaYDMAkcB1oPv2ajw72CMxvsVxtZEIcouIazzEAlDI=;
        b=pNBTknDaaq5CGkXX2Ka+4qfNfjmx/bCr5WDrE0bmDheRK4IRmjZErHsP07j65zJaD4
         jJDsNkoo55zxLKTYJJyYeBwsKP1K6cmVFiWEUFKnYADAnSUMhHE9vVFyFULRr9h7kPrO
         O9uMtmq6b1jwUCaEQT5iFoWKDaLjD6jyOCWvUJQmzREct5sBfYjW/DlcHk0ftSlQQl3E
         S0J70eitd05BW/xoZMe9VkMgqs9IwujZmObI00ouIVx1UpFgvoLCkqjusCNT7g1JBAj6
         wM9ff9ByfpyBw39Kxq7biFGFi903MMQuEbSTmWxkkCyZZfIr3D6RKXcZt3pRzAthGi9X
         BS+w==
X-Forwarded-Encrypted: i=1; AJvYcCVzEjV+z/yNqZVML5/7h5e6E8VQedMBvjdBAfLkAUXpM8hMwwWL9PryH607rF4+yWxJLA2gtT1iFzg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRoRq0S3baAxvl+xxndp3ugOGtuEaCwO7JSmv1qJhjcwaPVOV9
	YOY/rDB96usH8AmdTy0N5hjgzS1LYhgZlvUy7imWKDyszCFk33+pssFcl74BUwqJ3OsyKnOKrSW
	lqZflYAZ7epoiJo/SFAR5ejv+FyaNRBsNdvaA2rqQIg/ko+tNqzvHK9I0YxQNGSd4xLbGEB8+tD
	AoqwEBh0wMV+M9Dy4vQs/fTovFBkH8rulNEKFB
X-Gm-Gg: AY/fxX4D0h9W2cNLDFkg1uVwNpIoxeGjTg3tKF9MZUN0I9LoOmbLVyi2aNkFlBmTgtN
	ka9lm0ynxg8ECDG5XxrPOKmIgVaSs93FaA5AuCXhvhjPm5tpKn33MI/HMH3xlYxB1mbYVhWljNQ
	zRyKNfBEQVbpOqMZ13swyr8ou/DDNKIuSG6DyLSd9Ew1bXyR4bIYppaQqHyKcvBPw7JMhXQN/BQ
	FPfWZqe
X-Received: by 2002:a53:b199:0:b0:63f:9928:3f85 with SMTP id 956f58d0204a3-64901b01ee2mr778900d50.62.1768358346197;
        Tue, 13 Jan 2026 18:39:06 -0800 (PST)
X-Received: by 2002:a53:b199:0:b0:63f:9928:3f85 with SMTP id
 956f58d0204a3-64901b01ee2mr778884d50.62.1768358345750; Tue, 13 Jan 2026
 18:39:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251201174627.23295-1-npache@redhat.com> <20251201174627.23295-6-npache@redhat.com>
 <CCE3840A-A46A-4F33-8412-FC55161A6D6C@nvidia.com>
In-Reply-To: <CCE3840A-A46A-4F33-8412-FC55161A6D6C@nvidia.com>
From: Nico Pache <npache@redhat.com>
Date: Tue, 13 Jan 2026 19:38:39 -0700
X-Gm-Features: AZwV_Qg4QcCHsWf9Yf2aqPxUCcKE6236uDrcuWobRoGZDAiQfOTpw9hN9JUYA5U
Message-ID: <CAA1CXcC9YsOKbsvyZpgOwLdE938VBcPUrLyF97uN024uM2uiPA@mail.gmail.com>
Subject: Re: [PATCH v13 mm-new 05/16] khugepaged: introduce is_mthp_order helper
To: Zi Yan <ziy@nvidia.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-doc@vger.kernel.org, david@redhat.com, 
	baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com, ryan.roberts@arm.com, 
	dev.jain@arm.com, corbet@lwn.net, rostedt@goodmis.org, mhiramat@kernel.org, 
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

On Tue, Dec 2, 2025 at 8:13=E2=80=AFPM Zi Yan <ziy@nvidia.com> wrote:
>
> On 1 Dec 2025, at 12:46, Nico Pache wrote:
>
> > In order to add mTHP support, we will often be checking if a given orde=
r
> > is a mTHP or PMD order. Lets create a simple helper function to keep th=
e
> > code clean and readable.
> >
> > Suggested-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > Signed-off-by: Nico Pache <npache@redhat.com>
> > ---
> >  mm/khugepaged.c | 9 +++++++--
> >  1 file changed, 7 insertions(+), 2 deletions(-)
> >
> > diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> > index 8599c7fa112e..9c041141b2e3 100644
> > --- a/mm/khugepaged.c
> > +++ b/mm/khugepaged.c
> > @@ -338,6 +338,11 @@ static bool pte_none_or_zero(pte_t pte)
> >       return pte_present(pte) && is_zero_pfn(pte_pfn(pte));
> >  }
> >
> > +static bool is_mthp_order(unsigned int order)
> > +{
> > +     return order !=3D HPAGE_PMD_ORDER;
> > +}
> > +
>
> The code at the bottom of __folio_split() in mm/huge_memory.c
> can use this helper.
>
> The code in deferred_split_folio() uses folio_test_pmd_mappable()
> instead of order =3D=3D HPAGE_PMD_ORDER, but the code can be changed
> to use the helper.

static inline bool folio_test_pmd_mappable(struct folio *folio)
{
return folio_order(folio) >=3D HPAGE_PMD_ORDER;
}

Should we make the is_mthp_order() check all orders that are less than
HPAGE_PMD_ORDER.

ie)

+static bool is_mthp_order(unsigned int order)
+{
+     return order < HPAGE_PMD_ORDER;
}

This way it's true to its mTHP nature being smaller than the PMD.

Cheers,
-- Nico

>
> >  int hugepage_madvise(struct vm_area_struct *vma,
> >                    vm_flags_t *vm_flags, int advice)
> >  {
> > @@ -1071,13 +1076,13 @@ static int alloc_charge_folio(struct folio **fo=
liop, struct mm_struct *mm,
> >       folio =3D __folio_alloc(gfp, order, node, &cc->alloc_nmask);
> >       if (!folio) {
> >               *foliop =3D NULL;
> > -             if (order =3D=3D HPAGE_PMD_ORDER)
> > +             if (!is_mthp_order(order))
> >                       count_vm_event(THP_COLLAPSE_ALLOC_FAILED);
> >               count_mthp_stat(order, MTHP_STAT_COLLAPSE_ALLOC_FAILED);
> >               return SCAN_ALLOC_HUGE_PAGE_FAIL;
> >       }
> >
> > -     if (order =3D=3D HPAGE_PMD_ORDER)
> > +     if (!is_mthp_order(order))
> >               count_vm_event(THP_COLLAPSE_ALLOC);
> >       count_mthp_stat(order, MTHP_STAT_COLLAPSE_ALLOC);
> >
> > --
> > 2.51.1
>
>
> Best Regards,
> Yan, Zi
>

