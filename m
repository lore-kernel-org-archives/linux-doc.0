Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794864092;
	b=UMlKR8vJPYXsYhVKpe+IbxC/0jxxlbMGyMW7TZgAf6r3gV8OAteqY8vCkqrJlT+KjJyw
	 L3ac8ebjsFvuHVri6rHnkQiizBb8auBuNHi+P6H8e2LtNnYx/B8GZH5ejO/DPhqYIHpKj
	 QVNTlKuBXG76fl7UGcChkMR0U+P/rEIgAVB3hxGsMVKSlhZVj+sak0TRH+ZQEk76RjQhd
	 ERZ8Ir1joSmhsdoqeMytkj2xCkGbOfUxCUH9gpRFk9tGwHcbweIK/XGiDF1K6si3kQ0qN
	 pw0SA0A1XY5aNyjuHqUTmeDf/nCQau/VwXWHzmuLGJRIEJvEymTnyE6ezlPi50cgBcw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864092;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=U2SUB1HJ1zwYZLXTcRtJPzZNMb9jj63+seYf6oj57bQ=;
	b=KCQexdBLE6rjAw8kpCCgLZCAC2pU+GZ/K5eFs1TKIjezJSmmhutSMVXlBuNg96b3TT6D
	 7TJbNuJCsCSrwYOxW0mSKn4/mHRbDlgQPgeX/5rTYTVkN+dz2G/J+zCimEhV3RWl6docS
	 L55BZ6rzxvUP6zmU/lMuedMCd1Y5wpeM218ykjyBls8N6PsIwDtRDNTOy655P5DK/YJk5
	 jGDGBwmDvN3GUtD6rQWn0Wg+KkGwNymw/Y33sQ4bpLvQUKrMLHZBGJxOkJ7+ny/fLdFQs
	 p1ScFTJ/2A+d/wtbJPkybc7Z4Bh1PTD1FCsLeSDSLlktlrfi5hDomcDVls5DGl4yhpQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mpc2ulQR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6BD606A323
	for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 21:21:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC6BD606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mpc2ulQR
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1ae7fc5681dso338c88.1
        for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 13:21:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794864091; cv=none;
        d=google.com; s=arc-20260327;
        b=aqX79isieh3zflN/gze6V6m5TQURH9vVR5EQjGn0nU+Nobyt64CxML/7UWiQnL/uab
         xsNQPdS1RWOOVHLgXctncrexKKQovT4DIv3gpzhLqBhCNO9CCDRV/tv3btyp2+YQmf7Y
         WMhvQZwc5XoHGRYFVuZrunYa5KGhMIChFBNdGA71pdOmXTMx7aS/ZY3BtXhdycYLXEdh
         LISlfYmZlxbA3i0HTgerEd3qp6LpjSR+165e6VIpGC/dIHYtvRyKC98GISCcRKJ5VoBt
         n1pQQqF89fg/0MocUZKZUecNNMFeBGJ56d5ySQ0iq9Uk5NuBInVzScVLwHknkCsEnZSU
         sWwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=U2SUB1HJ1zwYZLXTcRtJPzZNMb9jj63+seYf6oj57bQ=;
        fh=YWCMa46zHUAz0rCpX4gjUK/++1HGhBQwwI3DkTjUe1o=;
        b=SY1XKT9vfFWps7ljff2yGhRfDQr/fmH3/XfhesQ9twmd5hSsKLOOIISVC/+T/8kQHf
         NL0Mxn0cupJq858O7GSzX2IAFLpaY7oUcCI9Gusrj2fCtVKHgoE+UThKc4HOZVU+ym0L
         Srbgtyg1hBbrF9f5JXCr85SpKHKCl9bBfdKaboA/X83IkPQCRL1aoF+jpV9uhjblCwfV
         3yM9zknh+4FOBLdpuDa7+B5CT+nvbczDRNZFDj94sXSOBJOtAz0BOnD3hC0UFF2o+UPT
         EK/ln5QGlw9wAcOybEtzcDdbd3WGJnnBlW0Rhdz5/FDjnjyYkPAvnnJk/NC0n+vKu5r1
         lwmw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794864091; x=1795468891; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U2SUB1HJ1zwYZLXTcRtJPzZNMb9jj63+seYf6oj57bQ=;
        b=mpc2ulQRbWKCYMfXteuPNK/WkDbEvq7BHSIozp/WZ5rJ9Ay1UwuDo9j5m255aDnmpe
         GNzvlEuBwblIIy7k0K+/Ti3XB/AJamiDqQwHXrckzMaQaY+AEdBbRckqS48Xy7HcnuZk
         kfiNuOUzahvY9TS+CeaNNQgCR2zzmDklIm/T3kq7FVno6v2vlW5BQC30y+s2wEZskIMX
         odTfuVUIIX8rI6coGiXhokSkAigXX77P9TqXOf7Fs0P7rm9ubE2JCFgv4OBxJvTqo0Nk
         9zJQtMg2R2xQyiElXWglY0jJolpQLWCl1KABb5VYenc2ODepzl9b+0OdTxyyheiE1FUw
         YvQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864091; x=1795468891;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U2SUB1HJ1zwYZLXTcRtJPzZNMb9jj63+seYf6oj57bQ=;
        b=shExNrleBz7quy68Cg86bxf3w41M9WvZ7Cn4O7an8rIZ6GuLNN/GZ3vFYt1BsPjXTI
         dsGYu6hkbrrzSnlq77CQpwfgH5+wsGFUAeC+i0IkEbyOiSobxtPEZMEpLR8oDxvG4lD0
         YqywJiNGB+/yyQH/qOmUINQVqNpbyfnKYOJW8cNQYainVOz1knnVi4bNEq1jhG1mM9sh
         SwpMPlD0hiMWwXWsnlSn4r3WGKFAsKkaE8OaJxTZHGgJityeaEYXcvyY+NenhfG3x2Dp
         aDPvUWRRaW9LdLhVh41yfRkb18tEWz28PujQV5FmC8Ch4r3Yl308mK35Nc8c6ouLXk55
         pt7g==
X-Forwarded-Encrypted: i=1; AL+hErHeQXXQe+2M5ngdxOhLOQpf6aQCQmKItDVmyjq1vdeh9ZUiRsvn1lhxC1zpSv9xb6yat94QkbfMON8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8AxEF0m2effQs3u2GAwvX8MSqq8LJ1SX81qTmlG+XPOngJzXy2
	tIEx3IODPziq510VVaeHypbZSEAV4p/auFT/l4PVdN8mA3FPCoCNB6TyKaoR1PSO4czV763DALJ
	UzAhrw0n0DY3UFk8rCYktkC545U81FUhTVweecNL88pJrsOWcN5N24OfE80g=
X-Gm-Gg: AYBFou3A4tOEJ0t59xe9vtHmTKr1L1eg5AVscqHnzuqyvmxy7dIOA2inRSLqc1M45YP
	tnziglEvvNL8C93uk2UaV4vecxoaKLnf2aBZdJIARqbHKH3CT2DoIXqkfOntm2AoAM86OMrcQA/
	LQtgwWx+l1B21DmAYOnNfUXlKGzQj7b/4r9mL8bTTBZMS29CcBlATc6X0prcaWnciGiv+QZrdSG
	z7h6HlkBSajU/6TCaJ46KWsmzoxVIq0XGi7vzV/m9iYlYZyCJlQu5hNJxeEmFo9gQjLdlLu7PuA
	gvycNb9mFXEanfw0sblPxCpC9w4B1LvzwgL56Y4DOZqRjkt5n04IvVS64Ts2hxtAlUD1juk8cEE
	vCd9i9SHVst/710D++9ttcivWkxZJyNVDPXI=
X-Received: by 2002:a05:701a:8457:10b0:151:5aef:b375 with SMTP id
 a92af1059eb24-1b53b1cbb03mr26870c88.15.1794864089874; Mon, 16 Nov 2026
 13:21:29 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110102039.1002605-1-bjorn@kernel.org> <20261110102039.1002605-5-bjorn@kernel.org>
 <CAHS8izNC9APadHg9yPtROkii1H7TPMAB7Xhxo+y9Cx-XCw9C1Q@mail.gmail.com> <87v75xj550.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <87v75xj550.fsf@all.your.base.are.belong.to.us>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 16 Nov 2026 13:21:16 -0800
X-Gm-Features: AclHuK9w3CNvroM5YXJNKwgkBqNWzGZQCQodYorHP8v1Ci-t1CG7mz-WEanoHTk
Message-ID: <CAHS8izMxaRKkSKqp3x4dLgTrzuzz5=8WMbEvq5W-oiqoL5vckg@mail.gmail.com>
Subject: Re: [PATCH net-next v1 04/11] xsk: Allocate UMEM chunks through page_pool
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Magnus Karlsson <magnus.karlsson@intel.com>, 
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Alexander Duyck <alexanderduyck@fb.com>, kernel-team@meta.com, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, 
	Pavel Begunkov <asml.silence@gmail.com>, Jens Axboe <axboe@kernel.dk>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, netdev@vger.kernel.org, 
	bpf@vger.kernel.org, io-uring@vger.kernel.org, 
	"Mike Marciniszyn (Meta)" <mike.marciniszyn@gmail.com>, Weiming Shi <bestswngs@gmail.com>, 
	Nikolay Aleksandrov <razor@blackwall.org>, David Wei <dw@davidwei.uk>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Stuart Clark <stuclar@meta.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 10:55=E2=80=AFAM Bj=C3=B6rn T=C3=B6pel <bjorn@kerne=
l.org> wrote:
>
> Mina Almasry <almasrymina@google.com> writes:
>
> > On Tue, Nov 10, 2026 at 2:21=E2=80=AFAM Bj=C3=B6rn T=C3=B6pel <bjorn@ke=
rnel.org> wrote:
>
> >> diff --git a/include/net/xdp.h b/include/net/xdp.h
> >> index 1105bb9e3292..5ab7802ac4e1 100644
> >> --- a/include/net/xdp.h
> >> +++ b/include/net/xdp.h
> >> @@ -368,7 +368,7 @@ static inline bool xdp_buff_add_frag(struct xdp_bu=
ff *xdp, netmem_ref netmem,
> >>
> >>         if (unlikely(netmem_is_pfmemalloc(netmem)))
> >>                 xdp_buff_set_frag_pfmemalloc(xdp);
> >> -       if (unlikely(netmem_is_net_iov(netmem)))
> >> +       if (unlikely(netmem_is_net_iov(netmem) && !netmem_address(netm=
em)))
> >>                 xdp_buff_set_frag_unreadable(xdp);
> >>
> >
> >
> > netmem_is_net_iov() check became redundant.
>
> Hmm, not quite... netmem_address() is also NULL for a highmem page
> without a mapping, and the stack reads those through kmap, so they
> aren't unreadable. The net_iov test keeps them out. I'll add a comment.
>


Oh. I missed that. There are a bunch of docs actually that explicitly
wrongly say to use netmem_address to tell if the memory si readable.

Can you, in a separate patch, add a netmem_readable() helper and
update the docs (and if possible code places) that checked net-iov
when they were really checks for readability? Now that you're adding
readable net-iovs, all that assumption break right?

> >> diff --git a/net/xdp/xsk_pp.c b/net/xdp/xsk_pp.c
> >> new file mode 100644
> >> index 000000000000..fdd55265a6cd
> >> --- /dev/null
> >> +++ b/net/xdp/xsk_pp.c
> >> @@ -0,0 +1,246 @@
> >> +// SPDX-License-Identifier: GPL-2.0
> >> +/* AF_XDP UMEM as a page pool memory provider
> >> + *
> >> + * Each aligned UMEM chunk is a readable net_iov with one owner at a =
time:
> >> + *
> >> + *   userspace --FILL--> page pool --release--> reuse --alloc--> page=
 pool
> >> + *       ^                   |
> >> + *       +-----RX ring-------+
> >> + */
> >> +
> >> +#include <net/page_pool/helpers.h>
> >> +#include <net/page_pool/memory_provider.h>
> >> +#include <net/xdp_sock_drv.h>
> >> +
> >> +#include "xsk.h"
> >> +#include "xsk_queue.h"
> >> +
> >> +enum xsk_pp_chunk {
> >> +       XSK_PP_USER,    /* owned by userspace */
> >> +       XSK_PP_POOL,    /* owned by a page pool */
> >> +       XSK_PP_REUSE,   /* on the reuse stack */
> >> +};
> >
> > maybe should be xsk_mp_chunk.
> >
> > But also, why is this 3? Usually the mp's track allocated and free. I
> > assume PP_REUSE is actually free, but I'm curious why it matters to
> > your mp whether the pool or the userspace holds the memory (or whether
> > the net stack holds it. Can't it hold it?)
>
> REUSE is free, yes. USER and POOL are both allocated, but userspace
> gives chunks back by writing addresses to FILL, and it can write any
> address, also one of a chunk the kernel still owns. Taking that entry
> would hand the device the same chunk twice. So the provider only takes
> FILL entries for chunks in USER, and drops the rest. io_uring zcrx
> checks the same with user_refs, and devmem with the socket's token
> xarray.
>

Sounds like devmem choose to do extra-pp-refs on netmems given to
userspace, io-uring choose to give extra user_refs for netmems given
to userspace, and you have choosen to do something new? I need to read
the patches more thoroughly to understand.

--
Thanks,
Mina
