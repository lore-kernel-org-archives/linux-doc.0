Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181C23370EB
	for <linux-doc@vger.kernel.org>; Mon,  5 Jan 2026 09:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767606489; cv=none; b=CPO+q96hdAU4vVyzzwd92sgAS1K5PynRo7QY3wwT/wNA98CdbqLM3gjlxGU80Uig/+QKypxbf0U5ft6mxH4xIpTUCVerBB87OUEGf9Fn0LIPkJDbA5VLJ2stagEM0jPQZ3pLftR9lkmuPwpcFwoTSgFCXVzkGhGkOVcIiVhg6UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767606489; c=relaxed/simple;
	bh=GqAwY0OHbZKQzzJb3VatReAfBA97RCbOF3bWO0/Z1Js=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iBvV56VZtQjrasHm4tBa/Gmw79JMdfUjRUZt+n/Z35g3z+HxfDqMVDwnf8pQCFqWTiM5ok9Pv5nriFNZQjYBjTBJSGNtRb+7lhTwer3htOaY2QWT2d9TUqGa/VBEPqr7TXk0kgfyMiOVU7dR7dsJAEoplZaummCKvczloQNGD4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=AtICXBre; arc=none smtp.client-ip=209.85.221.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="AtICXBre"
Received: by mail-wr1-f66.google.com with SMTP id ffacd0b85a97d-43106d67728so1008435f8f.0
        for <linux-doc@vger.kernel.org>; Mon, 05 Jan 2026 01:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767606485; x=1768211285; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3YNJPmUNbnGNTCEfFfuOCZFqj9o9elJ+A8mEb2IK5hU=;
        b=AtICXBreWgR5zWZkx70j07qlSmmhIC3ZqGCmXxKIMHXOTLOy6nxn/qnWTCcX39gjFk
         3C08xn4HmXvUYMcS+jm212kQBf9YRafJTOsRdrtWvU36SA7FdNxr8XNcVBgfGBzTAkuK
         Aoa1U3rC9OJpawzXJNlg1hERi0SRUuLISUXKnXuQmxC+z5zY5iCJ/NwZlwTh/huv1ech
         c7swds+qtkU3pFgdt4NUYI4ZRIDQ2zF4e4Wk1Ltncgakxx9VL0Yr5ihmTvmeoyiX72lj
         x25excA6kO47QS8slAvbH3zgN3UoSoQBCQx6iEM6UfvFUWWgb58FaR7EieXDWAS01dYW
         sxmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767606485; x=1768211285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3YNJPmUNbnGNTCEfFfuOCZFqj9o9elJ+A8mEb2IK5hU=;
        b=v3c7AxBhGbTsurqRGTLTzgOKnrZz+ueDHO+ko5ZfH7i05CPGTfogxjKK+kGjq68aYv
         QPmmVoACxLOuS3ysKn1/DG6GAUClnypUKGnUgi8vQYXWT3eq1ZLw2SfMxq2XwyBb3xMx
         NAJzchCCKAwLUpHlQVrOawtACy2w8SFgZzNmyH2KfSsTiRQ6029R3yLfpZkoON4RUIcT
         735DEsVlXZPjSTw6nnG6HA+7qjXwMWyLbIVag6u9x8d9k5PtJ8igyCdFQHQOtyXVBNFE
         3pSZZCk5o10Ue68JsbB/x8j8AvRgXGk7yZNa00v1ut7fUIW4KoBkmwu0VfS5YPaIlFDT
         KYhA==
X-Forwarded-Encrypted: i=1; AJvYcCWhAUAX686h5cECXSJ4Ej90NjsYjuz2JKhBKT5k/dUHpOjcDMpERhSoqI3earENibskZqur2zeUGNg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs22DBqTUOPBb90B52q27MVGdiPqSn3Kfj7ZJ3/fH4KLSsQdLP
	EXKdlxScUdw6Tvff4SHoirdgyyP8vLvWsuMIXMPBuADlz8bNm2TSbv2hi0BjKQYW1vU=
X-Gm-Gg: AY/fxX6Jy6bi1GxWb73TbHLYQbNlAufIOQociN6h7VoAHkHUkDgByH3n2l1fbYa72b9
	x20hPC7F4SGnJhyusCtvvlWa3ah34lBhuB41Gh43RXeYE3MzI3/ydvkujflu9MREfF95iTTnMgB
	KJTEjQKLIRFAF4XWEDDr4152RHUH+6vU9edwPctwopNlzHFtOHQ6yFJOnrJPukqkL1zwHfF0ZuT
	zxEv8U79dmSPM/QJIc9GI4eTIO5YoJ8/yuP71SUAuXlKfPcHHCp+IJZl8A6mc+z4ai3bb6CQR8t
	3M9VkA11he8ZTGvgRID157MuZzrx/z5vGJNlyt+nnaTFKzUEN9YgqwSjhn1RElTDCmQ8x3C68m4
	qODUVIW/+j1PPtJVuLIkCi9MnOIKziur9mQmFZLL+6xg4biNti62UdzJY18DfFlvx0FfHhRMhzi
	7ozkq/fO558u1nDWHcK+KvRFgksc6hqvfJ+K5OXTRNNQChNlfumcrTAo0uQOPtuZmUKrd6N0rGa
	N6y
X-Google-Smtp-Source: AGHT+IHPziOrpKV7Kr9yyjS7tcuC3KfVS3vu6/0u8YX5ecS7isO2cmN7o1CvFXRGO2JgzmojB4/s8Q==
X-Received: by 2002:a5d:548c:0:b0:432:5b81:493 with SMTP id ffacd0b85a97d-4325b810aa7mr24854531f8f.5.1767606485367;
        Mon, 05 Jan 2026 01:48:05 -0800 (PST)
Received: from mordecai (dynamic-2a00-1028-83b8-1e7a-3010-3bd6-8521-caf1.ipv6.o2.cz. [2a00:1028:83b8:1e7a:3010:3bd6:8521:caf1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1af2bsm99699009f8f.1.2026.01.05.01.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 01:48:04 -0800 (PST)
Date: Mon, 5 Jan 2026 10:48:02 +0100
From: Petr Tesarik <ptesarik@suse.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: linux-kernel@vger.kernel.org, Cong Wang <xiyou.wangcong@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>, Olivia Mackall <olivia@selenic.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Jason Wang <jasowang@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Eugenio =?UTF-8?B?UMOpcmV6?= <eperezma@redhat.com>, "James E.J. Bottomley"
 <James.Bottomley@hansenpartnership.com>, "Martin K. Petersen"
 <martin.petersen@oracle.com>, Gerd Hoffmann <kraxel@redhat.com>, Xuan Zhuo
 <xuanzhuo@linux.alibaba.com>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, Stefano Garzarella
 <sgarzare@redhat.com>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Leon Romanovsky
 <leon@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, Bartosz Golaszewski
 <brgl@kernel.org>, linux-doc@vger.kernel.org, linux-crypto@vger.kernel.org,
 virtualization@lists.linux.dev, linux-scsi@vger.kernel.org,
 iommu@lists.linux.dev, kvm@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v2 02/15] docs: dma-api: document
 __dma_from_device_group_begin()/end()
Message-ID: <20260105104802.42bd8fe5@mordecai>
In-Reply-To: <01ea88055ded4d70cac70ba557680fd5fa7d9ff5.1767601130.git.mst@redhat.com>
References: <cover.1767601130.git.mst@redhat.com>
	<01ea88055ded4d70cac70ba557680fd5fa7d9ff5.1767601130.git.mst@redhat.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 5 Jan 2026 03:22:57 -0500
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> Document the __dma_from_device_group_begin()/end() annotations.
> 
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

I really like your wording ("CPU does not write"), which rightly refers
to what happens on the bus rather then what may or may not make a
specific CPU architecture initiate a bus write.

I'm not formally a reviewer, but FWIW:

Reviewed-by: Petr Tesarik <ptesarik@suse.com>

> ---
>  Documentation/core-api/dma-api-howto.rst | 52 ++++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
> 
> diff --git a/Documentation/core-api/dma-api-howto.rst b/Documentation/core-api/dma-api-howto.rst
> index 96fce2a9aa90..e97743ab0f26 100644
> --- a/Documentation/core-api/dma-api-howto.rst
> +++ b/Documentation/core-api/dma-api-howto.rst
> @@ -146,6 +146,58 @@ What about block I/O and networking buffers?  The block I/O and
>  networking subsystems make sure that the buffers they use are valid
>  for you to DMA from/to.
>  
> +__dma_from_device_group_begin/end annotations
> +=============================================
> +
> +As explained previously, when a structure contains a DMA_FROM_DEVICE /
> +DMA_BIDIRECTIONAL buffer (device writes to memory) alongside fields that the
> +CPU writes to, cache line sharing between the DMA buffer and CPU-written fields
> +can cause data corruption on CPUs with DMA-incoherent caches.
> +
> +The ``__dma_from_device_group_begin(GROUP)/__dma_from_device_group_end(GROUP)``
> +macros ensure proper alignment to prevent this::
> +
> +	struct my_device {
> +		spinlock_t lock1;
> +		__dma_from_device_group_begin();
> +		char dma_buffer1[16];
> +		char dma_buffer2[16];
> +		__dma_from_device_group_end();
> +		spinlock_t lock2;
> +	};
> +
> +To isolate a DMA buffer from adjacent fields, use
> +``__dma_from_device_group_begin(GROUP)`` before the first DMA buffer
> +field and ``__dma_from_device_group_end(GROUP)`` after the last DMA
> +buffer field (with the same GROUP name). This protects both the head
> +and tail of the buffer from cache line sharing.
> +
> +The GROUP parameter is an optional identifier that names the DMA buffer group
> +(in case you have several in the same structure)::
> +
> +	struct my_device {
> +		spinlock_t lock1;
> +		__dma_from_device_group_begin(buffer1);
> +		char dma_buffer1[16];
> +		__dma_from_device_group_end(buffer1);
> +		spinlock_t lock2;
> +		__dma_from_device_group_begin(buffer2);
> +		char dma_buffer2[16];
> +		__dma_from_device_group_end(buffer2);
> +	};
> +
> +On cache-coherent platforms these macros expand to zero-length array markers.
> +On non-coherent platforms, they also ensure the minimal DMA alignment, which
> +can be as large as 128 bytes.
> +
> +.. note::
> +
> +        It is allowed (though somewhat fragile) to include extra fields, not
> +        intended for DMA from the device, within the group (in order to pack the
> +        structure tightly) - but only as long as the CPU does not write these
> +        fields while any fields in the group are mapped for DMA_FROM_DEVICE or
> +        DMA_BIDIRECTIONAL.
> +
>  DMA addressing capabilities
>  ===========================
>  

