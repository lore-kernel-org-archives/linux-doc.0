Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794354734;
	b=JIhWSgTxbAcX5QgSG/zW6c8qgJjmDdAMw7gdd1snk+GUxLn/jGfzXxaX8NQwYYcuJGyH
	 53JEVCzEwU2Nu6rQiEUAgTnsKMwejLOivmK7Q7v0C6cPDs1wssoR9S1YwmyWhIfYyl+3H
	 bUHUjBmix0i2d7UNriW9NXkUx9yhRbywgr1doRZjaMVqM96GJKM1hNyN4HK7LJAcGFMmI
	 VscqgZGFPZND4KquENYazZZkFQ31fEbUoMz6eDgkdDMGze+IbsG6gd56j2af4H+9Vl+Oe
	 cuKaug8JQ9pOsaucSEyPVloX6qVfIdjVazaoshqdOVkKd5t8noeZXroZ+gtKPWknFMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794354734;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=9rj8EzBjlrHZ5xAlf0shYcxqn1sb5NbiDhyrmTtYevk=;
	b=lt1FVgf4ooP8CEbyfAssa3dS9ePLUWQMCduVx8OwiDd5vzrLjCuXrMYLHVHfWNxWeg5H
	 oLAvIqoUHBCCZyNl4LVFbQlmQnYBJ9La1vSeZN9MNfsrtyyLFxEjB9BAiMKrH+r+buLqy
	 B6k6ts7B+s5GYF9Qb4m3ZsFzhb6LKz7Rtx+KK6jHj92RIqwttp3jktXcux2ttqx4CG+Zo
	 JTApmVulPBwlx43+BNbwibF4UUxI6EvJeWlZrTbLP9DwIDi9A42DdhpZqHeH5DX9WUAEb
	 nnKF5KtmTzYXt3X8h5zCnqJz8bnmurQMnLuKQPq40HDrX35rOtlzRM4nyl1yDNt05TQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F6tfZ3GZ;
	arc=none smtp.remote-ip=74.125.229.4
Received: from mail-dy2-f4.google.com (mail-dy2-f4.google.com [74.125.229.4])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B0A60A382B
	for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 23:52:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75B0A60A382B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F6tfZ3GZ
Received: by mail-dy2-f4.google.com with SMTP id 5a478bee46e88-36e06480786so1083243eec.1
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 15:52:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794354734; x=1794959534; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9rj8EzBjlrHZ5xAlf0shYcxqn1sb5NbiDhyrmTtYevk=;
        b=F6tfZ3GZcndbrP3lQEGGVjId/xyZ9fHyzdAFR7MjnNcR+YLS6rmMlSKOvR7hICxc/h
         vKplz3pzZDEQ2Cb5IMOufB4Mfj7/QqLl5oTWW1/Gkgs6k5ksb+vRPmASdWSaEt3tFRAd
         J03GrlKVRUIVttm4Uv3b9pgD513Fqkq0Vk2pxqnQMc2nyEoz0+oJkK+MWHh4sFXuJM4M
         anpzZFRcCOL+w1IplL2L9VFP0n2srzF37IT4NPsouN3mKDiWukkZiJxCpiNGV6K65w2B
         7uuYihcagjJpW/96eJhFSw+nddMIsP2/yxEv3vPjYlqNjUT/9fXhotKbNPEdV6cOW0Rp
         00OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794354734; x=1794959534;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9rj8EzBjlrHZ5xAlf0shYcxqn1sb5NbiDhyrmTtYevk=;
        b=JnsKYcQRpQSJi1gXLQYho2ThbHjvqT3ceqCXk2T8kxtY+M+8mQnkjIteAF1dPI2UPA
         9XAi5ar9XTQDHna7bcFLHF2vWjcMXjoho8GsdPmkkv3Cc6XtkhrVVQJOgLIEUM2sBeH/
         b498v9h+ypS2sWj51rHOr8yPJBqETpjDhw2cvBkUYGHy1zhNFLDEH4G6bWxnbZEBI4IG
         f24jrI7fzMPQaty7qzXxpNBf52/hTFQiiLVR6UnCoDLuSQ38LHHPfBdi2XntOYwjSzdH
         Wn8Dbe+riCa9CAhbIS4aCgHpYH+vP377TuJPeQNncpeLxSZJmaeonOt/g0d7rinBD4Na
         XQZw==
X-Forwarded-Encrypted: i=1; AL+hErGRypkbaOUnz7HO/L/A0mEV1wuCEAweVZU6ZHG05pWsvNXVKkjPYUrNV8SoXKgBqmoOjIamWsdRRmo=@vger.kernel.org
X-Gm-Message-State: APuU4Z809Xz66lWbcKLJ3eQlOvdyba/PfZte/vz+4khrUn/+QwegsWKu
	5ar4NWIeNeK2K/fkKyBJ26zPwzVdjykHUBukZXE+qNGhsBzmBv5S/nFC
X-Gm-Gg: AYBFou3OfjimALboADB3+aK03zkJRjkneKrqYlQDE2LM/8QCjcsVnFOpRbdOPFje9uf
	ko2HILP0yVbIN7Tkf4Fy+5eOKCBhyMjCBvjfS3JjTcHvmQrE2xwQUGQrIsRhgLGOC2LHmWWZv1M
	QqJ1zr0N247JUqEJqtYZGhnzrepBXsxyzFToGsKT7+z3w3cxt0MA1SXtAUh31JwjPN7QZQetRVf
	vB9tzhs58lrdL/rNFf6Tszkbh+mag5Zhdnfkmf28g1tjMkBAQsEGdzMHtot14/K4OXZvI8cTlcR
	C9/wTKvK7Zm8FI5oAT7/Ytt3F4qNfEwptu8wN1Sy5uCQYrBx98NN4d4Qwz9zZshxrwtiYYmFXM1
	u6Rq6RzUZr/Hyu4dMk8+hfYqQM5s1icy0Wj64BxiMEKdAO7nIduQ6KyFA7DZgbrV9ITjufMSWLx
	aYnJc2scT4zE1pjR2ZW3XzQew1Z1i+54URk1CRASCJdlHMpjd6ajT6NPbkSpLrq3n/eZqKLXYvM
	08G/L67xtJ+qoO5o7j3KNpcOQDfs1bZ0jDN/Os8Zw/F0Csmw/4xcURjxculYpFtwGeLbifSRI/G
	fFAbLuEo3XNh+dTQMNK7kLU=
X-Received: by 2002:a05:7022:7e88:b0:1b3:c0cb:d231 with SMTP id a92af1059eb24-1b3c0cc5d12mr447595c88.45.1794354733614;
        Tue, 10 Nov 2026 15:52:13 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:42::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b4ecccsm8750104c88.13.2026.11.10.15.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 15:52:13 -0800 (PST)
Date: Tue, 10 Nov 2026 15:51:21 -0800
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
Subject: Re: [PATCH net-next v1 06/11] page_pool: Coordinate refill with
 memory providers
Message-ID: <avOtxBw_grmuDJae@devvm16445.scu0.facebook.com>
References: <20261110102039.1002605-1-bjorn@kernel.org>
 <20261110102039.1002605-7-bjorn@kernel.org>
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
In-Reply-To: <20261110102039.1002605-7-bjorn@kernel.org>

On 11/10, Björn Töpel wrote:
> A UMEM has a fixed number of chunks. When a refill finds none, and the
> chunks come back later, nothing schedules the queue again: RX stalls.
> Kicks after each queue operation are easy to miss.
> 
> Drivers report the end of each refill with page_pool_refill_done().
> The provider then asks for another poll, or wakes the queue later
> through the NAPI that the core publishes while the queue runs. Socket
> wakeups use that NAPI too, so such drivers need no ndo_xsk_wakeup.
> 
> With XDP_USE_NEED_WAKEUP, the FILL flag stays set: a flag set only
> when starved can miss an entry posted at the same time.
> 
> Signed-off-by: Björn Töpel <bjorn@kernel.org>
> ---
>  Documentation/networking/netmem.rst     | 10 +++
>  include/net/netdev_rx_queue.h           |  6 ++
>  include/net/page_pool/helpers.h         | 24 ++++++
>  include/net/page_pool/memory_provider.h |  2 +
>  include/net/page_pool/types.h           |  6 ++
>  net/core/dev.c                          |  4 +
>  net/core/dev.h                          |  4 +
>  net/core/netdev_rx_queue.c              | 97 ++++++++++++++++++++++++-
>  net/xdp/xsk.c                           |  4 +
>  net/xdp/xsk.h                           |  1 +
>  net/xdp/xsk_pp.c                        | 73 ++++++++++++++++++-
>  11 files changed, 226 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/networking/netmem.rst b/Documentation/networking/netmem.rst
> index 39cb75339704..74c73d7d126e 100644
> --- a/Documentation/networking/netmem.rst
> +++ b/Documentation/networking/netmem.rst
> @@ -136,6 +136,16 @@ Driver RX Requirements
>     circulation times, such as when userspace holds a reference in zerocopy
>     scenarios.
>  
> +8. After each RX ring refill, call page_pool_refill_done() once per page
> +   pool, with PP_REFILL_FULL only if all rings that use the pool are full.
> +   Rings of a queue that take buffers from one such provider share one
> +   page pool. Keep buffers in each of them, first in a ring that every
> +   packet needs, like a header ring, so that a provider with few buffers
> +   does not leave them all in one ring. If the call returns false, poll
> +   again soon, for example by returning the full NAPI budget. Register the
> +   NAPI of each RX queue with netif_queue_set_napi(); the core schedules
> +   it when provider buffers become available.
> +
>  Driver TX Requirements
>  ======================
>  
> diff --git a/include/net/netdev_rx_queue.h b/include/net/netdev_rx_queue.h
> index 989120cbf452..ca12cbf7b825 100644
> --- a/include/net/netdev_rx_queue.h
> +++ b/include/net/netdev_rx_queue.h
> @@ -33,6 +33,12 @@ struct netdev_rx_queue {
>  	struct pp_memory_provider_params mp_params;
>  	/* stamps the page pools of each queue allocation */
>  	u32				mp_gen;
> +	/* NAPI of the running queue, for memory provider wakeups. Set while
> +	 * mp_armed, and if the provider has a refill_done op. Written under
> +	 * the ops lock, read under RCU, see netif_mp_wake().
> +	 */
> +	struct napi_struct __rcu	*mp_napi;
> +	bool				mp_armed;

The comment should explain why mp_napi != napi? (I do not understand why)
