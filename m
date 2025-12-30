Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4C2212FB3
	for <linux-doc@vger.kernel.org>; Tue, 30 Dec 2025 10:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767089752; cv=none; b=ONJg4ShGmG6loilroefQvn3KgBpSDg4tuLrobPZ1+YYIE7h9mMb9Ob3U0LQKzvP+fkF6NRinDKNufIsJLXGo/BR+t5vZC4ibzgYfmLb3Dq9bFAuz+A8OPsY33ErpUlNZ+1sX2hpQrDdGmIxyFR+AvbhqXtIlMTAN5kYzgkYgp1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767089752; c=relaxed/simple;
	bh=LCt+6pV3SVXX+jVlhPofZ+B+PV2iA9I/7Ha5xrB3hCU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=St36WZMtz/9pEpuo79Y2iDmEGsM7VnOB6T//K9X5fbLNq4xnCPdqXEbefTbMHin/jg2ssrNKcvdWHVvJZpC1wt+ITr19ip1t0PYFmBbUDaMqw1KzUbMvmICGZHalFeKvUWzyJ4Aqft78Sbd+fi+P/xo4Ws5Kg5J83PY1OCjg4V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=P0yYMVW3; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=mMNfRRLF; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="P0yYMVW3";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="mMNfRRLF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767089749;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=QPeHJm+twCiufdOXqLeCn+SgUmZXimx3Kj8OMbSgWcg=;
	b=P0yYMVW35jxYgBF3YWX+d5Ks1WvgEpHVbY7hSsHdHk78Zw0WyrCeBBSmS2yyK5oTbRjjF3
	I2ThzC+UAqPDYagw+qh9Y0x6x56cCzUJauXeqWrqndmgRCxf/08HSGzrcABR2iQB8QGVxM
	4lSXGaXGdADw9gUk4PbTfeYlI1of3DM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-599-XiTLeuoaOHy7ybRR44_6PQ-1; Tue, 30 Dec 2025 05:15:47 -0500
X-MC-Unique: XiTLeuoaOHy7ybRR44_6PQ-1
X-Mimecast-MFC-AGG-ID: XiTLeuoaOHy7ybRR44_6PQ_1767089747
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-42fb1c2c403so6233553f8f.3
        for <linux-doc@vger.kernel.org>; Tue, 30 Dec 2025 02:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767089746; x=1767694546; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QPeHJm+twCiufdOXqLeCn+SgUmZXimx3Kj8OMbSgWcg=;
        b=mMNfRRLFQ1b7RYO8zYL3/JZ9axIJjDVgyXqGeWBRCxq6iIp3bCHuVYco/WFjHSmwJ+
         vUAI8YxWrd8ixNe4H/3BBb+Oxfue+Wwi402meo6Qbk07JWJXnC0jn0H2BZX0LVmCdf0r
         7xPXTXPrUvjRDHSxBfUoitW6hg2E0W0zqQALn2mFduy9Rj9MDmTXRHVbqZoWCTCHY+9z
         ot9Ei8kOeihODU4KDJ6T2GO6yGFp/NRFhsXxcuq6Qiy4h8Rh6PHERIeNWZK/b9+Z4Zj1
         sYeyB4Pwbfb1wNgPnQSqKuRNyihtrkhnMd2J2LELXY3L/9AutKgn0UJccbKBNf7R0xRE
         +Ovg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767089746; x=1767694546;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QPeHJm+twCiufdOXqLeCn+SgUmZXimx3Kj8OMbSgWcg=;
        b=qX+q8LEKQj3WX1tx0R3U8q912k7tQs4yJi2RiD43WKCRaAwfu5EdqwXfyZC9bBSjSx
         LorRv9bw8k/F/q5VyEOzrvRa/UwI9eML4yAl9CGht+YygmR2boUFo/0HQfOxJzArHE3P
         KTntbcEUeGqXptzbrgsPK0nI98dV4j5+MRjq2mC74Bl5bSAHG/5n1gR2QU13lkizS15F
         oVtGt4IuCtUgfNCZp8TQDlrxFwPBQADWg49JAr2Qu3Y12l4yid3sRnIaOGLkITk0CAJv
         PL8yZHHoCP2zic8EOoMz/C8KUdnNjX6nAiduoY4q+1rDXQW6IFfHOCp18UHPtd9u3yfM
         ssHg==
X-Forwarded-Encrypted: i=1; AJvYcCVm/lFfl5QcX07gOqGhR9qXCPeEle3XeVI6KywKc3+xGWbMSAfKWRV6UavHsuEQmm+UsGFzwT4qjqc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwzxP9lMO9BB1OrgBnH3sH8EKOEUOsFX+q/0v1GxqwZOSt49yk
	VzS3q7w+11TfyIDsRbsP9UWk9JK8ywwi11Kp/iQdFkqbVoafv1BdO9FOFHazjeiqEX47T6cqaro
	s1MXNXE0AtfQLvYiErtSUV+DCpQdtY+f2iu5hvWkRHr39UW5J89QHqHGfXfZXiw==
X-Gm-Gg: AY/fxX48gJKHWK4JNn+idyHnFuzt8RottbmfCDmAzjTtH+fToL2IciVgTG2Q7t1iAug
	UdxlygdWHaqZzp7ARQWwvjmUvqGbN3tNH+P6KidB1/AjyRtFd7TJfxyeQDDEhCCAqJO611F9tJk
	Ca//BDkWPwamL9OKyJOtuJHTFf7bagqxmtvhE5wBF0dawPrvJ7GPSyE2Q9NlMeIVB+IUGt/4X8S
	LfkCUO0AMesNVw0AAYQQ/9SzMbEDnJl6sNtocOpvrHknD83td4XxP+guReFN6GtA0Oxc2MKSY7/
	aSl972zaXIHDkxvFA647zLQ13k2tBfBDOtlRlL1q9wENhrvPVLutTuH+1BgVpWlyfN+yDBDYi5a
	eovJEpCYD8fek1bAAnzzNxnSLD7DZeUvb5Q==
X-Received: by 2002:a05:6000:2503:b0:431:a33:d872 with SMTP id ffacd0b85a97d-4324e4c1219mr30005588f8f.8.1767089746585;
        Tue, 30 Dec 2025 02:15:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEbvOFHJ91a0TKLxq+k7tMABBS8U1GQCYZPCELRU5Zsc1Gaj+GYCwYcD6RmChYOtX8+5x3fqQ==
X-Received: by 2002:a05:6000:2503:b0:431:a33:d872 with SMTP id ffacd0b85a97d-4324e4c1219mr30005566f8f.8.1767089746108;
        Tue, 30 Dec 2025 02:15:46 -0800 (PST)
Received: from redhat.com (IGLD-80-230-31-118.inter.net.il. [80.230.31.118])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324e9ba877sm67681523f8f.0.2025.12.30.02.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 02:15:45 -0800 (PST)
Date: Tue, 30 Dec 2025 05:15:42 -0500
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
	linux-doc@vger.kernel.org, linux-crypto@vger.kernel.org,
	virtualization@lists.linux.dev, linux-scsi@vger.kernel.org,
	iommu@lists.linux.dev, kvm@vger.kernel.org, netdev@vger.kernel.org
Subject: [PATCH RFC 00/13] fix DMA aligment issues around virtio
Message-ID: <cover.1767089672.git.mst@redhat.com>
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

Early RFC, compile tested only. Sending for early feedback/flames.
Cursor/claude used liberally mostly for refactoring, and english.

DMA maintainers, could you please confirm the DMA core changes
are ok with you?

Thanks!


Michael S. Tsirkin (13):
  dma-mapping: add __dma_from_device_align_begin/end
  docs: dma-api: document __dma_align_begin/end
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
  vsock/virtio: reorder fields to reduce struct padding

 Documentation/core-api/dma-api-howto.rst  | 42 +++++++++++++
 Documentation/core-api/dma-attributes.rst |  9 +++
 drivers/char/hw_random/virtio-rng.c       |  2 +
 drivers/scsi/virtio_scsi.c                | 18 ++++--
 drivers/virtio/virtio_input.c             |  5 +-
 drivers/virtio/virtio_ring.c              | 72 +++++++++++++++++------
 include/linux/dma-mapping.h               | 17 ++++++
 include/linux/virtio.h                    |  5 ++
 kernel/dma/debug.c                        | 26 ++++++--
 net/vmw_vsock/virtio_transport.c          |  8 ++-
 10 files changed, 172 insertions(+), 32 deletions(-)

-- 
MST

