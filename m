Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA36E391E7B
	for <linux-doc@vger.kernel.org>; Sat, 26 Sep 2026 18:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790447912; cv=none; b=FyyNTe2PIo41TLnZrcEqV2FDQrq1QHzhLPbbQDlPmcqsVdySpvsAKfA/1ie+X8X1opE5JUQnYk1RsblgzCyMOkk6Yu7FAUh/fV7tQopOKpTnlemSLpezlgOy788qxYM1agGI5Cfx2QOVuny8/QpW8MrWMI+6lI4ajzyiV+YvD08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790447912; c=relaxed/simple;
	bh=v5qWPwPmptIgOUMB5CFuulpDfvjtsgXAwWcBMYCtwUA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mbii/Ali67Mwb5kYIQHuc4si8Cx9vtyQFg5ZEcfCFcPjwOJLocZXqZsUUc9zohOI3KRSDWufIQwJyxSS30Iv8SJrz2JqQ8oyeU3lTzmBf+AhqYzmiZyWkc78wHlVGeM+dX72RP2VtMFhsNDiJcCU6ZGK738q7KxyFqzmKARiZW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ImjYr6KW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ImjYr6KW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB3C31F008A0
	for <linux-doc@vger.kernel.org>; Sat, 26 Sep 2026 18:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790447906;
	bh=8Qra4Hs5x0GhjkOw3qaqLENUU09DmiBO0O2Kq1ZFdXw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ImjYr6KWkSyPQ4rlvfLe+oHVVH86pZLK9aLsIg9azoZyZlYAAwPElsU6pZat/DVER
	 LLAsswB8AU24MVKAFLYYJ0yOT4TcSfgxCbiYJV84s/9LhweVKZcNEQDpVS6/j8gTRb
	 6tseNMbpwlf7J4a448aM3ciWmKQHnXYb4/kHa4WfzfbcqjI+7QKHcPvgIRJyb7x8Wg
	 OGNvueKkE1FHG/m/mofCfnbN3CkROy4YNExbCcBSHXOTdSQg4SVk/bMrn3FamcQMzd
	 xKRJN1S5jEDy8sAoPNnaTknKr4Rl/N6Myldu662gw06+VA670gf/Yih5SnKPvxYJC0
	 pECx3ecvnUENg==
Received: by mail-ej2-f41.google.com with SMTP id a640c23a62f3a-c2dc50c6edfso27320966b.1
        for <linux-doc@vger.kernel.org>; Sat, 26 Sep 2026 11:38:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByKzuhhgszXMATLUoXbQnxlILEWjkN870qW8z5I4Q9pntelh9MjKYesJLuw/J90qTRVDA3XxjfNDNI=@vger.kernel.org
X-Gm-Message-State: AFuF++m0qWbNBzvmcQUHwqap3AHHtxioI0YFRBL5UwH9lGJhIqA9X5nF
	HLkfEIbX8n9EYM+TvCU/JSloCRek6QC5azPtxhC1FU/eHsDmdA15N/Yhpqt0C5A0Z+q+06kEqEd
	7M4cEfglv0zZwVC5NWV6l4IDupOMW3rFRs8t+N9ixig==
X-Received: by 2002:a17:906:f588:b0:c2a:ad55:b3fa with SMTP id
 a640c23a62f3a-c2ac22db042mr757145966b.7.1790447905700; Sat, 26 Sep 2026
 11:38:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918180241.3424851-1-nphamcs@gmail.com> <20260918180241.3424851-2-nphamcs@gmail.com>
 <CACePvbVaDNspMDSw_qAcapKAzXj3JGV-KMYmow7aePa0POHpSg@mail.gmail.com>
 <7571f005bca65aa4ad5e7ec89e62801ad058b689.camel@surriel.com>
 <CACePvbV-tazW=LmsbUtAhHzR2d6JwFT5R1jYZ9_NTp1hxXH=bw@mail.gmail.com> <a30eb60221cda2fe726a86c2c6f859f71fc7a46d.camel@surriel.com>
In-Reply-To: <a30eb60221cda2fe726a86c2c6f859f71fc7a46d.camel@surriel.com>
From: Chris Li <chrisl@kernel.org>
Date: Sat, 26 Sep 2026 08:38:13 -1000
X-Gmail-Original-Message-ID: <CACePvbVd8uE5mwPX8T95zbURhhXxO2zbRETziJcGwQs3tOLEng@mail.gmail.com>
X-Gm-Features: AclHuK-N2jo4ZJ9-ufy2a2NhRahWQY5CCHBUKvfMp6i2GWnJxoh5F1ffpf_MpB0
Message-ID: <CACePvbVd8uE5mwPX8T95zbURhhXxO2zbRETziJcGwQs3tOLEng@mail.gmail.com>
Subject: Re: [PATCH v5 01/11] mm, swap: add virtual swap device infrastructure
To: Rik van Riel <riel@surriel.com>
Cc: Nhat Pham <nphamcs@gmail.com>, akpm@linux-foundation.org, kasong@tencent.com, 
	hannes@cmpxchg.org, mhocko@kernel.org, roman.gushchin@linux.dev, 
	shakeel.butt@linux.dev, yosry@kernel.org, david@kernel.org, 
	muchun.song@linux.dev, shikemeng@huaweicloud.com, baoquan.he@linux.dev, 
	baohua@kernel.org, youngjun.park@lge.com, chengming.zhou@linux.dev, 
	ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, 
	surenb@google.com, qi.zheng@linux.dev, axelrasmussen@google.com, 
	yuanchu@google.com, weixugc@google.com, gourry@gourry.net, 
	haowenchao22@gmail.com, corbet@lwn.net, hughd@google.com, 
	baolin.wang@linux.alibaba.com, tj@kernel.org, mkoutny@suse.com, 
	skhan@linuxfoundation.org, kunwu.chan@linux.dev, kernel-team@meta.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	cgroups@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 3:24=E2=80=AFPM Rik van Riel <riel@surriel.com> wro=
te:
>
> On Thu, 2026-09-24 at 15:17 -1000, Chris Li wrote:
> > On Thu, Sep 24, 2026 at 8:13=E2=80=AFAM Rik van Riel <riel@surriel.com>
> > wrote:
> > >
> > > On Tue, 2026-09-22 at 23:18 -1000, Chris Li wrote:
> > > > On Fri, Sep 18, 2026 at 1:03=E2=80=AFPM Nhat Pham <nphamcs@gmail.co=
m>
> > > > wrote:
> > > > >
> > > > >
> > > > > @@ -482,6 +491,11 @@ void swap_read_folio(struct swap_io_ctx
> > > > > *ctx,
> > > > > struct folio *folio)
> > > > >         if (zswap_load(folio) !=3D -ENOENT)
> > > > >                 goto finish;
> > > > >
> > > > > +       if (unlikely(swap_is_vswap(sis))) {
> > > >
> > > > There are too many swap_is_vswap() in this series. It fragments
> > > > the
> > > > code path, making things harder to reason about. Esepcially
> > > > around
> > > > locks. I count 22 in this patch alone.
> > > >
> > > > I consider this the biggest drawback of this series. This
> > > > fragmentation of the code path.
> > >
> > > Could we avoid that by simply always having everything
> > > go through the vswap abstraction layer?
> >
> > Yes, but it will pay the price for going through the unnecessary
> > redirection layer always. It incurs performance and meta data
> > overhead. That was one of my previous objections to the earlier vswap
> > version. Sorry I enjoy micro optimization too much, that is both my
> > strength and weakness.
>
> We really only have two cases here, don't we?
>
> Either the data is in the swap cache, and
> the vswap layer can directly look up the
> swap cache page.
>
> Or the data is in some slower back-end,
> and doing a second lookup is not going to
> introduce noticeable overhead.
>
> If the micro optimization come at the cost
> of less flexibility, and harder to maintain
> code, are they really worth it?

In this case, yes. Because there is an alternative that can both keep
code complexity down, perform well, keep metadata small, and be
flexible.

>
> >
> > > Handling the details of what's behind the vswap would
> > > be handled one layer down.
> > >
> > > Chris, do you think that would be cleaner?
> >
> > If it can wrap below the swap_ops, it is just priviate inernal dedail
> > of implementing its own indirections. That would be much cleaner.
> > That
> > is what I am trying to pitch to Nhat in prevoius email but does not
> > have following actions.
> >
> Can you sketch out the details of what you
> think that should look like?
>
> What would the data structures look like?
>
> What operations should there be at the
> abstraction layer, and at the swap layers
> below?
>
> How should migration of data from one swap
> backend to another be handled?
>
> At this point the best way to make progress
> would be to hash out those details.
>
> If you are unhappy with what you have seen
> from others, what does your ideal design
> look like?

Those are very good questions for the people who want to take that
path. I can work that person to figure those out. It will  not be me
just handing out all the answers.

Chris
