Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833BB30E829
	for <linux-doc@vger.kernel.org>; Tue,  7 Jul 2026 14:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783432926; cv=none; b=Q9bTdvBIcJoVBt2Hh4hVT1aZBlvRpqrCVCpYwXfESm5t/lQyEIdrCxjDWkyl/KB0V6YcZcCQQSDE12ze/XF4OnfYRMrBKqCus/x+FCxWFObyJCU2zaAAls1411URrQvFcye0UxnnsApSJRwjI8zCeOedXzsCPQ6Et/7Znf3SBBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783432926; c=relaxed/simple;
	bh=MJKZMdNzs5NYzNY696wPqhLLq50VnJ6AsyX8VhbYT/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZPrMcfyvwzVY5MogksAzeBQNjUAMRErwN4MRUtavHRYEO7dGPSUkJsPDW2QBceyVMW2awxAzwPiIzLHC81zCLS46kfosBJ0uRjp8qg+rEwwyiC43+96imJHwdg0bD3DXQZCbqMnsklShScdmSSbeXVBGeFRq5UVl6m0Mb3nA53U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DKsaaHL8; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=WU1FYTFU; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DKsaaHL8";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="WU1FYTFU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783432924;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WDvld2BXpFSwdt9ItbR9zFXv+7W3dhSsVabE1vNaiZo=;
	b=DKsaaHL8LGM5eiKdvpgnMuoGDXMynbCMdSb7zbxjpdNv/faiNCTjidqP0elMe26gB9JTF1
	KMmAYMroqPAxkyGLL8DA8YNHnpXPsLG7/ME0Z30oyFEMU9w2MiZpfwGHCSVKZYsj5mrEqk
	SGeHbDR3ISdR9ZdKumTu38W+p2Gyi2M=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-304--jUgK9MjPaKeEn6-roaWzg-1; Tue, 07 Jul 2026 10:02:03 -0400
X-MC-Unique: -jUgK9MjPaKeEn6-roaWzg-1
X-Mimecast-MFC-AGG-ID: -jUgK9MjPaKeEn6-roaWzg_1783432922
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-490a767c7dcso34283035e9.2
        for <linux-doc@vger.kernel.org>; Tue, 07 Jul 2026 07:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1783432922; x=1784037722; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WDvld2BXpFSwdt9ItbR9zFXv+7W3dhSsVabE1vNaiZo=;
        b=WU1FYTFUnKeOHYEZHyYPKI+612Kw2sx607ktOC8fwiJ2nqvsSYrfCOviiZTD9KDEsL
         l1Qrso3a1++30OpRLY27dJpI5hSmXPlSfpVzGLR52xF7SfplYCR+X/EclVctnpkW97Zf
         wuo0nqanNNfHCQfz43XKwO0B5BLkHkUjT1xzgGgdC/kmFG40fQDwMKHmutWexyPQTS1O
         A1TEACsj97XFIes3uf57AnADiRsLevcYACIIH6cUIJnTymT99Z06dvl4rR8bRBlIHtmc
         vODIWUdfn0RdKzqOr2ZaOn+9OOfSh+CKfmJr/UvL8/jpjjeda2+PypoKmMxYdkvzz3VL
         KNJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783432922; x=1784037722;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WDvld2BXpFSwdt9ItbR9zFXv+7W3dhSsVabE1vNaiZo=;
        b=Hq59mkmQQbZ42pVOMMosFsAjJhqyZMRoXAc/RKh7VBHy/LrLe/bLkBWUIwewrREqpU
         1fzVqrETlES6wcNY+JJ2HxRb3Retaq32J3MC5Dr9TyEKVg5+yfRR8ix5NCZscV44P+V8
         wKQrLaSzlN7Ec+VivGp30Q1EWr/u1PyDWWF8Jbt6PqsTlQBEDE2EZfcdPTHiukQASzju
         txhewLYyxbP7aKh1PY8fhqqYrXzmvAg/NolkV6e2NbLDvKwzunoQUo+D5npvxYFDVGaO
         T7UC/+xfigq5B2f735XPSqOz5HzFNCD9MLn7jQ3IKxQxtZBEF5CmVsJvUeA4c96PjAFp
         DU9Q==
X-Forwarded-Encrypted: i=1; AHgh+Rr1fjkes42xkpR9fD2j8XxLiwXx9DyVk99czJ5VPuItknyIfnlZb38WFaGL2a9shFOZNDu6NEA50tI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0LQ8WKRtmuFFl5jpWmHIrCYmgfg1u8Jf3p/CQSrdZM2aTqH5w
	T96Ehr69ioNW7oL3+dOEQ8ih4S6BV70scVN0mwopZDww1FQ7udRu9p6QqWCIGK8jAwZnfqqnGFV
	bBGs9YS0/ZmWAeNWO3dNty6MbPCHyne19gih7U42oFx2ODzlzF5LrC4Q4lLPF3g==
X-Gm-Gg: AfdE7clS0nK2FvF0/b6Pwiq7vkgSrk3aLcIIra7mTtHOY6hbjjGgAIoH1MECnz8waAE
	CYZbz+oE761C9ii1sPoAzEDaj3ql9JERl4lQwflCOU3vAnr8A9+TJys2K9fg87ezel2D+ZXEW92
	y/O8RLwSAhEZOJ34OTFkrHvVhjMuExV6BzySvlcaSpvcsMqjk3o/Oi4DXvDFhWv8+WVMXNIRHlp
	vfCmG27MIlYh+45bTGvd9qOpbsJwjzAJ7e3CJxYH+CGAhEE6RG+D89on2NPCLzhzZHurFm5zGv2
	QYd5Mgi04yrXkHULddOl+4RFLY5QnRavhQ7Kf6Cze0zGmLPkqikvkFcISXS8g17050Yz4gQ2KYg
	J7nb4xcsOZv5AMVwdhgKmLjmMtUNNvrGY
X-Received: by 2002:a05:600c:198e:b0:493:bed6:85e6 with SMTP id 5b1f17b1804b1-493df0711f9mr63762585e9.15.1783432920444;
        Tue, 07 Jul 2026 07:02:00 -0700 (PDT)
X-Received: by 2002:a05:600c:198e:b0:493:bed6:85e6 with SMTP id 5b1f17b1804b1-493df0711f9mr63761815e9.15.1783432919826;
        Tue, 07 Jul 2026 07:01:59 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-68-31.inter.net.il. [80.230.68.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0f214d2sm33176455f8f.33.2026.07.07.07.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 07:01:59 -0700 (PDT)
Date: Tue, 7 Jul 2026 10:01:55 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>,
	Sourav Panda <souravpanda@google.com>, muchun.song@linux.dev,
	osalvador@suse.de, akpm@linux-foundation.org, liam@infradead.org,
	vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
	mhocko@suse.com, mhklinux@outlook.com, fvdl@google.com,
	gthelen@google.com, mike.kravetz@oracle.com,
	pasha.tatashin@soleen.com, rientjes@google.com, riel@surriel.com,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [RFC PATCH 0/6] mm/hugetlb: Dynamic, NUMA-aware HugePage Cache &
 Free Page Reporting
Message-ID: <20260707095843-mutt-send-email-mst@kernel.org>
References: <20260707064235.1386552-1-souravpanda@google.com>
 <9624988a-366e-4884-9408-3f3b88c27290@kernel.org>
 <20260707062428-mutt-send-email-mst@kernel.org>
 <b9a48d89-74f1-43d4-b7bb-be988b6855c9@kernel.org>
 <akzZr2jfJ0J8zox4@lucifer>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akzZr2jfJ0J8zox4@lucifer>

On Tue, Jul 07, 2026 at 12:06:34PM +0100, Lorenzo Stoakes wrote:
> On Tue, Jul 07, 2026 at 12:28:44PM +0200, David Hildenbrand (Arm) wrote:
> > On 7/7/26 12:25, Michael S. Tsirkin wrote:
> > > On Tue, Jul 07, 2026 at 09:29:07AM +0200, David Hildenbrand (Arm) wrote:
> > >> On 7/7/26 08:42, Sourav Panda wrote:
> > >>> Overview
> > >>> This patch series introduces a dynamic, NUMA-aware HugePage Cache,
> > >>> backed by a kernel shrinker to safely return memory under pressure, and
> > >>> integrates it with Free Page Reporting (virtio-balloon) for HugeTLB,
> > >>> specifically targeting gigantic (1GB) hugepages. The goal is to solve
> > >>> the tradeoff between allocation latency and memory
> > >>> fungibility in virtualized and heterogeneous cloud environments.
> > >>
> > >> Hi,
> > >>
> > >> in general, we consider hugetlb nowadays to be mostly in feature freeze, as we
> > >> realized a while ago that adding more special casing on top of something too
> > >> special for all of MM is only going to hurt us more in the long run.
> > >>
> > >> We want to have less special casing and less special sauce, not more.
> > >>
> > >> Now, there is nothing wrong in making hugetlb be less special, by making it use
> > >> more of core infrastructure etc.
> > >>
> > >> But optimizing for surplus hugetlb pages by teaching hugetlb about new caches
> > >> and its custom free-page-reporting support rather looks like the wrong direction
> > >> for me?
> > >>
> > >> --
> > >> Cheers,
> > >>
> > >> David
> > >
> > >
> > > It is currently bypassing free-page-reporting completely.
> > > Making existing free lists not ignore free-page-reporting would
> > > maybe considered "making it be less special"?
> > >
> 
> You have this completely backwards.
> 
> You're advocating making hugetlb _more special_ by duplicating functionality that
> core mm already supports.
> 
> I mean:
> 
> mm/hugetlb.c                                 | 590 ++++++++++++++++++-
> 
> Tells the whole story right?
> 
> The whole issue with hugetlb is the very fact that it's a parallel
> implementation of a bunch of mm stuff in its own little world.
> 
> We make it less special by mm/hugetlb.c smaller and smaller and implementing
> what it does sanely elsewhere in _core mm_.
> 
> >
> > Depends. We don't really want an orthogonal implementation of something we have
> > in core-mm.
> 
> Yes, exactly.
> 
> Feature freeze means feature freeze, not 'feature that core mm doesn't support
> feature freeze'.
> 
> Hugetlb is a poster child for poor decision making in mm that has left us
> saddled with maintenance nightmares because we allowed 'just one more feature
> in' (TM) with little to no thought to the future.
> 
> And we've all learned from that and don't want to repeat these kinds of
> mistakes, nor make existing mistakes worse.
> 
> And work to improve hugetlbfs and make changes like the above are VERY welcome
> :)

Fair enough.

> Laying a foundation for hugetlbfs to be more of a sane mm citizen through rework
> series is really the asking price for stuff like this in my opinion.

Lorenzo, do you know *how* you want it reworked? Could you write it up
at a high level?
Because if not, it's not really practical to make it the asking price.


> >
> > --
> > Cheers,
> >
> > David
> 
> Thanks, Lorenzo

