Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793640914;
	b=s0AXarSJGXE0lQtTg6db8Lj6pgouEOwJY5x4d3MrAZuTXrDwN8Dr86bfyZRyS9rOrcVG
	 CpnDdFgpX2XeiDQEhLNpdmGz3uE9hNV/0hqkeQdNctpUlXXspvjuQdsi+qpVcvl55z312
	 I6wZZq0KdC4WJj3ZJGld8kFkoFziMzTPJ8Jr2kXfqaS89ijovr2l8TiEucihlMjIXT2rt
	 Hc7pzNTWozAPIXNwdzsoIhMgFzeCCQdwaAZaGjImAbPnDgNPBBlJpEEGg6SJbj1y352Am
	 muHjEWoA9tP3AEkUO7NBG71Xh48IuVcpSHGlV8W83ffImcZ70JkYeytCKZz0e03gO+w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793640914;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=VnBhs1QNRjF1grEs77jlwblGRfEeujN01d/Qt9621rs=;
	b=wWraIsZ70RJFGXzz/WJZK4pxZSfiS5sv+mf5YivoI+zln1f66ca3bhJgAOCJFnxH9HDb
	 T+fq1ctRU+rSbZ8jTfaebNK9SvN4+tAKIuJCkIVT7tZHh5ljdLev00MfMlojBFre5qC1N
	 SU+n2ZHwbvpqJxCXpyXNDWAdHF8zM1SHI9yu2pX1U5RP1vhX/AlMPLcj6243cJfPQJATr
	 xWVdLffS6CFX3k1BOXJsxbYpg8ze0dimmpani+DtZImiEeBc2L6Xovl5Fbd4EnBdz4fDu
	 h/9yNMmn3391SpAJVYl1mhDPetZC5yQJzDjthKMAmjZkFCP0fGuTomJuk5EiskBm8jA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=DRIDPLph;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21BBF606C3FE
	for <linux-doc@vger.kernel.org>; Mon,  2 Nov 2026 17:35:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21BBF606C3FE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=DRIDPLph
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a018493d57so113335e9.0
        for <linux-doc@vger.kernel.org>; Mon, 02 Nov 2026 09:35:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793640912; cv=none;
        d=google.com; s=arc-20260327;
        b=U+N6DPFmAispujG7M9EzMZrK8++UHQ0JKCqFCjjhKZ/a92+mlvkcxrWYgud7n5oCSK
         UFvGcbC1Om+XqFZoW0Zad1oJpm9/4Qv8SvNlUywvEwS7EZcjruOJnlFNpJF4g6lcztDh
         fZaUX3g29tPft3m9teZ6ewMrCtkncDTLRYB+65B7hAAnQYyAw8Z8Z/ZlBN0YogBakIdJ
         WmCyicuF2C9ztrCHtVDR3C0XfBhUficChUpytpjWWSty1Ujqmqgnajv2tJzJr05vqFax
         gHEg8Qym8w5LvxdsA9I+Na7Y7m0hNf9Zwj0y/RMN9+1V81cH6R7UiitOg3S7un1Ji7mf
         Ywhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VnBhs1QNRjF1grEs77jlwblGRfEeujN01d/Qt9621rs=;
        fh=5GszbXdz6ulRYKsngeysstvENqtvbBWRxssPdwJy5EQ=;
        b=B5iBO1SqPIi/bE9vEipzKxHOVUkNvr+OTivQjY6ZbPpLlfPVIGgDdOeu4GcD3A/gFF
         YSRZQv+nK1vssSYEt6r13PQOrjAUlYHwu05ZtOe1l4L+733O48ZjlwdrmxLXnkLH475X
         CGIvjbvdsbnjGR+oyaRl1+C7eyirUNgk2i9DZ8ua7h2XuHDwrT9qoIWxtRCEOQBEk3fn
         Dq3+I5zkDo2qPBTsz3niVmz+XWAgPT/YgmVA22oJ7NUCSjgJpvhWG5E6+vHSH7+fi13K
         OpirhH8TGTP6Wd2lBNmnuJ3bJ2WKd/pZ15xtQBxrcN4ExmA6oH9O+sAcvw4m4CW6jfzH
         gipA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793640912; x=1794245712; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VnBhs1QNRjF1grEs77jlwblGRfEeujN01d/Qt9621rs=;
        b=DRIDPLph/lguA/rSUZf1caJpDBqkcoxGpAcCBv+EgFTzkpEor/Yqg//nc+FmPvDOBf
         ZjbWdjsBoW3joAzgrPToaz3e2DyamggT+yHvnSo8fL9WLfTgUdhczNJAwMeJjG2S8cD4
         SIAoaOVUswyON7/m8cKvSVgGa7YYF/hqCEyZHe1cgvFwOLjYIySxhnLH7ax6/oDaYcSm
         FVCXQ1AsO264FYWSSoXoka3aO7ZBNR6qrDRDE+LCqGNrRs9btMiH95l2U/S1IpbUk3Er
         X0qn7xmTgoIdZZzT0dGPz3Xe6oYvg3/lMPNG7zl3ThJhMYV8f2TEkrLBKdHCggvo/jCi
         HeiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793640912; x=1794245712;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VnBhs1QNRjF1grEs77jlwblGRfEeujN01d/Qt9621rs=;
        b=cAe/3R8aj2ujr/L/jCOd/foB1k55PmzGxhQNSuBfL7591PAHGcgafKTqqCP0KemHbH
         gdWzj2b6SeJHASYNcs7SpHlrStQ9JaCIiv5JTwdtlINkibOmNk4/3sp67qmqX8UOXTM6
         KNo53zEeANJPHb8PAusnn+PaCFQdban9cA30hm8hpwLO8JEslWVaJqIUDwPC5cFjxDec
         Mx4yttEkLB06pSfgJ/R5CeMXejy/AYcgFYNOjPuqOrpQ3ZIb0Z/l4ZztvXLgTI2crbRd
         +5rOhL0OYMVifdeJQKdkxH/Ddtc4U5gLjYiHM/sYrpmM362WggSjhPtLqcYJ34hBB/yE
         crdA==
X-Forwarded-Encrypted: i=1; AKwUvByhEuch/kqkBWkHTvjWkn9VMB7gSOTxfP4dpwsyFnk7m21RVpIfSpHPw6N8qHMfdDLhEY11G9RReds=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ0UoTlUKt5ioP77LyUN61w2BVugJquWtyZEkiTfs4xyrCeOzkK
	O5CfzjiefIEFfDb8czD7Inl/oUQ8Apg8Oa/vmviueAqOTP9s46X9TRBOk0m6YPgJrCL+GdTHbAe
	haPrNgdeSVHdS9i85BrxH0+xhVlwckVpwsp27u2V2
X-Gm-Gg: AYBFou1yInzKn5/2Xq+sjeFc1tkPsNj3gf/+YbHDnoB5gVv49hdlPEfdHsT7QuzoDEZ
	pn3pMlpzcUZtCQGUsP8VCmjDmoyWQxV89FxUBLCdDBYGecsB4DHew2AiymZSLb9R1tyHGOjoZ0J
	tmoBMOeXaOUAq1fNepUsfeY5oQHMy+qdjCdsUxCTLUTrhh8wB/QX8HVCQ99ybwibSFminVg3YAh
	jLAdNGj6lYU/yDHZmAF21qeST1xMUdMrD4j9owo31QQp5+cyzYB4tWMAL7Ec+6qoBhHQ8GznJ0M
	+hptl+Z1Wmu70JtsQ9CbZ1AFsSV4WGxQmqXsUFAyFTsgmmCtIdYilyalx+nBKP7Jy+EgYa3MV2G
	YVt2kLzY4linuUcgUykbG+ECXtB3F3JJfIqgwUp/lfk4+wuxreh8rZQvDyJPEkyIizlCmTpyW0E
	HJcEaOOob93uv/oVFASVUn+elvxMwFj4rhmIR/2zmucaXa
X-Received: by 2002:a05:600d:8:b0:4a1:e728:2915 with SMTP id
 5b1f17b1804b1-4abf8764faemr3392105e9.9.1793640911875; Mon, 02 Nov 2026
 09:35:11 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028010611.3929937-1-tjmercier@google.com>
 <20261028010611.3929937-3-tjmercier@google.com> <auHMXBwnwuRwHLmo@KASONG-MC4>
 <CAGsJ_4zuGRjH+=1JxH4BYEC-vJumKjkhXPse0jW_nKEzQXXVmg@mail.gmail.com>
 <CABdmKX1PvZjnJkqD48_Pb64Je_oZVO3F-oaxMsBYzHmY-GjbDQ@mail.gmail.com> <CAGsJ_4xggGnAhguPkCJ5k08v3QYKUv07_MhF-acXdBczMAEpdA@mail.gmail.com>
In-Reply-To: <CAGsJ_4xggGnAhguPkCJ5k08v3QYKUv07_MhF-acXdBczMAEpdA@mail.gmail.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Mon, 2 Nov 2026 09:34:59 -0800
X-Gm-Features: AclHuK8o-leCSnae7wNuTxaZ91TaEx6wKMCDX7_41RuiJN7yC-g4TVBlixhIwdY
Message-ID: <CABdmKX17z8146_dTxMuBT5_rKtdvGGHdYvgNg-7eSqobEaCyqg@mail.gmail.com>
Subject: Re: [PATCH 2/2] mm/mglru: stop rotating offlined memcgs to the old generation
To: Barry Song <baohua@kernel.org>
Cc: Kairui Song <ryncsn@gmail.com>, roman.gushchin@linux.dev, muchun.song@linux.dev, 
	Andrew Morton <akpm@linux-foundation.org>, Kairui Song <kasong@tencent.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Baoquan He <baoquan.he@linux.dev>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Johannes Weiner <hannes@cmpxchg.org>, cgroups@vger.kernel.org, 
	linux-mm@kvack.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 2:03=E2=80=AFPM Barry Song <baohua@kernel.org> wrot=
e:
>
> On Thu, Oct 29, 2026 at 5:22=E2=80=AFAM T.J. Mercier <tjmercier@google.co=
m> wrote:
> [...]
> > > > > diff --git a/mm/vmscan.c b/mm/vmscan.c
> > > > > index 636152d8c94d..45a2c1021f4f 100644
> > > > > --- a/mm/vmscan.c
> > > > > +++ b/mm/vmscan.c
> > > > > @@ -4538,7 +4538,6 @@ bool lru_gen_look_around(struct page_vma_ma=
pped_walk *pvmw, unsigned int nr)
> > > > >  enum {
> > > > >       MEMCG_LRU_NOP,
> > > > >       MEMCG_LRU_TAIL,
> > > > > -     MEMCG_LRU_OLD,
> > > > >       MEMCG_LRU_YOUNG,
> > > > >  };
> > > >
> > > > I think there could be other usage of this LRU_OLD macro, but indee=
d
> > > > offline is the only user currently, removing it is cleaner.
> > >
> > > I'm imagining an Android use case where, after LMKD or similar
> > > userspace killers implemented by various OEMs kill an application,
> > > we may want to prioritize reclaiming its memory by making it more
> > > likely to be scanned and reclaimed, while the killed application's
> > > memcg still exists - not offlined.
> >
> > I think it's an idea worth investigating. I had a similar idea which
> > is proactive instead of depending on reclaim hints. The code is behind
> > a currently inactive flag - it runs memory.reclaim on an application
> > cgroup before offlining it (so no zombie or reparenting), but I
> > haven't had time to properly test it yet.
> > https://cs.android.com/android/platform/superproject/+/android-latest-r=
elease:system/core/libprocessgroup/include_platform/processgroup/processgro=
up_platform.h;drc=3D2ed7b05ab42dd67391ad2819b0ee399d89128ead;l=3D33-34
>
> Thanks! I know Minchan Kim has explored something
> similar: releasing exclusive file memory when processes exit:
> https://lore.kernel.org/linux-mm/20260421230239.172582-1-minchan@kernel.o=
rg/
>
> The idea probably wasn't well received because Android
> workloads are quite different from typical server and desktop
> workloads.
>
> The fundamental assumption is that a killed app is unlikely
> to be restarted shortly, so its memory is expected to lose
> recency. In practice, this is usually true.
>
> There are some exceptions, though. Some badly behaved apps
> have monitors that keep restarting them whenever they are
> killed. We might regress these cases by reclaiming their
> memory, only for them to restart immediately and have to
> read the data back from storage.

That's just abuse and I do not care about restart costs in that case.
I was made aware of one of the strategies apps use for this in 2022
and closed it by freezing the app cgroup before killing with:
https://cs.android.com/android/_/android/platform/frameworks/base/+/79825c6=
f2f8b46808e4b431fe52b3be78f1e8ac8

However there are also cases where apps are restarted by system or
vendor components after kills (quicksearchbox comes to mind) and I
don't think we'd want to zap all that memory proactively. Arguably
they shouldn't even be killed in the first place, but if they leak
that'd be a problem.

> That said, this may not be common among apps on Google
> Play.
>
> >
> > > Similarly, a foreground application might benefit from a lower
> > > chance of being scanned and reclaimed. This suggests that Android
> > > background-to-foreground transitions, or LMKD itself, could
> > > potentially leverage the reordering of memcg LRUs.
> >
> > We are planning to use memory.low/min for foreground protection.
>
> Thanks! I guess the challenge is figuring out what value
> works best for different apps. Should we collect data in the
> lab, learn the appropriate value dynamically on the device,
> or simply hardcode a relatively large value?
>
> Any thoughts on this?

Yeah per-app profiling doesn't really scale to millions of apps. I
think our approach for foreground apps will probably be to use a
large-ish memory.low value that is scaled by total device memory. For
system services we're experimenting with service-specific values
closer to their actual working sets since there's a limited number of
them and we control the code. Even there I think some scaling with
device memory will still be required, since more RAM and heavier
device use mean more state for system services to manage.
