Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1201527CCF2
	for <linux-doc@vger.kernel.org>; Fri, 12 Sep 2025 23:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757720136; cv=none; b=DYs1Xl8u56Z6cl3gt4sOJyCfc0fx0feyk9s7L+t5yVzgegyVgVn39c3dgBCIup6AMdAh4DrLWNN1B0JLCbq8rJgviJpgRdAujE6Itln/zMSBaBFUVgZ4QxXJ92+NH6iiS2ZdZSZZtu7RaudOOLoLG4bhXH94BXSvq43LTtgkp7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757720136; c=relaxed/simple;
	bh=HPCu1pwVM4Drx10GdaCY7ng58mnQe58dpSzFUAkQI+A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=clhSK8EyZ6/8v/VP5D9K36HWd79DV4zvGWb9Q7JROpA9p+x3P5jPymX9I4PirWPSYLFVRa/XZ6yOtxZxgMuSChMn5MoSrjfhzH8uP5a6zngO4YiSDeD62r498vFGraRRyFMqS3g5P9PogF5M9JXaBUtVX/LTe+cJZTuiaCUDriw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ScTQ65BQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ScTQ65BQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757720134;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HPCu1pwVM4Drx10GdaCY7ng58mnQe58dpSzFUAkQI+A=;
	b=ScTQ65BQwwRj/Z5fI8iKcxH2hBZRQ3XNLOAYgWZr7KYBUWk1c+XwBOS57vv+oQ7l8RaDSG
	hxJ9w8njRSGtKzTeEl+pm8VNRK92WIVLwX0CApIn/iX9X2kexB2iYembG5C+ERsBrzyMvX
	4uFh9ZlvxPBbvPG3Z3YDz4LyTQO4gLc=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-191-RIb_3DP4OIa7dYqAL1AABg-1; Fri, 12 Sep 2025 19:35:33 -0400
X-MC-Unique: RIb_3DP4OIa7dYqAL1AABg-1
X-Mimecast-MFC-AGG-ID: RIb_3DP4OIa7dYqAL1AABg_1757720132
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-7216c46b069so25867747b3.1
        for <linux-doc@vger.kernel.org>; Fri, 12 Sep 2025 16:35:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757720132; x=1758324932;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HPCu1pwVM4Drx10GdaCY7ng58mnQe58dpSzFUAkQI+A=;
        b=s4qBDVrsUhzMjmBIeUTQedNflIy+sbi9S3gHq3bzmKhB7D7CNQ+P/rjTIBtRaQH+gP
         9eHkF+X28HV2p3Yre7PnIX51+MYAYU876VfqImvva2oAkFkL2EaZ9TpnHf9EkkzjF03p
         tLUTXKVGk8PGrdBS6vjUVtn39KaxLMhf/3lIvRHsfds8QC9w9Es8T8LUmvpAZzUH9lUU
         A7f0hRCzSWpg2LQokmiBDjWhf600o0zeKjOr5Ic9bUEUT/KPvQCfxb1ahnYJ8A2mSzwf
         32MFKW6Xk6/2oOwe6/BlV/Vs7nmGOiARB00Hl8TVaA7H5yDdoqLSOwClJ2Zpo/uJdmvz
         A9bg==
X-Forwarded-Encrypted: i=1; AJvYcCUvbrfMcOhXM9HGqf04J4NUJe7vCxKv3WCBmes1i/YK7BdOXGSKvkiTctQnBi08zfxEThwM1X6pa48=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbuyTnwDVGOGOadAt4++36rqEFuYIpAQzRR5hi+34Z3RJtd/UA
	Kox1LLxowfpRB2703vtGQvaaviWHw5sOZ/3Xk5ljQmB/jcUTuCtwC5yH8gIR4F1FYvFSu6A+qDd
	fGG6HLulEvZIBT/Jn53eGJi7qkEGPyvW0et46LvSfmKwbx/rxmMhpvPz6AxRJRY6+AUPCwER79v
	S+CG7/5xyxHK0O7EGl2LRYAvYVS3hv+ldrgNYw
X-Gm-Gg: ASbGncvwFXj/ssge/hsq6Vd/NMaXbHNINBgyCdb0VS4RS86TImXk5mLt0RVuxW+XuGv
	OxmX1Oz7HYu14HVb8BvD8aW5khwggcbDpmSsA8V4zqPHfAuxBq7igFwN8trJXLYUHSdwJpwNQhC
	U7fDs1ws4zj6VOfL482LE/oJpLql7DGZY6v+Y=
X-Received: by 2002:a05:690c:6ac2:b0:729:677e:b7b with SMTP id 00721157ae682-73065fa0c40mr46615367b3.47.1757720132262;
        Fri, 12 Sep 2025 16:35:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFf6FRXt0puU/GkbiNMmkdOBMh3PmcUJa8ItdRIcV21DzC27xRjlQRyXSqK3+grheHlKb8t0P44+F+NVaC7sWY=
X-Received: by 2002:a05:690c:6ac2:b0:729:677e:b7b with SMTP id
 00721157ae682-73065fa0c40mr46614957b3.47.1757720131865; Fri, 12 Sep 2025
 16:35:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250912032810.197475-1-npache@redhat.com> <ppzgohmkll7dbf2aiwhw7f4spf6kxjtwwe3djkx26pwy4ekrnd@mgeantq5sn2z>
 <43f42d9d-f814-4b54-91a6-3073f7c7cedf@redhat.com>
In-Reply-To: <43f42d9d-f814-4b54-91a6-3073f7c7cedf@redhat.com>
From: Nico Pache <npache@redhat.com>
Date: Fri, 12 Sep 2025 17:35:05 -0600
X-Gm-Features: Ac12FXwW-JyuDr21ldb1iQAOW2JaSV_ia9I1rYO-9C_34jUWMMoQfpgn4vajl84
Message-ID: <CAA1CXcAenBm4=V1=-bXmruL85MfyqTXu5_-BmzGfOEaQ4z-Tdg@mail.gmail.com>
Subject: Re: [PATCH v11 00/15] khugepaged: mTHP support
To: David Hildenbrand <david@redhat.com>
Cc: Kiryl Shutsemau <kas@kernel.org>, linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	ziy@nvidia.com, baolin.wang@linux.alibaba.com, lorenzo.stoakes@oracle.com, 
	Liam.Howlett@oracle.com, ryan.roberts@arm.com, dev.jain@arm.com, 
	corbet@lwn.net, rostedt@goodmis.org, mhiramat@kernel.org, 
	mathieu.desnoyers@efficios.com, akpm@linux-foundation.org, baohua@kernel.org, 
	willy@infradead.org, peterx@redhat.com, wangkefeng.wang@huawei.com, 
	usamaarif642@gmail.com, sunnanyong@huawei.com, vishal.moola@gmail.com, 
	thomas.hellstrom@linux.intel.com, yang@os.amperecomputing.com, 
	aarcange@redhat.com, raquini@redhat.com, anshuman.khandual@arm.com, 
	catalin.marinas@arm.com, tiwai@suse.de, will@kernel.org, 
	dave.hansen@linux.intel.com, jack@suse.cz, cl@gentwo.org, jglisse@google.com, 
	surenb@google.com, zokeefe@google.com, hannes@cmpxchg.org, 
	rientjes@google.com, mhocko@suse.com, rdunlap@infradead.org, hughd@google.com, 
	richard.weiyang@gmail.com, lance.yang@linux.dev, vbabka@suse.cz, 
	rppt@kernel.org, jannh@google.com, pfalcato@suse.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 12, 2025 at 7:48=E2=80=AFAM David Hildenbrand <david@redhat.com=
> wrote:
>
> On 12.09.25 14:19, Kiryl Shutsemau wrote:
> > On Thu, Sep 11, 2025 at 09:27:55PM -0600, Nico Pache wrote:
> >> The following series provides khugepaged with the capability to collap=
se
> >> anonymous memory regions to mTHPs.
> >>
> >> To achieve this we generalize the khugepaged functions to no longer de=
pend
> >> on PMD_ORDER. Then during the PMD scan, we use a bitmap to track indiv=
idual
> >> pages that are occupied (!none/zero). After the PMD scan is done, we d=
o
> >> binary recursion on the bitmap to find the optimal mTHP sizes for the =
PMD
> >> range. The restriction on max_ptes_none is removed during the scan, to=
 make
> >> sure we account for the whole PMD range. When no mTHP size is enabled,=
 the
> >> legacy behavior of khugepaged is maintained. max_ptes_none will be sca=
led
> >> by the attempted collapse order to determine how full a mTHP must be t=
o be
> >> eligible for the collapse to occur. If a mTHP collapse is attempted, b=
ut
> >> contains swapped out, or shared pages, we don't perform the collapse. =
It is
> >> now also possible to collapse to mTHPs without requiring the PMD THP s=
ize
> >> to be enabled.
> >>
> >> When enabling (m)THP sizes, if max_ptes_none >=3D HPAGE_PMD_NR/2 (255 =
on
> >> 4K page size), it will be automatically capped to HPAGE_PMD_NR/2 - 1 f=
or
> >> mTHP collapses to prevent collapse "creep" behavior. This prevents
> >> constantly promoting mTHPs to the next available size, which would occ=
ur
> >> because a collapse introduces more non-zero pages that would satisfy t=
he
> >> promotion condition on subsequent scans.
> >
> > Hm. Maybe instead of capping at HPAGE_PMD_NR/2 - 1 we can count
> > all-zeros 4k as none_or_zero? It mirrors the logic of shrinker.
>
> BTW, I thought further about this and I agree: if we count zero-filled
> pages towards none_or_zero one we can avoid the "creep" problem.
>
> The scanning-for-zero part is rather nasty, though.
IIRC me and David have discussed this in the past and decided to avoid
this approach at the moment because it would be complicated and
"nasty".
>
> --
> Cheers
>
> David / dhildenb
>

