Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D513054D4
	for <linux-doc@vger.kernel.org>; Thu, 21 Aug 2025 15:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755790071; cv=none; b=hynTjpHHayyk7y45BNuXuUVqSkcKDcKCVb2kJ2FPGKAkn97CguDhdOs6Ofn8SxA+q7kJblfobRpf9sOHvymqx0O4CpaA7wwKO7uu86qE5odcC0V/Jx3iB98LxpxqVpRzOhl5IU7I9YFb6RSMYB1VkbCuIGkBPYXkEsnHuyUVxps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755790071; c=relaxed/simple;
	bh=Eyf6DeidULNnQGCkA+/IU+Rn3dkvyFy2QYD+Ym0aiIk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Usw7A5j5VRuRtNK4Krf3z3j7dMv5oUxgAw1p/etVvOJN7BT8636TWxtSU73saRq3mGXF66TRMORqzkindoP6vrQTiLaV7G/uiFMr1HOjc4aSlVPacsk3CzRSN+yc6XukDVUN+C36ka5CH8POPGP9KzbYyIKzJ7XcuFM3hrsapWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fcyS3MDc; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fcyS3MDc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755790068;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RTgtJ49Xu9MWkFK2EAlVwrx17FYOOV7VldaM8h9Pwt4=;
	b=fcyS3MDcH86b/VIUXvtM3XwWEKEJtJghTkZongf1nUoF8JtqRbIRrkJYKoBKDsuQ+vgrMg
	vDxZiqDsDeHOJgwQKOvoWd2shRSsC/o9zPOs2CdwMR6OHjnsn+6QOayomOtdy2sF6Khr1Z
	bnBcmZyY0IaMi867FXSQW0XzgA+Ay0Y=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-9-xMWF4SjCNYelsCm3U8G9pQ-1; Thu, 21 Aug 2025 11:27:47 -0400
X-MC-Unique: xMWF4SjCNYelsCm3U8G9pQ-1
X-Mimecast-MFC-AGG-ID: xMWF4SjCNYelsCm3U8G9pQ_1755790066
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-71d603c7e05so15932937b3.1
        for <linux-doc@vger.kernel.org>; Thu, 21 Aug 2025 08:27:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755790066; x=1756394866;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RTgtJ49Xu9MWkFK2EAlVwrx17FYOOV7VldaM8h9Pwt4=;
        b=m2PSOi+gQQ1ooYQ3DZa5mQua5ksDl5TnzN61byOUXS7k3WfF2OxBbRu05lhgh/GTE3
         tDVcAULLnDw5OcuieE93Rv0YeiaMb+CMbjd2kvMsRIqtyE/6Wo2Curup/RLzLVWFX7C9
         +xD5KW55WXPsjm/b/ozejvU22iLvgC5KBxtBqOY+cO2w/xPa9K4Eh4suv/a5z4tB1QGq
         BP2qwJZ44SAO/epO1IAetmUW1octIIaaD7tfgIqEjBNscnPFObGs2glqN5SEQqonoDVG
         oUQZw/Lv9pc8PKv7Z+l6D19racQ4Pp43z4teKPus3Ps/V3+ZkDGWT1+L4wz+nym406FQ
         aPlg==
X-Forwarded-Encrypted: i=1; AJvYcCVe+CPBtYrtuXWmDIUCfBooJZOTaNjYPKp/6ccWNu/2/6zmAZ1+LBjev8CELVVsNXIYDiA//W2ruyM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXkKzsRp9HCzSNSeErVUOsC3ddBaosV3LQanEJRwxOrxunixy6
	/MoMxqE8ASyk2pfX4R/wjY7hhxLzeuxFRJnloEHz70UUL9xKYRu12m2CJ6/GxZmaJcd36z+swix
	2HxLumnpRKvNg+EKWwuTBL8L0iPFO5JMRWvZIHXo86EAmhlP2vk7uTm9cssg1Pw07rEtbu0euAu
	u0kKFr0A/jEAdz6AIBMSCxX/8z+JvkdQSRgnt3
X-Gm-Gg: ASbGncsGN+mUZfUFUqImer2rSBH8QuVebIcDz53DjD1i+XvRE0htjfGc42edy2/Y1DO
	v7V0Sz1wgB8BQkaKenN4NUEz05+pGS1FbzmR1gSjcn3nywvQZ+zszuz9cox51GjWazpmf2A95ZM
	TZMCFnK5i7rPNw/dwSJHLgQ9o=
X-Received: by 2002:a05:690c:3606:b0:71f:c5f0:337b with SMTP id 00721157ae682-71fc88e8a3bmr32433387b3.1.1755790066420;
        Thu, 21 Aug 2025 08:27:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFc5TqILdLWzdl1VIfMGwn0VK5fkAbHYWIlUJd1eTuGNqYvohCQdcedJXpukc5CDWRWTZRM1EwqOto/rJviUU=
X-Received: by 2002:a05:690c:3606:b0:71f:c5f0:337b with SMTP id
 00721157ae682-71fc88e8a3bmr32432717b3.1.1755790065938; Thu, 21 Aug 2025
 08:27:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250819134205.622806-1-npache@redhat.com> <e971c7e0-70f0-4ce0-b288-4b581e8c15d3@lucifer.local>
 <38b37195-28c8-4471-bd06-951083118efd@arm.com> <0d9c6088-536b-4d7a-8f75-9be5f0faa86f@lucifer.local>
 <CAA1CXcCqhFoGBvFK-ox2sJw7QHaFt+-Lw09BDYsAGKg4qc8nSw@mail.gmail.com>
In-Reply-To: <CAA1CXcCqhFoGBvFK-ox2sJw7QHaFt+-Lw09BDYsAGKg4qc8nSw@mail.gmail.com>
From: Nico Pache <npache@redhat.com>
Date: Thu, 21 Aug 2025 09:27:19 -0600
X-Gm-Features: Ac12FXw32JsJSfHSBfYcPkLsEOjNfM5l-nBIkC40qTwdDNq4sNQAax1B3J0lGVw
Message-ID: <CAA1CXcAXTL811VJxqyL18CUw8FNek6ibPr6pKJ_7rfGn-ZU-1A@mail.gmail.com>
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

On Thu, Aug 21, 2025 at 9:25=E2=80=AFAM Nico Pache <npache@redhat.com> wrot=
e:
>
> On Thu, Aug 21, 2025 at 9:20=E2=80=AFAM Lorenzo Stoakes
> <lorenzo.stoakes@oracle.com> wrote:
> >
> > On Thu, Aug 21, 2025 at 08:43:18PM +0530, Dev Jain wrote:
> > >
> > > On 21/08/25 8:31 pm, Lorenzo Stoakes wrote:
> > > > OK so I noticed in patch 13/13 (!) where you change the documentati=
on that you
> > > > essentially state that the whole method used to determine the ratio=
 of PTEs to
> > > > collapse to mTHP is broken:
> > > >
> > > >     khugepaged uses max_ptes_none scaled to the order of the enable=
d
> > > >     mTHP size to determine collapses. When using mTHPs it's recomme=
nded
> > > >     to set max_ptes_none low-- ideally less than HPAGE_PMD_NR / 2 (=
255
> > > >     on 4k page size). This will prevent undesired "creep" behavior =
that
> > > >     leads to continuously collapsing to the largest mTHP size; when=
 we
> > > >     collapse, we are bringing in new non-zero pages that will, on a
> > > >     subsequent scan, cause the max_ptes_none check of the +1 order =
to
> > > >     always be satisfied. By limiting this to less than half the cur=
rent
> > > >     order, we make sure we don't cause this feedback
> > > >     loop. max_ptes_shared and max_ptes_swap have no effect when
> > > >     collapsing to a mTHP, and mTHP collapse will fail on shared or
> > > >     swapped out pages.
> > > >
> > > > This seems to me to suggest that using
> > > > /sys/kernel/mm/transparent_hugepage/khugepaged/max_ptes_none as som=
e means
> > > > of establishing a 'ratio' to do this calculation is fundamentally f=
lawed.
> > > >
> > > > So surely we ought to introduce a new sysfs tunable for this? Perha=
ps
> > > >
> > > > /sys/kernel/mm/transparent_hugepage/khugepaged/mthp_max_ptes_none_r=
atio
> > > >
> > > > Or something like this?
> > > >
> > > > It's already questionable that we are taking a value that is expres=
sed
> > > > essentially in terms of PTE entries per PMD and then use it implici=
tly to
> > > > determine the ratio for mTHP, but to then say 'oh but the default v=
alue is
> > > > known-broken' is just a blocker for the series in my opinion.
> > > >
> > > > This really has to be done a different way I think.
> > > >
> > > > Cheers, Lorenzo
> > >
> > > FWIW this was my version of the documentation patch:
> > > https://lore.kernel.org/all/20250211111326.14295-18-dev.jain@arm.com/
> > >
> > > The discussion about the creep problem started here:
> > > https://lore.kernel.org/all/7098654a-776d-413b-8aca-28f811620df7@arm.=
com/
> > >
> > > and the discussion continuing here:
> > > https://lore.kernel.org/all/37375ace-5601-4d6c-9dac-d1c8268698e9@redh=
at.com/
> > >
> > > ending with a summary I gave here:
> > > https://lore.kernel.org/all/8114d47b-b383-4d6e-ab65-a0e88b99c873@arm.=
com/
> > >
> > > This should help you with the context.
> > >
> > >
> >
> > Thanks and I"ll have a look, but this series is unmergeable with a brok=
en
> > default in
> > /sys/kernel/mm/transparent_hugepage/khugepaged/mthp_max_ptes_none_ratio
> > sorry.
> >
> > We need to have a new tunable as far as I can tell. I also find the use=
 of
> > this PMD-specific value as an arbitrary way of expressing a ratio prett=
y
> > gross.
> The first thing that comes to mind is that we can pin max_ptes_none to
> 255 if it exceeds 255. It's worth noting that the issue occurs only
> for adjacently enabled mTHP sizes.
>
> ie)
> if order!=3DHPAGE_PMD_ORDER && khugepaged_max_ptes_none > 255
>       temp_max_ptes_none =3D 255;
Oh and my second point, introducing a new tunable to control mTHP
collapse may become exceedingly complex from a tuning and code
management standpoint.
> >
> > Thanks, Lorenzo
> >

