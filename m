Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C14521FF3E
	for <linux-doc@vger.kernel.org>; Fri, 18 Jul 2025 22:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752878111; cv=none; b=hyGRkU6q92nwQYqs/W628aswmStBciGgfo3B/A5nKlipXFXYSeKH6bjoGuOcw2nJnYbwjVDb8FL80he+igkwbRtUKEsYtGaiD+hGRjPqH/msamoVDdHupJh+Tb3OvKkqtDzeU/SLOz7iGhkQRujYHsjqdMK7gzQa4GA58xMRA+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752878111; c=relaxed/simple;
	bh=tkPTSQAd9h2DNl7pRHlG+8OmpNzmu5y8PbLNUmZaSpk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lcPdGLGTOa8LwWhpkNxBLSpIPiKt2c3MTqR2vdDeB2+aU1d2Cyh2GNXA0QjHU1tmDmTSPnrsLlBkoKCmpAWzKA7jTu9CwRmibG6wEGvAKF/EFrHI1Sq5g1ugVQbwZu2wS301BaRQLeGXWtaLYZ+7mREOydVxuhwS4+p220ROuvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HUGBRMlC; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HUGBRMlC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752878108;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MeNgxF5UCBfEjQZZt/3dunIhv4OxleQp/vJtVa2lu7w=;
	b=HUGBRMlCCvBJy//AKU6OvHH23iZ9rOFU3ndmrSw/LJR9Jghz0ao+f8CLqeVvgOOGjkSm1Q
	krfCrMmzbbj0fsyj6Ekl30gGJ38wTw2vJfoYDyLSs5/zWvjWTpXOzfL2xqn1Md0xHlagMn
	mQEp3yhNpdv0mSNCbRNxO50OOaps1o0=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-151-8Df7vmL4NZKwcWgvfhZa6Q-1; Fri, 18 Jul 2025 18:35:07 -0400
X-MC-Unique: 8Df7vmL4NZKwcWgvfhZa6Q-1
X-Mimecast-MFC-AGG-ID: 8Df7vmL4NZKwcWgvfhZa6Q_1752878106
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-70e649662deso32417147b3.2
        for <linux-doc@vger.kernel.org>; Fri, 18 Jul 2025 15:35:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752878106; x=1753482906;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MeNgxF5UCBfEjQZZt/3dunIhv4OxleQp/vJtVa2lu7w=;
        b=Xw1d12dABWMEEZWAbGGkrdXDhMaCQ89Zk7t44jUFEJDXuYg+rk35GcRURwhfARu5R6
         Om37zsruVBALQOhNusc5KJ9AgIa2uyduwC5GEIhNNy7+u1eUC7IOtZFf8H6vJIsVqgK4
         1jE/AD772SMMxcSsKJnjhmVrlB5NC4iLFKA6NTf3waYRkWP120Z50NGh0ad+Fc5hBRa3
         RR5IXytKyxaJlyVcHHLTHeOPZZqSSABZRW+o4Hv9Ac3z0ODsb0qdh+XeHL+zPWBzIAL8
         zF7waem/g/xASOKTRtwoVCtjC4b8iNqfkeIktW5+0JdaaqeLhoYn8aTwdGEtIfedFv9d
         puyA==
X-Forwarded-Encrypted: i=1; AJvYcCWAk1aiKYNIKCIB3siVGX8WrGCPbR77NQUWgVWWWxgnn0BJbmULDX6FnPgjpMdB1yVz3ez44tF4Qkc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzsk5jNmElxyKWuAfqmwiduNUn63JAWA0x64doUHOmcmGWAjUj9
	Zd771P7fPOtNGomrTtL+4ECj0djUR84qtpGbpzhKuBRUSrrq6rr39mMM5lG4+LNWlspsTZX78Is
	oZmC4et+82xvnMmlbmh2uChmqKDKGvEn4KzD0MwqMMClRcFlhqztHXUaigAbOMOXcngZyLffcSU
	KhwJukIPo01pW2f1KIiLV+kqVz+h6e4adGvUg+
X-Gm-Gg: ASbGncsC0Hevn6Z0KyBGOrYoaI9SAoMCjhR6e48b24Ngo/NjlbuvJCb2qetIASxrYXx
	uSevVYLxWwoHHMEH7pQH5SiFR3ucsl9Wp0ryxsMqq25xBRw83oZydNNm9MV2ol0Az12LLo9Nd7S
	9GdiyTDEJMTgKGC+JMwnj9KDw=
X-Received: by 2002:a05:690c:3381:b0:710:f39f:4d43 with SMTP id 00721157ae682-718370eebf5mr151641047b3.7.1752878106484;
        Fri, 18 Jul 2025 15:35:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtDqNhAwLC/pZ0SZYm/yFdraL0W/1wyk988LFZ3cFbmaM2zMi6HIsy7NS2kuQoOaJh3+sk3INvjvbsCfYcvCw=
X-Received: by 2002:a05:690c:3381:b0:710:f39f:4d43 with SMTP id
 00721157ae682-718370eebf5mr151640437b3.7.1752878105985; Fri, 18 Jul 2025
 15:35:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250714003207.113275-1-npache@redhat.com> <20250714003207.113275-10-npache@redhat.com>
 <85b2cfd8-4aeb-4e98-8065-b6594783de62@linux.alibaba.com>
In-Reply-To: <85b2cfd8-4aeb-4e98-8065-b6594783de62@linux.alibaba.com>
From: Nico Pache <npache@redhat.com>
Date: Fri, 18 Jul 2025 16:34:40 -0600
X-Gm-Features: Ac12FXxkomg9g29JxE95wSIPOgeRNYVw8gHZYEJGmZnbAnxw2JgSYGWV08AFQqU
Message-ID: <CAA1CXcCk5VTTs+cYtWSo_UC4eDBuUCa_2wrkiexDAS6HvvXiuA@mail.gmail.com>
Subject: Re: [PATCH v9 09/14] khugepaged: avoid unnecessary mTHP collapse attempts
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	david@redhat.com, ziy@nvidia.com, lorenzo.stoakes@oracle.com, 
	Liam.Howlett@oracle.com, ryan.roberts@arm.com, dev.jain@arm.com, 
	corbet@lwn.net, rostedt@goodmis.org, mhiramat@kernel.org, 
	mathieu.desnoyers@efficios.com, akpm@linux-foundation.org, baohua@kernel.org, 
	willy@infradead.org, peterx@redhat.com, wangkefeng.wang@huawei.com, 
	usamaarif642@gmail.com, sunnanyong@huawei.com, vishal.moola@gmail.com, 
	thomas.hellstrom@linux.intel.com, yang@os.amperecomputing.com, 
	kirill.shutemov@linux.intel.com, aarcange@redhat.com, raquini@redhat.com, 
	anshuman.khandual@arm.com, catalin.marinas@arm.com, tiwai@suse.de, 
	will@kernel.org, dave.hansen@linux.intel.com, jack@suse.cz, cl@gentwo.org, 
	jglisse@google.com, surenb@google.com, zokeefe@google.com, hannes@cmpxchg.org, 
	rientjes@google.com, mhocko@suse.com, rdunlap@infradead.org, hughd@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 17, 2025 at 8:15=E2=80=AFPM Baolin Wang
<baolin.wang@linux.alibaba.com> wrote:
>
>
>
> On 2025/7/14 08:32, Nico Pache wrote:
> > There are cases where, if an attempted collapse fails, all subsequent
> > orders are guaranteed to also fail. Avoid these collapse attempts by
> > bailing out early.
> >
> > Signed-off-by: Nico Pache <npache@redhat.com>
> > ---
> >   mm/khugepaged.c | 17 +++++++++++++++++
> >   1 file changed, 17 insertions(+)
> >
> > diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> > index a701d9f0f158..7a9c4edf0e23 100644
> > --- a/mm/khugepaged.c
> > +++ b/mm/khugepaged.c
> > @@ -1367,6 +1367,23 @@ static int collapse_scan_bitmap(struct mm_struct=
 *mm, unsigned long address,
> >                               collapsed +=3D (1 << order);
> >                               continue;
> >                       }
>
> After doing more testing, I think you need to add the following changes
> after patch 8.
>
> Because when collapsing mTHP, if we encounter a PTE-mapped large folio
> within the PMD range, we should continue scanning to complete that PMD,
> in case there is another mTHP that can be collapsed within that PMD range=
.
>
> +                       if (ret =3D=3D SCAN_PTE_MAPPED_HUGEPAGE)
> +                               continue;
Ah good call, this patch is meant to be an optimization to the formal
approach-- meaning there are cases where trying ('goto next') to
collapse to lower orders is pointless, but I didn't fully consider the
cases where trying the other items (sections of the PMD) in the stack
are viable (ie continue). I'm going to spend some time confirming all
the potential return values that can come from collapse_huge_page, and
which ones belong in each group (goto next, continue, break). This
will probably be turned into a switch statement.
>
> > +                     /*
> > +                      * Some ret values indicate all lower order will =
also
> > +                      * fail, dont trying to collapse smaller orders
> > +                      */
After reading this comment again, i realized it's rather confusing...
it makes it seem like these ret values are the ones that indicate that
we should not keep trying to collapse to smaller orders. I'll clean up
that comment too.
> > +                     if (ret =3D=3D SCAN_EXCEED_NONE_PTE ||
> > +                             ret =3D=3D SCAN_EXCEED_SWAP_PTE ||
> > +                             ret =3D=3D SCAN_EXCEED_SHARED_PTE ||
> > +                             ret =3D=3D SCAN_PTE_NON_PRESENT ||
> > +                             ret =3D=3D SCAN_PTE_UFFD_WP ||
> > +                             ret =3D=3D SCAN_ALLOC_HUGE_PAGE_FAIL ||
> > +                             ret =3D=3D SCAN_CGROUP_CHARGE_FAIL ||
> > +                             ret =3D=3D SCAN_COPY_MC ||
> > +                             ret =3D=3D SCAN_PAGE_LOCK ||
> > +                             ret =3D=3D SCAN_PAGE_COUNT)
> > +                             goto next;
> > +                     else
>
> Nit: the 'else' statement can be dropped.
>
> > +                             break;
> >               }
> >
> >   next:
While i'm at it i'll change this to next_order to be more clear.

Thank you !!
-- Nico
>

