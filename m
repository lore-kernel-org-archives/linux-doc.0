Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53BA4F8A0
	for <linux-doc@vger.kernel.org>; Tue,  6 Aug 2024 17:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722965929; cv=none; b=S2cO53ElJBOVdylK04XrnC7IexKoZZAMVv1PxG7KPoMreEu5BK4SMEnmRFMC8RFGfyrZLFBOYVtkRtDzvMBDnRdge+ZsEh2RDCRqF0wRjkJIriS/7sd6CwJwDKit0hETGH0kmlZBXvsblS0MHlTddqc43SNgRSiWMuzMvDwkUbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722965929; c=relaxed/simple;
	bh=HCJfZbOCDoxIFvqfbrfEWDLMhrLpLf4QFAUipuXMkX8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mCE2jVkG0C2Zt3fgFEbgT4JKzkrnDBXhAABQnSU2uDH64APsrvssoqIsgVzcI0HBhznnRxnDruvV0e5/42lAgZWFRpy4ae8aXaSZLXsqZBHUlFl6FddpeQ+lbLnTwjnyvOgEzcC/zoSQA4RoEG4lf4iiEOk2ghMzR2vC6c8fNyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=O/K44YT8; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="O/K44YT8"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6b7a0ef0e75so5083636d6.1
        for <linux-doc@vger.kernel.org>; Tue, 06 Aug 2024 10:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1722965925; x=1723570725; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DFT04eDqUDRuoXV+iFO/OFbUzVkAnj/MsXC8LjTJQCY=;
        b=O/K44YT8tvdtfR/kEBEafawHyBME8JyFrX0VSYFHtt62ZtGh8T+o8PSTKsvSsccktK
         uWhYcgR+1ma609UWeVFgAP2JrjdlEQLCQFwFHgyBvB51vdf9wRH0nmUIIoFHeCURiiVg
         DvTbd25iTuNOJFt9fT0hCf8oRnlJza0/gCuZ1RD9JqXW8jjW4IhR9g8LTIXtGbYyPrOs
         vHXZKPoMkMTESGqC+wWYQ6ivdK09RkIAn8k4zOl337TPFBLaRigE0gDZk8Fq12sLKQBG
         iO7X3p7KbOiFSiLlbNoGMl5/6eXhZwLUn1LgRQ265kaGAXZ3ux4oxNynKDxCR2V6UWSH
         MTxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722965925; x=1723570725;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DFT04eDqUDRuoXV+iFO/OFbUzVkAnj/MsXC8LjTJQCY=;
        b=FbG/Bva3sf8GnGzzAm/BNlVXgxcVVshj+drXYfaB9f6ZCwMvxfw9YZaOOfxqz5sHsf
         YP2uYeOr6ZNkU89eApmfmDTuXWTc3lLawRdFuPBmNL4BzM8O6H5+os7c+AuDKliRFuEy
         xakXs5dsJb2gOYBHn0Ge9sZ0saIqnRDBOe7NiQ6U53ECdgctGCeRJMvqenZItzUvitnA
         C1JhZwLTc+Lx34NUSIW8+CmJtS3OD9DYnwKJKso+Geood5/Beg65NpSy/7Y9Vj7nwEq1
         K6iq1wqynRXz6lezJhg7NMxgX6alxTga696P0QEJjZYCvVzqLFmrPQvlZQ46dwoNnVk3
         GdWA==
X-Forwarded-Encrypted: i=1; AJvYcCWMhpkXIcO7derq5AtmwX36kKayPhfcjBIUN/cnmOb8UwGKww1K94evS5oD3y1Omb0wSGhKRSatwYb1NgQRkF7C5bgLMmdesQnN
X-Gm-Message-State: AOJu0YxG07nLkb8HbfbRGA586HZdE6fSxqZocmpZ+rjji0BHD63VioL4
	ppBTHS5p7IglSSWBdD9sS8tk1SnHM1DFmJFTP2xjvLoK0DKk5IcPnzmeSN3J7to=
X-Google-Smtp-Source: AGHT+IFfst/Qde1Lynn7BrIeWKbz/l71KGJXRt749ul6SogcxbbFqrdsTQFw10Bolr+DHEqWpnV/5g==
X-Received: by 2002:a05:6214:5886:b0:6b7:9a5c:c9ce with SMTP id 6a1803df08f44-6bb9842d7e6mr163767056d6.53.1722965925578;
        Tue, 06 Aug 2024 10:38:45 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:da5e:d3ff:fee7:26e7])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bb9c866ccfsm48229976d6.107.2024.08.06.10.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 10:38:45 -0700 (PDT)
Date: Tue, 6 Aug 2024 13:38:40 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Yu Zhao <yuzhao@google.com>
Cc: Usama Arif <usamaarif642@gmail.com>, akpm@linux-foundation.org,
	linux-mm@kvack.org, riel@surriel.com, shakeel.butt@linux.dev,
	roman.gushchin@linux.dev, david@redhat.com, baohua@kernel.org,
	ryan.roberts@arm.com, rppt@kernel.org, willy@infradead.org,
	cerasuolodomenico@gmail.com, corbet@lwn.net,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH 0/6] mm: split underutilized THPs
Message-ID: <20240806173840.GE322282@cmpxchg.org>
References: <20240730125346.1580150-1-usamaarif642@gmail.com>
 <CAOUHufb7z13u51VCTGZMimoCXpmfT5AOAbrUpAvJjTx5+AXwew@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOUHufb7z13u51VCTGZMimoCXpmfT5AOAbrUpAvJjTx5+AXwew@mail.gmail.com>

On Thu, Aug 01, 2024 at 12:09:16AM -0600, Yu Zhao wrote:
> On Tue, Jul 30, 2024 at 6:54 AM Usama Arif <usamaarif642@gmail.com> wrote:
> >
> > The current upstream default policy for THP is always. However, Meta
> > uses madvise in production as the current THP=always policy vastly
> > overprovisions THPs in sparsely accessed memory areas, resulting in
> > excessive memory pressure and premature OOM killing.
> > Using madvise + relying on khugepaged has certain drawbacks over
> > THP=always. Using madvise hints mean THPs aren't "transparent" and
> > require userspace changes. Waiting for khugepaged to scan memory and
> > collapse pages into THP can be slow and unpredictable in terms of performance
> > (i.e. you dont know when the collapse will happen), while production
> > environments require predictable performance. If there is enough memory
> > available, its better for both performance and predictability to have
> > a THP from fault time, i.e. THP=always rather than wait for khugepaged
> > to collapse it, and deal with sparsely populated THPs when the system is
> > running out of memory.
> >
> > This patch-series is an attempt to mitigate the issue of running out of
> > memory when THP is always enabled. During runtime whenever a THP is being
> > faulted in or collapsed by khugepaged, the THP is added to a list.
> > Whenever memory reclaim happens, the kernel runs the deferred_split
> > shrinker which goes through the list and checks if the THP was underutilized,
> > i.e. how many of the base 4K pages of the entire THP were zero-filled.
> > If this number goes above a certain threshold, the shrinker will attempt
> > to split that THP. Then at remap time, the pages that were zero-filled are
> > not remapped, hence saving memory. This method avoids the downside of
> > wasting memory in areas where THP is sparsely filled when THP is always
> > enabled, while still providing the upside THPs like reduced TLB misses without
> > having to use madvise.
> >
> > Meta production workloads that were CPU bound (>99% CPU utilzation) were
> > tested with THP shrinker. The results after 2 hours are as follows:
> >
> >                             | THP=madvise |  THP=always   | THP=always
> >                             |             |               | + shrinker series
> >                             |             |               | + max_ptes_none=409
> > -----------------------------------------------------------------------------
> > Performance improvement     |      -      |    +1.8%      |     +1.7%
> > (over THP=madvise)          |             |               |
> > -----------------------------------------------------------------------------
> > Memory usage                |    54.6G    | 58.8G (+7.7%) |   55.9G (+2.4%)
> > -----------------------------------------------------------------------------
> > max_ptes_none=409 means that any THP that has more than 409 out of 512
> > (80%) zero filled filled pages will be split.
> >
> > To test out the patches, the below commands without the shrinker will
> > invoke OOM killer immediately and kill stress, but will not fail with
> > the shrinker:
> >
> > echo 450 > /sys/kernel/mm/transparent_hugepage/khugepaged/max_ptes_none
> > mkdir /sys/fs/cgroup/test
> > echo $$ > /sys/fs/cgroup/test/cgroup.procs
> > echo 20M > /sys/fs/cgroup/test/memory.max
> > echo 0 > /sys/fs/cgroup/test/memory.swap.max
> > # allocate twice memory.max for each stress worker and touch 40/512 of
> > # each THP, i.e. vm-stride 50K.
> > # With the shrinker, max_ptes_none of 470 and below won't invoke OOM
> > # killer.
> > # Without the shrinker, OOM killer is invoked immediately irrespective
> > # of max_ptes_none value and kill stress.
> > stress --vm 1 --vm-bytes 40M --vm-stride 50K
> >
> > Patches 1-2 add back helper functions that were previously removed
> > to operate on page lists (needed by patch 3).
> > Patch 3 is an optimization to free zapped tail pages rather than
> > waiting for page reclaim or migration.
> > Patch 4 is a prerequisite for THP shrinker to not remap zero-filled
> > subpages when splitting THP.
> > Patches 6 adds support for THP shrinker.
> >
> > (This patch-series restarts the work on having a THP shrinker in kernel
> > originally done in
> > https://lore.kernel.org/all/cover.1667454613.git.alexlzhu@fb.com/.
> > The THP shrinker in this series is significantly different than the
> > original one, hence its labelled v1 (although the prerequisite to not
> > remap clean subpages is the same).)
> >
> > Alexander Zhu (1):
> >   mm: add selftests to split_huge_page() to verify unmap/zap of zero
> >     pages
> >
> > Usama Arif (3):
> >   Revert "memcg: remove mem_cgroup_uncharge_list()"
> >   Revert "mm: remove free_unref_page_list()"
> >   mm: split underutilized THPs
> >
> > Yu Zhao (2):
> >   mm: free zapped tail pages when splitting isolated thp
> >   mm: don't remap unused subpages when splitting isolated thp
> 
>  I would recommend shatter [1] instead of splitting so that

I agree with Rik, this seems like a possible optimization, not a
pre-requisite.

> 1) whoever underutilized their THPs get punished for the overhead;

Is that true? The downgrade is done in a shrinker. With or without
shattering, the compaction effort will be on the allocation side.

> 2) underutilized THPs are kept intact and can be reused by others.

If migration of the subpages is possible, then compaction can clear
the block as quickly as shattering can. The only difference is that
compaction would do the work on-demand, whereas shattering would do it
unconditionally, whether a THP has been requested or not...

Anyway, I think it'd be better to keep those discussions separate.
