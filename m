Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69E6274678
	for <linux-doc@vger.kernel.org>; Mon, 28 Apr 2025 14:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745852121; cv=none; b=VsHefTMHuEs5WZ5Eefj91e4E8iqHiWqHGH5i9EwAIxKqkEbENTO8gTAQbey8D2raFT9IBhc17sMCtmrd5Xgyz0T1s95z0sxDp6O5QerkVgG/kvm9zE3RTdVXT58yt81ubNDel/s6jHWfyTLx5Jc0y0R3A160aEIbojuidqbBXHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745852121; c=relaxed/simple;
	bh=tQKS6ESMU4XqVh1loYK5WinArQ9UR2bn/2B7Gb7Oafo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aYXuGm+mcjbNfzCw/eoary1CUr8z78uyxeH7ghVLDJY6BMJkIErbaEAxN9zdxGcTvy5NKcsQ1CJoZXMWzQ7hVYW90YJnbzJQ5gQaZ1EJFSjUbTBXDVeCk0FKT5T2REZm7rKX5c+yX4xF1h+xcwY/eLbecsJf/Q6d1zneZfP08yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FdZDzXXR; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FdZDzXXR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745852118;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y35svQEUNVinLjrbig+h/RI+A+7BGDLM2oykyzI/Jak=;
	b=FdZDzXXR0GNYc+v3lGRRYfTP/na4iCKsykUMzux6tW8vXWEAL5xWqU7v1V8BUy2MqdVOag
	LIw4kVCfpgwoZr7ETbtHW9wTfr+9KSPK0miqNKTD5Kb+ct8yt52w56YVZ6RF9q3v4X1FS9
	OIxHCHNdHm6FsJ59XGaFQ+7DU9ljAV0=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-418-KMBegOFQN6GU7oAKvMCjyg-1; Mon, 28 Apr 2025 10:55:17 -0400
X-MC-Unique: KMBegOFQN6GU7oAKvMCjyg-1
X-Mimecast-MFC-AGG-ID: KMBegOFQN6GU7oAKvMCjyg_1745852115
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-7040773fd79so64733097b3.0
        for <linux-doc@vger.kernel.org>; Mon, 28 Apr 2025 07:55:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745852115; x=1746456915;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y35svQEUNVinLjrbig+h/RI+A+7BGDLM2oykyzI/Jak=;
        b=WYfkA/D1J2IhJ2FOZ7XMwepeKeRxh7LTD5L+JKyAoGDg1+XFW+cfyTkMWB8rdqudhc
         wQMbnJ5fNL49V7m/WfolUUDyejJ3xww/QrgUO+BcOZlrag0IA46rV++/Xr9PXjUVniNo
         FQ918UxckhCu3t40arIS4/WXQe3+2MJpof+49Rt6K89Nx1+dJxBJ4UgXyaoSAx9lLzm6
         VWSaXzFIuKnvw30pNK7/0LSUSMVcvapCMSH7e1B20ibEt3eMooQGDpIX9yIQmWL0cn0v
         8q5GU2+bu4aq6iLDZUb5SYi2g1do6RyVZnuYejCf69D/K1lhY5+WaVXaKrHoKcy9n2Wg
         r1xg==
X-Forwarded-Encrypted: i=1; AJvYcCVmPiUgeIHuBwFXbbDuaLZ4BSVuhzZdMCMY61OkKB6cTowKRWYnTzvOMKXzfpFHLWEqfBoOlo97eP4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxcahll9v2mN6itpeJUWtaxv4QD5ya2tobRWHEzqKkvpAy0S50X
	H7z0ugvADQJ/3ts+8WDsB4k2xteALk5hW+8scYTobsAaY0lIeZH7Zm+U2x4m0Jh+6rT1wFz2Lb2
	GjdDgo66rGAX71S2bDR3Il7Hre8SoFsX61KlKEejbhiBEtkODFdz55hw3cAo277sQd+2BwPPRNH
	1AfQkuMxLKUpmZLn/5WDIbSaK8zYvfwuoR
X-Gm-Gg: ASbGncu/FJUuzcXqyqqmnF6LJEnne+m3RIUYuB/zI55/cdtlQe5jDsK9JC+lAL/2NMp
	F9F2sDCXYlI9g5hkrp0dtlgNA9rruCyJu2yA2DlAivHceakNoY6d272CMBWITy5csCkCxadzi1e
	I/AOlH9f0=
X-Received: by 2002:a05:690c:39b:b0:708:1d15:e013 with SMTP id 00721157ae682-7089963f2cemr326197b3.7.1745852115084;
        Mon, 28 Apr 2025 07:55:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFmPzgoIcf2zjGWAfQJdt3FvqX6eeOCmgl+PxaPPQiwuCUtJ53kFcyZuTL8sqPiYecQmPEK1B0eYwqIXjEZnPg=
X-Received: by 2002:a05:690c:39b:b0:708:1d15:e013 with SMTP id
 00721157ae682-7089963f2cemr325477b3.7.1745852114651; Mon, 28 Apr 2025
 07:55:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250417000238.74567-1-npache@redhat.com> <20250417000238.74567-13-npache@redhat.com>
 <b22e222f-1d6a-4685-871c-1aaee319b744@gmail.com>
In-Reply-To: <b22e222f-1d6a-4685-871c-1aaee319b744@gmail.com>
From: Nico Pache <npache@redhat.com>
Date: Mon, 28 Apr 2025 08:54:47 -0600
X-Gm-Features: ATxdqUEM4Y4YSJdY2ZlnauGjTRYOP-E22W7On3YrDJ0KhY5tdri4FdTql7M6Xhs
Message-ID: <CAA1CXcBQ6G70Pg93XphsXAwwHtJPbFuJb=OmfwK2s3q3aevGuA@mail.gmail.com>
Subject: Re: [PATCH v4 12/12] Documentation: mm: update the admin guide for
 mTHP collapse
To: Usama Arif <usamaarif642@gmail.com>
Cc: linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	akpm@linux-foundation.org, corbet@lwn.net, rostedt@goodmis.org, 
	mhiramat@kernel.org, mathieu.desnoyers@efficios.com, david@redhat.com, 
	baohua@kernel.org, baolin.wang@linux.alibaba.com, ryan.roberts@arm.com, 
	willy@infradead.org, peterx@redhat.com, ziy@nvidia.com, 
	wangkefeng.wang@huawei.com, sunnanyong@huawei.com, vishal.moola@gmail.com, 
	thomas.hellstrom@linux.intel.com, yang@os.amperecomputing.com, 
	kirill.shutemov@linux.intel.com, aarcange@redhat.com, raquini@redhat.com, 
	dev.jain@arm.com, anshuman.khandual@arm.com, catalin.marinas@arm.com, 
	tiwai@suse.de, will@kernel.org, dave.hansen@linux.intel.com, jack@suse.cz, 
	cl@gentwo.org, jglisse@google.com, surenb@google.com, zokeefe@google.com, 
	hannes@cmpxchg.org, rientjes@google.com, mhocko@suse.com, 
	rdunlap@infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 24, 2025 at 9:04=E2=80=AFAM Usama Arif <usamaarif642@gmail.com>=
 wrote:
>
>
>
> On 17/04/2025 01:02, Nico Pache wrote:
> > Now that we can collapse to mTHPs lets update the admin guide to
> > reflect these changes and provide proper guidence on how to utilize it.
> >
> > Signed-off-by: Nico Pache <npache@redhat.com>
> > ---
> >  Documentation/admin-guide/mm/transhuge.rst | 10 +++++++++-
> >  1 file changed, 9 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/admin-guide/mm/transhuge.rst b/Documentation=
/admin-guide/mm/transhuge.rst
> > index dff8d5985f0f..06814e05e1d5 100644
> > --- a/Documentation/admin-guide/mm/transhuge.rst
> > +++ b/Documentation/admin-guide/mm/transhuge.rst
> > @@ -63,7 +63,7 @@ often.
> >  THP can be enabled system wide or restricted to certain tasks or even
> >  memory ranges inside task's address space. Unless THP is completely
> >  disabled, there is ``khugepaged`` daemon that scans memory and
> > -collapses sequences of basic pages into PMD-sized huge pages.
> > +collapses sequences of basic pages into huge pages.
> >
> >  The THP behaviour is controlled via :ref:`sysfs <thp_sysfs>`
> >  interface and using madvise(2) and prctl(2) system calls.
> > @@ -144,6 +144,14 @@ hugepage sizes have enabled=3D"never". If enabling=
 multiple hugepage
> >  sizes, the kernel will select the most appropriate enabled size for a
> >  given allocation.
> >
> > +khugepaged uses max_ptes_none scaled to the order of the enabled mTHP =
size to
> > +determine collapses. When using mTHPs it's recommended to set max_ptes=
_none
> > +low-- ideally less than HPAGE_PMD_NR / 2 (255 on 4k page size). This w=
ill
> > +prevent undesired "creep" behavior that leads to continuously collapsi=
ng to a
> > +larger mTHP size. max_ptes_shared and max_ptes_swap have no effect whe=
n
> > +collapsing to a mTHP, and mTHP collapse will fail on shared or swapped=
 out
> > +pages.
> > +
>
> Hi Nico,
>
> Could you add a bit more explanation of the creep behaviour here in docum=
entation.
> I remember you explained in one of the earlier versions that if more than=
 half of the
> collapsed mTHP is zero-filled, it for some reason becomes eligible for co=
llapsing to
> larger order, but if less than half is zero-filled its not eligible? I ca=
nt exactly
> remember what the reason was :) Would be good to have it documented more =
if possible.
Hi Usama,

You can think of the creep as a byproduct of introducing N new
non-zero pages to a N sized mTHP, essentially doubling the size. On a
second pass of this mTHP the same condition would be eligible, leading
to constant promotion to the next size. If we allow khugepaged to
double the size of mTHP, by introducing non-zero pages, it will keep
doubling.

I'll see how I can incorporate this description into the admin guide.

-- Nico
>
> Thanks
>
> >  It's also possible to limit defrag efforts in the VM to generate
> >  anonymous hugepages in case they're not immediately free to madvise
> >  regions or to never try to defrag memory and simply fallback to regula=
r
>

