Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26DE522FE02
	for <linux-doc@vger.kernel.org>; Tue,  8 Jul 2025 23:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752016041; cv=none; b=KnFvtqmSCiG97NgUyHwMDHCTZm6LcY3k6zpxo3+ZYIWB8DJ4h1pRUgAObTXFXVPH34GBQj4jp1a78ecA8KDLJYYCbRfOwDmC/yK/8J8Et4pMa2B83DISY6XUAeKEZssH4VLUWZH9pmhxQmPEGHUiAMHWjeaZq/+9uOjrrxxt/ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752016041; c=relaxed/simple;
	bh=4gXrOO0trlwdfnE0SVtxJjOa7Jwa56nDYNJZy3Mbtpo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EoImfq0B7uR7yQAleB8HjC7UOEJT828D/MT9KtHEeeXcBNvNBQaihvSK3b34voAwgVffTJShVhJvhQj+MXdwkRjZSYwcB7BTpe19xgauYapUlvtQbNhXT9IC9HG7f7bujHoyLi44KOCQ/njWY4NQRaGnPRHJSEaY26WPE8F3qVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=N6jKDYXT; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="N6jKDYXT"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-234b122f2feso3887385ad.0
        for <linux-doc@vger.kernel.org>; Tue, 08 Jul 2025 16:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1752016039; x=1752620839; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ORrNhGhx1xAy0Po/oCOkd4206JtidBzGrSaq8D7iH54=;
        b=N6jKDYXT0q0/12cv1YDp5swSF1LJEFv/b1e5+UIyK2KkwFZ1U+G7+ELe/+aCnH2SAL
         f1znjRY7f34Qxo7UIbtQNzJQQKjy05N/2d4vuJPKywWi9z6C7oCxdrMVI1wqYwfvTfXq
         vvlx11FNh5qr08MApmLF6XisUNhvDywybusbD3v4Dkg078RWz4APCrqUOXcvYaLcCyIw
         Z8eoxK7G98bAxiohf3Tqs8wMvwy2h3g4ePsO8TiP9iIHBPkLqjilG28d87x64E5JN/nE
         SwzMZUCSqyd15Cg6F4k9rlbATyhz7wekwJcA+eW3S2LQHOP3cUK0zBXhpzZuC/Le+sMZ
         b9wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752016039; x=1752620839;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ORrNhGhx1xAy0Po/oCOkd4206JtidBzGrSaq8D7iH54=;
        b=Dfn7IsVov+scMxGGmv0lQ/tIuhPAUArDm16RRUaS07PWMFNyvWQ5chH/bH/D7Lus6K
         he+2Fyxb/uH7S0PTX+2c2ReDroNsxXk2gU+TDKnN1vIEAxBE0aXTr+FrEUCUK97h4DNW
         GOifWeGHV7Des0VV83NQDxV6Z+xGL+lk6Cun8AVe931UzZr70+sjWW4W8Oz4iZslVBXI
         4SZx9VXMrwrcssGWuuRZHC4VynINX4poZo7NH50iCE43C+EjxOLBS+Jd8t0mbnu+rS2R
         WUOe3x470tOyF0nAQh2ePPfVKBLowAi4O5oBIyMX2hRGKIUZzQzvFDVa2z4KoCixhLXA
         brJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUs5wA1XB8r6Mcp/jvW9pZNUqiEH070C01vRywnjH2kneuGGtf8J6bNsOQ+HRiPpPvsUtlg/YOfUNs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUa4qeerATEN/0dENtKp5HntZBjU3wruSj5+Ywom0ZPeopCs87
	q0mE07qoFbr1I3vMSPb8l+wOgYiAQinH/Yyom6wOn1UajqByOZmyuk465/Gq7wU0yClN4I4bWBX
	jBdQUWsTslVAF6IN+jlPK5/CWWDtKg9fFG+ErMqwrzw==
X-Gm-Gg: ASbGnctXX8RhN6aT55Zv7pEDXz5C6yoVI19IQ+L4Xbnp5ygizMPajwvUNqp+Uol2rbC
	IBt67MhltEXjWvMuXMhr8JSLReADiPLsAlZ4Fg9M1uIWsi15xWqu21p6XyBlaM9bCDHgxY+F+rt
	IYlcVQwxqI1hsua0h1ljpNqIg6zQ72r1hf/DRXWJJomnI=
X-Google-Smtp-Source: AGHT+IHafJZSNlc3LwJHoPCVexsbbzG5eLYra9gLQmPwSGpxSqUN1/USBkhF30c0AMmJuh3uHbnCi6A+WUCshzmTOdI=
X-Received: by 2002:a17:903:2f8a:b0:234:db06:ab5 with SMTP id
 d9443c01a7336-23ddb31356cmr1508005ad.12.1752016039406; Tue, 08 Jul 2025
 16:07:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610233053.973796-1-cachen@purestorage.com>
 <cvrr3u7n424dhroqi7essjm53kqrqjomatly2b7us4b6rymcox@3ttbatss6ypy> <3c9b5773-83ed-4f13-11a8-fcc162c8c483@google.com>
In-Reply-To: <3c9b5773-83ed-4f13-11a8-fcc162c8c483@google.com>
From: Casey Chen <cachen@purestorage.com>
Date: Tue, 8 Jul 2025 16:07:08 -0700
X-Gm-Features: Ac12FXwrCH883qf6GxaQmge34hOSXFNsa0Bf0fqsJXpu5vn54JG0qYzehNGJr6s
Message-ID: <CALCePG0cEjbRXHbvFJPUG0exXcNQaAbj72Ehm6zNCuuT77k=BQ@mail.gmail.com>
Subject: Re: [PATCH] alloc_tag: add per-NUMA node stats
To: David Rientjes <rientjes@google.com>
Cc: Kent Overstreet <kent.overstreet@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	surenb@google.com, corbet@lwn.net, dennis@kernel.org, tj@kernel.org, 
	cl@gentwo.org, Vlastimil Babka <vbabka@suse.cz>, mhocko@suse.com, jackmanb@google.com, 
	hannes@cmpxchg.org, ziy@nvidia.com, roman.gushchin@linux.dev, 
	harry.yoo@oracle.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, yzhong@purestorage.com, 
	Sourav Panda <souravpanda@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 8, 2025 at 2:52=E2=80=AFPM David Rientjes <rientjes@google.com>=
 wrote:
>
> On Wed, 18 Jun 2025, Kent Overstreet wrote:
>
> > On Tue, Jun 10, 2025 at 05:30:53PM -0600, Casey Chen wrote:
> > > Add support for tracking per-NUMA node statistics in /proc/allocinfo.
> > > Previously, each alloc_tag had a single set of counters (bytes and
> > > calls), aggregated across all CPUs. With this change, each CPU can
> > > maintain separate counters for each NUMA node, allowing finer-grained
> > > memory allocation profiling.
> > >
> > > This feature is controlled by the new
> > > CONFIG_MEM_ALLOC_PROFILING_PER_NUMA_STATS option:
> > >
> > > * When enabled (=3Dy), the output includes per-node statistics follow=
ing
> > >   the total bytes/calls:
> > >
> > > <size> <calls> <tag info>
> > > ...
> > > 315456       9858     mm/dmapool.c:338 func:pool_alloc_page
> > >         nid0     94912        2966
> > >         nid1     220544       6892
> > > 7680         60       mm/dmapool.c:254 func:dma_pool_create
> > >         nid0     4224         33
> > >         nid1     3456         27
> >
> > I just received a report of memory reclaim issues where it seems DMA32
> > is stuffed full.
> >
> > So naturally, instrumenting to see what's consuming DMA32 is going to b=
e
> > the first thing to do, which made me think of your patchset.
> >
> > I wonder if we should think about something a bit more general, so it's
> > easy to break out accounting different ways depending on what we want t=
o
> > debug.
> >
>
> Right, per-node memory attribution, or per zone, is very useful.
>
> Casey, what's the latest status of your patch?  Using alloc_tag for
> attributing memory overheads has been exceedingly useful for Google Cloud
> and adding better insight it for per-node breakdown would be even better.
>
> Our use case is quite simple: we sell guest memory to the customer as
> persistent hugetlb and keep some memory on the host for ourselves (VMM,
> host userspace, host kernel).  We track every page of that overhead memor=
y
> because memory pressure here can cause all sorts of issues like userspace
> unresponsiveness.  We also want to sell as much guest memory as possible
> to avoid stranding cpus.
>
> To do that, per-node breakdown of memory allocations would be a tremendou=
s
> help.  We have memory that is asymmetric for NUMA, even for memory that
> has affinity to the NIC.  Being able to inspect the origins of memory for
> a specific NUMA node that is under memory pressure where other NUMA nodes
> are not under memory pressure would be excellent.
>
> Adding Sourav Panda as well as he may have additional thoughts on this.

Thanks for your interest. I have been busy with other team projects
and will get back on this soon. I will address comments and send out a
new code review.
