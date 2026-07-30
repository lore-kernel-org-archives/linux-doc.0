Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2645397AF2
	for <linux-doc@vger.kernel.org>; Thu, 30 Jul 2026 16:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785430373; cv=none; b=XNSImoH1X3qQcsh3UwKPk8QPXQ7wioneiSj8aFTJD5QO5udbdXa1QnT/YO4u+WCcZrD6NTO/Wgx8VP3t2lsi5bfcBwsMTzF/m4JnSAyY7JQvs33M2WO744FQGmj4t2FQrEgGvmTpU9pN3tnpSj9wa+Lay8jW7a52K9vnnkZW4hQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785430373; c=relaxed/simple;
	bh=wKovt6ieQ/kZlIdf3vhaUzCJzrw5nLCXMEKKVCNQr3M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L30WA01i1l1W/eJVBMscAFcSWHK6RQjc+h4IPTZgOEfGmpsUDaE3mUXQGlS0BlkkNp/hRqdNLdOfm74QqRYs+Kmes64rRHs67f3kSv6Z7lzR4QVZ5krdoXyvqo2f1pvPy4ZN5PHawIjJ2aJTBGga1aT6FlIc0a4z3A4A7qo8yLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LSCYA78S; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LSCYA78S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 969CC1F00ADE
	for <linux-doc@vger.kernel.org>; Thu, 30 Jul 2026 16:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785430371;
	bh=hIPWuoCXtPq/jgTe42IUcZ06BVyrHgB+kF/1iTPh0+E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=LSCYA78SYvAyoOTZjZDkiXV+tGoKEfjO3NVXLGdO45PpHtOjomixkOskw2L4BGb4Z
	 Nf+P83U9ZWy9Jdx/hSPWvkvgBIiRp4AeeshYePlea8N31W6UXxIcHBO5D1kA8ystl7
	 MpvY3t4uTzuqGbp2LfjH7y1xWoQLBaXl1oVZB+n50F8kUnu8qejNTbGMa4q3dAZeV9
	 uS6o74al/w0Ng1884BwL/WaYuK7r9QmdC/49rmBVCUohHY3Y0x0YvIHjuUGMcnOFkI
	 WmbFt2qdpfyairWXpFnfiVJgKkBPmxucp7zYvLyuWmbz/zN3BCn2yonfjZ9a0wOQoM
	 pPtMbHujc67iA==
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c1677c91969so277706966b.1
        for <linux-doc@vger.kernel.org>; Thu, 30 Jul 2026 09:52:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rp2sU4BKmMmB3Qbtc1KfCa/HnVaLYVarUCUxY4WBUqYANi30KxAHeYsyZAYOm4XCETp8FZu4259MLk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yws9XmiBWkgsjb3vVM2JMKpqil00QcFCCq7KDgmA4qNlWHVQYaU
	rt49cjH41Ory5yNLHtKplM3N7KxPI9MD+G2nvH4A3jZTtMweJuurlXNhvxA+QDAkID3Pwumd46e
	7rdHkSCLdxYGmWltSlx/JnRGROu7XJSY=
X-Received: by 2002:a17:907:7241:b0:c12:528a:94f4 with SMTP id
 a640c23a62f3a-c1fa56a2780mr173355266b.60.1785430370347; Thu, 30 Jul 2026
 09:52:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260729084206.77793-1-jiahao.kernel@gmail.com>
 <20260729084206.77793-2-jiahao.kernel@gmail.com> <20260729155858.c7aabff48166a9bca4d68ac3@linux-foundation.org>
 <CAO9r8zNhBCghP8T_98z2p==Cfs_=kamcRN_3ROxaj3R8PN2Qvw@mail.gmail.com> <20260729181756.a37e0cc7ea3f6013959d1d25@linux-foundation.org>
In-Reply-To: <20260729181756.a37e0cc7ea3f6013959d1d25@linux-foundation.org>
From: Yosry Ahmed <yosry@kernel.org>
Date: Thu, 30 Jul 2026 09:52:38 -0700
X-Gmail-Original-Message-ID: <CAO9r8zMPxdn=MOFD9mbrzed+C9HhOB5DpHG4QS0OJzqV_gLvsQ@mail.gmail.com>
X-Gm-Features: AUfX_mx1JShU4xIT5ANEqpzQMh3RRrHaBazoTKh-oN9MrjhE15twPkvX8ce_pog
Message-ID: <CAO9r8zMPxdn=MOFD9mbrzed+C9HhOB5DpHG4QS0OJzqV_gLvsQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] mm/zswap: Fix global shrinker when memory cgroup
 is disabled
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Hao Jia <jiahao.kernel@gmail.com>, tj@kernel.org, hannes@cmpxchg.org, 
	shakeel.butt@linux.dev, mhocko@kernel.org, mkoutny@suse.com, 
	nphamcs@gmail.com, chengming.zhou@linux.dev, muchun.song@linux.dev, 
	roman.gushchin@linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Hao Jia <jiahao1@lixiang.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 29, 2026 at 6:17=E2=80=AFPM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Wed, 29 Jul 2026 17:30:56 -0700 Yosry Ahmed <yosry@kernel.org> wrote:
>
> > On Wed, Jul 29, 2026 at 3:58=E2=80=AFPM Andrew Morton <akpm@linux-found=
ation.org> wrote:
> > >
> > > On Wed, 29 Jul 2026 16:42:05 +0800 Hao Jia <jiahao.kernel@gmail.com> =
wrote:
> > >
> > > > Zswap writeback when the global pool limit is hit fails when memory
> > > > cgroup is disabled. The pool remains full until it is organically
> > > > drained by swapins or memory freeing, leading to zswap store failur=
es
> > > > and pages bypassing getting written directly to the backing swap de=
vice,
> > > > causing LRU inversion (hotter pages with higher fault latency).
> > > >
> > > > This happens because mem_cgroup_iter() always returns NULL when
> > > > memory cgroups are disabled. As a result, the global shrinker
> > > > shrink_worker() repeatedly takes empty walks. After MAX_RECLAIM_RET=
RIES
> > > > failed attempts, the worker gives up without writing back any pages=
.
> > > >
> > > > Therefore, when memory cgroup is disabled, fall through with the !m=
emcg
> > > > branch and shrink the root memcg directly.
> > > >
> > > > With memcg disabled, shrink_memcg() only returns -ENOENT when the r=
oot
> > > > LRU is empty, which means the total pages are already below thr. In=
 the
> > > > absence of heavy concurrent zswap stores, the loop then safely bail=
s out
> > > > via the zswap_total_pages() <=3D thr check; otherwise, it will resu=
me
> > > > shrinking the memcg after processing the reschedule check. For any =
other
> > > > return value from shrink_memcg(), the loop is guaranteed to termina=
te,
> > > > either after MAX_RECLAIM_RETRIES failures or once the threshold is =
met.
> > > >
> > > > Fixes: a65b0e7607cc ("zswap: make shrinking memcg-aware")
> > > > Cc: stable@vger.kernel.org
> > >
> > > How does this affect users?  What behavior do they observe when it
> > > occurs?
> >
> > I think the first paragraph sums it up pretty well, especially the
> > last sentence "hotter pages with higher fault latency".
>
> How do users observe that?
>
> See, what I'm looking for here is an explanation for why we're
> proposing a backport.  How are our users harmed by the current code and
> how does this change benefit them?

It's a potential performance regression when using zswap with memcg
disabled. Sorry I just realized you were looking for a high level
description not detailed symptoms :)
