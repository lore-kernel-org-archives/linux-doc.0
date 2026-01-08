Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F993A0EB1
	for <linux-doc@vger.kernel.org>; Thu,  8 Jan 2026 14:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767881322; cv=none; b=bUL9wxP9zv7Wkk4wJLxHZ/61Zl0/kpaYGGm6NLMzlpYKg5ts4GB285cTNszLrp6Fqe3lVWdGmTKFrq0Ws1JLQQp+EeXm+68SdDviIFk4DgqXR8rXgCjQVPbcewECVjT2dBBKMvE4ydyOKnVxsONnhs2t7ujdF6NxoA4d9xCjKUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767881322; c=relaxed/simple;
	bh=Tv7zh9Hk92kdNn+K2fPlpE9fTBNWYFWSvOonEurgOJc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QaQS5FmMbRVwKnXpRpP0JzP/HvUuOUIFaR0nonQvXB4RFJ2aQ0eab00NOa4VGHQ88GF3TjiEYVJhUhpHIVwqqK64OPntE0/Iw8vGcOSCA2eYmF7Mu9C00CTQ5HORky/IoFNEKmCICnN2O2mCL2M3D7aJU2eUHAtCLvPlIWruSpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JMv34wXl; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=F9sH7pR8; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JMv34wXl";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="F9sH7pR8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767881319;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qb0opi0EkMyYcYBrprImauJ5+csaYa0bSdovEgtQBZs=;
	b=JMv34wXl46/FnDYIPBeZ51sXipwgk6pezAGY39bqTlzPzqGLwhRvYA/iMaoSBPaRx9mLmE
	WPsMmMtnHKxBdSGceUrsdOCiOOR846ppp2hyrm4iDkWlsJ7yXyPyGNQfRhlC14giF8oheA
	VeRS8FI//u7LGUMkUMyNIwT1lF2XALc=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-573-XEanE4RzMQ2vpVwnV4-o5g-1; Thu, 08 Jan 2026 09:08:38 -0500
X-MC-Unique: XEanE4RzMQ2vpVwnV4-o5g-1
X-Mimecast-MFC-AGG-ID: XEanE4RzMQ2vpVwnV4-o5g_1767881317
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-b831e10ba03so499397266b.1
        for <linux-doc@vger.kernel.org>; Thu, 08 Jan 2026 06:08:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767881317; x=1768486117; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qb0opi0EkMyYcYBrprImauJ5+csaYa0bSdovEgtQBZs=;
        b=F9sH7pR867jA/rHKxKKU/wpVji4GMqf5bUfz/vL/UajgRxivMXVN1rpc+bMD//MFem
         1/W8C34QuRmQ49nrCPu280beltecWuHq1ZHRIhey8IRNXFSJwnwFmr3n1XCxadOSXRTW
         aRQNsTndJZfe/+athyPIXMVHIHuJKSXtdJcQODBjYfw2l1dt7fi3IziyM7jZfem9OIs5
         Ui5Cc5tJJak48o9XioaoIpsOvshER1DSGt9a+BAUtuf1sUYim4U62vGBvUppT8EKllKD
         hjquDst3yF/i2CRxsABHhuJZQc8Q7GPqdOXx4evG9W63gV86858VQhDj57XNG8g09u5U
         QDcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767881317; x=1768486117;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qb0opi0EkMyYcYBrprImauJ5+csaYa0bSdovEgtQBZs=;
        b=kWL6tZJVKpJI3EsPgsT6wtDZm6DVIhXTXf/PR9hzyjN7P+80ZmR37WOKw/c0JKSEzr
         KfxJ4NxaQt5/TT8E2IfA3kygYE6BXHSwPyEzC8w08aq3bZgDoofruPTyln0YZ9MTml/j
         9HPK452ChkxOyf9vNRfoPuA5dL5KS46rS6hn4AP2hrbaWDTUQniq7/J4WGCUxDWdsYZH
         WGdlTu/q2FioKwAmzkJEEFgrOlg29Jfb524v347ik+B8G8wcPlYkD60QatetR7XkBVVN
         kWc9JALCFACSqupPIdMGWYgaMKLPvic0Q/PZofUIyybPAbBqaGdZ2dK4ESz3UDL5qsf3
         za/w==
X-Forwarded-Encrypted: i=1; AJvYcCUEkFz0NZd/N3ShkTQeR+HJnZdBkun+5dgCIefIx8PFFcylwloKf9+bnQvoAwxZWFYC6ydj+bgdWd4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWD0ElmgvMWj1ao1Kkdk6G2weisTMCKsmGb6T87ExnVDnJSY1D
	7XYBOwbEauNJakUNVqOvpRIalndziq35hXk78uB2iJz74hGU5XYUTHsD2mps4QSyLAru3A3t1MO
	TMS0mPV+YYJbk/iskChtV+5o7XFHRyd9SASpRHDuGLKArXD70ct4DaYxhwspuyQ==
X-Gm-Gg: AY/fxX46b+/oLn0eGSL8Sx74/UmTViIzWXRrOZw18tkK/pAl+T0GuCbUyw9fON3ivFF
	wj40hhCp573+j75kHP9jG4eHkz/0YbfcPM+BD/qKKhK/31Q82dsIesAyjyUEyQnAqX4jklt4NQd
	uT0E8Fsqm42RDqldVi/E7mW+Q4c6+/q0xWJXg/mpAPh6Shlm4JFXVIkz455JqkJek6tn9PKXCYy
	tLVaDEfbpzsj5XmSNRwe0yhe77ASvQ122u6FgeIDfShY+XKC/oXTcI8ZwizppY0E/HRH64Frp9z
	lz1z8Uaq6FVWr222X9MCScgZwGWRsfTwkFc4wCRD8qH7gBR5UJBb10kbVS0uLw4Ct3E18GxvSr6
	BPJ1R9xt621lrOhjW
X-Received: by 2002:a17:907:7b89:b0:b6d:6c1a:31ae with SMTP id a640c23a62f3a-b8444fd453amr620665566b.49.1767881317043;
        Thu, 08 Jan 2026 06:08:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF7HOHiWGYK4xorotJbNX0jMidX1ixXQJJ1VdDBrRK+mMgTkrWVhdGn0FKO7KNa9bc9HZtucg==
X-Received: by 2002:a17:907:7b89:b0:b6d:6c1a:31ae with SMTP id a640c23a62f3a-b8444fd453amr620660466b.49.1767881316491;
        Thu, 08 Jan 2026 06:08:36 -0800 (PST)
Received: from sgarzare-redhat ([193.207.223.215])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a2cb447sm843387866b.29.2026.01.08.06.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 06:08:35 -0800 (PST)
Date: Thu, 8 Jan 2026 15:08:31 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: linux-kernel@vger.kernel.org, Cong Wang <xiyou.wangcong@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Olivia Mackall <olivia@selenic.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Jason Wang <jasowang@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Gerd Hoffmann <kraxel@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Robin Murphy <robin.murphy@arm.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Petr Tesarik <ptesarik@suse.com>, Leon Romanovsky <leon@kernel.org>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Bartosz Golaszewski <brgl@kernel.org>, linux-doc@vger.kernel.org, 
	linux-crypto@vger.kernel.org, virtualization@lists.linux.dev, linux-scsi@vger.kernel.org, 
	iommu@lists.linux.dev, kvm@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v2 08/15] vsock/virtio: use
 virtqueue_add_inbuf_cache_clean for events
Message-ID: <aV-6UTKChBhiTynA@sgarzare-redhat>
References: <cover.1767601130.git.mst@redhat.com>
 <4b5bf63a7ebb782d87f643466b3669df567c9fe1.1767601130.git.mst@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <4b5bf63a7ebb782d87f643466b3669df567c9fe1.1767601130.git.mst@redhat.com>

On Mon, Jan 05, 2026 at 03:23:21AM -0500, Michael S. Tsirkin wrote:
>The event_list array contains 8 small (4-byte) events that share
>cachelines with each other. When CONFIG_DMA_API_DEBUG is enabled,
>this can trigger warnings about overlapping DMA mappings within
>the same cacheline.
>
>The previous patch isolated event_list in its own cache lines
>so the warnings are spurious.
>
>Use virtqueue_add_inbuf_cache_clean() to indicate that the CPU does not
>write into these fields, suppressing the warnings.
>
>Reported-by: Cong Wang <xiyou.wangcong@gmail.com>
>Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>---
> net/vmw_vsock/virtio_transport.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Stefano Garzarella <sgarzare@redhat.com>

>
>diff --git a/net/vmw_vsock/virtio_transport.c b/net/vmw_vsock/virtio_transport.c
>index bb94baadfd8b..ef983c36cb66 100644
>--- a/net/vmw_vsock/virtio_transport.c
>+++ b/net/vmw_vsock/virtio_transport.c
>@@ -392,7 +392,7 @@ static int virtio_vsock_event_fill_one(struct virtio_vsock *vsock,
>
> 	sg_init_one(&sg, event, sizeof(*event));
>
>-	return virtqueue_add_inbuf(vq, &sg, 1, event, GFP_KERNEL);
>+	return virtqueue_add_inbuf_cache_clean(vq, &sg, 1, event, GFP_KERNEL);
> }
>
> /* event_lock must be held */
>-- 
>MST
>

