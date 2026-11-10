Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794354732;
	b=PXs9JGHax3I+WuiHvTzaRhogFNx9NeaLo6cB/aTBsKGbh4l6AJikMZttVkrVaVty/QyC
	 Nbx6C4VrpJdY824oGi0yTsVeset+tayAHFE1CL7M3gNV+eq46oscgEbgl48TZeGjtI5d2
	 qLB+JinZJIyfKgYORIuCiLhHHf+4Im/j8CFzi7J3X06ZorDTzGBmd/k51CB9bAqEavfqq
	 Sxjt4NwrSblF0FlB4lS8+rlOO/qpCWAiNzwHhwFDoNqz4BEznZlOLGNZuz97jr5RvKeej
	 lHsvvDyUKHuhuUxqnvjp2oEm2NPVOd0elopb2cBoeOwGU1Fzi0kZTI2hkOY7Wu/DWXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794354732;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=8piulZmzPz+GLbFi3OeZnbxDdpLELCU5e/qg3zDhY0A=;
	b=IZQaTZ6R35PN6F6Zs+K5YNYAjNiC5nhVWY52t/U7HnprbfWLRDZ7uP27tnWaj6ruagwy
	 2r9lyYuIejLyjGyLDx9GKEJmqBuhWXq0dNcUKFVa5yyRDHBjweg/jZnQytSzgUfHjK7em
	 qfMKaLeCwVBc8KPmGkhtAPaypTGGp6hpRZjJQAoWFkxfNcgjEqPC2T0FLZTg17WjNQn8i
	 fHPIVeFjb73iIo7qZohCi6Newz/IoHNRCNnaZXtfO4IVpziL9AB7zj0Air+KHJFoHA/cH
	 BMX0VWcctfhqENweGS0ULPcMsrxhmF7egZRBWVOY1BN7vxNIBuvWp72NVubub3rJSlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A27f8qsu;
	arc=none smtp.remote-ip=74.125.229.6
Received: from mail-dy2-f6.google.com (mail-dy2-f6.google.com [74.125.229.6])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDECD60A2611
	for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 23:52:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDECD60A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A27f8qsu
Received: by mail-dy2-f6.google.com with SMTP id 5a478bee46e88-35adc681e1aso3510865eec.0
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 15:52:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794354731; x=1794959531; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8piulZmzPz+GLbFi3OeZnbxDdpLELCU5e/qg3zDhY0A=;
        b=A27f8qsupZ1PMhEWOW8cQqik8tTxnKeYVbMsiyIbFt3VSqrjhgBaYEj4ZQIkcjp+Gy
         XR+VwGJsIvjRt1dev3wxh9EflmRpvxOa0/iSnoz8HG4eY0IG3BZJOCxFMYMZta+zGJUZ
         rRtN8unllRBEgkuV6XWvxHX6uMYwPc18TTAbs5Kfi9eifXAnzm15DnAOkWds6uStvKgS
         /8AfO8HY0/P2taavxRSDjWqx+YasNKdJlkKa/qfyN5Qn7R4dI3MG28gViCRVE8ZtPaOl
         Me6lmYvr5/yml8Togyo+cECqfNEWxTDuy+iVjZDZ9VJQi7J29E6FeVMl03Ot0P4qbyMk
         dpTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794354731; x=1794959531;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8piulZmzPz+GLbFi3OeZnbxDdpLELCU5e/qg3zDhY0A=;
        b=IN6XPz4l9R1QwyYTA61wiWQPbqzT0U8iMdMJyzs5Ju86JixrIZFzhFPv8qARhErbxW
         TvptC1Prv2Fn/X0AE6TAD5odtvXBlxDuOLFbWVR9WOYAN+GpskSLiIC0ZwhM/oN2RvXy
         HfsWOOR97MsyZ7zk6VXJ0az7xPCrtKk2fJL7JMXlxX+U9nl4ueud13Z/1qyKmaV6gzgk
         Yw6cmtvQ9zwrkyeRrAFO0rSNeFVByAT9JfoJuq5oWJI1kWOex1Y0WoNGouINasxLH/fj
         uA/PvBlWBBDMktRUSIsDsGrOOKgD7N4lwKEW9pXS4M4PiKeXA5qbjDwvHHznmDZ173qA
         5Wxw==
X-Forwarded-Encrypted: i=1; AL+hErFUhOIebkhiqvjHgBv5HJoU/4YNa6zLx/E3FP/JHkkJtllksaJqhmjorGqYoZj9Rg8AfqUX2VZg9EY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/lx19gzwljghwyT5xsxdVTmv6mtB/DIgGq454d0hAgOvkq8cmZ
	OXdx6xjFWxfxn84MT4EiAb8fmafFhoScsVqBXorlI5oIJc4LWW4EuXh3
X-Gm-Gg: AYBFou3/Cn2X5h61OsoE8c9nAE2jYTaeIxRy27Eqw/9KBxLe/b/2tUaNjAYopJHUFga
	82UBLoh/IOjO9tBLxrkxvoPyHlBaP7WaOsLokL6w9ZHSqBRSNSycdUT7kLjUihkwddu+edF9LTP
	EhPT1tPUcnFFYOb1l/VczwEDAMhg+zMAotgHanYmf2W3T5pbjXkMbE8rot4qVtmsph5/MkqYc4z
	QBRZyIe0J58MzXe5itA8XEGVJe1VygwVhc+rbYLcIvnkDUYCaee2gw38BlI4dSYtmfyZKJ4pU+v
	bTjiZ3wXFLeYK9rn0k9VudfTumteVpr054ZuxOu0nJKBYEOyRSyM7pNk7IOjMdeJxHH1wYt9yG9
	VtgGs+NlALjphToS4WwaBNm6lRmJJYPjn5E4lXf5UsaDDGWX6xIppjlZj9olVtOIUT7jf1QMpBc
	uC3Ms94dF52TptKoZEtLsyYqb4t3ELubYGuYjVkA4XJEmtvuYMiFq8ODTY/6Mj72K5FV3oooi8d
	Jr4KLWiRyMmIPQ0tp2w+RUsKpRJLgw2+PFcI9E6WOeDd2de4hspxqVKcI46Vj8lG0+C7QfORgr4
	YpxhLf4gJMjij3f/UpKfTaM=
X-Received: by 2002:a05:7300:cc9c:b0:36c:b8b1:a44f with SMTP id 5a478bee46e88-37686466019mr1359845eec.31.1794354731058;
        Tue, 10 Nov 2026 15:52:11 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:6a::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375218c863csm9704178eec.28.2026.11.10.15.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 15:52:10 -0800 (PST)
Date: Tue, 10 Nov 2026 15:02:03 -0800
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Magnus Karlsson <magnus.karlsson@intel.com>,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Alexander Duyck <alexanderduyck@fb.com>, kernel-team@meta.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>,
	Pavel Begunkov <asml.silence@gmail.com>,
	Jens Axboe <axboe@kernel.dk>, Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>, netdev@vger.kernel.org,
	bpf@vger.kernel.org, io-uring@vger.kernel.org,
	Mina Almasry <almasrymina@google.com>,
	"Mike Marciniszyn (Meta)" <mike.marciniszyn@gmail.com>,
	Weiming Shi <bestswngs@gmail.com>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	David Wei <dw@davidwei.uk>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Stuart Clark <stuclar@meta.com>
Subject: Re: [PATCH net-next v1 04/11] xsk: Allocate UMEM chunks through
 page_pool
Message-ID: <avOia/ZPWiFdfW7y@devvm16445.scu0.facebook.com>
References: <20261110102039.1002605-1-bjorn@kernel.org>
 <20261110102039.1002605-5-bjorn@kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261110102039.1002605-5-bjorn@kernel.org>

On 11/10, Björn Töpel wrote:
> AF_XDP zero copy needs a second RX allocator in every driver. A
> page_pool driver can take UMEM chunks from a memory provider instead,
> and keep its refill, recycling and DMA sync code.
> 
> Each aligned chunk becomes a net_iov, whose address netmem_address()
> finds without calling the provider. Userspace may post a chunk that
> the kernel still owns, so the provider tracks the owner of each chunk
> and drops such FILL entries. Chunks that a page pool releases stay in
> the kernel for reuse. Nothing installs the provider yet.
> 
> Signed-off-by: Björn Töpel <bjorn@kernel.org>
> ---
>  include/net/netmem.h |  25 ++++-
>  include/net/xdp.h    |   2 +-
>  net/xdp/Kconfig      |   1 +
>  net/xdp/Makefile     |   2 +-
>  net/xdp/xsk.h        |   6 ++
>  net/xdp/xsk_pp.c     | 246 +++++++++++++++++++++++++++++++++++++++++++
>  6 files changed, 279 insertions(+), 3 deletions(-)
>  create mode 100644 net/xdp/xsk_pp.c
> 
> diff --git a/include/net/netmem.h b/include/net/netmem.h
> index b986ad616334..a3b67ef32b21 100644
> --- a/include/net/netmem.h
> +++ b/include/net/netmem.h
> @@ -69,6 +69,7 @@ DECLARE_STATIC_KEY_FALSE(page_pool_restricted);
>  enum net_iov_type {
>  	NET_IOV_DMABUF,
>  	NET_IOV_IOURING,
> +	NET_IOV_XSK,
>  };
>  
>  /* A memory descriptor representing abstract networking I/O vectors.
> @@ -107,6 +108,10 @@ struct net_iov_area {
>  	size_t num_niovs;
>  	/* Each net_iov covers 1 << niov_shift bytes. */
>  	unsigned int niov_shift;
> +	/* CPU address of the first net_iov, or NULL if the CPU cannot read
> +	 * the area.
> +	 */
> +	void *vaddr;
>  };
>  
>  static inline struct net_iov_area *net_iov_owner(const struct net_iov *niov)
> @@ -119,6 +124,18 @@ static inline unsigned int net_iov_idx(const struct net_iov *niov)
>  	return niov - net_iov_owner(niov)->niovs;
>  }
>  
> +static inline void *net_iov_address(const struct net_iov *niov)
> +{
> +	const struct net_iov_area *area = net_iov_owner(niov);
> +	unsigned long off;
> +
> +	if (!area->vaddr)
> +		return NULL;
> +
> +	off = (unsigned long)net_iov_idx(niov) << area->niov_shift;
> +	return area->vaddr + off;
> +}
> +
>  /* Initialize a niov: stamp the owning area, the memory provider type.
>   */
>  static inline void net_iov_init(struct net_iov *niov,
> @@ -345,10 +362,16 @@ static inline void *__netmem_address(netmem_ref netmem)
>  	return page_address(__netmem_to_page(netmem));
>  }
>  
> +/**
> + * netmem_address - get the CPU address of the memory behind @netmem
> + * @netmem: netmem to get the address of
> + *
> + * Return: the address, or NULL if the CPU cannot read @netmem.
> + */
>  static inline void *netmem_address(netmem_ref netmem)
>  {
>  	if (netmem_is_net_iov(netmem))
> -		return NULL;
> +		return net_iov_address(netmem_to_net_iov(netmem));
>  
>  	return __netmem_address(netmem);
>  }
> diff --git a/include/net/xdp.h b/include/net/xdp.h
> index 1105bb9e3292..5ab7802ac4e1 100644
> --- a/include/net/xdp.h
> +++ b/include/net/xdp.h
> @@ -368,7 +368,7 @@ static inline bool xdp_buff_add_frag(struct xdp_buff *xdp, netmem_ref netmem,
>  
>  	if (unlikely(netmem_is_pfmemalloc(netmem)))
>  		xdp_buff_set_frag_pfmemalloc(xdp);
> -	if (unlikely(netmem_is_net_iov(netmem)))
> +	if (unlikely(netmem_is_net_iov(netmem) && !netmem_address(netmem)))
>  		xdp_buff_set_frag_unreadable(xdp);
>  
>  	return true;
> diff --git a/net/xdp/Kconfig b/net/xdp/Kconfig
> index 71af2febe72a..c9c68d3b3712 100644
> --- a/net/xdp/Kconfig
> +++ b/net/xdp/Kconfig
> @@ -2,6 +2,7 @@
>  config XDP_SOCKETS
>  	bool "XDP sockets"
>  	depends on BPF_SYSCALL
> +	select PAGE_POOL
>  	default n
>  	help
>  	  XDP sockets allows a channel between XDP programs and
> diff --git a/net/xdp/Makefile b/net/xdp/Makefile
> index 30cdc4315f42..6e9d60f9f7f1 100644
> --- a/net/xdp/Makefile
> +++ b/net/xdp/Makefile
> @@ -1,4 +1,4 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  obj-$(CONFIG_XDP_SOCKETS) += xsk.o xdp_umem.o xsk_queue.o xskmap.o
> -obj-$(CONFIG_XDP_SOCKETS) += xsk_buff_pool.o
> +obj-$(CONFIG_XDP_SOCKETS) += xsk_buff_pool.o xsk_pp.o
>  obj-$(CONFIG_XDP_SOCKETS_DIAG) += xsk_diag.o
> diff --git a/net/xdp/xsk.h b/net/xdp/xsk.h
> index 7c811b5cce76..4dab7b9a1487 100644
> --- a/net/xdp/xsk.h
> +++ b/net/xdp/xsk.h
> @@ -34,6 +34,12 @@ static inline struct xdp_sock *xdp_sk(struct sock *sk)
>  
>  void xsk_map_try_sock_delete(struct xsk_map *map, struct xdp_sock *xs,
>  			     struct xdp_sock __rcu **map_entry);
> +struct xsk_pp;
> +
> +extern const struct memory_provider_ops xsk_pp_ops;
> +
> +struct xsk_pp *xsk_pp_create(struct xsk_buff_pool *pool);
> +void xsk_pp_put(struct xsk_pp *pp);
>  void xsk_clear_pool_at_qid(struct net_device *dev, u16 queue_id);
>  int xsk_reg_pool_at_qid(struct net_device *dev, struct xsk_buff_pool *pool,
>  			u16 queue_id);
> diff --git a/net/xdp/xsk_pp.c b/net/xdp/xsk_pp.c
> new file mode 100644
> index 000000000000..fdd55265a6cd
> --- /dev/null
> +++ b/net/xdp/xsk_pp.c
> @@ -0,0 +1,246 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* AF_XDP UMEM as a page pool memory provider
> + *
> + * Each aligned UMEM chunk is a readable net_iov with one owner at a time:
> + *
> + *   userspace --FILL--> page pool --release--> reuse --alloc--> page pool
> + *       ^                   |
> + *       +-----RX ring-------+
> + */
> +
> +#include <net/page_pool/helpers.h>
> +#include <net/page_pool/memory_provider.h>
> +#include <net/xdp_sock_drv.h>
> +
> +#include "xsk.h"
> +#include "xsk_queue.h"
> +
> +enum xsk_pp_chunk {
> +	XSK_PP_USER,	/* owned by userspace */
> +	XSK_PP_POOL,	/* owned by a page pool */
> +	XSK_PP_REUSE,	/* on the reuse stack */

Can you explain more about that reuse/reuse_cnt? When is the chunk reused?
How is it different from FILL->RX path?
