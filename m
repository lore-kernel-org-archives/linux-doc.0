Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C68C299A8F
	for <linux-doc@vger.kernel.org>; Wed, 29 Oct 2025 21:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761773038; cv=none; b=u0tNZW/FCRUgDlo4VZItBY/pV43OBNPBf18ZavEcIbtwtSj/xDmuE2wLUg8PzrDoU987fdX+dOC3Ju2apdr3wXCZkYDnkS1LVRQOOI8TAPLeHxKONwY4FszAEj0+dPiGKTz7yAjDO+MR/9SD2Ca16m3uKkrn5kkdr7v+BPsbhqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761773038; c=relaxed/simple;
	bh=YxJkHaOGqtmtID7r7jgJwxwqavOG8btDMZK73zs/svk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gR1ru1nIbm8+B/X1Q6JOHTav7MHHUy70p0kkPsRvhprdaKYgOekqMkQsGfNnC4sPsLC1evN7jQIleaowtzZHy1vVG+Nt0+cVBLuWa47bOOGcWE8y/F5Uj+gdCzEjHbje5ZM79p2TUxerMi5k0Ptz3FJDtHcKM5v1EBRl+YutYG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MNx6/0j7; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MNx6/0j7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761773036;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YxJkHaOGqtmtID7r7jgJwxwqavOG8btDMZK73zs/svk=;
	b=MNx6/0j75DkXKA8HEhpx6Q1AokaoUoEHTdmEM0le7mpKbsU+jR0IDvYLura5oWgeb93S+b
	qhfB45erqGOKILmmBZ+NpN42sEoQ5GQznPHbNao+1wl/e6Oo16j/sjfgKZHXXB3krTCkha
	kSPL1TRRjV7cOSRNjv6nA3Vtx0WyjYo=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-319-y3ekeDf3OgKTLSWBwi5Wdw-1; Wed, 29 Oct 2025 17:23:54 -0400
X-MC-Unique: y3ekeDf3OgKTLSWBwi5Wdw-1
X-Mimecast-MFC-AGG-ID: y3ekeDf3OgKTLSWBwi5Wdw_1761773034
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-78103962c97so5029247b3.0
        for <linux-doc@vger.kernel.org>; Wed, 29 Oct 2025 14:23:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761773034; x=1762377834;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YxJkHaOGqtmtID7r7jgJwxwqavOG8btDMZK73zs/svk=;
        b=bOo+v67V7tDByTHmC9vvOUKUbgKWPNAxT2+fm2DMsepzNJnUZVbI4jhKW44M7qUWc+
         6nk8o8oCeZCFdT4RUnGV8NT9MIly88E3xaNmB3cRCQfr8P8wVE/XObNvS9t91MguBCiH
         YXVvTEkw0EMMW7KpRCUUm1MDbJ4o6ZN8EenkzOSf+Mt+LfE79xUVpogNPEbVCaINhS86
         mrA3imdRyq5IdLfx8tvOelWC6fvU3IY2EV9twz0FVL2Hdr3pAx0GEqSreoAnZYQjKGGT
         sV24Nfh5Z9naszP8GZKZS/Ju8zt3O6VlrhrFwGjKhPPbewfE9CCd/wGMx/mCf+UQ4D9F
         gjIg==
X-Forwarded-Encrypted: i=1; AJvYcCXVgY7se+0B0HcWUpEpG1K65FUL0LVQSFOIN1eXa3ydAS+RvpGuzBpXT958OMA1NrDH5cq1isSukeY=@vger.kernel.org
X-Gm-Message-State: AOJu0YylFDGDUyLMX+2h+uOtMHl6hcSbFVefq32u9GIgiY1Aj0vmsAh9
	ILBcHnDR6fvJEIWCxctMa1UMYhoycjr698fljgLfJlvYdJjLsUE+CPKRCNUN1wn6mQsDqQlS9rM
	FLAO7knjAdXXtTM5SozLWtfnlXZr/uQoC5jXo4RG9cFjmwl9TB7G2qRcA44GWzmcYSO884IImO5
	q9R2lv+xfhI2Byqm/Rxjc+uGbrCyx+avqp+r/S
X-Gm-Gg: ASbGnctcTHbjYxGOArsMEQ0q3Bm37FM8nMerTs7ke3liQZcg4WJ3ceQoUaTxt4coCxE
	YLK9wbengfva8x7wbxERyfCMcg5CeSNoI8pLktkTnHFc1b4JFRPfmIoIR4G0AR96gXofrNGELDG
	LGAUtEB6NctjoPDmiTUcHUstRAXwxrqdq6Q5GDEk7CdBBSJfkx7ZEMffz8Y6AeQZcFolHPrQ==
X-Received: by 2002:a05:690c:6701:b0:783:6943:f530 with SMTP id 00721157ae682-78629002465mr47289727b3.63.1761773033759;
        Wed, 29 Oct 2025 14:23:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8yc33v52nQ6YPYjNybWuYm4cbGSVVsczrtKKNT1ij0PL3hQrawg7LmLb9r6Fd2P+MKYkK8oJ/nx9Rz6pq4gs=
X-Received: by 2002:a05:690c:6701:b0:783:6943:f530 with SMTP id
 00721157ae682-78629002465mr47289077b3.63.1761773033204; Wed, 29 Oct 2025
 14:23:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251022183717.70829-1-npache@redhat.com> <20251022183717.70829-7-npache@redhat.com>
 <5f8c69c1-d07b-4957-b671-b37fccf729f1@lucifer.local> <CAA1CXcA4AcHrw18JfAoVygRgUZW3EzsN6RPZVrC=OJwSNu_9HA@mail.gmail.com>
 <e69acbc5-0824-4b07-8744-8d5145e2580b@redhat.com> <e66b671f-c6df-48c1-8045-903631a8eb85@lucifer.local>
 <74583699-bd9e-496c-904c-ce6a8e1b42d9@redhat.com> <3dc6b17f-a3e0-4b2c-9348-c75257b0e7f6@lucifer.local>
 <CAA1CXcD1YDAbYzdYfchOWbmUasa3tN55AYroOLJb2EqoQfibvw@mail.gmail.com> <02a72419-bc89-481a-ad2a-a3c91713244d@lucifer.local>
In-Reply-To: <02a72419-bc89-481a-ad2a-a3c91713244d@lucifer.local>
From: Nico Pache <npache@redhat.com>
Date: Wed, 29 Oct 2025 15:23:27 -0600
X-Gm-Features: AWmQ_bnwjuOd-l21r_gYz6uTD3EwVnE8ezkHiJEP0hwQdGdZ9Dom1N0UNfRsm3E
Message-ID: <CAA1CXcDR7pe1jKvPOBv-WVYObYtZNNx0w9vESaUsLe+BPR=Dzg@mail.gmail.com>
Subject: Re: [PATCH v12 mm-new 06/15] khugepaged: introduce
 collapse_max_ptes_none helper function
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-doc@vger.kernel.org, ziy@nvidia.com, baolin.wang@linux.alibaba.com, 
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

On Wed, Oct 29, 2025 at 12:59=E2=80=AFPM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> On Tue, Oct 28, 2025 at 08:47:12PM -0600, Nico Pache wrote:
> > On Tue, Oct 28, 2025 at 1:00=E2=80=AFPM Lorenzo Stoakes
> > > Right, well I agree if we can make this 0/511 thing work, let's do th=
at.
> >
> > Ok, great, some consensus! I will go ahead with that solution.
>
> :) awesome.
>
> >
> > Just to make sure we are all on the same page,
>
> I am still stabilising my understanding of the creep issue, see the threa=
d
> where David kindly + patiently goes in detail, I think I am at a
> (pre-examining algorithm itself) broad understanding of this.

I added some details of the creep issue in my other replies, hopefully
that also helps!

>
> >
> > the max_ptes_none value will be treated as 0 for anything other than
> > PMD collapse, or in the case of 511. Or will the max_ptes_none only
> > work for mTHP collapse when it is 0.
>
> 511 implies always collapse zero/none, 0 implies never, as I understand i=
t.

0 implies only collapse if a given mTHP size is fully occupied by
present PTES. Since we start at PMD and work our way down we will
always end up with a PMD range of fully occupied mTHPs, potentially of
all different sizes.

>
> >
> > static unsigned int collapse_max_ptes_none(unsigned int order, bool ful=
l_scan)
> > {
> > unsigned int max_ptes_none;
> >
> > /* ignore max_ptes_none limits */
> > if (full_scan)
> > return HPAGE_PMD_NR - 1;
> >
> > if (order =3D=3D HPAGE_PMD_ORDER)
> > return khugepaged_max_ptes_none;
> >
> > if (khugepaged_max_ptes_none !=3D HPAGE_PMD_NR - 1)
> > return 0;
> >
> > return max_ptes_none >> (HPAGE_PMD_ORDER - order);
> > }
> >
> > Here's the implementation for the first approach, looks like Baolin
> > was able to catch up and beat me to the other solution while I was
> > mulling over the thread lol
>
> Broadly looks similar to Baolin's, I made some suggestions over there
> though!

Thanks! They are both based on my current collapse_max_ptes_none! Just
a slight difference in behavior surrounding the two suggested
solutions by David.

I will still have to implement the logic for not attempting mTHP
collapses if it is any intermediate value (i.e. the function returns
-EINVAL).

-- Nico

>
> >
> > Cheers,
> > -- Nico
>
> Thanks, Lorenzo
>

