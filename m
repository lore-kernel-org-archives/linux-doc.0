Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B3242EEAA
	for <linux-doc@vger.kernel.org>; Mon,  3 Aug 2026 19:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785784445; cv=pass; b=H3hY4m36bQUf5TsbgEBv9KZbCWRflmydz+tLDH9xD+ZtaOdo+vYgglZ+zVtI3HW4WjGSfLLyOFj2ZP7J9/iBMWxVUHAXeogKJFqHQPJ8mkpmjzMYuYhUyPbbCmMDWBLMkClkSShkbTC7hcQGiyIR4Qz/2c7U03MNPzL//qLH8Fo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785784445; c=relaxed/simple;
	bh=bBWKgn9bDsTdGb3Ydi0WjLf500Mt/Fpmca0wawQ/xFg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hl0D5Rhu5AOkSdXPhdlA4xzd1SMvwQZofaNK2AMzlYjajbzlhNEntgAgN+gR4Ku0A1mUGDW+6/MRDhjad/2pQiFAO4CEYkaIQP99SV2D5MH/qyvPAwKbXT8QMF604Hsr5esdr9QWfpxE9oDs69qfkxpsAFODmfaakGZxWM1co8w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZE3kbxvP; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=AgvecNT8; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZE3kbxvP";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="AgvecNT8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785784442;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X/pPYy4RtqDllz1NWY+EKpFVQLtXvEhEAFb226eyjbk=;
	b=ZE3kbxvPqunwdxu4FWsfoRPebm24YidiUE/dZWgQvELXPmCerVAkdlxDDGkFbl9ro9WTSp
	zEGdQkzzR1fCQPMzTz8WIJaDwmHee6zqc/rpPPsPnh5pOaggpWiFczNGoJG6JXxdW4DUFI
	lEZBqxsyHasYKy56QLrgQrrb0L72nnQ=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-694-9NlLkfyNPdyk6RoSgzf24Q-1; Mon, 03 Aug 2026 15:14:00 -0400
X-MC-Unique: 9NlLkfyNPdyk6RoSgzf24Q-1
X-Mimecast-MFC-AGG-ID: 9NlLkfyNPdyk6RoSgzf24Q_1785784439
Received: by mail-lj1-f199.google.com with SMTP id 38308e7fff4ca-39b1a8b8bb1so24850831fa.2
        for <linux-doc@vger.kernel.org>; Mon, 03 Aug 2026 12:14:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785784439; cv=none;
        d=google.com; s=arc-20260327;
        b=DI2317mz2sEKqJiiMuylrN/60R59765TNDlR6wASCEkCMz9R162Su27wTKP+XLIhDR
         9gzy4xW/QdiOQKMkk0uRLJq5E+3saMBBq8nanpkYJfpHqfVkujqprYY6QQJ67C//5lip
         6g7NjtZlwyWm09dEjTJ7+JYCB6fkdasJXlz5ZnqY2pMr+szLe8RhnEGoIBZJtKPZTE1W
         CXqHCqGEoATOuBP656oom5NGTsX4C5pWWRYLQLpJC//w7EQvgxy6cWGEimmX87hbmx5y
         m2IMaxNBMQYfhtO9/ecoTJzdoaqXn6wEBhALYHjG942COOSDH3mXmLPEwlWss6+dHYtI
         p6Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=X/pPYy4RtqDllz1NWY+EKpFVQLtXvEhEAFb226eyjbk=;
        fh=6mhLZXCLKAgnCyH26aW5El0DsNrKjPuQgOdn0p5xc1I=;
        b=bPjWOpep4DLG3O6Skoh4UxMfHJHH+VusOzqL4cnqeCHoafLH8LGjV68bOw+pn3tzBO
         1dIbS+VNVdei2H6eU1doXsilqidgEDgaqeV6C1POG/QSjxshdKYGQSRYNIniggELZ8j4
         gyS8QAkiYu4wZA4h/DpNRRjJsKvY3MNZr/bN0s5hT9+g6zKQolGqkxpwb5TXgZXRAkNh
         lf5X8kk8mk2QnbYrSN+aNVP8VlRCuA6Et1GZ2Gb1YXMbJL7BEbeD45P3j45CRhoX0FeG
         ZhHmTEy3gauDRNFWyLwEANeE5R+HDSRgaP1yV2JnnvGOWrNKaB5GXnfbqZZ0ZXES+yDg
         jo5g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785784439; x=1786389239; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X/pPYy4RtqDllz1NWY+EKpFVQLtXvEhEAFb226eyjbk=;
        b=AgvecNT8hW2YIyH737yv2Ut8cvlNuAQQ9tQkZrFnMdrHJRov1XAnXCi777CIjIkLFR
         DUuhH4fExDJ8Gt6MkW0xTOk1TUjS6xefZx8jL+e2PUOW0fli2/xdbFG8LDMrvytH4A/7
         wn/N0/uwj1cSvnq+HuVX37760x+xWqGs+isW7g5jQ1TOdkvAHIugCNwJEI2LdGfbHcQp
         l93OHw6KSRff8AicIuQRltjcUO/B4pnq/X3TpiZfqmLrEcz03hvLD0Mc56ZbYg5u0wZI
         oU3/xgnNTg+wJ6UVAKc1W/eVgPvk/dKbqKysh4gCDhdZxinEOxpWh/2AeQHCL92aPONC
         mJbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785784439; x=1786389239;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X/pPYy4RtqDllz1NWY+EKpFVQLtXvEhEAFb226eyjbk=;
        b=GuIaq3s6TbC/tt4mP7k+OootlJxRpV4O3mWgU0o1ujqPxrWDKP54kkpY+FWmST2VSi
         li3ZcXATV4+rC3hMwIJGPLIHOiLC4zHJsC82HDE9s2U+col/4XQPDTC5az5L4EuUzSZS
         y00pvuAHTj46u8ThtzdP4iQBDJtCI041QhErab6/C94v2jRntnyjdSw1wQwsuvufSr2f
         SpAEE3fp+STh828ILW7jk3IRVGYIwIbYG70mkwy38GrTqQtnJ4IegvGtKNZAZn05CBUs
         h5fMPmRD4WYexZdTx1I7HZVdYq7CyFboGRUTEKRq3+iTS+8KL1f8ERzrRa30OWURv+7e
         9vng==
X-Gm-Message-State: AOJu0YxLLE3LUOqtalKUfI/zkfxZvwll+O0C9cJB47IL0IRiumW+3pVf
	GR3reAG9Y7pa1xgOPY4jFwc0iwqOI+5vC6Ojl5U/oXQpiDYXEHmX4TZkgOxZ20YIbQCElee52SB
	c9GXatxAJy8c65oKt5+vpleNJSxlgIaeZ/ukgxGnh3xyWIHzGj3QBOjdD01I/Q/LnILA4MizfRM
	il6rN9cIQZCzv0Aplg17NQz+ItEKJWy/p1+ZYt
X-Gm-Gg: AR+sD1203wmzXcvEODaX1+mOl5Oa+Lt9ZevQO7bO5S663Ug423D7AK01gWVU0+USmpz
	5tskHtJ6ieEN5r4aXyW0M42C68dohqiWBL7tZbqAYO0ZQQ8Mtuu0RhRvdeB5TWukDFdm+fCCeOb
	Q/GN3IcWBfUs9gtSXzOqAq8Kc55RqgRRvWPToA8pOERTFqDOn21PfEulucRw==
X-Received: by 2002:a2e:a888:0:b0:39f:75e1:9c4d with SMTP id 38308e7fff4ca-39f8644f5d2mr26056241fa.32.1785784439065;
        Mon, 03 Aug 2026 12:13:59 -0700 (PDT)
X-Received: by 2002:a2e:a888:0:b0:39f:75e1:9c4d with SMTP id
 38308e7fff4ca-39f8644f5d2mr26056091fa.32.1785784438664; Mon, 03 Aug 2026
 12:13:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260715025941.1571316-1-npache@redhat.com> <20260715025941.1571316-4-npache@redhat.com>
 <1886019f-62f7-4662-a2b8-07f035fb0a73@kernel.org>
In-Reply-To: <1886019f-62f7-4662-a2b8-07f035fb0a73@kernel.org>
From: Nico Pache <npache@redhat.com>
Date: Mon, 3 Aug 2026 13:13:32 -0600
X-Gm-Features: AUfX_mwVzN7oC0K3lC1WSdyLJudNDTY-fBtILqGmGKAWhFWWmsT44hW5fIJvtzY
Message-ID: <CAA1CXcCofU8t_um5K0GWZY8_qOM7VC1tmw5B=Q56fGTAZHZ58A@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] mm/khugepaged: introduce a count_collapse_event() helper
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Usama Arif <usama.arif@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Zi Yan <ziy@nvidia.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 29, 2026 at 3:43=E2=80=AFAM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> On 7/15/26 04:59, Nico Pache wrote:
> > Provide a simple helper function to help reduce a often used, and
> > duplicate pattern across the khugepaged code.
> >
> > When collapsing to a PMD we need to record a vm_event and the mTHP_stat
> > event. When doing mTHP collapse we only update the mTHP stat.
> >
> > Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> > Acked-by: Usama Arif <usama.arif@linux.dev>
> > Signed-off-by: Nico Pache <npache@redhat.com>
> > ---
> >  mm/khugepaged.c | 36 ++++++++++++++++++------------------
> >  1 file changed, 18 insertions(+), 18 deletions(-)
> >
> > diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> > index e92e2b928f17..f65bbe2051b3 100644
> > --- a/mm/khugepaged.c
> > +++ b/mm/khugepaged.c
> > @@ -689,6 +689,14 @@ static inline bool collapse_is_referenced(struct c=
ollapse_control *cc, pte_t pte
> >               mmu_notifier_test_young(vma->vm_mm, addr));
> >  }
> >
> > +static void count_collapse_event(unsigned int order, enum vm_event_ite=
m vm_event,
> > +             enum mthp_stat_item mthp_event)
> > +{
> > +     if (is_pmd_order(order))
> > +             count_vm_event(vm_event);
> > +     count_mthp_stat(order, mthp_event);
> > +}
> > +
> >  static enum scan_result __collapse_huge_page_isolate(struct vm_area_st=
ruct *vma,
> >               unsigned long start_addr, pte_t *pte, struct collapse_con=
trol *cc,
> >               unsigned int order, struct list_head *compound_pagelist)
> > @@ -709,9 +717,8 @@ static enum scan_result __collapse_huge_page_isolat=
e(struct vm_area_struct *vma,
> >               if (pte_none_or_zero(pteval)) {
> >                       if (++none_or_zero > max_ptes_none) {
> >                               result =3D SCAN_EXCEED_NONE_PTE;
> > -                             if (is_pmd_order(order))
> > -                                     count_vm_event(THP_SCAN_EXCEED_NO=
NE_PTE);
> > -                             count_mthp_stat(order, MTHP_STAT_COLLAPSE=
_EXCEED_NONE);
> > +                             count_collapse_event(order, THP_SCAN_EXCE=
ED_NONE_PTE,
> > +                                             MTHP_STAT_COLLAPSE_EXCEED=
_NONE);
>
> That's not how we indent parameters here. Unless my mail client displays =
it in a
> weird way (doubt).
>
> Same applies to all other cases.
>
> Apart from that LGTM.

Ok sounds good I'll get those fixed and send a new version soon.

>
> --
> Cheers,
>
> David
>

