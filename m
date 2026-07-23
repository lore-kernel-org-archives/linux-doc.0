Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E8739021A
	for <linux-doc@vger.kernel.org>; Thu, 23 Jul 2026 04:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784782224; cv=none; b=Vk1fL9yoaX5Dq+KEyQvnfm9f3Q1Y9tyCWiMFkVMlGedfPJWhtbOaNxdwk6ZUuPA7o+9LHq8geswXHalcpccTrdr7Optky5vrk0kHxmtUPfS/ChwBYmir1DxBDW6oOtaT8FyAM9INyuxmbH+nrsIq+GakW3s2cxlx6L9H00Fe4cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784782224; c=relaxed/simple;
	bh=E+cpWopRVy09H2bWejgERgJn6lvbqQwoLq2+MWhpjNY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C66mNnWNkHMrSrgfvAugCjjLUcYbB6gDS+ausfkDMs8moYcjdke6eyUUb5oH3233VYJ5aSYIpm56X7ApW4+LK4OLwrb2kIkwHrkwJGYKKHYBfc8Y7tHfhaqkI6idjnK9+IiwSxbLYTgjAVZIJREtLuvCbqB5hdMHA2WG4Y2oBG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c3TtXXXx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c3TtXXXx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DBDF1F00A3E
	for <linux-doc@vger.kernel.org>; Thu, 23 Jul 2026 04:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784782215;
	bh=FMjWTfMQm24IrOQcAUu4P0m7ZHBvO4nfE0gC8fr+FUw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=c3TtXXXxgOh7VRfM52K0VmR5vE1o2eKgf4Xm6be9cEML5Avqd3k+5fqvJNeTV4YyY
	 ijL76+jKZkr+wSj8zCp1mByOn2eXdhiJDf8QL4zStjko+R5Yy2SxK+WD8IO2wDzMvk
	 nRqiXpkrETN/CcSjcJludz2R00lVVzRVKJLluyOYrymhUd219QEQPlqQFyEJjwGDmG
	 9W9Y3srfp5PYNVyKm4R3uKxTPGBxPDE8c1+nagvu7lfeG1gxu2uABWljAlBED3EsFb
	 /aA1oX3MXagIcGa0aO2SQXywVSnA5wpeA6opAlBPJldO6wLUAA4Z5q1PvP5FduPu0G
	 dVYyrVWaqQfYQ==
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-698beff7178so381508a12.3
        for <linux-doc@vger.kernel.org>; Wed, 22 Jul 2026 21:50:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqEGPAnehdg9PKShfdMtv0HvALxKGoGCfZ1Fv9bgsxYUyiZJYe7//FuB64m1B79fGsbujZbH2SxGaY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4xopkx4ar4VkEMs37Nu4LtDSR68aqFT+469EPwBKltnMrH1tY
	yh5LxV/5hV43vOi6+/w+SLN1zsgHtMUxMa2hLBH4+vt03PIz6/7AeUlwAIbIW1fhvRDqCNQVuCN
	f6tYaJIUtYH0KrKUR6e2XE4ilbQYnP70=
X-Received: by 2002:a17:907:748:b0:c19:482d:a9ff with SMTP id
 a640c23a62f3a-c1c5092c602mr54121866b.49.1784782210562; Wed, 22 Jul 2026
 21:50:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260717085151.22822-1-jiahao.kernel@gmail.com>
 <20260717181839.c94d0335ccef0084707d3d85@linux-foundation.org>
 <CAO9r8zOrXqsEaCEJUUAxbAhhN_OQb8ejogeUa6k8hX_JV8hxxw@mail.gmail.com>
 <20260717214031.8b22e9a37ea3b0c564b466f0@linux-foundation.org>
 <7dbde343-fbbf-6a1d-1785-ebf9f5a04f6b@gmail.com> <0a96b7ec-0d8d-2abd-afaa-739c562bc985@gmail.com>
In-Reply-To: <0a96b7ec-0d8d-2abd-afaa-739c562bc985@gmail.com>
From: Yosry Ahmed <yosry@kernel.org>
Date: Wed, 22 Jul 2026 21:49:58 -0700
X-Gmail-Original-Message-ID: <CAO9r8zO6AsdZZWoYibAj6urMxgM3eq4bg9JDhr443UZONPF_6Q@mail.gmail.com>
X-Gm-Features: AUfX_mzaNnM1ixKt0yQEanzxGLlbxq_UPtI0c8jx7a9Gq-UbW7nlyF7XYuZm9aU
Message-ID: <CAO9r8zO6AsdZZWoYibAj6urMxgM3eq4bg9JDhr443UZONPF_6Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] mm/zswap: Fixes and improves the zswap global shrinker
To: Hao Jia <jiahao.kernel@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, nphamcs@gmail.com, tj@kernel.org, 
	hannes@cmpxchg.org, shakeel.butt@linux.dev, mhocko@kernel.org, 
	mkoutny@suse.com, chengming.zhou@linux.dev, muchun.song@linux.dev, 
	roman.gushchin@linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Hao Jia <jiahao1@lixiang.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 22, 2026 at 6:21=E2=80=AFPM Hao Jia <jiahao.kernel@gmail.com> w=
rote:
>
>
>
> On 2026/7/20 09:26, Hao Jia wrote:
> >
> >
> > On 2026/7/18 12:40, Andrew Morton wrote:
> >> On Fri, 17 Jul 2026 18:28:04 -0700 Yosry Ahmed <yosry@kernel.org> wrot=
e:
> >>
> >>>>
> >>>> The [1/2] changelog lacks a description of how the flaw impacts user=
s.
> >>>> Please describe this fully and maintain that info within the
> >>>> changelogging.  This info helps -stable maintainers and others
> >>>> understand why we're proposing a backport and helps myself and other=
s
> >>>> with timing decisions.
> >>>
> >>> The first line in the changelog should be sufficient imo: "Zswap
> >>> writeback on hitting the pool limit is broken when memory cgroup is
> >>> disabled"
> >>
> >> "broken"?  Perhaps this means "fails to occur".
> >>
> >> But what is the userspace-visible impact?  IOW, why are we proposing a
> >> backport?
> >>
> >
> > Perhaps the first paragraph of the commit1 message could be modified as
> > follows? I have added a description of the issues that occur without
> > this patch.
> >
>
> Hi Andrew, Yosry, and Nhat,
> Any thoughts on this change?

I would front load the user impact in the first paragraph:

Zswap writeback when the global pool limit is hit fails when memory
cgroups are disabled. The pool remains full until it is organically
drained by swapins or memory freeing, leading to zswap store failures
and pages bypassing getting written directly to the backing swap device,
causing LRU inversion (hotter pages with higher fault latency).

...
