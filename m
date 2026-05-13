Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1217E3955E0
	for <linux-doc@vger.kernel.org>; Wed, 13 May 2026 21:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778706613; cv=pass; b=JS3noRAO9tM6HnVxCsPP7oUfUzDsQr4C4dPpGtj4EOoJsJxBvTly6RIO2tOO6lK3dmaEhKaM9HCNTv5k6g5NCw2DVKgtWuo3MhhCW1LRK+9hp3qi/4Zch4UfFCFmLTr9kgbZMdRbC3bb2wQhqUydA50XPpNMbuR/58opCTZ9OZ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778706613; c=relaxed/simple;
	bh=yw9HWAanvQGxxotRyCikt0YifQqq9eeU+f4Jwn4SlFY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=onF+/6c6LCtiQF8J0QUyGh2pLGjwjboLJTBPKlA9YWeo5i5/W8TURH0nNy7s2UXTgDCRV6xlZ20zvKMCqJKI1CPem/XSaZelxIEArM04/CtrUSs6Kv17vG/c6NnTvyx86bv+tDn2yTlyHvIDvV/oKuFVe5gfJsjh3hbrNUolDmI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fh89k2rL; arc=pass smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fh89k2rL"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-45297094718so5820651f8f.3
        for <linux-doc@vger.kernel.org>; Wed, 13 May 2026 14:10:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778706609; cv=none;
        d=google.com; s=arc-20240605;
        b=aGKgcOYMZNalHwJm9NN6qOSZbSSoJVaqqSYhO08ygW5dKg4ROO2as4O46nQkJiTmei
         y9Y/u+ySsgmqz2jq5p0gHS7pm4f+RUnZhrW55H3ZMdTSrhqTb6EfA1Rudfw1HLTNKMff
         Jf5a4UwYi/rR9xiEbhgjrH5mQks4lhnZIILGqc6ihSPKhzeL9KJN1Jppq7A7zRCm0fpH
         mwIenwhTK4RapcxH17nHpOh+Zsywavwb6pRAuYR1zVWtYah13k/GNgAm2YA/wYUFtlww
         CyLi6lBUlOhYfoJrghwM2dmVNTibH+GLAhRQIy9UmED80CC5LCdF1Z0YxBisGa7+pzSR
         F+Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yw9HWAanvQGxxotRyCikt0YifQqq9eeU+f4Jwn4SlFY=;
        fh=y2ft/uUPT6kAva9s08O6PzNh3sNEM7oJ45o90zYVnZE=;
        b=gQhMbg5rIxbx5s9BY77psycIymam1xyT8dpW76QOLher53G9NItz2DtPkWJlQaONzl
         Nf/k6P05FVbIVC1gnRZ+BXCquBG2lVhjVDRKcM342ezQ13Pd4KPVPOqtJL+IM3byqURk
         oXM2WAEnKKKC0b5M+XYGz01B/uxWoLCuCrfCgmiMWIWStsCt8yuw/Ct261FqMDa13ZIR
         ZW4E7r19a9oxSVunZb8V94Knbku/aNy5BjN6ZP4B7PzV+PPk+/fcMblIO05xn8JSdpm0
         5wXC32xkkDvPF4HuODTIWrQXvWyskYTOMxGrw3hc92T3TCFMzekxUMysJkUtzewWheHM
         iHMA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778706609; x=1779311409; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yw9HWAanvQGxxotRyCikt0YifQqq9eeU+f4Jwn4SlFY=;
        b=fh89k2rLRZeBfT5zgfJb4tdJLmGNspF3JBgLkcQpaE1xUA7DLq4JhpGe9SKBtnntPk
         W7bjxuMVKUgm7SquiUj4h61maOaaPTEF4SL0sArrqPGxufBPBzNxEmLuQihIDB0/uYiJ
         NJ1n5a+ptg1cGA9jSPjXj7m0Vig4nMOkyMzPuuUZ8d/McqqzXsDczF6DTmV01uZLjzwy
         KgcvCloG0Y7v6dm7B1BaJqvMrBJkpM/1eCT3je9O/DOC1OGmoOCha0l8oqKVjhZdJiQ5
         ZiLINdp/Jzh+5cUR+A422uMlXsMfly//YA6X47oEwng/sBoLDUTGqcXXu8VuSj7I3Xtb
         fKiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778706609; x=1779311409;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yw9HWAanvQGxxotRyCikt0YifQqq9eeU+f4Jwn4SlFY=;
        b=nQ7cS9/kyPWbg1addvDjYHOPkhva+aeTSKbpz/0IclMWNZTiEZlUHEwcYRjNmaxmBq
         BQxy8fNFZtM33nQ05TnYx/YxJMIX+tH/wkX+iCRWnOGKHxout5CA4fLeQFkmebdmqG/H
         /seMaB1V1fnQsf9bppoOMKhNVgXcNfgRup/G8gwfvc/GdjPV/2XhDREGAHx97QF2p4IE
         kkJnSdTZZo4l0COLA0wZTeB/kzFue1h5GehZwq3PtubJHB1SYDnuz/UT7VrCR/dzq29v
         ucV2cnGgc0NzeaiBWEl7u4BdpAxqOhybJtnkBhNQymqrsLe+ALeLx/poPjC2ZiAOX+BJ
         +1FQ==
X-Forwarded-Encrypted: i=1; AFNElJ/3rqTPU8UKL7/wH4MElQxixTV1NipWaHh9PoyJF/qkTKP3nurWD3ZDgUtp3SYvydmngHQx/9NdrAo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yziydt7XSuaqD2hPwJkv0ekLcBJTOoLVoffVTWIvR529/gUH8RO
	nvKfZF4HQ1li0X12+25hoQTNjDIB3z4LnFA3Tbk7Bc/79ZcCwXnmD1+g2/ram18tjlpaPBHcD7Z
	6lQnXCuscoAYbXs5i/bn2ZEd0mi+LfBo=
X-Gm-Gg: Acq92OFTtNiIyUrPa6MTwnKhGPNxXVz/0Edrjuj6S087x33yW2yle6jMpg52XbucP3R
	18CObV5vgzs0Q6kI0Q/eRUeqVchuPouqaRts5EYkNAPYSDJFSx2ibKMVyZb+qx1T7Bk4Q5XmhmR
	Y0v9WNUApSGZWwul9Murtzi5XOXX4DU7EZ26WGvtQpiBCsWm91zK5OIlHV5JyUam2l1jX2BpbR9
	4L0tm29bTKe2mEXs7x1sXsYU7PVajzIEcJS7kLatfT7s28ORkIuw8+MBiYd5RRj6QH/KUk4b0wc
	f0CgTekI5xnS1hi0OJL2rzCubw0Uj82gFmZv+v0=
X-Received: by 2002:a05:6000:471e:b0:45d:3cbf:bdda with SMTP id
 ffacd0b85a97d-45d3cbfbe3amr3759439f8f.20.1778706609173; Wed, 13 May 2026
 14:10:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511105149.75584-1-jiahao.kernel@gmail.com>
 <20260511105149.75584-3-jiahao.kernel@gmail.com> <CAKEwX=PLFRkfUvZyaYfwBv0QJ-8KAktvZvGA02Hod04H-RsS-Q@mail.gmail.com>
 <CAO9r8zNOPdpJuTmccvQ6ZAVS+tXxp-_ofA765DbnfaUZOPPO-g@mail.gmail.com>
 <12e4784e-2add-d849-7e54-bde8abfa6e78@gmail.com> <CAKEwX=MOixJAUGiwUcMQa0Stvg-mR-MvpDRD8WA4YMtRvnUYTg@mail.gmail.com>
 <6fc7fdf0-368c-5129-038e-623f9db2aa88@gmail.com>
In-Reply-To: <6fc7fdf0-368c-5129-038e-623f9db2aa88@gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Wed, 13 May 2026 14:09:58 -0700
X-Gm-Features: AVHnY4IP8DEacwhsvW6UMiUvn20aGQIjyCPvbowN-gskCg9d2oQuJyw6uFZbOMY
Message-ID: <CAKEwX=M=6AQVYA7ROM0YOP7irpxbdMrEOAHKGKYo0Qgr+-uhSw@mail.gmail.com>
Subject: Re: [PATCH 2/3] mm/zswap: Implement proactive writeback
To: Hao Jia <jiahao.kernel@gmail.com>
Cc: Yosry Ahmed <yosry@kernel.org>, akpm@linux-foundation.org, tj@kernel.org, 
	hannes@cmpxchg.org, shakeel.butt@linux.dev, mhocko@kernel.org, 
	mkoutny@suse.com, chengming.zhou@linux.dev, muchun.song@linux.dev, 
	roman.gushchin@linux.dev, cgroups@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Hao Jia <jiahao1@lixiang.com>, Alexandre Ghiti <alex@ghiti.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 13, 2026 at 1:04=E2=80=AFAM Hao Jia <jiahao.kernel@gmail.com> w=
rote:
>
>
>
> On 2026/5/12 23:47, Nhat Pham wrote:
> > On Tue, May 12, 2026 at 2:32=E2=80=AFAM Hao Jia <jiahao.kernel@gmail.co=
m> wrote:
> >>
> >>
> >>
> >> On 2026/5/12 03:57, Yosry Ahmed wrote:
> >>> On Mon, May 11, 2026 at 12:49=E2=80=AFPM Nhat Pham <nphamcs@gmail.com=
> wrote:
> >>>>
> >>>> On Mon, May 11, 2026 at 3:52=E2=80=AFAM Hao Jia <jiahao.kernel@gmail=
.com> wrote:
> >>>>>
> >>>>> From: Hao Jia <jiahao1@lixiang.com>
> >>>>>
> >>>>> Zswap currently writes back pages to backing swap devices reactivel=
y,
> >>>>> triggered either by memory pressure via the shrinker or by the pool
> >>>>> reaching its size limit. This reactive approach offers no precise
> >>>>> control over when writeback happens, which can disturb latency-sens=
itive
> >>>>> workloads, and it cannot direct writeback at a specific memory cgro=
up.
> >>>>> However, there are scenarios where users might want to proactively
> >>>>> write back cold pages from zswap to the backing swap device, for
> >>>>> example, to free up memory for other applications or to prepare for
> >>>>> upcoming memory-intensive workloads.
> >>>>>
> >>>>> Therefore, implement a proactive writeback mechanism for zswap by
> >>>>> adding a new cgroup interface file memory.zswap.proactive_writeback
> >>>>> within the memory controller.
> >>>>
> >>
> >> Thanks Nhat, Yosry =E2=80=94 let me address both comments together.
> >>
> >>>>
> >>>> We already have memory.reclaim, no? Would that not work to create
> >>>> headroom generally for your use case? Is there a reason why we are
> >>>> treating zswap memory as special here?
> >>>
> >>
> >> Apologies for the lack of detailed explanation in the patch descriptio=
n,
> >> which led to the confusion.
> >>
> >> While we are already utilizing memory.reclaim, it does not fully addre=
ss
> >> our requirements.
> >>
> >> Our deployment runs a userspace proactive reclaimer that drives
> >> memory.reclaim based on the system's runtime state (memory/CPU/IO
> >> pressure, refault rate, ...) and workload-specific
> >> policy. That first stage compresses cold anon pages into zswap. Entrie=
s
> >> that then remain in zswap past a policy-defined age threshold are
> >> considered "twice cold", and the reclaimer wants
> >> to write them back to the backing swap device at a moment of its own
> >> choosing, to further reclaim the DRAM still held by the compressed dat=
a.
> >>
> >> This is the "second-level offloading" pattern described in Meta's TMO
> >> paper [1]. zswap proactive writeback is what this series introduces to
> >> address that second-level offloading stage.
> >>
> >> [1] https://www.pdl.cmu.edu/ftp/NVM/tmo_asplos22.pdf
> >
> > Yeah that's what we've been trying to work on as well :) We are
> > working on a couple of improvements to the mechanism side of this path
> > (cc Alex) - hopefully it will help your use case too!
> >
> > Anyway, back to my original inquiry: I understand your use case. It's
> > pretty similar to our goal. What I'm not getting is why is
> > memory.reclaim (which you already use) not sufficient for zswap ->
> > disk swap offloading too?
> >
> > Zswap objects are organized into LRU and exposed to the shrinker
> > interface. Echo-ing to memory.reclaim should also offload some zswap
> > entries, correct? Are there still cold zswap entries that escape this,
> > somehow?
> >
>
> Yes, the memory.reclaim path does drive some zswap writeback, but
> it is not enough for our case.
>
> 1. For a memcg that has reached steady state (a common case being
> when memory.current is below the policy target), the userspace
> reclaimer may not invoke memory.reclaim on it for a long time,
> and so no second-level offloading happens through
> memory.reclaim. In this state we want
> memory.zswap.proactive_writeback to write back entries that
> have sat in zswap past an age threshold, to further reclaim
> the DRAM still held by the compressed data.
>
> 2. Even when memory.reclaim is running, the fraction of zswap
> residency that ends up reaching the backing swap device is
> still very small for many of our workloads, and the userspace
> reclaimer has no way to participate in or control the
> granularity of zswap writeback. So in our deployment we prefer
> to leave the zswap shrinker disabled, decouple LRU -> zswap
> from zswap -> swap, and use a dedicated proactive-writeback
> interface that lifts the writeback policy into userspace where
> it can evolve independently of the kernel.

I see. It's interesting - we've been dealing with the opposite
problems (reclaiming too much from zswap) that it's refreshing to see
the other end of the spectrum :) We should invest more into this to
see why we are not reclaiming enough, but I see the value of adding a
knob to hit zswap exclusively.

Regarding age-based reclaim, I agree with Yosry here. Let us try to
land an interface to do targeted reclaim on compressed memory first. I
do see the value of age information: with it, you can track zswap
entries ages and the distribution of refault ages, and only reclaim
the tail. However, I wonder if you can just build a system that adapt
the reclaim request size based on PSI, refault rate etc. similar to
how you're adjusting memory.reclaim on uncompressed memories with a
senpai-like system. Something along the line of - if we are swapping
in too much from disk (or if IO pressure is high), back off, and if
not, stealing a bit more from zswap pool (perhaps with a bigger step
size), etc. Is there a reason why zswap cannot adopt a similar
strategy?
