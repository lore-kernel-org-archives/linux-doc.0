Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758DD37C0F5
	for <linux-doc@vger.kernel.org>; Thu, 29 Jan 2026 08:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769676141; cv=none; b=IAQegEELqev4/DsEZKdTYocx0/awzDuSV3t0RvzUfV3FSJbsEHk3f7epr4aUvzYb2O4A0E1sB3OgkBqFsnT+5B+zXddWmHV/3lmVtIjJgEU4bObUJJTtv+BHEqVnoTMDBRby5c2Tf4foOfrqZ4MIuhQGRl1sVSzk4zyuX6srzdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769676141; c=relaxed/simple;
	bh=Bs6mTjUeA5qkWiBJBxqsJFMQQCY3VsRZlZa2vBfNivk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nbb9RVi8sG7wr14+HzWk4AGbAx5lxFXwuHf+xPvMEnpxTEWRGSC2gcQCC7nvPbawgiXGf+HYQJTksGkJLIIlk8JORtM5dfI3i3OnglpnDvmDWE8Fg6fZZHf4n419NyUSmeYPPCkWyf2mLekPO/fOnmt0hMxbsjRUFsfulWQOlVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=W7ziMh3Y; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=mq5aWqvy; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="W7ziMh3Y";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="mq5aWqvy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769676139;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=THtu/B0OMAesHMQ0Tb4jSeVco+ToRrfio4hfGUipZDw=;
	b=W7ziMh3YhtF7NvPbDAOqa5/wkdItvmZ9SlNkT4uvi0OtHUEnZrT8Bqs7tJM9e+XMUXU9cM
	XiKC3haiMk4B3A48OKLkHlyY1lnGbaVv+Pxxrld1kzduir1Cdo+9mLtaPSRTkLs20wwbl2
	RAtOXi1L8yl1cVfVnj+cNVu+VF7DTNA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-593-ODKJU431OniCX4HGHQYe9Q-1; Thu, 29 Jan 2026 03:42:15 -0500
X-MC-Unique: ODKJU431OniCX4HGHQYe9Q-1
X-Mimecast-MFC-AGG-ID: ODKJU431OniCX4HGHQYe9Q_1769676134
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-430fcb6b2ebso399631f8f.2
        for <linux-doc@vger.kernel.org>; Thu, 29 Jan 2026 00:42:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1769676134; x=1770280934; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=THtu/B0OMAesHMQ0Tb4jSeVco+ToRrfio4hfGUipZDw=;
        b=mq5aWqvyQmv8XKxcpsL05xFNhP61yPx8mUM6PcbPlav9+2J+a2Asd7Xk5Xzvo/A/D8
         YADLhS4VMYeN+3paz47G30CRdVTA6Ogaltn2PsoOPaJ+d55xEIJ/OqgOUBd6pxZBmcl1
         yQ3/6bJ7YzwirFNvFH4c7GsCYJoB0QtVW3p8TUQLSoBk3NbBGlcxi7WINp0jDJG76yXv
         ilLWC8irwCt8KlWWqe8LuhFPQYPHtZUZDIYYcIjDNB1r6KNgfP7VRlZUWuiyx8Cis1Vj
         +L6SWkm3ku2hbUf67agmgdb+aUldVPeyCA5ksesY7AGlPwv2nqiduFy+F0BylQenQr1P
         +doA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769676134; x=1770280934;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=THtu/B0OMAesHMQ0Tb4jSeVco+ToRrfio4hfGUipZDw=;
        b=lLokgvtS2P1oCCnhOMoWpHC6IQmQUeXgsCy/5c1RRNz0/Y99TtFjK2Qfxmtvkod/oV
         Fk1XFupKKo/nMUknrtUP00pFz9v0/LxYHLO1AsYLPHbKypG656OxlXfWIFF7Q2gJTKS0
         AvjaQWacOIom9tkZJ785WkFL3rLdQOsgztuo8KDeJqF+YRCkVS+e5QU8DaM+0rUIlz+7
         Jed10PPnpNEEatU2r5zfjDFMaU9DS/BQ3GRCxOY7MxeRPJXAo53fQ8VRztdsW06RATK7
         v33X8ZKvtRxiq3vg1G2qHtBOwSSno6X5TUslg0eAjjq9p468pfu2izdRFxM7lNh/tH0e
         ooYw==
X-Forwarded-Encrypted: i=1; AJvYcCUIBYrSU+YUVGymCcWGd43OxVAMQcFzcW1h6v1R5HLhNEuYouoRFSoOD2PMkVeg75uK1IZMRTBp3EA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxJkr/G56t9X/Y5GBuI2KZiXhGsK0WaOzovehJcl9gQb140muo
	N8vKuVK+EO1JqmtvKSeAKmOlajdD6g2p13zjFZyxTtRA608B0tDh7npTf9a+o3Uoo1W6NR4r5kx
	9UlnzASNOok9Ep+2+2ZId6LBalSxg+/f6chYrAYyg6d6oHd5O4UHMjmU0WckSXA==
X-Gm-Gg: AZuq6aL37nC57GTGMs8E8CIbRdE4NTa+BpJZMn7NrsS77+oKNe7eAip6P8yer1zaXq+
	IS9uO2NXymJhoiZEv8czD4icyrl8EjrVhYdz5dHSotXBAml7AhnN0zmWiupoq+hMOkUjGz8IT4z
	rs+0x/slbh0fYDMZlRRzIMbKI97qEWbT+AagvJQvxb3t3T0pv9sqF/nssjrqMGXeHt8CjoINcfl
	yIdjHcvOvo84I4LfVIp7nh6Mi28bqqBlhguhtwUkZWBPev3yH7Jnz4yWEI/IEFFf2jIshbroR3E
	SBnkyFS+xuoMCN46iMZukuwT4z9BxG5Vbc2+sS9eWFkfNYLUht3YlOCpiWuYvMsf+mhZNPCa7Mv
	/6k82qDHb8dm3ZwHBhQBHFpq6DTGpXqhlyJPXKq9aZEAKzOHYo5Bd
X-Received: by 2002:a05:6000:178b:b0:435:9116:c713 with SMTP id ffacd0b85a97d-435dd02db27mr12237786f8f.5.1769676133907;
        Thu, 29 Jan 2026 00:42:13 -0800 (PST)
X-Received: by 2002:a05:6000:178b:b0:435:9116:c713 with SMTP id ffacd0b85a97d-435dd02db27mr12237753f8f.5.1769676133482;
        Thu, 29 Jan 2026 00:42:13 -0800 (PST)
Received: from sgarzare-redhat (ip110-139-192-82.pool-bba.aruba.it. [82.192.139.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10ee040sm12807318f8f.11.2026.01.29.00.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 00:42:12 -0800 (PST)
Date: Thu, 29 Jan 2026 09:42:06 +0100
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
Subject: Re: [PATCH v3 15/15] vsock/virtio: reorder fields to reduce padding
Message-ID: <aXsclvInQFIuFe5i@sgarzare-redhat>
References: <f1221bbc120df6adaba9006710a517f1e84a10b2.1767601130.git.mst@redhat.com>
 <ce44f61af415521e00ab7492aa16d3d19f00bd5e.1769632071.git.mst@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <ce44f61af415521e00ab7492aa16d3d19f00bd5e.1769632071.git.mst@redhat.com>

On Wed, Jan 28, 2026 at 03:31:21PM -0500, Michael S. Tsirkin wrote:
>Reorder struct virtio_vsock fields to place the DMA buffer (event_list)
>last. This eliminates the padding from aligning the struct size on
>ARCH_DMA_MINALIGN.
>
>Suggested-by: Stefano Garzarella <sgarzare@redhat.com>
>Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>---
>
>changes from v2:
>	move event_lock and event_run too, to keep
>	event things logically together, as suggested by
>	Stefano Garzarella.

Thanks for that!

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

>
>Note: this is the only change in v3 and it's cosmetic, so I am
>not reposting the whole patchset.
>
>
> net/vmw_vsock/virtio_transport.c | 18 +++++++++---------
> 1 file changed, 9 insertions(+), 9 deletions(-)
>
>diff --git a/net/vmw_vsock/virtio_transport.c b/net/vmw_vsock/virtio_transport.c
>index 999a0839726a..b333a7591b26 100644
>--- a/net/vmw_vsock/virtio_transport.c
>+++ b/net/vmw_vsock/virtio_transport.c
>@@ -55,15 +55,6 @@ struct virtio_vsock {
> 	int rx_buf_nr;
> 	int rx_buf_max_nr;
>
>-	/* The following fields are protected by event_lock.
>-	 * vqs[VSOCK_VQ_EVENT] must be accessed with event_lock held.
>-	 */
>-	struct mutex event_lock;
>-	bool event_run;
>-	__dma_from_device_group_begin();
>-	struct virtio_vsock_event event_list[8];
>-	__dma_from_device_group_end();
>-
> 	u32 guest_cid;
> 	bool seqpacket_allow;
>
>@@ -77,6 +68,15 @@ struct virtio_vsock {
> 	 */
> 	struct scatterlist *out_sgs[MAX_SKB_FRAGS + 1];
> 	struct scatterlist out_bufs[MAX_SKB_FRAGS + 1];
>+
>+	/* The following fields are protected by event_lock.
>+	 * vqs[VSOCK_VQ_EVENT] must be accessed with event_lock held.
>+	 */
>+	struct mutex event_lock;
>+	bool event_run;
>+	__dma_from_device_group_begin();
>+	struct virtio_vsock_event event_list[8];
>+	__dma_from_device_group_end();
> };
>
> static u32 virtio_transport_get_local_cid(void)
>-- 
>MST
>

