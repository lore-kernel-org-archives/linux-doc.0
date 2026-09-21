Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1295245D5E7
	for <linux-doc@vger.kernel.org>; Mon, 21 Sep 2026 10:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789984921; cv=pass; b=cLdIJEOPGME5NBcunC4McU54xHW1sSTL+Yiu0ssEsNqTq6afqkLpHOJFKM+IQTG/7iOFVTTAXorvT7WY9k3Bqrl91LoS7AVX/LcCNCx3wmhiWsFu1N4Mg1gTB1jeLOoGFqjLB4xYaiuNWTFgM9jOwelQD2/hvUmbvdGJpsGTAnQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789984921; c=relaxed/simple;
	bh=C0u7dFIOwFw7/Fou9k8GunftPf/Pv/MvXmJEJ9Wf4iw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qCJO3RricjY0dExIq+EpAxne7DA9zeM3qFBGS/ESsTnXS7K7PGjy+H/U9KyzGk5JV1zw1hxdBW+Fe1NNRxxGqpz9r45S28usYo1NCFrRG0pQnO1M9XVPf09rzv1FVuCAzdcTqej1ZewIIm+Aw+j71b12w0if5TPN+OjLU5AQ7uw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZzlxFC1R; arc=pass smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZzlxFC1R"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc52c1b8286so2204098a12.1
        for <linux-doc@vger.kernel.org>; Mon, 21 Sep 2026 03:01:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789984919; cv=none;
        d=google.com; s=arc-20260327;
        b=C6xbfM+EmqvxQ5brD3dToWsiR/BR/1BOS9uH38OqEKLl8ISMd52ll1+Bhe/6eAi89o
         SUBC8cJSJ3wvyQVJCPja3NMbIo5wzGfSXgPN/PsT7U9Th0fAeA5b96y/VJHfsi2WnQZJ
         Tqw0d4dYew7FRfhnQZoQIRvMb3yEXyyx5NRwZ7gPcKZCnTO6LrewUDGJhfXX+83fGYv9
         1/+EZNx6EokE9dnV1blBjXk7fZUfl6F/FJLPzUlawBuRA6xMYdnyKW9X7Xl18KKJDXLW
         ZV0YD//Cudf6tHIGJbCfqw4X/ODvcIqh4scGEmnUi1/88x6hxa+y+7Ylzw/qzUDcDVTk
         2gkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rtgPtMT7frKhH4WMKdwbGRv258dVgwZlagcB0deq+D8=;
        fh=scC5GYzA5wB/HKO9acOCyYV1wZD3hUZAQN+Rq6Mz8CU=;
        b=rjWSyu4AyfXWvQeHkNzupaZyfHSPkXGnWRg4Jri+kRnc0jFJ/i3u92YcZKcXs+VWtF
         5M/pHaP2b+Kw8ldOgGrraJSsQJN0kARqq5JGmB0RnrhTepDveYi+kZKmWzy+R2Abg+MS
         4eLNdVEiAWME8dMw91d+m+UYK8PUnp5A57ZI8LoboUm5xEqNyQ6R8G6hUeD73G1pD7Wt
         5LHWDRE8UR1vpL1RXU4hNmdAG8yPlXtsVOVQz9SnO+mXzNrChlfMU6ed3NI/JUY0KSLk
         NUwmcvKdmQ3tn8gccfXIfU4AIO8KYSEQdcc29pCoBMKEnOf2fs6Ezh9ho2x0u8cMyWCR
         SrJQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789984919; x=1790589719; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rtgPtMT7frKhH4WMKdwbGRv258dVgwZlagcB0deq+D8=;
        b=ZzlxFC1R189DrN3TSnXfYhpWLK28QabWnQcJ4+wU5jN31B7nigwVthzzf4P+0COfY0
         dNEgN7ioxlGortpcWozAnFnb5zQZS8JCwof/IoT8RCNcXUraPQu0pT5/H4zM1CEtoK9n
         KzuXBAXw+l7MzSuUOIN1NMjLsKcCHTMoW8YFj0PkG/9LnvEvmsy/7rUh1rHfOoHU4y4D
         pPlO3BHVPOMcSLTicIZdiceAmKVXviv1209VCuC1KelByIo86HHO/udjGtDtEqfTmScZ
         VjX0d24IGt0LJ8DAtNt+PMW5BYO5oti1bveV9E4zlrYTTkDWG6rPfiCwsmbXToQJ2Akc
         NNFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789984919; x=1790589719;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rtgPtMT7frKhH4WMKdwbGRv258dVgwZlagcB0deq+D8=;
        b=ipG3aXLbToJc3kqCT2ugL6rbxgcf0ea3UZ/nFhzOkzNbrurpBNQsVpsLQLjXUBi2Fm
         T6dqpusvVcqAlk59zDlaQqpkuprcWzlYwqqxlZS64hJvuNEGU9KqU3EXJ12a9iYKeYnj
         zr1s2hc8zBG3IvJrn5MNRib9AMhJC9jOJH2oLhQEF5ntM2BoVcSr8M7RCC27JKau0+Wc
         tUoA7LHK/kRLNB49PJYma26uGZm5Zg7hyNfTEbTgNXlzRnd6KJIxuJqanISB7hSk8mOZ
         xftFbNRJ0I5rJnOTJuO3MJVSLfzf9IyXYACk29MGedMv/YdwuIUknRIj+YKt/IrLH2fL
         eqsg==
X-Forwarded-Encrypted: i=1; AKwUvBzA/9OJR/bcGv0VCik1lnGIkz/trGaRg5rMOddSKYhxKUnZnIpVKnQnS76T33iJHp+HBgNDYBAWcig=@vger.kernel.org
X-Gm-Message-State: AFuF++mCQqSeuEZdRtfUrANjFu+KvlmNnkMdnvCAQCk4kjcxXa0rWs72
	LKblUpCdGd8W93hP064LFNYLniv7XAIWdefVpCtPllVh/TDwQnjNy/fAeQNyI9kQDZnZXA58unt
	TMzR/SNIFhtUT2r7qFSkXAWDxpwfk74U=
X-Gm-Gg: AYBFou1BncMy9qv9A0Fi59gJGnzjv2uObViwIAIZUfVOn7POGmlBNgA8vXnEqruQNEK
	n9ejiK8j+d3aYWxP6Z9NF9vkrOgO3ZO7RwWwFgXuu0E/zGpopJEzEFckc6b7M7JQITiiOvbbbwf
	+ro+hMbYqlXLAhjUwSIzJNSmdIKsmX1tgYxaNZY3fiMnA7NXy3NsN3gYJpk8s73f4xklOB7CsyR
	AxyQI1on4DEHkHpJvEdK6REuKjWaS+mBWyV6umFeP3YMsc1sBxlYIjboSdscJNLyopXwwIbwZrw
	q1j/h8c7YJU10RnuQUGLCuBwSGHe15eUcM/rHIcaZOGw32IXM3ZLTOlSjJAxLOhPanx4d+9ILDH
	14oCLzeOOx1M=
X-Received: by 2002:a05:6a00:2d93:b0:857:73c3:4466 with SMTP id
 d2e1a72fcca58-87343ea8041mr17463837b3a.21.1789984919241; Mon, 21 Sep 2026
 03:01:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAKEwX=MP=zuTnLT=coS_EpXe2KwXq=79yBnsEGXwcZZsW3S=Yw@mail.gmail.com>
 <aqJXx2vtbKaRLt3x@fedora> <aqLi6cIjD2wJwk0B@cmpxchg.org> <CACePvbUG1ApMzMdEzf-63rpjgGVNsRk21pT72OQGJpM=OtRUew@mail.gmail.com>
 <aq6cVXPLUUwJA7-2@gourry-fedora-PF4VCD3F> <CACePvbVaPDnva8X-Xmz84r7j5HjTuih-w5phpw7cerK2uPnK6w@mail.gmail.com>
In-Reply-To: <CACePvbVaPDnva8X-Xmz84r7j5HjTuih-w5phpw7cerK2uPnK6w@mail.gmail.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Mon, 21 Sep 2026 12:01:18 +0200
X-Gm-Features: AcwNN1W4zNuvHUUOGHULyeGe0PhiMgbBymHHBRLY42qLX54efbcuYBMEOcf7diI
Message-ID: <CAMgjq7CJBHkoZmg9oKNgGA8czL0djyBTCAkPz8ETm-tX=Qci4g@mail.gmail.com>
Subject: Re: Path forward for Virtualized Swap?
To: Chris Li <chrisl@kernel.org>
Cc: Gregory Price <gourry@gourry.net>, Johannes Weiner <hannes@cmpxchg.org>, 
	Baoquan He <baoquan.he@linux.dev>, Nhat Pham <nphamcs@gmail.com>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Yosry Ahmed <yosry@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Barry Song <baohua@kernel.org>, 
	YoungJun Park <youngjun.park@lge.com>, Chengming Zhou <chengming.zhou@linux.dev>, 
	"Lorenzo Stoakes (Oracle)" <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	"Vlastimil Babka (SUSE)" <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	=?UTF-8?Q?Suren_Baghdasaryan=EF=BF=BC?= <surenb@google.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Rik van Riel <riel@surriel.com>, 
	Wenchao Hao <haowenchao22@gmail.com>, Jonathan Corbet <corbet@lwn.net>, Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Tejun Heo <tj@kernel.org>, 
	=?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Kunwu Chan <kunwu.chan@linux.dev>, 
	Meta kernel team <kernel-team@meta.com>, Linux Memory Management List <linux-mm@kvack.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org, 
	"open list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)" <cgroups@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Joshua Hahn <joshua.hahnjy@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 19, 2026 at 9:02=E2=80=AFPM Chris Li <chrisl@kernel.org> wrote:
>
> On Sat, Sep 19, 2026 at 6:08=E2=80=AFAM Gregory Price <gourry@gourry.net>=
 wrote:
> >
> > On Sat, Sep 19, 2026 at 03:45:03AM -0500, Chris Li wrote:
> > >
> > > I found this new concept of "compression space" very confusing to me.
> > > Can you explain the swap behavior and problem using only normal memor=
y
> > > usage reduction and latency without introducing a new term or new
> > > metrics?
> > >
> > > The normal user doesn't even know what compression space is, let alon=
e
> > > what makes it transparent.
> > >
> >
> > Sure they do - it's the amount of memory consumed by compressed data,
> > including the metadata associated with it.
> >
> > converting Johannes statement to diagram:
> >
> > >> Compression space is not a separate resource. It's page tables,
> > >> backing pages, and swap descriptors. It's just MEMORY.
> >
> >                           Page Data (PD)
> >   [page tables][                uncompressed page                  ]
> >
> >
> >                         Compressed Data (CD)
> >   [      recovered space     ][pte][swap meta data][compressed page]
> >                               |                                    |
> >                               |---------compression space----------|
> >
> >
> >                         Memory Pre-Compression
> >  |[  PD  ][  PD  ][  PD  ][  PD  ][  PD  ][  PD  ][  PD  ][  PD  ]|
> >
> >
> >                         Memory Post-Compression
> >  |[CD][CD][CD][CD][CD][CD][CD][CD]-------- free space ------------|
> >    ^----------------------------^
> >          Compression Space
>
> Thanks for the explanation. So the compression space is just the
> actual data store backing the zswap/xswap/zram.
>
> > It's actually really confusing to represent this space as a traditional
> > swap device - built on the assumption of a pre-defined size limit - whe=
n
> > that size limit has already been defined (the memory itself).
>
> First of all, the traditional swap counter has a very well-defined
> meaning. It is the size of the memory that, when accessed, requires a
> page fault. A page fault adds significant latency to memory access

Yeah I agree on this. Swap just about makes resources not directly
accessible by the CPU act as RAM, whether that is storage on disk,
compressed memory, or a network resource, all accessed through a page
fault. I hope we won't make this fuzzy in the future by introducing
too many magics.
