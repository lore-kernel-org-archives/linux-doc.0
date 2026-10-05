Received: from mail-pj2-f4.google.com (mail-pj2-f4.google.com [74.125.227.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3534C4D09F1
	for <linux-doc@vger.kernel.org>; Mon,  5 Oct 2026 16:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791219083; cv=none; b=uB3qaPQUAmCRRZRn1uxGB4u3O8ZTQ6RP/HRD+ovlx/Tqonka2V5P0gMsHfznU+AvZe/jnM2C65cM1XpI+7dVUgTq3QmV9N8OD5tNlxaYcgMsfm4N/ymO3mvYW8zEPqMmLe8rZkqJXqZlIdykfIyraaQW6P2PwsgQR9ogIzGchOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791219083; c=relaxed/simple;
	bh=ZtOtfI8xTZljtzEITNuddg7KMK3dN7NLgg7QIotbHg0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L5b2NPlRU4a+t2tA/w/h1oxh7YA7zp0n+pNLYZ+Gzz64Wl2wKIFVxi69Qa+fMUKe6pXyxsZrhGhamlY+u2ZK3NPATJE74ZUurrB4FzXSqItwhfLls2uO1v8qBeaBR9CS+J4XFvdcCZ7aIu0YsV7+rkmE0brQxg43sjhzk4/kUqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jYBEAguj; arc=none smtp.client-ip=74.125.227.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jYBEAguj"
Received: by mail-pj2-f4.google.com with SMTP id 98e67ed59e1d1-3a854dffb5dso6917a91.1
        for <linux-doc@vger.kernel.org>; Mon, 05 Oct 2026 09:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791219080; x=1791823880; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=b4mkDJheIxHRdMD7TqVn4ykGrzx67Q/w28iQIL9i/AE=;
        b=jYBEAguj/HXC2O9ml4GkNN/+9pMpbTf40fb8JKLkjR7FD8OKSyr70p61oJulOnjdra
         kQaMEQjqyv7sgrI2g2fg6PPmcYTR8lSmBlH090Iui9CcaC+IW37lvow5Ppb4NrXhAkO2
         IUUbQTvR8oSRFHXnBVOn4p7dae5R/an/Hk/XbBVSAfbNwhQWqhTg9eyVfwJuFg/U1L7j
         TW4UrRlz0bYBlxFVVvbKXXheqRt+HGKxQJJjuqIluT7hvwbwkHHQEyKPKJCKrRlbR9jh
         fqoadKhkTSprHmHkHPhqDaUgY3EKNIo4K78uf9PO/TOVsW6IOOw9qLPh+UHkye4inhDv
         KQvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791219080; x=1791823880;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=b4mkDJheIxHRdMD7TqVn4ykGrzx67Q/w28iQIL9i/AE=;
        b=W9rLCwoavHev89TeDKNFJcEE8RogvBDGhmy1DWP+ojXDTCiuLN3yiDNokS4gduMtGe
         IGV4lgqe0cdO4VKrj5bmB8B2020FRIUL62terLeIVc0laey8wKCkYaY2ywVqwd+/vOU8
         xsSNlfF2Qfj/wW8SMPJ42iEqxODTgx9+iyUI/TMU45U4xYL+f9gW0gGN7eUfEFpAmlvF
         FQM+WVKGubvDU6HM05WZZETTzPfkI5VCbr0RkOiBVWk92Hr30cKh/I6BR1wFKIqumGI+
         FsQYQFeycBWSf1F75mrtEFdTWCPUB9GU66DbYAYnkUBURZhzpA/sK+yPT4r2tbIstSpA
         +nGA==
X-Forwarded-Encrypted: i=1; AKwUvBwmuvImb/7sYbzlKx6dAkgnC0ZJ0OJaYkEUzOuaozD1cf4NsaT3z4uoI3cTy3LAhI/FoVZFQQzY4lc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJnrLxkLGwPiu1zivbN7kNgKFpWg/KW8dXgVjKTFXBQeoRmF/W7
	eYw7AZOihzpNKlrUDz/yqIXie2Pd5+e8xv47lObyoFGuXWlGDdE6yoQ1
X-Gm-Gg: AYBFou235sYVCCIIPXqqApe5i8w+6oVRmQe4EE/tz7EKNZ+1e88axntvnic7NsDlbE3
	PMbXAzrC/vk7N7Xd11dSBdFxBhFj6TW79hFo3L24RPQanw+SJVZuH5GSGOqBJb6/v7/nqisuJ0A
	T2W+NlB+sNUVMfpulOtkUcplWPt6+IXNs7XJ4X0zyh+9s0pzDToonQ4mZk5dMG3Qy/BBmwdUmyh
	IFjed7UZxCFbXp00Bo1n6YIcEyZWdfBpHG32374WuEEUCDpOU6tO6eVM0RsTmo1IgvMoAfMWNb6
	WVSDTFM8n6qY11IjSjka95k9JwxXtndPPq763Pa6JjvYC3NqdVeU7eIv739M6XdGycYggU2NREr
	jl2hEg6VAsaOA7Cr3j81OsXm0V/Seulkt/PVewY5blNcR8V29GbJyF88GT6ya5gX/ruLBYTecFw
	79F1XNWTu9mbrj/0qnsHB5fQsR9XBJCu2tExSAoLBcbGbuCqPkLrTzKZNk30K8+Uk=
X-Received: by 2002:a17:90b:2ec3:b0:3a6:fec5:c184 with SMTP id 98e67ed59e1d1-3a6fec5d190mr6627900a91.7.1791219080418;
        Mon, 05 Oct 2026 09:51:20 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:1::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a851525bffsm261628a91.0.2026.10.05.09.51.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 09:51:20 -0700 (PDT)
Date: Mon, 5 Oct 2026 09:51:15 -0700
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
	io-uring@vger.kernel.org, "Mike Marciniszyn (Meta)" <mike.marciniszyn@gmail.com>, 
	Weiming Shi <bestswngs@gmail.com>, Nikolay Aleksandrov <razor@blackwall.org>, 
	David Wei <dw@davidwei.uk>, Alexander Lobakin <aleksander.lobakin@intel.com>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Mina Almasry <almasrymina@google.com>
Subject: Re: [RFC net-next 05/15] page_pool: Extend memory provider operations
Message-ID: <asPUZ8DPllHd6Yu9@devvm7509.cco0.facebook.com>
References: <20261002190018.696925-1-bjorn@kernel.org>
 <20261002190018.696925-6-bjorn@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261002190018.696925-6-bjorn@kernel.org>

On 10/02, Björn Töpel wrote:
> The current memory providers give memory that the CPU cannot read,
> and they can always refill. An AF_XDP provider is different. The CPU
> can read its memory, it has only the buffers that userspace puts in
> the FILL ring, and its buffers go back to userspace instead of being
> freed. It needs four things from page_pool:
> 
> - A CPU address for each net_iov. A provider can set the address of
>   the first net_iov in its net_iov_area and the size each net_iov
>   covers. netmem_address() then computes the address without a call
>   into the provider; drivers call it for every packet. A
>   net_iov_area without an address stays unreadable.
>   page_pool_is_unreadable() is false for a readable provider.
> 
> - A way to say that the refill is not done. The new refill_done
>   callback tells the driver whether it may stop refilling. A
>   provider that still has buffers returns false, and the driver
>   keeps NAPI scheduled.
> 
> - A way to give up a buffer without freeing it. Add a batched call
>   that ends page_pool ownership of buffers that leave through the
>   provider, for example to userspace. It clears the page_pool link,
>   so a later page pool can take the buffer. Add the matching batched
>   call that sets the link, and a DMA sync helper for drivers that
>   post a buffer again directly.
> 
> - No buffer splitting, because a split buffer has several owners.
>   Add MP_CAP_FRAG. page_pool refuses fragment allocation from a
>   provider without it.
> 
> devmem and io_uring set MP_CAP_FRAG and keep their fragment
> behaviour. Their refill paths now use the batched call that sets the
> link.
> 
> Signed-off-by: Björn Töpel <bjorn@kernel.org>
> ---
>  include/net/netmem.h                    | 31 ++++++++++-
>  include/net/page_pool/helpers.h         | 62 +++++++++++++++++++++-
>  include/net/page_pool/memory_provider.h | 28 +++++-----
>  io_uring/zcrx.c                         |  4 +-
>  net/core/devmem.c                       |  7 ++-
>  net/core/page_pool.c                    | 68 ++++++++++++++++++++-----
>  6 files changed, 165 insertions(+), 35 deletions(-)
> 
> diff --git a/include/net/netmem.h b/include/net/netmem.h
> index cc97611632dc..e6dff0b01581 100644
> --- a/include/net/netmem.h
> +++ b/include/net/netmem.h
> @@ -105,6 +105,12 @@ struct net_iov_area {
>  

[..]

>  	/* Offset into the dma-buf where this chunk starts.  */
>  	unsigned long base_virtual;

Will send a patch to drop this one, don't think we use it anymore..

[..]

> +	/* CPU address of the first net_iov's memory, or NULL when the CPU
> +	 * cannot read the area. Each net_iov covers 1 << @niov_shift bytes.
> +	 */
> +	void *vaddr;

Who is setting this? Somewhere in another patch? Can we keep it here?

> +	u8 niov_shift;

If we need niov_shift at area level, let's move the one from binding here?
Then the existing callers can do binding->area.niov_shift.

>  };
>  
>  static inline struct net_iov_area *net_iov_owner(const struct net_iov *niov)
> @@ -117,6 +123,23 @@ static inline unsigned int net_iov_idx(const struct net_iov *niov)
>  	return niov - net_iov_owner(niov)->niovs;
>  }
>  
> +static inline bool net_iov_is_readable(const struct net_iov *niov)
> +{
> +	return net_iov_owner(niov)->vaddr;
> +}
> +
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

Or, alternatively, store dma_base in area and do:

return niov->dma_addr - area.dma_base + vadd ?
