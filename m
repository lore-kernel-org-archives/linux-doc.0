Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5979D284694
	for <linux-doc@vger.kernel.org>; Fri, 12 Sep 2025 23:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757719595; cv=none; b=VdLEeXYIFNZjsOUZpZUB/Qsx8Hgas9Co/onG9XBsl+CQRVTG+PlM0aBMqx+Q14FW8p2MN7EyAl9Pu9y/To80iAU/U6xTlNt8qxuXhY2fBTGhqQy9F3uJK/upYDbAQUlNYQomcvllqIQ71ozC35DREOUoE2xxP4bV6WHAvKQVgXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757719595; c=relaxed/simple;
	bh=RUkRli7PaRf5LNeLB4V9FNYl+iBZf3baaMUpWMMuQ84=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Di5NBXdnE8SK1dPufnuCkDMla1NsZnzas05Z7kRHIXXdWAWUviPrI7uQu4wqyZ8PIm1zMapt/FM3uBxx+aSRTVDdCl7xfnv0epQOcfj6sSAFkKtFoQQSdY7MuQadEuoRU1m6xNaH6uLz/qoUhG5qHzwl+VdPvEzT46Gi5/IPUSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aZK8YPQ/; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aZK8YPQ/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757719592;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FYya9fW1mJvYJ3jPqwJBitUidkWXto77tPEtahloeFg=;
	b=aZK8YPQ/ifD47sdtHvco5cUmekC5suMdzywvrXeZe0RgNPeb9NxrkwH169KbhJDAqqMqyg
	4s7XSZ8bbNsxOwyzD6F2sq3P7lL5ig7Fkfs2wt9p6czwGjS4AQmnBiPXrO4QkCUX3EtvA0
	V3P92xx6yblZVdfGIMeIeMAvVIw1gOQ=
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com
 [74.125.224.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-550-MaAKcqwCPCi0DP3Va0m90A-1; Fri, 12 Sep 2025 19:26:30 -0400
X-MC-Unique: MaAKcqwCPCi0DP3Va0m90A-1
X-Mimecast-MFC-AGG-ID: MaAKcqwCPCi0DP3Va0m90A_1757719590
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-61cbe562a8bso2488065d50.1
        for <linux-doc@vger.kernel.org>; Fri, 12 Sep 2025 16:26:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757719590; x=1758324390;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FYya9fW1mJvYJ3jPqwJBitUidkWXto77tPEtahloeFg=;
        b=Y6rxd4npCedBG+HLAd2UswAHbMpIk61jZHR4lJSKjLrB5Uk7Cr11ewgyR6RVWxbVZr
         H/FMjEW/jLSj+wbKT3jIMBzzbMsgbXHXkPVRn7Di/E6zgcaMRLnbJgClHRKsTHC+dyP4
         jI5rsShPYwmhBvCUU+SKNUwNZhq115cZxE6xKEBVUrHRBmhtRi2qh+Ha5FRikU3HstR0
         iQKg4cxzmCVUf14WqWm8kbQZC+VQaKKi5AYW2wmiJLYj1xUTHGn0M0Xp2jSCjvLiOVRZ
         9by7e3MWpCxoT9pYPmfvncs2Zp0VIdpnn8dYAByxvovoK8UVZDyyJJhR86LYtwet6MKM
         RF4A==
X-Forwarded-Encrypted: i=1; AJvYcCUQ1AFswyLF3ZMZTHNvGTOI2af0P14wqo8sQwI4Ez/47LUYPYhMmQyUDtFBAo8hEYpcTgxZcLIjavo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3f4YnNEOYJqsvuK7JxuTXj8MQ+LZIMDS3s+hYtzrzgYrjWlgc
	0DbM7QU+0wQYGvocnhjKUbGCZ9QcYp6Z6GKTC60QuWO0BWdwfKDxq3vZvy7ktLem46fnYY0Ihq9
	/GvGLDa39HbTqPo4scU9LyCXo0DgRUTvr30d0brS+EuFlFC+GGyjgUWY9ofW+pW+7Vx/5hKdo4b
	pttzgeRk87osjCiWm9EpUpykIeMxXUQI2lufiJ
X-Gm-Gg: ASbGncseuJn2QhOpOV+hSqRMxTFbpHZE5iF6R7hRPY2kebhmclUOUFfKY8TJzEkscQN
	zknAHnKusMd86dxzVFHYptunHJxq2naq3YCL/4BfTBWVPQ+THTuBu3rZm6iiX3NnzAWwyQI0H+s
	b6rEBD1HAo3nx52ifRB6Ic8Vy8mtXdC90SAhI=
X-Received: by 2002:a53:c949:0:b0:623:696e:39c6 with SMTP id 956f58d0204a3-62724632d67mr3454898d50.35.1757719589829;
        Fri, 12 Sep 2025 16:26:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4AnimwV4DJpIrzY5zDni7Ex/wppWCYlFBHUNbQWqcehb1JqlslO2cG7IpWR63nH0AcJL1oIrwAvdwGrMu0Z8=
X-Received: by 2002:a53:c949:0:b0:623:696e:39c6 with SMTP id
 956f58d0204a3-62724632d67mr3454856d50.35.1757719589379; Fri, 12 Sep 2025
 16:26:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250912032810.197475-1-npache@redhat.com> <20250912032810.197475-7-npache@redhat.com>
 <4e1fef74-f369-439e-83ff-c50f991c834e@lucifer.local>
In-Reply-To: <4e1fef74-f369-439e-83ff-c50f991c834e@lucifer.local>
From: Nico Pache <npache@redhat.com>
Date: Fri, 12 Sep 2025 17:26:03 -0600
X-Gm-Features: Ac12FXw8kuzu15sT3828_sGKN1OjxWfPvlvmcTocIEno-x-VWWBe1uDeooNmQyg
Message-ID: <CAA1CXcCugu0C3s2V1GcZZC=WksiNy8vkomHCcdvtGKfhxhoyfw@mail.gmail.com>
Subject: Re: [PATCH v11 06/15] khugepaged: introduce collapse_max_ptes_none
 helper function
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	david@redhat.com, ziy@nvidia.com, baolin.wang@linux.alibaba.com, 
	Liam.Howlett@oracle.com, ryan.roberts@arm.com, dev.jain@arm.com, 
	corbet@lwn.net, rostedt@goodmis.org, mhiramat@kernel.org, 
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

On Fri, Sep 12, 2025 at 7:36=E2=80=AFAM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> On Thu, Sep 11, 2025 at 09:28:01PM -0600, Nico Pache wrote:
> > The current mechanism for determining mTHP collapse scales the
> > khugepaged_max_ptes_none value based on the target order. This
> > introduces an undesirable feedback loop, or "creep", when max_ptes_none
> > is set to a value greater than HPAGE_PMD_NR / 2.
> >
> > With this configuration, a successful collapse to order N will populate
> > enough pages to satisfy the collapse condition on order N+1 on the next
> > scan. This leads to unnecessary work and memory churn.
> >
> > To fix this issue introduce a helper function that caps the max_ptes_no=
ne
> > to HPAGE_PMD_NR / 2 - 1 (255 on 4k page size). The function also scales
> > the max_ptes_none number by the (PMD_ORDER - target collapse order).
>
> I would say very clearly that this is only in the mTHP case.

ack, I stole most of the verbiage here from other notes I've
previously written, but it can be improved.

>
>
> >
> > Signed-off-by: Nico Pache <npache@redhat.com>
>
> Hmm I thought we were going to wait for David to investigate different
> approaches to this?
>
> This is another issue with quickly going to another iteration. Though I d=
o think
> David explicitly said he'd come back with a solution?

Sorry I thought that was being done in lockstep. The last version was
about a month ago and I had a lot of changes queued up. Now that we
have collapse_max_pte_none() David has a much easier entry point to
work off :)

I think he will still need this groundwork for the solution he is
working on with "eagerness". if 10 -> 511, and 9 ->255, ..., 0 -> 0.
It will still have to do the scaling. Although I believe 0-10 should
be more like 0-5 mapping to 0,32,64,128,255,511

>
> So I'm not sure why we're seeing this solution here? Unless I'm missing
> something?
>
> > ---
> >  mm/khugepaged.c | 22 +++++++++++++++++++++-
> >  1 file changed, 21 insertions(+), 1 deletion(-)
> >
> > diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> > index b0ae0b63fc9b..4587f2def5c1 100644
> > --- a/mm/khugepaged.c
> > +++ b/mm/khugepaged.c
> > @@ -468,6 +468,26 @@ void __khugepaged_enter(struct mm_struct *mm)
> >               wake_up_interruptible(&khugepaged_wait);
> >  }
> >
> > +/* Returns the scaled max_ptes_none for a given order.
>
> We don't start comments at the /*, please use a normal comment format lik=
e:
ack
>
> /*
>  * xxxx
>  */
>
> > + * Caps the value to HPAGE_PMD_NR/2 - 1 in the case of mTHP collapse t=
o prevent
>
> This is super unclear.
>
> It start with 'caps the xxx' which seems like you're talking generally.
>
> You should say very clearly 'For PMD allocations we apply the
> khugepaged_max_ptes_none parameter as normal. For mTHP ... [details about=
 mTHP].
ack I will clean this up.
>
> > + * a feedback loop. If max_ptes_none is greater than HPAGE_PMD_NR/2, t=
he value
> > + * would lead to collapses that introduces 2x more pages than the orig=
inal
> > + * number of pages. On subsequent scans, the max_ptes_none check would=
 be
> > + * satisfied and the collapses would continue until the largest order =
is reached
> > + */
>
> This is a super vauge explanation. Please describe the issue with creep m=
ore
> clearly.
ok I will try to come up with something clearer.
>
> Also aren't we saying that 511 or 0 are the sensible choices? But now som=
ehow
> that's not the case?
Oh I stated I wanted to propose this, and although there was some
pushback I still thought it deserved another attempt. This still
allows for some configurability, and with David's eagerness toggle
this still seems to fit nicely.
>
> You're also not giving a kdoc info on what this returns.
Ok I'll add a kdoc here, why this function in particular, I'm trying
to understand why we dont add kdocs on other functions?
>
> > +static int collapse_max_ptes_none(unsigned int order)
>
> It's a problem that existed already, but khugepaged_max_ptes_none is an u=
nsigned
> int and this returns int.
>
> Maybe we should fix this while we're at it...
ack
>
> > +{
> > +     int max_ptes_none;
> > +
> > +     if (order !=3D HPAGE_PMD_ORDER &&
> > +         khugepaged_max_ptes_none >=3D HPAGE_PMD_NR/2)
> > +             max_ptes_none =3D HPAGE_PMD_NR/2 - 1;
> > +     else
> > +             max_ptes_none =3D khugepaged_max_ptes_none;
> > +     return max_ptes_none >> (HPAGE_PMD_ORDER - order);
> > +
> > +}
> > +
>
> I really don't like this formulation, you're making it unnecessarily uncl=
ear and
> now, for the super common case of PMD size, you have to figure out 'oh it=
's this
> second branch and we're subtracting HPAGE_PMD_ORDER from HPAGE_PMD_ORDER =
so just
> return khugepaged_max_ptes_none'. When we could... just return it no?
>
> So something like:
>
> #define MAX_PTES_NONE_MTHP_CAP (HPAGE_PMD_NR / 2 - 1)
>
> static unsigned int collapse_max_ptes_none(unsigned int order)
> {
>         unsigned int max_ptes_none_pmd;
>
>         /* PMD-sized THPs behave precisely the same as before. */
>         if (order =3D=3D HPAGE_PMD_ORDER)
>                 return khugepaged_max_ptes_none;
>
>         /*
>         * Bizarrely, this is expressed in terms of PTEs were this PMD-siz=
ed.
>         * For the reasons stated above, we cap this value in the case of =
mTHP.
>         */
>         max_ptes_none_pmd =3D MIN(MAX_PTES_NONE_MTHP_CAP,
>                 khugepaged_max_ptes_none);
>
>         /* Apply PMD -> mTHP scaling. */
>         return max_ptes_none >> (HPAGE_PMD_ORDER - order);
> }
yeah that's much cleaner thanks!
>
> >  void khugepaged_enter_vma(struct vm_area_struct *vma,
> >                         vm_flags_t vm_flags)
> >  {
> > @@ -554,7 +574,7 @@ static int __collapse_huge_page_isolate(struct vm_a=
rea_struct *vma,
> >       struct folio *folio =3D NULL;
> >       pte_t *_pte;
> >       int none_or_zero =3D 0, shared =3D 0, result =3D SCAN_FAIL, refer=
enced =3D 0;
> > -     int scaled_max_ptes_none =3D khugepaged_max_ptes_none >> (HPAGE_P=
MD_ORDER - order);
> > +     int scaled_max_ptes_none =3D collapse_max_ptes_none(order);
> >       const unsigned long nr_pages =3D 1UL << order;
> >
> >       for (_pte =3D pte; _pte < pte + nr_pages;
> > --
> > 2.51.0
> >
>
> Thanks, Lorenzo
>

