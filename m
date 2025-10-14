Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA20E19258E
	for <linux-doc@vger.kernel.org>; Tue, 14 Oct 2025 05:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760418489; cv=none; b=Of6Vp37ygF8aXq8RxaQOasq7Tp+9sAz93D08u5g0zO6zOyI90R/I49OfmMT5fLFSHs4xYbYylXUPa62DpLOctBtgRq6755mV5/8nSUarLEB4ph0z+QOM9DtPgJWXCnc/s/BKStbX74O5zRvg2wKhZYuTMJaLWen1qAsRtXEqeNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760418489; c=relaxed/simple;
	bh=932RvO+/hs821ixBu+SCgqlcqoMNm2aId1K7SmkKHX4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T3+P0IYmKH6SsmE5TJrxq4pcaaP1fwr3vomGPrpSHHLVIn1cgv7NPPznAdz1IgRC4/OVI4gLwvu/2DANmqwjjroAKY7CJivhaLrBG1VBUG+qzAbJtoA5k2T8gpIdaAQPsvDzA8wnW6kMHFRpTBj76CY2Xg1ewHHZ88B+EmJODH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0aKgu/lD; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0aKgu/lD"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-854cfde0ca2so1027289785a.3
        for <linux-doc@vger.kernel.org>; Mon, 13 Oct 2025 22:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760418487; x=1761023287; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B5JkuuVSayA8Ofu2uznRObRn+eA97FQhk4dZT2qKwso=;
        b=0aKgu/lD6fAoextUtvtm+M5Bn3PtLhDN4NvSNEZrlGVfDKYtHO3Ucb7TSSmfVItlX0
         baEmLvVThX+a+n4Ny5TfuYHgQjfyqCk/CPUUSuCIfKUZwe8ggBbHE7v5IHgWCOXi3JWp
         SC+9jR0xcOKz4v8B9tVF15XWwhxV4pt0uJ239ZebS/d3KAHmztNAupJDJmJ+i8VoUTON
         WEUOumgOHc+mfL6OGGgWsnOsOz+djDYaHl8pFm6UZzHmCQN8br30RqOXDSADzYQXtwwf
         1fLT8cniKziQ0xkrQHbmyaT2ZyLQJf8GHLWpXx+KtCR56fK+N/2BeTry/MwxEEmidtWr
         gF9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760418487; x=1761023287;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B5JkuuVSayA8Ofu2uznRObRn+eA97FQhk4dZT2qKwso=;
        b=SeBI2w+jVNrGe/2PUlbZga0e/BX6R+ta2puS6gC+m6DHSARJaT2g8j1PdbE6dBuau/
         sHDVKb9bdfL2Kf6KiKE/vJVG5BpnFHdi59WOygWrIXksvl/CykzcGkESMr8A4JBCKfP6
         AD+BaVJKAO5OQiII43THuuJPuJz3a8vVB2u0LHfA3K+mTCvAAxqaamZ8LTahs2xzxivJ
         nbeqj1Yiit6zburv3ki0uXv+rIr1wuIrpDYhYZc2FRFcKkDSCGF7RvsZELEDxzPZOiez
         HYQ7FV6/f9iqO7TOOgRqQs+cMf+DDcfLkz2Ay9E8KKVU9+iEdMdx0jIZDbtHouOBNi6P
         OUGw==
X-Forwarded-Encrypted: i=1; AJvYcCWbyxVqsVPS7meL1q6E5nmDxvA/2ocI+0BhR4lv0ExTN69RsgCFuccGbRXio1Xk7g0CnnXBCGCyNiQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8DGSOu3K3hlnfIySFW7sNak19zFjhti/wnQGh7cZ699Zduk6Q
	cSH09F5Kz8GHLeq3eUVF+voKYh3Yq7sp2DH6ubXkkRd0H5RNH10hbJql5SmNUdKLIxgTcTK2Fef
	vRK17CRGaST+9yuX9S4E2jMguRj9muP68DmWGXGWf
X-Gm-Gg: ASbGncvRB/SeXKg/WwzQcqTeJ28uL7XHvEc9IXUBgrLBlNtOMWMdRgKH6CRG6CA0vqR
	mfEUFP5EMyZpXUhGjPFBoJ86OWDJj47QeNhFzhARUgQr/dgUct20dznU7AgmFFDjvr1lZreSlj4
	otFmWkOPSxLQaww+yKBNINJkx1ZqoD8S7iwdSLyGahf+JAKImsnBCay7WPYnqvDGHEDXd3+LAG6
	ID6yFBAtmlZPUqEhxbrJ2p2NAnb5kft1YZKiwu0tXA=
X-Google-Smtp-Source: AGHT+IG/8aE+aHcI9fnIx7BC8BEsSWywbVC7oJ9GTxoNgoK6tWmthKLsGkvfKsZG/szhyaZle3TfMxlghiUG7vn+aPI=
X-Received: by 2002:ac8:7dc7:0:b0:4e7:1f14:c30c with SMTP id
 d75a77b69052e-4e71f14c405mr115414241cf.69.1760418486272; Mon, 13 Oct 2025
 22:08:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANn89i+wikOQQrGFXu=L3nKPG62rsBmWer5WpLg5wmBN+RdMqA@mail.gmail.com>
 <20251014035846.1519-1-21cnbao@gmail.com>
In-Reply-To: <20251014035846.1519-1-21cnbao@gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 13 Oct 2025 22:07:55 -0700
X-Gm-Features: AS18NWCWxB4_7MksVcSk_C7g7SO9YHjPuxXQz_zjkiBQ0xejWPMAGosiT_EXkB8
Message-ID: <CANn89iKCZyYi+J=5t2sdmvtERnknkwXrGi4QRzM9btYUywkDfw@mail.gmail.com>
Subject: Re: [RFC PATCH] mm: net: disable kswapd for high-order network buffer allocation
To: Barry Song <21cnbao@gmail.com>
Cc: corbet@lwn.net, davem@davemloft.net, hannes@cmpxchg.org, horms@kernel.org, 
	jackmanb@google.com, kuba@kernel.org, kuniyu@google.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linyunsheng@huawei.com, mhocko@suse.com, netdev@vger.kernel.org, 
	pabeni@redhat.com, surenb@google.com, v-songbaohua@oppo.com, vbabka@suse.cz, 
	willemb@google.com, zhouhuacai@oppo.com, ziy@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 13, 2025 at 8:58=E2=80=AFPM Barry Song <21cnbao@gmail.com> wrot=
e:
>
> > >
> > > diff --git a/Documentation/admin-guide/sysctl/net.rst b/Documentation=
/admin-guide/sysctl/net.rst
> > > index 2ef50828aff1..b903bbae239c 100644
> > > --- a/Documentation/admin-guide/sysctl/net.rst
> > > +++ b/Documentation/admin-guide/sysctl/net.rst
> > > @@ -415,18 +415,6 @@ GRO has decided not to coalesce, it is placed on=
 a per-NAPI list. This
> > >  list is then passed to the stack when the number of segments reaches=
 the
> > >  gro_normal_batch limit.
> > >
> > > -high_order_alloc_disable
> > > -------------------------
> > > -
> > > -By default the allocator for page frags tries to use high order page=
s (order-3
> > > -on x86). While the default behavior gives good results in most cases=
, some users
> > > -might have hit a contention in page allocations/freeing. This was es=
pecially
> > > -true on older kernels (< 5.14) when high-order pages were not stored=
 on per-cpu
> > > -lists. This allows to opt-in for order-0 allocation instead but is n=
ow mostly of
> > > -historical importance.
> > > -
> >
> > The sysctl is quite useful for testing purposes, say on a freshly
> > booted host, with plenty of free memory.
> >
> > Also, having order-3 pages if possible is quite important for IOMM use =
cases.
> >
> > Perhaps kswapd should have some kind of heuristic to not start if a
> > recent run has already happened.
>
> I don=E2=80=99t understand why it shouldn=E2=80=99t start when users cont=
inuously request
> order-3 allocations and ask kswapd to prepare order-3 memory =E2=80=94 it=
 doesn=E2=80=99t
> make sense logically to skip it just because earlier requests were alread=
y
> satisfied.
>
> >
> > I am guessing phones do not need to send 1.6 Tbit per second on
> > network devices (yet),
> > an option  could be to disable it in your boot scripts.
>
> A problem with the existing sysctl is that it only covers the TX path;
> for the RX path, we also observe that kswapd consumes significant power.
> I could add the patch below to make it support the RX path, but it feels
> like a bit of a layer violation, since the RX path code resides in mm
> and is intended to serve generic users rather than networking, even
> though the current callers are primarily network-related.

You might have a buggy driver.

High performance drivers use order-0 allocations only.



>
> diff --git a/mm/page_frag_cache.c b/mm/page_frag_cache.c
> index d2423f30577e..8ad18ec49f39 100644
> --- a/mm/page_frag_cache.c
> +++ b/mm/page_frag_cache.c
> @@ -18,6 +18,7 @@
>  #include <linux/init.h>
>  #include <linux/mm.h>
>  #include <linux/page_frag_cache.h>
> +#include <net/sock.h>
>  #include "internal.h"
>
>  static unsigned long encoded_page_create(struct page *page, unsigned int=
 order,
> @@ -54,10 +55,12 @@ static struct page *__page_frag_cache_refill(struct p=
age_frag_cache *nc,
>         gfp_t gfp =3D gfp_mask;
>
>  #if (PAGE_SIZE < PAGE_FRAG_CACHE_MAX_SIZE)
> -       gfp_mask =3D (gfp_mask & ~__GFP_DIRECT_RECLAIM) |  __GFP_COMP |
> -                  __GFP_NOWARN | __GFP_NORETRY | __GFP_NOMEMALLOC;
> -       page =3D __alloc_pages(gfp_mask, PAGE_FRAG_CACHE_MAX_ORDER,
> -                            numa_mem_id(), NULL);
> +       if (!static_branch_unlikely(&net_high_order_alloc_disable_key)) {
> +               gfp_mask =3D (gfp_mask & ~__GFP_DIRECT_RECLAIM) |  __GFP_=
COMP |
> +                       __GFP_NOWARN | __GFP_NORETRY | __GFP_NOMEMALLOC;
> +               page =3D __alloc_pages(gfp_mask, PAGE_FRAG_CACHE_MAX_ORDE=
R,
> +                               numa_mem_id(), NULL);
> +       }
>  #endif
>         if (unlikely(!page)) {
>
>
> Do you have a better idea on how to make the sysctl also cover the RX pat=
h?
>
> Thanks
> Barry
>
