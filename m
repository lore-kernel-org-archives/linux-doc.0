Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DADC2234970
	for <linux-doc@vger.kernel.org>; Mon, 17 Feb 2025 19:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739820321; cv=none; b=Mit56If7YP3T6Wvg5bYkbOTMJyi/sG6k8AllQsd183M9lsjlG7VIBJTpr0MniXwJh2r3dDwFQSsvXwE9fq6qU7+6vDQ0VYmbDdcZ4DW0L2rq0+C6lEklVt7GrV0exEK3FwUDbAgFoawx9p/7PURUq7et2dSgL8oDMDVrHXsoNZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739820321; c=relaxed/simple;
	bh=cWA7sKUdtTEsqml0tpOLDNxle82AACtVaehtyeywJXY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lRlx6gyhbAAGauxlEK/OjZLTjL+bIzf7p/31MWF9B5yPRBUIiSjr78S+kxtaAutiB8l6xw+NgeprBAk/vOZ6xCtAeh7Mz5/z4yPG1elhe2quwSz5XdxGtInNN5z0mGJhvF80AIDOwh09kigYqTOv2IFyk0mvBb8yzHhGH4J8+0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HIcO2wEf; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HIcO2wEf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739820318;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KT9RP2oMKPjgNG7H76kGM+F77TKCs0EEHFt347YegMQ=;
	b=HIcO2wEfnmIXv/MBjI2A76AJpYYvwpHGReoUUB1RcF0m4bP71btGxXh9PzkvdeBCtVqEcZ
	Kjl7NF3klRytrTlf/XCKmfTIKdJutb5VLVtpwe8sY8BVmMPLnpROyPY6kYZZP38MBLeJT1
	k61P5iWiJvDZacWPRqoUYEZnootYGro=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-462-LVw4sqi0McCqPuE4iq3fGA-1; Mon, 17 Feb 2025 14:25:17 -0500
X-MC-Unique: LVw4sqi0McCqPuE4iq3fGA-1
X-Mimecast-MFC-AGG-ID: LVw4sqi0McCqPuE4iq3fGA_1739820316
Received: by mail-yb1-f200.google.com with SMTP id 3f1490d57ef6-e5898d3cb18so7370217276.0
        for <linux-doc@vger.kernel.org>; Mon, 17 Feb 2025 11:25:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739820316; x=1740425116;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KT9RP2oMKPjgNG7H76kGM+F77TKCs0EEHFt347YegMQ=;
        b=cFIV5BR12bd9VPVAIMyx/lFo3N8hn6Q0vFEqtxnM4lIil7a9ngCMyL30YITzDRtdFt
         UgIbDq8dNPvCke4LdDfJghqk6akbwy+RNuW8tdKHkyW6zGA7DuKAYCbrSZ3HItwxM7PP
         PuunLY/58VBaHCUChqBsrSo25hPjzuY0pdrg+e/i7qfRqprFEvES83llI3TCJbzrAkPO
         ter4ggo5PZOOhlWCMgHLD9Q5eeVYDVQnVsTze35jxUJwLzevOFufemq583H3GlW6wVQZ
         Q6+JhHo06F78lFX2pJTo3oiDlnvqx5ddPZL0/9ZWgpldc6tQCSo5TtV9APTR6XkcxTPs
         gHxw==
X-Forwarded-Encrypted: i=1; AJvYcCV9wGAj+qUhZp2prX8M7Y7Cu27HkO00kAJQ+XS4ztwJxu3eRtFeiFYjEMlvHwZ4HhV84vv1NnITnfQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtaudCStrM5HNMiQZCUG/ewdU4Ja3EzaElVrPD5khNkoZfOgrn
	+sEmb4Q8nQSSBwVL1P3rNGBYJV8HzxAfXIv/Gapmddl1m3IqkF+5MJy8DGyfi7bq8O5mPR853Gs
	PNuI/RSbTxclInvI3fz6/qHPxCNLLgpHZg2tqCYQQqBrqBJ5vd3yTBLY9Qt61sGPZJte7taOjx2
	gZswX5h1J8IF8qnpHYOhcQIuj/hlFh7wG5
X-Gm-Gg: ASbGncvUnUZKlA69Xg8OKVAI0Tt8F/0KinjbizQnULBuqFBnM8MysTNxVtr8Zp9R75Q
	pZcQR+j47mwKMrvV1OmbmbWYxesJWC1MeNlS9AjDEBy/8kjG5daijW/qDf4eHIHFxABACpQ2b3i
	M=
X-Received: by 2002:a05:6902:120d:b0:e5d:f878:7b50 with SMTP id 3f1490d57ef6-e5df8787c7emr2021251276.23.1739820316609;
        Mon, 17 Feb 2025 11:25:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH7Qe5QzycrNb9QKTC0wgZIxUHrerzUiu11f7E3qUQAW/QjwcTNFBX+3lLbhYw3w99GE9kvpp8qxN+GpNe1iSw=
X-Received: by 2002:a05:6902:120d:b0:e5d:f878:7b50 with SMTP id
 3f1490d57ef6-e5df8787c7emr2021235276.23.1739820316328; Mon, 17 Feb 2025
 11:25:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250211004054.222931-1-npache@redhat.com> <20250211004054.222931-2-npache@redhat.com>
 <c4d7c1e0-e83b-4666-8bfb-1220b59251c2@gmail.com>
In-Reply-To: <c4d7c1e0-e83b-4666-8bfb-1220b59251c2@gmail.com>
From: Nico Pache <npache@redhat.com>
Date: Mon, 17 Feb 2025 12:24:50 -0700
X-Gm-Features: AWEUYZlXTbDyGUTQq_7TpVE0pYdfK9lEJauhIky2UmMOE2WpxTluduTbJgChv78
Message-ID: <CAA1CXcCg1EjY5fP=uR9EUpQtwXy1VJJEho8PA1VmG4E03tvBdg@mail.gmail.com>
Subject: Re: [RFC v2 1/5] mm: defer THP insertion to khugepaged
To: Usama Arif <usamaarif642@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, ryan.roberts@arm.com, 
	anshuman.khandual@arm.com, catalin.marinas@arm.com, cl@gentwo.org, 
	vbabka@suse.cz, mhocko@suse.com, apopple@nvidia.com, 
	dave.hansen@linux.intel.com, will@kernel.org, baohua@kernel.org, jack@suse.cz, 
	srivatsa@csail.mit.edu, haowenchao22@gmail.com, hughd@google.com, 
	aneesh.kumar@kernel.org, yang@os.amperecomputing.com, peterx@redhat.com, 
	ioworker0@gmail.com, wangkefeng.wang@huawei.com, ziy@nvidia.com, 
	jglisse@google.com, surenb@google.com, vishal.moola@gmail.com, 
	zokeefe@google.com, zhengqi.arch@bytedance.com, jhubbard@nvidia.com, 
	21cnbao@gmail.com, willy@infradead.org, kirill.shutemov@linux.intel.com, 
	david@redhat.com, aarcange@redhat.com, raquini@redhat.com, dev.jain@arm.com, 
	sunnanyong@huawei.com, audra@redhat.com, akpm@linux-foundation.org, 
	rostedt@goodmis.org, mathieu.desnoyers@efficios.com, tiwai@suse.de, 
	baolin.wang@linux.alibaba.com, corbet@lwn.net, shuah@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 17, 2025 at 7:59=E2=80=AFAM Usama Arif <usamaarif642@gmail.com>=
 wrote:
>
>
>
> On 11/02/2025 00:40, Nico Pache wrote:
> > setting /transparent_hugepages/enabled=3Dalways allows applications
> > to benefit from THPs without having to madvise. However, the pf handler
> > takes very few considerations to decide weather or not to actually use =
a
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
> > Signed-off-by: Nico Pache <npache@redhat.com>
> > ---
> >  include/linux/huge_mm.h | 15 +++++++++++++--
> >  mm/huge_memory.c        | 31 +++++++++++++++++++++++++++----
> >  2 files changed, 40 insertions(+), 6 deletions(-)
> >
> > diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
> > index 93e509b6c00e..fb381ca720ea 100644
> > --- a/include/linux/huge_mm.h
> > +++ b/include/linux/huge_mm.h
> > @@ -44,6 +44,7 @@ enum transparent_hugepage_flag {
> >       TRANSPARENT_HUGEPAGE_UNSUPPORTED,
> >       TRANSPARENT_HUGEPAGE_FLAG,
> >       TRANSPARENT_HUGEPAGE_REQ_MADV_FLAG,
> > +     TRANSPARENT_HUGEPAGE_DEFER_PF_INST_FLAG,
>
> No strong preference, but maybe just TRANSPARENT_HUGEPAGE_DEFER_FLAG migh=
t be better?

Not a bad idea, TRANSPARENT_HUGEPAGE_DEFER_PF_INST_FLAG is pretty long!
>

