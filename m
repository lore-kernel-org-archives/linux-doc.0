Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB395328B71
	for <linux-doc@vger.kernel.org>; Mon,  5 Jan 2026 08:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767601415; cv=none; b=ZD48DFXF743BgOWKSpgu1HTM+jlagj4uRURmoc01+m3bnZdVRggHJysxEhyOkGZ9PJ2RhyJZmykK9zQM3IKtlf0DbFS9TM6CIZxrEUfnLgsPba+6/6/5D6QwouFI2CMypoUkzfTllXPHQCzjyr6Yf4gJGNdLFeYgEzlOnLaoHYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767601415; c=relaxed/simple;
	bh=yZFREYe+kB50ig8I4QfoDGYH7fn5mVvqsTw8oxG1/Z4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j0nmFxhPa+2zW7gjlkRudX7T+ezh0Rgk2bbLSOZKj6N4PxxTP51/TbSiQY/UTCGd7XNXJUQwwP+SvXou96NEL/mjVhXkYjCZBw4aK/6kKWPublkjqoHA8VbXMEFvOozw86yJ2ehhTiGwGkd+rL/a769IbYPExpe2+Uu7K06xXHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NZYTig9O; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=RWZ1fXc2; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NZYTig9O";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="RWZ1fXc2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767601411;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WFAlf3bglsAJtkYzmv+ft5xqaztKYGlID1/+YOBMr0o=;
	b=NZYTig9OxvGi33F4alaWAZlkgFHbRRcFArIH3y7Q9dfkGB/LHrLqml34x1LL0cGWiYvYM+
	fAsyB2BkedFdFLAa4HE3UL/dr8TC37QshxQNcCNFpL3qDJ8hTqHXHFPOfFQhuIGruLWad8
	9qEcT25D7DdQTok8IduKVbMQqAvC3Gw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-584-RSxwMSdyOWyFikk_tjjufw-1; Mon, 05 Jan 2026 03:23:30 -0500
X-MC-Unique: RSxwMSdyOWyFikk_tjjufw-1
X-Mimecast-MFC-AGG-ID: RSxwMSdyOWyFikk_tjjufw_1767601410
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-47d17fff653so51069125e9.0
        for <linux-doc@vger.kernel.org>; Mon, 05 Jan 2026 00:23:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767601409; x=1768206209; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WFAlf3bglsAJtkYzmv+ft5xqaztKYGlID1/+YOBMr0o=;
        b=RWZ1fXc20ZkPKj+99fWUwuXo/equGaNjQgbzREfCka0FOX2uIqLLuxl+O9HxLpwj2C
         iZG/W34/ARlm0hd3v9K7r6YnDdrsAN8qcmZQF+V951BjWru74fplmVNXqLEAqwpri6/5
         eIEsQP+XV9aMeQokdFniLjl4ugZGFQzJNHtIeVLtOroKt8HACZ3giLnI6AA3V26BdTwc
         0wEuTJ2ZwZvEblT1B0TAQUiq3V+oe+8PlUYmu92jVdhmn2z7nmZZPQ5C0IDA8vXGYP0y
         RPoKUQFVv/MZFhxuivyuaTJWNJ/Y1C2ie6leuq+9E9ZLMOlzC0G+RyGG2WDSJW41Zryt
         ki8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767601409; x=1768206209;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WFAlf3bglsAJtkYzmv+ft5xqaztKYGlID1/+YOBMr0o=;
        b=itWkigHT9fRdZUNe6uPRRgzAe2g3LM78AfH84Jh0Vg7Coi3c+iH59WCJPQm0msODv/
         wiM1dxI6LGVIfXW2WotznPEhlfH/QduzTha6eaqvEvSrfcCoLlvnqRmziJAQ6DOuSmFp
         IgfA7FdVSLjUK3P0jsMDdMAHGpo6TUtQqFUyUVzhQsMEh7cB9R+JijV6k390hYPgYt07
         e4PU3S+zposHcAIXFRLgYz8wjDY8SdaHxSgDt+upDHvOkZLrVMbmKo1QS55RMXm2gtFW
         T4xLN3U7vOHJezqdLIcQu8ZhCx1Ex8YBaYt0hZEGYSqL6ZedYyZQfhB1sBB+bhz/nEbe
         T0Ug==
X-Forwarded-Encrypted: i=1; AJvYcCW24cRY5e47pqzwyf6E+SuzNOEIS0+QhhOQhidTit8ML/pNfLkjbKm6B7BXrhgf1DBx7U1vS0kvYNY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwMa7VYaqBx9e7sS6oBvutsFn1Y1Grkv6g7O3VSoxRamEdtR8i
	q5ca+s/1VV+xfPnFvlvU07eEKZ5dCy2eXl86/1IgK/VVCLbj84SS2fouCINlsP9romVTRiqQk3i
	gXDydrh8UbOBInL480VtjDsb3b7YFpSdzHLyBxychsYiLsfK+KrRlKs0eewKU2A==
X-Gm-Gg: AY/fxX7rrKWk1STcexnlS79S3SQk7EsTLZvQhZcMBwBLoaQqxMusyAWHgaztwdUy4Yt
	qsLEydvELtMEMD5YbG3f9gG470llDr3ZN3WD+yY++Zj+nBQqXIDk7KlWWCMJFAXBpG2JiyW8bzP
	PjTW7gkrMXJmUoo7gD9ZpM9AuTskPNfyp4JXgApkXdbzdZV1Oe6QHUhiAEp2xIU7JwbK+2KKsup
	EwK61pP9iNGK7IVL0+uCcwiGTzXOxc5Y2k+q5VBHEHsdHPCTi6JqCH2X8Zy7ckC52fSRPTgR7lO
	0aA/4PJK5zNNhmBWzz+8XNfswXyslnoOaXovIEL/hTD6/fIYEpGhHtYr/2coqgavW9rTqJ7D494
	Iag9NwjUs7BNwIwp7/6Fo+tQxo3DAWeacNQ==
X-Received: by 2002:a05:600c:4fd4:b0:46e:4a13:e6c6 with SMTP id 5b1f17b1804b1-47d1958a43fmr573308455e9.19.1767601409534;
        Mon, 05 Jan 2026 00:23:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFwNUq77RyeyS0obHX/fGtVMqKrfm8Lk7lx8bL3zrRbRdvbJ0vPOnUhK5sFwtMU1HFVUtXhCA==
X-Received: by 2002:a05:600c:4fd4:b0:46e:4a13:e6c6 with SMTP id 5b1f17b1804b1-47d1958a43fmr573308005e9.19.1767601409047;
        Mon, 05 Jan 2026 00:23:29 -0800 (PST)
Received: from redhat.com (IGLD-80-230-31-118.inter.net.il. [80.230.31.118])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6d145162sm142697615e9.4.2026.01.05.00.23.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 00:23:28 -0800 (PST)
Date: Mon, 5 Jan 2026 03:23:25 -0500
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
Subject: [PATCH v2 09/15] virtio_input: fix DMA alignment for evts
Message-ID: <cd328233198a76618809bb5cd9a6ddcaa603a8a1.1767601130.git.mst@redhat.com>
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

On non-cache-coherent platforms, when a structure contains a buffer
used for DMA alongside fields that the CPU writes to, cacheline sharing
can cause data corruption.

The evts array is used for DMA_FROM_DEVICE operations via
virtqueue_add_inbuf(). The adjacent lock and ready fields are written
by the CPU during normal operation. If these share cachelines with evts,
CPU writes can corrupt DMA data.

Add __dma_from_device_group_begin()/end() annotations to ensure evts is
isolated in its own cachelines.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 drivers/virtio/virtio_input.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/virtio/virtio_input.c b/drivers/virtio/virtio_input.c
index d0728285b6ce..9f13de1f1d77 100644
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
+	__dma_from_device_group_begin();
 	struct virtio_input_event  evts[64];
+	__dma_from_device_group_end();
 	spinlock_t                 lock;
 	bool                       ready;
 };
-- 
MST

