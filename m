Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F471A28D
	for <linux-doc@vger.kernel.org>; Thu, 15 May 2025 03:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747279306; cv=none; b=jYutKo3as3t3Ff3wOZAcIMS04v/xFZ1syZy0wwO/gKXI9poTPiDBhoPQO9aWntcmHXdpUg7SXqcr9RNP6BlFxk/X3y4ZIFxKGNFTuTMAcyhj+A4RrifoSqM3zZ5eSDWRuzmIHoqDuwuJ6xq/l2hDLaPdo+XEpaHckYXnHX79W9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747279306; c=relaxed/simple;
	bh=nZ7fPcFM09Quvx4U8CoxDdb4H334WsV9KVwTmqQi9nk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CQUOg87FRIda2nE3lc9oYbqq7wZ9gPLeohUkh+SajMo+Pa+F8TzPCsqQw9AZoHY78MGaM7PAWzag6KX5FLvWTwEXOFp9c3v5lMBwnOqToazipTLZRzxlGueRvHdTETJDscvV9DVDCGh7S1dD43DfQkOaNIyLLnrKad0mapxTQ64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=N71Anwui; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="N71Anwui"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747279303;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fTeV/WO8sCZkiFkU9JmxKppZ1kmH8Wa3R30xrqm9r44=;
	b=N71AnwuiIN04VRSqGWYaaxpzhzfALjKJ7PePfiJyylx2cn/BadbajSH1+q+AdPubj0oIDC
	FZSrdCXyV5FVVmwSkMs4tsJ40lg7UtaCdL7YN6VuBdh54Q1+tShzrEJA9f5sa0C7VnBeEv
	REIPfu7yO5Y3O9uwB1R4NpyzPwmfgGs=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-223-4VU04wVsOAqPyktoFeFptg-1; Wed, 14 May 2025 23:21:42 -0400
X-MC-Unique: 4VU04wVsOAqPyktoFeFptg-1
X-Mimecast-MFC-AGG-ID: 4VU04wVsOAqPyktoFeFptg_1747279301
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-7082d8db9bcso7725357b3.3
        for <linux-doc@vger.kernel.org>; Wed, 14 May 2025 20:21:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747279301; x=1747884101;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fTeV/WO8sCZkiFkU9JmxKppZ1kmH8Wa3R30xrqm9r44=;
        b=m5Fs666tkI4atQsHT+NhbbZj7wF5iEMDKDXdJlC+XU6S92quZTpYzsC50z0KJA+7lN
         n3yhsjGQ0InK5G6dqUY65VArxYXm6BfO+S3Oj1o/xqnhDyBP6g9GeheCGA8JhtsmCl7v
         +cQ6/XHTSemKWzpFZe7OY6QpITiWZwcpmjyMDXAa8BEAm4FQGBsLMh91p4yoFNXwsRT7
         gDHgNn2jT6WQYePkRLcnCkUgyRMjXwf1OmAYr3mQ200aWsv3svbhjP3yb4bXY/DLDKVj
         eHhRK9bJql+w4vaGJETy2idGA9YflNliwT9+vNK24tfbhMWaaCyBRo6qSmRLBptg4Z+G
         X+Qw==
X-Forwarded-Encrypted: i=1; AJvYcCV8rJviMAazggthHNJkO0wCZms9CJRBeJihIQfuaUXauhGz4+I5B9WSsKb+rDxQAbZF6pf9yIndTTQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDthxUA+CLCr2+BVs6SMZH3pF3EEHaa/AQMAWaLK0gNn15o6u1
	I9iWwWXFZCt26pObJMJkEYhSoPGHkbeBa8zun0A6/2ZsqFWGyeOhRpoJ8GS2H2ej2fGq9ibMHqA
	N+mii8Wm+mGPROonWT/FgSB+vmK5xnHTVL9LnDVvs7RRn47i9YUIb1sjVlBmobzxCuJjrMLXIL6
	oBae/vyxBhPpWpF3ZY4dkDX8WAYieqEdlz
X-Gm-Gg: ASbGncuwBqXxWyl/xbrRNeZK5/j9hfFEncBdi4+n16ilE3DJ8TM+un+Jg4ksemSEAVw
	OqPcZVNyT7yxl8l9PLov6/ngkeOuY0wSaGQA8vPxAxxFIR75Q42RnGeTP7i+2XVt87+lRqCQ=
X-Received: by 2002:a05:690c:6e0e:b0:708:3a47:3d2c with SMTP id 00721157ae682-70c7f12c8famr94768707b3.13.1747279301396;
        Wed, 14 May 2025 20:21:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFM4mZxig5/05EWPU+CFmocywD5iXORxl4Y6pxrnOlBmTEaXyhJqWFviIYIj7G5V/QV7i7XgKaqOB+7kYcteo0=
X-Received: by 2002:a05:690c:6e0e:b0:708:3a47:3d2c with SMTP id
 00721157ae682-70c7f12c8famr94768327b3.13.1747279300939; Wed, 14 May 2025
 20:21:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515030312.125567-1-npache@redhat.com>
In-Reply-To: <20250515030312.125567-1-npache@redhat.com>
From: Nico Pache <npache@redhat.com>
Date: Wed, 14 May 2025 21:21:14 -0600
X-Gm-Features: AX0GCFuDBI2AES8eO7twjKdGMIMeHHi4i6ePTC9RxmHbpsPIlqmkhrIU3ijT4fQ
Message-ID: <CAA1CXcAKk5z+gTrQDe-eLsxkrsNrf8G9HD5KBPTJv_EECei_Mg@mail.gmail.com>
Subject: Re: [PATCH v6 00/12] khugepaged: mTHP support
To: linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Cc: david@redhat.com, ziy@nvidia.com, baolin.wang@linux.alibaba.com, 
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, ryan.roberts@arm.com, 
	dev.jain@arm.com, corbet@lwn.net, rostedt@goodmis.org, mhiramat@kernel.org, 
	mathieu.desnoyers@efficios.com, akpm@linux-foundation.org, baohua@kernel.org, 
	willy@infradead.org, peterx@redhat.com, wangkefeng.wang@huawei.com, 
	usamaarif642@gmail.com, sunnanyong@huawei.com, vishal.moola@gmail.com, 
	thomas.hellstrom@linux.intel.com, yang@os.amperecomputing.com, 
	kirill.shutemov@linux.intel.com, aarcange@redhat.com, raquini@redhat.com, 
	anshuman.khandual@arm.com, catalin.marinas@arm.com, tiwai@suse.de, 
	will@kernel.org, dave.hansen@linux.intel.com, jack@suse.cz, cl@gentwo.org, 
	jglisse@google.com, surenb@google.com, zokeefe@google.com, hannes@cmpxchg.org, 
	rientjes@google.com, mhocko@suse.com, rdunlap@infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ugh... So sorry, I forgot to turn off the chain-reply-to.

resending V7 *facepalm*

On Wed, May 14, 2025 at 9:03=E2=80=AFPM Nico Pache <npache@redhat.com> wrot=
e:
>
> The following series provides khugepaged and madvise collapse with the
> capability to collapse anonymous memory regions to mTHPs.
>
> To achieve this we generalize the khugepaged functions to no longer depen=
d
> on PMD_ORDER. Then during the PMD scan, we keep track of chunks of pages
> (defined by KHUGEPAGED_MTHP_MIN_ORDER) that are utilized. This info is
> tracked using a bitmap. After the PMD scan is done, we do binary recursio=
n
> on the bitmap to find the optimal mTHP sizes for the PMD range. The
> restriction on max_ptes_none is removed during the scan, to make sure we
> account for the whole PMD range. When no mTHP size is enabled, the legacy
> behavior of khugepaged is maintained. max_ptes_none will be scaled by the
> attempted collapse order to determine how full a THP must be to be
> eligible. If a mTHP collapse is attempted, but contains swapped out, or
> shared pages, we dont perform the collapse.
>
> With the default max_ptes_none=3D511, the code should keep its most of it=
s
> original behavior. To exercise mTHP collapse we need to set
> max_ptes_none<=3D255. With max_ptes_none > HPAGE_PMD_NR/2 you will
> experience collapse "creep" and constantly promote mTHPs to the next
> available size. This is due the fact that it will introduce at least 2x
> the number of pages, and on a future scan will satisfy that condition onc=
e
> again.
>
> Patch 1:     Refactor/rename hpage_collapse
> Patch 2:     Some refactoring to combine madvise_collapse and khugepaged
> Patch 3-5:   Generalize khugepaged functions for arbitrary orders
> Patch 6-9:   The mTHP patches
> Patch 10-11: Tracing/stats
> Patch 12:    Documentation
>
> ---------
>  Testing
> ---------
> - Built for x86_64, aarch64, ppc64le, and s390x
> - selftests mm
> - I created a test script that I used to push khugepaged to its limits
>    while monitoring a number of stats and tracepoints. The code is
>    available here[1] (Run in legacy mode for these changes and set mthp
>    sizes to inherit)
>    The summary from my testings was that there was no significant
>    regression noticed through this test. In some cases my changes had
>    better collapse latencies, and was able to scan more pages in the same
>    amount of time/work, but for the most part the results were consistent=
.
> - redis testing. I tested these changes along with my defer changes
>   (see followup post for more details).
> - some basic testing on 64k page size.
> - lots of general use.
>
> V6 Changes:
> - Dont release the anon_vma_lock early (like in the PMD case), as not all
>   pages are isolated.
> - Define the PTE as null to avoid a uninitilized condition
> - minor nits and newline cleanup
> - make sure to unmap and unlock the pte for the swapin case
> - change the revalidation to always check the PMD order (as this will mak=
e
>   sure that no other VMA spans it)
>
> V5 Changes [2]:
> - switched the order of patches 1 and 2
> - fixed some edge cases on the unified madvise_collapse and khugepaged
> - Explained the "creep" some more in the docs
> - fix EXCEED_SHARED vs EXCEED_SWAP accounting issue
> - fix potential highmem issue caused by a early unmap of the PTE
>
> V4 Changes:
> - Rebased onto mm-unstable
> - small changes to Documentation
>
> V3 Changes:
> - corrected legacy behavior for khugepaged and madvise_collapse
> - added proper mTHP stat tracking
> - Minor changes to prevent a nested lock on non-split-lock arches
> - Took Devs version of alloc_charge_folio as it has the proper stats
> - Skip cases were trying to collapse to a lower order would still fail
> - Fixed cases were the bitmap was not being updated properly
> - Moved Documentation update to this series instead of the defer set
> - Minor bugs discovered during testing and review
> - Minor "nit" cleanup
>
> V2 Changes:
> - Minor bug fixes discovered during review and testing
> - removed dynamic allocations for bitmaps, and made them stack based
> - Adjusted bitmap offset from u8 to u16 to support 64k pagesize.
> - Updated trace events to include collapsing order info.
> - Scaled max_ptes_none by order rather than scaling to a 0-100 scale.
> - No longer require a chunk to be fully utilized before setting the bit.
>    Use the same max_ptes_none scaling principle to achieve this.
> - Skip mTHP collapse that requires swapin or shared handling. This helps
>    prevent some of the "creep" that was discovered in v1.
>
> [1] - https://gitlab.com/npache/khugepaged_mthp_test
> [2] - https://lore.kernel.org/all/20250428181218.85925-1-npache@redhat.co=
m/
>
> Dev Jain (1):
>   khugepaged: generalize alloc_charge_folio()
>
> Nico Pache (11):
>   khugepaged: rename hpage_collapse_* to khugepaged_*
>   introduce khugepaged_collapse_single_pmd to unify khugepaged and
>     madvise_collapse
>   khugepaged: generalize hugepage_vma_revalidate for mTHP support
>   khugepaged: generalize __collapse_huge_page_* for mTHP support
>   khugepaged: introduce khugepaged_scan_bitmap for mTHP support
>   khugepaged: add mTHP support
>   khugepaged: skip collapsing mTHP to smaller orders
>   khugepaged: avoid unnecessary mTHP collapse attempts
>   khugepaged: improve tracepoints for mTHP orders
>   khugepaged: add per-order mTHP khugepaged stats
>   Documentation: mm: update the admin guide for mTHP collapse
>
>  Documentation/admin-guide/mm/transhuge.rst |  14 +-
>  include/linux/huge_mm.h                    |   5 +
>  include/linux/khugepaged.h                 |   4 +
>  include/trace/events/huge_memory.h         |  34 +-
>  mm/huge_memory.c                           |  11 +
>  mm/khugepaged.c                            | 472 ++++++++++++++-------
>  6 files changed, 382 insertions(+), 158 deletions(-)
>
> --
> 2.49.0
>

