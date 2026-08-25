Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323E9377ABF
	for <linux-doc@vger.kernel.org>; Tue, 25 Aug 2026 18:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787682836; cv=none; b=c1X6UV3xrBnyWNQl9g/PsKYX8e0zcsu86QC1atnIrDT0znf2DtrIOh74GmhfKMYHHEnOlHIl2VTb0V+Iz7vnfWM7V6p0RrG/VP6PYV02mUGTFszv+GFSyUimwyRJcpEbiAaq+97xdagorJRz7jfJtvUXSCBGRgrgeCGcPjzZ0HM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787682836; c=relaxed/simple;
	bh=oz1vsSfhnzHKzMyvIU1457fQ+VKFGoaSC1MKlUjtQH4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HMaPY8XlSCqXY4Hu9dkZPzJLLGb9AlXlGRhfHtY9j9Zia6Swhc+r/agQ6S76JY7f88EUoN8J6izE+Q0tk25K3L7/bceo3gdPabp92xnLaAZdNjQUnGxOCC4oXBTWyUAB58Z/EZcCs/Yyb+8I19P9WTZ2O4s9DKf0oja2ihDPpdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bUNMQ3k3; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=jzRQFdKS; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bUNMQ3k3";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="jzRQFdKS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787682834;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ezRFPRBsxOpDYy/LiqFi78+AQBRMUReYJkZLlaNR3K4=;
	b=bUNMQ3k3Co5oEDlbOpPhHDFToPTCHnJiDuDni64Gg2OndORScgx+oR8XXe9jSrSd6pECJe
	CPULwKoFRpVdDmyQ7QVnCo1tapN6DDGApoN0j397UIVlbFvwD/nPP/aoXtgfJj8eaz1oZ6
	vOLkw0BanuiB7o+WdAqrJZE+RWwqBZs=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-354-DcEOXeNiPRCwufw8csbQUA-1; Tue, 25 Aug 2026 14:33:51 -0400
X-MC-Unique: DcEOXeNiPRCwufw8csbQUA-1
X-Mimecast-MFC-AGG-ID: DcEOXeNiPRCwufw8csbQUA_1787682831
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8f113592bf3so2626436d6.2
        for <linux-doc@vger.kernel.org>; Tue, 25 Aug 2026 11:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787682831; x=1788287631; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ezRFPRBsxOpDYy/LiqFi78+AQBRMUReYJkZLlaNR3K4=;
        b=jzRQFdKSWJtzGdyzwv0exG9iaPgnI2K8a/EAGci9as+f6G19LBrW5M7APdAFNEeXcV
         rlEJjhQZRH9s/5Pk/pfggSnebigCMW952giqJy7uj80ouy7dxDf3WuFjj7RuHzDjR5Xy
         Svncfo4f6Z77AeBkNsWFkZIQyDMruBFb3Ogw4/XS9nyEjXVgRWdj8/vArFsXn/OtYATU
         nAPsqsT22BOiiy9MQdrrwOySX+SCxSkoJWyVBiHplTZL3ayRwBlfj06m3rFhgv2TDC0a
         hcnanWYaH3vrZjyEejpPuIfKJmGjocLmSZke7Qpy2TeQX9YisjxeAi69VFld64dG5FVF
         I5IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787682831; x=1788287631;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ezRFPRBsxOpDYy/LiqFi78+AQBRMUReYJkZLlaNR3K4=;
        b=iZQ654KsL36KDeIZV0tD4MId40ftZ6z7gHmvjMjeC1TxSFuKJOYMKuLRMv+RkzpDDj
         DlDitJywupjLTXMzsvkWU0nhUd6oRib1DcAnpnHhGl86UirhgO3Deb87Og+uBIRRH0ev
         pzJWUPYDgFrbsI0pOMlpLrXt0hEExAg0C+98f3a3N0odGr8rebl69a+YuhUEI4I1/Uw8
         6K5kPB2fHvBrCeqkUUnXrVREf82HsWaXa28Iyfx2nZRVhyeDhqBkTlx4bC6OYulhwSag
         AnMJQhDlvQ2eCTH8iSgY42E6O1XtYrPl6HEE/a0J4xfsnXSDHJNi+rAJNld38QBkaG/h
         XODg==
X-Forwarded-Encrypted: i=1; AHgh+RoeCvkB4v2XissoBFs14UC8GNUibYrkwtXE7QMZA71mEsfVjZXmypNJ4P4G+kxXHCDYGxxIghZ41/E=@vger.kernel.org
X-Gm-Message-State: AFuF++m57+oDMMZj2ZUzEVei2GFCaepyWwRCKODlOs9EaYrkoFUKEXYt
	En6QIi14xjt2z08B+IG1AbWObS6g4fRhnzUCsYIu3ZjrWwh176yPElfz18vpoClttqBjgxs6p7h
	CI+D6M4n5jk0yYwYKDmNZnY22QZgfJl4o1Ecu9oBfaI7trZFLEB7xV0JDzaEKnQ==
X-Gm-Gg: AR+sD108n0MrIJ2CxyHXe1y883qmbLYL/axzOLx+/xWBSBK+ylBBjoPHOc8DSQW6gIY
	EoMwC/VYyJ59NJrTj30lKwYNyRy/HbFetmORTqM7KPh32eILddqsjSNs57DcN9fvO7Unfbdc2YV
	6CC8OvYZvnLehZsvoihXlDXFfYh5vQtxKotZonX+96DdzJsf4HTmKiB3RtdkXMxEl6k5VSoHBEm
	7OooslRM4YczcDzgjLxYng/Ib/zR2/tXC76iXx8fNEhqeYt4QQENYQTDSfWDpUmdY2/T1dAPxS9
	kfFqVXLof6y4RhFDcPX/e7XjzrxUgHwzOBsSCBjRNNW9ra7dGt5bxKM2MxciNP3Z2btGi76lO4L
	PhHv9YORbGEu2l6/Se/ruIyKb6M8mCnP/ee54NZEZJEBN
X-Received: by 2002:a05:6214:469d:b0:90a:4361:9c4f with SMTP id 6a1803df08f44-90cc790aa6cmr10048456d6.1.1787682831079;
        Tue, 25 Aug 2026 11:33:51 -0700 (PDT)
X-Received: by 2002:a05:6214:469d:b0:90a:4361:9c4f with SMTP id 6a1803df08f44-90cc790aa6cmr10046546d6.1.1787682830292;
        Tue, 25 Aug 2026 11:33:50 -0700 (PDT)
Received: from localhost (pool-100-17-17-231.bstnma.fios.verizon.net. [100.17.17.231])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90cc65093d5sm4901706d6.26.2026.08.25.11.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 11:33:49 -0700 (PDT)
Date: Tue, 25 Aug 2026 14:33:48 -0400
From: Eric Chanudet <echanude@redhat.com>
To: Michal Hocko <mhocko@suse.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	Shuah Khan <shuah@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	cgroups@vger.kernel.org, linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Maxime Ripard <mripard@redhat.com>, Albert Esteve <aesteve@redhat.com>
Subject: Re: [PATCH 00/11] mm/cma: charge cma allocation to memcg using per
 area counters
Message-ID: <ao3UKM5SbxBmxuR0@echanude-thinkpadx1carbongen13.rmtusma.csb>
References: <20260821-cma-memcg-regions-v1-0-d21b165b8440@redhat.com>
 <aowHqqaqK7TeexQH@tiehlicka>
 <ao2gA_m3BCBu2esy@echanude-thinkpadx1carbongen13.rmtusma.csb>
 <ao2t6HP-Zt5KDg30@tiehlicka>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ao2t6HP-Zt5KDg30@tiehlicka>

On Tue, Aug 25, 2026 at 04:59:52PM +0200, Michal Hocko wrote:
> On Tue 25-08-26 10:47:53, Eric Chanudet wrote:
> > On Mon, Aug 24, 2026 at 10:58:18AM +0200, Michal Hocko wrote:
> > > On Fri 21-08-26 14:56:52, Eric Chanudet wrote:
> > > > CMA allocations are currently unaccounted for by cgroup memory
> > > > controllers. As system resources, they should fall under memcg, but CMA
> > > > areas partition the available space for different purposes and memcg
> > > > doesn't have a good representation for that.
> > > 
> > > Which CMA usecases are covered by this work? It would be also great to
> > > spend more time describing usecases.
> > 
> > We would like to offer some usage guaranties to userspace processes
> > ending up doing allocations in CMA.
> > 
> > For example, a shared CMA area is described in device-tree for an ARM64
> > platforms. Userspace components could then, for example, allocate from
> > it through the dmabuf heap, or a device or framework-specific ioctl for
> > that matter, to use the buffer with sensors. The dtb may have other CMA
> > areas described additionally that may or may not be used by that
> > component. In this context, we would like the ability to limit one of
> > the userspace component to over-allocate and choke the other(s).
> 
> How exactly is this supposed to work? How is the CMA access controled
> and opted in for accounting. What happens when memcg limits are hit. And
> many more details, please.
> 

The administrator opts in by mounting cgroupfs with
memory_cma_accounting. At which point the cma allocator will charge CMA
allocations against memcg and manages a per area counter depending on
what area the allocation was made into.

Assuming memory_cma_accounting is set, if a non-root cgroup makes a CMA
allocation over either memcg's max limit or the per-area limit set by
the admin, the allocation fails with ENOMEM.

If memory_cma_accounting is dynamically unset, no the CMA allocator no
longer issues charges. Whatever was already charged can be uncharged
when it gets released.

It looked consistent to use memcg since movable pages from regular
allocations may end up in available CMA regions until a CMA allocation
needs the space and has them moved. So in an extreme case, hogging the
CMA space of a large enough area could trigger system memory pressure.

> > memcg
> > looked like a good fit to achieve this, albeit handling the areas, so a
> > cgroup has a quota in a given CMA resource.
> 
> Please expand more on why do you think this fits into the memcg model.
> AFAIU we are talking about a unreclaimable memory and reservations of
> CMA areas.

Since memcg already accounts for some unreclaimable memory (kmem,
hugetlb), or induces failure if no reclamation is possible, I did not
see CMA allocations being unreclaimable to be a blocker to track what is
otherwise system memory.

I viewed pages allocated in CMA as guarantying special properties while
being otherwise similar to pages already accounted in memcg to the point
that charging them against memcg made more sense than having an entirely
different pool. I can see how that could be the other way around though,
especially with the per area counters, like how hugetlb have their own
controller.

> > This trails from an earlier post where we tried doing this using
> > dmem[1], but I was unable to reconcile the requirement for memcg
> > accounting[2] since from dmem I didn't have memory objects to charge nor
> > the guaranty there was one. Given CMA is always system memory, it looked
> > like a better fit to try something without dmem.
> > 
> > Best,
> > 
> > [1] https://lore.kernel.org/all/20260519-cgroup-dmem-memcg-double-charge-v2-0-db4d1407062b@redhat.com/
> > [2] https://lore.kernel.org/all/ahB7pCu_G4vuswc0@linux.dev/
> > 
> > > -- 
> > > Michal Hocko
> > > SUSE Labs
> > > 
> > 
> > -- 
> > Eric Chanudet
> 
> -- 
> Michal Hocko
> SUSE Labs
> 

-- 
Eric Chanudet

