Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792688619;
	b=OlWG2DgeHt0747X72xuPQ9zluCzvGM2NbCt3vjJqkRLpkefa0TMJ3/fblsHFsPoB7Bot
	 8tyPbr8Ob1ADWiYdEU5X4D1G2v2gy7XhdqCI1et9Kvi8wUsNpkq+rbW2UxOiHhNg5iDsr
	 qVG/vKzmQBuKOwyHPV40uiuRUOR1nkiDRdJxopp/VsvlWwh41Btf28PKYeB6lrZrv2AZg
	 GhpGD4v6fDKdpQMNibvbx2U9HOMnjMeYUHtKrJEiFFEvn5hlRVfM1zgnXuZ24zs8aUnNv
	 Koi8lkNWonz7VhrUQxV/D0SbFvBLjjjLTDdIB9qtGEbL6XR0HA2fwObmSvcDNbdnPjg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792688619;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=42ZKTYCAvrM3nzOwxlsBgd+YAojo0q+aV1smVjaq8KU=;
	b=NCQFeHo9jMJSoZcVPG2dnItv2na+wxaThQJIQAJnRwNuExaOoe2Z2PJtFiSpAeO8rGfa
	 tRwx4HrxHsN6/7zPHyL8xv9cDxJxoz4MuVfZT4TOmV5QJb7kU0tAS9F7XL36CXPtLhUlF
	 h4I9Lmcg754/NroCrEtuvrxUoaMWYApwcugA8Pdiasbicw5yw0NWmPBQ1A8cyzDDR81mf
	 SoE4eStkk6gM8aq5e7iLO6+fuoSjFhT+aJfhoke2fbAtUQ9iWJqV3gD//hdXZxEk8wFXQ
	 SHKbvlPjf3PSsi7fFVxfQ6Iah0gREQeFvBqjwg+Y4KMFs3QWCZDGILOENg9JwfrKDVQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qYzOs5h0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46034606A31E
	for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 17:03:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46034606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qYzOs5h0
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a1e266fca2so234255e9.3
        for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 10:03:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792688618; cv=none;
        d=google.com; s=arc-20260327;
        b=mAUzHsXlgoIw1gXrLmWCJRjvVbx+KieEWJGSjxF+u4g/EtvYgcBs30xWbd9qgsPL1r
         w/iPczl4hVYPQA+/cFrTbI/kqT0NMqsSEREX7FihQ5vcNVGsROipU34lpDUKS43OVe2D
         kpRA/hLD4kQtmVarM3njdL/Wz9lICq7Jpv3aR+vsIbn7BQCL4HGiylVQmCX0WrWozwGV
         6/bweSfagOwLAQPf37IiOqDkoUMi0NrIepp8oezKqevhAuwpqpLnT7i0VWV7ApGYPECJ
         A85FIl0iP0ngqRkkzY8RUlE9SPMh5APA348aQXaBXLS8wESSBsEUMTnw2dTJI+VsgyBs
         iLKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=42ZKTYCAvrM3nzOwxlsBgd+YAojo0q+aV1smVjaq8KU=;
        fh=sNOFcuCgeCyUFjCwMEFeNiZsDrLRVs6to5hDS2XWpg0=;
        b=ZfTdg8Q/2S1hyPIDxVz1b4xYbqD9JnxuxM9usdU61NIwtuWzjbU739rkdF7dvkWTm3
         P7nGgD4LMYfKlp1/0f+Y/JOmdGxWS1Fw/YBGxdaom/ajKSNdFBDqhVGjo/CGSfboxG0v
         Nc4kyCyoNVbAvlbnJFcB88M1YnKb7Kbuh+f26cTckziDBG+BesZgmPu1LgP/RCOn+rBj
         slsI4git7Dc8Zc1trXzA5xxUFGTjHb7WyNN87gsSK0GBX4BrvvQ1J9unVmBFW7RAZ+rx
         BBEtiYvklgGBSlS24ZgjvliQ45QhpbvysCbwNVp7bGopycvegXTPennPRLUPf786S+/N
         KO9Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792688618; x=1793293418; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=42ZKTYCAvrM3nzOwxlsBgd+YAojo0q+aV1smVjaq8KU=;
        b=qYzOs5h0bXZxIVavXr7HNRq0g1WgfRJgI/Gu5cQj0HIe7P7IOhfhcVnfRT9rCJveiF
         3NUcgZ8bNqcQ845QepKODWAP7GCT9bLmdzP+yXz/j+ayzYi859f7ROfAymVEPsXSWtV6
         ZZwsxdvJ8x2ldFc+pPUEFrY0/T24yOfHteitf77XMw+P3HDFEkWO12HOJ1EQCk1sDI7B
         t7vbsd6Z926+FDsGoRMyeMyKq6BXCefbCq8itO9VXWI7MKR+s/1X3jFDowXg1NQu/nps
         09ZXtkSqo/v4tlNuMTlMIAMSzzLqgAAd72Glk4sq5zHXst38KYv8jJ3t0Dp7w9rhnejf
         xN2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792688618; x=1793293418;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=42ZKTYCAvrM3nzOwxlsBgd+YAojo0q+aV1smVjaq8KU=;
        b=Ps5ZcuwHaVfCzj/ReJ2xBG+AELnZ5quq1aUKOsQ/Z7c/6neacRtqeOx6y+enCwCaO6
         GHzWDm9TMZCa+/jQNf2DpxsCqqaxchGzj/EP7BNrShPglIxdFgP+vsWG6zS/agFRMlGN
         n+7524OPGu7EZswoA6QvQDYw6F88I6+SMFNykneBZVKlJvgL34v6uNMu5YwQ+pNXQBMF
         j/0UzRLxj9KoSlKY6LeL2hXWKVqEWpYu7yheGRMNkRQPoUsIAMOKYIT0295p8W4oFeO/
         Lr3ImbufDk76a6gWHFedVkLIcM+E8LuwPBblf9fe3gCCQCM6IqzrVYjuQ2ti1Vx/pdZW
         xlcA==
X-Forwarded-Encrypted: i=1; AKwUvBxpM8wA8EBcVWwDLSNITvCYXA5JwOfU1O3GiMJcZ7IRnksJy5ijvPktN31b3798tXVMwQCDi5FM2zk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJMhJobuuNAuusK4pT3LIefwTusWblTv6aTeNAXqn3t+LNUH2j7
	KcWlgKhCUDOcGXvoKF53YiFwSejbgUNM0AgO1kY2o6HPDcfgzBTyCVgMyynAOkkhWWbYj6Y80vh
	JNWbR/NJ854ykk/ZM58/zBNXUdERwqdQ=
X-Gm-Gg: AYBFou3ghZ9v2CLBjr9KMl/lTbdTgpuXDAeBeZT2Yjm6hUlnn8t46zVaJFx+qwqX2gJ
	4hsLF8xiGU/oCbGmz6zX6o0BsJ7gVgrPN4lw7eSDLFMhTdISqejYgpNH6IM2tu47jsbjMWlBGjt
	oGV0yaVU33eospNjk+WDc1lnIFbIol/eRwFEr64fZhNRE/sQjc3ISDrkEow2ZprvV9XtVq8EmqF
	rzLnt8b9qNfHwh6d1w7RArz2Hr4aOFWKD0EbY8FyjggHaUYKT3KvbPnHkfb1WdXDZ16p643ROnp
	1d34ZNwwdYFixl3XKWJ6waad/4VSSElwNDoXMs4f24v+Dx6pPqxIoH1oYK4IvsBisx91B7zJ7i1
	IzI0OSp0HOG9njJTBYb8663PcGjv4IBj2RbNUE2CIymqUwsUYyoA4lMcXzbYtYrizpjmwP6eTpw
	CIG5bRNDkDFh7EEDFOTwDbb7HUIFF8X03iDg1EvF2MSWqdaXygAKjk
X-Received: by 2002:a05:600c:3e15:b0:4a1:e11f:b2d5 with SMTP id
 5b1f17b1804b1-4a1fd8a85bfmr107503165e9.2.1792688617341; Thu, 22 Oct 2026
 10:03:37 -0700 (PDT)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021060323.553433-1-nphamcs@gmail.com> <179263657717.2549665.11401372071846447074.b4-reply@b4>
In-Reply-To: <179263657717.2549665.11401372071846447074.b4-reply@b4>
From: Nhat Pham <nphamcs@gmail.com>
Date: Thu, 22 Oct 2026 10:03:25 -0700
X-Gm-Features: AclHuK-KHka98G0XQ9c1yETjfsOpMIxaCbqOu01mqGiSr3S8GqcFL1s8QG2fmng
Message-ID: <CAKEwX=Po0J7KsR93YnP4SyXkpqZqjrg7HxyT=17gVD-fNtRHdA@mail.gmail.com>
Subject: Re: [PATCH v6 00/12] Virtual Swap Space (Swap Table Edition)
To: "Gregory Price (Meta)" <gourry@gourry.net>
Cc: akpm@linux-foundation.org, chrisl@kernel.org, kasong@tencent.com, 
	hannes@cmpxchg.org, mhocko@kernel.org, roman.gushchin@linux.dev, 
	shakeel.butt@linux.dev, yosry@kernel.org, david@kernel.org, 
	muchun.song@linux.dev, shikemeng@huaweicloud.com, baoquan.he@linux.dev, 
	baohua@kernel.org, youngjun.park@lge.com, chengming.zhou@linux.dev, 
	ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, 
	surenb@google.com, qi.zheng@linux.dev, axelrasmussen@google.com, 
	yuanchu@google.com, weixugc@google.com, riel@surriel.com, 
	haowenchao22@gmail.com, corbet@lwn.net, hughd@google.com, 
	baolin.wang@linux.alibaba.com, tj@kernel.org, mkoutny@suse.com, 
	skhan@linuxfoundation.org, rdunlap@infradead.org, kunwu.chan@linux.dev, 
	kernel-team@meta.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, cgroups@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 7:36=E2=80=AFPM Gregory Price (Meta) <gourry@gourry=
.net> wrote:
>
> On 2026-10-20 23:03 -0700, Nhat Pham wrote:
> > B. Semi-synthetic Workloads (memhog, usemem, kernel build)
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > All values are mean +/- standard deviation across rounds.
> >
> > Test system: x86_64, 52 cores, 64 GB swapfile for all 3 benchmarks.
> > Swap backend: zswap (zstd) with the traditional active/inactive LRU. We
> > focus on zswap here because it is the motivating use case for vswap.
> >
>
> I get that the motivation is zswap, but it would be nice to have
> disk-swap performance numbers here as well right in the cover.
>
> If only because...

I probably should test it regardless, but likely there will be no
difference in performance numbers. Right now for straight disk
swapping we incur 0 overhead, because I just bypass the virtualization
layer :) There just isn't any feature for me to entertain vswap+disk
swap quite yet (it might come soon-ish though).

Vswap's physical swapfile backend is only used for cgroups that
support zswap (for zswap writeback and fallback if vswap fails to
allocate or zswap rejects the page etc.).

For the older version, I put vswap in front of all swap backends. Disk
swap sees no regression, but Kairui found some regression with fast
in-memory swapfile (pmem). I reproduced it with zram, and I think I
closed that gap in my own testing, but Kairui did not test the fixed
version AFAICT, and I also don't have his full suite, only the ones he
quoted.

(Btw, Kairui, could you publish your full suite, or at least the full
set of testing parameters? I would like to hammer the thing myself to
expose bugs etc.).

>
> > For each benchmark, we test 3 kernels:
> > * Baseline: mm-unstable, no vswap patches.
> > * VSS off: vswap series applied, vswap=3Doff, to verify that there is n=
o
> >   regression to existing swap paths when we disable vswap.
> > * VSS on: vswap series applied, vswap=3Don.
> >
>
> If the numbers you presented carry through, I'm left wondering why this
> is a boot option and not a build option.  I rather dislike the boot
> option compromise in general - but other reasoning aside, if there's no
> performance impact, then I don't see why it shouldn't be the default.

That's a good point yeah. Lemme think about it. I added the boot param
before I decided to bypass vswap for physical swapfile by default...

>
> ~Gregory
>
> --
> Gregory Price (Meta) <gourry@gourry.net>
