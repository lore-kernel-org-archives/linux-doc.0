Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C31C22D7A9
	for <linux-doc@vger.kernel.org>; Thu,  6 Aug 2026 22:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786056443; cv=none; b=QWE+PX230o7eu0JfToCSklsVKLpyDEcWIf/8+QgYmLfF08HbgJwG5hWb/TSmzghhVxGN6QICphlzfNqz43ic1qvAMYGjMK9egIkawzLjJJDlV/YY3CGfrNAPOp5V2PzPCXqjIjmbRIrjpl0yuyhbxsjVP5d6S5Y9lAkEqNOBueU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786056443; c=relaxed/simple;
	bh=eQCF71peTdXYM/fmuEAUpN8I8w1I4ba9L5LAid5gMIE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bzr/cOq8Xi9X6rJl/pe3te6HXFPifq9pn47tTZZ5Gyn7ffGMRFUo6DqhSlFESSzioKd0Vs9xADyK/4A84Y+YTfSGrdss7xiXrXvcJ8A5/10+U2HVMRvEO18WIpVqszW+/u450zfSWllwB+RWqag7+eo79py+VfFdGl1JUZQHot4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FINkf+SH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FINkf+SH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 373CE1F000E9
	for <linux-doc@vger.kernel.org>; Thu,  6 Aug 2026 22:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786056442;
	bh=f0JJ2dsclzdRsuC9t44MmmtZCwGmLaJNhhASDkwou8w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=FINkf+SHOMJoxm0DTYc7A6uZ+sLnGO6XT42riUP3n/beEyUj0W1g1vpDHW5QxHTr1
	 U/Pi0loQ0q+hu9p/JEXi2NwiBekKq9p1MujfVSL7iN/vZL0EckXDrzCuZIVGPDyRHB
	 JYLBuoXfIqxTatXrj2eEDdfrbWx2EikaO5vCPhHaXtoao7OYygAWZ+fY+paurLh3Yo
	 y8I1IZRMWfzu3+MsUJNlWkc0JKHnuJR9PiAMarE2qcQJNM8VCHrD5xnWaxrfQWfbr/
	 yo037kLJf6aA3B7JcsMyUCsZg8LqD5DiaTFIGLcnJtS7TuIGhrKB9SP8ysErcwW/7j
	 HZhEC2Qy0MtGA==
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c15e2dab83eso427708366b.1
        for <linux-doc@vger.kernel.org>; Thu, 06 Aug 2026 15:47:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Ro+EqmfOCkmWDEiHiqmC+XgtcULVvpOqFpXUSULNvI8MBczMPv45RKOUJnHTP+IvlTexiCtIc9br5Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8L7MgA5M1gCK85uzQ9MyDRrmdU2BM2qMUcj7ZtGMhWAS38GWC
	8ll0DkayufnYknFs8E21nLnJZul4EuUROeAA21Cl94lHq13AkyBep/6fTxCAWZfMw9b5RG2MUHq
	ikmjaErVxRiDguSnSeM6nKybY/r4Uw2k=
X-Received: by 2002:a17:907:9807:b0:c1c:2fd3:bbd7 with SMTP id
 a640c23a62f3a-c2039d15c0fmr873226266b.26.1786056441200; Thu, 06 Aug 2026
 15:47:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260806070943.95542-1-jiahao.kernel@gmail.com> <20260806154113.fd52c4c6207c6945dc77cf79@linux-foundation.org>
In-Reply-To: <20260806154113.fd52c4c6207c6945dc77cf79@linux-foundation.org>
From: Yosry Ahmed <yosry@kernel.org>
Date: Thu, 6 Aug 2026 15:47:09 -0700
X-Gmail-Original-Message-ID: <CAO9r8zN4p_AWFU=ckb7QaEMnm0QUep6mgdai2ad20Zfu=VQ=kA@mail.gmail.com>
X-Gm-Features: AUfX_mwIfYMougPH_EihoPHrXv58QsraN27bZSAQ7q9-N_iv3q8NwbNfos0cO4k
Message-ID: <CAO9r8zN4p_AWFU=ckb7QaEMnm0QUep6mgdai2ad20Zfu=VQ=kA@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] mm/zswap: Fixes and improves the zswap shrink
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Hao Jia <jiahao.kernel@gmail.com>, tj@kernel.org, hannes@cmpxchg.org, 
	shakeel.butt@linux.dev, mhocko@kernel.org, mkoutny@suse.com, 
	nphamcs@gmail.com, chengming.zhou@linux.dev, muchun.song@linux.dev, 
	roman.gushchin@linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Hao Jia <jiahao1@lixiang.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 6, 2026 at 3:41=E2=80=AFPM Andrew Morton <akpm@linux-foundation=
.org> wrote:
>
> On Thu,  6 Aug 2026 15:09:41 +0800 Hao Jia <jiahao.kernel@gmail.com> wrot=
e:
>
> > From: Hao Jia <jiahao1@lixiang.com>
> >
> > This series fixes and improves the zswap global shrinker (shrink_worker=
()):
> > Patch 1: Fix missing global shrinker when memory cgroup is disabled.
> > Patch 2: Extend shrink_memcg() to support batch writeback and thereby i=
mproving
> >          the writeback efficiency in the shrink_worker() and zswap_stor=
e() paths.
>
> Thanks.
>
> Why is a -stable backport proposed for [1/2]?  Its changelog should
> describe the effect of the bug upon our users so that others can
> understand why this was requested.

It's a potential performance regression for people using zswap without
memcg that was introduced by the commit in "Fixes".

>
> AI review suggests there may be an issue in [1/2].  Please check?
>         https://sashiko.dev/#/patchset/20260806070943.95542-1-jiahao.kern=
el@gmail.com

Same thing from previous versions, shouldn't be a problem in practice.
