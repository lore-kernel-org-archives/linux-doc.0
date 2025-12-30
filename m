Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E34F43242BE
	for <linux-doc@vger.kernel.org>; Tue, 30 Dec 2025 16:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767112843; cv=none; b=tkE+s8p+nhx3j9uLEXCDDjygjhVw1xq7VsEDeN5nyZ4WYrFGEHkESV7+OnUV7ZDA3g0BHj8pQKCw2jBRemHaosEZz8d2tQOgQbry5zcIm26t7DmnB28h+lm9UE2fy2nX7tJ4HuwRT9Qruv/qaPP/VBiolRPMN36+NHenydJ4VBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767112843; c=relaxed/simple;
	bh=rJvyv/DkZDnTdlk5mMz+iorYKgEElNGmDI1t8E4mVas=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZbiN8g891INRfeFs679gwyd9zqrswLGxmsr6S9RfhTQDNxUhTXdp+PW7olslD3H1eC1vSwKXhfVPn/uKgheUz7LjsGVrbrPy2EXul7VdVgbmEy/I+lfk3XeQb891oEzxOK47YGSdThi5CVWPidQ1cIGsnIQ8g8WaVrUyTKqovOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q2v1sdAQ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=QcCA+7eU; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q2v1sdAQ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="QcCA+7eU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767112839;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RGewFge/6sMWyfD/6+VNEsuf36DWmJ0Q3xqEbJz+f7M=;
	b=Q2v1sdAQAk/eG/xQ+2oOwrLdVAQveSV8+hvKKFYeiV7fVAei25o+6ncXA7PnVUayaX6099
	J6j0DOV0loUWPeocxFruy5syesmGjdbc7Mddd3MmwTL/BuNgv8rMt4lT29QTM4LSJrpjjB
	AHxqVnumg1TesE9t4Y/X7RAVbsMq/IQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-498-B8wQhAfPOn-zmIYOi2Gylg-1; Tue, 30 Dec 2025 11:40:38 -0500
X-MC-Unique: B8wQhAfPOn-zmIYOi2Gylg-1
X-Mimecast-MFC-AGG-ID: B8wQhAfPOn-zmIYOi2Gylg_1767112837
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-4325ddc5babso3943356f8f.0
        for <linux-doc@vger.kernel.org>; Tue, 30 Dec 2025 08:40:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767112837; x=1767717637; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RGewFge/6sMWyfD/6+VNEsuf36DWmJ0Q3xqEbJz+f7M=;
        b=QcCA+7eUvHQSy2dgFoIzSSIP++kP8Av+SYabpYIOYZ7166/HrUbm8Wno+lYddS7XTp
         pu4owh2Z3XIEfihGTtHc0VouJz2I4u6P2oJK77qlOPqpIXGrJuKYJq45XfPN6ZT2q6KF
         7CpCcVP1lwHuwAdPm+yWlId1+YfXzkTXN+2e96HhbGEh8HNerWSrWqwLJAQ8lDLbCZ8I
         i7/KnnYBnZO/cxr1ICKKJvD1hjBvU1YnimyFfTST5YTCCJwLe7fBZrfij1ORvxy5Q3Tx
         srQFSAFtQaumOEHLJiA3iZKM9yr3kTeeG2hdS3jXfIqmNnmCszDLRXgTTDAidcDg4R6o
         yHRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767112837; x=1767717637;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RGewFge/6sMWyfD/6+VNEsuf36DWmJ0Q3xqEbJz+f7M=;
        b=S9KtcJ9Ia0tTPKdfFYJrx5DCDuNfkV6i+97NdPMquX0/WZrJ56XJFR6/C4bbkd8WIi
         OQcAfx5kZ+nA/ypCT4q+luyAnQ0IcBxMiXtJUFcEWiPrpLG4K1elzjD7OjPWNP90Jrcu
         dQxhaslcSu1NOxzTbIZZXV4YB/RR89kzCQGSZutjG1SxGbUQyEdgqLTmkZSMphLSw8Fg
         U4VkVtUgfHYFijhWxtr5R/Ax/pp33mBQAOM08VjstpTw9Z/rOpxSmH/WTIwXSIGht8j8
         PSF+Pu62GI4IRNIivoroFg9fRTy0SW2LjOLV2x2oRm3hairXrdJw41slyeMg9Dp7uQBW
         z/Iw==
X-Forwarded-Encrypted: i=1; AJvYcCWV6DIUcgh2fjlC6IpkXVUltLkx9i33u3Mza7/etHWBkCX5oWbvnNeXkbMrAEQjAeTgoGT6m6PKpuk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNFZKpA3d6kT2DKKYYYRQgnryGM8R3WFMhnfmIXB1X22bkjI6t
	egs0OuBGBPNj2tlKcrFJMmfahE1obUltNoTb5kOtA+B3xSt6SS9p6dgxGr3vBjxMSQnKZnaUky1
	i80JomS2LlSpxKamZDAWTDB6qQti+XspcWfSnXgghhnS72XCqxI/tRjelXH8zsg==
X-Gm-Gg: AY/fxX7arGLFcKLCA8VnYTga127Mq/R9IvhTJqcccgDRidUAaNXtDVjtFLFlgYfE58X
	GWaAQwI7wx0FT5xKmF7NRWP1TFEbEXMpu1HIoIjn+QrCTooRr8aFdyk4iDooNs3t1UKqX2PvRck
	dxgeWcnQEmcemiKqXiaX5uNq7lFzUC7NgkiUErNU4vpQw0t+PZnS9rsPiYvSex3/lxxJ/XPqtbO
	OcW1zqKzpjE3kOum8BXGJ1+VzgVU3GrAnmuKWdzeqs0R9pLY80TCa0M7qB1HjOSxvYJuWW8grIv
	Mx8NlguxAOr5Xm0IZi+5zyv6QBcNhu1w/NDog/B0dNSFleahTA1h13h+DZrUl78CCxAJkMrDiul
	U7IcYgns4J1FTpkOfpbfgVJaJ5E+r3XFVVQ==
X-Received: by 2002:a05:6000:1865:b0:42f:b9f6:f118 with SMTP id ffacd0b85a97d-4324e4cc03bmr47308999f8f.15.1767112837185;
        Tue, 30 Dec 2025 08:40:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHJgojb32FwsKVmHhWZwfLhjoCLU41JBrW58xQS8ik2FTwcPC3e2aYiOOV4nGFH+isXC/64yA==
X-Received: by 2002:a05:6000:1865:b0:42f:b9f6:f118 with SMTP id ffacd0b85a97d-4324e4cc03bmr47308928f8f.15.1767112836647;
        Tue, 30 Dec 2025 08:40:36 -0800 (PST)
Received: from redhat.com (IGLD-80-230-31-118.inter.net.il. [80.230.31.118])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1af2bsm69151255f8f.1.2025.12.30.08.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 08:40:36 -0800 (PST)
Date: Tue, 30 Dec 2025 11:40:33 -0500
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
	iommu@lists.linux.dev, kvm@vger.kernel.org, netdev@vger.kernel.org,
	"Enrico Weigelt, metux IT consult" <info@metux.net>,
	Viresh Kumar <vireshk@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org
Subject: [PATCH RFC 15/13] gpio: virtio: reorder fields to reduce struct
 padding
Message-ID: <55e9351282f530e2302e11497c6339c4a2e74471.1767112757.git.mst@redhat.com>
References: <cover.1767089672.git.mst@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1767089672.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent

Reorder struct virtio_gpio_line fields to place the DMA buffers (req/res)
last. This eliminates the need for __dma_from_device_aligned_end padding
after the DMA buffer, since struct tail padding naturally protects it,
making the struct a bit smaller.

Size reduction estimation when ARCH_DMA_MINALIGN=128:
- request is 8 bytes
- response is 2 bytes
- removing _end saves up to 128-6=122 bytes padding to align rxlen field

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 drivers/gpio/gpio-virtio.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-virtio.c b/drivers/gpio/gpio-virtio.c
index 32b578b46df8..8b30a94e4625 100644
--- a/drivers/gpio/gpio-virtio.c
+++ b/drivers/gpio/gpio-virtio.c
@@ -26,12 +26,11 @@ struct virtio_gpio_line {
 	struct mutex lock; /* Protects line operation */
 	struct completion completion;
 
+	unsigned int rxlen;
+
 	__dma_from_device_aligned_begin
 	struct virtio_gpio_request req;
 	struct virtio_gpio_response res;
-
-	__dma_from_device_aligned_end
-	unsigned int rxlen;
 };
 
 struct vgpio_irq_line {
-- 
MST

