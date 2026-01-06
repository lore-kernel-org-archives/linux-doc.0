Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0B0334685
	for <linux-doc@vger.kernel.org>; Tue,  6 Jan 2026 14:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767711118; cv=none; b=HPYjJJZISZAhcfk32vSPlMgHthKSTGifv9ZLMBfWny/Rz3l6MhD3oPliEpS4BWUIUxEztV40mtZZKikGQIVPF+iNZWDadsDsq+zJcIVHpvag7UNvOHsNGYISCE9xZZzKC5vZ/tkU3K1afqxgcO6Rsh0qFlCBriDBzvCU3zzaV3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767711118; c=relaxed/simple;
	bh=OtGN4S8+ZWGuAfn6+2YZp7eQlkz7c6TNLgozVUvUCR0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nTjHeGJYQVUtWKX3FWjojlR+1dV1bOZBZLUcSdYCd04BapyYPZW+Rd8x7xSGn5c6o/UYETiZFCq1IPEl2KWP2nj6cm9/a8vWc/3NFgd9Q46s0nkThfMjAvphyUsoFpdlnhORV5WrylaSqzbENPrGlbHwTrb9sYWNEgoW3fDMAm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Y84Qqx31; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=FM0Ydb5f; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Y84Qqx31";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="FM0Ydb5f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767711115;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v8xGpc9e0AHSzqXJdY4dTy2UmvNhNHIufeUOIUm/LzQ=;
	b=Y84Qqx31I5wMPYwVs5CMOtq8M+c9qrucIU9n78Lo2w7B1rM14bdeV9HFLtzww6UMT+cZAQ
	Xa+pSSgZVYvA9JqOmVb0NO3ye1HGgHrgVnPVBbjaKLw4jsswsfgAoh++WDRZYDf/XJrx5E
	0KBNtav4ZrPKrqi8dPU21J4JDgFZdZY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-663-aYJ0MEGSOuemHE-UXmmmeg-1; Tue, 06 Jan 2026 09:51:54 -0500
X-MC-Unique: aYJ0MEGSOuemHE-UXmmmeg-1
X-Mimecast-MFC-AGG-ID: aYJ0MEGSOuemHE-UXmmmeg_1767711113
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-4310062d97bso687259f8f.0
        for <linux-doc@vger.kernel.org>; Tue, 06 Jan 2026 06:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767711112; x=1768315912; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v8xGpc9e0AHSzqXJdY4dTy2UmvNhNHIufeUOIUm/LzQ=;
        b=FM0Ydb5fdan6x+pkR1pJDikE+5rPe3WwNvtNRo0JY14Evid+8FAayK9PXBBE19NE0V
         6zmoqhY0DFOh8fYaTQ2w8a69KO0ECm6f9yz6/NSy6/VZS/jtDSpgR87LSsEQVtgtQI6C
         Bm4swC4PpZaaXSSi+1Oswc7hFfYQjX22ZoqFwC51cURGKJrO06ZoOhjZ5eZZRNVMGH/R
         j7RZUi/wX1uXswo38RIPdWsCg4iwKcSnQ4YDfJ6vEwh4pq+EaWgBUP7DDSaV301bGKCp
         3WN9O3bTncPfs2vWtO7odr14bTSpvCTRf7UV8cA+BVh7m6Bzvi2UTfoEFMptn9FMl/Kb
         oPKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767711112; x=1768315912;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v8xGpc9e0AHSzqXJdY4dTy2UmvNhNHIufeUOIUm/LzQ=;
        b=szXtzoSZNpSp+xP2jr9fzwsCMjcTJ4QpqU8pdNni33HqMnAewq2Ghj93tvG1QEU/cw
         aC5kCpRbJWI/AAG/+dgYbwgCETceOJletwdxMblSZDBGRBS10HvjROHotTJEq4c4+2SF
         u2m37G8N6wolBXQsufK9TKXD/0r68Pc9cK6s87Wi2HuoTD+2yZkxv+t9aK3XxZz4d6+S
         /0oP4QlOIp28KEqglH+MMmKDD8Vo6p0uIW9tSoN2WnBrs59/CLA3mdrRzO1kN/AswlGq
         jfYKHx3Wt0uyebv427O8MixVfBzWYsScuKiFjhYvEbT5PSQhtWNjLowQOqnwdwd2BYkE
         7seg==
X-Forwarded-Encrypted: i=1; AJvYcCWD7YszTCV0xfyCQcyFqhvXe6IwNWTikrXiutjPC9KPOQCaZNrmereACGogBclg/4InCUzy6UXcaaM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2OV7GxCDCHzPXJJrWz2vtLUh4KeHV9cmOUeoQzLLOkdITi8m1
	ko90p6EpzLoYoCyF6xqFPXQ6cNmJXfl72V4dbIudJb9SnaJSQ27Aj8yV54QMFg8HwS5Tq+QLLna
	cMBNXd5I/bbPlQSFhuLFobPkyS+FNsC+HlszAjFT9zNkeheoaoNZ8clVd3CQ3ZUcNivKIhQ==
X-Gm-Gg: AY/fxX79B4mzmq2pAlG3uUh8CrUWpoYkVgoFITH6jxa8V7NYo5qT50KBluRWVHAwQic
	IhSSXqwwIKAIlYfczwd9Rx09m5DWLYqfZNZOxIlz3V//aOf4SHktkzngqBK01b785IkAT+15pED
	MDa/u8kEy07oQcQwiiLNbFuESJhWevBZqJOZ/LNGFhZqRstb/td+azZIwwDB3eZ/pbpNzGsAJ+K
	KlfFfYGvKf+gRe2GkE29nsXrCC9Arm62DlM8f9nDqC7oJzBvFpBHD9MUDe63N8zLfowNiEpS6N/
	wPnxX0YhVeq656xHy7iaG95vSil7sbskC5/0F2nVYmpfBbru8tfYQfSlv3EHhfVVjKx0JH/u2vP
	YxVioiosTJIVmN+f6cTX9eQKD+mUzveuMbQ==
X-Received: by 2002:a05:6000:200f:b0:431:b6e:8be3 with SMTP id ffacd0b85a97d-432bc9f6dccmr4753179f8f.38.1767711112104;
        Tue, 06 Jan 2026 06:51:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGOynDA9QP29UwN/sUhG6OCzOdNXrD0Y6rHdaimQHcJZW2G3EKin+vfxrhBk6BDORYTgSmwkg==
X-Received: by 2002:a05:6000:200f:b0:431:b6e:8be3 with SMTP id ffacd0b85a97d-432bc9f6dccmr4753140f8f.38.1767711111656;
        Tue, 06 Jan 2026 06:51:51 -0800 (PST)
Received: from redhat.com (IGLD-80-230-31-118.inter.net.il. [80.230.31.118])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ede7esm4752453f8f.32.2026.01.06.06.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 06:51:51 -0800 (PST)
Date: Tue, 6 Jan 2026 09:51:46 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: linux-kernel@vger.kernel.org, Cong Wang <xiyou.wangcong@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Jason Wang <jasowang@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
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
	Bartosz Golaszewski <brgl@kernel.org>, linux-doc@vger.kernel.org,
	linux-crypto@vger.kernel.org, virtualization@lists.linux.dev,
	linux-scsi@vger.kernel.org, iommu@lists.linux.dev,
	kvm@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v2 10/15] virtio_scsi: fix DMA cacheline issues for events
Message-ID: <20260106095044-mutt-send-email-mst@kernel.org>
References: <cover.1767601130.git.mst@redhat.com>
 <8801aeef7576a155299f19b6887682dd3a272aba.1767601130.git.mst@redhat.com>
 <20260105181939.GA59391@fedora>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105181939.GA59391@fedora>

On Mon, Jan 05, 2026 at 01:19:39PM -0500, Stefan Hajnoczi wrote:
> On Mon, Jan 05, 2026 at 03:23:29AM -0500, Michael S. Tsirkin wrote:
> > @@ -61,7 +62,7 @@ struct virtio_scsi_cmd {
> >  
> >  struct virtio_scsi_event_node {
> >  	struct virtio_scsi *vscsi;
> > -	struct virtio_scsi_event event;
> > +	struct virtio_scsi_event *event;
> >  	struct work_struct work;
> >  };
> >  
> > @@ -89,6 +90,11 @@ struct virtio_scsi {
> >  
> >  	struct virtio_scsi_vq ctrl_vq;
> >  	struct virtio_scsi_vq event_vq;
> > +
> > +	__dma_from_device_group_begin();
> > +	struct virtio_scsi_event events[VIRTIO_SCSI_EVENT_LEN];
> > +	__dma_from_device_group_end();
> 
> If the device emits two events in rapid succession, could the CPU see
> stale data for the second event because it already holds the cache line
> for reading the first event?
> 
> In other words, it's not obvious to me that the DMA warnings are indeed
> spurious and should be silenced here.
> 
> It seems safer and simpler to align and pad the struct virtio_scsi_event
> field in struct virtio_scsi_event_node rather than packing these structs
> into a single array here they might share cache lines.
> 
> Stefan



To add to what I wrote, that's a lot of overhead: 8 * 128 - about 1K on
some platforms, and these happen to be low end ones.

-- 
MST

