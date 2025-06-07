Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 900973FBB3
	for <linux-doc@vger.kernel.org>; Sat,  7 Jun 2025 12:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749300988; cv=none; b=FantlDS/1+H+6aonx8StMmijpwPOlngSEeOGKQF+SIPhyWX15eDb6VHrTF7zq4nZg+z0F37IPfhS3qpve33mCwzRG3shbn+ao2M5qe711x59N+RN+EfJXaGt74UgcoP8w3d8QWf8NFy50bdqIjCarFQpXhu0Qvwqf73TJVScSCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749300988; c=relaxed/simple;
	bh=E3jFw4plNfnyaJ6/d/G2qMEjVr/2+M4kGpJVkd6g/io=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LkBZ4kNo5HCNJo2MQ0VNigR9sZogtfvcUJb25o3MAUdEfCDyBbKQo2YyX2tN33xwPuUd5lagbdZxfBsRG8arvnV6PfiZDwOZQ5nUQ11KmSq6Q93WJJpaiihgDezqwbZ8j/8W7XL6nLROsl0iaHoQZHW16EJwTjjz2j16YuhMZ1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FDSvxsA7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FDSvxsA7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749300985;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7Pz3n+S4GF9CWwbPXAPkF5BhdMy9zbB86GVsp+E3IRU=;
	b=FDSvxsA7CteFYLtkxZuStpq1DhRxK/0TnkjFjM2JuxdwqxGBFHROOwGfDir4D2dxuhfLnX
	ZvK0sgbop8BEm46jukP/Gc8QT9pMvMZWzunWCGYJct3E6nhYgwPfFAiBbPwlLcy6iDJ7Pe
	C/wLhlbn+4LBIOZII3sRjrDcz58KiVU=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-552-Z7aC4_HtNBGDPv62oSWauA-1; Sat, 07 Jun 2025 08:56:24 -0400
X-MC-Unique: Z7aC4_HtNBGDPv62oSWauA-1
X-Mimecast-MFC-AGG-ID: Z7aC4_HtNBGDPv62oSWauA_1749300983
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-7110313b92dso15687337b3.3
        for <linux-doc@vger.kernel.org>; Sat, 07 Jun 2025 05:56:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749300983; x=1749905783;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Pz3n+S4GF9CWwbPXAPkF5BhdMy9zbB86GVsp+E3IRU=;
        b=JgA11y7SfnenmrQaiberV0eaB23dI6hJ0+FtD4TRJE0uF4Rrozr9Ese9xbjYCKiTAB
         VNwcYuGmW61sPTGV5kSBgUHUmrIs4ftxirmMEyq/zwkI81hoEH44K2Chj+ZmGQCvWgNP
         ZnAMrXjw6+vJdX3aGgHtiY2ne4SVoJIZ8R5giRU15zsUSnZSJcL+YBmLSBL4t2nu9Lkd
         AQRscmU8RmVP6+6sQP3ZTNActrUQbi6yJgcB3Akk77okwdQArBxpiUg1Hd1Uo3Yd3u+Q
         Zg2u/8F6hV5Bq2IJfOjY5ImFGWtYrnSavbo/aeP3U/eqa+iFlpreGVQMbMr0OClE0y18
         oRPA==
X-Forwarded-Encrypted: i=1; AJvYcCVsrVULItZ6eMBiwrIBAGGrVtBSblndondzhMznSlt8MzpMk8Y3IouogS3Xjchhs5eIWqlrLno8dqg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGO0Lt+hu1KXQx8DCpwQxP0iqt77VC/+r28GdMMxx727wwyopy
	LEpAf2DSxAcVEH7neabK+rkFaX8xZqI58kBkg8UFvcStUJqSRe9aM9+ljriXe4IhXO5f1onYDvt
	WgPS/7obBz9N4FtwfUAjFPRnzNj4xeszdaHPDXS+qgV31ZJ1G9Y41Ma1RDY/kRN6W0lK0wwe7BW
	yQovJbqHgKoFnb4nb+gHRdbznjXlcpndGvnXMg
X-Gm-Gg: ASbGncsRszth/1vGSp119yBvYdmMgxi3Jj8yVr/coDr/qD7zhKnxx4idNMg2qQcscBQ
	MPg3UN4Frpgib/KG2NOOpO5tp84FAGRqgutBAIykxN5kiIzfbw/iYxOZC2beLi0BNELb2xP8=
X-Received: by 2002:a05:690c:6904:b0:70d:f237:6a6a with SMTP id 00721157ae682-710f76e77demr106566767b3.11.1749300983472;
        Sat, 07 Jun 2025 05:56:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7FNT8vSEilFYylIHoOVdCrN0R+1kocUas31odbrgRlbrWaYEbXkR61oPuKufF+zoQ6s8u8768x4WQQ3TJiTA=
X-Received: by 2002:a05:690c:6904:b0:70d:f237:6a6a with SMTP id
 00721157ae682-710f76e77demr106566237b3.11.1749300983107; Sat, 07 Jun 2025
 05:56:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515032226.128900-1-npache@redhat.com> <20250515032226.128900-8-npache@redhat.com>
 <6f061c65-f3aa-42bb-ab70-b45afdcf2baf@arm.com>
In-Reply-To: <6f061c65-f3aa-42bb-ab70-b45afdcf2baf@arm.com>
From: Nico Pache <npache@redhat.com>
Date: Sat, 7 Jun 2025 06:55:57 -0600
X-Gm-Features: AX0GCFtcqcQpOoDiuu78xnQcQoifshBwWWOu_PewXOLZ9tH8vG2w5ZNBvZ9_90Q
Message-ID: <CAA1CXcBUCZ+UGsE-9xHzgi0nmzcbzt_oKQWxP8=PJyp0W+iD1A@mail.gmail.com>
Subject: Re: [PATCH v7 07/12] khugepaged: add mTHP support
To: Dev Jain <dev.jain@arm.com>
Cc: linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	david@redhat.com, ziy@nvidia.com, baolin.wang@linux.alibaba.com, 
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, ryan.roberts@arm.com, 
	corbet@lwn.net, rostedt@goodmis.org, mhiramat@kernel.org, 
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

On Sat, Jun 7, 2025 at 12:24=E2=80=AFAM Dev Jain <dev.jain@arm.com> wrote:
>
>
> On 15/05/25 8:52 am, Nico Pache wrote:
> > Introduce the ability for khugepaged to collapse to different mTHP size=
s.
> > While scanning PMD ranges for potential collapse candidates, keep track
> > of pages in KHUGEPAGED_MIN_MTHP_ORDER chunks via a bitmap. Each bit
> > represents a utilized region of order KHUGEPAGED_MIN_MTHP_ORDER ptes. I=
f
> > mTHPs are enabled we remove the restriction of max_ptes_none during the
> > scan phase so we dont bailout early and miss potential mTHP candidates.
> >
> > After the scan is complete we will perform binary recursion on the
> > bitmap to determine which mTHP size would be most efficient to collapse
> > to. max_ptes_none will be scaled by the attempted collapse order to
> > determine how full a THP must be to be eligible.
> >
> > If a mTHP collapse is attempted, but contains swapped out, or shared
> > pages, we dont perform the collapse.
> >
> > For non PMD collapse we much leave the anon VMA write locked until afte=
r
> > we collapse the mTHP
>
> Why? I know that Hugh pointed out locking errors; I am yet to catch up
> on that thread, but you need to explain in the description why you do
> what you do.
I will add a better description in the next version. The reasoning is
that in the PMD case all the pages are isolated, but in the non-PMD
case this is not true, and we must keep the lock to prevent changes
from occurring after we unlock it.

Another potential solution is to isolate all the pages in the PMD,
then undo it after we collapse the mTHP.

-- Nico
>
> [--snip---]
>
> >
> > -
> > -     spin_lock(pmd_ptl);
> > -     BUG_ON(!pmd_none(*pmd));
> > -     folio_add_new_anon_rmap(folio, vma, address, RMAP_EXCLUSIVE);
> > -     folio_add_lru_vma(folio, vma);
> > -     pgtable_trans_huge_deposit(mm, pmd, pgtable);
> > -     set_pmd_at(mm, address, pmd, _pmd);
> > -     update_mmu_cache_pmd(vma, address, pmd);
> > -     deferred_split_folio(folio, false);
> > -     spin_unlock(pmd_ptl);
> > +     if (order =3D=3D HPAGE_PMD_ORDER) {
> > +             pgtable =3D pmd_pgtable(_pmd);
> > +             _pmd =3D folio_mk_pmd(folio, vma->vm_page_prot);
> > +             _pmd =3D maybe_pmd_mkwrite(pmd_mkdirty(_pmd), vma);
> > +
> > +             spin_lock(pmd_ptl);
> > +             BUG_ON(!pmd_none(*pmd));
> > +             folio_add_new_anon_rmap(folio, vma, _address, RMAP_EXCLUS=
IVE);
> > +             folio_add_lru_vma(folio, vma);
> > +             pgtable_trans_huge_deposit(mm, pmd, pgtable);
> > +             set_pmd_at(mm, address, pmd, _pmd);
> > +             update_mmu_cache_pmd(vma, address, pmd);
> > +             deferred_split_folio(folio, false);
> > +             spin_unlock(pmd_ptl);
> > +     } else { /* mTHP collapse */
> > +             mthp_pte =3D mk_pte(&folio->page, vma->vm_page_prot);
> > +             mthp_pte =3D maybe_mkwrite(pte_mkdirty(mthp_pte), vma);
> > +
> > +             spin_lock(pmd_ptl);
>
> Nico,
>
> I've noticed a few occasions where my review comments have not been ackno=
wledged -
> for example, [1]. It makes it difficult to follow up and contributes to s=
ome
> frustration on my end. I'd appreciate if you could make sure to respond t=
o
> feedback, even if you are disagreeing with my comments. Thanks!
>
>
> [1] https://lore.kernel.org/all/08d13445-5ed1-42ea-8aee-c1dbde24407e@arm.=
com/
>
>
> [---snip---]
>

