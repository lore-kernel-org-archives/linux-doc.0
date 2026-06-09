Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C14390223
	for <linux-doc@vger.kernel.org>; Tue,  9 Jun 2026 09:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780997504; cv=pass; b=MaPiOhZ6KAyx33yQnerZ59pJQ8WRFWfTq7zMKkKGjSRazRcR6TtxRlfg58W8494SACeP6VQDs7xHwkXgZ5cDX9gnehpF6aW7tMqNVGZAellHzTNNBDqB3Xtl2hk0v+G9rOXiKvTHMYbkY8Y+gN35wp15T2bsf75owkrUNutu+/Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780997504; c=relaxed/simple;
	bh=Cwau/jZkcWGVugU2u/fXyZ9zAkf/THWESmE7T4IK7oM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F1qg+Y+wxb4qTuybU5+N9Uv/OtQTWYdU5J5E3yX+E3lZI7LT22of4aCNk3PWh4O7ED/Gzxh1Uv+PEbwzFsiwEqTPM0kHSVM8FLFGPywrbpLj0utHTOIaRhGYy/xKA8owvj1AQI7mj11jsbNvryrOb38MwhP5B1UWmanq4g4TIk0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hAyAPAPW; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=fCRNBwmU; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hAyAPAPW";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="fCRNBwmU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780997502;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2iTl0SUAAjGLBMgcBlGMkkP/SoLVtYGQlCb7tbJPhgM=;
	b=hAyAPAPWcPnRb2uw5VhLjRupr5xEBbGkzWiodyZS//OTtmL9hJQtSz+s3i4ZklkG5PTO2o
	gzeHvlUrmnCqPrHBhCca+xtZm+NnaNpjMb194lH1HMAaZ/GbG+rgk7Ug/SQ6JUQ0kdG7G2
	HXAPQj4Oyw21GRz4uQByH/M6JjTjN1k=
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com
 [74.125.224.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-204-LlT4RiqoMral9gbguRCPWw-1; Tue, 09 Jun 2026 05:31:41 -0400
X-MC-Unique: LlT4RiqoMral9gbguRCPWw-1
X-Mimecast-MFC-AGG-ID: LlT4RiqoMral9gbguRCPWw_1780997500
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-660668ea5cdso3383495d50.0
        for <linux-doc@vger.kernel.org>; Tue, 09 Jun 2026 02:31:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780997500; cv=none;
        d=google.com; s=arc-20240605;
        b=JEc7gTcnbUsNllpNidRKe4LQFbsjXw4UIEvgNUBkh1jKTxxy/d5ep5hw5xhAm3Of9p
         cXrrd03pIAxOsmrg40B6xqPddBPYatkHRxpDxK9ak7RdSZsKvgVF216oGDDxa+B3KATM
         2LR8HKWCfKgyO2EDqQBMM94UjfPd+tYozd85nKVnIn7/8d3AFYwWcmB1BJaWuBWoMbIk
         kDAxS5/zG+ppWmM8NDOqGSTQjcanxvS69F5iaj0SsGlnbvxNNZBnoosihv3EYbCLp8a+
         fjLf+51d/mEUgrPS66xyE80eFzpfB/vJzHe6L7CD0qFjaml1RxnMpGNuPkqzfamR8Bjh
         RXHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2iTl0SUAAjGLBMgcBlGMkkP/SoLVtYGQlCb7tbJPhgM=;
        fh=WFHxidUoE8J4+fctFHUGH0WHn+tvGRxgoNkVlvaZuvg=;
        b=IevWxs3o6jwhjDr32qz5qLPJHCoqzB8V+z+VkUGzBXjeGQ5db+FwH3FzhpJRPbErd+
         ohwsPgrDVwdBAHDaiJSu5FCQHTtmHLgktIQxO3zucVKTd+suJd1l555DCZdowGIf3B+W
         dC0LGEH3Bd3PHujWfurVmgiv7wcPqoTENT9KrFZwL4E4V/DUv32lJddO26X+0pJNjpLE
         xsPodfKQjI2VXiUGnaCT80IL2NGaj0ISCDyQ3F7IUse69N7VflQg+7Tg05axf+3KH2G0
         JcPA67dct/NFls9mMrm1zgFcboqA20M+9JVWCym/DStnNj3S94Yp3F/6oeGUj5zJn2fq
         u24Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1780997500; x=1781602300; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2iTl0SUAAjGLBMgcBlGMkkP/SoLVtYGQlCb7tbJPhgM=;
        b=fCRNBwmUd7jToTXJF51i1urZQ2IFnXMlUZHk7g1rc91llf6FQPNUTLUP1+0vN71MOh
         D+qhkNyCBMJbdgQlwGkVrqLUPYqaPNN1fu68gBi01TDRB77IQ0sAAulaQSh4AWL5IJns
         VkpgXCpqZ5oeJV34+0hj+UE1jsoSdVLjqxF4/vq57fdGgg1v22wyf2cqCYQehENXHCX7
         tvbeMt6CwvTmZkCkjpP7hMLzeLQtedLxXYHLspdYZhoRDyWGLq3IRqrPF0YcNxuWiZlm
         7Z6edoATVJb8V0RwXibHBWWR/EOZojge770lOWtJ9b20ne5tNy39X1MsWMpP0mdOL0dV
         059g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780997500; x=1781602300;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2iTl0SUAAjGLBMgcBlGMkkP/SoLVtYGQlCb7tbJPhgM=;
        b=Oj9wa1q1ue6MDEZx3ijQ/7JKblx4XJVKtvELi2gkqqTCl0EKvXEAFzL2nsp0r7mVKf
         3gre9w8TwhghIgDF79+gbv3d29L9neud5APUoBGpnCEkRKh+rKNLVMepXYC25+l2H4Yn
         v1ET8poQ3HOZxaMAoyCnSXgPkipVIr+AVPzPSNMihQD2E7w2MOKBK6bPAw8L2c5iz+uk
         S3yI7tv3QglTs7XQ3TxWop1L7yfgFqncRcHbPFTCRaEBVsk33aJM4vAE9YmZtSME4Hv6
         f3OTs+jWfa6fb/SDAPCXJZV2HLk4CsR9rj0EeGJpwvcEs21F1jDTo3AtY1xZvNdjbdOu
         fPRg==
X-Forwarded-Encrypted: i=1; AFNElJ8j9114yT1ysB6aOWLwo71JFlyhswGyql96P6fyD1oz7DK5PNrBPSjWye8DuR5cNLwD5KSqU1mPykU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5qcFbHuzuPpsJyAt7n9aMMjx4WAQcr+8O9vXWKECtGL/Kw+9W
	B3HeWAhBKH9ULCJffWogcAvDT91xGanWH2JrlzYr3/FtU82u3sCqqo+Kc87euGoAFmHVCkGIMIV
	puawRe3qTTIu6EIkVbI7TW9JOrX6y9zeraZ/3oCvmrvPism6+gcOyLMJdnaMXT+GCjiGcf1tBEv
	p7reLG9PqwHz7FzKqx8oTNdbidpeL7NAGQRFaK
X-Gm-Gg: Acq92OH/lLwT7QWfOvjkNFfX35J7ZaqfypX5AQsyFmE2Uy38uCSkxtjQWBBASg6FHSp
	9xmdP2oMVr5CCbZFE9VLKSxWXsew3Wa4b+KAmssh/E6lQdIG5Hy7SXZLf0+MesGF7WWe1oZX3cq
	cyGrwcOrj59XcwgPO6JhBnQfcXpvYuCEoaybJuHKIB89f7MwrC4DGcQLPl3SCBHa4x84G4r2KWx
	5C9Zi6JAddZPyC1
X-Received: by 2002:a05:690e:4395:b0:660:6f06:ae6e with SMTP id 956f58d0204a3-661070ce78amr11702498d50.64.1780997500228;
        Tue, 09 Jun 2026 02:31:40 -0700 (PDT)
X-Received: by 2002:a05:690e:4395:b0:660:6f06:ae6e with SMTP id
 956f58d0204a3-661070ce78amr11702475d50.64.1780997499604; Tue, 09 Jun 2026
 02:31:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260605161422.213817-12-npache@redhat.com> <20260606102800.26940-1-lance.yang@linux.dev>
 <2553caae-9e0e-42a7-8b61-d1216f1e81fa@kernel.org> <CAA1CXcBY_2372eJru8VoCq90rUMxn7w23hHou68MmXRv48NRXg@mail.gmail.com>
 <b7fb4184-7a99-42c7-8ee2-4c7fa20827c4@kernel.org>
In-Reply-To: <b7fb4184-7a99-42c7-8ee2-4c7fa20827c4@kernel.org>
From: Nico Pache <npache@redhat.com>
Date: Tue, 9 Jun 2026 03:32:26 -0600
X-Gm-Features: AVVi8Cfncpxkxzck5Whc94MJ57VmWeE0wGEzvVhdZp86lxoGqXC5OmGR9iRBiTY
Message-ID: <CAA1CXcAhw8V+_dYcrqmtZ9ht4Pqz5PPB8EOcDrVCp4DA4y7pLg@mail.gmail.com>
Subject: Re: [PATCH mm-unstable v19 11/14] mm/khugepaged: Introduce mTHP
 collapse support
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Lance Yang <lance.yang@linux.dev>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-trace-kernel@vger.kernel.org, aarcange@redhat.com, 
	akpm@linux-foundation.org, anshuman.khandual@arm.com, apopple@nvidia.com, 
	baohua@kernel.org, baolin.wang@linux.alibaba.com, byungchul@sk.com, 
	catalin.marinas@arm.com, cl@gentwo.org, corbet@lwn.net, 
	dave.hansen@linux.intel.com, dev.jain@arm.com, gourry@gourry.net, 
	hannes@cmpxchg.org, hughd@google.com, jack@suse.cz, jackmanb@google.com, 
	jannh@google.com, jglisse@google.com, joshua.hahnjy@gmail.com, kas@kernel.org, 
	liam@infradead.org, ljs@kernel.org, mathieu.desnoyers@efficios.com, 
	matthew.brost@intel.com, mhiramat@kernel.org, mhocko@suse.com, 
	peterx@redhat.com, pfalcato@suse.de, rakie.kim@sk.com, raquini@redhat.com, 
	rdunlap@infradead.org, richard.weiyang@gmail.com, rientjes@google.com, 
	rostedt@goodmis.org, rppt@kernel.org, ryan.roberts@arm.com, shivankg@amd.com, 
	sunnanyong@huawei.com, surenb@google.com, thomas.hellstrom@linux.intel.com, 
	tiwai@suse.de, usamaarif642@gmail.com, vbabka@suse.cz, vishal.moola@gmail.com, 
	wangkefeng.wang@huawei.com, will@kernel.org, willy@infradead.org, 
	yang@os.amperecomputing.com, ying.huang@linux.alibaba.com, ziy@nvidia.com, 
	zokeefe@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 9, 2026 at 3:26=E2=80=AFAM David Hildenbrand (Arm) <david@kerne=
l.org> wrote:
>
> On 6/9/26 11:06, Nico Pache wrote:
> > On Mon, Jun 8, 2026 at 8:57=E2=80=AFAM David Hildenbrand (Arm) <david@k=
ernel.org> wrote:
> >>
> >> On 6/6/26 12:28, Lance Yang wrote:
> >>>
> >>>
> >>> Looks broken for swap PTEs in PMD collapse ...
> >>>
> >>> collapse_scan_pmd() allows them up to max_ptes_swap and record them i=
n
> >>> unmapped, but they don't get a bit in mthp_present_ptes. And then
> >>> mthp_collapse() does the check above:
> >>
> >> Right. I assumed this is implicitly handled by the optimization in col=
lapse_scan_pmd:
> >>
> >>         if (enabled_orders !=3D BIT(HPAGE_PMD_ORDER))
> >>                 max_ptes_none =3D KHUGEPAGED_MAX_PTES_LIMIT;
> >>
> >> But we perform the check a second time.
> >>
> >>>
> >>> nr_occupied_ptes >=3D nr_ptes - max_ptes_none
> >>>
> >>> So max_ptes_none=3D0 + 511 present PTEs + one allowed swap PTE won't =
even
> >>> call collapse_huge_page() for PMD order.
> >>>
> >>> Shouldn't we account for them in the PMD-order check? Something like:
> >>>
> >>> if (is_pmd_order(order))
> >>>       nr_occupied_ptes +=3D unmapped;
> >
> > This solution seems good for a temporary fixup. but longterm we may
> > want something else. I'm still not sure how we plan on supporting
> > swapin without causing creep. So I'd be ok with adding a fix for
> > legacy PMD behavior until we know how to handle mTHP creep correctly.
> >
> >> As an alternative, we could either 1) skip the check there for
> >> pmd order (as the check was already done); or 2) introduce+maintain
> >> a bitmap that tracks non-present PTEs.
> >>
> >> @@ -1475,7 +1477,9 @@ static enum scan_result mthp_collapse(struct mm_=
struct *mm,
> >>                 nr_occupied_ptes =3D bitmap_weight_from(cc->mthp_prese=
nt_ptes, offset,
> >>                                                       offset + nr_ptes=
);
> >>
> >> -               if (nr_occupied_ptes >=3D nr_ptes - max_ptes_none) {
> >> +               /* Check was already done in the caller. */
> >> +               if (is_pmd_order(order) ||
> >> +                   nr_occupied_ptes >=3D nr_ptes - max_ptes_none) {
> >>                         enum scan_result ret;
> >>
> >>                         collapse_address =3D address + offset * PAGE_S=
IZE;
> >>
> >> 2) would probably be cleanest long-term.
> >
> > That would be best for future swapin support in mTHP, but I still
> > don't think it solves the creep issue.
>
> It wouldn't, we'd simply maintain the state we collect + rely on in separ=
ate
> bitmaps. On swapin, we'd have to update/refresh bitmaps I guess.

Yeah, I'm saying for the future, it obviously solves this issue here
as well, but if we have positional tracking of the swapout, shared,
and none PTEs, I think we can use this to determine whether the
collapse would lead to creep. If we detect creep would happen it may
be best to automatically collapse to the N+1 (or greater) candidate.
Just thinking outloud here.

>
> > Perhaps we could combine the
> > two bitmaps to determine if it would make the future collapse eligible
> > again? Not sure but ill start thinking about it.
> >
> > Should I send a fixup for this using Lance's solution? Or does Lance
> > want to send a patch out with the fixes tag?
>
> If Lance could send a fixup, explaining the situation, that would be nice=
.

OK, I'd appreciate that :)

Cheers,
-- Nico

>
> --
> Cheers,
>
> David
>

