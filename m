Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D6835CB7B
	for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 18:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779214876; cv=pass; b=rhlMtg+7K9oPb1GuBefyShVdKTtrW8FzIQRXDUBIvBDe5M0HO4Nimogw8Azmny8YQYUKD7mRWdvl5P/dCcQiAyAFMLmpAjhbfTw7ojRwNH/zdG6VncEmhtK48AEW4OCPo7ggtQkFJmskOaF7Eq7XTC/fwoN5sPKp/Z+0/R57UnE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779214876; c=relaxed/simple;
	bh=mBzpJrN9KrqpGSZV7OZTPURa6bHX1KPDENwsV2HGpa8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n1533InrEzZrgX7jBUAbzVv0wHHz+XlbUMagJ/qV2yPm58Sxgpks1G2UBSDl4AS3LR4Xl7CqLXQ5lrGEgiAVoDEGE+BOo3+OchLkuTkEJlYdaKlMfBs4GKbbtiDZ/7QXQLKwl7c/X84SY+yGin3Zb6l9hEFJB94Xwd4fTeaD/zU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CJO/z9Zc; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=jw6Ha7qi; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CJO/z9Zc";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="jw6Ha7qi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779214873;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DidhSSVgs6YbRMyQzDDirQnaWZ/O9mawSXYrnotJW/A=;
	b=CJO/z9ZcW6Va08X+pFv43CgM/efZfcErelOh9MNpagqHBC9imxbt9tpNG6j6cqlj4HGkqq
	cvBiLK4F9jjKfH0ArcUNqm6oU4BvxUMzALmoAaRyRaImD5GQ6PtGGuu3wz4lOWBDdMkjfM
	a1HNU+k+jcGlnOAwLPLFG1GZ2FrWW3o=
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com
 [74.125.224.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-600-udYIF1z8OIu-IQ32XMkHzA-1; Tue, 19 May 2026 14:21:12 -0400
X-MC-Unique: udYIF1z8OIu-IQ32XMkHzA-1
X-Mimecast-MFC-AGG-ID: udYIF1z8OIu-IQ32XMkHzA_1779214872
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-65e1b9f1ebeso8501836d50.1
        for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 11:21:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779214872; cv=none;
        d=google.com; s=arc-20240605;
        b=JygXhNAlgJFmSLOu+j0iReVAPT0xu7iFNiXFEH1QTA/6shhv04Jaymhws2yETzW/cW
         D2LMsIXap179Wa8J98rE/bGox0sySTwYpmW+fjxNhxDyZHy77t74aPuVV/Pkm/Vv5PBO
         +RCWuNFtmlRK9U2MXXL4UruALuZMxfGtufTb9T7f27HsLArVlOyCq08vvCAYyo4Q/P70
         kZLNtdlX/Tp1vVCvVXpSWAWuVN7EdzExQTDSG7bgoO8giTYzVETS1Jp+VEoWUHQ8w/n/
         8MmRpCAUp2myVMdGGeS6Moz4fC3D7rNS/UR8J919+RIDz72Bj0x45iNkEprOExq5XHtN
         z0mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DidhSSVgs6YbRMyQzDDirQnaWZ/O9mawSXYrnotJW/A=;
        fh=OxtM7SVZdNGee2IMaXLMnrhAw+pOMXwDvkUMtpF2eMs=;
        b=KOkyA53poC8CvMDcMZpbnAnj9uAm79IArBvoWYwtU2PG/KaaxhoBv/RFLi04DYf248
         HDj1sRhWUmy91dmkoBnRwgaGdT+etebp2NRxvgklPy0/BXbye4+u3W9Ohd/RGeOZilEJ
         aR9/2X5Dt8tnpB1rE3KidPIyRYFedpn0bLH2mCszVaY/r+rF5+6IwyzR57eJif+0z/Yb
         9WrgyGKpzGYbzguqFQhyR9O1ppnm7wXtr5MMG1yRitdGFXHM1B6rOhrPUc1yUbq9tXvs
         AX9+0riNa3YwRoevbGG9O2nKjD6FmzRnjmH64KXgLQW+1SM7PhIjes4JZ6J/na//H4hU
         +98g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1779214872; x=1779819672; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DidhSSVgs6YbRMyQzDDirQnaWZ/O9mawSXYrnotJW/A=;
        b=jw6Ha7qilAnl7IHtH+m8VVliBR1JugpYqAFDwKJfmHheFiTJuagLZ7pez6LFnmOdfx
         NNq8saBHPF4qeDsv3pKehTij0lyYrPsw+qSNJccU41GZK6E+jK+RRkNM/mru/pUFLIPb
         BKXXQDRrVQxubnIhxoyP7YVBgiWu1GbjuVFiL3jdKwQJBYO79Qx7iYWhuah1ejfjh1sq
         751ygReyLVQ0O6afNEwRLIpfmKPQ4RIdSdWPwe/0eHgikMy3BeiaAx7TVPsN+Th/tULw
         rMZxda0rm2Epdxo665cbPWOKtfPuqw0bobbaWss1lLeP+U5TV8EUNhfg/mUQuQ/mODFZ
         rShQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779214872; x=1779819672;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DidhSSVgs6YbRMyQzDDirQnaWZ/O9mawSXYrnotJW/A=;
        b=XuUY1cHXZzcWim2j20BEksmGIzVKcf+PNfzREgvqBs3c4/NZQPJdJGM3qHdqHgKNrD
         oCLoaWWxk9kzZ2muxZ8QOZU6VOuWLFi8XvptkpuhxcH1ZwL8CahbWHNejGl7dzIt9rw4
         ks4vVTBYMJ+n9e8khnbVmTWOa7O5PG/cxx5NUJ9Lf9ZoHD07rkovJJjHG8xssLhpHsbR
         ophe+gjdsCoehgsVbGUizPqZ43GV6cgrqssHOm5djhUqa4cSwx9alVyvbnhdQa+RRJ5c
         4ocOGJzem3h1zBt9lmF13B9fHS4Kprc6sUjAtcf7zFyLL0zwAmBgVUxgLA1+aX7EjQna
         YzVw==
X-Gm-Message-State: AOJu0YwCizuMcHKIDQYnYXaaBYNZxaGQr+jk24LAtVAnj8MYkAYQDwQj
	QGnV5kKzT3bSpccFbFrelUtwZsqx8dZgUKhAobWEPnzjH68f5MUcXzTGRy9vijknG33b5ZxD6BZ
	Mrjbf3G5YEdH4HAOjdD3ILGfORy7XM4ZZW9sr3YL6o0Z0f7Co33H7+ZY7D8jJ2EslVf659xajRe
	O5oCXItO07OHl0K4PJPM2qhcEI+pZ+ndT+aYvv
X-Gm-Gg: Acq92OERQhpceW3QW+PFWnn7NMEIyy4QaY1UeYxhFvqtV77v7u1r2ws+eLqqysJ3ccN
	KM7M4OdnQIJPwaYt3jCVpX02wlUa62aiLAs8yyaO3OXeAsWco8pHuRjoz2jqjBhS7yBo0IGHgVt
	9JqS5F9UC2/qoJALOyptEgoZLD8WOyKOF/ClcSdy+XaY15cqd/D3KEYCv+g9wvmJthJzvINp1vI
	XWNog==
X-Received: by 2002:a05:690e:1402:b0:65c:6ffb:3038 with SMTP id 956f58d0204a3-65e215f82abmr16063341d50.17.1779214871877;
        Tue, 19 May 2026 11:21:11 -0700 (PDT)
X-Received: by 2002:a05:690e:1402:b0:65c:6ffb:3038 with SMTP id
 956f58d0204a3-65e215f82abmr16063273d50.17.1779214871174; Tue, 19 May 2026
 11:21:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511185817.686831-1-npache@redhat.com> <20260511185817.686831-4-npache@redhat.com>
 <4566170a-7e3d-49e4-baab-ba2790c198db@kernel.org>
In-Reply-To: <4566170a-7e3d-49e4-baab-ba2790c198db@kernel.org>
From: Nico Pache <npache@redhat.com>
Date: Tue, 19 May 2026 12:21:35 -0600
X-Gm-Features: AVHnY4L4MNLuHeolsP-TGGRMvsoQWuP6zfUselEJ0zRNjehB522kQizaPVIyv5w
Message-ID: <CAA1CXcCD5ooRJonAVp2LvnoCrQwcs1-NsAYomXbHTVNSe5X0cw@mail.gmail.com>
Subject: Re: [PATCH mm-unstable v17 03/14] mm/khugepaged: rework max_ptes_*
 handling with helper functions
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-trace-kernel@vger.kernel.org, aarcange@redhat.com, 
	akpm@linux-foundation.org, anshuman.khandual@arm.com, apopple@nvidia.com, 
	baohua@kernel.org, baolin.wang@linux.alibaba.com, byungchul@sk.com, 
	catalin.marinas@arm.com, cl@gentwo.org, corbet@lwn.net, 
	dave.hansen@linux.intel.com, dev.jain@arm.com, gourry@gourry.net, 
	hannes@cmpxchg.org, hughd@google.com, jack@suse.cz, jackmanb@google.com, 
	jannh@google.com, jglisse@google.com, joshua.hahnjy@gmail.com, kas@kernel.org, 
	lance.yang@linux.dev, liam@infradead.org, ljs@kernel.org, 
	mathieu.desnoyers@efficios.com, matthew.brost@intel.com, mhiramat@kernel.org, 
	mhocko@suse.com, peterx@redhat.com, pfalcato@suse.de, rakie.kim@sk.com, 
	raquini@redhat.com, rdunlap@infradead.org, richard.weiyang@gmail.com, 
	rientjes@google.com, rostedt@goodmis.org, rppt@kernel.org, 
	ryan.roberts@arm.com, shivankg@amd.com, sunnanyong@huawei.com, 
	surenb@google.com, thomas.hellstrom@linux.intel.com, tiwai@suse.de, 
	usamaarif642@gmail.com, vbabka@suse.cz, vishal.moola@gmail.com, 
	wangkefeng.wang@huawei.com, will@kernel.org, willy@infradead.org, 
	yang@os.amperecomputing.com, ying.huang@linux.alibaba.com, ziy@nvidia.com, 
	zokeefe@google.com, Usama Arif <usama.arif@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 12, 2026 at 1:30=E2=80=AFAM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> On 5/11/26 20:58, Nico Pache wrote:
> > The following cleanup reworks all the max_ptes_* handling into helper
> > functions. This increases the code readability and will later be used t=
o
> > implement the mTHP handling of these variables.
> >
> > With these changes we abstract all the madvise_collapse() special casin=
g
> > (dont respect the sysctls) away from the functions that utilize them. A=
nd
> > will be used later in this series to cleanly restrict the mTHP collapse
> > behavior.
> >
> > No functional change is intended; however, we are now only reading the
> > sysfs variables once per scan, whereas before these variables were bein=
g
> > read on each loop iteration.
> >
> > Suggested-by: David Hildenbrand <david@kernel.org>
> > Acked-by: David Hildenbrand (Arm) <david@kernel.org>
>
> Some nits when re-reading:
>
> > Acked-by: Usama Arif <usama.arif@linux.dev>
> > Signed-off-by: Nico Pache <npache@redhat.com>
> > ---
> >  mm/khugepaged.c | 118 +++++++++++++++++++++++++++++++++---------------
> >  1 file changed, 82 insertions(+), 36 deletions(-)
> >
> > diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> > index f0e29d5c7b1f..f68853b3caa7 100644
> > --- a/mm/khugepaged.c
> > +++ b/mm/khugepaged.c
> > @@ -348,6 +348,62 @@ static bool pte_none_or_zero(pte_t pte)
> >       return pte_present(pte) && is_zero_pfn(pte_pfn(pte));
> >  }
> >
> > +/**
> > + * collapse_max_ptes_none - Calculate maximum allowed none-page or zer=
o-page
>
> I know, it's painful, but ...
>
> There is no "none-page".

Yeah I think you mentioned that last review... sorry!

>
> Calculate maximum allowed empty PTEs or PTEs mapping the shared zeropage =
... ?
>
> > + * PTEs for the given collapse operation.
>
> We usually indent here (second line of subject), I think. Same applies to=
 the
> other doc below.

Hmm tbh I couldn't find a example of what you meant here. There are
some that put a space between the first sentence and the @ list.

>
> > + * @cc: The collapse control struct
> > + * @vma: The vma to check for userfaultfd
> > + *
> > + * Return: Maximum number of none-page or zero-page PTEs allowed for t=
he
> > + * collapse operation.
>
> Same here.
>
> > + */
> > +static unsigned int collapse_max_ptes_none(struct collapse_control *cc=
,
> > +             struct vm_area_struct *vma)
> > +{
> > +     // If the vma is userfaultfd-armed, allow no none-page or zero-pa=
ge PTEs.
>
> Lance commented on the comment style.
>
> Is this comment really required? It's pretty self-documenting already.

Dropped it, thanks.

>
> > +     if (vma && userfaultfd_armed(vma))
> > +             return 0;
> > +     // for MADV_COLLAPSE, allow any none-page or zero-page PTEs.
> > +     if (!cc->is_khugepaged)
> > +             return HPAGE_PMD_NR;
> > +     // For all other cases repect the user defined maximum.
> > +     return khugepaged_max_ptes_none;
> > +}
> > +
> --
> Cheers,
>
> David
>

