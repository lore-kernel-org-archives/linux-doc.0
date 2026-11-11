Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794439269;
	b=BBd6VHma2TEPSSf2582ZGsvQtssYqfjh+iuyi5PSzvkZg0t0HDMd6RUwNdS3gjVA/YC6
	 9LRkrWTW+5U8NGYop61XDeGIaLYFWd4xPGzCZMl77++sgN9M7uDZq/uYe1NzjDgYPq2QP
	 aRODS80AP8i4HcNMsDQOsFCCxVyt+hIq50u1fGhmNXpmUvbEp8hsTMgojN1S3MBe9ZmKo
	 kwGkv0xdwNkmIywAlMw+5z89scQIaWeXQdwVG88NTqlAkQWEL6k9YZ1mC8MpEQzJOLggp
	 UGkUpt81ZFv7dANKtW3AP8NwTPpxx8vGNaWQavySzKuG8BYe/0n3rIC5NwLUlMP6ONQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794439269;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=yLiNMvxVQruQcm1dmYQM6B9T1c0wqmTNiOzMtEKz3a0=;
	b=kdIep82rrUL2zNLoB3H5hCtQQ2Eiz2gwP+1TZgr7j34Sw1iqSIRnUGufZ5/xuSmT3P9/
	 VaN5HaaebBzC6PCjDRzRExLPXO/r2icg3xNCvKZdEO1iO1TYB+MrCd51crdj3SufhUZIS
	 tk6yNlgPErh+RK3W4qnJgHYvgQGFlM0cLee3VME09SgrUmKadKbjSRE5X/uGdEv7AB5hl
	 PDfgYemV+QErmF2EgdB4SXQ9H7FzDRnW5dbzY9jEcvgK2LTac6al9+KMmSIxw3TBySNP7
	 sm5Zi6l1kmT6wvWu2pJaZN+qwH6HC0zGKEs5ZbEHQB3UqeEv7jrFZ8EEB1G2MV9vEPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="tWA/XaWh";
	arc=none smtp.remote-ip=74.125.229.135
Received: from mail-dl2-f7.google.com (mail-dl2-f7.google.com [74.125.229.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A33660A3814
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 23:21:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A33660A3814
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tWA/XaWh
Received: by mail-dl2-f7.google.com with SMTP id a92af1059eb24-13985f8229aso3336347c88.1
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 15:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794439267; x=1795044067; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yLiNMvxVQruQcm1dmYQM6B9T1c0wqmTNiOzMtEKz3a0=;
        b=tWA/XaWhilDIFlnze3RfmXPT3zuLapRVFasaiN9nd0tewyRhLSq/JoPBuRjVBnWEQF
         EfJ2wfgsGX9owNgchteKd1lIu6RiSP3OH9AEtymuJ65j8FrudMdGkfDxyMJoyeAIJoM5
         wXaQ1drt7KU9O2M3MfvOiG8VNWFHnGTmcWYxF43Uv/U157sVRXT6hKUfXK1PW7gw0sHJ
         RwVku3hTl++BEabzGqVclt/k2pJ9Vb6VrzAfl7t5hSqMBdtfkABefgGE5YtRN0IX4PLj
         ceM2Gr/lktRQmiB0BBCRstLwizRWtFbe4/wlxG3NV4klLz1FaaanhWSP9Z65w3fzO8E2
         J3Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794439267; x=1795044067;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yLiNMvxVQruQcm1dmYQM6B9T1c0wqmTNiOzMtEKz3a0=;
        b=hrlsT98ekM1XIfDVHRE+XoCqOBdZUGB2fCPk8g+/gnVX1z9tGxk0KgywTniZ87NIna
         0aTMDSDK3q5vbcC3mGHX2s1h7YGhFXJaL5ZvbgqrCQ11WB7xUjQeggaiYkHQU8QqVQd+
         t3iEu3YpM7GjV8ztAJeM3ktqYNY84ogj3eCHSYqhUDN5UUppqUXqMiFIuNa1YHCQ638I
         Euy8Cn6TqUG4Ju+UZtVwTbcoi/BcDkzxmuwxE8PXE/CdoJ5fy72Yn/qY+JXMjOkEhrCu
         Cc9l74ONGlu+1oPER1AmJHmaCxP9QOeZqSnqbGVlVzBPMD/yVMfn0+d9tpMsmRSeGur0
         y4fA==
X-Forwarded-Encrypted: i=1; AL+hErGH8LFFKrBYKQ+GuBMTU2itXl9XlZ5sWpm9oJme/XDyc1UBVPhMWVT+zMYUjcErJwOzeC6kKp+48VI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/dr2OZejRmLZ612PLWrtwPagYcZOMv4nMN3V5TyLqb1Ts05ZbR
	KYeQ+yK+lSifspUxxjGdJR9373Lu+VIZ+83zKs6gU8gqisSTyXEuqxuq
X-Gm-Gg: AYBFou3UgywlTIMZqpiZ3Quu+q8gfunYhPzmvovJ92YQFM2p7viuR7uyNfjhLZYWQFP
	62CBwORg2jjNDXEWNXbHCYDlWzqCLYpj/h+AtJdsAy9pxtG9+YhXKrMj83FLknACe6SdSLyh+kJ
	q5AUTjDNUNkEXPMBVo+hKojFVuVArA+8jgpVRUZoDScm3FoDA+uQsdz1LHQqwjQD9BXDu5eqg+n
	K/X1eHk3scOdrfmr59GGzE4KYn3/MzqLLY5Y5w7yvJYNVpgFgGEWkF3/x1P1nR85rYukWpd6W0C
	eNkeTbmwdPW2y/VnwBjOx1dP0FgA2vIo1p2eDh7nDkWVH19a0CrQTsAY6VCaszIfsG3H2OkuK4L
	D8HTqUHotS2yTdBnlP5ycDdl8FUL+gRk6o9kWr7Bk/4se/MG6osyA8SN2sTjZGwVkev4G2llpnA
	RVip5hNA02ccS+9R4lfLTgmCI/1Qol6W1wT2GY31qm976Ol8NvZzZY1PiCu483fxrXxTzhgjsXL
	13JXM89LHyEvIw0ru/ChJh0+d4/LGzqujBiQPMqRv+4/llOGq9DSX45Btq/kThifqGdRF96G6S5
	5dcLmBbD8eHkHAs7iV3U1nWTh888Uu+RzF0uYO/t8ACW
X-Received: by 2002:a05:701b:420e:20b0:144:c112:5f24 with SMTP id a92af1059eb24-1b3c031ae2fmr3766487c88.25.1794439267244;
        Wed, 11 Nov 2026 15:21:07 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:60::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3772121e654sm7807640eec.2.2026.11.11.15.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 15:21:06 -0800 (PST)
Date: Wed, 11 Nov 2026 15:20:41 -0800
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
Subject: Re: [PATCH net-next v1 07/11] xsk: Deliver provider chunks without
 copying
Message-ID: <avT3vVT8iyKqyW8q@devvm16445.scu0.facebook.com>
References: <20261110102039.1002605-1-bjorn@kernel.org>
 <20261110102039.1002605-8-bjorn@kernel.org>
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
In-Reply-To: <20261110102039.1002605-8-bjorn@kernel.org>

On 11/10, Björn Töpel wrote:
> A provider socket still receives through the copy path, which takes
> FILL entries without the provider's ownership checks: a chunk that a
> page pool holds could be handed out twice. No driver opts in yet.
> 
> Put packets whose buffers all belong to the socket's provider on the
> RX ring as they are, and copy others into chunks the provider claims.
> Only the queue NAPI may produce to such a socket, so generic XDP and
> CPUMAP redirects to it are dropped.
> 
> A device may place payload at chunk offset 0, as fbnic does, so only
> the first buffer of a packet keeps the UMEM headroom. Such buffers may
> be sent back as they are, so only descriptors with XDP_TX_METADATA
> need room for TX metadata in front.
> 
> Signed-off-by: Björn Töpel <bjorn@kernel.org>
> ---
>  Documentation/networking/af_xdp.rst          |   6 +-
>  Documentation/networking/xsk-tx-metadata.rst |   3 +-
>  include/net/page_pool/memory_provider.h      |   2 +
>  net/core/page_pool.c                         |  34 +++-
>  net/xdp/xsk.c                                |  82 ++++++++-
>  net/xdp/xsk.h                                |   5 +
>  net/xdp/xsk_pp.c                             | 165 +++++++++++++++++++
>  net/xdp/xsk_queue.h                          |  18 +-
>  8 files changed, 304 insertions(+), 11 deletions(-)
> 
> diff --git a/Documentation/networking/af_xdp.rst b/Documentation/networking/af_xdp.rst
> index cc3f0d16b28f..e73a0005e169 100644
> --- a/Documentation/networking/af_xdp.rst
> +++ b/Documentation/networking/af_xdp.rst
> @@ -428,8 +428,10 @@ area and that your largest packet size can be 2K.
>  There is also an option to set the headroom of each single buffer in
>  the UMEM. If you set this to N bytes, it means that the packet will
>  start N bytes into the buffer leaving the first N bytes for the
> -application to use. The final option is the flags field, but it will
> -be dealt with in separate sections for each UMEM flag.
> +application to use. In a multi-buffer packet, only the first buffer is
> +guaranteed this headroom; the others may start at offset 0 of their
> +chunk. The final option is the flags field, but it will be dealt with
> +in separate sections for each UMEM flag.
>  
>  SO_BINDTODEVICE setsockopt
>  --------------------------
> diff --git a/Documentation/networking/xsk-tx-metadata.rst b/Documentation/networking/xsk-tx-metadata.rst
> index f240930ca1df..8bb74a569c26 100644
> --- a/Documentation/networking/xsk-tx-metadata.rst
> +++ b/Documentation/networking/xsk-tx-metadata.rst
> @@ -59,7 +59,8 @@ The flags field enables the particular offload:
>  Besides the flags above, in order to trigger the offloads, the first
>  packet's ``struct xdp_desc`` descriptor should set ``XDP_TX_METADATA``
>  bit in the ``options`` field. Also note that in a multi-buffer packet
> -only the first chunk should carry the metadata.
> +only the first chunk should carry the metadata. Only a descriptor with
> +``XDP_TX_METADATA`` needs ``tx_metadata_len`` bytes in front of it.
>  
>  Software TX Checksum
>  ====================
> diff --git a/include/net/page_pool/memory_provider.h b/include/net/page_pool/memory_provider.h
> index daec73c9dcee..849db08513b8 100644
> --- a/include/net/page_pool/memory_provider.h
> +++ b/include/net/page_pool/memory_provider.h
> @@ -49,6 +49,8 @@ struct memory_provider_ops {
>  bool net_mp_niov_set_dma_addr(struct net_iov *niov, dma_addr_t addr);
>  void net_mp_niov_set_page_pool(struct page_pool *pool, struct net_iov *niov);
>  void net_mp_niov_clear_page_pool(struct net_iov *niov);
> +void net_mp_release_page_pool_bulk(struct page_pool *pool,
> +				   netmem_ref *netmems, u32 count);
>  
>  int netif_mp_open_rxq(struct net_device *dev, unsigned int rxq_idx,
>  		      const struct pp_memory_provider_params *p,
> diff --git a/net/core/page_pool.c b/net/core/page_pool.c
> index e897e79d31f1..56c299f2280d 100644
> --- a/net/core/page_pool.c
> +++ b/net/core/page_pool.c
> @@ -1401,7 +1401,7 @@ bool net_mp_niov_set_dma_addr(struct net_iov *niov, dma_addr_t addr)
>  }
>  
>  /* Associate a niov with a page pool. Should follow with a matching
> - * net_mp_niov_clear_page_pool()
> + * net_mp_niov_clear_page_pool() or net_mp_release_page_pool_bulk()
>   */
>  void net_mp_niov_set_page_pool(struct page_pool *pool, struct net_iov *niov)
>  {
> @@ -1422,3 +1422,35 @@ void net_mp_niov_clear_page_pool(struct net_iov *niov)
>  
>  	page_pool_clear_pp_info(netmem);
>  }
> +
> +/**
> + * net_mp_release_page_pool_bulk() - take net_iovs back from a page pool
> + * @pool: page pool that holds one reference to each net_iov
> + * @netmems: net_iovs of the memory provider of @pool
> + * @count: number of entries in @netmems
> + *
> + * A memory provider takes net_iovs out of a page pool without
> + * ->release_netmem(), for example to give them to userspace. @pool may be
> + * freed on return.
> + */
> +void net_mp_release_page_pool_bulk(struct page_pool *pool,
> +				   netmem_ref *netmems, u32 count)
> +{
> +	bool trace = trace_page_pool_state_release_enabled();
> +	atomic_t *release_cnt = &pool->pages_state_release_cnt;
> +	int released;
> +	u32 i;
> +
> +	for (i = 0; i < count; i++) {
> +		DEBUG_NET_WARN_ON_ONCE(netmem_get_pp(netmems[i]) != pool);
> +		page_pool_clear_pp_info(netmems[i]);
> +		if (!trace)
> +			continue;
> +
> +		released = atomic_inc_return_relaxed(release_cnt);
> +		trace_page_pool_state_release(pool, netmems[i], released);
> +	}
> +
> +	if (!trace)
> +		atomic_add(count, release_cnt);
> +}
> diff --git a/net/xdp/xsk.c b/net/xdp/xsk.c
> index 113b0b08356d..b419c673e3f1 100644
> --- a/net/xdp/xsk.c
> +++ b/net/xdp/xsk.c
> @@ -386,6 +386,54 @@ static int __xsk_rcv(struct xdp_sock *xs, struct xdp_buff *xdp, u32 len)
>  	return -ENOMEM;
>  }
>  
> +static int xsk_pp_rcv_copy(struct xdp_sock *xs, struct xdp_buff *xdp, u32 len)
> +{
> +	u32 frame_size = __xsk_pool_get_rx_frame_size(xs->pool);
> +	u32 headroom = xsk_pool_get_headroom(xs->pool);
> +	void *copy_from = xsk_copy_xdp_start(xdp);
> +	u32 from_len, meta_len, rem, num_desc, i;
> +	u64 addrs[MAX_SKB_FRAGS + 1];
> +	skb_frag_t *frag = NULL;
> +	u32 to_len, copied;
> +	void *to;
> +
> +	from_len = xdp->data_end - copy_from;
> +	meta_len = xdp->data - copy_from;
> +	rem = len + meta_len;
> +
> +	num_desc = (len - 1) / frame_size + 1;
> +	if (num_desc > ARRAY_SIZE(addrs)) {
> +		xs->rx_dropped++;
> +		return -ENOSPC;
> +	}
> +	if (xskq_prod_nb_free(xs->rx, num_desc) < num_desc) {
> +		xs->rx_queue_full++;
> +		return -ENOBUFS;
> +	}
> +	if (!xsk_pp_claim_copy(xs->pool->pp, addrs, num_desc)) {
> +		xs->rx_dropped++;
> +		return -ENOMEM;
> +	}
> +
> +	if (xdp_buff_has_frags(xdp))
> +		frag = &xdp_get_shared_info_from_buff(xdp)->frags[0];
> +
> +	for (i = 0; rem && i < num_desc; i++) {
> +		to = xp_raw_get_data(xs->pool, addrs[i] + headroom) - meta_len;
> +		to_len = frame_size + meta_len;
> +		copied = xsk_copy_xdp(to, &copy_from, to_len, &from_len, &frag,
> +				      rem);
> +		rem -= copied;
> +
> +		__xskq_prod_reserve_desc(xs->rx, addrs[i] + headroom,
> +					 copied - meta_len,
> +					 rem ? XDP_PKT_CONTD : 0);
> +		meta_len = 0;
> +	}
> +
> +	return 0;
> +}
> +
>  static bool xsk_tx_writeable(struct xdp_sock *xs)
>  {
>  	if (xskq_cons_present_entries(xs->tx) > xs->tx->nentries / 2)
> @@ -453,8 +501,14 @@ static int xsk_rcv_check(struct xdp_sock *xs, struct xdp_buff *xdp, u32 len)
>  
>  static void xsk_flush(struct xdp_sock *xs)
>  {
> +	struct xsk_pp *pp = xs->pool->pp;
> +
> +	if (pp)
> +		xsk_pp_flush(pp);
>  	xskq_prod_submit(xs->rx);
> -	__xskq_cons_release(xs->pool->fq);
> +	/* A provider releases FILL entries under its lock. */
> +	if (!pp)
> +		__xskq_cons_release(xs->pool->fq);
>  	sock_def_readable(&xs->sk);

optional nit:

if (pp) {
	pp_flush
	prod_submit
} else {
	prod_submit
	cons_release
}

sock_def_readable

(hard to follow these scattered if(pp) checks :-( )

>  }
>  
> @@ -464,6 +518,11 @@ int xsk_generic_rcv(struct xdp_sock *xs, struct xdp_buff *xdp)
>  	int err;
>  
>  	err = xsk_rcv_check(xs, xdp, len);
> +	/* Only the NAPI of the queue feeds a memory provider socket. */
> +	if (!err && xs->pool->pp) {
> +		xs->rx_dropped++;
> +		err = -EOPNOTSUPP;
> +	}

This is confusing? Why even call xsk_rcv_check for pp case?

>  	if (!err) {
>  		spin_lock_bh(&xs->pool->rx_lock);
>  		err = __xsk_rcv(xs, xdp, len);
> @@ -488,7 +547,26 @@ static int xsk_rcv(struct xdp_sock *xs, struct xdp_buff *xdp)
>  		return xsk_rcv_zc(xs, xdp, len);
>  	}
>  
> -	err = __xsk_rcv(xs, xdp, len);
> +	if (!xs->pool->pp) {
> +		err = __xsk_rcv(xs, xdp, len);
> +	} else {

[..]

> +		/* A CPUMAP program runs XDP on another CPU, not in NAPI. */
> +		if (unlikely(!xdp_rxq_info_is_reg(xdp->rxq))) {
> +			xs->rx_dropped++;
> +			return -EINVAL;
> +		}
> +
> +		err = xsk_pp_rcv_zc(xs->pool->pp, xs, xdp);
> +		if (err != -EXDEV)
> +			return err;
> +
> +		/* Copy only packets of the queue, from its NAPI */
> +		if (unlikely(!xsk_pp_queue_buf(xs->pool->pp, xdp))) {
> +			xs->rx_dropped++;
> +			return -EINVAL;
> +		}
> +		err = xsk_pp_rcv_copy(xs, xdp, len);

Move this into __xsk_rcv_pp ?
