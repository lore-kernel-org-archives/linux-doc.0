Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E56259CAF
	for <linux-doc@vger.kernel.org>; Tue, 30 Dec 2025 10:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767089785; cv=none; b=A8ujmayhpj0UUx9wMSMDwRMhmGvFP5QP7DtRPb95I0MUdTRQRdYE4ZUqGdrdH/c6QKQUWdXdeijUO+2hlSoM72QKCv9Wcy8TnDMnfAg7mdcoeHNCpJi9Jq/y3kwgneG28ds9vEzQpXlhPZbyJgGsa4/jRreL5069me1VBiuA3To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767089785; c=relaxed/simple;
	bh=RzxSFhz+bpkLtGdr/5qvrDQOf7DHug0oDxHEj4NfN04=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O7WGB8rXI01RcwkqZ8DyMlJoL9cMhmNCcwDI6e9kKlnLA5A000YOKjHil2+h5n8KWu5ASnibtfSn4xsY8JCRnmjs5+ePyQluNW77zXM7wZd3igfaaVav/yXy6fr1baCJbyt6kvSEXyLWaw12fkrEliYycO7DrspN5I2jD2l18lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GG1e92xf; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=H7MYoLT1; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GG1e92xf";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="H7MYoLT1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767089781;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qjCbMizY1BaJF5yBWOLXV7DyUl9vbunxYIEFqfWmhYA=;
	b=GG1e92xfXwhdCfXUvWy8J123z+Vg7kCtHuNr/m3hKaNvn9RGC4OKv0ohda0Zxj4wQREy1p
	xe3xJ6sid7rHsX0+C6Pm/J5LoNli5rVoinLSSXriVcYFI7GrbodDENgbELVi+Zy+NJcMRI
	0sNj8PIu0WwXd5jsawV79NcWpsa05Kg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-587-l7KA9FeeM_6u16ZqGqFwoQ-1; Tue, 30 Dec 2025 05:16:19 -0500
X-MC-Unique: l7KA9FeeM_6u16ZqGqFwoQ-1
X-Mimecast-MFC-AGG-ID: l7KA9FeeM_6u16ZqGqFwoQ_1767089779
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4779d8fd4ecso49771925e9.1
        for <linux-doc@vger.kernel.org>; Tue, 30 Dec 2025 02:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767089778; x=1767694578; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qjCbMizY1BaJF5yBWOLXV7DyUl9vbunxYIEFqfWmhYA=;
        b=H7MYoLT1sC1fMePwilZgor41MO9FHeM/T674J1He9y7yu/Oth+y+DDgJTogkMUfR6L
         B9EllHYcBINQWnKOqFrEHfEzyGsdZ6fiGqoqBRmqpOpdHx6N63Vptzo/xm01Xsdd99cF
         nWbY64Uhv9rFM1H+3huYPRG38ibmuVbHMTnPkRpz+xRek3kiyBDygowHHN+AA/YPDEkJ
         voCQp45TPJoRhbBMv7DnJ4mSxbIfZSZSDgPa8ibGQO5rjyyWml895af9RF7ERBg/7sj3
         7Q2aHYpd5j6qCTqPMVWry/C7GZvj1s622DsNALSu/1fQOIDv+geQ6j2vccjZxm2dPn1d
         MIWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767089778; x=1767694578;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qjCbMizY1BaJF5yBWOLXV7DyUl9vbunxYIEFqfWmhYA=;
        b=xAdT7Hn4cUfSBztYAIm68v5eKH5cvBLHCvYwA2d4DOzEdBI/lkz311hcdvlkFnlpsu
         LkGVvmK2bqsXZloT0hY1z3P1lsVCFF53kA6OVo1AjveTMR1CsDbEN5ZTDYcT2Dq8b/53
         k+3GBuDd9Vrt3dapgGg2gii45v5NCdWjhb4pe2+HdU2aEfLtv0phTfY3ZcIrkRA9DNHo
         f85skr8+SDfAZlMTwV8PAe9E5nsKPQlVRwFU4S/IbfFtLXE4hn/HaHAWLTNJq2J0dBuo
         hus1zx9rTnXLs2bJDJyMYRtIPhwsoxtLdUoWutX1v5o4umOmYFdPr5qpHgRnxBETRJ0s
         Ny/w==
X-Forwarded-Encrypted: i=1; AJvYcCUNHLU1IxGyHlP43EgjdBT//gHonKo5jtYp1cnp6Icl/L6WDZAWoUPOmWvskqGfzVxXpvrG5coRyg0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYjUqw657+0Gm93akk4iWa1c50zQwZmD3E6NyxMdCosW7PzLah
	pTbWFBMRVRDx0teH5rHyz7xBHnAF63z9GTKGS3XDg2fAJA/f+hQdw6GHL7YRDps+/tu2Wqr0ZLp
	d6/wHdN9zbHff0NI3o7dfmEUKwrbx5j9aRFhfWDL5w3gpefO+c6h4X7gj4QmLyQ==
X-Gm-Gg: AY/fxX7qR2UYl95rbzgGluLd96fHtuaGod4DuZUaGQvmonXXBZuaR9QOtTEvu0iRE81
	12jud/1u+dPDsY435YfvfYd534kjoi5/vQP8nTattZYyQxdhtmdZVn2kXOcGM5udxjo87ddw5k9
	5NFL8RP7Dj9Yr2Qv2tAlTDT8+FGmaQb04lv0kiWvU9RJTDuYG/qW3xtHjqrcE13mRBwoOR8stZ8
	NoCrbXykrPd6orxo6X2anB+BZepO70KOV3QCpsPS6dp4nZLajTev9PPFuVh/sjVRsOUqtziZ1/a
	3ggpaUzVB6ir6mWfdrwVU1+OFAHcPb63SR4m3xlBgO+wNeAumTkZVPZnp8gllfnNBl47kG7M8CT
	xTnTwOeSyw/PFp6BiLV1x8WUm3vM6x3yF8w==
X-Received: by 2002:a05:600c:c04b:10b0:47d:333d:99c with SMTP id 5b1f17b1804b1-47d333d09b9mr218755205e9.18.1767089778571;
        Tue, 30 Dec 2025 02:16:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFT+g6nqLgyQkQdYiav+FpD+RF51wbupLPftlD1j+tQDbY3ul4LGHX6uIhkOPdx1xlKUXo8aA==
X-Received: by 2002:a05:600c:c04b:10b0:47d:333d:99c with SMTP id 5b1f17b1804b1-47d333d09b9mr218754935e9.18.1767089778175;
        Tue, 30 Dec 2025 02:16:18 -0800 (PST)
Received: from redhat.com (IGLD-80-230-31-118.inter.net.il. [80.230.31.118])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be3aea77bsm247750305e9.17.2025.12.30.02.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 02:16:17 -0800 (PST)
Date: Tue, 30 Dec 2025 05:16:14 -0500
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
Subject: [PATCH RFC 09/13] virtio_input: fix DMA alignment for evts
Message-ID: <5f57d7dc13920517b3ed3e56d815ad1ba4cf36ce.1767089672.git.mst@redhat.com>
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

On non-cache-coherent platforms, when a structure contains a buffer
used for DMA alongside fields that the CPU writes to, cacheline sharing
can cause data corruption.

The evts array is used for DMA_FROM_DEVICE operations via
virtqueue_add_inbuf(). The adjacent lock and ready fields are written
by the CPU during normal operation. If these share cachelines with evts,
CPU writes can corrupt DMA data.

Add __dma_from_device_aligned_begin/end annotations to ensure evts is
isolated in its own cachelines.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 drivers/virtio/virtio_input.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/virtio/virtio_input.c b/drivers/virtio/virtio_input.c
index d0728285b6ce..774494754a99 100644
--- a/drivers/virtio/virtio_input.c
+++ b/drivers/virtio/virtio_input.c
@@ -4,6 +4,7 @@
 #include <linux/virtio_config.h>
 #include <linux/input.h>
 #include <linux/slab.h>
+#include <linux/dma-mapping.h>
 
 #include <uapi/linux/virtio_ids.h>
 #include <uapi/linux/virtio_input.h>
@@ -16,7 +17,9 @@ struct virtio_input {
 	char                       serial[64];
 	char                       phys[64];
 	struct virtqueue           *evt, *sts;
+	__dma_from_device_aligned_begin
 	struct virtio_input_event  evts[64];
+	__dma_from_device_aligned_end
 	spinlock_t                 lock;
 	bool                       ready;
 };
-- 
MST

