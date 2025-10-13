Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8402C23BD1D
	for <linux-doc@vger.kernel.org>; Mon, 13 Oct 2025 13:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760360887; cv=none; b=K6+Aw1lUBD4Tpz9w75Xyp69egJN/DWjVQSL+06x3/uWphHxem0JGP/k0R5r8aOqA55wiOfTdhoWHXvh2xz+/YQzRO80TfaMqVIOxQWwIK1kB/pDe572PMeIdb10mFnDdQwIcYTs4s9IRlNDL+ZofmsUPjA3zAoKpnEGklzBqxts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760360887; c=relaxed/simple;
	bh=ezMBebfglcjXR4WCpqnRZyhjdDDfwSug2JivoEcwJSY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J/YQUAvVwssIv8KHhxld3Sx694dA6mZYZgQKhZBxCLEDUz1ipo3WF62l2tVoe+KpNEPBS7cfqyXx6Ozhfw8rLkZYjFxiwcjiULq6SJauTlK+5oc18JOoQHAKODRWOK6kObCDimD/r5u5tf360X8WFvhjzmwDYWK8cknlxRwMS+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MBOITBKe; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MBOITBKe"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-78f15d5846dso68603746d6.0
        for <linux-doc@vger.kernel.org>; Mon, 13 Oct 2025 06:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760360884; x=1760965684; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ezMBebfglcjXR4WCpqnRZyhjdDDfwSug2JivoEcwJSY=;
        b=MBOITBKexbSOM1l2106X0HN5/6DrJske9DpAXWrJIQUBgGvY0Ff2WoNwjHm0XlWKR+
         2eP7znYowh9OyVMblZd1hCNZQzxSp6eGw3xaz+N15vu4m4NO6EKfBy51hVFV1x0CpreP
         NoACA94PgSd9QVKMOjQtd1p1fqSC9J0+Kh7XrOxrDrJ3QCXSg/QVJuppIUNjCWadOblv
         8Woo4XWhEeyw7wKJj/1KT/xgutRjckc0WBNHUBRt9BjYf74rj1XDtjiWySJFuL7CSgkW
         onv+gnQjnrOpZCBqhtBkaGmjT+YykBD/4RNSMuu0x+gOAlWvR2FKMwar5MBrNqmZHvuC
         1W8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760360884; x=1760965684;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ezMBebfglcjXR4WCpqnRZyhjdDDfwSug2JivoEcwJSY=;
        b=eipqefujRql0YQ2sUhrk8YkPeDlpN8eu8B8VtPMS4IQKk/hWhRq51cIulKNoKNmMBL
         HdXkTXz1O9NIAyW86VpKYb5cY5jCttvpDIQp2fd48HFVadiFFLEhHutQ2nR7aC1bfGxA
         qWC/MlzvXawyxJYhhML3sJc6a276XjK4Op4hOlBqD98N5W/422k6RtC9E2fEX+sdZ6I9
         4C5+pYGUU1MV9gFKc3XkNrBadG8B2BNlSHeNJGl8YiipqMmpQPh3yedSb0jPYV5cM1t2
         d414VXytjoNgYQKYjBXF8QVI6IrjbDZQXw7xWuEV1mTXhRcWMrOg9b9A9M4Xyu2WLySI
         djiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSvjyRKPY948X86CgR8vZIw6McAO1ACbKxDtCUIicSqqCrACjo3hKhJtGBQTre+35NDL/ZrzpqN4Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgbfOyWU5wfsNMG6BaZCWQJhsMpT/lBSrYHfRxoaqIRjJkgFlL
	J6YEt7hkDxct6DuRqYg2f0e55+0iGkfJMbgg5ZyOe5B63C3pTGA4wKjHfK/CP7brjEC7pkxzF3l
	UCtszkop+4vLhA++rYbaXiX/rqiWNSxE=
X-Gm-Gg: ASbGncuEPJSsZPzaz/vOGbDt5tPwfQxXmawuuMFnpWBBkDMoYVY0AmrOUVQEmcj4jvA
	q81c75sGFrl9L5Gxl03Ty0mxfVkFMSqq2nq28HpmQUTvZX7aTHLTFl8Q2N1VKclq1S6cvGOha48
	Fo/v/p014EPdg/7OrNakzqn5nZSLyDhq6MdqbfultZ9q2IC7KO/6+rKHVgNn0OXKtFAWwwZo6lm
	gi2oEpU49FDQ88kGBsP2I6UqJZgT1GYoTRANQ==
X-Google-Smtp-Source: AGHT+IGm0oKxFc4T/QZjCy+NGutfmN3uHvswZSHDi9nqJU7JDX84TgvXkCDG/QBma6yTwwDWrVtFnLsmlV0W2zzJh/o=
X-Received: by 2002:a05:6214:f08:b0:7a9:3d3b:fe95 with SMTP id
 6a1803df08f44-87b2101d562mr345171496d6.19.1760360884347; Mon, 13 Oct 2025
 06:08:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250930055826.9810-1-laoar.shao@gmail.com> <20250930055826.9810-4-laoar.shao@gmail.com>
 <CAADnVQJtrJZOCWZKH498GBA8M0mYVztApk54mOEejs8Wr3nSiw@mail.gmail.com>
 <27e002e3-b39f-40f9-b095-52da0fbd0fc7@redhat.com> <CALOAHbBFNNXHdzp1zNuD530r9ZjpQF__wGWyAdR7oDLvemYSMw@mail.gmail.com>
 <7723a2c7-3750-44f7-9eb5-4ef64b64fbb8@redhat.com> <CALOAHbD_tRSyx1LXKfFrUriH6BcRS6Hw9N1=KddCJpgXH8vZug@mail.gmail.com>
 <96AE1C18-3833-4EB8-9145-202517331DF5@nvidia.com> <f743cfcd-2467-42c5-9a3c-3dceb6ff7aa8@redhat.com>
 <CALOAHbAY9sjG-M=nwWRdbp3_m2cx_YJCb7DToaXn-kHNV+A5Zg@mail.gmail.com>
 <129379f6-18c7-4d10-8241-8c6c5596d6d5@redhat.com> <CALOAHbD8ko104PEFHPYjvnhKL50XTtpbHL_ehTLCCwSX0HG3-A@mail.gmail.com>
 <3577f7fd-429a-49c5-973b-38174a67be15@redhat.com> <CALOAHbAeS2HzQN96UZNOCuME098=GvXBUh1P4UwUJr0U-bB5EQ@mail.gmail.com>
 <7176597b-006f-40ad-9421-860d80d7e696@redhat.com>
In-Reply-To: <7176597b-006f-40ad-9421-860d80d7e696@redhat.com>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Mon, 13 Oct 2025 21:07:27 +0800
X-Gm-Features: AS18NWCBr7_RxNHr1I-K75akWBIPcxKG4UcwhU5giQn6IEnh0jqmkdU7wZH1l1w
Message-ID: <CALOAHbDqP3fH2_4r+5_9D46qrFiaRYHYGzW7M-fwwt4_qW9Npw@mail.gmail.com>
Subject: Re: [PATCH v9 mm-new 03/11] mm: thp: add support for BPF based THP
 order selection
To: David Hildenbrand <david@redhat.com>
Cc: Tejun Heo <tj@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Zi Yan <ziy@nvidia.com>, 
	Alexei Starovoitov <alexei.starovoitov@gmail.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Andrew Morton <akpm@linux-foundation.org>, baolin.wang@linux.alibaba.com, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Liam Howlett <Liam.Howlett@oracle.com>, npache@redhat.com, 
	ryan.roberts@arm.com, dev.jain@arm.com, usamaarif642@gmail.com, 
	gutierrez.asier@huawei-partners.com, Matthew Wilcox <willy@infradead.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Amery Hung <ameryhung@gmail.com>, 
	David Rientjes <rientjes@google.com>, Jonathan Corbet <corbet@lwn.net>, 21cnbao@gmail.com, 
	Shakeel Butt <shakeel.butt@linux.dev>, lance.yang@linux.dev, 
	Randy Dunlap <rdunlap@infradead.org>, bpf <bpf@vger.kernel.org>, 
	linux-mm <linux-mm@kvack.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 13, 2025 at 8:42=E2=80=AFPM David Hildenbrand <david@redhat.com=
> wrote:
>
> >> I came to the same conclusion. At least it's a valid start.
> >>
> >> Maybe we would later want a global fallback BPF-THP prog if none was
> >> enabled for a specific MM.
> >
> > good idea. We can fallback to the global model when attaching pid 1.
> >
> >>
> >> But I would expect to start with a per MM way of doing it, it gives yo=
u
> >> way more flexibility in the long run.
> >
> > THP, such as shmem and file-backed THP, are shareable across multiple
> > processes and cgroups. If we allow different BPF-THP policies to be
> > applied to these shared resources, it could lead to policy
> > inconsistencies.
>
> Sure, but nothing new about that (e.g., VM_HUGEPAGE, VM_NOHUGEPAGE,
> PR_GET_THP_DISABLE).
>
> I'd expect that we focus on anon THP as the first step either way.
>
> Skimming over this series, anon memory seems to be the main focus.

Right, currently it is focusing on anon memory. In the next step it
will be extended to file-backed THP.

>
> > This would ultimately recreate a long-standing issue
> > in memcg, which still lacks a robust solution for this problem [0].
> >
> > This suggests that applying SCOPED policies to SHAREABLE memory may be
> > fundamentally flawed ;-)
>
> Yeah, shared memory is usually more tricky: see mempolicy handling for
> shmem. There, the policy is much rather glued to a file than to a process=
.

For shared THP we are planning to apply the THP policy based on vma->vm_fil=
e.

Consequently, the existing BPF-THP policies, which are scoped to a
process or cgroup, are incompatible with shared THP. This raises the
question of how to effectively scope policies for shared memory. While
one option is to key the policy to the file structure, this may not be
ideal as it could lead to considerable implementation and maintenance
challenges...

--=20
Regards
Yafang
