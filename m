Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB0C26561C
	for <linux-doc@vger.kernel.org>; Wed, 30 Apr 2025 18:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746038382; cv=none; b=i5i1TkixKeiZWYdZj3VV+tBjQOIUC56/S+9C3juRjgL8WUWc7dUsl2Hkpt9STxTKVKPFXynm6lgH+JrFnu1VD5SIf1vyMjmZ0oof0SfFtoliUHYw2IxwjLSkmDyg8OJjfSeGZXjQoIMoRLRKRdUAtPnNzQC2XurD9O/DnpVIg+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746038382; c=relaxed/simple;
	bh=uop7LMZYuz+EVPrsb8rncMFAD0a69RO4PcxjXzb4CH0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=auBlN1aNzus+Eu/J5AS9KGhHKz8R4GUhUZCU+6ZPqNSg8yU7snbDF4+Ig5MujHixlRIVqibY34LJc7gbrheQPwDB8H7lwudV/dmSiFCXlBu7t+wdxi5heTfuIhx0cOsEX0Gv1tkgcn/rkq02qP9oxv937c6Hp7hb7nYXCJRbg2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ju8MzOi0; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ju8MzOi0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746038379;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IRjxDxDhTYKrorsZixsAP5Kxt917TzYAbdZEFQfMsaE=;
	b=Ju8MzOi0gVPKwUN/hTOvN/3OabbtNGEatok/8wuPZUgZuMgDAA7JgYEh5PvSRu2iMqi0Iz
	rovZ0GlXEl5ATxIFWRy89SiybrslUHaBmJs0sZ/9vTd4EdMIWr796NccRxKwhzo4+S3hA4
	yHxtTTtb6dDbwKbU/k0Bt00izdy0Rps=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-696-thcSIbZVNASTT2pFymfrjQ-1; Wed, 30 Apr 2025 14:39:37 -0400
X-MC-Unique: thcSIbZVNASTT2pFymfrjQ-1
X-Mimecast-MFC-AGG-ID: thcSIbZVNASTT2pFymfrjQ_1746038377
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-706b84fe6edso2831877b3.3
        for <linux-doc@vger.kernel.org>; Wed, 30 Apr 2025 11:39:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746038377; x=1746643177;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IRjxDxDhTYKrorsZixsAP5Kxt917TzYAbdZEFQfMsaE=;
        b=uUk1TaREAbZYilZH5seGx074RSX4VsdrtCNMe6bY+fMLF1nO2kgymsy12cTdeGoOud
         +n/JIEacns0yqeuZY5u21U6dRRbKPJg1FsMNuNCdQvp0c1u7E2tSlmExBta2qaXB8Q9z
         SJwSYP+JE2B1M9GgXDWsvZcr6vU/yGtv/LdSA+Kw4ekO4cvQYPZBo1XVSq2NOUqAECKO
         s0z7dSERhA9eGsnwuayi0QCKhfHKvrv+orli+0Ae2+2relcGjU3qeU1Tf79hsmdJuUMn
         GvxhXX8CKLs2UFF+YfYsyK8WzZkQha/4xie3Zo4MBQCjRSlkSvFYsjh6wjpL3IMyo9+J
         Jb8g==
X-Forwarded-Encrypted: i=1; AJvYcCUXhwzEbmFI/HQ5H8f5WQTG5uN5tqGK+wD6kxCvQLoNMmVlscd/FPImZ2Z7zHTOJOh9C+i+sWaSOMs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx99a1P6YrN8CD+1CCi60DzBNB84psnO4B4UU4SpDLQzoH4EW4+
	nsrdOEklF+fqtY55rJi2d1qs5XlX7mDsdWYRnAjnpFOtF4/IRu9C1RBD6uKDZlyXCYctQiAyAZE
	yh6rjLhGZp1pRFi0+JZOt7obV25CkBDvVkL+mMuwZulzSfxv8+TzEvDd5caXOfk7In3Z9jXf5cs
	YXbZD7oLrvmjZc50FrVuVBTBT0xLuSNgZJ
X-Gm-Gg: ASbGncvUNXaHlg2VMt1Q6l4S+cvQIXea9+N8/40MvV2pKbASBIhfNNNjXMeq5TNRhrQ
	3LeoYexhb4BUaIVo4KgRJC+b4jROBB8/oWf8Wb4fXclAzZJd5QWkfEVLzeWrpEwbKAasVPK0eHB
	WLRqGO8vo=
X-Received: by 2002:a05:690c:9:b0:6fd:a226:fb6c with SMTP id 00721157ae682-708abdabf95mr62404467b3.17.1746038377163;
        Wed, 30 Apr 2025 11:39:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUG8Gr8pCuMfJMWlcmWUQoisJmUZ1EDMBMinzj6P3MiMpx3S+K06g4TgDXVqU9n7uNHGfUH5de6C068UnlTA0=
X-Received: by 2002:a05:690c:9:b0:6fd:a226:fb6c with SMTP id
 00721157ae682-708abdabf95mr62403917b3.17.1746038376803; Wed, 30 Apr 2025
 11:39:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250428182904.93989-1-npache@redhat.com> <20250428182904.93989-2-npache@redhat.com>
 <B76CC5A1-D4DC-4E8B-BF5A-DFBEF13E02F5@nvidia.com>
In-Reply-To: <B76CC5A1-D4DC-4E8B-BF5A-DFBEF13E02F5@nvidia.com>
From: Nico Pache <npache@redhat.com>
Date: Wed, 30 Apr 2025 12:39:10 -0600
X-Gm-Features: ATxdqUFWpWLVzjLTZtwA2dC3DeeBs_qZQ8boE4jqqynD0FM3HxwqQb_YeWEGAHg
Message-ID: <CAA1CXcAHzLZaiEf+uXPqoOMWyhDsW8D23vtouGWKGdkeSdaTow@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] mm: defer THP insertion to khugepaged
To: Zi Yan <ziy@nvidia.com>
Cc: linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	akpm@linux-foundation.org, corbet@lwn.net, rostedt@goodmis.org, 
	mhiramat@kernel.org, mathieu.desnoyers@efficios.com, david@redhat.com, 
	baohua@kernel.org, baolin.wang@linux.alibaba.com, ryan.roberts@arm.com, 
	willy@infradead.org, peterx@redhat.com, shuah@kernel.org, 
	wangkefeng.wang@huawei.com, usamaarif642@gmail.com, sunnanyong@huawei.com, 
	vishal.moola@gmail.com, thomas.hellstrom@linux.intel.com, 
	yang@os.amperecomputing.com, kirill.shutemov@linux.intel.com, 
	aarcange@redhat.com, raquini@redhat.com, dev.jain@arm.com, 
	anshuman.khandual@arm.com, catalin.marinas@arm.com, tiwai@suse.de, 
	will@kernel.org, dave.hansen@linux.intel.com, jack@suse.cz, cl@gentwo.org, 
	jglisse@google.com, surenb@google.com, zokeefe@google.com, 
	Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com, hannes@cmpxchg.org, 
	rientjes@google.com, mhocko@suse.com, rdunlap@infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 29, 2025 at 7:49=E2=80=AFAM Zi Yan <ziy@nvidia.com> wrote:
>
> On 28 Apr 2025, at 14:29, Nico Pache wrote:
>
> > setting /transparent_hugepages/enabled=3Dalways allows applications
> > to benefit from THPs without having to madvise. However, the pf handler
>
> s/pf/page fault
>
> > takes very few considerations to decide weather or not to actually use =
a
>
> s/weather/whether
>
> > THP. This can lead to a lot of wasted memory. khugepaged only operates
> > on memory that was either allocated with enabled=3Dalways or MADV_HUGEP=
AGE.
> >
> > Introduce the ability to set enabled=3Ddefer, which will prevent THPs f=
rom
> > being allocated by the page fault handler unless madvise is set,
> > leaving it up to khugepaged to decide which allocations will collapse t=
o a
> > THP. This should allow applications to benefits from THPs, while curbin=
g
> > some of the memory waste.
> >
> > Co-developed-by: Rafael Aquini <raquini@redhat.com>
> > Signed-off-by: Rafael Aquini <raquini@redhat.com>
> > Signed-off-by: Nico Pache <npache@redhat.com>
> > ---
> >  include/linux/huge_mm.h | 15 +++++++++++++--
> >  mm/huge_memory.c        | 31 +++++++++++++++++++++++++++----
> >  2 files changed, 40 insertions(+), 6 deletions(-)
> >
> > diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
> > index e3d15c737008..57e6c962afb1 100644
> > --- a/include/linux/huge_mm.h
> > +++ b/include/linux/huge_mm.h
> > @@ -48,6 +48,7 @@ enum transparent_hugepage_flag {
> >       TRANSPARENT_HUGEPAGE_UNSUPPORTED,
> >       TRANSPARENT_HUGEPAGE_FLAG,
> >       TRANSPARENT_HUGEPAGE_REQ_MADV_FLAG,
> > +     TRANSPARENT_HUGEPAGE_DEFER_PF_INST_FLAG,
>
> What does INST mean here? Can you add one sentence on this new flag
> in the commit log to explain what it is short for?
"INSERT". Someone else commented on the length of this FLAG name. I
forgot to update it.
I can shorten it to something like ..DEFER_FLAG or DEFER_PF_FLAG
>
>
> >       TRANSPARENT_HUGEPAGE_DEFRAG_DIRECT_FLAG,
> >       TRANSPARENT_HUGEPAGE_DEFRAG_KSWAPD_FLAG,
> >       TRANSPARENT_HUGEPAGE_DEFRAG_KSWAPD_OR_MADV_FLAG,
> > @@ -186,6 +187,7 @@ static inline bool hugepage_global_enabled(void)
> >  {
> >       return transparent_hugepage_flags &
> >                       ((1<<TRANSPARENT_HUGEPAGE_FLAG) |
> > +                     (1<<TRANSPARENT_HUGEPAGE_DEFER_PF_INST_FLAG) |
> >                       (1<<TRANSPARENT_HUGEPAGE_REQ_MADV_FLAG));
> >  }
> >
> > @@ -195,6 +197,12 @@ static inline bool hugepage_global_always(void)
> >                       (1<<TRANSPARENT_HUGEPAGE_FLAG);
> >  }
> >
> > +static inline bool hugepage_global_defer(void)
> > +{
> > +     return transparent_hugepage_flags &
> > +                     (1<<TRANSPARENT_HUGEPAGE_DEFER_PF_INST_FLAG);
> > +}
> > +
> >  static inline int highest_order(unsigned long orders)
> >  {
> >       return fls_long(orders) - 1;
> > @@ -291,13 +299,16 @@ unsigned long thp_vma_allowable_orders(struct vm_=
area_struct *vma,
> >                                      unsigned long tva_flags,
> >                                      unsigned long orders)
> >  {
> > +     if ((tva_flags & TVA_IN_PF) && hugepage_global_defer() &&
> > +                     !(vm_flags & VM_HUGEPAGE))
> > +             return 0;
> > +
> >       /* Optimization to check if required orders are enabled early. */
> >       if ((tva_flags & TVA_ENFORCE_SYSFS) && vma_is_anonymous(vma)) {
> >               unsigned long mask =3D READ_ONCE(huge_anon_orders_always)=
;
> > -
>
> This newline should stay, right?
Yes, I can fix that.
>
> The rest looks good to me. Thanks. Acked-by: Zi Yan <ziy@nvidia.com>
Thank you!
-- Nico
>
> Best Regards,
> Yan, Zi
>

