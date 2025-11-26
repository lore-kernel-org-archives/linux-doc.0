Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F0C9313536
	for <linux-doc@vger.kernel.org>; Wed, 26 Nov 2025 23:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764199804; cv=none; b=jrivzWzcZ5EZdD53N322CH1kXQVFN2xetACaEzN4bLNBVrHZA8b8QKCkiK33K42Q+a6nXOisd+Ip95Jo2DIqGkOkHvv/oJr4005o3GcLCSlIHHgUmCy5eByfeoLWR6vb1GWV2cOcms+aIVfRwkLswml0/GiS6MY7lFNyoehFmTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764199804; c=relaxed/simple;
	bh=P5gc2t+MgdEjghBHlnXnRBNuOMb4GXnkVbz+H2DnAO0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MDMTnxsIgof1h23H5Lblq1iEHDRPQHfqOZWwEKz9dfOfVLrE/cT0+j29IpmM+PPGoC44+a61fCaB70r2JzUhKkxzWbzC9XMC4j8grUaWusTWz4cS8PCwH816sNktBZdBEH468E70lIju7LqVbEKouzUteTxIm8c+6Z+TxCWmr9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=E51+Mp1M; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=bv/px32w; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="E51+Mp1M";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="bv/px32w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764199801;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WaAYG5VDFXsv/Iixri0H6uBMNMIoUe5mbi2ivxpfSFc=;
	b=E51+Mp1MvNc1A4a9Hij+SOhMBvkJQ/RBkGCqH+CUhDV9u+J06dGyzedtqpTRgjwTr2TZqk
	d9AhU94UbLukoPrPWK8UQMA58mv2qVO663XE6CvQrs594rKkynYuQ0DkncgiaWBwSaRSWF
	IFHl+lgZuJhNdPgqC9mizsBWnWzKi6s=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-586-9bx_FKCoO5ayQFi5W4CeYQ-1; Wed, 26 Nov 2025 18:29:59 -0500
X-MC-Unique: 9bx_FKCoO5ayQFi5W4CeYQ-1
X-Mimecast-MFC-AGG-ID: 9bx_FKCoO5ayQFi5W4CeYQ_1764199799
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-787d4af9896so4378217b3.3
        for <linux-doc@vger.kernel.org>; Wed, 26 Nov 2025 15:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1764199799; x=1764804599; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WaAYG5VDFXsv/Iixri0H6uBMNMIoUe5mbi2ivxpfSFc=;
        b=bv/px32wH0UuA+1IaISHOCU807mC0Y8d1v5bThUnqCIce0XK8oWkgCEt3tS6dzBssy
         Rw7zv7AxcJUT+83xVq+2EaK0/hOJjVDFgSo6rMGV9MB185gLG4R9mzQjn7EkS728Tpp0
         kts40mj2E7ooZVTn2GAoi1SKnzrVXLSoO550UxuteLQ8hxu4/T4kZ58d1065pcohXikK
         D1mziLbUmYo+TqDK1dlmx8doC99wQCzEeFGh5Au8ABeT5TdEIRNnv96mzwGEwlgCcs5k
         wFKq8uhicCsMW460mWwa1eBxNQFJJdCjLw1jSHUJVRYBJSsMsEjf40cYyXEMaJcTlSBY
         zeqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764199799; x=1764804599;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WaAYG5VDFXsv/Iixri0H6uBMNMIoUe5mbi2ivxpfSFc=;
        b=d4l5JJeV0mJ6xUlsW7/NAUqqVVjL7NMKrX34oEw70OrL7riOibNf8dzjs6YraOP2vN
         ps+PPVg6QaHIr+mFTuNDrpx9HsjPHKBgRKK5t5+N+T0cUI9VH77I45igg6AlYR2RUrAw
         WlXOt9w6aBpsY+fCYRG66iSkktjRBbrZWtNFLVAaqRZ4mpOugjmhz8s/BGdttDgdZvwk
         kGTzk6h6+2kTcL1Sw2HQUwWyrpScOC0u2ClK5zj4JL0KZgiZe3CoWVB2W5lKxNqK5kOL
         PcOk7Y8A9Ok8Itquc1XU7woHywyhlI1ExkkM/Kr/zc3Cm4HIdm/+bXIHLTbvyabXOkYv
         Lchw==
X-Forwarded-Encrypted: i=1; AJvYcCW0pbhiITk5WTyZLTCIvGZ7I0RRTm4mFkf/ZwUpw6ezlL76hlr+e5p2uONW8fgoDpKxMMk+gyTbRto=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuVrQGgiFkjEjAceFxxzwAC53D0OhyZevp/MglOI9JHlknnPIY
	ep9opJe74i/TrDDh7Hr6HMwOT07VlRKR+nUhqChvmdT3whCwVuajbwhrMx6a45wLlQU1VQeuNnm
	lG9sskizeELyE0vWmRpQIK3RUkzJQMA3hkb0RAjHjcEWVjkC4rTMUJ8iPtEfhGKlbnO0CHMnxSP
	IOs2IGlT74BXsM6oau6BpMidakIL6c9vB+bI9p
X-Gm-Gg: ASbGncu5tDs9se95a/STz4Oehmhs3tyo/+jFOr+4/daTRpZ2GVcBstBg1MX5wjCJaVJ
	unfH29TFZ0MpuLbXBZON5RbqTxhbpHznXUOgbF3SG4EPhrXls4jalEmwOtVwcCH8W3Rj9SaEXdk
	usqwd6BAJ1lj3merIJm+kQiqakgxYB8gxZWKmyCp3ngI/n8E6xyLYvnnx2zp1Ieh5/nik0D6wkO
	ErH1PBP
X-Received: by 2002:a05:690c:6d11:b0:786:7017:9506 with SMTP id 00721157ae682-78a8b50d225mr179508087b3.43.1764199799274;
        Wed, 26 Nov 2025 15:29:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEM04nXlhLyHhOF4P67Ng8vhtTcvmR+j3q1fjlImcKmWBZ7ursgcIGrQVIExNz7VgFRd9eGD2XP0bTyZR5NgLY=
X-Received: by 2002:a05:690c:6d11:b0:786:7017:9506 with SMTP id
 00721157ae682-78a8b50d225mr179507437b3.43.1764199798871; Wed, 26 Nov 2025
 15:29:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251022183717.70829-1-npache@redhat.com> <20251022183717.70829-14-npache@redhat.com>
 <541a75fe-3635-49ab-b61f-d86afc96df98@lucifer.local>
In-Reply-To: <541a75fe-3635-49ab-b61f-d86afc96df98@lucifer.local>
From: Nico Pache <npache@redhat.com>
Date: Wed, 26 Nov 2025 16:29:32 -0700
X-Gm-Features: AWmQ_bmAlUVjee7DwzVRQDWabQ2jDP4iBXrMJ-Yz-HT4KcafaonxgE42edAAM08
Message-ID: <CAA1CXcBMWc04Z+7mdDAZHkSj5WGDAMc+-4p7JiTme3xCqtNXFg@mail.gmail.com>
Subject: Re: [PATCH v12 mm-new 13/15] khugepaged: avoid unnecessary mTHP
 collapse attempts
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-doc@vger.kernel.org, david@redhat.com, 
	ziy@nvidia.com, baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com, 
	ryan.roberts@arm.com, dev.jain@arm.com, corbet@lwn.net, rostedt@goodmis.org, 
	mhiramat@kernel.org, mathieu.desnoyers@efficios.com, 
	akpm@linux-foundation.org, baohua@kernel.org, willy@infradead.org, 
	peterx@redhat.com, wangkefeng.wang@huawei.com, usamaarif642@gmail.com, 
	sunnanyong@huawei.com, vishal.moola@gmail.com, 
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

On Wed, Nov 19, 2025 at 5:06=E2=80=AFAM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> On Wed, Oct 22, 2025 at 12:37:15PM -0600, Nico Pache wrote:
> > There are cases where, if an attempted collapse fails, all subsequent
> > orders are guaranteed to also fail. Avoid these collapse attempts by
> > bailing out early.
> >
> > Signed-off-by: Nico Pache <npache@redhat.com>
> > ---
> >  mm/khugepaged.c | 31 ++++++++++++++++++++++++++++++-
> >  1 file changed, 30 insertions(+), 1 deletion(-)
> >
> > diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> > index e2319bfd0065..54f5c7888e46 100644
> > --- a/mm/khugepaged.c
> > +++ b/mm/khugepaged.c
> > @@ -1431,10 +1431,39 @@ static int collapse_scan_bitmap(struct mm_struc=
t *mm, unsigned long address,
> >                       ret =3D collapse_huge_page(mm, address, reference=
d,
> >                                                unmapped, cc, mmap_locke=
d,
> >                                                order, offset);
> > -                     if (ret =3D=3D SCAN_SUCCEED) {
> > +
> > +                     /*
> > +                      * Analyze failure reason to determine next actio=
n:
> > +                      * - goto next_order: try smaller orders in same =
region
> > +                      * - continue: try other regions at same order
>
> The stack is a DFS, so this isn't correct, you may have pushed a bunch of=
 higher
> order candidate mTHPs (I don't like plain 'region') which you will also t=
rue.
>
> > +                      * - break: stop all attempts (system-wide failur=
e)
> > +                      */
>
> This comment isn't hugely helpful, just put the relevant comments next to=
 each
> of the goto, continue, break (soon to be return re: review below) stateme=
nts
> please.
>
> > +                     switch (ret) {
> > +                     /* Cases were we should continue to the next regi=
on */
> > +                     case SCAN_SUCCEED:
> >                               collapsed +=3D 1UL << order;
> > +                             fallthrough;
> > +                     case SCAN_PTE_MAPPED_HUGEPAGE:
> >                               continue;
>
> Would we not run into trouble potentially in the previous patch's impleme=
ntation
> of this examing candidate mTHPs that are part of an already existing huge=
 page,
> or would a folio check in the collapse just make this wasted work?

whoops almost missed this comment.

There is a folio check in the __collapse_huge_page_isolate function
that handles this. I think Dev has some plans to try and add
partially-mapped support as the todo comment suggests (I think he
already has some patches from earlier mTHP work).

/*
* TODO: In some cases of partially-mapped folios, we'd actually
* want to collapse.
*/

>
> > +                     /* Cases were lower orders might still succeed */
> > +                     case SCAN_LACK_REFERENCED_PAGE:
> > +                     case SCAN_EXCEED_NONE_PTE:
>
> How can we, having checked the max_pte_none, still fail due to this?
>
> > +                     case SCAN_EXCEED_SWAP_PTE:
> > +                     case SCAN_EXCEED_SHARED_PTE:
> > +                     case SCAN_PAGE_LOCK:
> > +                     case SCAN_PAGE_COUNT:
> > +                     case SCAN_PAGE_LRU:
> > +                     case SCAN_PAGE_NULL:
> > +                     case SCAN_DEL_PAGE_LRU:
> > +                     case SCAN_PTE_NON_PRESENT:
> > +                     case SCAN_PTE_UFFD_WP:
> > +                     case SCAN_ALLOC_HUGE_PAGE_FAIL:
> > +                             goto next_order;
> > +                     /* All other cases should stop collapse attempts =
*/
>
> I don't love us having a catch-all, plase spell out all cases.
>
> > +                     default:
> > +                             break;
> >                       }
> > +                     break;
>
> _Hate_ this double break. Just return collapsed please.
>
> >               }
> >
> >  next_order:
> > --
> > 2.51.0
> >
>

