Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC79024E4C4
	for <linux-doc@vger.kernel.org>; Thu,  8 Jan 2026 14:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767883536; cv=none; b=m2vbWje3cry75eVS+noXiOvssrZcQwgh+JVJznB7VTMm0vPNOXy3yWglb+jrAqpC6GAykfjxRRzFpLDw6ohTnsAU12yIoCzuPNrOqw1YyKneGhwdNzvANHaKg4oAJfM1QHfofbD8hWvwYi8Sbs/1J8QAgRk0h6BrQeInEjkHLRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767883536; c=relaxed/simple;
	bh=ScTKP+c2rR672BgupG9wm67XF9gVvJQXcIgn+/1V/bU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bQKqby6BHi/V9alueVyLh9q0xnOHhxG2IrODI1gy/AuZ1e2B0R/hqGBjHeOwb1bjmLMhAZVIw+Wd/olThEBNRvyUsgzjYJMaQb+nLMim1dqm0dS5/lYZvrInFQGXr7cgVWGvXLQFIdD2iyB2GIw/bDapE2Lr5p+YanGhkg6wXWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=biC90KAV; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=gQQ6ujfu; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="biC90KAV";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="gQQ6ujfu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767883532;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WfT1Va6tq1fm9ghByqfjKPhOxaDhZdEa8+dMcUknkTw=;
	b=biC90KAV076DZk/5bSAuvtYuAJyOcgOIVbe7WCp8M8NM2HB4CtpNjBj2BBPNnrYtXKNH5i
	BWs2QAA7aLysHC4pH+AyNrNw/shq4Or2sGktiOD8r5O20uZCPs97fgINf4XTsrNnKfWVtJ
	Zu9o4tOeJmkBhQFPUjJ9XmHedtmthQo=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-504-6pogWLKmNeuElmOgEHk06g-1; Thu, 08 Jan 2026 09:45:31 -0500
X-MC-Unique: 6pogWLKmNeuElmOgEHk06g-1
X-Mimecast-MFC-AGG-ID: 6pogWLKmNeuElmOgEHk06g_1767883531
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-b7d282ac8aaso477517166b.2
        for <linux-doc@vger.kernel.org>; Thu, 08 Jan 2026 06:45:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767883530; x=1768488330; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WfT1Va6tq1fm9ghByqfjKPhOxaDhZdEa8+dMcUknkTw=;
        b=gQQ6ujfuJzml/KBLnIXj54BCYc2nxgPB9t6/LuLljS1IStToOxMznbLUwwhwhude1h
         LajIcqp998QUdwdsmhb/KJumfrf3fXJjcJmMb3DBzxNEJb4GMI0/oU0SAdU6OPukTRCG
         57y21KggPCE37un7p2LPQlbGx/Ls1HMBrivsc3J48sCUGcl1c2BwYRp2xFw47Swya7/H
         kf3UQnb8AM2jqE/Ab4ApPIRojNXxeWq844Hde4dt+QyqwwW+QNHNGgMCLTHakCDo/qcc
         YbBQ9lVJq3s7930WfljUVMOt+BSdMWh4G0xXChs6jn2Nj65FMbNI2Ca5jv83uCN6TN7t
         LuWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767883530; x=1768488330;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WfT1Va6tq1fm9ghByqfjKPhOxaDhZdEa8+dMcUknkTw=;
        b=Pi16dJ4g9xhAWk82pIrNcI0NbFJXOI1TJ7L8fRChLinkWtu1dFXnyZu3bYATPVoJPG
         WD9lcArOlrBoBP5ELUg9lgmlItLRU/Jes8iFJDnjnK8XqELBAzn0GsGhusaH+fEAvWWk
         Z8JoVBcWYcqy2+R4lw/zuSdqKsUUlMR/a1tyRWT9G1eeQmt7vuRJwFh4kOtb1ccG1vC6
         SV2xnD7CwBGSjPLcNyxcgfHp6MjLFAuYTnYxq4ueb8HEEEJjuNFiSZYPIX5SqR9+q7jf
         TTlFFB3cW2yyeKBc0uO6HDOtiQAR/tOmBUpn3nWJD6t6PRcYSn9gXBzquPw2TJMROBDv
         U2Fw==
X-Forwarded-Encrypted: i=1; AJvYcCVQUkMbkj5DdNsecrz2+586U/fAX8zzduHw/5ouvCKTN5obSIQDgtoKzGRJU2iV7VIg31fWCgMmMRg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXz/LU/UxakWQHiIxULFmCrUY0EkJ86f0OtESxYnk3wSuJI4lX
	eBhrmFZPJBPOKVI2AcsyrscTSQh+Ru6K+O4GLWjGP4y4yqqBBF92X31hpSDas+b8sgnffftdeYm
	MDJbGQPSu61HMJasediAPvcq8VM92gOodKJS5B6JxAU2zhffogNsI/2jG5sZfog==
X-Gm-Gg: AY/fxX5YUsqa93GiYf+i+ZGdyo8pAEeZLyHI9J+xK3Bdldnh88PHyuHBzDK/5XkKBoE
	QY5nZuTuUre6/F3cYbTXdJJBmmtWDgH9M4e8wGC3JnSt6GjtvPIqFVIcgpzLLFvYYzgbEOrTcVI
	77ULd1Ux9cCAsLmJTchzbTrk1/G87z/Pso60RqTtQQoxayh9jzUuxg88X38YEQoZDL3odaDnrjo
	TOmRjtCf3elGp0dYNKkxbVK+PDwGn4pqGzOz7AEOC8wP0r6wsZUTMKx01qbTDqmWFeREHTli9xG
	8NDH3d85wGJR0+ts+GIzCC6K4iAiDriHf0rl0dFrp8DPihA7hX1HANt8rgISoVwT0CEMZxHf94c
	ofZrcwChqnYJOT5A+
X-Received: by 2002:a17:906:c103:b0:b79:e974:4060 with SMTP id a640c23a62f3a-b8444fd41a2mr660535266b.48.1767883530431;
        Thu, 08 Jan 2026 06:45:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEy4t9xkgOZMs7kPUcCm9yBAey59kExadAcY+9phGlSdjSpATKGUSBjtzXbWCkzKn2HKwCwkQ==
X-Received: by 2002:a17:906:c103:b0:b79:e974:4060 with SMTP id a640c23a62f3a-b8444fd41a2mr660529166b.48.1767883529753;
        Thu, 08 Jan 2026 06:45:29 -0800 (PST)
Received: from sgarzare-redhat ([193.207.223.215])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a564255sm848076466b.63.2026.01.08.06.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 06:45:28 -0800 (PST)
Date: Thu, 8 Jan 2026 15:45:20 +0100
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
Subject: Re: [PATCH v2 13/15] vsock/virtio: reorder fields to reduce padding
Message-ID: <aV_Cr_f47qqc2JoP@sgarzare-redhat>
References: <cover.1767601130.git.mst@redhat.com>
 <fdc1da263186274b37cdf7660c0d1e8793f8fe40.1767601130.git.mst@redhat.com>
 <aV-6gniRnZlNvkwc@sgarzare-redhat>
 <20260108091514-mutt-send-email-mst@kernel.org>
 <aV-9F42fMfKGP4Rg@sgarzare-redhat>
 <20260108092931-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260108092931-mutt-send-email-mst@kernel.org>

On Thu, Jan 08, 2026 at 09:32:23AM -0500, Michael S. Tsirkin wrote:
>On Thu, Jan 08, 2026 at 03:27:04PM +0100, Stefano Garzarella wrote:
>> On Thu, Jan 08, 2026 at 09:17:49AM -0500, Michael S. Tsirkin wrote:
>> > On Thu, Jan 08, 2026 at 03:11:36PM +0100, Stefano Garzarella wrote:
>> > > On Mon, Jan 05, 2026 at 03:23:41AM -0500, Michael S. Tsirkin wrote:
>> > > > Reorder struct virtio_vsock fields to place the DMA buffer (event_list)
>> > > > last. This eliminates the padding from aligning the struct size on
>> > > > ARCH_DMA_MINALIGN.
>> > > >
>> > > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>> > > > ---
>> > > > net/vmw_vsock/virtio_transport.c | 8 +++++---
>> > > > 1 file changed, 5 insertions(+), 3 deletions(-)
>> > > >
>> > > > diff --git a/net/vmw_vsock/virtio_transport.c b/net/vmw_vsock/virtio_transport.c
>> > > > index ef983c36cb66..964d25e11858 100644
>> > > > --- a/net/vmw_vsock/virtio_transport.c
>> > > > +++ b/net/vmw_vsock/virtio_transport.c
>> > > > @@ -60,9 +60,7 @@ struct virtio_vsock {
>> > > > 	 */
>> > > > 	struct mutex event_lock;
>> > > > 	bool event_run;
>> > > > -	__dma_from_device_group_begin();
>> > > > -	struct virtio_vsock_event event_list[8];
>> > > > -	__dma_from_device_group_end();
>> > > > +
>> > > > 	u32 guest_cid;
>> > > > 	bool seqpacket_allow;
>> > > >
>> > > > @@ -76,6 +74,10 @@ struct virtio_vsock {
>> > > > 	 */
>> > > > 	struct scatterlist *out_sgs[MAX_SKB_FRAGS + 1];
>> > > > 	struct scatterlist out_bufs[MAX_SKB_FRAGS + 1];
>> > > > +
>> > >
>> > > IIUC we would like to have these fields always on the bottom of this struct,
>> > > so would be better to add a comment here to make sure we will not add other
>> > > fields in the future after this?
>> >
>> > not necessarily - you can add fields after, too - it's just that
>> > __dma_from_device_group_begin already adds a bunch of padding, so adding
>> > fields in this padding is cheaper.
>> >
>>
>> Okay, I see.
>>
>> >
>> > do we really need to add comments to teach people about the art of
>> > struct packing?
>>
>> I can do it later if you prefer, I don't want to block this work, but yes,
>> I'd prefer to have a comment because otherwise I'll have to ask every time
>> to avoid, especially for new contributors xD
>
>On the one hand you are right on the other I don't want it
>duplicated each time __dma_from_device_group_begin is invoked.

yeah, I see.

>Pls come up with something you like, and we'll discuss.

sure, I'll check a bit similar cases to have some inspiration.

>
>> >
>> > > Maybe we should also add a comment about the `ev`nt_lock`
>> > > requirement we
>> > > have in the section above.
>> > >
>> > > Thanks,
>> > > Stefano
>> >
>> > hmm which requirement do you mean?
>>
>> That `event_list` must be accessed with `event_lock`.
>>
>> So maybe we can move also `event_lock` and `event_run`, so we can just move
>> that comment. I mean something like this:
>>
>>
>> @@ -74,6 +67,15 @@ struct virtio_vsock {
>>          */
>>         struct scatterlist *out_sgs[MAX_SKB_FRAGS + 1];
>>         struct scatterlist out_bufs[MAX_SKB_FRAGS + 1];
>> +
>> +       /* The following fields are protected by event_lock.
>> +        * vqs[VSOCK_VQ_EVENT] must be accessed with event_lock held.
>> +        */
>> +       struct mutex event_lock;
>> +       bool event_run;
>> +       __dma_from_device_group_begin();
>> +       struct virtio_vsock_event event_list[8];
>> +       __dma_from_device_group_end();
>>  };
>>
>>  static u32 virtio_transport_get_local_cid(void)
>
>Yea this makes sense.

Thanks for that!
Stefano

