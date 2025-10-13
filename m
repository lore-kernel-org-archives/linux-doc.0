Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CFC42D7DDC
	for <linux-doc@vger.kernel.org>; Mon, 13 Oct 2025 18:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760381652; cv=none; b=D80vGj3huHRAU468jSC2G4udW8s8az/EYM23g+y4Nyw7clKGCuPmVA74VEGl1nf+jDornR7bTJsJAHc9Ppa7X6CsTKAsQGdGQa9sLAKUUBW2wToKSqzReUSJp1ZwUFdI4LNrv/QAJe08K3dlP/mITsyC15rSpin6dAJ45m6nt5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760381652; c=relaxed/simple;
	bh=Q0A8mwHB6ISznX1IsEIotmy3Sl/eaR8kzKeY3PLseig=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p2BO1ioAingm88kdFgAY/4x2V5C2wLJlqISVqzNLwQu1lde75K9zn9Bivy12xwFhZIeE9dk0mfSzvG1T4y014yjwJBGe9xoJRWHhzrmukpD6ZiLgjwXywJyn2TFgWMJ5WNZXpelYRWfofzQWtq5NCwxGXnb3xG92mDIB6TzAcRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iDhhy3hW; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iDhhy3hW"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-875d55217a5so626076385a.2
        for <linux-doc@vger.kernel.org>; Mon, 13 Oct 2025 11:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760381649; x=1760986449; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OHvdDoFLXKQzTfUBohM5QpfVzGeutBShrm8qkwsGAgA=;
        b=iDhhy3hWQseR7B59Wk9B1f1X5jyath/Vv1m6ebI7H29S1vvYX6vMnQ3ToYPWAWwJUf
         KogVPsls1PuYOmBJZZsKhmYfqJWhawxOO/jQW2Zd36FIr0VZwKyytraEV8ZQjhsiquKT
         8U/DgtZm/LBOH3sITn2q+qLwHHdZk/TwqTr0Lgz0PVxEVezb4L01HkZupGnKTuJT3QXX
         QiK7W69yIlzxc12ngLPQ297WhE1NJBvA+bcqRgtWl/6h7ziB37bozqi/nnWtGcLxzF0e
         oPd3Ma2yPQ0FfC6+IjBkEPm7sOjUjvE1B5LQKtDCnTp+4z2xorUoAsBv0RJ+504llQ1n
         umfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760381649; x=1760986449;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OHvdDoFLXKQzTfUBohM5QpfVzGeutBShrm8qkwsGAgA=;
        b=UHGNrncGkReJTnDQLZ/qqA7aGvGt5gdNz3CWr2FS5p9MkCdDA0Wy8MxCjpjS/q3f5r
         R6kqipCoZsZp5YP8jCVlyQbxK7sDy2/Ycz3DykhdIAjsHZ9Z1QLUxnOICsKoTtopbeXH
         jrQo/i2+1AxnDHljTA4xYR448aTRwgfkoQNZlsbkBPo627YDuWeoEK8F5Wa7SJGvP0Si
         YYmHjwK7d1opRQ2t9x8zSO5hKMBN9M3h+a6aCsJ2sLftjNvP8UzRzQjRnbIUB+mA82YB
         /bgOTFUj6xDIeIiTYn6UnKtXA6WyW+0KcJhWzmsiXiMxxG9jIldDHBuH8m6fhBMo2grN
         PdXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjAy6LyjgZMGoO3C4WLGMdCSgeK9+vxNHjvjAgXXbZHD4Zfapof8yl6UbF4b43MRxGTzgB2Q3xr9o=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUed72qfeN306b77ntz0rEnweLLWq0tN2vx+sANeVbAKz3pzrE
	OsoJ+eU1CiRpxwX/Rka54HQoUAmEcrjTYKMaXsAPOZzUWMuUDkj3w/B5E0FJ8yk12myITmvvZ26
	0IJ0w30fWLxcsFEm+SPCt63/p2XPKN4XGUJx+GE0D
X-Gm-Gg: ASbGncs9JBOELZcRBlgsQOzNcTHcNlfhi+zplhFa2nlMbHs3afagyH0nOUyb7yQ79lR
	ixgAmkIZPOvMpchl72VB7c0KYbg1DvOU5GgkKE2oFnPWXglllXH/7NaxjYJ3jQvlVg8krbU//Ky
	OoojM/lW0F9NGnggLZ6XJj6yy2nklkfRL0TwJ2qscf9BwbzlRK2MBR5UWMkBl7ANNe/NwHB/T3z
	NBb0yb0WjqLNOXx0NWQfiVRdB4uUlpA
X-Google-Smtp-Source: AGHT+IHEX/LXCcXiIAvMWCf1qx+3kkMbx/P3MOisSt6xugJLgd5lVynv5AI5WAJHsRmWmbQAX0ncoNz5Nk1IfQjetPE=
X-Received: by 2002:ac8:5902:0:b0:4de:b0d4:dda4 with SMTP id
 d75a77b69052e-4e6ead7493fmr328872751cf.69.1760381648539; Mon, 13 Oct 2025
 11:54:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251013101636.69220-1-21cnbao@gmail.com>
In-Reply-To: <20251013101636.69220-1-21cnbao@gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 13 Oct 2025 11:53:57 -0700
X-Gm-Features: AS18NWAe_NmExu5WITMBDbR0FpCc3scky7DNzwEUSRCGS5tETmNSC2IUauhYc4w
Message-ID: <CANn89i+wikOQQrGFXu=L3nKPG62rsBmWer5WpLg5wmBN+RdMqA@mail.gmail.com>
Subject: Re: [RFC PATCH] mm: net: disable kswapd for high-order network buffer allocation
To: Barry Song <21cnbao@gmail.com>
Cc: netdev@vger.kernel.org, linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Barry Song <v-songbaohua@oppo.com>, 
	Jonathan Corbet <corbet@lwn.net>, Kuniyuki Iwashima <kuniyu@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	Willem de Bruijn <willemb@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>, Vlastimil Babka <vbabka@suse.cz>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Brendan Jackman <jackmanb@google.com>, Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, 
	Yunsheng Lin <linyunsheng@huawei.com>, Huacai Zhou <zhouhuacai@oppo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 13, 2025 at 3:16=E2=80=AFAM Barry Song <21cnbao@gmail.com> wrot=
e:
>
> From: Barry Song <v-songbaohua@oppo.com>
>
> On phones, we have observed significant phone heating when running apps
> with high network bandwidth. This is caused by the network stack frequent=
ly
> waking kswapd for order-3 allocations. As a result, memory reclamation be=
comes
> constantly active, even though plenty of memory is still available for ne=
twork
> allocations which can fall back to order-0.
>
> Commit ce27ec60648d ("net: add high_order_alloc_disable sysctl/static key=
")
> introduced high_order_alloc_disable for the transmit (TX) path
> (skb_page_frag_refill()) to mitigate some memory reclamation issues,
> allowing the TX path to fall back to order-0 immediately, while leaving t=
he
> receive (RX) path (__page_frag_cache_refill()) unaffected. Users are
> generally unaware of the sysctl and cannot easily adjust it for specific =
use
> cases. Enabling high_order_alloc_disable also completely disables the
> benefit of order-3 allocations. Additionally, the sysctl does not apply t=
o the
> RX path.
>
> An alternative approach is to disable kswapd for these frequent
> allocations and provide best-effort order-3 service for both TX and RX pa=
ths,
> while removing the sysctl entirely.
>
>
...

> Signed-off-by: Barry Song <v-songbaohua@oppo.com>
> ---
>  Documentation/admin-guide/sysctl/net.rst | 12 ------------
>  include/net/sock.h                       |  1 -
>  mm/page_frag_cache.c                     |  2 +-
>  net/core/sock.c                          |  8 ++------
>  net/core/sysctl_net_core.c               |  7 -------
>  5 files changed, 3 insertions(+), 27 deletions(-)
>
> diff --git a/Documentation/admin-guide/sysctl/net.rst b/Documentation/adm=
in-guide/sysctl/net.rst
> index 2ef50828aff1..b903bbae239c 100644
> --- a/Documentation/admin-guide/sysctl/net.rst
> +++ b/Documentation/admin-guide/sysctl/net.rst
> @@ -415,18 +415,6 @@ GRO has decided not to coalesce, it is placed on a p=
er-NAPI list. This
>  list is then passed to the stack when the number of segments reaches the
>  gro_normal_batch limit.
>
> -high_order_alloc_disable
> -------------------------
> -
> -By default the allocator for page frags tries to use high order pages (o=
rder-3
> -on x86). While the default behavior gives good results in most cases, so=
me users
> -might have hit a contention in page allocations/freeing. This was especi=
ally
> -true on older kernels (< 5.14) when high-order pages were not stored on =
per-cpu
> -lists. This allows to opt-in for order-0 allocation instead but is now m=
ostly of
> -historical importance.
> -

The sysctl is quite useful for testing purposes, say on a freshly
booted host, with plenty of free memory.

Also, having order-3 pages if possible is quite important for IOMM use case=
s.

Perhaps kswapd should have some kind of heuristic to not start if a
recent run has already happened.

I am guessing phones do not need to send 1.6 Tbit per second on
network devices (yet),
an option  could be to disable it in your boot scripts.
