Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4550E21A420
	for <linux-doc@vger.kernel.org>; Thu, 17 Jul 2025 07:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752736929; cv=none; b=OpcMg19gQvJO2o4itPXtTlfdqDV9A4Sed3RjQphTb0mQn5vCtfuuYhwCj8Jq5l9VJiC5kULzTDAXW9ObB+UsgzCvVcukBQRCGTMNuK2rJywo9yfF5FuXwuR7G3EJ1yFmk17Xcfwu9pIw+M4RsfNV6MS+2m/AzcQB6iHLsdIzOec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752736929; c=relaxed/simple;
	bh=tWDmCspVYb9wK2NOfdDGtxHX3NGRXaIDB6oxJ+Ggx2w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=NT09kmlRYsYICV0Lk9u1XmmS9e9sGhjsLOdvpwjDlkn4HXy3KG560PuqTqnEEEETspeOu1LZHyaFmC8cGIuZSZkiIDTdkkl4rdJHVwhIhWddjV1a1qIHZ7qs3Dsdrk65z2EY9R6gRZT4PX4y4d0SSG8ZgEmO/nTapZnetNU3ees=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D54C92or; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D54C92or"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752736926;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XQ39Fnx/vbGSljAimxTrmnp3D5hf3R4yTB7vGUtkUcY=;
	b=D54C92orjs2WH25LNoUjMOtRq1tBMDglvUW6wrKFwsSWDAaHqxSRFrjOhJWIrpkIo7zpOA
	0lpMJCa3r9rcUlYptx44LR7Ky76a94ssvhuPHlV8GbeUG/HMBkHTuEtgUp+H+0MQCIJD/k
	ex57uI7bR956be1Go06BikgWNbPOBow=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-304-K4m3k75lNpGb8MwzjSya4g-1; Thu, 17 Jul 2025 03:22:04 -0400
X-MC-Unique: K4m3k75lNpGb8MwzjSya4g-1
X-Mimecast-MFC-AGG-ID: K4m3k75lNpGb8MwzjSya4g_1752736924
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-70e86a2a1b8so9785777b3.1
        for <linux-doc@vger.kernel.org>; Thu, 17 Jul 2025 00:22:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752736924; x=1753341724;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XQ39Fnx/vbGSljAimxTrmnp3D5hf3R4yTB7vGUtkUcY=;
        b=jft323VCawzM/DXK1WLvWICXvAulEwCEOsBj4WN3cU6h+qsInkVh0exxse7+QibKvd
         Z41BpEuwti+dwrXNz4L8X/10gvuSGIDIW8HQ9EdBbdrrloPfj9XLXgGoZucj/3ibtCkc
         YYHWinfzkll+bIJ3JwMEc1yzbaDYL3t9Q/10OCa6lzsi//kwxYAu+6o8U7UOyUu4c8nq
         oKXSwScQzyAKHt1bfd6xfQRZVfKCz2wzcQts/x4nzn4gVR0cwjx26EWTh0n4+yC8hl2x
         Izs5bxFCSLo3XHCtk258FMZQRW/cxBdWM2797VjbXtgf5wosPdn3pHnmJJpSA8HdkAbn
         Gl9g==
X-Forwarded-Encrypted: i=1; AJvYcCUZtWI57b6L/+D0J9MVS7EsyWfqg0nKbSajIywZBzkmXikxX0AJ5L6DUySoJB3absDXRkx1tdrLjXc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfzHBPXPebMeB4FuBFjwMGIJ6tsFm2y2ahtp3Cv+t5j+hYw8Wo
	FbX1QboKMkJQ6oWIt+am38sVk7QDa3cDPIE9cJg8tgQ52gORW1VguN4X/aINc+L3VwgEsmcP2ca
	aCgP/4rqbDNc5rh0YgR70GKh6KicWrulCsERAnUOLYHjqKYrIAVJ0akDCCaqe45AeMWdWuaa8Vh
	gv0lvPbKphpv8dB55Vbho2c83Fs5Yt7nJnE4Kd
X-Gm-Gg: ASbGnct8sMtbkFgsCZriYgVaJQGM95ZgLSB7KrMw9wRLRSPpTQ6DFSG9LmcWSuwhBIc
	8N/XZJPDqguZ8zX0slyfDYMYzteQ3UoaBk2AFrTplzHTf2UDZs+Mn95kuGEJh1Bdo6EK7gdgPiC
	QQdVPsmD9/aCq1xsIhbqvTaec=
X-Received: by 2002:a05:690c:7006:b0:70e:82d6:9af2 with SMTP id 00721157ae682-7183519693bmr85546807b3.34.1752736923765;
        Thu, 17 Jul 2025 00:22:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFulp94zzqufWxgbn/qqUK0u8D80QwhjnNGORTCxK8HgNdkob8Z42M9OX9p9UcMtp5qaidEXGBGcHvo62zvmAU=
X-Received: by 2002:a05:690c:7006:b0:70e:82d6:9af2 with SMTP id
 00721157ae682-7183519693bmr85546287b3.34.1752736923365; Thu, 17 Jul 2025
 00:22:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250714003207.113275-1-npache@redhat.com> <20250714003207.113275-2-npache@redhat.com>
 <qgcvsfhoq3pnvxhdn73dopbtvi75oghbaydg27atqfp556u6sa@ixwdwi73lgkl>
In-Reply-To: <qgcvsfhoq3pnvxhdn73dopbtvi75oghbaydg27atqfp556u6sa@ixwdwi73lgkl>
From: Nico Pache <npache@redhat.com>
Date: Thu, 17 Jul 2025 01:21:37 -0600
X-Gm-Features: Ac12FXxi7mHJAWB-d7W3oMKlvMwZbeUXqKMgcsTZqrDy3LQaENgncw19n5KwkQU
Message-ID: <CAA1CXcAmkembYSSYwRq6avfQN6TJnp8=f99MDv1kkEaL-huczA@mail.gmail.com>
Subject: Re: [PATCH v9 01/14] khugepaged: rename hpage_collapse_* to collapse_*
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Nico Pache <npache@redhat.com>, linux-mm@kvack.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, david@redhat.com, ziy@nvidia.com, 
	baolin.wang@linux.alibaba.com, lorenzo.stoakes@oracle.com, 
	ryan.roberts@arm.com, dev.jain@arm.com, corbet@lwn.net, rostedt@goodmis.org, 
	mhiramat@kernel.org, mathieu.desnoyers@efficios.com, 
	akpm@linux-foundation.org, baohua@kernel.org, willy@infradead.org, 
	peterx@redhat.com, wangkefeng.wang@huawei.com, usamaarif642@gmail.com, 
	sunnanyong@huawei.com, vishal.moola@gmail.com, 
	thomas.hellstrom@linux.intel.com, yang@os.amperecomputing.com, 
	kirill.shutemov@linux.intel.com, aarcange@redhat.com, raquini@redhat.com, 
	anshuman.khandual@arm.com, catalin.marinas@arm.com, tiwai@suse.de, 
	will@kernel.org, dave.hansen@linux.intel.com, jack@suse.cz, cl@gentwo.org, 
	jglisse@google.com, surenb@google.com, zokeefe@google.com, hannes@cmpxchg.org, 
	rientjes@google.com, mhocko@suse.com, rdunlap@infradead.org, hughd@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 16, 2025 at 8:30=E2=80=AFAM Liam R. Howlett <Liam.Howlett@oracl=
e.com> wrote:
>
> * Nico Pache <npache@redhat.com> [250713 20:33]:
> > The hpage_collapse functions describe functions used by madvise_collaps=
e
> > and khugepaged. remove the unnecessary hpage prefix to shorten the
> > function name.
> >
> > Reviewed-by: Zi Yan <ziy@nvidia.com>
> > Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> > Signed-off-by: Nico Pache <npache@redhat.com>
>
>
> This is funny.  I suggested this sort of thing in v7 but you said that
> David H. said what to do, but then in v8 there was a discussion where
> David said differently..
Haha yes I'm sorry, I honestly misunderstood your request to mean
"drop hpage_collapse" not just "hpage". In a meeting with David early
on in this work he recommended renaming these. Dev made a good point
that renaming these to khugepaged is a revert of previous commit.
>
> Yes, I much prefer dropping the prefix that is already implied by the
> file for static inline functions than anything else from the names.
>
> Thanks, this looks nicer.
I agree, thanks!
>
>
> > ---
> >  mm/khugepaged.c | 46 +++++++++++++++++++++++-----------------------
> >  1 file changed, 23 insertions(+), 23 deletions(-)
> >
> > diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> > index a55fb1dcd224..eb0babb51868 100644
> > --- a/mm/khugepaged.c
> > +++ b/mm/khugepaged.c
> > @@ -402,14 +402,14 @@ void __init khugepaged_destroy(void)
> >       kmem_cache_destroy(mm_slot_cache);
> >  }
> >
> > -static inline int hpage_collapse_test_exit(struct mm_struct *mm)
> > +static inline int collapse_test_exit(struct mm_struct *mm)
> >  {
> >       return atomic_read(&mm->mm_users) =3D=3D 0;
> >  }
>
> ...
>
> > -static int hpage_collapse_scan_pmd(struct mm_struct *mm,
> > +static int collapse_scan_pmd(struct mm_struct *mm,
> >                                  struct vm_area_struct *vma,
> >                                  unsigned long address, bool *mmap_lock=
ed,
> >                                  struct collapse_control *cc)
>
> One thing I noticed here.
>
> Usually we try to do two tab indents on arguments because it allows for
> less lines and less churn on argument list edits.
>
> That is, if you have two tabs then it does not line up with the code
> below and allows more arguments on the same line.
>
> It also means that if the name changes, then you don't have to change
> the white space of the argument list.
>
> On that note, the spacing is now off where the names changed, but this
> isn't a huge deal and I suspect it changes later anyways?  Anyways, this
> is more of a nit than anything.. The example above looks like it didn't
> line up to begin with.
I went through and cleaned these up, both on this patch and future
patches that had similar indentation issues.
>
> ...
>
> Reviewed-by: Liam R. Howlett <Liam.Howlett@oracle.com>
Thanks for your review!
>

