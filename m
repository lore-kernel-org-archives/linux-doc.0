Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79EC631F99D
	for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 19:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779217494; cv=pass; b=IhbEu2s768oi7Rlk9JTLKySngDw6dQ+0/X92C0o5gv4vHhioeIqNFM2qutDgmkok/OtwlRziz0azlkXi8OqgwscGXUVfu4hoot8+QEksegIujgsEJP4QlALb07Ort4XccWrtl+DHeIHvIOLE1hqQtIs0JUAsDVtePv/QGqGYVvg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779217494; c=relaxed/simple;
	bh=QfTtzYfmqDmMMMUFFZFVVPoFFhsAn1eLD8s+N4VERkY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vw2O7MbiAoocFWoGW4GJKa6kwwliXCs15EpBoJwUTV/y3oCNo7MIAGYZEVOKmU79r2rEzNBH6gzaG/OZvtmDzFV6aqyRcm5Ey33T5R2PgMX7RFaUYm9V+/I2MEOfjiXVp1L4B0hJnmgPnJ5N3U66SlNOhv1BFkbIw2tdfEBkO+8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Z7/eRn3c; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=DxdadXoK; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Z7/eRn3c";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="DxdadXoK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779217490;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EdK8pqH2D0m9mcbmDtYLUTUETzL6tUWdDDlDwj+C1AA=;
	b=Z7/eRn3chMMxVNwmXIAM4g0kPRRT73uNirZIvbp3snXF1nczaCpy1RGE4n87feOXrnxNE8
	OMv3VBU3gjeFijUY4MbH2OafBiif1v43sIT0hsCe83AyoNHgPNYcs8uqNVa6hQMhmyxepo
	lerM6U6q6SXlvrjT84+F9W5+vir0yxw=
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com
 [74.125.224.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-644-EY59EcdbO-qhmWDlkO5Q7Q-1; Tue, 19 May 2026 15:04:48 -0400
X-MC-Unique: EY59EcdbO-qhmWDlkO5Q7Q-1
X-Mimecast-MFC-AGG-ID: EY59EcdbO-qhmWDlkO5Q7Q_1779217488
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-65c67faba33so7673603d50.3
        for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 12:04:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779217488; cv=none;
        d=google.com; s=arc-20240605;
        b=VjWxEFkoddQ9mLdmwNlpbA2YGmq5EBLlFfTLzvZ5kRfVjToRwKQCYQqtFaO1WY0fkV
         9fiBgk0HR/7K7c/ac3Rn6X96oopgQePuQsKARTA5RSQlGkyzk1LXypmrb7UIVhj7aRQf
         NG7Bs0cmDEDhEgzBW7/D6U/LWR+o6h726OT4lTRAgwCMqgOzxam88wTUvxSN7k+mvMd8
         FN12gZSx888AUPuJYd4K+QKFJxAP6UB3yPZ2gLTCzf8IYdan/nx+s8w72fbDUjWtlnSZ
         qThpdAHyQfPk39CHLzJUfeNfwuU8MyKw/TaU/ZoJ2XFTEqJjjSJkOdrOouQmWt1r2DeU
         w5EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EdK8pqH2D0m9mcbmDtYLUTUETzL6tUWdDDlDwj+C1AA=;
        fh=BD8kRyHqZam/dLJiKy4ucjKZ9Dkmp26bLPZD2AmBu2Y=;
        b=aMQAw033dinLOq4Tz15EyUfhwZNkLF+Szy1tdYLov6fLGuCokPX0veucojeLP+mKJA
         jR0mbYherzcGAdo0YnCCGuRycBBszm1Qg3qExxGaXwCyNKVUuzkExpciis1mmuXIAjAY
         GetYzPmpTavb3fjsLK43r8BNgd4SsGiu0Z5vVg9V2G/xKU1SVMfXUlt1ZLRaqs4ozqcI
         Ma4skIArHXUBRYu1c0ObjUX4j0TcFUEdI5WoM4Bups6LDuPKF/TLxeEpuZ03hkANZwzv
         TL2+tkQoc2FBiz2ZBY0R8GZA1GmgCJGgjttQBFskPVctiEQzSXh8U4McXwghhMnenkx4
         QOgg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1779217488; x=1779822288; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EdK8pqH2D0m9mcbmDtYLUTUETzL6tUWdDDlDwj+C1AA=;
        b=DxdadXoKkXbQFLkkhVBlzDi0oAAKq6/8jlTULGBu18tu5VW8kyLXs1k5ZVXIqnwFZl
         zmeN3HTGHFBubCCfSfrpytyN3WLcBpiGqSPQZ3symm56maA9Ap/VtjH4ZGNaku3qagu/
         WctkmOLlhFK506qbSZJhz1SObz7VeBbeggigL2UJxO62RqZRCLcFZttu9eA6qSUaBbNq
         DKMQm4kTHurBR3frgWlktQ648GDsBkPtVnt3APASuq0ENZmuzRfPUIYNMKfF2xlX3/H7
         06qEbL/E+UkFTpe2fIVGT+x0V4lAG1DZMziTNM2ZIZ441+60XmKUvm2DzyTIL2zqsErM
         GjZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779217488; x=1779822288;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EdK8pqH2D0m9mcbmDtYLUTUETzL6tUWdDDlDwj+C1AA=;
        b=e7mcKnB9phbEp04hXjAqU5qZnTjriSPw1BqJu4G8cpdiDE3WBEvvGgHNKQKexFS/Om
         Kfezuoavr/AUOlIrSz35CACA8lQaUP9OBKnwOlBcbR+9QSzfW2III7Gt5C3Q3aqpQJMZ
         dIHKtEcydbp+L4drn54mch3ak43H+UToz5uXV959sX9H+Y/Xs+C4eKfwdiHXz2IQWDt3
         CGWRtfCeuB52D2SpYjjn5T47RxKc6wICLOxXwq1204vVNlYIAkpG8QCxfD/CRDDhBspL
         I2yfEL2LnAiAh95xKSwBBnyznr7txBWhwl/k5uulWIZ5tvA+Fb3ZfYI7h25s00HcgjC2
         N39w==
X-Gm-Message-State: AOJu0Yz8Oam69syHZvPHi43HLC8xaCYQrzyWR40vHLzPMrpv7BsQGc6C
	xpR8hIaQ5+Hybzjz63H9IIAKIcRGBgsSL9ZarTdvLZn5r4UtVxHmZnyqaJkeiDdiRtVN7NJXVUA
	vh/wQFrr3yNlMNIO2h/uKkhVsFk4kTYjyU6j+OkYbFX9Kd8r37cWi1qNsk4u6fRyzDScycpPaDw
	rgfDqhvZRtv6K3+TctW3LWlOpirhlWYRIWSi+L
X-Gm-Gg: Acq92OH3Z0PV7S30z5oFwSgV4QtMRmvf/bzlmUb/6/PDIfxOu+7RO5X7R/xhYvSURNZ
	Hw/DwaMylWZFwHt2OF5Lu2xHJumCqfYLJUzg1PSjGoXgvzWvhqZcJ/VabS6KzIL6Ijra+E0B6uA
	j6GaeGzBv590kMelXaILyq20G7Xuxre+Etqb4IrGDT4IG5Sm8lvjOvpfKaZaChNOimBPmTCthLu
	LTEAQ==
X-Received: by 2002:a05:690e:2501:10b0:65c:47ad:26bf with SMTP id 956f58d0204a3-65e2273392cmr16423689d50.26.1779217487455;
        Tue, 19 May 2026 12:04:47 -0700 (PDT)
X-Received: by 2002:a05:690e:2501:10b0:65c:47ad:26bf with SMTP id
 956f58d0204a3-65e2273392cmr16423607d50.26.1779217486858; Tue, 19 May 2026
 12:04:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511185817.686831-5-npache@redhat.com> <20260512074202.10253-1-lance.yang@linux.dev>
 <20260514031009.f66cgop3ctgiqxz3@master> <9b33339e-157a-45b7-942e-3be3418a5142@kernel.org>
 <agtpK1x27B-E7mMo@lucifer>
In-Reply-To: <agtpK1x27B-E7mMo@lucifer>
From: Nico Pache <npache@redhat.com>
Date: Tue, 19 May 2026 13:05:13 -0600
X-Gm-Features: AVHnY4LuRYw_wlCmtpeGYvsNgJpUKgBu0LIIMlaqigtwM5P2pHzw9Gmm6LpfRD0
Message-ID: <CAA1CXcCNT51jeXh6Kwg1QN9e+AJB-1hg21kmeY6fTTKr2GACug@mail.gmail.com>
Subject: Re: [PATCH mm-unstable v17 04/14] mm/khugepaged: generalize
 __collapse_huge_page_* for mTHP support
To: Lorenzo Stoakes <ljs@kernel.org>, "David Hildenbrand (Arm)" <david@kernel.org>, 
	Wei Yang <richard.weiyang@gmail.com>, Lance Yang <lance.yang@linux.dev>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-trace-kernel@vger.kernel.org, aarcange@redhat.com, 
	akpm@linux-foundation.org, anshuman.khandual@arm.com, apopple@nvidia.com, 
	baohua@kernel.org, baolin.wang@linux.alibaba.com, byungchul@sk.com, 
	catalin.marinas@arm.com, cl@gentwo.org, corbet@lwn.net, 
	dave.hansen@linux.intel.com, dev.jain@arm.com, gourry@gourry.net, 
	hannes@cmpxchg.org, hughd@google.com, jack@suse.cz, jackmanb@google.com, 
	jannh@google.com, jglisse@google.com, joshua.hahnjy@gmail.com, kas@kernel.org, 
	liam@infradead.org, mathieu.desnoyers@efficios.com, matthew.brost@intel.com, 
	mhiramat@kernel.org, mhocko@suse.com, peterx@redhat.com, pfalcato@suse.de, 
	rakie.kim@sk.com, raquini@redhat.com, rdunlap@infradead.org, 
	rientjes@google.com, rostedt@goodmis.org, rppt@kernel.org, 
	ryan.roberts@arm.com, shivankg@amd.com, sunnanyong@huawei.com, 
	surenb@google.com, thomas.hellstrom@linux.intel.com, tiwai@suse.de, 
	usamaarif642@gmail.com, vbabka@suse.cz, vishal.moola@gmail.com, 
	wangkefeng.wang@huawei.com, will@kernel.org, willy@infradead.org, 
	yang@os.amperecomputing.com, ying.huang@linux.alibaba.com, ziy@nvidia.com, 
	zokeefe@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 18, 2026 at 1:33=E2=80=AFPM Lorenzo Stoakes <ljs@kernel.org> wr=
ote:
>
> On Mon, May 18, 2026 at 03:16:11PM +0200, David Hildenbrand (Arm) wrote:
> > On 5/14/26 05:10, Wei Yang wrote:
> > > On Tue, May 12, 2026 at 03:42:02PM +0800, Lance Yang wrote:
> > >>
> > >> On Mon, May 11, 2026 at 12:58:04PM -0600, Nico Pache wrote:
> > >>> generalize the order of the __collapse_huge_page_* and collapse_max=
_*
> > >>> functions to support future mTHP collapse.
> > >>>
> > >>> The current mechanism for determining collapse with the
> > >>> khugepaged_max_ptes_none value is not designed with mTHP in mind. T=
his
> > >>> raises a key design issue: if we support user defined max_pte_none =
values
> > >>> (even those scaled by order), a collapse of a lower order can intro=
duces
> > >>> an feedback loop, or "creep", when max_ptes_none is set to a value =
greater
> > >>> than HPAGE_PMD_NR / 2. [1]
> > >>>
> > >>> With this configuration, a successful collapse to order N will popu=
late
> > >>> enough pages to satisfy the collapse condition on order N+1 on the =
next
> > >>> scan. This leads to unnecessary work and memory churn.
> > >>>
> > >>> To fix this issue introduce a helper function that will limit mTHP
> > >>> collapse support to two max_ptes_none values, 0 and HPAGE_PMD_NR - =
1.
> > >>> This effectively supports two modes: [2]
> > >>>
> > >>> - max_ptes_none=3D0: never collapses if it encounters an empty PTE =
or a PTE
> > >>>  that maps the shared zeropage. Consequently, no memory bloat.
> > >>> - max_ptes_none=3D511 (on 4k pagesz): Always collapse to the highes=
t
> > >>>  available mTHP order.
> > >>>
> > >>> This removes the possiblilty of "creep", while not modifying any uA=
PI
> > >>> expectations. A warning will be emitted if any non-supported
> > >>> max_ptes_none value is configured with mTHP enabled.
> > >>>
> > >>> mTHP collapse will not honor the khugepaged_max_ptes_shared or
> > >>> khugepaged_max_ptes_swap parameters, and will fail if it encounters=
 a
> > >>> shared or swapped entry.
> > >>>
> > >>> No functional changes in this patch; however it defines future beha=
vior
> > >>> for mTHP collapse.
> > >>>
> > >>> [1] - https://lore.kernel.org/all/e46ab3ab-a3d7-4fb7-9970-d0704bd5d=
05a@arm.com
> > >>> [2] - https://lore.kernel.org/all/37375ace-5601-4d6c-9dac-d1c826869=
8e9@redhat.com
> > >>>
> > >>> Co-developed-by: Dev Jain <dev.jain@arm.com>
> > >>> Signed-off-by: Dev Jain <dev.jain@arm.com>
> > >>> Signed-off-by: Nico Pache <npache@redhat.com>
> > >>> ---
> > >>> include/trace/events/huge_memory.h |   3 +-
> > >>> mm/khugepaged.c                    | 117 ++++++++++++++++++++------=
---
> > >>> 2 files changed, 85 insertions(+), 35 deletions(-)
> > >>>
> > >>> diff --git a/include/trace/events/huge_memory.h b/include/trace/eve=
nts/huge_memory.h
> > >>> index bcdc57eea270..443e0bd13fdb 100644
> > >>> --- a/include/trace/events/huge_memory.h
> > >>> +++ b/include/trace/events/huge_memory.h
> > >>> @@ -39,7 +39,8 @@
> > >>>   EM( SCAN_STORE_FAILED,          "store_failed")                 \
> > >>>   EM( SCAN_COPY_MC,               "copy_poisoned_page")           \
> > >>>   EM( SCAN_PAGE_FILLED,           "page_filled")                  \
> > >>> - EMe(SCAN_PAGE_DIRTY_OR_WRITEBACK, "page_dirty_or_writeback")
> > >>> + EM(SCAN_PAGE_DIRTY_OR_WRITEBACK, "page_dirty_or_writeback")     \
> > >>> + EMe(SCAN_INVALID_PTES_NONE,     "invalid_ptes_none")
> > >>>
> > >>> #undef EM
> > >>> #undef EMe
> > >>> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> > >>> index f68853b3caa7..27465161fa6d 100644
> > >>> --- a/mm/khugepaged.c
> > >>> +++ b/mm/khugepaged.c
> > >>> @@ -61,6 +61,7 @@ enum scan_result {
> > >>>   SCAN_COPY_MC,
> > >>>   SCAN_PAGE_FILLED,
> > >>>   SCAN_PAGE_DIRTY_OR_WRITEBACK,
> > >>> + SCAN_INVALID_PTES_NONE,
> > >>> };
> > >>>
> > >>> #define CREATE_TRACE_POINTS
> > >>> @@ -353,37 +354,60 @@ static bool pte_none_or_zero(pte_t pte)
> > >>>  * PTEs for the given collapse operation.
> > >>>  * @cc: The collapse control struct
> > >>>  * @vma: The vma to check for userfaultfd
> > >>> + * @order: The folio order being collapsed to
> > >>>  *
> > >>>  * Return: Maximum number of none-page or zero-page PTEs allowed fo=
r the
> > >>>  * collapse operation.
> > >>>  */
> > >>> -static unsigned int collapse_max_ptes_none(struct collapse_control=
 *cc,
> > >>> -         struct vm_area_struct *vma)
> > >>> +static int collapse_max_ptes_none(struct collapse_control *cc,
> > >>> +         struct vm_area_struct *vma, unsigned int order)
> > >>> {
> > >>> + unsigned int max_ptes_none =3D khugepaged_max_ptes_none;
> > >>>   // If the vma is userfaultfd-armed, allow no none-page or zero-pa=
ge PTEs.
> > >>
> > >> One thing I still want to call out: kernel code usually uses C-style
> > >> comments :)
> > >>
> > >>>   if (vma && userfaultfd_armed(vma))
> > >>>           return 0;
> > >>>   // for MADV_COLLAPSE, allow any none-page or zero-page PTEs.
> > >>>   if (!cc->is_khugepaged)
> > >>>           return HPAGE_PMD_NR;
> > >>> - // For all other cases repect the user defined maximum.
> > >>> - return khugepaged_max_ptes_none;
> > >>> + // for PMD collapse, respect the user defined maximum.
> > >>> + if (is_pmd_order(order))
> > >>> +         return max_ptes_none;
> > >>> + /* Zero/non-present collapse disabled. */
> > >>> + if (!max_ptes_none)
> > >>> +         return 0;
> > >>> + // for mTHP collapse with the sysctl value set to KHUGEPAGED_MAX_=
PTES_LIMIT,
> > >>> + // scale the maximum number of PTEs to the order of the collapse.
> > >>> + if (max_ptes_none =3D=3D KHUGEPAGED_MAX_PTES_LIMIT)
> > >>> +         return (1 << order) - 1;
> > >>> +
> > >>> + // We currently only support max_ptes_none values of 0 or KHUGEPA=
GED_MAX_PTES_LIMIT.
> > >>> + // Emit a warning and return -EINVAL.
> > >>> + pr_warn_once("mTHP collapse only supports max_ptes_none values of=
 0 or %u\n",
> > >>> +               KHUGEPAGED_MAX_PTES_LIMIT);
> > >>
> > >> Maybe fallback to 0 instead, as David suggested earlier?
> > >>
> > >
> > > It looks reasonable to fallback to 0.
> > >
> > > But as the updated Document says in patch 14:
> > >
> > >   For mTHP collapse, only 0 or (HPAGE_PMD_NR - 1) are supported. Any =
other
> > >   value will emit a warning and no mTHP collapse will be attempted.
> > >
> > > This is why it does like this now.
> > >
> > >     mthp_collapse()
> > >         max_ptes_none =3D collapse_max_ptes_none();
> > >         if (max_ptes_none < 0)
> > >             return collapsed;
> > >
> > >> max_ptes_none is mostly legacy PMD THP behavior. mTHP is new, and an=
y
> > >> intermediate value in (0, KHUGEPAGED_MAX_PTES_LIMIT) would implicitl=
y
> > >> disable it :(
> > >>
> > >
> > > So it depends on what we want to do here :-)
> > >
> > > For me, I would vote for fallback to 0.
> >
> > At this point I'll prefer to not return errors from collapse_max_ptes_n=
one().
> > It's just rather awkward to return an error deep down in collapse code =
for a
> > configuration problem.
> >
> > For mthp collapse, we only support max_ptes_none=3D=3D0 and
> > max_ptes_none=3D=3D"HPAGE_PMD_NR - 1" (default).
> >
> > If another value is specified while collapsing mTHP, print a warning an=
d treat
> > it as 0 (save value, no creep, no memory waste).
> >
> > In a sense, this is similar to how we handle max_ptes_shared + max_ptes=
_swap:
> > for mTHP: we always treat them as being 0 for mTHP collapse (and don't =
issue a
> > warning, because we would issue a warning with the default settings).
> >
> > @Lorenzo, fine with you?
>
> Yes 100%, this sounds sensible both in terms of the error and the default=
. Let's
> keep our lives simple(-ish) please :)

Ok thank you im glad we finally came to consensus on this! phew!

>
> >
> > --
> > Cheers,
> >
> > David
>
> Cheers, Lorenzo
>

