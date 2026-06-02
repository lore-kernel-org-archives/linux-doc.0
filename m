Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3BE3D45E4
	for <linux-doc@vger.kernel.org>; Tue,  2 Jun 2026 10:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780395934; cv=pass; b=lKDIwEYe1HfZOqEW8gzB6sf42aEy/t1aI7Ba3OkKv3ieoIQo9hUT9oB3kwLqaaps6tkrQGxAyDeRdIhQ/R6CpWUIj+NX8BZ1SunKfR5tcasdih5B8/fsg7WtIjphgTlnQkKOS66rJovDGjJVaXCPyEtSGv/ZPkyN9V3kb6JtSqw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780395934; c=relaxed/simple;
	bh=v/mNUCzjMW3NuapFIOaBB2YWhUzZvLlhF6p5ViObTzw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IrLgmNnb1Ce2KxinPizXNplq1BKw8oCA/f5yZxSjVuwj5VPMHro2yT4VXR+IDz+6O8RUDm6busTN4rVX2MZFnjpaAg/YFH7lldSzcqq233McTfEwd4oBoi5iCCmfRpuG1pIbxBRz8MS46toGBPytwEyfmibLBI/BjlTLOeO4fyI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Qh2SJbMM; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Tf5e8hGD; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Qh2SJbMM";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Tf5e8hGD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780395932;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tz/vVgYlWzqjYdT5CgsjAyARbiWMqKQW/JOPkRDARg4=;
	b=Qh2SJbMMumu/5DJVt4QdFbyS60/DjktMyZ30i/lSOR2oRKvFTws7afyiOaZXy4Woh1b6lW
	Q6vOhlPMkpwz7MPuu6TRO4bHdX1yd8WyHOYWp1dj3DcDQSxzCDxW+TYuFSoyqv14H/hCHI
	Ra+SiSq9LEpzvai7KLjpucNPAuJY+WU=
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com
 [74.125.224.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-156-aEJSGn0XOLem1C2apj3cxQ-1; Tue, 02 Jun 2026 06:25:31 -0400
X-MC-Unique: aEJSGn0XOLem1C2apj3cxQ-1
X-Mimecast-MFC-AGG-ID: aEJSGn0XOLem1C2apj3cxQ_1780395931
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-660575c74f1so5406663d50.3
        for <linux-doc@vger.kernel.org>; Tue, 02 Jun 2026 03:25:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780395931; cv=none;
        d=google.com; s=arc-20240605;
        b=lPBgmkRejJJXzm4KGjWo4WKM5dzInZqepfKmAV7nDD18TnXG4ezJ7d951OIuG+ovYL
         8N7IZ800bHoHmNc7533kdZ7NWjdRjHoRCfMwePUkmZ22dGjkwVpsS77hKaNdhxpqpD5T
         VEBHNRKMpeSTTx/ItnvsBk+5zz6qOBwMqtKwhQr+7YMr6Hw/14ciQZdvbml6yHqBm0Fv
         UFrUgdo20u5Z+9HbX7oAZlnX8ppSG9i5yQ1G0jzIGWplLNOMR1RDi8A7H+n2r+kNHekq
         DbDk4eKrlMNodOZc/i1oV7kOh2n16LuSQiPztGX04j8l5gbS0B6+5Ci32uNu8vu0v/z8
         W/DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tz/vVgYlWzqjYdT5CgsjAyARbiWMqKQW/JOPkRDARg4=;
        fh=/Zx+XU+1HHk4Acx7QwlldthIwSJ+IUnl+N2so9LKFX8=;
        b=SStN4abnioih+iDx5/o1ZQDs6GACZ41akLiGRMv79RLVPim3kSmLEJi4aohU5r7/rU
         EiM73+YNbtZVbrskrtCWShHhxbGsKgIdwPaHBLbVX8q+xFg6GhmCTB1ND6O06pdEnOwl
         kHgZVkb6iJwFP9lbSF/p1szNY/QjUc5jPPBJIh/deSBOkWKhLdYDXeBrK/DLesjvhThy
         /WDSgJm5TThSmorn7H56/Ei+UWMNZQHxq8oY7s0ozcChDvGkBZJhMI1Hdl2z9GUdskJP
         sINyiqmzJe45EQNqtysSIzDdMdMort4QyujruySLu9hSXwKbjnvkeX67fbBZaWsvUR7u
         W8DQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1780395931; x=1781000731; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tz/vVgYlWzqjYdT5CgsjAyARbiWMqKQW/JOPkRDARg4=;
        b=Tf5e8hGDgT/4k4qtsgkSP2TUakZ79EPVK6qpzpw0PmLX4mCQxYaQ/6oGhHl/nudJFv
         ZCkahNcNcs9l2w+M0gtDZjBR4icTKJR8KyiYLlN96V4L9KzmtRmnus3rX2WF0VdWXLTs
         Easwei9R900yJs73JiQL7YKs6CveQWiUiKArZexrp25V3n5vg5MRH4yBg1NBThIglHiw
         dFlJaKHaxab2fLKT1Ey0I60qdvzKmSlYg6dvUnhWvFsQQpp0gn8ezIP5XDX1Cf/pz3hJ
         M0r2Y1pgRi7fGEyuCK46MnAgs8/SpBuzuNmzk5DQ7yA3b4XgVh8wOtGZlJwKbMrMNCd0
         ttTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780395931; x=1781000731;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tz/vVgYlWzqjYdT5CgsjAyARbiWMqKQW/JOPkRDARg4=;
        b=q2AywPdMI6knSlPvo8W86kPSdh5fN3Y0CfUQpiikVJQ/1dLZvJ9TbmQzNq8gGxDZ2S
         jiFbBvUN8O5CULR2I7vzvrYNfB+x+GSCc5Ki9d7mqgA0YFNEAwdr3Yrw/xPqPR3lDUTZ
         QAFIqKrIHiVDyCT9opw0e0UnVUvhUDfYHJqdRyX8qI7dRssX8opDr7gFIfewk9JCyMTU
         FzDo3CFjtzphx8a3zKi8Jxpui4OzF26jj1SyzIVER7lHtNlZZp+NI4xJbfAotvLBpAYb
         cuu9XwGeyVvjy1qy9V7ZU2KsPpGRx6uLigmj98Z8Dsof3VG9kH9wA0Z/fGOIdZ7YHOyv
         b2bA==
X-Gm-Message-State: AOJu0Yyi8dRdSzpOQZUdNFd8dRHch/e1LtdS4ryltHaNDROz4zdkGmw4
	EQDhL+9PbFI1kpgEifZH9CtWx6iAkyVQMxfTwJdUxrbHO7lA3BuhJsFwHTSfDKLfijDzd8HuSih
	oKaIW8JUoWz4JDGVcKG4pGvuNdWNLiVXy6pHDbjyPsxwFtraD06++XOIoKdvAqOAI14FUryrGPB
	Tlpkp5qT4PFjHKudpMs5GBvN3bOd+LWSo4HFx5
X-Gm-Gg: Acq92OHHczBkJewuOmpuxzimjp+KNgeItAgOE3vCaVnbnxtkn6DhfWl4k9raEBO7iCI
	cmDAz+tidCe7znlZxMFWOz1pOzH0t4EzsOCvC68KqZsaq4xuJ+R4W7ggQRArs6WQ5CdcwP5ZWH2
	5nNNxx/ryjkqYWGbLiipvyMLs1skiN2emvD5ftvz2vCjU0jPrbw05HGnAog+htrSicy7EOpYngw
	ZVZ9reE8ujYWQUbMQ==
X-Received: by 2002:a05:690e:1595:20b0:660:5e16:f249 with SMTP id 956f58d0204a3-6605edecbf9mr9767414d50.11.1780395930762;
        Tue, 02 Jun 2026 03:25:30 -0700 (PDT)
X-Received: by 2002:a05:690e:1595:20b0:660:5e16:f249 with SMTP id
 956f58d0204a3-6605edecbf9mr9767365d50.11.1780395930340; Tue, 02 Jun 2026
 03:25:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522150009.121603-1-npache@redhat.com> <20260522150009.121603-6-npache@redhat.com>
 <ah2Ro54tMDMsPevk@lucifer>
In-Reply-To: <ah2Ro54tMDMsPevk@lucifer>
From: Nico Pache <npache@redhat.com>
Date: Tue, 2 Jun 2026 04:26:09 -0600
X-Gm-Features: AVHnY4JldSmClM5zWrsLMpr94a96n3CDQXVYIR75HwJ96w-KO0z_Xu55vTpSsPY
Message-ID: <CAA1CXcAXWWKD64YYGL2ue5iKFUiGsSq-pK2_8qvvgG6EBS079Q@mail.gmail.com>
Subject: Re: [PATCH mm-unstable v18 05/14] mm/khugepaged: require
 collapse_huge_page to enter/exit with the lock dropped
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-trace-kernel@vger.kernel.org, aarcange@redhat.com, 
	akpm@linux-foundation.org, anshuman.khandual@arm.com, apopple@nvidia.com, 
	baohua@kernel.org, baolin.wang@linux.alibaba.com, byungchul@sk.com, 
	catalin.marinas@arm.com, cl@gentwo.org, corbet@lwn.net, 
	dave.hansen@linux.intel.com, david@kernel.org, dev.jain@arm.com, 
	gourry@gourry.net, hannes@cmpxchg.org, hughd@google.com, jack@suse.cz, 
	jackmanb@google.com, jannh@google.com, jglisse@google.com, 
	joshua.hahnjy@gmail.com, kas@kernel.org, lance.yang@linux.dev, 
	liam@infradead.org, mathieu.desnoyers@efficios.com, matthew.brost@intel.com, 
	mhiramat@kernel.org, mhocko@suse.com, peterx@redhat.com, pfalcato@suse.de, 
	rakie.kim@sk.com, raquini@redhat.com, rdunlap@infradead.org, 
	richard.weiyang@gmail.com, rientjes@google.com, rostedt@goodmis.org, 
	rppt@kernel.org, ryan.roberts@arm.com, shivankg@amd.com, 
	sunnanyong@huawei.com, surenb@google.com, thomas.hellstrom@linux.intel.com, 
	tiwai@suse.de, usamaarif642@gmail.com, vbabka@suse.cz, vishal.moola@gmail.com, 
	wangkefeng.wang@huawei.com, will@kernel.org, willy@infradead.org, 
	yang@os.amperecomputing.com, ying.huang@linux.alibaba.com, ziy@nvidia.com, 
	zokeefe@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 1, 2026 at 8:13=E2=80=AFAM Lorenzo Stoakes <ljs@kernel.org> wro=
te:
>
> On Fri, May 22, 2026 at 09:00:00AM -0600, Nico Pache wrote:
> > Currently the collapse_huge_page function requires the mmap_read_lock t=
o
> > enter with it held, and exit with it dropped. This function moves the
> > unlock into its parent caller, and changes this semantic to requiring i=
t
> > to enter/exit with it always unlocked.
> >
> > In future patches, we need this expectation, as for in mTHP collapse, w=
e
> > may have already have dropped the lock, and do not want to conditionall=
y
> > check for this by passing through the lock_dropped variable.
> >
> > No functional change is expected as one of the first things the
> > collapse_huge_page function does is drop this lock before allocating th=
e
> > hugepage.
> >
> > Acked-by: David Hildenbrand (Arm) <david@kernel.org>
> > Signed-off-by: Nico Pache <npache@redhat.com>
>
> One small nit below, otherwise LGTM, so:
>
> Reviewed-by: Lorenzo Stoakes <ljs@kernel.org>

Thank you for reviewing!

>
> > ---
> >  mm/khugepaged.c | 16 ++++++++--------
> >  1 file changed, 8 insertions(+), 8 deletions(-)
> >
> > diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> > index e98ba5b15163..fab35d318641 100644
> > --- a/mm/khugepaged.c
> > +++ b/mm/khugepaged.c
> > @@ -1208,6 +1208,12 @@ static enum scan_result alloc_charge_folio(struc=
t folio **foliop, struct mm_stru
> >       return SCAN_SUCCEED;
> >  }
> >
> > +/*
> > + * collapse_huge_page expects the mmap_lock to be unlocked before ente=
ring and
> > + * will always return with the lock unlocked, to avoid holding the mma=
p_lock
> > + * while allocating a THP, as that could trigger direct reclaim/compac=
tion.
> > + * Note that the VMA must be rechecked after grabbing the mmap_lock ag=
ain.
> > + */
> >  static enum scan_result collapse_huge_page(struct mm_struct *mm, unsig=
ned long address,
> >               int referenced, int unmapped, struct collapse_control *cc=
)
> >  {
> > @@ -1223,14 +1229,6 @@ static enum scan_result collapse_huge_page(struc=
t mm_struct *mm, unsigned long a
> >
> >       VM_BUG_ON(address & ~HPAGE_PMD_MASK);
> >
> > -     /*
> > -      * Before allocating the hugepage, release the mmap_lock read loc=
k.
> > -      * The allocation can take potentially a long time if it involves
> > -      * sync compaction, and we do not need to hold the mmap_lock duri=
ng
> > -      * that. We will recheck the vma after taking it again in write m=
ode.
> > -      */
> > -     mmap_read_unlock(mm);
> > -
>
> NIT: Maybe worth an mmap_assert_locked()?

But it will already be unlocked here. The contract is that we enter
unlocked and exit unlocked.

Cheers,
-- Nico

>
> >       result =3D alloc_charge_folio(&folio, mm, cc, HPAGE_PMD_ORDER);
> >       if (result !=3D SCAN_SUCCEED)
> >               goto out_nolock;
> > @@ -1535,6 +1533,8 @@ static enum scan_result collapse_scan_pmd(struct =
mm_struct *mm,
> >  out_unmap:
> >       pte_unmap_unlock(pte, ptl);
> >       if (result =3D=3D SCAN_SUCCEED) {
> > +             /* collapse_huge_page expects the lock to be dropped befo=
re calling */
> > +             mmap_read_unlock(mm);
> >               result =3D collapse_huge_page(mm, start_addr, referenced,
> >                                           unmapped, cc);
> >               /* collapse_huge_page will return with the mmap_lock rele=
ased */
> > --
> > 2.54.0
> >
>
> Cheers, Lorenzo
>

