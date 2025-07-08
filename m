Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2885D1E5705
	for <linux-doc@vger.kernel.org>; Tue,  8 Jul 2025 04:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751949381; cv=none; b=mQ0X22H6O5lW9o/rFoj7zeGY5cmVaglLybnX6xdzObRS3b/5vH5gH2e/luinbFWU1Cz4FgV/VYdOLwlM8fTb2Y4IQWSpmPwwrcC0NCFRMuFJxE0i3iibMNpTh+LSLk++iD+0l49PfACSb/oNeM4B3p/7rdKEVYJiamqh1C3RmQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751949381; c=relaxed/simple;
	bh=qTGDTcV1p5tJ6HcYmAwz71WaZ4eMKofozyVLBQsC9D0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j/uHrcAgEpIdX7/JaV/s6XM1R9gyDMz0LgGtujvVdHe5p8fcl2DtWTURGFk2M2GRf3LMfgJdli+SynC7y7SscXgHvP7N+HliXJy8W15TeJgBCDbClncSbxsXzllR4TWMVaAErHCT6h2ula0ZeSja6WGyXmDa1jRF7KVEdG3Ku+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QqLhnA5l; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QqLhnA5l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751949379;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qTGDTcV1p5tJ6HcYmAwz71WaZ4eMKofozyVLBQsC9D0=;
	b=QqLhnA5lE2DYtJ3mWyGO24Rp2+Bd1tSPNQdWTg0/g/rX5OEauyPRHWtt3NxL6RnETNrbgJ
	YWysWOilX9J/nrmqb5eDe/ev1FWeG6oMySykQDLIX32+EKFltERKpiQN3HfO1V0D8we1o7
	bBFgVTdraqoKfyaha4/csDBiNhcoJTo=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-649-JJjXf6deNB2CpymFmiGtFQ-1; Tue, 08 Jul 2025 00:36:15 -0400
X-MC-Unique: JJjXf6deNB2CpymFmiGtFQ-1
X-Mimecast-MFC-AGG-ID: JJjXf6deNB2CpymFmiGtFQ_1751949375
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-70e73d3c474so56662017b3.3
        for <linux-doc@vger.kernel.org>; Mon, 07 Jul 2025 21:36:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751949375; x=1752554175;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qTGDTcV1p5tJ6HcYmAwz71WaZ4eMKofozyVLBQsC9D0=;
        b=iibEi7u47IlmgiRm5dZjvRHkgTrYVwWc29GrAwqwbg/KJkbMq9PSiBIfZei5D2kmX+
         72m8dECu1QaK9g1jNu9rntSODEZg1wVOtWjguWpuHspAixeZwCBXmsX9iW5nwhIBI4pf
         OpzeR4KCHkXRFv1xSwauKNcmmoUG2idlhDGSYIQ10m9xWOyXnCePd02SLx8BxFIhlPXh
         Yc57lc6Bv4jJh8VECjdp35G8yh8ewWkYex3eDR1qsUnjJT3iKCHIQWyo/P5tgvWLHwHZ
         TuGGTKvFjOh70uxaPff85cv5i1FnX4M5jEGl/zjbmR6vBQ5mrPvhDFg1syKpKLjxVyd1
         bCSA==
X-Forwarded-Encrypted: i=1; AJvYcCW0cyavUcEJrMpSl8HwGYJgvZO9KDO/OEJBnJX4LYUKyOfXlT7q6wssshQfxhi3+MJHexU6zZU5ZAc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWN798gMMjEQWlRQkeGR44bQcVe9mR98TQHm3EihOLsjiEyDju
	a1DGFyrzxoG4dNlcWJQsXs4F3nnZ9apidOqQ6udH2yBzgxanPkETcTWi9QEGo2PXHktH20S9FIe
	SdvnBGTNaH08o0qRnNa12P5SdhDZamLbF74oW3h7h8XJGVXcq8jZy9BO/lCrEeLLsLaPge9OGj3
	8MM4KdX/wdoFfLnYRm2FBKZzcPMbb1ImyfJpwf
X-Gm-Gg: ASbGncuSq8cpEyn4Z82ljxuzajzfmTtAUf+sRJAuZ+9lKEuDgHYBGv9U8W9aEB0QY3r
	1aVoikEi4+zrkebev18mfZhHFq7O3RHLy3PXfnqqXLFAWU9J2LJTzWXo0u6SLVBFki47jgBr/pK
	UjGJVTjQ==
X-Received: by 2002:a05:690c:30d:b0:709:197d:5d3c with SMTP id 00721157ae682-7166b5f6bcfmr211917747b3.11.1751949374986;
        Mon, 07 Jul 2025 21:36:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKjtH9W0tf3+AELmduA3IzT90z5Tmph6a1WdgnqS7MTd4DhLb5IlYzFbZ5iH11uL+3BnBYuaaRvKhebjyrKfY=
X-Received: by 2002:a05:690c:30d:b0:709:197d:5d3c with SMTP id
 00721157ae682-7166b5f6bcfmr211917397b3.11.1751949374622; Mon, 07 Jul 2025
 21:36:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250702055742.102808-1-npache@redhat.com> <20250702055742.102808-2-npache@redhat.com>
 <9076b4be-8b1d-4434-a72f-d7a829a1a30a@arm.com>
In-Reply-To: <9076b4be-8b1d-4434-a72f-d7a829a1a30a@arm.com>
From: Nico Pache <npache@redhat.com>
Date: Mon, 7 Jul 2025 22:35:48 -0600
X-Gm-Features: Ac12FXyKLeWcmAZn58XkB9-ZGx40IFZEQjeJRnPXwLLAOKV8sSiI_4SNmYsKQgM
Message-ID: <CAA1CXcDuR60EajhvSgGiwbNwTNiVi9-Pv6usSnnQWRC4ND9Vww@mail.gmail.com>
Subject: Re: [PATCH v8 01/15] khugepaged: rename hpage_collapse_* to khugepaged_*
To: Dev Jain <dev.jain@arm.com>
Cc: linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	david@redhat.com, ziy@nvidia.com, baolin.wang@linux.alibaba.com, 
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, ryan.roberts@arm.com, 
	corbet@lwn.net, rostedt@goodmis.org, mhiramat@kernel.org, 
	mathieu.desnoyers@efficios.com, akpm@linux-foundation.org, baohua@kernel.org, 
	willy@infradead.org, peterx@redhat.com, wangkefeng.wang@huawei.com, 
	usamaarif642@gmail.com, sunnanyong@huawei.com, vishal.moola@gmail.com, 
	thomas.hellstrom@linux.intel.com, yang@os.amperecomputing.com, 
	kirill.shutemov@linux.intel.com, aarcange@redhat.com, raquini@redhat.com, 
	anshuman.khandual@arm.com, catalin.marinas@arm.com, tiwai@suse.de, 
	will@kernel.org, dave.hansen@linux.intel.com, jack@suse.cz, cl@gentwo.org, 
	jglisse@google.com, surenb@google.com, zokeefe@google.com, hannes@cmpxchg.org, 
	rientjes@google.com, mhocko@suse.com, rdunlap@infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 3, 2025 at 11:14=E2=80=AFPM Dev Jain <dev.jain@arm.com> wrote:
>
>
> On 02/07/25 11:27 am, Nico Pache wrote:
> > functions in khugepaged.c use a mix of hpage_collapse and khugepaged
> > as the function prefix.
> >
> > rename all of them to khugepaged to keep things consistent and slightly
> > shorten the function names.
> >
> > Reviewed-by: Zi Yan <ziy@nvidia.com>
> > Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> > Signed-off-by: Nico Pache <npache@redhat.com>
> > ---
> >
>
> You are essentially reverting commit 7d8faaf15545 which adds the
> hpage_collapse_ prefix. Since in the next patch you also unify
> madvise and khugepaged, removing hpage_collapse prefix would
> make sense, but then I tend to agree with Liam that dropping
> the prefix altogether is better. Having all the functions in
> khugepaged.c prefixed with khugepaged_ seems unnecessary work.
Ah thanks for pointing that out, I didn't realize they were already
once named khugepaged.

Makes sense, since there is opposition, and a good reason to have them
as hpage_collapse (or collapse) I'll consider either dropping this
patch, or changing it to "collapse_". tbh I didn't realize that was
what Liam was suggesting, I thought he was suggesting dropping the
hpage_collapse entirely.
>
> @David, I forgot where you replied but I remember you saying
> that we should not introduce MADV_COLLAPSE mTHP support for
> now?
Yeah Baolin pointed me to that thread
(https://lore.kernel.org/all/23b8ad10-cd1f-45df-a25c-78d01c8af44f@redhat.co=
m/)
I read most of that discussion as it was happening but missed that
point. I'll add the small change I need to drop the MADV_COLLAPSE
support and send a V9 in a few days (to gather more review).

Adding MADV_COLLAPSE support should be easy once/if we come to a
consensus on what the proper approach is.

Thanks,
-- Nico
>

