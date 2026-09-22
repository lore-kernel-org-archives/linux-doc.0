Received: from mail-lr2-f35.google.com (mail-lr2-f35.google.com [74.125.230.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBCE337475B
	for <linux-doc@vger.kernel.org>; Tue, 22 Sep 2026 17:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790097707; cv=pass; b=tkBLQi7ZFnJw7o5gO7+bNkfIRHGk5FmlBO4xPrGg22w95V0jNrnDuSoe0suQEEC+61uh1hE0XC624yGrxN0cotH1UqdwqKqMjvp/Tf821uAftWTgW5AtT1U9UBdoFP8UMdXJzixXcIw7NBd4oPPO+WLXd936BHVteNUCH8lpRJY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790097707; c=relaxed/simple;
	bh=DGo9MXIlX67r2Cpop8xwlzz7tKrHnevRykdbKRTrSVo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X0DzjP0Pqi1m/CBQRiAXOtb97csOO1VPgR81s+dVqkje7BpwEZgsHi9eePGs6o90558AhD4OGT4DIUYD2JmCEebcCQA10Rnv46UvFoTdVlAxf3zBIAqUrTQcAP6pCg2obj/ALMJQ516G2Ww8k9TfN2HFkSgTIPhKISEM2HCQI+g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FM9MkeZH; arc=pass smtp.client-ip=74.125.230.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FM9MkeZH"
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a5e548cd7dso161141fa.3
        for <linux-doc@vger.kernel.org>; Tue, 22 Sep 2026 10:21:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790097704; cv=none;
        d=google.com; s=arc-20260327;
        b=FztHTL9MVWfJCr34O3ZAI/DnXYdydspp/ylzhaDczwCjoswA87qjL/8nOcziM+59gJ
         YT8C8AyhyPIwYnHBtCPXaVYDPX/TxbX5KhaM3Y3mGXzb/SuvqVIxdQJKNj3dAd8MQSjr
         1r6UOKGUhiwJOh/tMg908isVtcC2m6EPJi2L2qYbj5EN5kiApG/4mfD/uQek9ISZyJlp
         boyg8GotuSAs8XqnhBIThEDo8GuNtHMmNnhOUYornkPQCedF8s26ITnvq+ce3Jp8GKuA
         ZU7ZbTwNXAZJUNNBbbsA3hQQclZ5X0H5NyFMPtgklJSOqRSGEu7VBKjCuWfLm+8tSC1f
         Aakg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DGo9MXIlX67r2Cpop8xwlzz7tKrHnevRykdbKRTrSVo=;
        fh=hZVB/k2pyTtxqpzNEcDGg+2LSMd5S6RmmarF1nsKbOo=;
        b=nQPfaYWtIEkx7cQEM+6RgdkmYMPwt1NGzlNuryC6ifdQmL1ltPr9ZBBkZi6+8dqKRu
         2bROcQSiWCgg0EzxAwFfrdKgsk00cnrZ81LrUC1s1KtxmMAA8IU0oI/YQUkKpp/IoYmF
         2oMx52DxdG7JDwxmzVyK/DIGFSQ4/hCF8eaPaOVdcf9N1Zha0/i+elMG+nRQtcRALaTe
         FxtuIqV7GfOUiDHOu7XFRBEV6qSE1IcnfbxtT8hZ8x9TN8fbKQO4v3mb1OU0lszJX4Rh
         n/5wVzQUJGjQEZMyJYP1YJud7F2V7sPdazP2Yele6bXy3O2LwPpER0mr+tHp6678ML72
         OkHA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790097704; x=1790702504; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DGo9MXIlX67r2Cpop8xwlzz7tKrHnevRykdbKRTrSVo=;
        b=FM9MkeZHeBILypPfVgoyjNcBUMLCsBwc5Kz+oCuC4T+iPZG3ymQT7bV1tf6r7CfAa7
         lrzsZHUcbw7+Cp+T1e+Pn5wdqcklOw2XgtjZIPnDU8bx7alyIJIS9GSgnTmFc9H0+H5M
         gbJLWe2YommDcSTBvlvc+UN+j5422CWhMWhUV/n7S/kvgGRTbfsPYR6X2u/RefuFRbs4
         /iudxRQBLwjpzkDBhWV/Fi30zX/zLvOp+z+hpvdF/U0p5tJ2lAKEUcwBWNYxZe9XGWMP
         zlnWqBsemOcmAsIHjtUrHkTLcetDqhaIgw6DUj3UViCLP13td0UYg7Baj9gDbeqdOCsb
         h44A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790097704; x=1790702504;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DGo9MXIlX67r2Cpop8xwlzz7tKrHnevRykdbKRTrSVo=;
        b=l8dxnyWsl2OhDjnTlxPuOeStZ6wz3A7V1emHj2XKhrfGKiVkS/JRWXjhnqozQzde1S
         Dn9V//V7p/dstRsNm1xJX/6faxSxh3usGVhv7fdK4sHMdpwCzJ1na21quHDIOZdiHYME
         H6Ry1+bi9OLzEQWdUteNtchTlAWKQvTh03REOjvYtxPFPN83NMtOytp/nPu3e6etiOzv
         7/o9k2W9FlxoBx/aRdxL7+0Pp3sVtmexOafRjwDzWDIO5Pu2D0sbiQy06rmdOk4s9/4S
         hbC0CY4bZkAu/x8rfbPVBHuZr5zKQx9eJe2kWd53cgiJg1vI6gWcJZr+Tg2A/Jdor3zf
         qE1g==
X-Forwarded-Encrypted: i=1; AKwUvBzwjUzYkFsqXaazXARDkz2/S90a5Mz7i/y4pigG/GB7UVJjnpKb3Hv3gZC4wzD6AkWF+SmGDb1sGac=@vger.kernel.org
X-Gm-Message-State: AFuF++kPY1TlH3mtvvROxOt1i1rk1LEezsj0j8VLWmRf49kqJ8WTLFdm
	wnzWkfiKyUib/XJUShPRy8zgVy1gAR7RYWAWJvE2uMni0UVJOF9pYyyxzsLjAgbUWuRzxKCk/WL
	efTRiCDBuOckjnR1Do/Lq/jFRoK2Cds8=
X-Gm-Gg: AYBFou12vtI/vOSJPlf1DHiqUa6qkwXuziLmCUx4MZWEHPCX4IRs7ujr27cFrAyCNH/
	MDjgbys036Md5A+5Qmv9KR9/L72uewqsCxtp1/R5Fai05z4/y0hKJnmAC+0hoTd6onrUACXcNNc
	IV9qSRs0gSjOSDIYEkJo7ek3+npScSQ5KTysSUCbZnYlvhHm5RBCHf6cj0QhKaxqrmF+1YAkBh9
	W08Ieh6FDuWmkACaxjCnyhUQzoME1KdTSItKDeVe+ZEatKzNrrgoO7wz5nLbqQaNZpsju1AWOJS
	IDK6ATKADa0XuH0sKCEellId4Hz3oBXGbNiXsj7fwt5BEWlaR9W3ryQ99SqxgoWwsN/Jv5ff5KA
	eGg+YdDB8q0o=
X-Received: by 2002:a2e:a550:0:b0:3a4:850c:5900 with SMTP id
 38308e7fff4ca-3a5fbef79e8mr29852861fa.11.1790097703647; Tue, 22 Sep 2026
 10:21:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAKEwX=MP=zuTnLT=coS_EpXe2KwXq=79yBnsEGXwcZZsW3S=Yw@mail.gmail.com>
 <aqJXx2vtbKaRLt3x@fedora> <aqLi6cIjD2wJwk0B@cmpxchg.org> <CACePvbUG1ApMzMdEzf-63rpjgGVNsRk21pT72OQGJpM=OtRUew@mail.gmail.com>
 <aq6cVXPLUUwJA7-2@gourry-fedora-PF4VCD3F> <CACePvbVaPDnva8X-Xmz84r7j5HjTuih-w5phpw7cerK2uPnK6w@mail.gmail.com>
 <aq8dja2-timYBwyB@gourry-fedora-PF4VCD3F> <CACePvbXudjxQ5vrrY4D1nOXKaFNQUn-tL+p3O0zfxtHXK99ojQ@mail.gmail.com>
 <arEVDBlfsUYKK004@gourry-fedora-PF4VCD3F> <CACePvbXG5kjZmRsdd0a4HfbnNa6w5s9b_1OCySbwvY+HuCqOVg@mail.gmail.com>
 <ad1c4de51f1fbbfc7345036af8f39fb450c1f3c7.camel@surriel.com>
In-Reply-To: <ad1c4de51f1fbbfc7345036af8f39fb450c1f3c7.camel@surriel.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Tue, 22 Sep 2026 10:21:29 -0700
X-Gm-Features: AcwNN1XXWGuPHcmN1XUaSbD201MO3zoYy8czrwaKOr1UiYnCbEj6IM0vycSKfC0
Message-ID: <CAKEwX=NKC=N-YaiwZK7HPM4MfX-7JG_KeHukS0+vjHqMZTV4dA@mail.gmail.com>
Subject: Re: Path forward for Virtualized Swap?
To: Rik van Riel <riel@surriel.com>
Cc: Chris Li <chrisl@kernel.org>, Gregory Price <gourry@gourry.net>, 
	Johannes Weiner <hannes@cmpxchg.org>, Baoquan He <baoquan.he@linux.dev>, 
	Kairui Song <kasong@tencent.com>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Yosry Ahmed <yosry@kernel.org>, David Hildenbrand <david@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Barry Song <baohua@kernel.org>, 
	YoungJun Park <youngjun.park@lge.com>, Chengming Zhou <chengming.zhou@linux.dev>, 
	"Lorenzo Stoakes (Oracle)" <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	"Vlastimil Babka (SUSE)" <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	=?UTF-8?Q?Suren_Baghdasaryan=EF=BF=BC?= <surenb@google.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	Wenchao Hao <haowenchao22@gmail.com>, Jonathan Corbet <corbet@lwn.net>, Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Tejun Heo <tj@kernel.org>, 
	=?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Kunwu Chan <kunwu.chan@linux.dev>, 
	Meta kernel team <kernel-team@meta.com>, Linux Memory Management List <linux-mm@kvack.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org, 
	"open list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)" <cgroups@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Kairui Song <ryncsn@gmail.com>, Joshua Hahn <joshua.hahnjy@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 10:15=E2=80=AFAM Rik van Riel <riel@surriel.com> wr=
ote:
>
> On Mon, 2026-09-21 at 06:11 -1000, Chris Li wrote:
> > On Mon, Sep 21, 2026 at 2:53=E2=80=AFAM Gregory Price <gourry@gourry.ne=
t>
> > wrote:
> >
> > >
> > > You can't know the compressibility of memory until after you
> > > compress
> > > it, and requiring a user to predict the future by forcing them to
> > > limit
> > > the total amount of workload compressibility does not scale with
> > > the
> > > number of workloads of variable compressibility of data.
> >
> > You likely just need to pull a SQL query on your fleet to get that
> > number.
>
> This feature is not being developed for just one
> user. It has to work for everybody.
>
> >
> > > That should tell you that your model of reasoning about this issue
> > > is
> > > ill-suited to address the problem.
> >
> > That is what I'm suspecting. Nobody in a sane mind would want to
> > zswap
> > 100% of the RAM and maintain reasonable SLO.
> >
> It could make a lot of sense to have some default
> limit upstream, that says the zswap pool is not
> allowed to take more than half of memory, because
> at that point the compressed content will be
> crowding other things out of memory.

I actually am skeptical of gating zswap usage (both pre- and
post-compression), but I would like to note that for post-compression
size, we already have that knob for zswap, default to 20% of physical
RAM.
