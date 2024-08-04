Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F0713B5B4
	for <linux-doc@vger.kernel.org>; Sun,  4 Aug 2024 21:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722808537; cv=none; b=uUPfhUTB/j8SI5ORhQReMZhUcpen32MRVYuX/v4v3APpWZoL40U1F6vHXfEFOwgpwRMBk5IZvq8k0CBSeiRRY/pvxgLdgnnnuDCx3UROmkfj+k4Ja7XZ6Vuaxoumnoz3HZL+x/ExSH7CEG2dvtpYx2Sxr88giVs9DZgkhm4YvuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722808537; c=relaxed/simple;
	bh=QYoMfwmKvpsnQt/hTVfgfdrvBR0EWL2Xjo/mAdvPVUM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gzLqySF55jvdv+ScITuWRMVIR2ZeAjJLOhQpIpEXF2B8Fd1F7uJT8we80AJvht834ry/FgpKwl7Uix9/PcOZ0SNhiRa6kTL3JhHJYjFLTkXrX+tXMkjiO3ucLdxnKMcyns/ZUHrSbwcjPX34fBAyOrrD3GUXswRqDCCb0D4Jqwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uNoUi4fm; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uNoUi4fm"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-45029af1408so198681cf.1
        for <linux-doc@vger.kernel.org>; Sun, 04 Aug 2024 14:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722808534; x=1723413334; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P8s6/ypPv2wbuWHf/ATun4VhYJJ06DR5ZHtUhhgqlE8=;
        b=uNoUi4fm6Dj1HunXCL0Xc2wx3pzpxJAAb0Mjhssw1bg+9TTGkLsO4nSCDQlkYcVcnL
         v5C80tkX1WkX5tkkhTKJ9BCHt97F7nguYN1E2GUAbvydEBFVbCfetAw2O2cm2wbT5Hmv
         kWzbbLllLrnxnUhC001XkxCb5nn4J/NkI54D3L2qakPdWj8hDiULsETOiTteY6JudHtd
         EjasX6nXZbWoZpc9zWxeeKBvSjdE5+AYLjzsM+2F1SJDM2TswxDrXymVTczI3/YdZEq+
         LnGsvD4UTk4hhojYJApCSu8rPUAy0IG1YCDyR0hktUB9hDkagxo0wjzInoWvFOz9rKT/
         oW1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722808534; x=1723413334;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P8s6/ypPv2wbuWHf/ATun4VhYJJ06DR5ZHtUhhgqlE8=;
        b=iwhyY33pxmXMwxOCeBzRDNbbncHB8OTIarpz1R8FLzp9Lk5qBrb8ysJV5UbRY42KX2
         lMwrWtwhsmPMGpIr5wuWULmfyG+bB6MsrxcsoWae+tN8ypuhFKS5R8+sIc+idIcyZ1AM
         em6Fzy+DQxkCMIlvgRVHaOsXiMqwz7yMLTHHw9lHVjJ8p+DVZS3qoapFTHAsZLU6L/Jn
         1SDUNaj7ndA5bW2/iIBvqbOV9A2WXH4ve3XDLbneQmQLQBT9HdMdwuObwXP+0EyRgbsn
         gnJAJUgCSnqG3cFpa2SVXev4d3BoYZAZ1nUD58+iyHxFNTOZNwOfKfuA+Z1LPpQwbexY
         nhNw==
X-Forwarded-Encrypted: i=1; AJvYcCUCHo0njiuADGKGNj4ZrLL2xJtWfl7MgIxXJ4LUQ+OG3EKSRdl56n4xU6speXNSNPOINWeWFO3Q2HGRUXu0Sl1EUn+uhpdmGKYS
X-Gm-Message-State: AOJu0YyxShUvAqeK7ZSzI2HwoUqbj7rVFRQ7b97mnAKE1Jtpr0DcUlMf
	wajXNTKhtn1YPmIPAKPcWxyhVQ5Rfd7mKMLkjzMYmFZ/7tNtCbE/AFe8GyyB5S5vwStO+ZM47Te
	v2PEW5I5NYbhBlsCpzK8zjy9XhS6A3oUaH4Hw
X-Google-Smtp-Source: AGHT+IEqf9okWn67PocUy8Jocw+dhghNQyk3Kfdq2yIp+/9Gkk10jzuGIlDmiYcXIwua7o+f+NVqtl0RNtMVswl/hqQ=
X-Received: by 2002:ac8:7e8b:0:b0:447:dd54:2cd4 with SMTP id
 d75a77b69052e-4519adec1a8mr3133101cf.22.1722808533991; Sun, 04 Aug 2024
 14:55:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240730125346.1580150-1-usamaarif642@gmail.com>
 <CAOUHufb7z13u51VCTGZMimoCXpmfT5AOAbrUpAvJjTx5+AXwew@mail.gmail.com> <aea333fb-44ab-41eb-9060-472b08e3010d@redhat.com>
In-Reply-To: <aea333fb-44ab-41eb-9060-472b08e3010d@redhat.com>
From: Yu Zhao <yuzhao@google.com>
Date: Sun, 4 Aug 2024 15:54:57 -0600
Message-ID: <CAOUHufZ=Oquy_UGBC0FTjJ5QvQnhk0UipHBMfJ5yqSYn06qevg@mail.gmail.com>
Subject: Re: [PATCH 0/6] mm: split underutilized THPs
To: David Hildenbrand <david@redhat.com>
Cc: Usama Arif <usamaarif642@gmail.com>, akpm@linux-foundation.org, linux-mm@kvack.org, 
	hannes@cmpxchg.org, riel@surriel.com, shakeel.butt@linux.dev, 
	roman.gushchin@linux.dev, baohua@kernel.org, ryan.roberts@arm.com, 
	rppt@kernel.org, willy@infradead.org, cerasuolodomenico@gmail.com, 
	corbet@lwn.net, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 1, 2024 at 9:47=E2=80=AFAM David Hildenbrand <david@redhat.com>=
 wrote:
>
> On 01.08.24 08:09, Yu Zhao wrote:
> > On Tue, Jul 30, 2024 at 6:54=E2=80=AFAM Usama Arif <usamaarif642@gmail.=
com> wrote:
> >>
> >> The current upstream default policy for THP is always. However, Meta
> >> uses madvise in production as the current THP=3Dalways policy vastly
> >> overprovisions THPs in sparsely accessed memory areas, resulting in
> >> excessive memory pressure and premature OOM killing.
> >> Using madvise + relying on khugepaged has certain drawbacks over
> >> THP=3Dalways. Using madvise hints mean THPs aren't "transparent" and
> >> require userspace changes. Waiting for khugepaged to scan memory and
> >> collapse pages into THP can be slow and unpredictable in terms of perf=
ormance
> >> (i.e. you dont know when the collapse will happen), while production
> >> environments require predictable performance. If there is enough memor=
y
> >> available, its better for both performance and predictability to have
> >> a THP from fault time, i.e. THP=3Dalways rather than wait for khugepag=
ed
> >> to collapse it, and deal with sparsely populated THPs when the system =
is
> >> running out of memory.
> >>
> >> This patch-series is an attempt to mitigate the issue of running out o=
f
> >> memory when THP is always enabled. During runtime whenever a THP is be=
ing
> >> faulted in or collapsed by khugepaged, the THP is added to a list.
> >> Whenever memory reclaim happens, the kernel runs the deferred_split
> >> shrinker which goes through the list and checks if the THP was underut=
ilized,
> >> i.e. how many of the base 4K pages of the entire THP were zero-filled.
> >> If this number goes above a certain threshold, the shrinker will attem=
pt
> >> to split that THP. Then at remap time, the pages that were zero-filled=
 are
> >> not remapped, hence saving memory. This method avoids the downside of
> >> wasting memory in areas where THP is sparsely filled when THP is alway=
s
> >> enabled, while still providing the upside THPs like reduced TLB misses=
 without
> >> having to use madvise.
> >>
> >> Meta production workloads that were CPU bound (>99% CPU utilzation) we=
re
> >> tested with THP shrinker. The results after 2 hours are as follows:
> >>
> >>                              | THP=3Dmadvise |  THP=3Dalways   | THP=
=3Dalways
> >>                              |             |               | + shrinke=
r series
> >>                              |             |               | + max_pte=
s_none=3D409
> >> ----------------------------------------------------------------------=
-------
> >> Performance improvement     |      -      |    +1.8%      |     +1.7%
> >> (over THP=3Dmadvise)          |             |               |
> >> ----------------------------------------------------------------------=
-------
> >> Memory usage                |    54.6G    | 58.8G (+7.7%) |   55.9G (+=
2.4%)
> >> ----------------------------------------------------------------------=
-------
> >> max_ptes_none=3D409 means that any THP that has more than 409 out of 5=
12
> >> (80%) zero filled filled pages will be split.
> >>
> >> To test out the patches, the below commands without the shrinker will
> >> invoke OOM killer immediately and kill stress, but will not fail with
> >> the shrinker:
> >>
> >> echo 450 > /sys/kernel/mm/transparent_hugepage/khugepaged/max_ptes_non=
e
> >> mkdir /sys/fs/cgroup/test
> >> echo $$ > /sys/fs/cgroup/test/cgroup.procs
> >> echo 20M > /sys/fs/cgroup/test/memory.max
> >> echo 0 > /sys/fs/cgroup/test/memory.swap.max
> >> # allocate twice memory.max for each stress worker and touch 40/512 of
> >> # each THP, i.e. vm-stride 50K.
> >> # With the shrinker, max_ptes_none of 470 and below won't invoke OOM
> >> # killer.
> >> # Without the shrinker, OOM killer is invoked immediately irrespective
> >> # of max_ptes_none value and kill stress.
> >> stress --vm 1 --vm-bytes 40M --vm-stride 50K
> >>
> >> Patches 1-2 add back helper functions that were previously removed
> >> to operate on page lists (needed by patch 3).
> >> Patch 3 is an optimization to free zapped tail pages rather than
> >> waiting for page reclaim or migration.
> >> Patch 4 is a prerequisite for THP shrinker to not remap zero-filled
> >> subpages when splitting THP.
> >> Patches 6 adds support for THP shrinker.
> >>
> >> (This patch-series restarts the work on having a THP shrinker in kerne=
l
> >> originally done in
> >> https://lore.kernel.org/all/cover.1667454613.git.alexlzhu@fb.com/.
> >> The THP shrinker in this series is significantly different than the
> >> original one, hence its labelled v1 (although the prerequisite to not
> >> remap clean subpages is the same).)
> >>
> >> Alexander Zhu (1):
> >>    mm: add selftests to split_huge_page() to verify unmap/zap of zero
> >>      pages
> >>
> >> Usama Arif (3):
> >>    Revert "memcg: remove mem_cgroup_uncharge_list()"
> >>    Revert "mm: remove free_unref_page_list()"
> >>    mm: split underutilized THPs
> >>
> >> Yu Zhao (2):
> >>    mm: free zapped tail pages when splitting isolated thp
> >>    mm: don't remap unused subpages when splitting isolated thp
> >
> >   I would recommend shatter [1] instead of splitting so that
> > 1) whoever underutilized their THPs get punished for the overhead;
> > 2) underutilized THPs are kept intact and can be reused by others.
> >
> > [1] https://lore.kernel.org/20240229183436.4110845-3-yuzhao@google.com/
> >
>
> Do you have any plans to upstream the shattering also during "ordinary"
> deferred splitting?

Yes, once we finish verifying it in our production.
