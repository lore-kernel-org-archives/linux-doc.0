Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB8D37CD4F
	for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 19:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779217382; cv=pass; b=GNTe/SR3JN1Il9LNjOmuK5aUcLh+5D3pjb0jamXHKHZTIUZI0Q1k4XtoFCZ+TDVYpI8sBxnJk69PdzCTbwGzbOVIBnsWZBOkyhWTEtRv+q4le20NaPiWWpUCaQlCJi49nieVBdBIfurG5kk0eMWTXNqmAlxuGa6VvFIWDVbO33w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779217382; c=relaxed/simple;
	bh=M/SnnbqoU4cRuxbwBYw5TcDVBwjkEi7HVMxFL8F6nEU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ATTmCKxKfPeXTz6iHmGyi5oU6ooKrwFG98GEHbSoCGm/UYedtty56I8GqmgOuPEF2XP1mtk/+6xMLr+/eD47+zPobLltEA3Hdy8mf0M26x/wSc6cjZpsC/ovs2zKoz825e2n5JrOUNmX+7aoOCTu+JS8VgJ+RHXyxt29WEwwf5c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WZiP1V2y; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=gt/Hgcac; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WZiP1V2y";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="gt/Hgcac"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779217380;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FVAA2tyy87o83ai/87dFFBv/pFOI8NrPweDff+Gjdvo=;
	b=WZiP1V2ygvGN42b6K6nkGwDvaAq8sPccXLvugT7jNVhfjvqbzWSYCNXCiYLnS3E0Pnsz1y
	T65B0xiBvm0zsm44QUohwDk7Kj9m2YzO5vQs9OLSfUnEsjTo5dKwmmL7feRdJlaT+979F6
	le0GuR6JsaJAUXb+8E3L3zrYfidlfw0=
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com
 [74.125.224.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-331-gTimcLd0OPCzPdlgdQxwAQ-1; Tue, 19 May 2026 15:02:59 -0400
X-MC-Unique: gTimcLd0OPCzPdlgdQxwAQ-1
X-Mimecast-MFC-AGG-ID: gTimcLd0OPCzPdlgdQxwAQ_1779217378
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-65db7715a7eso7856377d50.1
        for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 12:02:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779217378; cv=none;
        d=google.com; s=arc-20240605;
        b=TwFrxMbPqadPlBFwmL3LduTjoQzEwvQ/E7UOTxfkLgFMA+g4S0wWk3R8jL4+4b/zoz
         JWHlh6U2CiXgsyMe80Yr9jLkvlUX61oQV9ayNdRBL11+J3Xh+fRFT1zIb+sn51UHtxmJ
         77x4No3mp9frIM54j0ciAgAhzw95b14fPc41VKlIJutehJ5z6PDdTksQb3ie7kSbGUhI
         nxEd1vPZcXK0syPsQuMMV0WZprfNHtDhZBTZqTdq9NxbPYwPz8BIEN2o1szeJX7FC2Ch
         0N85DWSnzUCoGRnUywJuXGSTEWAN/N/nNMeWmEJ4T6KnP0Iygif9Y1+MlB3c7kga8tkD
         Z06g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FVAA2tyy87o83ai/87dFFBv/pFOI8NrPweDff+Gjdvo=;
        fh=58fo+3qZ+f7FmE1k0fR7TVhKQXBX4nKnUKbJHNqx4eU=;
        b=ChCod9ErT05rLMi47GPoGB501tm+hYfcIgTCC5H7TLzOkI/Q4/bWstYK0nC1yiMFz9
         hJTHRPnD7nPuXR8Y4KZoda7RzmkPmtvo/131suUi7yuinRZ2RcagTNTKrQfYZslNNrY1
         ROwEL4JEBHlS3F6cLfbuR2GnhqeunMm15zoE4KTFJuoDnwE+GU2bkHJNUEF8mpm8NROC
         EVUnsEaYAJIK0ctz8qmgEtBaEbRhL1iVKASeYu3AWWQVCsFFmJaNTfHxGJPCY8Klw91H
         aRNYKQcRQysZyH3optVTd4ILrVj70THCLUocXgvAB2muRRhXjRrl9IR4MWorhGpP3H+B
         YOGw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1779217378; x=1779822178; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FVAA2tyy87o83ai/87dFFBv/pFOI8NrPweDff+Gjdvo=;
        b=gt/HgcacEwpHqFYsrg3lovPGeSIdGMRIPB4UEZ+XOyXIG5HtUgoETNrKIW2T0QFCTe
         AZoyja7SLwVWD3OyPiYr7yoK0r3mA9syyp9Mad0jkDeQlALAS6kCeAwl4XDvWd1iGipN
         l0utKth1CO+fMNr2aJZ6WUYoL9vrODG8YWNycQo51ZKfAI5NsnrgimpiLs/nuQXpSg8+
         NAcwicqY+XFORsZQV1vw+v52CtEeJiVB1w5rPZwrS51jI8zqEpKa54F3/5Lvj5ClV5+s
         KBQgec4uafwIaphvbJ4qMu127FdZaMHI2e0S81eUQ17ZT3t0+T4+IA7wvHNxfJjZb8hu
         RadA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779217378; x=1779822178;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FVAA2tyy87o83ai/87dFFBv/pFOI8NrPweDff+Gjdvo=;
        b=JC8cee+y39wpln/wbcJnBWmqYTwt0Wmjid4ylfTuhRp4fTXMmzQ+5O9PxPTyIVQjHO
         QbvNxmA9mhD6w97LGpmnOpW27WiZeTCvnvJfkwKNlFQ83Fzjkw3yrXlXjlnGio6Chjx9
         YwmTvQaadBbJ7kY0YPFC/Bo7+q32BsIqIbYonM1Lall85YgHEIXXjljW+t5edVSqxlQp
         1NIQQZ9uQPbWg8YxoBUmzeGLJq/21vRSNwTBO7ni1kVBumk89GJgCYI54OH9cWpZfp0W
         nn/r2ssPEF9DbvxRdjWZ5MbTom5bY9Vzt07WP4dWTjZ3FJN0wupwFIXTZ39lSTH1WqHQ
         oapg==
X-Gm-Message-State: AOJu0Yz1pbLli1unvHniQJJyAgAfsXekzEJwTby3qEAM2F1kJdl56pSS
	1+jdct0DsLlwqnowIaGOQzkY618XUG78H4n8p5qMaZ1SKoO57b7+lMxBPl4jRqIh1afNeFgOtfc
	fWeRPmOnzPSEdTX6Tvd8LER6bSMHjR+fe1d881TR2Vsa4kHy7V86r1TS+kNAGCTYHMYVXXE8Y/f
	9Y8KYZCHb+h/GfrjBZQrtnh/CIT5kwryIJpBBr
X-Gm-Gg: Acq92OGGUIK3HaHMKrYzUB6rQR5Fq7wMxCjgn1nbOlhAfWld0d2uBGjSMcPY3ikLnqX
	9q7N1VH9tvWThjhcrIu0YP3rQmzlvu6Ubv5NBT1MfrKlPXl+OQ483K6QdUa09RwwEqoPK6Mj3/R
	uBmHLZ254K9ztm5jeH0ZBin/RIO2zeQeYXFvcDN3VJYh6TYjPsJ/EH74BFoTW2nHkmPSm1yJ6Z+
	KMfMQ==
X-Received: by 2002:a05:690e:1501:b0:650:38c4:9d80 with SMTP id 956f58d0204a3-65e22808b89mr19193859d50.35.1779217378243;
        Tue, 19 May 2026 12:02:58 -0700 (PDT)
X-Received: by 2002:a05:690e:1501:b0:650:38c4:9d80 with SMTP id
 956f58d0204a3-65e22808b89mr19193751d50.35.1779217377583; Tue, 19 May 2026
 12:02:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260518115553.3513034-1-usama.arif@linux.dev> <51db205d-77cf-416f-bfe5-fd9d0b12c433@linux.dev>
In-Reply-To: <51db205d-77cf-416f-bfe5-fd9d0b12c433@linux.dev>
From: Nico Pache <npache@redhat.com>
Date: Tue, 19 May 2026 13:03:23 -0600
X-Gm-Features: AVHnY4LOZz9hIpEKrtfLZuWF4c69rvSr03brNz_SdNAbFptVm56-2ZdU64Y6lF8
Message-ID: <CAA1CXcCTnEP85mdawwfxKVP4cRqC5wLCXe47kf6w7F5Qn2DEwg@mail.gmail.com>
Subject: Re: [PATCH mm-unstable v17 02/14] mm/khugepaged: generalize alloc_charge_folio()
To: Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-trace-kernel@vger.kernel.org, 
	akpm@linux-foundation.org, anshuman.khandual@arm.com, apopple@nvidia.com, 
	baohua@kernel.org, baolin.wang@linux.alibaba.com, byungchul@sk.com, 
	catalin.marinas@arm.com, cl@gentwo.org, corbet@lwn.net, 
	dave.hansen@linux.intel.com, david@kernel.org, dev.jain@arm.com, 
	gourry@gourry.net, hannes@cmpxchg.org, hughd@google.com, jack@suse.cz, 
	jackmanb@google.com, jannh@google.com, jglisse@google.com, 
	joshua.hahnjy@gmail.com, kas@kernel.org, liam@infradead.org, ljs@kernel.org, 
	mathieu.desnoyers@efficios.com, matthew.brost@intel.com, mhiramat@kernel.org, 
	mhocko@suse.com, peterx@redhat.com, pfalcato@suse.de, rakie.kim@sk.com, 
	raquini@redhat.com, rdunlap@infradead.org, richard.weiyang@gmail.com, 
	rientjes@google.com, rostedt@goodmis.org, rppt@kernel.org, 
	ryan.roberts@arm.com, shivankg@amd.com, sunnanyong@huawei.com, 
	surenb@google.com, thomas.hellstrom@linux.intel.com, tiwai@suse.de, 
	usamaarif642@gmail.com, vbabka@suse.cz, vishal.moola@gmail.com, 
	wangkefeng.wang@huawei.com, will@kernel.org, willy@infradead.org, 
	yang@os.amperecomputing.com, ying.huang@linux.alibaba.com, ziy@nvidia.com, 
	zokeefe@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 18, 2026 at 8:50=E2=80=AFAM Lance Yang <lance.yang@linux.dev> w=
rote:
>
>
>
> On 2026/5/18 19:55, Usama Arif wrote:
> [...]
> >> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> >> index 979885694351..f0e29d5c7b1f 100644
> >> --- a/mm/khugepaged.c
> >> +++ b/mm/khugepaged.c
> >> @@ -1068,21 +1068,26 @@ static enum scan_result __collapse_huge_page_s=
wapin(struct mm_struct *mm,
> >>   }
> >>
> >>   static enum scan_result alloc_charge_folio(struct folio **foliop, st=
ruct mm_struct *mm,
> >> -            struct collapse_control *cc)
> >> +            struct collapse_control *cc, unsigned int order)
> >>   {
> >>      gfp_t gfp =3D (cc->is_khugepaged ? alloc_hugepage_khugepaged_gfpm=
ask() :
> >>                   GFP_TRANSHUGE);
> >>      int node =3D collapse_find_target_node(cc);
> >>      struct folio *folio;
> >>
> >> -    folio =3D __folio_alloc(gfp, HPAGE_PMD_ORDER, node, &cc->alloc_nm=
ask);
> >> +    folio =3D __folio_alloc(gfp, order, node, &cc->alloc_nmask);
> >>      if (!folio) {
> >>              *foliop =3D NULL;
> >> -            count_vm_event(THP_COLLAPSE_ALLOC_FAILED);
> >> +            if (is_pmd_order(order))
> >> +                    count_vm_event(THP_COLLAPSE_ALLOC_FAILED);
> >> +            count_mthp_stat(order, MTHP_STAT_COLLAPSE_ALLOC_FAILED);
> >>              return SCAN_ALLOC_HUGE_PAGE_FAIL;
> >>      }
> >>
> >> -    count_vm_event(THP_COLLAPSE_ALLOC);
> >> +    if (is_pmd_order(order))
> >> +            count_vm_event(THP_COLLAPSE_ALLOC);
> >> +    count_mthp_stat(order, MTHP_STAT_COLLAPSE_ALLOC);
> >> +
> >
> > The vmstat THP_COLLAPSE_ALLOC counter is pmd order only.
> > But after this we have
> >
> >       count_memcg_folio_events(folio, THP_COLLAPSE_ALLOC, 1);
> >
> > which is not being guarded with is_pmd_order().
>
> Good catch!
>
> >
> > I think we want this to be pmd order only as well so that
> > the meaning of the vmstat and cgroup counter remains the same?
>
> Agreed. THP_COLLAPSE_ALLOC should remain PMD order only for
> vmstat and memcg events.
>
> So this should be guarded with is_pmd_order() as well :)

Thanks Usama, I added that.

>
> Cheers, Lance
>

