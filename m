Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693733B388A
	for <linux-doc@vger.kernel.org>; Tue, 25 Aug 2026 18:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787683821; cv=none; b=NE6QyfuNXs5y7yMDwYnOjhKw1xhpy89vQaZvAGnjJsnSmq9XCDv1bS9NLfXJkda895xmSzavD1pL1A31GKEDUQaMferr7dA/hDKcwB3QVvcHEHaBFdQoN9yLKDFS4Z7jtdIXS7ULZsKd1m5WtLzprrd/7YJN9fQOPdejkfFMZxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787683821; c=relaxed/simple;
	bh=FqDp0SoXakGgLyxcwE7yWAGj80DKGRT/Pdr/+FKUh7M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DH7VMjnbd8DDOjw4UHFpPsa4W8Sia4aqQWSAhIyzLJcGyKoJ0uOe1nbw02p+VyM4hntB4qaQt144tlz2FK9vqS46zgwX86yd8eFgqGlg5aRwyw7luL040EaHAfgCjhShX5R/t7tzurECmvjWI+Wt6/mRlcEHZqLAedNItUZgxds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=A6yc6QOT; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=C7YkATbe; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="A6yc6QOT";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="C7YkATbe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787683819;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bY+uq+O6hs+OCaV9/h1J0zsMTaL2h9lRcnb5h7llFxE=;
	b=A6yc6QOTsZpiE5MIdHTDrhFWX5b3piNQ26brbY412fGdavqKdS3nuZEVnZ3EqszsgvkB/2
	me2W1jDyTM2HQjmLcpyDXzpKX9dRMttzY15xCyqJT8upY2H6phoucz6h6422TR9oYzKg4s
	BXG5b3DDxmCwhSSMUyIofz9GckcKdLk=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-533-gcaF6N5XNx2g1QxYkIX-xA-1; Tue, 25 Aug 2026 14:50:17 -0400
X-MC-Unique: gcaF6N5XNx2g1QxYkIX-xA-1
X-Mimecast-MFC-AGG-ID: gcaF6N5XNx2g1QxYkIX-xA_1787683817
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9377829a759so3967185a.0
        for <linux-doc@vger.kernel.org>; Tue, 25 Aug 2026 11:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787683817; x=1788288617; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bY+uq+O6hs+OCaV9/h1J0zsMTaL2h9lRcnb5h7llFxE=;
        b=C7YkATbefJ3U2doF6fMcwdLrz/56+qQpHmC+6QP50SGRdMddXXWXU7XKgSEFa+0OWB
         IRNGLZaRMagfbUX6SoTkXFxidwCgD6vKMWtTwS+aQq90d3/I6MjXMXHWvpDmIh2jRjCk
         U/73SaieDWXuVj3LTxK+AENjlteyfx8HwZX47JXF2tkJj4x58T3PLVBeN1BxDfGnkiqR
         XSEpmQDRRHHO3mYPqVkDODWpsFAay4c01+zNdx9qrwL6JI91Pf6V+GKXsLdZXeBkttS2
         FUdCRIlCLJQ1rPsbiWcjT0m4ha8SdlJrNMuph2xF64R0AiqYcnC6LEfZa+9k7UPKTQXd
         mnTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787683817; x=1788288617;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bY+uq+O6hs+OCaV9/h1J0zsMTaL2h9lRcnb5h7llFxE=;
        b=MGE9N2MbJS910qDfk8dZZIZeUoAYrrZtpeSxJp4cjKsKJEwWo5aAUjH4aU+Y+gyGrU
         2xY6YZCzJAceAbIMY1GS1rYuyqrn71T3CzFkSJeCILWXqNpT4i0mIJ155J3l5S17mWvA
         5Zc2um1shdyq3VQWH1T1tXY9WsFmX+boFuSt5UQcBuKPDKgQ10Xuw6L1EEFWo8fXWPZ9
         ATB1PyFRMsBkCT3lzu3Qw8kANAX+D7pcWixxs1WKt/Z9Pe5tvM9x4eYtjnh6Kdze+hrt
         EIRhXFkGFNG4ipVaSZwvzAa5JYKACKTZV+98XrRR0fDUt3FufUHcoPvLhzMe7dEcAzXU
         dHww==
X-Forwarded-Encrypted: i=1; AHgh+RrjaV8JXBks1C6ayOaOgiMCyANXCx1e3h1Zaick3St2rHAsgVnzS09DXFmQ+scGlbTRgYWVhvnvgfA=@vger.kernel.org
X-Gm-Message-State: AFuF++nyMdTw8BPxfLWs6d2aUjmPwJaxCxOVxbNSJjd2vCR5Tb+55SF2
	DXq1ORfEvQPfls7mEPD5SLaeBTJPI/m8mlWDsfy/eu+z3zMmh0BPzoCSpdiPDoDhsvwVmRjTUo+
	TVIiC4FuNijLrWCP014/2t7nj1cQbDMo74b7P2+j6wgJ+nOLQL2T0OVB+LuU01Q==
X-Gm-Gg: AR+sD12Wv5A6nKnqkTGP2ttd09YzY++w9I0cEyeCVagrbCrB52E510zdVsF5jz9quiF
	ccQMARQSo87T4wPUuUo4tUZqRip+XCG4SsrRIh9XDfzfG0hKwn6N081jCHl8hf+XYhFA9Erwkg2
	KsxeHx+w8/pvHswrX8LocJZ/VifXWDBFghrya62GeYj5+WebTKwOkcONwupPiWBCrXKyf9IO0tN
	ahnqg++RFpot9sAO3/34GmHduyNH4rSxQQF5dfeRemlomqQezYY8AdTFz3FIxqPm05G45u/yZjW
	ygp30kmMBgTi7xRuS7fu/okDC7h7PZUhl17tOEB5P2fTxM1Wmhmf2OpCTaXaYhyB7D66gh4cfAR
	7S60ZoYp9LV1gxkLaYXpUiO/ZeM9gZYNTqIr6yt6ekNsq
X-Received: by 2002:a05:620a:4055:b0:92e:db1f:185c with SMTP id af79cd13be357-937804594b8mr54690585a.43.1787683817213;
        Tue, 25 Aug 2026 11:50:17 -0700 (PDT)
X-Received: by 2002:a05:620a:4055:b0:92e:db1f:185c with SMTP id af79cd13be357-937804594b8mr54681085a.43.1787683816399;
        Tue, 25 Aug 2026 11:50:16 -0700 (PDT)
Received: from localhost (pool-100-17-17-231.bstnma.fios.verizon.net. [100.17.17.231])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9377e30ed0esm42285485a.9.2026.08.25.11.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 11:50:15 -0700 (PDT)
Date: Tue, 25 Aug 2026 14:50:14 -0400
From: Eric Chanudet <echanude@redhat.com>
To: Michal Hocko <mhocko@suse.com>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>, 
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
Message-ID: <ao3gLqsF4WSeKBIa@echanude-thinkpadx1carbongen13.rmtusma.csb>
References: <20260821-cma-memcg-regions-v1-0-d21b165b8440@redhat.com>
 <aowHqqaqK7TeexQH@tiehlicka>
 <ao2gA_m3BCBu2esy@echanude-thinkpadx1carbongen13.rmtusma.csb>
 <5970a8d4-fe7c-4dde-bdc8-1c66bfb57f12@kernel.org>
 <ao3CQicH0t-k95NA@tiehlicka>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ao3CQicH0t-k95NA@tiehlicka>

On Tue, Aug 25, 2026 at 06:26:42PM +0200, Michal Hocko wrote:
> On Tue 25-08-26 17:45:56, David Hildenbrand wrote:
> > On 8/25/26 16:47, Eric Chanudet wrote:
> > > On Mon, Aug 24, 2026 at 10:58:18AM +0200, Michal Hocko wrote:
> > >> On Fri 21-08-26 14:56:52, Eric Chanudet wrote:
> > >>> CMA allocations are currently unaccounted for by cgroup memory
> > >>> controllers. As system resources, they should fall under memcg, but CMA
> > >>> areas partition the available space for different purposes and memcg
> > >>> doesn't have a good representation for that.
> > >>
> > >> Which CMA usecases are covered by this work? It would be also great to
> > >> spend more time describing usecases.
> > > 
> > > We would like to offer some usage guaranties to userspace processes
> > > ending up doing allocations in CMA.
> > 
> > How does this e.g., relate to hugetlb allocating from CMA, to then charge to a
> > hugetlb cgroup?
> > 

AFAIU the system defines CMA areas to allocate hugepages from. For this
initial series, I failed to handle it. The intend was to consider it as
any other CMA area. It entirely missed that hugepages are already
accounted for by their controller (cgroupfs opt
memory_hugetlb_accounting) and they are charged when faulted in from
their available pool.

> > I always thought of CMA being a low-level allocation mechanism with various
> > different use cases, and actually the higher-level users should decide how
> > to/what to charge instead.
> 
> Exactly. There are many different users of CMA all with different
> requirements. Then there is CMA reservations if an area is shared and
> the overall memory consumption. That is why I am really not able to
> wrap my head around this proposal.

It is nonetheless available almost directly to userspace via dmabuf
heap, or as a result of drivers ioctl providing a contiguous buffer, and
unaccounted for by existing controllers, with the exception of CMA
hugepages with memory_hugetlb_accounting. The dmabuf heap use would have
userspace choose the area(s), but allow for no limit to be applied
beyond that, which is desirable for areas shared by multiple userspace
components.

> 
> 
> -- 
> Michal Hocko
> SUSE Labs
> 

-- 
Eric Chanudet

