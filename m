Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE03734F499
	for <linux-doc@vger.kernel.org>; Tue, 13 Jan 2026 21:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768341535; cv=none; b=XxuoXHhn7TYdYereRAdJfppgX7uZ6qdsg4Pmx9dbuQyyrVchcZMXHLemJsGP8KNyivqXO0eyP8QbpcGWcG0DqWPvmU19uoVLrBmBF5jzuWrugxOFj1NRYFF9FdHmOD+JgRQouaiocKyfvkQWui+tR2ahX+4tK6pQSkG4azGObm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768341535; c=relaxed/simple;
	bh=xBiv4ywg1u8Bx3Lq3F3bVw76wUqOpNRYrihpD/TVJ6A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=imtrlO2tWJ2zIeDUYDKSwhb0mmOFmoh7F+rbpWBc5th29fN25UjTvu/90YJOPQJ2lwkHhNIdqOMyEvNmTN1A8ywtQsVo/j1BMeQ5/J6usdU9JAl9ekjJAy7hhQvJE2qyAuKT6CaA/MfBYAY9SnBIXS/yFYIObKrn8gbUt9nYcbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TpymwicU; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=bREaPn/N; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TpymwicU";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="bREaPn/N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768341532;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Aszg6VHdGxbQOUkAIqtJEqZsCMcdfPcXY7mWtBsu0l0=;
	b=TpymwicUmpeLQEQ+Ufjtr/NNU/yM/OHVdCUk/qcXL7E5tNzJbR34OWYBIdslo3yfS554uj
	Di5kShJLW8gR3Cy6esgLzcviJo3fiholPthGc64r2xoWPKVQHufUynWikQMQjIOrSE73tt
	2jdErVosxLVth3s6lsvUdCZkP8+WtYc=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-302-yKsWWAbfP_WjI4iakXjPsA-1; Tue, 13 Jan 2026 16:58:51 -0500
X-MC-Unique: yKsWWAbfP_WjI4iakXjPsA-1
X-Mimecast-MFC-AGG-ID: yKsWWAbfP_WjI4iakXjPsA_1768341531
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-78e602d09a7so81843367b3.3
        for <linux-doc@vger.kernel.org>; Tue, 13 Jan 2026 13:58:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1768341531; x=1768946331; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Aszg6VHdGxbQOUkAIqtJEqZsCMcdfPcXY7mWtBsu0l0=;
        b=bREaPn/NlEaDnvAmnoNdO8f1Hszv4gDNlZGsFqLMAGOpJxauHu2qxjz8q+hjGw0tTr
         XfwO0Bo2rRfjrbM54aq6j1qT2yHs6aSHVwrRvkuqRhf7jWs8QrxZcIXRaQcKnhK399o5
         +tjntqyTmNfoPFYbJ2T5FrZgktDmOztn2AEHrl0s7yzLRA8ZWrF36SbfWqdHBM94lFcr
         yB5w7ODA5ZQGVqFdS18icy0LJb4S7/Jt3clTz0JjojIT36T/0OlKycGUCKRMccBMJKln
         rWjw2ZqbRoiMb693bUWi9TmXgok7n1MLxm5EfwKoXYgJgMUwZQcypk0ejW6J8Njq9IfK
         q+eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768341531; x=1768946331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Aszg6VHdGxbQOUkAIqtJEqZsCMcdfPcXY7mWtBsu0l0=;
        b=l9j5L0VZA9duUm2w1k8jVf0Q5WAxQSYVbDju8fEoIOKPXCyBxlfSbLlnZC+fz2tr4E
         zrtUFxDp2EjyewRfeKGgccoWmcAn6w7BL+Iy7OFgsHHueCTRxA8AgiBwyJ2kWZmX2RNR
         4bZfZuRA9V6Gzd7cuvWBcVzeYk+oQPhOeZ38Q2ODoSHIBkxoZZl5j8Q4i30QbiUZ1BFu
         Rf8Ia03jJP+t7Z8AP4RrTBD1ng5AgJ39w08dD0iuFZV2kZAQeP6691fgS17qhITeveTk
         v/UeUvjHVFhT7Td5ZZj/xyxNTSou/3UTm2hCFUsCKLacJh2auZmEzMa9vqyg8bNT9ULa
         f91A==
X-Forwarded-Encrypted: i=1; AJvYcCX9fCkoUAhb6nO5o5YVv/zGeWmeZBe2EztmYVdcKMqj+eXKLlrQJykHRwmhf4YnA0h9APfLD+n/Y1k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3jycNaVGT56Hicvk6o7jH/5K1ZpuwYkVdmK0oT6mbaLB2etL7
	hk1mv2devxH/MmghNEw8iFe4mjoJDyM0gDRlabHF13TrjHSlsguASiSLDLsug88BKMh6yDOWhXy
	/GDzRsDcHvIEbH5HboK7qaq+/Q9OYinEsHYZT17IK2Rh6juFtfhdD0CLbnwquLhwMDixcrRk5Zh
	So5mGLeBenadMyqa1FHr10OfCURz73Op/dL723
X-Gm-Gg: AY/fxX4otsjgIn7XlNSjPkyF2NIq67K6oTyDAWem243xQytVCs9ouPWx0lFQ351MkgY
	ViAd1q6I/Ls92MQEOyuPKwH5Bu7CpLYju6uCmOjx61rDe8N8dhZ1QgMWCq0tpLlrjE30/+VzI+8
	tEmfwDxbdfae4OG2nYF4IntyhF/xTxqZkBNCZNElhMpZTgsR2nVol7s8higVW/cDBo+9KIZUkwk
	+BqXEMC
X-Received: by 2002:a05:690e:4195:b0:63e:17d8:d985 with SMTP id 956f58d0204a3-64901b06d01mr670072d50.53.1768341530672;
        Tue, 13 Jan 2026 13:58:50 -0800 (PST)
X-Received: by 2002:a05:690e:4195:b0:63e:17d8:d985 with SMTP id
 956f58d0204a3-64901b06d01mr670028d50.53.1768341530229; Tue, 13 Jan 2026
 13:58:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251201174627.23295-1-npache@redhat.com> <e54b6ade-e2a0-4a68-93c4-23af85479567@lucifer.local>
In-Reply-To: <e54b6ade-e2a0-4a68-93c4-23af85479567@lucifer.local>
From: Nico Pache <npache@redhat.com>
Date: Tue, 13 Jan 2026 14:58:24 -0700
X-Gm-Features: AZwV_Qi-DwUQqcw_55ZPNTuKOVRySMeatqOYhgcJmeNszHAwF1Q0M7_BZf-QJkQ
Message-ID: <CAA1CXcAP6bX2=g-S-zqPrAQq6kJbQVOvx2cYYrXSCCL4R8UPpQ@mail.gmail.com>
Subject: Re: [PATCH v13 mm-new 00/16] khugepaged: mTHP support
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

On Thu, Jan 8, 2026 at 10:20=E2=80=AFAM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> (Sorry for multiple mails replying to same, lei/lore are broken again so =
my
> setup isn't working properly).
>
> I tried to fixup the conflicts here to run tests locally but there's too =
many
> and I messed it up.
>
> Could you please resend this series rebased on mm-unstable please?

Yes ofc! fixed all the conflicts yesterday, just finalizing my
testing. Should be out tomorrow or Thursday.

>
> Thanks, Lorenzo
>
> On Mon, Dec 01, 2025 at 10:46:11AM -0700, Nico Pache wrote:
> > The following series provides khugepaged with the capability to collaps=
e
> > anonymous memory regions to mTHPs.
> >
> > To achieve this we generalize the khugepaged functions to no longer dep=
end
> > on PMD_ORDER. Then during the PMD scan, we use a bitmap to track indivi=
dual
> > pages that are occupied (!none/zero). After the PMD scan is done, we us=
e
> > the bitmap to find the optimal mTHP sizes for the PMD range. The
> > restriction on max_ptes_none is removed during the scan, to make sure w=
e
> > account for the whole PMD range in the bitmap. When no mTHP size is
> > enabled, the legacy behavior of khugepaged is maintained.
> >
> > We currently only support max_ptes_none values of 0 or HPAGE_PMD_NR - 1
> > (ie 511). If any other value is specified, the kernel will emit a warni=
ng
> > and no mTHP collapse will be attempted. If a mTHP collapse is attempted=
,
> > but contains swapped out, or shared pages, we don't perform the collaps=
e.
> > It is now also possible to collapse to mTHPs without requiring the PMD =
THP
> > size to be enabled. These limitiations are to prevent collapse "creep"
> > behavior. This prevents constantly promoting mTHPs to the next availabl=
e
> > size, which would occur because a collapse introduces more non-zero pag=
es
> > that would satisfy the promotion condition on subsequent scans.
> >
> > Patch 1:     Refactor/rename hpage_collapse
> > Patch 2:     Refactoring to combine madvise_collapse and khugepaged
> > Patch 3-8:   Generalize khugepaged functions for arbitrary orders and
> >            introduce some helper functions
> > Patch 9:     skip collapsing mTHP to smaller orders
> > Patch 10-11: Add per-order mTHP statistics and tracepoints
> > Patch 12:    Introduce collapse_allowable_orders
> > Patch 13-15: Introduce bitmap and mTHP collapse support, fully enabled
> > Patch 16:    Documentation
> >
> > ---------
> >  Testing
> > ---------
> > - Built for x86_64, aarch64, ppc64le, and s390x
> > - selftests mm
> > - I created a test script that I used to push khugepaged to its limits
> >    while monitoring a number of stats and tracepoints. The code is
> >    available here[1] (Run in legacy mode for these changes and set mthp
> >    sizes to inherit)
> >    The summary from my testings was that there was no significant
> >    regression noticed through this test. In some cases my changes had
> >    better collapse latencies, and was able to scan more pages in the sa=
me
> >    amount of time/work, but for the most part the results were consiste=
nt.
> > - redis testing. I tested these changes along with my defer changes
> >   (see followup [2] post for more details). We've decided to get the mT=
HP
> >   changes merged first before attempting the defer series.
> > - some basic testing on 64k page size.
> > - lots of general use.
> >
> > V13 Changes:
> > - Lots of minor nits, cleanups, comments, and renames
> > - Bitmap function simplification and more helpers (Wei, Lorenzo)
> > - Max_ptes_none (0 or 511) restriction
> > - commit description expansion
> > - list all reachable enum values in mthp_collapse()
> > - Fix ppc64 compile error due to using HPAGE_PMD_ORDER (replace with
> >   ilog2(MAX_PTRS_PER_PTE))
> >
> > V12: https://lore.kernel.org/lkml/20251022183717.70829-1-npache@redhat.=
com/
> > V11: https://lore.kernel.org/lkml/20250912032810.197475-1-npache@redhat=
.com/
> > V10: https://lore.kernel.org/lkml/20250819134205.622806-1-npache@redhat=
.com/
> > V9 : https://lore.kernel.org/lkml/20250714003207.113275-1-npache@redhat=
.com/
> > V8 : https://lore.kernel.org/lkml/20250702055742.102808-1-npache@redhat=
.com/
> > V7 : https://lore.kernel.org/lkml/20250515032226.128900-1-npache@redhat=
.com/
> > V6 : https://lore.kernel.org/lkml/20250515030312.125567-1-npache@redhat=
.com/
> > V5 : https://lore.kernel.org/lkml/20250428181218.85925-1-npache@redhat.=
com/
> > V4 : https://lore.kernel.org/lkml/20250417000238.74567-1-npache@redhat.=
com/
> > V3 : https://lore.kernel.org/lkml/20250414220557.35388-1-npache@redhat.=
com/
> > V2 : https://lore.kernel.org/lkml/20250211003028.213461-1-npache@redhat=
.com/
> > V1 : https://lore.kernel.org/lkml/20250108233128.14484-1-npache@redhat.=
com/
> >
> > A big thanks to everyone that has reviewed, tested, and participated in
> > the development process. Its been a great experience working with all o=
f
> > you on this endeavour.
> >
> > [1] - https://gitlab.com/npache/khugepaged_mthp_test
> > [2] - https://lore.kernel.org/lkml/20250515033857.132535-1-npache@redha=
t.com/
> >
> > Baolin Wang (1):
> >   khugepaged: run khugepaged for all orders
> >
> > Dev Jain (1):
> >   khugepaged: generalize alloc_charge_folio()
> >
> > Nico Pache (14):
> >   khugepaged: rename hpage_collapse_* to collapse_*
> >   introduce collapse_single_pmd to unify khugepaged and madvise_collaps=
e
> >   khugepaged: generalize hugepage_vma_revalidate for mTHP support
> >   khugepaged: introduce is_mthp_order helper
> >   khugepaged: generalize __collapse_huge_page_* for mTHP support
> >   khugepaged: introduce collapse_max_ptes_none helper function
> >   khugepaged: generalize collapse_huge_page for mTHP collapse
> >   khugepaged: skip collapsing mTHP to smaller orders
> >   khugepaged: add per-order mTHP collapse failure statistics
> >   khugepaged: improve tracepoints for mTHP orders
> >   khugepaged: introduce collapse_allowable_orders helper function
> >   khugepaged: Introduce mTHP collapse support
> >   khugepaged: avoid unnecessary mTHP collapse attempts
> >   Documentation: mm: update the admin guide for mTHP collapse
> >
> >  Documentation/admin-guide/mm/transhuge.rst |  80 ++-
> >  include/linux/huge_mm.h                    |   5 +
> >  include/trace/events/huge_memory.h         |  34 +-
> >  mm/huge_memory.c                           |  11 +
> >  mm/khugepaged.c                            | 696 +++++++++++++++------
> >  mm/mremap.c                                |   2 +-
> >  6 files changed, 618 insertions(+), 210 deletions(-)
> >
> > --
> > 2.51.1
> >
>

