Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0496B242D91
	for <linux-doc@vger.kernel.org>; Wed, 26 Nov 2025 23:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764198996; cv=none; b=fAIJO+GGlNGtZtyJxGHzSsUroFZ7tN9rL6eygL4gK3NpNcdFJQNhwPMOoRof6qsWo+RBQnWvK2OIqFuHTPVTKLVF4P4vTbVvWva5YHGyL6nI9SmAEonPOeV3lNxgMlclle8r4BnQwJU11NcEr0wx7Pxp4otNLWPGfB5EYHCguAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764198996; c=relaxed/simple;
	bh=H0Aa2h6XyKbyigaxWp5B58o4xxbWYArAZRPDLoYqXs0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gImueWriK9357+kbc17WIAMr0OZpKmrf+hhPv2tv6aSyZZtdcwobJWWfZ/f9Z3dzVydJlkieRbF+j04gfbnWXNWOY+WYqjb/YFMWmdz1QirKA/peTjgIlS09/7wwJaKr0USymNlfQa6xtoADt+K2S4CWErSbnBfGjfnsg2MC8TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UxUmBwc0; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=e36boLmx; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UxUmBwc0";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="e36boLmx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764198994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UMaoF3gqsWu97KKNF9bqDelTF6faCcdLQyjuhlYWXM0=;
	b=UxUmBwc0scgZ3JuV3PmX7wpR+XjfoJAmri6ZH4RFu6U3tnAHN0q9zID03pVS6NTedMu7ay
	E+kPFUh36J+O96+csKmKz/VHhIo8ICHb8wfetnHDbSw6TYjz4S49/2MpI3THC9EzifeQ1X
	eRuPfvZsrk2s2yE0JRhtiK/FTjEtV0k=
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com
 [74.125.224.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-689-obR272F-PUqELj37AL-eTg-1; Wed, 26 Nov 2025 18:16:32 -0500
X-MC-Unique: obR272F-PUqELj37AL-eTg-1
X-Mimecast-MFC-AGG-ID: obR272F-PUqELj37AL-eTg_1764198992
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-63f9be79c1fso347422d50.3
        for <linux-doc@vger.kernel.org>; Wed, 26 Nov 2025 15:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1764198992; x=1764803792; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UMaoF3gqsWu97KKNF9bqDelTF6faCcdLQyjuhlYWXM0=;
        b=e36boLmxLq3u1PRiuSZ86IorkRM1eH8qKurz6pX/33zmWITES76D1zAR8n9twyLuEU
         rBI3Q9JZ4srl723rQ39llPAPBRa/VOIF4t/fEYyvVc215hWbi4P5wOBSnXYPZpnyJLPf
         hkFWWWG5rhUPgS/2hBNcxKFCx0yg+8YVqZ8FfhJKhi3woi54mlk6zCKyLCEaKYcj7PWC
         UAvVgFUDLmUOBv9e7ybHo7vuict03McUGfAJhbG4L8IJyD4pYxilVViSU7ZPAKL8eZTD
         WF/gSEG4grtS67QMLVJ9bWE0d8fen5dVmSpRC2QLvpva6EsBB/h7yVIwG8UHJw1O0DYp
         kCqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764198992; x=1764803792;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UMaoF3gqsWu97KKNF9bqDelTF6faCcdLQyjuhlYWXM0=;
        b=RH84UQBj0YQLwpT+ME5SUW1o7WeAY7lyTplX4XR4Llnrjzxt9OwJNrFfKeD8dEl/+k
         YmoSRm6hJP7OxgYYN+Wo3t60KKnlbuOsWvRXTdWH737ALFiFcSX2l9qt3B4MYldniy/y
         iCxJvbCy2kWU/Cs0InGfLIZUdVAAk6LmSI0AjMoW7D0ZPGuMAZpD9omNDdyZe2eYiQnp
         viX0873HPaQaat89Tsn/j/U1rLNgc3pLN9bkv6Gx1NfIhqPILjrjR1WsSyQas2UaHC8J
         7IIWI/qlIqfNLQbXTFCnMl/AQzDuOgxcA5vT6ESFtLWim4KnA8eB2EiaiDoNp9yzLMh6
         cBkA==
X-Forwarded-Encrypted: i=1; AJvYcCWNlqd3V0cxWuZMTnXzQvoj5Shu5qc/R/AyHcKMNppszdck/yU1fy5HEeyvyHC9O53GEqdR7FwnvVw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+LqiaPmuCk4lKWpYia+guoOw4Xs0FzvQuplcINATKmLXn3gLK
	Oe94yjHL27ApKgAAnRpITE2QR2O3q8nTt/RNHTcREgbj3Igo39zvJBtdhA69b0NLQHBtCPsWh7i
	cR3i5LjXibgxxtjmVQ966wausgfCVnH01P4bUNxo64r7T2SpMuhL6lgkA+NB8kgGv1l9Joqi/0c
	Oe6YunhevG44X/3GmCgKXaGfz1dy7Ue43IHJRc
X-Gm-Gg: ASbGnct1XKpR9oqTReRyQZoDRmLm5ICVOH/joPSBc8t5RTm7kjnEOK5MSRqjzvsq7MB
	eCJyZkEZYHhdIS+R69MGDDH+q1wr7E390Wkk5sPDgITXeHRs7hopxnuvVuVHARhbq9nHxGczsqk
	IEstRvKjokTa5/1YNQq4AhXW52dhFigNKA0Y7LAcYD95Ez9UJlN2CTWHk4ATIahjgfR/V67WWQ5
	S7U8/dg
X-Received: by 2002:a05:690e:155b:10b0:640:d3ef:3ff3 with SMTP id 956f58d0204a3-64302a8eefemr13305167d50.15.1764198992130;
        Wed, 26 Nov 2025 15:16:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH+QNGPicU5RjAdYvjG9xbNevC686kTjk8osJQTtyywrSV48lnib9InZNM3p9uysXVeTAEWqukeejzM9ZXOnQI=
X-Received: by 2002:a05:690e:155b:10b0:640:d3ef:3ff3 with SMTP id
 956f58d0204a3-64302a8eefemr13305111d50.15.1764198991685; Wed, 26 Nov 2025
 15:16:31 -0800 (PST)
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
Date: Wed, 26 Nov 2025 16:16:05 -0700
X-Gm-Features: AWmQ_blxvg-ak975oHQTjlFuUq6n3qiQLej596rC0gzOd4D75sF38pXcfAMCpNA
Message-ID: <CAA1CXcAhj3UKqjGLVCOwGmUY=eDJSnvMZO+byF9b6GJUR9gRiQ@mail.gmail.com>
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

Ah yeah so it should just be try other "regions" or in this case we
want something like "try to collapse another mTHP candidate in the
stack"

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

ack

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
>
> > +                     /* Cases were lower orders might still succeed */
> > +                     case SCAN_LACK_REFERENCED_PAGE:
> > +                     case SCAN_EXCEED_NONE_PTE:
>
> How can we, having checked the max_pte_none, still fail due to this?

There are two phases in the khugepaged code, scan and collapse. in
between them is an alloc which requires dropping the lock, and
reconfirming values (in the collapse phase) after relocking.

During this time, the state of the PMD range might have changed and
our thresholds may have been exceeded.

This was true for PMD collapse and holds true for mTHP collapse too.

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

Ok sounds good, quick question, do we spell out ALL the enums or just
the ones that are reachable from here?

>
> > +                     default:
> > +                             break;
> >                       }
> > +                     break;
>
> _Hate_ this double break. Just return collapsed please.

ack, yeah that's much better. Thanks!

-- Nico

>
> >               }
> >
> >  next_order:
> > --
> > 2.51.0
> >
>

