Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B81313267
	for <linux-doc@vger.kernel.org>; Mon,  5 Jan 2026 08:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767601380; cv=none; b=B+XFRMAUWSYKncr9XlujyPczdKEwDam5ah1MnJKZ/51PyBa+qGS2J1LvIrLGV5lC0OI8KPjsMeQVmsD1f8fCLkzEalgzA6mae/TrUGn1o7Fu1kyL3myBXqpGblO4Q+lEZnn3yiJelu7Dz44u56lI4nXzq/Y3aVcs+HdVpdvf+pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767601380; c=relaxed/simple;
	bh=1rF+5o+RxfvaZWaK/37ivP7Ic43xgdCjtd7a083Lyfc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Nas3WRBmyvApbTyNTfcvqwNcjj/s/jNgDQg2Er2IfS4IADgT09IhIBpECK7L2/GUX6mycGZljF77iNwpZ+UMorNnAKE5cA81PQJJEH9ianWB0BoglWHkb8A9dW2BgoVwfqdwh0yCroEdG9Qhis3o3ei87X9SWouXR8GlHwpNdEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OVpQPRID; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=aFnAwaAK; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OVpQPRID";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="aFnAwaAK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767601377;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=++MSvPbbaixtOH+VkhbpdT2tKuVIlO7zEYO24bBcB2o=;
	b=OVpQPRIDj5fXqBg9A/hP4xVzLw8MYfD0RyVh4Bk3mpjidMcWQVlxb6UWCkDP88f6dbWF3F
	SvhRQ9LrJEXf8a4sePL5O5s/gicfHgSC7GHHwSCZoSo54sbVX2pEdbD1EQjHEf1CDNwLaQ
	fzhYe/ROFifr2sDRbPyDY0j+oMXFN/U=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-689-DxmHGkZnP72qZ-fs5mHDZQ-1; Mon, 05 Jan 2026 03:22:55 -0500
X-MC-Unique: DxmHGkZnP72qZ-fs5mHDZQ-1
X-Mimecast-MFC-AGG-ID: DxmHGkZnP72qZ-fs5mHDZQ_1767601375
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4776079ada3so122516995e9.1
        for <linux-doc@vger.kernel.org>; Mon, 05 Jan 2026 00:22:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767601374; x=1768206174; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=++MSvPbbaixtOH+VkhbpdT2tKuVIlO7zEYO24bBcB2o=;
        b=aFnAwaAKLu7zAhMf+1ZJkNmIT145xhfGYevQ+uwx4Dua/sOWHk6GFH5sAFW7CCCMFZ
         0cya9z65tmnNTyvX8ggutiwfatl5uHID38vuE/UmtJgcJ4jlVipRomZHHhHg4cIFInDR
         6fxzl+4UMlWcfjaV+B80TtPV4bNU/SlsWfmvdpHWeonjuIye9gFLQHa5ezv0cGiFYn1M
         uPIv55VhcCeX+mAns+hZrOKdH37ATwCzhEooCCd6oH/t8AoUlfs90mZBEvbeNgJbXLLq
         GSSl7PCZXbESwGZq0n141aAGd5Eg/NVjFtyyDdOp5ijpOTk8+jF8eE6VPD6Wf6vrFLzF
         aNPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767601374; x=1768206174;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=++MSvPbbaixtOH+VkhbpdT2tKuVIlO7zEYO24bBcB2o=;
        b=r65SZxapltgPtAN24mOcgQ448DBPp2LaPCN8+7zjmDIaWlCYE1DmdhluMfZv2Pau7K
         WuiaQoFRv50Mvk8yOx5+rSS6fa6QaoFTqwaarNKZFqM0Q0x6sIZ4LlORB2xM9RjOfWHD
         BUFIO3jC3Mk0wHPTI6flpplG21eGXFlcmiFk/hIqxCDl6bIoAHLXDc3RSZV1T8uTp1A0
         e7THgFesyTeEX+A/QuCJkM6gDiwKYMXSkNSFyWEn2P0nNDol7Op0J8ziJV8TrfQJxKJg
         7Q4vE+nMxa0Z2JTkbsTJjUkGE+dhrxbs9Luvcx1G4nVZCQry0G7zkXmG6OVji9Lasd76
         jk9A==
X-Forwarded-Encrypted: i=1; AJvYcCUBHBHWBQ1hJyY9BqEYTIB2DUfAruYNpWeKI+vS3/55ImqaMZoBpOTzXv69CcyDqIQd4nhpNdY26Bk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMzpkSrr5BpNK+JslKVTJjFFCgfE0ZZm9ZWsBz08uJvQ3J3v0l
	HII/5+x8bBHkk2ZQqoBIip1XLmSeovuM5ltDkYN4qmHnjci8r+kne1HhX8b+UQtMTxA2xTUfd8p
	oB19emRGuQRvtyoOv07Q1wUGCvDahk7yQN5KgvPUjHf1gvIPX5JNRx0rpeRrvjQ==
X-Gm-Gg: AY/fxX6i+i8yW6lnpXobj6wVd6kmFk3wk6xFNPMo+tzJEby+IcpZBcUXomw5bdm+1qN
	TcxQiE9uVQ6IGpweOW97o2a0ShVa6vnwykUI7RIrofYyd8exapdBtr9fPTEWd0C3KP3iLQfocBi
	6x3hgoVavk4vKIfmYdsS7KwfkaM5CrF+07Agp5RURJalSLLzXZpFxGK9QzkvLurU/+PrCiTBmEx
	gbo6yuMc8K+CY3GWX61TnU0lmGazXoMTwpACRqrTdcx0NwQDd+BfeCajIig59uFz1NrXLR0C/b3
	WHqUVxnHFhcssYSYVfXT1RCoWvbEuW37sVShCCCX6GQJNH5t9x3o4PlzupxHCLZgjH9WP+JVRDZ
	MPrLWdalU+qXo0MCiu8dh9xRJl6fGytaNjw==
X-Received: by 2002:a05:600c:4ed2:b0:475:e067:f23d with SMTP id 5b1f17b1804b1-47d1959eaaemr640737505e9.25.1767601374455;
        Mon, 05 Jan 2026 00:22:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEXw2Pw2EoWGIJB0fy/EdgimCoNIlh1q5tf6OTMnGxG74FiSYxf17YyIIU15mHj+ck3a5eDtg==
X-Received: by 2002:a05:600c:4ed2:b0:475:e067:f23d with SMTP id 5b1f17b1804b1-47d1959eaaemr640737005e9.25.1767601373905;
        Mon, 05 Jan 2026 00:22:53 -0800 (PST)
Received: from redhat.com (IGLD-80-230-31-118.inter.net.il. [80.230.31.118])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6ba30531sm56554215e9.1.2026.01.05.00.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 00:22:53 -0800 (PST)
Date: Mon, 5 Jan 2026 03:22:50 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Cong Wang <xiyou.wangcong@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
	Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Jason Wang <jasowang@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
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
Subject: [PATCH v2 00/15] fix DMA aligment issues around virtio
Message-ID: <cover.1767601130.git.mst@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent


Cong Wang reported dma debug warnings with virtio-vsock
and proposed a patch, see:

https://lore.kernel.org/all/20251228015451.1253271-1-xiyou.wangcong@gmail.com/

however, the issue is more widespread.
This is an attempt to fix it systematically.
Note: i2c and gio might also be affected, I am still looking
into it. Help from maintainers welcome.

Lightly tested.  Cursor/claude used liberally, mostly for
refactoring/API updates/English.

DMA maintainers, could you please confirm the DMA core changes
are ok with you?

Thanks!


Michael S. Tsirkin (15):
  dma-mapping: add __dma_from_device_group_begin()/end()
  docs: dma-api: document __dma_from_device_group_begin()/end()
  dma-mapping: add DMA_ATTR_CPU_CACHE_CLEAN
  docs: dma-api: document DMA_ATTR_CPU_CACHE_CLEAN
  dma-debug: track cache clean flag in entries
  virtio: add virtqueue_add_inbuf_cache_clean API
  vsock/virtio: fix DMA alignment for event_list
  vsock/virtio: use virtqueue_add_inbuf_cache_clean for events
  virtio_input: fix DMA alignment for evts
  virtio_scsi: fix DMA cacheline issues for events
  virtio-rng: fix DMA alignment for data buffer
  virtio_input: use virtqueue_add_inbuf_cache_clean for events
  vsock/virtio: reorder fields to reduce padding
  gpio: virtio: fix DMA alignment
  gpio: virtio: reorder fields to reduce struct padding

 Documentation/core-api/dma-api-howto.rst  | 52 ++++++++++++++
 Documentation/core-api/dma-attributes.rst |  9 +++
 drivers/char/hw_random/virtio-rng.c       |  3 +
 drivers/gpio/gpio-virtio.c                | 15 ++--
 drivers/scsi/virtio_scsi.c                | 17 +++--
 drivers/virtio/virtio_input.c             |  5 +-
 drivers/virtio/virtio_ring.c              | 83 ++++++++++++++++-------
 include/linux/dma-mapping.h               | 20 ++++++
 include/linux/virtio.h                    |  5 ++
 kernel/dma/debug.c                        | 28 ++++++--
 net/vmw_vsock/virtio_transport.c          |  8 ++-
 11 files changed, 205 insertions(+), 40 deletions(-)

-- 
MST

