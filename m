Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0578A288C22
	for <linux-doc@vger.kernel.org>; Thu, 21 Aug 2025 15:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755789975; cv=none; b=GHs85W8zLVGyj/PA1avySxX1a1i6KBDbOgwTzkApKujmrxqocAa0wUETZ78b/CUelBDPDsvTDVg5/Ol21VQkV/DwRQynTbvuEeBTzl2kt+DeLzf8Cjq53R71izF3Tso5XPt1AoB0WMICnV6GfZRSUXO99bNjMwAhJXoiaP2WUdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755789975; c=relaxed/simple;
	bh=8moJCROeW1MwwauO6xq63NCG7+noaOTOnQ79nf4Lx80=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o0UzLSk23+X3oQ2fYf1AdGm0rabsMhPZBiGtnKlWk3YZD9q1M5X3q6ZErMrEphSZuuwe5JL8Gf+VyMwvlScQaPvYKtYdrT610W6Zpg+yUWUf2pEkJUEwWO3oG3JNsf8Hrm4j1ivPRlyuDkBU+YfvGhFfdSsdu8m3HSWDM9Ye+So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=isd4oSbU; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="isd4oSbU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755789973;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JEKkDobB8vwmnFpvY8PoyUMJCycz91A8IkaT8DFK9XU=;
	b=isd4oSbUQ2eOJtdlFjc2+UuEe835BYwS3mhNuY/ZR3LhZJ7Q+3Mh6OI1ae/dEQp1qfaOEy
	seFibby5cCktyEVQcYl6r6q/SYmIQRf8k7hmGpIfD4KgburUG2STdUXOhv9ep9tAlvwBH3
	53kujZZjh2Sd8jr+GDsupt01G8zwhW4=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-88-EkVUGFLXMZKh95Uqwcdc9g-1; Thu, 21 Aug 2025 11:26:10 -0400
X-MC-Unique: EkVUGFLXMZKh95Uqwcdc9g-1
X-Mimecast-MFC-AGG-ID: EkVUGFLXMZKh95Uqwcdc9g_1755789969
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-71f9ee9670eso17381897b3.2
        for <linux-doc@vger.kernel.org>; Thu, 21 Aug 2025 08:26:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755789969; x=1756394769;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JEKkDobB8vwmnFpvY8PoyUMJCycz91A8IkaT8DFK9XU=;
        b=CHyS+quJUvQDx/IKiMbbWa3ibKpEfonREPMJbQxvCuuwsUb8KpV675+F798EDR4YuO
         QhNt0qEEtkaUFffYw4q3b+lle5dWdS+OSxRd6Z16Zcf2twIgJBcPLcAwpbj/kHwbSb2c
         MCrkNtgot5oUr0/cttiEhRs1DPC/kWCZE+XymboXr8nJe5R+R1rgs9xmKSFXeb2PXrNn
         EWxvKJX499MRitZBCrnyVZzC89ifxHu110jU23/Jmm6eoc1mklcwUPVSVrp1Z13QNJ3a
         uGwBVNIpillkpoa+Nh3MEJxRvbLnKdQ1r0/tjXdy6eyf8XFp25e4loMyLf+18hcZKEPR
         PgFw==
X-Forwarded-Encrypted: i=1; AJvYcCUmAXB6u8qLpC4sklS6MEStWxp9jTj2ma8qfIOMp78xkZh9SjWLAoJh0tvDJx06CnTkprYCahqucuU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsGHbOi2T7QtwO/y6BGqOcph4SLn1Gy6Q8wP7G+ZdARgdsOdJo
	ctSUVB4PQFGTHURospIitiRMZztrtDsoydB7ta2zqahSTklhmCVHso4RkvZC7XLZ2yKbMhcOk4N
	zkeLG2A+fys5d5KAPjr0gRs/K2AYNtP8T9pkMVDC9yfs6QaxNjfqReQKaMZMIijzBGYHun8kxwl
	lULIrSG2epfD4VEjMwvTLZ5JVyt6Kyy1eFOKh9
X-Gm-Gg: ASbGncvb6x12uaTOeSig/COcAifWTN62Gdi9+KXx/bar6TJSe5nUodmzKfLdBtRtuaN
	muXWRMVuJ1n6W9hQ3AMCnYqGuxbxFYTXpen/+FiC98dFgohhkhwE/La+S1Pms9jFvLWBE5HGKmb
	wrLgp7fJ5kgEs769uFBi8dI0k=
X-Received: by 2002:a05:6902:100b:b0:e93:b92c:ee20 with SMTP id 3f1490d57ef6-e95088e66fdmr2698983276.6.1755789969212;
        Thu, 21 Aug 2025 08:26:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEA0f6PQCn0aQQ73DO5x40Ev9z93mEJijQRhHTNYum23X09DqH0vh6LBZKUrLyYzx7jARY0Uu5ScQ6B+4yOKuI=
X-Received: by 2002:a05:6902:100b:b0:e93:b92c:ee20 with SMTP id
 3f1490d57ef6-e95088e66fdmr2698871276.6.1755789968301; Thu, 21 Aug 2025
 08:26:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250819134205.622806-1-npache@redhat.com> <e971c7e0-70f0-4ce0-b288-4b581e8c15d3@lucifer.local>
 <38b37195-28c8-4471-bd06-951083118efd@arm.com> <0d9c6088-536b-4d7a-8f75-9be5f0faa86f@lucifer.local>
In-Reply-To: <0d9c6088-536b-4d7a-8f75-9be5f0faa86f@lucifer.local>
From: Nico Pache <npache@redhat.com>
Date: Thu, 21 Aug 2025 09:25:42 -0600
X-Gm-Features: Ac12FXxfRB0-YWz05cxs6Jud7daM5CQrb2gQwUVzVsT0dS5nUzi2PQuSgYs9--g
Message-ID: <CAA1CXcCqhFoGBvFK-ox2sJw7QHaFt+-Lw09BDYsAGKg4qc8nSw@mail.gmail.com>
Subject: Re: [PATCH v10 00/13] khugepaged: mTHP support
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Dev Jain <dev.jain@arm.com>, linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	david@redhat.com, ziy@nvidia.com, baolin.wang@linux.alibaba.com, 
	Liam.Howlett@oracle.com, ryan.roberts@arm.com, corbet@lwn.net, 
	rostedt@goodmis.org, mhiramat@kernel.org, mathieu.desnoyers@efficios.com, 
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

On Thu, Aug 21, 2025 at 9:20=E2=80=AFAM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> On Thu, Aug 21, 2025 at 08:43:18PM +0530, Dev Jain wrote:
> >
> > On 21/08/25 8:31 pm, Lorenzo Stoakes wrote:
> > > OK so I noticed in patch 13/13 (!) where you change the documentation=
 that you
> > > essentially state that the whole method used to determine the ratio o=
f PTEs to
> > > collapse to mTHP is broken:
> > >
> > >     khugepaged uses max_ptes_none scaled to the order of the enabled
> > >     mTHP size to determine collapses. When using mTHPs it's recommend=
ed
> > >     to set max_ptes_none low-- ideally less than HPAGE_PMD_NR / 2 (25=
5
> > >     on 4k page size). This will prevent undesired "creep" behavior th=
at
> > >     leads to continuously collapsing to the largest mTHP size; when w=
e
> > >     collapse, we are bringing in new non-zero pages that will, on a
> > >     subsequent scan, cause the max_ptes_none check of the +1 order to
> > >     always be satisfied. By limiting this to less than half the curre=
nt
> > >     order, we make sure we don't cause this feedback
> > >     loop. max_ptes_shared and max_ptes_swap have no effect when
> > >     collapsing to a mTHP, and mTHP collapse will fail on shared or
> > >     swapped out pages.
> > >
> > > This seems to me to suggest that using
> > > /sys/kernel/mm/transparent_hugepage/khugepaged/max_ptes_none as some =
means
> > > of establishing a 'ratio' to do this calculation is fundamentally fla=
wed.
> > >
> > > So surely we ought to introduce a new sysfs tunable for this? Perhaps
> > >
> > > /sys/kernel/mm/transparent_hugepage/khugepaged/mthp_max_ptes_none_rat=
io
> > >
> > > Or something like this?
> > >
> > > It's already questionable that we are taking a value that is expresse=
d
> > > essentially in terms of PTE entries per PMD and then use it implicitl=
y to
> > > determine the ratio for mTHP, but to then say 'oh but the default val=
ue is
> > > known-broken' is just a blocker for the series in my opinion.
> > >
> > > This really has to be done a different way I think.
> > >
> > > Cheers, Lorenzo
> >
> > FWIW this was my version of the documentation patch:
> > https://lore.kernel.org/all/20250211111326.14295-18-dev.jain@arm.com/
> >
> > The discussion about the creep problem started here:
> > https://lore.kernel.org/all/7098654a-776d-413b-8aca-28f811620df7@arm.co=
m/
> >
> > and the discussion continuing here:
> > https://lore.kernel.org/all/37375ace-5601-4d6c-9dac-d1c8268698e9@redhat=
.com/
> >
> > ending with a summary I gave here:
> > https://lore.kernel.org/all/8114d47b-b383-4d6e-ab65-a0e88b99c873@arm.co=
m/
> >
> > This should help you with the context.
> >
> >
>
> Thanks and I"ll have a look, but this series is unmergeable with a broken
> default in
> /sys/kernel/mm/transparent_hugepage/khugepaged/mthp_max_ptes_none_ratio
> sorry.
>
> We need to have a new tunable as far as I can tell. I also find the use o=
f
> this PMD-specific value as an arbitrary way of expressing a ratio pretty
> gross.
The first thing that comes to mind is that we can pin max_ptes_none to
255 if it exceeds 255. It's worth noting that the issue occurs only
for adjacently enabled mTHP sizes.

ie)
if order!=3DHPAGE_PMD_ORDER && khugepaged_max_ptes_none > 255
      temp_max_ptes_none =3D 255;
>
> Thanks, Lorenzo
>

