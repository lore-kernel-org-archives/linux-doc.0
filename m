Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794439264;
	b=EIKOIGQtV1ts0SuvvvfCPf9N9IEaXlaWARzCOf9X1ecXWR8Lq33anKDuvZyTI4QAds0D
	 B6I7aCEocrAE0+g/mdMIGxSV/GNrmvF23/Vhf9aCV5HYB2WsIU7yO57g3gc78wpaMv+25
	 vdxHqJfIYeVvcHbvvvdGJPtK/U0KPVU3gw+hDN/bTU13ID72Swsm/UaKsQbMtHUNM8Z/E
	 rTJ/s+CzS9LhkdlOl9iJoDl5NbaTEYlmLdBlgxrwl2PklXp5Umk6VJ51+3WJENXrStTNV
	 vGNnGfb0P3y1Sj16vh3dzl2HbJ3VyyPtxGOypfdUyP7Utqilb/Ohg9LHYJFLqslSsAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794439264;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=2CCb0NW8b2dj++2tLgh7gyBI6Ohxvsvhx9Ebkc36JpY=;
	b=eJaa8Dao4QlWufGtm4FR1cJHnahP+F+Sn91kK2vVvrXJbZ1wV6QCqHu5S79vwHRN+dca
	 5iq2wmpIbXQPlXWHaGgf6eSP21BSJuutLhjFgK7wTGZGagFdqFs408yfDRmlhdU9Ei6Hh
	 s452YvOYKkdSmu8TMeWbCsEgSnI1D9aLP3ZLoYwT8b5grU7yF55Ak/OhirIuycyPjgC7L
	 nWqjnUbIxyCb77YDazBHc8ONGXuroJM+huRPtg9YTkf8ZuQyrlzPbWqbcgEH6ro+zQBPt
	 L1u89jcXs3z0vsCBdiWFXpbXtjvxw2p/VHl7dhorP0SilP4YNuSsjYzTlz732L43SQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JwuP3umC;
	arc=none smtp.remote-ip=74.125.229.133
Received: from mail-dl2-f5.google.com (mail-dl2-f5.google.com [74.125.229.133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84F1606A895
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 23:21:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D84F1606A895
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JwuP3umC
Received: by mail-dl2-f5.google.com with SMTP id a92af1059eb24-1ac216daf7dso2074465c88.1
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 15:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794439262; x=1795044062; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2CCb0NW8b2dj++2tLgh7gyBI6Ohxvsvhx9Ebkc36JpY=;
        b=JwuP3umCOT+Lgq+HWQmQpskZGCLqMnkJAn8UpHfV0mO8DPfylXpWIP4PWC/YfINnSS
         78Y8u6kxqoAx6IXQ+QTmbsi25lIXVvZmeuxsmvmCXwoLTPisRCDTxDwN+VTHTo/eHMRh
         PmxgSJKysmN/8L7QJuhTslAQcHVE9IKLylVnO5kNnwH65cQOb9yzPQY7Mp5e6lbwcGVZ
         hMF59BweI2YYmz6NP3a2P/G3mRiLFislyC5x01zSJN7r+RgZe3WN9FJdoxR6uClyCgxH
         haNV4wNEuzHDhF7Dz+wxSFwC+FgjkHM3eCP5Vyx/p2g1hrHe2YvMJR6FOwwGJUC4Z1T2
         7YAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794439262; x=1795044062;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2CCb0NW8b2dj++2tLgh7gyBI6Ohxvsvhx9Ebkc36JpY=;
        b=KEkzgmKpr7xmOSjRkRnLKI8rN3pG2Laa0rsKjDoUH5e8SebZ4iAoKCSVP+a+chXpEL
         9IzG1TPCQOcXDQa2u9znh1+rpp+w54xf9+S5csXDoLus8nj1xywYHc/NCEeb3O27qyhu
         MAuYJP9aetBEX68D79psmW+4EQdGQEUfG+Iu1nUQEn0JEL3qiBbFh0oKrOpLwsRTi4kW
         cRw9IktRxJKeTbJCgOFvIUiaDurxVMy8cWX9lzHyZdraViWqTvf5KTJFOQezQRc6xVUZ
         X5fATP+uNjijrV4B0j3PybvPLMhPmaS1bdQ/+gjrRzHKXkFoekUd4VUsS+9IjMKMydwa
         hRsg==
X-Forwarded-Encrypted: i=1; AL+hErE7mcTjjzhV88ebP21T5xkIMJJSyP11b+6TljRp9c6YrU6YQ8g/ihxmQ9quCpchqlv29j3jdLw1zJE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/2BeHnrLSp85/mHoe+jTPFuIkennoosnYI/PnKDKmh2bR0+Fah
	C2ZgzZLBn5u23WBsmDYVBhEzkb8aJJg07Oj+n8c4GyQCIXDhHh50L2Kr
X-Gm-Gg: AYBFou31vE0cEl5w1m02XJslmAG1Kms52tDqawVMX/fyXW0khuSUEBRx0KcY+Azi0Ae
	RjOhZqFO7AbGwr8tkXV48HlrSL/fbqL7VKiOh9OUcpLtZ4f837MXEheixEeDkT5q1C04BYXeegO
	rSOv9YIzhE798oYwJO7Mfeh8JdmDFLxZXgX3SDBZNycaaaR/qvVsjGlEz2Y00QKPEhG5oD5eBbE
	hBNGOoTpi4LjQO/P6Wdba0SM+ujahCCJpqWQXqQud2sJPU7x31TJhXuJaYckA7ZWDosVDgwdint
	iWv5xPP07q/4D1NgWKYWBskeNA7YsyVY7Wx7SjfCfYPERmTVcRo48pOx73lHmPwMlZdd4Ia5T6o
	mif6AS+BuB3xJGDH5dRP96830/TRgGKFEwhPICMpPPP4TgXC/J5lZJUXuKam728H1dHaV2sLxaS
	mM2Oc4qo2UafQnZARCbd+bFoovBRGctqIunyLKgluOFsVe/6ZopG6X9EcQh1HdyA5JQ15zSKx5D
	cKjfOa7hwvsr4YFlAkpgctvCFHqPOsG5rMkrze5JgYj2Wsx8Hb11ts3II5kLtSITvYGYEltCU3D
	GKdeZ5P/mxQ7JtOLrsQmAGg=
X-Received: by 2002:a05:701b:2212:b0:1b2:cb38:5412 with SMTP id a92af1059eb24-1b3c0376554mr3270317c88.42.1794439261610;
        Wed, 11 Nov 2026 15:21:01 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:65::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b20c55sm17957326c88.8.2026.11.11.15.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 15:21:00 -0800 (PST)
Date: Wed, 11 Nov 2026 15:01:24 -0800
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
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
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, 
	Jiri Olsa <jolsa@kernel.org>, Emil Tsalapatis <emil@etsalapatis.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, netdev@vger.kernel.org, bpf@vger.kernel.org, 
	io-uring@vger.kernel.org, Mina Almasry <almasrymina@google.com>, 
	"Mike Marciniszyn (Meta)" <mike.marciniszyn@gmail.com>, Weiming Shi <bestswngs@gmail.com>, 
	Nikolay Aleksandrov <razor@blackwall.org>, David Wei <dw@davidwei.uk>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Stuart Clark <stuclar@meta.com>
Subject: Re: [PATCH net-next v1 02/11] net: Add memory provider capabilities
Message-ID: <avTy21_cSnyMdbb5@devvm16445.scu0.facebook.com>
References: <20261110102039.1002605-1-bjorn@kernel.org>
 <20261110102039.1002605-3-bjorn@kernel.org>
 <avOYe27x-AlxmyK9@devvm16445.scu0.facebook.com>
 <87mrrfa6c4.fsf@all.your.base.are.belong.to.us>
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
In-Reply-To: <87mrrfa6c4.fsf@all.your.base.are.belong.to.us>

On 11/11, Björn Töpel wrote:
> Stanislav Fomichev <sdf.kernel@gmail.com> writes:
> 
> > On 11/10, Björn Töpel wrote:
> >> The core treats every memory provider as unreadable: installing one
> >> needs header split and no XDP program, and any page pool that allows
> >> unreadable netmem takes it. An AF_XDP UMEM provider is readable, needs
> >> XDP, and hands out whole buffers.
> >> 
> >> Describe providers by MP_CAP_READABLE and MP_CAP_FRAG; devmem and
> >> io_uring keep their behavior with MP_CAP_FRAG. A page pool takes a
> >> readable provider only with the new PP_FLAG_MEM_PROVIDER:
> >> PP_FLAG_ALLOW_UNREADABLE_NETMEM says that a driver handles unreadable
> >> netmem, not that it handles any provider.
> >> 
> >> Signed-off-by: Björn Töpel <bjorn@kernel.org>
> >> ---
> >>  Documentation/networking/netmem.rst     |  5 ++++
> >>  drivers/net/netkit.c                    |  3 +-
> >>  include/net/page_pool/helpers.h         | 14 +++++++++-
> >>  include/net/page_pool/memory_provider.h | 14 ++++++++++
> >>  include/net/page_pool/types.h           | 15 ++++++++--
> >>  io_uring/zcrx.c                         |  1 +
> >>  net/core/dev.c                          | 10 ++++---
> >>  net/core/devmem.c                       |  1 +
> >>  net/core/netdev_rx_queue.c              | 37 ++++++++++++++++++++-----
> >>  net/core/page_pool.c                    | 34 +++++++++++++++++++++--
> >>  net/ethtool/rings.c                     |  7 +++--
> >>  net/xdp/xsk_buff_pool.c                 |  3 +-
> >>  12 files changed, 122 insertions(+), 22 deletions(-)
> >> 
> >> diff --git a/Documentation/networking/netmem.rst b/Documentation/networking/netmem.rst
> >> index 6871dcdd700c..39cb75339704 100644
> >> --- a/Documentation/networking/netmem.rst
> >> +++ b/Documentation/networking/netmem.rst
> >> @@ -103,6 +103,11 @@ Driver RX Requirements
> >>       which knows when dma-syncing is (or is not) appropriate.
> >>     - PP_FLAG_ALLOW_UNREADABLE_NETMEM. The driver must specify this flag iff
> >>       tcp-data-split is enabled.
> >> +   - PP_FLAG_MEM_PROVIDER. The page pool takes memory from the memory
> >> +     provider of its RX queue, readable or not. Page pool creation fails if
> >> +     the provider is unreadable and PP_FLAG_ALLOW_UNREADABLE_NETMEM is not
> >> +     set, so do not set it on header page pools of such a queue. Without it,
> >> +     PP_FLAG_ALLOW_UNREADABLE_NETMEM selects unreadable providers only.
> >>  
> >>  5. The driver must not assume the netmem is readable and/or backed by pages.
> >>     The netmem returned by the page_pool may be unreadable, in which case
> >> diff --git a/drivers/net/netkit.c b/drivers/net/netkit.c
> >> index 82e608e733d9..df672ed5ffcc 100644
> >> --- a/drivers/net/netkit.c
> >> +++ b/drivers/net/netkit.c
> >> @@ -12,6 +12,7 @@
> >>  #include <net/netdev_lock.h>
> >>  #include <net/netdev_queues.h>
> >>  #include <net/netdev_rx_queue.h>
> >> +#include <net/page_pool/memory_provider.h>
> >>  #include <net/xdp_sock_drv.h>
> >>  #include <net/netkit.h>
> >>  #include <net/dst.h>
> >> @@ -289,7 +290,7 @@ static int netkit_xsk(struct net_device *dev, struct netdev_bpf *xdp)
> >>  		ret = -EOPNOTSUPP;
> >>  		goto out;
> >>  	}
> >> -	if (!create || !dev_get_min_mp_channel_count(phys))
> >> +	if (!create || netif_all_mps_have_cap(phys, MP_CAP_READABLE))
> >>  		ret = phys->netdev_ops->ndo_bpf(phys, &xdp_lower);
> >>  out:
> >>  	netdev_unlock(phys);
> >> diff --git a/include/net/page_pool/helpers.h b/include/net/page_pool/helpers.h
> >> index 28635ce9454e..96e6b62cdebb 100644
> >> --- a/include/net/page_pool/helpers.h
> >> +++ b/include/net/page_pool/helpers.h
> >> @@ -62,6 +62,7 @@
> >>  
> >>  #include <linux/dma-mapping.h>
> >>  
> >> +#include <net/page_pool/memory_provider.h>
> >>  #include <net/page_pool/types.h>
> >>  #include <net/net_debug.h>
> >>  #include <net/netmem.h>
> >> @@ -519,7 +520,18 @@ static inline void page_pool_nid_changed(struct page_pool *pool, int new_nid)
> >>   */
> >>  static inline bool page_pool_is_unreadable(struct page_pool *pool)
> >>  {
> >> -	return !!pool->mp_ops;
> >> +	return pool->mp_ops && !(pool->mp_ops->caps & MP_CAP_READABLE);
> >> +}
> >> +
> >> +/**
> >> + * page_pool_supports_frag() - may page pool buffers be split
> >> + * @pool: queried page pool
> >> + *
> >> + * Return: false if the memory provider of @pool hands out whole buffers only
> >> + */
> >> +static inline bool page_pool_supports_frag(const struct page_pool *pool)
> >> +{
> >> +	return !pool->mp_ops || pool->mp_ops->caps & MP_CAP_FRAG;
> >>  }
> >>  
> >>  #endif /* _NET_PAGE_POOL_HELPERS_H */
> >> diff --git a/include/net/page_pool/memory_provider.h b/include/net/page_pool/memory_provider.h
> >> index bceb5f7740e2..4417e54a0f81 100644
> >> --- a/include/net/page_pool/memory_provider.h
> >> +++ b/include/net/page_pool/memory_provider.h
> >> @@ -19,6 +19,18 @@ struct sk_buff;
> >>   * Per-provider custom logic must be delegated to memory_provider_ops rather
> >>   * than handled directly in page_pool core code.
> >>   */
> >> +
> >> +/**
> >> + * enum mp_caps - memory provider capabilities
> >> + * @MP_CAP_READABLE: The CPU can access provider memory. It may back header
> >> + *	page pools, and XDP programs may run on it.
> >> + * @MP_CAP_FRAG: Page pool fragments may split provider buffers.
> >> + */
> >> +enum mp_caps {
> >> +	MP_CAP_READABLE		= BIT(0),
> >> +	MP_CAP_FRAG		= BIT(1),
> >> +};
> >> +
> >>  struct memory_provider_ops {
> >>  	netmem_ref (*alloc_netmems)(struct page_pool *pool, gfp_t gfp);
> >>  	bool (*release_netmem)(struct page_pool *pool, netmem_ref netmem);
> >> @@ -27,6 +39,7 @@ struct memory_provider_ops {
> >>  	int (*nl_fill)(void *mp_priv, struct sk_buff *rsp,
> >>  		       struct netdev_rx_queue *rxq);
> >>  	void (*uninstall)(void *mp_priv, struct netdev_rx_queue *rxq);
> >> +	u32 caps;
> >>  };
> >>  
> >>  bool net_mp_niov_set_dma_addr(struct net_iov *niov, dma_addr_t addr);
> >> @@ -38,6 +51,7 @@ int netif_mp_open_rxq(struct net_device *dev, unsigned int rxq_idx,
> >>  		      struct netlink_ext_ack *extack);
> >>  int netif_mp_close_rxq(struct net_device *dev, unsigned int rxq_idx,
> >>  		       const struct pp_memory_provider_params *old_p);
> >> +bool netif_all_mps_have_cap(struct net_device *dev, u32 cap);
> >>  
> >>  /**
> >>    * net_mp_netmem_place_in_cache() - give a netmem to a page pool
> >> diff --git a/include/net/page_pool/types.h b/include/net/page_pool/types.h
> >> index 6d543076a0c0..0d48c05f1462 100644
> >> --- a/include/net/page_pool/types.h
> >> +++ b/include/net/page_pool/types.h
> >> @@ -31,8 +31,19 @@
> >>   */
> >>  #define PP_FLAG_ALLOW_UNREADABLE_NETMEM BIT(3)
> >>  
> >> +/* Take memory from the memory provider of the RX queue, if one is installed.
> >> + * Set page_pool_params.slow.netdev and queue_idx, and create the pool under
> >> + * the instance lock of the netdev.
> >> + * An unreadable provider also needs PP_FLAG_ALLOW_UNREADABLE_NETMEM, or page
> >> + * pool creation fails. Without this flag, PP_FLAG_ALLOW_UNREADABLE_NETMEM
> >> + * selects unreadable providers only.
> >> + */
> >> +#define PP_FLAG_MEM_PROVIDER	BIT(4)
> >> +
> >>  #define PP_FLAG_ALL		(PP_FLAG_DMA_MAP | PP_FLAG_DMA_SYNC_DEV | \
> >> -				 PP_FLAG_SYSTEM_POOL | PP_FLAG_ALLOW_UNREADABLE_NETMEM)
> >> +				 PP_FLAG_SYSTEM_POOL | \
> >> +				 PP_FLAG_ALLOW_UNREADABLE_NETMEM | \
> >> +				 PP_FLAG_MEM_PROVIDER)
> >>  
> >>  /* Index limit to stay within PP_DMA_INDEX_BITS for DMA indices */
> >>  #define PP_DMA_INDEX_LIMIT XA_LIMIT(1, BIT(PP_DMA_INDEX_BITS) - 1)
> >> @@ -82,7 +93,7 @@ struct pp_alloc_cache {
> >>   * @netdev:	netdev this pool will serve (leave as NULL if none or multiple)
> >>   * @queue_idx:	queue idx this page_pool is being created for.
> >>   * @flags:	PP_FLAG_DMA_MAP, PP_FLAG_DMA_SYNC_DEV, PP_FLAG_SYSTEM_POOL,
> >> - *		PP_FLAG_ALLOW_UNREADABLE_NETMEM.
> >> + *		PP_FLAG_ALLOW_UNREADABLE_NETMEM, PP_FLAG_MEM_PROVIDER.
> >>   */
> >>  struct page_pool_params {
> >>  	struct_group_tagged(page_pool_params_fast, fast,
> >> diff --git a/io_uring/zcrx.c b/io_uring/zcrx.c
> >> index 555f27e6c1ba..3b5bf97aa203 100644
> >> --- a/io_uring/zcrx.c
> >> +++ b/io_uring/zcrx.c
> >> @@ -1478,6 +1478,7 @@ static const struct memory_provider_ops io_uring_pp_zc_ops = {
> >>  	.destroy		= io_pp_zc_destroy,
> >>  	.nl_fill		= io_pp_nl_fill,
> >>  	.uninstall		= io_pp_uninstall,
> >> +	.caps			= MP_CAP_FRAG,
> >>  };
> >>  
> >>  static unsigned zcrx_parse_rq(netmem_ref *netmem_array, unsigned nr,
> >> diff --git a/net/core/dev.c b/net/core/dev.c
> >> index 3b60b15e2175..663fe3e32ea0 100644
> >> --- a/net/core/dev.c
> >> +++ b/net/core/dev.c
> >> @@ -10546,8 +10546,9 @@ int netif_xdp_propagate(struct net_device *dev, struct netdev_bpf *bpf)
> >>  		return -EBUSY;
> >>  	}
> >>  
> >> -	if (dev_get_min_mp_channel_count(dev)) {
> >> -		NL_SET_ERR_MSG(bpf->extack, "unable to propagate XDP to device using memory provider");
> >> +	if (!netif_all_mps_have_cap(dev, MP_CAP_READABLE)) {
> >> +		NL_SET_ERR_MSG(bpf->extack,
> >> +			       "unable to propagate XDP to device using unreadable memory provider");
> >>  		return -EBUSY;
> >>  	}
> >>  
> >> @@ -10622,8 +10623,9 @@ static int dev_xdp_install(struct net_device *dev, enum bpf_xdp_mode mode,
> >>  		return -EBUSY;
> >>  	}
> >>  
> >> -	if (dev_get_min_mp_channel_count(dev)) {
> >> -		NL_SET_ERR_MSG(extack, "unable to install XDP to device using memory provider");
> >> +	if (!netif_all_mps_have_cap(dev, MP_CAP_READABLE)) {
> >> +		NL_SET_ERR_MSG(extack,
> >> +			       "unable to install XDP to device using unreadable memory provider");
> >>  		return -EBUSY;
> >>  	}
> >>  
> >> diff --git a/net/core/devmem.c b/net/core/devmem.c
> >> index b9146b1f294a..8f190b574beb 100644
> >> --- a/net/core/devmem.c
> >> +++ b/net/core/devmem.c
> >> @@ -698,4 +698,5 @@ static const struct memory_provider_ops dmabuf_devmem_ops = {
> >>  	.release_netmem		= mp_dmabuf_devmem_release_page,
> >>  	.nl_fill		= mp_dmabuf_devmem_nl_fill,
> >>  	.uninstall		= mp_dmabuf_devmem_uninstall,
> >> +	.caps			= MP_CAP_FRAG,
> >>  };
> >> diff --git a/net/core/netdev_rx_queue.c b/net/core/netdev_rx_queue.c
> >> index a7261fedd5e7..9e14a747f9b5 100644
> >> --- a/net/core/netdev_rx_queue.c
> >> +++ b/net/core/netdev_rx_queue.c
> >> @@ -82,9 +82,13 @@ __netif_get_rx_queue_lease(struct net_device **dev, unsigned int *rxq_idx,
> >>  /* See also page_pool_is_unreadable() */
> >>  bool netif_rxq_has_unreadable_mp(struct net_device *dev, unsigned int rxq_idx)
> >>  {
> >> -	if (rxq_idx < dev->real_num_rx_queues)
> >> -		return __netif_get_rx_queue(dev, rxq_idx)->mp_params.mp_ops;
> >> -	return false;
> >> +	const struct memory_provider_ops *ops;
> >> +
> >> +	if (rxq_idx >= dev->real_num_rx_queues)
> >> +		return false;
> >> +
> >> +	ops = __netif_get_rx_queue(dev, rxq_idx)->mp_params.mp_ops;
> >> +	return ops && !(ops->caps & MP_CAP_READABLE);
> >>  }
> >>  EXPORT_SYMBOL(netif_rxq_has_unreadable_mp);
> >>  
> >> @@ -95,6 +99,22 @@ bool netif_rxq_has_mp(struct net_device *dev, unsigned int rxq_idx)
> >>  	return false;
> >>  }
> >>  
> >> +bool netif_all_mps_have_cap(struct net_device *dev, u32 cap)
> >> +{
> >> +	const struct memory_provider_ops *ops;
> >> +	unsigned int i;
> >> +
> >> +	netdev_assert_locked_ops_compat(dev);
> >> +
> >> +	for (i = 0; i < dev->real_num_rx_queues; i++) {
> >> +		ops = dev->_rx[i].mp_params.mp_ops;
> >> +		if (ops && (ops->caps & cap) != cap)
> >> +			return false;
> >> +	}
> >> +
> >> +	return true;
> >> +}
> >> +
> >>  static int netdev_rx_queue_reconfig(struct net_device *dev,
> >>  				    unsigned int rxq_idx,
> >>  				    struct netdev_queue_config *qcfg_old,
> >> @@ -189,6 +209,7 @@ static int __netif_mp_open_rxq(struct net_device *dev, unsigned int rxq_idx,
> >>  			       struct netlink_ext_ack *extack)
> >>  {
> >>  	const struct netdev_queue_mgmt_ops *qops = dev->queue_mgmt_ops;
> >> +	bool unreadable = !(p->mp_ops->caps & MP_CAP_READABLE);
> >>  	struct netdev_queue_config qcfg[2];
> >>  	struct netdev_rx_queue *rxq;
> >>  	int ret;
> >> @@ -196,16 +217,18 @@ static int __netif_mp_open_rxq(struct net_device *dev, unsigned int rxq_idx,
> >>  	if (!qops)
> >>  		return -EOPNOTSUPP;
> >>  
> >> -	if (dev->cfg->hds_config != ETHTOOL_TCP_DATA_SPLIT_ENABLED) {
> >> +	if (unreadable &&
> >> +	    dev->cfg->hds_config != ETHTOOL_TCP_DATA_SPLIT_ENABLED) {
> >>  		NL_SET_ERR_MSG(extack, "tcp-data-split is disabled");
> >>  		return -EINVAL;
> >>  	}
> >> -	if (dev->cfg->hds_thresh) {
> >> +	if (unreadable && dev->cfg->hds_thresh) {
> >>  		NL_SET_ERR_MSG(extack, "hds-thresh is not zero");
> >>  		return -EINVAL;
> >>  	}
> >> -	if (dev_xdp_prog_count(dev)) {
> >> -		NL_SET_ERR_MSG(extack, "unable to custom memory provider to device with XDP program attached");
> >> +	if (unreadable && dev_xdp_prog_count(dev)) {
> >> +		NL_SET_ERR_MSG(extack,
> >> +			       "unable to use unreadable memory provider with XDP program attached");
> >>  		return -EEXIST;
> >>  	}
> >>  	if (p->rx_page_size && !(qops->supported_params & QCFG_RX_PAGE_SIZE)) {
> >> diff --git a/net/core/page_pool.c b/net/core/page_pool.c
> >> index d7c88c0b67e5..d88a3ea528d4 100644
> >> --- a/net/core/page_pool.c
> >> +++ b/net/core/page_pool.c
> >> @@ -188,6 +188,29 @@ static void page_pool_struct_check(void)
> >>  				    PAGE_POOL_FRAG_GROUP_ALIGN);
> >>  }
> >>  
> >> +static int page_pool_select_mp(struct page_pool *pool,
> >> +			       const struct pp_memory_provider_params *mpp)
> >> +{
> >> +	const struct memory_provider_ops *ops = mpp->mp_ops;
> >> +	unsigned int flags = pool->slow.flags;
> >> +	bool readable;
> >> +
> >> +	if (!ops)
> >> +		return 0;
> >> +
> >> +	readable = ops->caps & MP_CAP_READABLE;
> >> +	if (flags & PP_FLAG_MEM_PROVIDER) {
> >> +		if (!readable && !(flags & PP_FLAG_ALLOW_UNREADABLE_NETMEM))
> >> +			return -EOPNOTSUPP;
> >> +	} else if (readable) {
> >> +		return 0;
> >> +	}
> >> +
> >> +	pool->mp_priv = mpp->mp_priv;
> >> +	pool->mp_ops = ops;
> >> +	return 0;
> >> +}
> >> +
> >>  static int page_pool_init(struct page_pool *pool,
> >>  			  const struct page_pool_params *params,
> >>  			  int cpuid)
> >> @@ -272,12 +295,14 @@ static int page_pool_init(struct page_pool *pool,
> >>  
> >>  	xa_init_flags(&pool->dma_mapped, XA_FLAGS_ALLOC1);
> >>  
> >> -	if (pool->slow.flags & PP_FLAG_ALLOW_UNREADABLE_NETMEM) {
> >> +	if (pool->slow.flags & (PP_FLAG_MEM_PROVIDER |
> >> +				PP_FLAG_ALLOW_UNREADABLE_NETMEM)) {
> >>  		netdev_assert_locked(pool->slow.netdev);
> >>  		rxq = __netif_get_rx_queue(pool->slow.netdev,
> >>  					   pool->slow.queue_idx);
> >> -		pool->mp_priv = rxq->mp_params.mp_priv;
> >> -		pool->mp_ops = rxq->mp_params.mp_ops;
> >> +		err = page_pool_select_mp(pool, &rxq->mp_params);
> >> +		if (err)
> >> +			goto free_ptr_ring;
> >>  	}
> >>  
> >>  	if (pool->mp_ops) {
> >> @@ -1070,6 +1095,9 @@ netmem_ref page_pool_alloc_frag_netmem(struct page_pool *pool,
> >>  	unsigned int max_size = PAGE_SIZE << pool->p.order;
> >>  	netmem_ref netmem = pool->frag_page;
> >>  
> >
> > [..]
> >
> >> +	if (static_branch_unlikely(&page_pool_mem_providers) &&
> >> +	    WARN_ON_ONCE(!page_pool_supports_frag(pool)))
> >> +		return 0;
> >>  	if (WARN_ON(size > max_size))
> >>  		return 0;
> >>  
> >
> > What's the deal with that? How do we get here?
> 
> Hey! Thanks for taking a look at the series!
> 
> An explicit frag call on a whole-buffer provider is a driver bug: UMEM
> chunks can be smaller than a page, and RX gives the whole chunk to
> userspace.
> 
> But page_pool_alloc_netmem() also picks frags for small requests, so a
> valid call can warn.
> 
> I think it would be better to make it return a whole buffer and its
> actual size. The WARN stays in the frag API, before taking a new buffer?
> Wdyt?

I see.. Idk, I'd still return 0 here, but without a warn. Not sure
we want a warn for any api misuse? Returning no netmem is gonna be enough
to debug things? As for the calls from page_pool_alloc_netmem, I'd also
handle it explicitly? if (size > max_size || !page_pool_supports_frag) ?
But no strong preference, up to you, was mostly trying to understand
what we are warning against here :-)
