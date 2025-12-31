Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C88D30E84A
	for <linux-doc@vger.kernel.org>; Wed, 31 Dec 2025 20:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767214118; cv=none; b=JTxoRNsvMaxB8SRQp/GMUIXBH/VFtscfsQVqk7g6bp9Xg+qEj+95ISLEGW7g+Q3kwozvY1OnGFN3uBVfWIoy73wZSmgr3hh1jJW5RqcTzRknEhVq3PIhdlMu6wLXvKaiiTP9n1gbj7Vqt89gCdvcACSAquH6hrwX8PHMqvM1Szo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767214118; c=relaxed/simple;
	bh=BpH6W25VRu697Yn7DFwf7krulZ0ceVuuDV1JpnQSClg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SMQK9ROXTd75IT5xOYfukAU8d/zqYjdk/9hHbkOmFLN24ZKM3z8AQ5uHEFVOLJW1Ek9SAq9LyL+xo/t+Ef01ZzgqbRkg6VJ7z0mNzZex3na5yqaViVzd83DIZiQQXzdUHQYUdRNvFtCp95vap+R2Jb7OpeOLWzDe/a6ZLAmWyqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RhdCmos3; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=pvP0z3pG; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RhdCmos3";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="pvP0z3pG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767214115;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=t2sN+P6W4rMfz5k+VlkZX24a7rMpvbJroFZ4fnRS1gs=;
	b=RhdCmos3H+0DCCh5q5Xk4htwtWcJvQKikAfN0wIKQxxo1lqWjpOM0jG5UajfGJKLPt6opS
	knRspuTgiRQKzjg9vhNo/thcZ6JbVds6dlAwsZ4HyrnJZX695UPd0/XPb3KvraX/WKU2jI
	DaDq9x4czs3y0ANHQOeivAF1CpVlIXY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-606-KWQFYwvHOfSgxZUFdpALxw-1; Wed, 31 Dec 2025 15:48:33 -0500
X-MC-Unique: KWQFYwvHOfSgxZUFdpALxw-1
X-Mimecast-MFC-AGG-ID: KWQFYwvHOfSgxZUFdpALxw_1767214112
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4775d110fabso94908755e9.1
        for <linux-doc@vger.kernel.org>; Wed, 31 Dec 2025 12:48:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767214112; x=1767818912; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=t2sN+P6W4rMfz5k+VlkZX24a7rMpvbJroFZ4fnRS1gs=;
        b=pvP0z3pG4NqUkDHEluND0t26A7txfqzDiv+38R+RThoSWb5dEsO1hy7Cc4yqorCchh
         gik/JRZenBBZc51cql+BtTqJJ63YhG+FLqOw9wpzLarl/BMIS0RnUe/QPBsvoap2cNeP
         FPw9Um2+unbT1MD29TdHNIN5x6W6gv1CorNe9QPA67D0EGBlz4F2Pg+xnhbBbVQOPknf
         JfYCugGl1w2hambIeB0Hr1bPNMdkSO822uk37H8IbRyOPNuPt4eIr1xt94kQ5rA6TcXZ
         m2ERDOWtf+wCEVR++av9x3FewQECEcUv6ApsMPpFpR6DmoQcUZXLYWIoCdEXXmjyyXhP
         SN3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767214112; x=1767818912;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t2sN+P6W4rMfz5k+VlkZX24a7rMpvbJroFZ4fnRS1gs=;
        b=MkZqOnE+ANoUysmb6IfuYiIiSqSZv3b3C3pva4jT+9PIHrh2JiK9g/wd42x6IdJtAa
         SsQoXJzzlPP4jEInVYlqnQcL6YxMOgjPxNEYHzusf2n5riYXlz4i+irSXsfAuY/FvAoK
         tVDwGNFJNrsenCLCrcRLq9v2LuDjTLDqCBlUIQvrXArr4SfaaT2W2rBUs9OXgn3nk4SI
         2pcSgtoxDJvltoBWMQyb77Vy+8hAI+bdoPGv11l51IYpOlctRtGnvgbvafPQlmgiPfoc
         L+CNlFI/M2Wbpm+H629WnBvHwb5/rK2Pu2q+ftxeDtazB6i0oSIUwIVK1dDRJQmDCknr
         Vdqw==
X-Forwarded-Encrypted: i=1; AJvYcCXj3zVpYpHmSgDqg7z/WOmFGoxV8DZo3SfZ/naCoAmsrXD70tTdno9jHf6wXIJA8CDbfBnidh63xt0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYN18nGWKQCQf/FC8sVHTyMhVXbysv/YWw9kcHHkGJ0kdQbk5r
	wthmOreR5GaF37mUwpSMkiSveFw+A8xS5+dVKvLcPJN3jM7SZIDLYs1chtj3EnYbuU5wl9ud2oe
	zBSSIna7lQYS56o3EyV0kOmLJw7A+YuaP5e+b9lTLMPJrRbPI+AcaWdbZv4bxew==
X-Gm-Gg: AY/fxX7Y2nwhai8X4lIl+N1hvlbPANsb2AKtWbnswwaSG+ctNlkbsu/uO+5mmADtV7C
	8IGqfYD6o7QOa+FzetVoNaCdX6IlMt1s9ge31gJnw+ZjCZDGEqxUm9dL39hqI1P55BVj3TqLsIG
	ybG1GY8nQG9wLorBJCxJLHBtJbaVdnz7NncKugmVl09qRKq4ex6X70y2di5uQEDCdxy9i3LUbaI
	LdfTbXjQhSA2JkoKBIyX2R/2jv2E5zBOt2R8xanJdQw41T+S9El48baifHNRdQYKzJoEfYa7Av8
	XWrlvvRtZ/KokwkIMqVAuUyRsD9FwLWh2GAYUNK0DQd+M/cLfL/cCzne0cM9Q/l1uEZHeI7F4VJ
	Q5nAfYBFiCz6yQ1eUKDEGozBxmvAtofoXhg==
X-Received: by 2002:a05:600c:444b:b0:477:9814:6882 with SMTP id 5b1f17b1804b1-47d1953b77fmr390890895e9.5.1767214111818;
        Wed, 31 Dec 2025 12:48:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGUX2S3Ts6MrXbJAEZ1+1hODDbGMnh81w30kfQclg714E6BWRq3zDXGinSJodthec3i9GHMDw==
X-Received: by 2002:a05:600c:444b:b0:477:9814:6882 with SMTP id 5b1f17b1804b1-47d1953b77fmr390890515e9.5.1767214111286;
        Wed, 31 Dec 2025 12:48:31 -0800 (PST)
Received: from redhat.com (IGLD-80-230-31-118.inter.net.il. [80.230.31.118])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d19362345sm662070775e9.6.2025.12.31.12.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 12:48:30 -0800 (PST)
Date: Wed, 31 Dec 2025 15:48:26 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Petr Tesarik <ptesarik@suse.com>
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
	Simon Horman <horms@kernel.org>, Leon Romanovsky <leon@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>, linux-doc@vger.kernel.org,
	linux-crypto@vger.kernel.org, virtualization@lists.linux.dev,
	linux-scsi@vger.kernel.org, iommu@lists.linux.dev,
	kvm@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH RFC 01/13] dma-mapping: add
 __dma_from_device_align_begin/end
Message-ID: <20251231154722-mutt-send-email-mst@kernel.org>
References: <cover.1767089672.git.mst@redhat.com>
 <ca12c790f6dee2ca0e24f16c0ebf3591867ddc4a.1767089672.git.mst@redhat.com>
 <20251231150159.1779b585@mordecai>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251231150159.1779b585@mordecai>

On Wed, Dec 31, 2025 at 03:01:59PM +0100, Petr Tesarik wrote:
> On Tue, 30 Dec 2025 05:15:46 -0500
> "Michael S. Tsirkin" <mst@redhat.com> wrote:
> 
> > When a structure contains a buffer that DMA writes to alongside fields
> > that the CPU writes to, cache line sharing between the DMA buffer and
> > CPU-written fields can cause data corruption on non-cache-coherent
> > platforms.
> > 
> > Add __dma_from_device_aligned_begin/__dma_from_device_aligned_end
> > annotations to ensure proper alignment to prevent this:
> > 
> > struct my_device {
> > 	spinlock_t lock1;
> > 	__dma_from_device_aligned_begin char dma_buffer1[16];
> > 	char dma_buffer2[16];
> > 	__dma_from_device_aligned_end spinlock_t lock2;
> > };
> > 
> > When the DMA buffer is the last field in the structure, just
> > __dma_from_device_aligned_begin is enough - the compiler's struct
> > padding protects the tail:
> > 
> > struct my_device {
> > 	spinlock_t lock;
> > 	struct mutex mlock;
> > 	__dma_from_device_aligned_begin char dma_buffer1[16];
> > 	char dma_buffer2[16];
> > };
> 
> This works, but it's a bit hard to read. Can we reuse the
> __cacheline_group_{begin, end}() macros from <linux/cache.h>?
> Something like this:
> 
> #define __dma_from_device_group_begin(GROUP)			\
> 	__cacheline_group_begin(GROUP)				\
> 	____dma_from_device_aligned
> #define __dma_from_device_group_end(GROUP)			\
> 	__cacheline_group_end(GROUP)				\
> 	____dma_from_device_aligned
> 
> And used like this (the "rxbuf" group id was chosen arbitrarily):
> 
> struct my_device {
> 	spinlock_t lock1;
> 	__dma_from_device_group_begin(rxbuf);
> 	char dma_buffer1[16];
> 	char dma_buffer2[16];
> 	__dma_from_device_group_end(rxbuf);
> 	spinlock_t lock2;
> };
> 
> Petr T

Made this change, and pushed out to my tree.

I'll post the new version in a couple of days, if no other issues
surface.




> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > ---
> >  include/linux/dma-mapping.h | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> > 
> > diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
> > index aa36a0d1d9df..47b7de3786a1 100644
> > --- a/include/linux/dma-mapping.h
> > +++ b/include/linux/dma-mapping.h
> > @@ -703,6 +703,16 @@ static inline int dma_get_cache_alignment(void)
> >  }
> >  #endif
> >  
> > +#ifdef ARCH_HAS_DMA_MINALIGN
> > +#define ____dma_from_device_aligned __aligned(ARCH_DMA_MINALIGN)
> > +#else
> > +#define ____dma_from_device_aligned
> > +#endif
> > +/* Apply to the 1st field of the DMA buffer */
> > +#define __dma_from_device_aligned_begin ____dma_from_device_aligned
> > +/* Apply to the 1st field beyond the DMA buffer */
> > +#define __dma_from_device_aligned_end ____dma_from_device_aligned
> > +
> >  static inline void *dmam_alloc_coherent(struct device *dev, size_t size,
> >  		dma_addr_t *dma_handle, gfp_t gfp)
> >  {

