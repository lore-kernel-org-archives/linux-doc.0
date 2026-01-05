Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC6B31E10B
	for <linux-doc@vger.kernel.org>; Mon,  5 Jan 2026 04:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767589008; cv=none; b=C/4Hd8z/u1wpkSRZRLqOnP704j78jWLe4mM3Lt81RmaxxzfvRDqPjm64ORIsyGvvySEDME15PubKMhzbVE0vWeBHt77M/gufWDpjkytntGdyvc/utPigUNzHS0pqWQJNZFtZc6WcKCwg8vrQPaUYPt5n/J4mhBz8o+VtR3SMLPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767589008; c=relaxed/simple;
	bh=jBwvhnDfidsek4dpH3nFNU7R+wPfEwm8oFGbdpxTVpU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HZRQlFe5hp+cpA6OzIGOf69cIT4esRK8Cf3npXDYFAeXmBhO6ohgniKy9E4AGU7N5Nyii9g5vse77UL9bPC6z7lTLu7x9XcreqDVbqCiqK6sz9zURUJil5OuojttVbWp1IvlqlrNFk6176ntaJUvuH0tWbhUqwIkO6bGMq7kG8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DjZdAnPS; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DjZdAnPS"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-34c868b197eso15258419a91.2
        for <linux-doc@vger.kernel.org>; Sun, 04 Jan 2026 20:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767589004; x=1768193804; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3hFH3lNfVrL079RvxBKm1qFjwG/jqKdNHXIh3f8h06U=;
        b=DjZdAnPSKhJjowEybd/uJ3UxV4OTWKNcfMD3RPhr7GOQBhEU1ggmKlEbgpwq3nYYd7
         vMjDrXkBziU78LtkXjQM6vRVvpdeUtbLuUtGpzs+mUFwiV8moSiDCztvjjZ6KfJmT78F
         XE9GUMAsvxex901xRgK8DUbCEP0oBhxREssCW+UjXtCSTVKSvjdhTUTB3jBTfhKS82xU
         ogWEp4HXMt8SBoqXAqIVM1cOVzYVjo59TK7XKFWzWMalXOsSLTCuLFLXe6uCkMvPfIJJ
         w6gP28JLvMgVR8c3/qLtEHJ4NlgRdYX9QvVd05WhbZ57HD/OBYup3pPGDa3a0+z26Ujx
         wckg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767589004; x=1768193804;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3hFH3lNfVrL079RvxBKm1qFjwG/jqKdNHXIh3f8h06U=;
        b=fzxsavZ8RnPt+5f1FTSD79dyiCy7qTpgpMuyJDUECly1Fn8ZuDeenDY+ze0izs0HfE
         fzVUZ9xZ9hOmHBwrLrf53VtOLozQF2lIpBniBPrCETqBVon8tw5H+Y25i5kyKSSUZkpz
         3lSxiA9ZYaGY15tU6gYJDPxt3/2x2IzfPtYischQizRxIh3E4QHYEYtoR66ARo7/NfGu
         InxJHNRCqIhOyg9obflpD16p27CQPN/h/4/tkBpxlV0cTQJ5aTdofr/UR8PQwDwk0Ff9
         9EFAU4QuofM6jjU5bvgrqte67Plqjcb3zGjdzwgF3AeFqSbVjTBv9rkuoNyC4i7hfdW+
         7j+A==
X-Forwarded-Encrypted: i=1; AJvYcCUvfi6kBauOpDwpYnYIuOhrZMOLPCfVMy9jUdALiT1NJJ1KOoGntZK+yKhf0Yjs57RqoB/jdbi7Gh8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNah5b6gCVBCyuCA79cjWB+eBenRnZDaEmEfBOTUJeAUJzHgIZ
	hBI1ddUyKME4ixpTuzhky5Ji3slK2MZwcm25zM1kI0+9M4a4MwtrrTkplJjvBFVoY2k=
X-Gm-Gg: AY/fxX5LaHUPSetDoXflA8X1XGhPDweGaJoqRB0wEPV2DFpgAkTSIEL+h6Q2FxniIea
	ank1+Ti6tSIb8oZLtjEi1HWrasI60ZBK5qzCrfoioYNI5wgQ0Onhn4hV5B7Wb63PyWxcnIjLKSa
	yRhzlVT2b8RLSe0sB2YPzlCVKGHfhmRdGzXFKTZgRsPqtN9tG79W+EG4xRkLFiveXTG16H0VNCg
	PN4EkkbCj7uyod9BWYQ0rojP2v/37CaLdeeMRIad6MUyR4ZJPV5dwaNeTpRaSadxw23oOXWr6bE
	74bmrk2dGJKAvB3mKR2ST0xFRfKQfXSOR8BnJw3Fa/YgXb/IBHLd+3z9tmZoQCAnU4dEqOGmA3a
	YWR/FB10IfvjBwDn6k2bQtv+9SXq5s1J9t5GypGm9ziuMnL+njJcQ5FnxOYQq2KLvOSnMtuPlA/
	cuH34j4jOYt9M=
X-Google-Smtp-Source: AGHT+IFZ00gScIfn7Z/S2C4S8PPgyPbUGX5mTMlgh0Rzf0TnKH5YXmLt4fA7cx6w6t8/JqVkxOTy2w==
X-Received: by 2002:a05:6a20:918e:b0:364:13aa:a526 with SMTP id adf61e73a8af0-376a9ce54bbmr44864432637.60.1767589003573;
        Sun, 04 Jan 2026 20:56:43 -0800 (PST)
Received: from localhost ([122.172.80.63])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7bd61b4csm40590900a12.18.2026.01.04.20.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 20:56:42 -0800 (PST)
Date: Mon, 5 Jan 2026 10:26:40 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: linux-kernel@vger.kernel.org, Cong Wang <xiyou.wangcong@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Olivia Mackall <olivia@selenic.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Jason Wang <jasowang@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Gerd Hoffmann <kraxel@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Robin Murphy <robin.murphy@arm.com>, Stefano Garzarella <sgarzare@redhat.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Petr Tesarik <ptesarik@suse.com>, Leon Romanovsky <leon@kernel.org>, 
	Jason Gunthorpe <jgg@ziepe.ca>, linux-doc@vger.kernel.org, linux-crypto@vger.kernel.org, 
	virtualization@lists.linux.dev, linux-scsi@vger.kernel.org, iommu@lists.linux.dev, 
	kvm@vger.kernel.org, netdev@vger.kernel.org, 
	"Enrico Weigelt, metux IT consult" <info@metux.net>, Viresh Kumar <vireshk@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH RFC 14/13] gpio: virtio: fix DMA alignment
Message-ID: <nyz6mnesozpu5u6p2mxrg37fwuj3sy7hjo2xkyepd3aybm7m52@7weoocg2pbs5>
References: <cover.1767089672.git.mst@redhat.com>
 <6f2f2a7a74141fa3ad92e001ee276c01ffe9ae49.1767112757.git.mst@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6f2f2a7a74141fa3ad92e001ee276c01ffe9ae49.1767112757.git.mst@redhat.com>

On 30-12-25, 11:40, Michael S. Tsirkin wrote:
> The res and ires buffers in struct virtio_gpio_line and struct
> vgpio_irq_line respectively are used for DMA_FROM_DEVICE via virtqueue_add_sgs().
> However, within these structs, even though these elements are tagged
> as ____cacheline_aligned, adjacent struct elements
> can share DMA cachelines on platforms where ARCH_DMA_MINALIGN >
> L1_CACHE_BYTES (e.g., arm64 with 128-byte DMA alignment but 64-byte
> cache lines).
> 
> The existing ____cacheline_aligned annotation aligns to L1_CACHE_BYTES
> which is now always sufficient for DMA alignment. For example,
> with L1_CACHE_BYTES = 32 and ARCH_DMA_MINALIGN = 128
>   - irq_lines[0].ires at offset 128
>   - irq_lines[1].type at offset 192
> both in same 128-byte DMA cacheline [128-256)
> 
> When the device writes to irq_lines[0].ires and the CPU concurrently
> modifies one of irq_lines[1].type/disabled/masked/queued flags,
> corruption can occur on non-cache-coherent platform.
> 
> Fix by using __dma_from_device_aligned_begin/end annotations on the
> DMA buffers. Drop ____cacheline_aligned - it's not required to isolate
> request and response, and keeping them would increase the memory cost.
> 
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>  drivers/gpio/gpio-virtio.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
