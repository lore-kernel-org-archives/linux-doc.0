Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56DBF32C920
	for <linux-doc@vger.kernel.org>; Mon,  5 Jan 2026 08:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767601444; cv=none; b=bL6TP67M098wjbA19snbZZo/s1JWBZJQejLQbZAKfk5nOPDgYSAR6qOyYXI2NVq8n6NzDbKAbnf+2m7SRDjegEAvamSkdmbgOpLkhe7DIVtO3uF/JDVEMx5MqN+zJJv+CQjYEVUWb34x4+KwZl09jw6fTLm+ubCPVNUHYkD/gl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767601444; c=relaxed/simple;
	bh=jIFi+Zvcrqx5KM1Tn7Vx/X/Ro5vONbP7sNW0Mf3F+ms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rTRkDz9+SosMrjn0z+/UbhHSFhRJl9qNU5vv5V0eoNCimlGnF6GwxCP/BKPmBleH9LUNcehjsNwGY9C7n3CYQNsIBDs6NpxkjvSSDK/Zor0oLYsmDyF5/MNIEyefXJZZrn78szHgKQBc6ZW1IgA3dieaCy3MpBxGNXkFcLHkUrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=fail smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=U0EJGw52; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=jhuW0fAF; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="U0EJGw52";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="jhuW0fAF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767601436;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7Ko5SEulg/0toBKRpZAMNGsguRweEFK2Nvy+yQ/ftdE=;
	b=U0EJGw525N36TsoWhwIOnHH1npKLZARnTZguj2NX/3prDCcmeRPQbwt+hNfC0WXAQ3xUXf
	72jxF5QIZDsJqNjXDrw/4uv/LyZg03zEUPojJb9o56hhsYdQgPliO9LIbaDzxu0dd7svGC
	fhwmZSYop0+2nnDzQJGqmS6QbD+QSn0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-354-nUucixhdMTCQsO9EqH0cqw-1; Mon, 05 Jan 2026 03:23:55 -0500
X-MC-Unique: nUucixhdMTCQsO9EqH0cqw-1
X-Mimecast-MFC-AGG-ID: nUucixhdMTCQsO9EqH0cqw_1767601434
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-47775585257so96185345e9.1
        for <linux-doc@vger.kernel.org>; Mon, 05 Jan 2026 00:23:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767601434; x=1768206234; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7Ko5SEulg/0toBKRpZAMNGsguRweEFK2Nvy+yQ/ftdE=;
        b=jhuW0fAFKWout8NvzOE75lr0thW/Bvte4Ikr3Ds2O8GTD5vrsS8ZXy/VT74UzpbAlc
         SkwWcLIGG2nOn2hJ3IOcZWexU19Ly66MFoocUxD3oz4K3yQnN35L6SydRy6k/+YyXyBd
         yPebtVj0mQhCIVAxVWRptftBXMGxBrm45coShq6icSkrazqS6YFoU488FT0ix7EZbdU0
         Tgt3MkO+ClKdAAuJSso08c1qe6N9IhusEsMZYkwbRWP4dwNmx37rNJr4j76KliGNlmwr
         zxVVw3FkCTqRZ/sC1v8j5gVlPYVLiP9gScBNQgEJyJqfnGaU0TgCBqXdJGQXno4Ef1MY
         fWAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767601434; x=1768206234;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Ko5SEulg/0toBKRpZAMNGsguRweEFK2Nvy+yQ/ftdE=;
        b=fcxLVEhGZSl2or1KenixBWTVNwpZ1xZSihTVBZ+i2tKoyh3aIFBnN3m1xGqfBx8cu/
         AuHJGQ1kE5MBwmn9YiJzfDS1T6JZB+kFlx02U+tio8mUPEi/9CLuDwXE7UWGQJW4KrEb
         s1tZZ3QUzJ1xHmR2/qk9oQiBYp/0KI+DNgUUrkXfCX0mBhMqynTpr8tjXmOP2wl9zT13
         d+uhG3vvaNGVbASdorW7oS+0Z9+1wCl21ANOYtMnU0NH8guWwE6Wr6W4DqQaU4jTBW6l
         FrgHvwYKSX06LQTqlgwRXy6eY0UrAK/pxN4HFWdnzYnTuTl12tQ5DoRdKjG/jihCXrL4
         g8AA==
X-Forwarded-Encrypted: i=1; AJvYcCWl1FEh2vgjfZKdzTlfN2duBPJxPNJ4fb4QkTaaM5v1HzSCNJobugPe5dNi0BVdTjg/AlInfdHT7Qc=@vger.kernel.org
X-Gm-Message-State: AOJu0YykKmMZf1XcKx7/FkF6gpp64o3tUV0p7mt7PLeRnGHqtekiY/Gs
	/hNDurc63ULXiIFnVhLjR2MHD73wiE6R5kGuMMQz17llXiiqjDAhMwSr4ptvcYinoLBws4G4q7q
	r1QrL0Wg1G+98ZvbznoY8wSts+HUKpBmNULpK2FGt7Ou0UF/pomoq6ENESz13c5RT/K8dCQ==
X-Gm-Gg: AY/fxX7qf3P3GOlwx7DVo42rIAG/IzAtoxuzBeXtfjnK1Iicr5EtPNY0MGygfqvZxaZ
	B8zX+Qy83DYmedIxvkJQ7Cc3cR0PSWB5vnCoZokQT86NaIUCs1hBQcOfO+gV5VyML1F00KIFh/F
	mDpiTva6fsh2joCy4k+qSKWmLNlPv6IGUjsbt4bqya8bGUoj87Dipa3+cQkiknRgsEfCfpZtdcq
	3ZZANPuTyNxvHcBz4PPVUwPmBG4dqTTXvlBqHm2VkdiK0iG+BpYltKi968GxfvTI942xZP5WWLs
	Zz1g84NAjYqm8bhxuItUjpE+SOCQU0zlXO5qJ4+yS6nOV43C7GSO5Nn1vzdGXpb9cBYTGdSc7Em
	e65IJfPp4SjGDBXyA1MST0hcyyiyLe/VxSQ==
X-Received: by 2002:a05:600c:4fd4:b0:477:9cdb:e336 with SMTP id 5b1f17b1804b1-47d1957afd8mr619221745e9.21.1767601433818;
        Mon, 05 Jan 2026 00:23:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGMqr5RF3PmeKLntFlggNTcPo2ZIBIezL7tE6/J3AdeaKkIeEvwYa+UmsMabaObW/38gLAvfg==
X-Received: by 2002:a05:600c:4fd4:b0:477:9cdb:e336 with SMTP id 5b1f17b1804b1-47d1957afd8mr619221495e9.21.1767601433387;
        Mon, 05 Jan 2026 00:23:53 -0800 (PST)
Received: from redhat.com (IGLD-80-230-31-118.inter.net.il. [80.230.31.118])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eab2721sm99141541f8f.39.2026.01.05.00.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 00:23:52 -0800 (PST)
Date: Mon, 5 Jan 2026 03:23:49 -0500
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
	kvm@vger.kernel.org, netdev@vger.kernel.org,
	Viresh Kumar <viresh.kumar@linaro.org>,
	"Enrico Weigelt, metux IT consult" <info@metux.net>,
	Viresh Kumar <vireshk@kernel.org>,
	Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org
Subject: [PATCH v2 15/15] gpio: virtio: reorder fields to reduce struct
 padding
Message-ID: <f1221bbc120df6adaba9006710a517f1e84a10b2.1767601130.git.mst@redhat.com>
References: <cover.1767601130.git.mst@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1767601130.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent

Reorder struct virtio_gpio_line fields to place the DMA buffers
(req/res) last.

This eliminates the padding from aligning struct size on
ARCH_DMA_MINALIGN.

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 drivers/gpio/gpio-virtio.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-virtio.c b/drivers/gpio/gpio-virtio.c
index b70294626770..ed6e0e90fa8a 100644
--- a/drivers/gpio/gpio-virtio.c
+++ b/drivers/gpio/gpio-virtio.c
@@ -26,11 +26,12 @@ struct virtio_gpio_line {
 	struct mutex lock; /* Protects line operation */
 	struct completion completion;
 
+	unsigned int rxlen;
+
 	__dma_from_device_group_begin();
 	struct virtio_gpio_request req;
 	struct virtio_gpio_response res;
 	__dma_from_device_group_end();
-	unsigned int rxlen;
 };
 
 struct vgpio_irq_line {
-- 
MST

