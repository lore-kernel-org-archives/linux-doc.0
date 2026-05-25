Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE0B3806CA
	for <linux-doc@vger.kernel.org>; Mon, 25 May 2026 13:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779714488; cv=pass; b=Ek1CnbFOpHenNEcEHXVzofnzh6ts3Z8e9rdHHMmGbJHJDlYhK4+iK7dfO4zAIktiomh1q5LE7Q22UtbpeiQE7y6jqNgdKRc++d0yndtu6D7XQPXPx1NleJVMwdxUaY288+ONmBbh9OsJUCfCHepAPbPSpGwJDgIpWGd4k7ezK2w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779714488; c=relaxed/simple;
	bh=VxOJXhlYf1TzidNy9wGb8meWIo0vZXBuxh3BnLfdZnY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c5q4UoUaH8uCAp94LQ2PoqZGTl/1DO/Ree5ATSI8o1s1HvJB6NsLbmWq63JvRJxDCGGd34piBvPFn6K9UgMphN/Nlqh8dp9bkPAlKoCtGUB/Ud9nI6zf0avt2/XZP0hhFsjv9bW0/nd6ZHiv6xz7zcXZ1iEVu/i2zdtXPfYZ1Eo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XlZTxEGQ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=P8F6t9bP; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XlZTxEGQ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="P8F6t9bP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779714484;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L38bysUR1NeCFbrgfAfjXOTsZtYRransTREWZqs2gF0=;
	b=XlZTxEGQ1TG3vN99mODf0S8yuAQ3/61jbWdevXoBsKzUAF1Mr3l/ejh9a18EXVbuL2Yp/n
	7BmUNC3XJRrs0qpoVzvdL9Fhap3o5YOXxgwotOJyhZMmQ7lXvbbXC65SjTqyS43XtoW7Bb
	s0eQawn6BzyUqMDyeWaNUR+vFylO0P0=
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com
 [74.125.224.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-531-3NqLOCFWNXCEWC4i440qzg-1; Mon, 25 May 2026 09:08:03 -0400
X-MC-Unique: 3NqLOCFWNXCEWC4i440qzg-1
X-Mimecast-MFC-AGG-ID: 3NqLOCFWNXCEWC4i440qzg_1779714482
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-65c21049da9so16099705d50.1
        for <linux-doc@vger.kernel.org>; Mon, 25 May 2026 06:08:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779714482; cv=none;
        d=google.com; s=arc-20240605;
        b=V8pbPUAaqlj0wyeAAMuB1Zx90VLq5WKHdGHn4GTtNiVK2gU7DdBPamrl/Y36nDzdH6
         Vs6fHmiBrzE25HKIRQ1IUsoCKnKNYEpFJhJVw7d34DEIsFKrzGtMxxP9K8pKAWNg0t6O
         y3xVzjuQAbBw3eYSb4xlFopQUw+Ro7JifGNabcWB/g+9M9X9gD6X7Lx7xosX8NdZlJzO
         T8vYqjMOB5Kcpj8qB6zps1LfMJtyO1XeDFYDivuqNVGPie0j//CGabfQk7l4IXop3nb+
         USXpDXjAMst1ZPbgZZn46r/rxQFoPVaR9Ijxd/cXJTh2uhrPyHGqQTnG3zlLo0GlG1KH
         B9nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=L38bysUR1NeCFbrgfAfjXOTsZtYRransTREWZqs2gF0=;
        fh=PpdZ4ZqvCON8iuHaOHJtBfBZcEPXSB0oX25BxddkyLo=;
        b=MgImor4hNy3G3+UubZGfDhG1YBZkNdIp0nDsoGR+yS4C5EUJM8i64EiqwWMEkoF7Bo
         PyhHslqb2Xiq4LKaq/IBP4PRu4D9wq7LnO5CoLGkJ+58BaWIRk6+55nOFVdWvSMcfghI
         fVYXQh3FPuSYDQtioGNSzUmivOxIFBQbJsZXQ9415Wv7NpBuslYe/w3Hvb0kJfaka3MF
         SOagHAbdFinR61yeH0IdCJQ6suWFgnIpZUyVhxqSvUg65z5+8kccNUsV0Gk3eQuqFFLo
         TgEVdfpVmsFOa2RrPl/E49J8s7/vqAvHWqi16RvzJNwjH+imOZN7cVlpKKcsCyrz0k/I
         cbzA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1779714482; x=1780319282; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L38bysUR1NeCFbrgfAfjXOTsZtYRransTREWZqs2gF0=;
        b=P8F6t9bPFqM0SGa2rQt0pOfqzOUqh/24MiM5ivF0VkFiyhGN3KHxq7HkYa5yxd1nNF
         U6bZFUTRcsP8u0paprd+OQ2wLZ6xNzAU4eCSJvivfE5saeOhg5mDjdvLkEBrIyP7YlgH
         LIZtE8vAvMSdOFwjLsF1kMmM/xguittn759wF6Yz6vR+zMJu/HVE0Hqs0vq/K9sVDsv0
         z297qsWpv38P2cY90JaXeGBI5bI3GbhcB49OaYgq5TFWLkGiKRPkH9NT7V1/nFisO1kT
         +Gcf7oTdq2cZs1YkK1lfiPllA/qWDWbf+pojxEg22ECGBnJwzL1D3F4Ol5FulnV/EZaM
         bUuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779714482; x=1780319282;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L38bysUR1NeCFbrgfAfjXOTsZtYRransTREWZqs2gF0=;
        b=HD5TMPbBSufrxDV77s3a6DUDEIfcAu5+xSFdvFLp7EOn8sjimaiHDMAGdEoVyy5jnN
         w/M+5cNWwu90jw/XMLITUrGx0nbujtbmkaaMX2K2oy9kmD900Y+0/CdffJLGIeSBEp/C
         VRTdzY3U5HZvjSbpepoXfupt7GHhQC0qhH+ip7iAPJ1RBnZrydXm94ZNppjFuFWwaiz8
         qejYgWylDbJX0ZUhqKVGsdNri4uA/WyargDu7+QrQBGisbrKqnDbuR6TNUgR7igEq2ap
         DaXLrzEZUxOj80Miocr7CjoaaUi1u1fLThNswwBGbC/cEZlv1t8vjH2KTBKnbZe22+dF
         E32w==
X-Gm-Message-State: AOJu0Yz0FY9RktoFPHxa74WoJ5o1SaAao7VM1nozF6r9LVoYdlphhZyC
	IsE4j/u/jYHzpqxk4gudiCfFg7+a6IYekxnUCuMJF4/MdGGOfvtpt5xsgnfKcjGJSCSs6bpKhzb
	BRiGZGeAboK4/FfDY8xNJVlw9BLiMu9xFw5U8tiqw9beKyEmW1wlmU/Pu0uu4JRrpj3uYAeySvS
	4ktERMc6zrs9uZz+WtmkzSZGd6aJtjnOwSpTA3
X-Gm-Gg: Acq92OFhe2f1FcZ7u3WyMggs7srmHsNPck1TaKfPf7PePc6WT6Y4m3MgWPqKwPGZ+re
	JPrTphS9SlXrH28TDGhkvamcUkQ8HRG3gIFqPd0fHDWvep0CB9yBA03OaRWK+Xh8FhNFJ16+UQ+
	ILHVfDs9LXGOc2HcUkRuhnxvQyTA20nJDa47NSrrM9QCrkATmhRzICF/YUTtf/QzLj+Wdu7f6kk
	loiJw==
X-Received: by 2002:a05:690e:4401:b0:65c:308c:a164 with SMTP id 956f58d0204a3-65ec95f0db3mr10162534d50.1.1779714481912;
        Mon, 25 May 2026 06:08:01 -0700 (PDT)
X-Received: by 2002:a05:690e:4401:b0:65c:308c:a164 with SMTP id
 956f58d0204a3-65ec95f0db3mr10162501d50.1.1779714481381; Mon, 25 May 2026
 06:08:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511185817.686831-1-npache@redhat.com> <20260511185817.686831-12-npache@redhat.com>
 <20260512154431.jxcs632mqqatqtsw@master> <CAA1CXcD2KPKFrwCZd2PatQhf_e1nrvCguPD77GcNOVPFZLvsew@mail.gmail.com>
 <20260521015510.k4p22m365q2wqkro@master>
In-Reply-To: <20260521015510.k4p22m365q2wqkro@master>
From: Nico Pache <npache@redhat.com>
Date: Mon, 25 May 2026 07:08:31 -0600
X-Gm-Features: AVHnY4J29748AeO7-WOLHmwpUAN_-xfWW3Sk7UtCIpdjXtCFGkj0IW_c31BTQDw
Message-ID: <CAA1CXcBNGmWb7798GEVbqNKqAUN_uRQ3KXx0G3372o_u-x9kSA@mail.gmail.com>
Subject: Re: [PATCH mm-unstable v17 11/14] mm/khugepaged: Introduce mTHP
 collapse support
To: Wei Yang <richard.weiyang@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-trace-kernel@vger.kernel.org, aarcange@redhat.com, 
	akpm@linux-foundation.org, anshuman.khandual@arm.com, apopple@nvidia.com, 
	baohua@kernel.org, baolin.wang@linux.alibaba.com, byungchul@sk.com, 
	catalin.marinas@arm.com, cl@gentwo.org, corbet@lwn.net, 
	dave.hansen@linux.intel.com, david@kernel.org, dev.jain@arm.com, 
	gourry@gourry.net, hannes@cmpxchg.org, hughd@google.com, jack@suse.cz, 
	jackmanb@google.com, jannh@google.com, jglisse@google.com, 
	joshua.hahnjy@gmail.com, kas@kernel.org, lance.yang@linux.dev, 
	liam@infradead.org, ljs@kernel.org, mathieu.desnoyers@efficios.com, 
	matthew.brost@intel.com, mhiramat@kernel.org, mhocko@suse.com, 
	peterx@redhat.com, pfalcato@suse.de, rakie.kim@sk.com, raquini@redhat.com, 
	rdunlap@infradead.org, rientjes@google.com, rostedt@goodmis.org, 
	rppt@kernel.org, ryan.roberts@arm.com, shivankg@amd.com, 
	sunnanyong@huawei.com, surenb@google.com, thomas.hellstrom@linux.intel.com, 
	tiwai@suse.de, usamaarif642@gmail.com, vbabka@suse.cz, vishal.moola@gmail.com, 
	wangkefeng.wang@huawei.com, will@kernel.org, willy@infradead.org, 
	yang@os.amperecomputing.com, ying.huang@linux.alibaba.com, ziy@nvidia.com, 
	zokeefe@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 20, 2026 at 7:55=E2=80=AFPM Wei Yang <richard.weiyang@gmail.com=
> wrote:
>
> On Wed, May 20, 2026 at 06:05:31AM -0600, Nico Pache wrote:
> >On Tue, May 12, 2026 at 9:44=E2=80=AFAM Wei Yang <richard.weiyang@gmail.=
com> wrote:
> >>
> >> On Mon, May 11, 2026 at 12:58:11PM -0600, Nico Pache wrote:
> >> >Enable khugepaged to collapse to mTHP orders. This patch implements t=
he
> >> >main scanning logic using a bitmap to track occupied pages and a stac=
k
> >> >structure that allows us to find optimal collapse sizes.
> >> >
> >> >Previous to this patch, PMD collapse had 3 main phases, a light weigh=
t
> >> >scanning phase (mmap_read_lock) that determines a potential PMD
> >> >collapse, an alloc phase (mmap unlocked), then finally heavier collap=
se
> >> >phase (mmap_write_lock).
> >> >
> >> >To enabled mTHP collapse we make the following changes:
> >> >
> >> >During PMD scan phase, track occupied pages in a bitmap. When mTHP
> >> >orders are enabled, we remove the restriction of max_ptes_none during=
 the
> >> >scan phase to avoid missing potential mTHP collapse candidates. Once =
we
> >> >have scanned the full PMD range and updated the bitmap to track occup=
ied
> >> >pages, we use the bitmap to find the optimal mTHP size.
> >> >
> >> >Implement collapse_scan_bitmap() to perform binary recursion on the b=
itmap
> >> >and determine the best eligible order for the collapse. A stack struc=
ture
> >> >is used instead of traditional recursion to manage the search. This a=
lso
> >> >prevents a traditional recursive approach when the kernel stack struc=
t is
> >> >limited. The algorithm recursively splits the bitmap into smaller chu=
nks to
> >> >find the highest order mTHPs that satisfy the collapse criteria. We s=
tart
> >> >by attempting the PMD order, then moved on the consecutively lower or=
ders
> >> >(mTHP collapse). The stack maintains a pair of variables (offset, ord=
er),
> >> >indicating the number of PTEs from the start of the PMD, and the orde=
r of
> >> >the potential collapse candidate.
> >> >
> >> >The algorithm for consuming the bitmap works as such:
> >> >    1) push (0, HPAGE_PMD_ORDER) onto the stack
> >> >    2) pop the stack
> >> >    3) check if the number of set bits in that (offset,order) pair
> >> >       statisfy the max_ptes_none threshold for that order
> >> >    4) if yes, attempt collapse
> >> >    5) if no (or collapse fails), push two new stack items representi=
ng
> >> >       the left and right halves of the current bitmap range, at the
> >> >       next lower order
> >> >    6) repeat at step (2) until stack is empty.
> >> >
> >> >Below is a diagram representing the algorithm and stack items:
> >> >
> >> >                            offset   mid_offset
> >> >                            |        |
> >> >                            |        |
> >> >                            v        v
> >> >          ____________________________________
> >> >         |          PTE Page Table            |
> >> >         --------------------------------------
> >> >                           <-------><------->
> >> >                             order-1  order-1
> >> >
> >> >mTHP collapses reject regions containing swapped out or shared pages.
> >> >This is because adding new entries can lead to new none pages, and th=
ese
> >> >may lead to constant promotion into a higher order mTHP. A similar
> >> >issue can occur with "max_ptes_none > HPAGE_PMD_NR/2" due to a collap=
se
> >> >introducing at least 2x the number of pages, and on a future scan wil=
l
> >> >satisfy the promotion condition once again. This issue is prevented v=
ia
> >> >the collapse_max_ptes_none() function which imposes the max_ptes_none
> >> >restrictions above.
> >> >
> >> >We currently only support mTHP collapse for max_ptes_none values of 0
> >> >and HPAGE_PMD_NR - 1. resulting in the following behavior:
> >> >
> >> >    - max_ptes_none=3D0: Never introduce new empty pages during colla=
pse
> >> >    - max_ptes_none=3DHPAGE_PMD_NR-1: Always try collapse to the high=
est
> >> >      available mTHP order
> >> >
> >> >Any other max_ptes_none value will emit a warning and skip mTHP colla=
pse
> >> >attempts. There should be no behavior change for PMD collapse.
> >> >
> >> >Once we determine what mTHP sizes fits best in that PMD range a colla=
pse
> >> >is attempted. A minimum collapse order of 2 is used as this is the lo=
west
> >> >order supported by anon memory as defined by THP_ORDERS_ALL_ANON.
> >> >
> >> >Currently madv_collapse is not supported and will only attempt PMD
> >> >collapse.
> >> >
> >> >We can also remove the check for is_khugepaged inside the PMD scan as
> >> >the collapse_max_ptes_none() function handles this logic now.
> >> >
> >> >Signed-off-by: Nico Pache <npache@redhat.com>
> >>
> >> [...]
> >>
> >> >+static int mthp_collapse(struct mm_struct *mm, unsigned long address=
,
> >> >+              int referenced, int unmapped, struct collapse_control =
*cc,
> >> >+              unsigned long enabled_orders)
> >> >+{
> >> >+      unsigned int nr_occupied_ptes, nr_ptes;
> >> >+      int max_ptes_none, collapsed =3D 0, stack_size =3D 0;
> >> >+      unsigned long collapse_address;
> >> >+      struct mthp_range range;
> >> >+      u16 offset;
> >> >+      u8 order;
> >> >+
> >> >+      collapse_mthp_stack_push(cc, &stack_size, 0, HPAGE_PMD_ORDER);
> >> >+
> >> >+      while (stack_size) {
> >> >+              range =3D collapse_mthp_stack_pop(cc, &stack_size);
> >> >+              order =3D range.order;
> >> >+              offset =3D range.offset;
> >> >+              nr_ptes =3D 1UL << order;
> >> >+
> >> >+              if (!test_bit(order, &enabled_orders))
> >> >+                      goto next_order;
> >> >+
> >> >+              max_ptes_none =3D collapse_max_ptes_none(cc, NULL, ord=
er);
> >>
> >> I am thinking whether there is a behavioral change for userfaultfd_arm=
ed(vma).
> >>
> >> collapse_single_pmd()
> >>     collapse_scan_pmd
> >>         max_ptes_none =3D collapse_max_ptes_none(cc, vma)
> >>         max_ptes_none =3D KHUGEPAGED_MAX_PTES_LIMIT                ---=
 (1)
> >>         mthp_collapse
> >>             max_ptes_none =3D collapse_max_ptes_none(cc, NULL)     ---=
 (2)
> >>             collapse_huge_page(mm)
> >>                 hugepage_vma_revalidate(&vma)
> >>                 __collapse_huge_page_isolate(vma)
> >>                     max_ptes_none =3D collapse_max_ptes_none(cc, vma)
> >>
> >> Before mthp_collapse() introduced, userfaultfd_armed(vma) is skipped i=
f there
> >> is any pte_none_or_zero() in collapse_scan_pmd().
> >>
> >> But now, max_ptes_none could be set to KHUGEPAGED_MAX_PTES_LIMIT at (1=
), so
> >> that we can scan all the pte to get the bitmap. This means
> >> userfaultfd_armed(vma) could continue even with pte_none_or_zero().
> >>
> >> Then in mthp_collapse(), collapse_max_ptes_none() at (2) ignores
> >> userfaultfd_armed(vma), which means it will continue to collapse a
> >> userfaultfd_armed(vma) when there is pte_none_or_zero().
> >>
> >> The good news is we will stop at __collapse_huge_page_isolate(), where=
 we
> >> get collapse_max_ptes_none() with vma. But we already did a lot of wor=
k.
> >
> >Good catch!
> >
> >As you stated we eventually ensure we respect the uffd checks. So
> >there are no correctness issues, just the potential for wasted cycles.
> >
> >At (1) we only do this if mTHPs are enabled. If that is the case, the
> >only waste that can arise is at the PMD order, as that order respects
> >the max_ptes_none value.
> >
> >I think one approach is to gate (1) with the uffd check as well. That
> >way, if mTHPs are enabled and its uffd-armed, max_ptes_none will stay
> >at 0, and we bail early on the scan early if any none_ptes are hit.
> >
> >But then we lose the ability to collapse to mTHPs that are uffd-armed,
> >where the PMD has none/zero-ptes and the mTHP fully has 0
> >non-none/zero-ptes.
> >
> >ie) assume a PMD is 16 x's [xxxxxxxx00000000]
> >where x is a populated pte and 0 is not
> >If we guard this scan (1), then we will never check if its possible to
> >collapse to the smaller orders.
> >
> >Let me know if you see a flaw in my logic, I think it's best to keep it =
as is?
> >
>
> Yes, gate it at (1) is not a proper place.
>
> I am thinking whether we could pass vma to (2)? So that we could respect
> uffd-armed?

Ok, sorry I never replied but i did implement it at (2). Sashiko
brought up a good point that this can result in a UAF; I verified
that. I'm going to send a fixup to the v18 to undo the change.

I added this to my todo list, and will look into optimizing/finding a
solution for this in a future series. The good thing is, as you stated
earlier, this can result in some wasted work, but it is not logically
incorrect overall.

Cheers,
-- Nico

>
> >>
> >> Not sure if I missed something.
> >>
> >> >+
> >> >+              if (max_ptes_none < 0)
> >> >+                      return collapsed;
> >> >+
> >> >+              nr_occupied_ptes =3D collapse_mthp_count_present(cc, o=
ffset,
> >> >+                                                             nr_ptes=
);
> >> >+
> >> >+              if (nr_occupied_ptes >=3D nr_ptes - max_ptes_none) {
> >> >+                      int ret;
> >> >+
> >> >+                      collapse_address =3D address + offset * PAGE_S=
IZE;
> >> >+                      ret =3D collapse_huge_page(mm, collapse_addres=
s, referenced,
> >> >+                                               unmapped, cc, order);
> >> >+                      if (ret =3D=3D SCAN_SUCCEED) {
> >> >+                              collapsed +=3D nr_ptes;
> >> >+                              continue;
> >> >+                      }
> >> >+              }
> >> >+
> >> >+next_order:
> >> >+              if (order > KHUGEPAGED_MIN_MTHP_ORDER) {
> >> >+                      const u8 next_order =3D order - 1;
> >> >+                      const u16 mid_offset =3D offset + (nr_ptes / 2=
);
> >> >+
> >> >+                      collapse_mthp_stack_push(cc, &stack_size, mid_=
offset,
> >> >+                                               next_order);
> >> >+                      collapse_mthp_stack_push(cc, &stack_size, offs=
et,
> >> >+                                               next_order);
> >> >+              }
> >> >+      }
> >> >+      return collapsed;
> >> >+}
> >> >+
> >> > static enum scan_result collapse_scan_pmd(struct mm_struct *mm,
> >> >               struct vm_area_struct *vma, unsigned long start_addr,
> >> >               bool *lock_dropped, struct collapse_control *cc)
> >> > {
> >> >-      const int max_ptes_none =3D collapse_max_ptes_none(cc, vma, HP=
AGE_PMD_ORDER);
> >> >+      int max_ptes_none =3D collapse_max_ptes_none(cc, vma, HPAGE_PM=
D_ORDER);
> >> >       const unsigned int max_ptes_shared =3D collapse_max_ptes_share=
d(cc, HPAGE_PMD_ORDER);
> >> >       const unsigned int max_ptes_swap =3D collapse_max_ptes_swap(cc=
, HPAGE_PMD_ORDER);
> >> >+      enum tva_type tva_flags =3D cc->is_khugepaged ? TVA_KHUGEPAGED=
 : TVA_FORCED_COLLAPSE;
> >> >       pmd_t *pmd;
> >> >-      pte_t *pte, *_pte;
> >> >-      int none_or_zero =3D 0, shared =3D 0, referenced =3D 0;
> >> >+      pte_t *pte, *_pte, pteval;
> >> >+      int i;
> >> >+      int none_or_zero =3D 0, shared =3D 0, nr_collapsed =3D 0, refe=
renced =3D 0;
> >> >       enum scan_result result =3D SCAN_FAIL;
> >> >       struct page *page =3D NULL;
> >> >       struct folio *folio =3D NULL;
> >> >       unsigned long addr;
> >> >+      unsigned long enabled_orders;
> >> >       spinlock_t *ptl;
> >> >       int node =3D NUMA_NO_NODE, unmapped =3D 0;
> >> >
> >> >@@ -1429,8 +1579,19 @@ static enum scan_result collapse_scan_pmd(stru=
ct mm_struct *mm,
> >> >               goto out;
> >> >       }
> >> >
> >> >+      bitmap_zero(cc->mthp_bitmap, MAX_PTRS_PER_PTE);
> >> >       memset(cc->node_load, 0, sizeof(cc->node_load));
> >> >       nodes_clear(cc->alloc_nmask);
> >> >+
> >> >+      enabled_orders =3D collapse_allowable_orders(vma, vma->vm_flag=
s, tva_flags);
> >>
> >> Would it be 0 at this point?
> >
> >If your question relates to the issue you brought up above, then yes,
> >max_ptes_none would be 0 if it's uffd-armed. We must recheck the
> >uffd-armed status before modifying it to 511.
> >
> >>
> >> >+
> >> >+      /*
> >> >+       * If PMD is the only enabled order, enforce max_ptes_none, ot=
herwise
> >> >+       * scan all pages to populate the bitmap for mTHP collapse.
> >> >+       */
> >> >+      if (enabled_orders !=3D BIT(HPAGE_PMD_ORDER))
> >> >+              max_ptes_none =3D KHUGEPAGED_MAX_PTES_LIMIT;
> >> >+
> >> >       pte =3D pte_offset_map_lock(mm, pmd, start_addr, &ptl);
> >> >       if (!pte) {
> >> >               cc->progress++;
> >> >@@ -1438,11 +1599,13 @@ static enum scan_result collapse_scan_pmd(str=
uct mm_struct *mm,
> >> >               goto out;
> >> >       }
> >> >
> >> >-      for (addr =3D start_addr, _pte =3D pte; _pte < pte + HPAGE_PMD=
_NR;
> >> >-           _pte++, addr +=3D PAGE_SIZE) {
> >> >+      for (i =3D 0; i < HPAGE_PMD_NR; i++) {
> >> >+              _pte =3D pte + i;
> >> >+              addr =3D start_addr + i * PAGE_SIZE;
> >> >+              pteval =3D ptep_get(_pte);
> >> >+
> >> >               cc->progress++;
> >> >
> >> >-              pte_t pteval =3D ptep_get(_pte);
> >> >               if (pte_none_or_zero(pteval)) {
> >> >                       if (++none_or_zero > max_ptes_none) {
> >> >                               result =3D SCAN_EXCEED_NONE_PTE;
> >> >@@ -1522,6 +1685,8 @@ static enum scan_result collapse_scan_pmd(struc=
t mm_struct *mm,
> >> >                       }
> >> >               }
> >> >
> >> >+              /* Set bit for occupied pages */
> >> >+              __set_bit(i, cc->mthp_bitmap);
> >> >               /*
> >> >                * Record which node the original page is from and sav=
e this
> >> >                * information to cc->node_load[].
> >> >@@ -1580,10 +1745,11 @@ static enum scan_result collapse_scan_pmd(str=
uct mm_struct *mm,
> >> >       if (result =3D=3D SCAN_SUCCEED) {
> >> >               /* collapse_huge_page expects the lock to be dropped b=
efore calling */
> >> >               mmap_read_unlock(mm);
> >> >-              result =3D collapse_huge_page(mm, start_addr, referenc=
ed,
> >> >-                                          unmapped, cc, HPAGE_PMD_OR=
DER);
> >> >+              nr_collapsed =3D mthp_collapse(mm, start_addr, referen=
ced, unmapped,
> >> >+                                            cc, enabled_orders);
> >> >               /* collapse_huge_page will return with the mmap_lock r=
eleased */
> >>
> >> collapse_huge_page will return with mmap_lock released, but mthp_colla=
pse()
> >> may not?
> >
> >We are now releasing the lock before calling mthp_collapse, which
> >subsequently calls collapse_huge_page. Even if `collapse_huge_page` is
> >never called-- say, because enabled_orders is 0 (which should not
> >happen) and all collapse orders are skipped (never calling
> >collapse_huge_page)-- we still return here with the lock dropped.
> >
> >I think this is sound. Let me know if you think differently.
> >
>
> You are right. I missed the lock is released in previous patch.
>
> >Cheers :)
> >-- Nico
> >
> >>
> >> >               *lock_dropped =3D true;
> >> >+              result =3D nr_collapsed ? SCAN_SUCCEED : SCAN_FAIL;
> >> >       }
> >> > out:
> >> >       trace_mm_khugepaged_scan_pmd(mm, folio, referenced,
> >> >--
> >> >2.54.0
> >>
> >> --
> >> Wei Yang
> >> Help you, Help me
> >>
>
> --
> Wei Yang
> Help you, Help me
>

