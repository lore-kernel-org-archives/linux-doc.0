Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B690A2D3237
	for <linux-doc@vger.kernel.org>; Fri,  2 Jan 2026 13:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767358969; cv=none; b=NFJ9ty+4C4sVap/nhauqSaMfB0ttWBY8KiYwY1Qkvo+nXyTuOJw7q3ln/kJolMx4oYGWxAawfLSWzbs/xZRsDeZsw0/jwDI2ZEMvZQjkllENK/YZTFIngaqihClI5g6IL2QbXPObTy7NkTVTec0iUDQRS1/iFYNDGWhLAbAOsdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767358969; c=relaxed/simple;
	bh=MzslOykd8x14UYRASjqMHG8WwlyrJUbVhQ0wOUaMEeA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pOW43TwjnHDZj4BJyn5aGV4qZTvF7WsHs9sQK2WPoCsywnbKjr8BW6PsntFJ1lfQ9vazSwXVeoTCvNK5WFDukpA5VHEN5f7jfTuFmWJLSouS7rceP1hSXl0AiVAjY06KpkZSB/pnFZS2t0q6/Ph/DimPMtFQJSUwLwlB9qIUz0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Y06vawIW; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ruf3khPa; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Y06vawIW";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ruf3khPa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767358964;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WmDmlKfsEAT3FFZsP/TiPm94jNR+IqB/SohCa4X10es=;
	b=Y06vawIWBnbKDzI2gaRETBnHIbrgy6y5/pCIkANcKyzqiSl+5oyDSeQt/2VIuzE22+AP+e
	WWCfB85rSIy2LBTgIDGJTofUcl8H1Iqa4E9cAFfX3LQjKqMvBljvsZV57l9hvnpzbLgtQP
	SR1/eBMt5382jEX2inMjIOa5NxEbMCQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-634-TppoKQr7NKyGrahKvQkxZw-1; Fri, 02 Jan 2026 08:02:43 -0500
X-MC-Unique: TppoKQr7NKyGrahKvQkxZw-1
X-Mimecast-MFC-AGG-ID: TppoKQr7NKyGrahKvQkxZw_1767358962
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-47788165c97so66992955e9.0
        for <linux-doc@vger.kernel.org>; Fri, 02 Jan 2026 05:02:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767358962; x=1767963762; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WmDmlKfsEAT3FFZsP/TiPm94jNR+IqB/SohCa4X10es=;
        b=Ruf3khPaNH8M9NxijcWmnqF1uGroWh2HoBxkyeczM+hJb4+uD/NOyRdvR+09ZwKHGJ
         burTy8fRY0gU/FLGFYWteU53mqULab/AUNyMBvoFqWMBrfCjdzymDZqlVLYp1lHifqfb
         HIcacXAF2RW6LIv9nwPSChhLRmIrO/gWssbsZlfD33VuDHNaZqwEq6i6fFRR0K9mej/b
         OFXwWJq/Hbo10sp18oOp2rvNyt2Dnqzk6jO7c6vjCRCIM5StfFKx3BecQIvBSjVY85eV
         IzC3xUDPskmvLiYurzGloEs4xsX8mInpc3Sdx8e52cskh8+aFahgk2EDs5E7Kibg354S
         Zfug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767358962; x=1767963762;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WmDmlKfsEAT3FFZsP/TiPm94jNR+IqB/SohCa4X10es=;
        b=PyR6A24ubQKmt9ifCe5YJdZhlY2nMHokAaPjjbMNg18kT9PAQE/+vwNoqHQo6JiKj8
         VrBLalnpUB5hh3Xk5bTLzLmm7g5YWeeq7PcEdhYjJOenU2ZERnn1FLA1lNW6D87o6ED2
         GxbIl+5mCrxUDLrJ0XQAx2RNnNpmxwEpCa1RhY0a3xSSWYdy6Ql1Uw/8usFB8sP8+2Lf
         3B49pnijxUGk5JKf2jMbXNAvlFXk3F4XBizs+xXCN2F2HXGZCypOPIOdg0Q6iFn25QL7
         olrjKU4WpyPa7yNzk+BEkLvhnjjQEkdCC/ReEaNp6qI3vzLGCGRfW+g6urfE81eqcDfW
         0V9g==
X-Forwarded-Encrypted: i=1; AJvYcCXv9ATqjTif25j2YmEdofDCW41fkWrNl3EmLMxfbWCzWzteTVIqNZi0y4sKg6RfbDP7WP+smcl+K5A=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmjpIF52jx6GvkTRsKFiCdMHwfttInPi4bCJqVa9kDeQFKSLfe
	hu1qPGwxmZ0+9j6n6cZE2FqEWpfM9d1NdgGBZDPnMtim+/88k0ct+Mipwk/EAhB6BFzlmnCRreE
	biqIS5MsaUEnGSTRh/Fm5SfN2Pdv+1sUNjwHgRVmkNCehn4fsjZaP7Ehp9m1jpw==
X-Gm-Gg: AY/fxX5r/CCyg92p09Fxd0g+kdpUbbE5jhoUUgpblPAqWzcCK9uZ8AtV/FUtIHaqvfp
	5t4oIMyRFawKQKjznIpYLY4Zjmwhm6MhzOlxonqgf/P8Zz8B98gvzNfijq1KOWQFLAWyw1lmw8Y
	nYOwgoInVZWd3tgKGe4xjyOip9YWlUQ0K3+1bK3NUOhyyj3yQO0tHevEE+JV6/LpOXEnUNKSed8
	qEnJ1PP2AlhuETaQGC95UR/fqsmwn7aXj9AzYKnaBMlwfkCTTKkrHYENG1E1KQ7Lhs+L53v53za
	koTxSfgA/D8YxoEmaaQUofAS7Tc/8j60QRqrdNBVmSotK+A3UE7+MTrt1ePJr5zAviZL3D0QnnF
	UfiaqWDz6bJAj/XEDkdpMYz+QctZoq9w2KA==
X-Received: by 2002:a05:600c:3508:b0:477:1bb6:17de with SMTP id 5b1f17b1804b1-47d19590bbemr512375075e9.30.1767358962174;
        Fri, 02 Jan 2026 05:02:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFBPpH0ihQmD8Y4wAGqUXdjbUDmUwQhrGC4bvR7Khhg9b0D8Nv1fILL/X18iGX7aRdaW+Lc0w==
X-Received: by 2002:a05:600c:3508:b0:477:1bb6:17de with SMTP id 5b1f17b1804b1-47d19590bbemr512374585e9.30.1767358961687;
        Fri, 02 Jan 2026 05:02:41 -0800 (PST)
Received: from redhat.com (IGLD-80-230-31-118.inter.net.il. [80.230.31.118])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193d4e91sm720685835e9.13.2026.01.02.05.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 05:02:40 -0800 (PST)
Date: Fri, 2 Jan 2026 08:02:36 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-kernel@vger.kernel.org, Cong Wang <xiyou.wangcong@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Jason Wang <jasowang@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Petr Tesarik <ptesarik@suse.com>,
	Leon Romanovsky <leon@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
	linux-doc@vger.kernel.org, linux-crypto@vger.kernel.org,
	virtualization@lists.linux.dev, linux-scsi@vger.kernel.org,
	iommu@lists.linux.dev, kvm@vger.kernel.org, netdev@vger.kernel.org,
	"Enrico Weigelt, metux IT consult" <info@metux.net>,
	Viresh Kumar <vireshk@kernel.org>,
	Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH RFC 15/13] gpio: virtio: reorder fields to reduce struct
 padding
Message-ID: <20260102080135-mutt-send-email-mst@kernel.org>
References: <cover.1767089672.git.mst@redhat.com>
 <55e9351282f530e2302e11497c6339c4a2e74471.1767112757.git.mst@redhat.com>
 <CAMRc=MfWX5CZ6GL0ph1g-KupBS3gaztk=VxTnfC1QwUvQmuZrg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MfWX5CZ6GL0ph1g-KupBS3gaztk=VxTnfC1QwUvQmuZrg@mail.gmail.com>

On Fri, Jan 02, 2026 at 12:47:04PM +0000, Bartosz Golaszewski wrote:
> On Tue, 30 Dec 2025 17:40:33 +0100, "Michael S. Tsirkin" <mst@redhat.com> said:
> > Reorder struct virtio_gpio_line fields to place the DMA buffers (req/res)
> > last. This eliminates the need for __dma_from_device_aligned_end padding
> > after the DMA buffer, since struct tail padding naturally protects it,
> > making the struct a bit smaller.
> >
> > Size reduction estimation when ARCH_DMA_MINALIGN=128:
> > - request is 8 bytes
> > - response is 2 bytes
> > - removing _end saves up to 128-6=122 bytes padding to align rxlen field
> >
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > ---
> >  drivers/gpio/gpio-virtio.c | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpio/gpio-virtio.c b/drivers/gpio/gpio-virtio.c
> > index 32b578b46df8..8b30a94e4625 100644
> > --- a/drivers/gpio/gpio-virtio.c
> > +++ b/drivers/gpio/gpio-virtio.c
> > @@ -26,12 +26,11 @@ struct virtio_gpio_line {
> >  	struct mutex lock; /* Protects line operation */
> >  	struct completion completion;
> >
> > +	unsigned int rxlen;
> > +
> >  	__dma_from_device_aligned_begin
> >  	struct virtio_gpio_request req;
> >  	struct virtio_gpio_response res;
> > -
> > -	__dma_from_device_aligned_end
> > -	unsigned int rxlen;
> >  };
> >
> >  struct vgpio_irq_line {
> > --
> > MST
> >
> >
> 
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Thanks! There's a new API as suggested by Petr so these patches got changed,
but the same idea. Do you want me to carry your ack or you prefer to
re-review?

-- 
MST

