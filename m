Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 331343AEF29
	for <linux-doc@vger.kernel.org>; Thu,  8 Jan 2026 14:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767881282; cv=none; b=InnL++NgERRW0cvXt5rcdEfepXxGQ6rsDHnLbDspzQOfHnKQf0sL4A9iLcwO0ByO/5UTDUMBJ9REzhyBFHCiF6HQnpi/vN1fUWuv82oYc55WJKHA7A7cc+dphMzCsmoaSRW9yOjzldV5EvBzrXJRsRIHRXb3w/s75e6tGn4f9lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767881282; c=relaxed/simple;
	bh=KaqiKIrSwJ+ZnBNZThkRID6OHOTJLOwB/Uij0QQJV1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GDxD6C8//xmwT8P7+0E72gwWfaiM+hE/HynwA4VtRS7ia56EvRPHnC6Unu3PjnZLTK8Mi68CAenu5Y8g528JqFsw9h/l0+h3FTFKvIXSe1oePyT56yoGpcTLsnIne+EuT5NAhJYzN1gYcZ+hJGCPc/APOgYQUINXzop2mTcFCGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DC+z1wRw; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=JJtvfR4w; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DC+z1wRw";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="JJtvfR4w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767881280;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=o3dV3iJKWcALTHlfMC1TmWQCBk2jAXP+lliSQZRypr4=;
	b=DC+z1wRwPZkoDB0V0nMq+zA2bs5MIJYw6bINgXSFjswyryJ2mTCrLatbKQcGDywcl4AY4c
	eKHEl1A+UnE4VMdCeTw7WV+p9T6ZhhZ4lswneW3nNG770YRFTVy5tkuXUu05TSgrEMyhMM
	1paeVsIad1KhDgwvR2ZRh4+89SfFcdc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-370-SoKxcVJ2MNKEDCXeyls38g-1; Thu, 08 Jan 2026 09:07:59 -0500
X-MC-Unique: SoKxcVJ2MNKEDCXeyls38g-1
X-Mimecast-MFC-AGG-ID: SoKxcVJ2MNKEDCXeyls38g_1767881278
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-47a97b719ccso20930445e9.2
        for <linux-doc@vger.kernel.org>; Thu, 08 Jan 2026 06:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767881278; x=1768486078; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o3dV3iJKWcALTHlfMC1TmWQCBk2jAXP+lliSQZRypr4=;
        b=JJtvfR4w4xzmRRJLIFv0Z2Ls4vcVnxXpVq0cDbdZAEDqA9oJlAEnLpS47UXoffDo0c
         Tuv0DGAZbIwG4Q/byrvWw+PmIJiLcKMTbHVXMNqjBK5t4WtuO+r4oZCGSHEndY44gNzM
         LTBiVFnmpoU+6OgAJJtOsPePT2Z0d4rB/7WV4BnuctdP/p5VMd2r2fj+ammVO+UiPBQ7
         Y/EO0Z0X5f3aQTbIIcVkWFpIjkd7YLncBknXk9ZOigYHgCE4EPeFa+LV3610GDrg2WNT
         zWrgFo+hzkL7V9NLI13Mi2c2FMPhzKaI48L+00N50mbySmahQoWxvuhO3pE2cNZEAFJ4
         aZQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767881278; x=1768486078;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o3dV3iJKWcALTHlfMC1TmWQCBk2jAXP+lliSQZRypr4=;
        b=k4VISv8MjeEEXeJz3gpGA0o9Rhr8qLqftq9LQKMIi9mpfyuiVQnkBQWdb7fiGshP1R
         +4UVSUL4J6l6i8hWP5n1/6MMXYG/Jfm6f/UWRJnkEW9HC7PHzEAXL2Hi1bbsFSHGTFnA
         K3pCcz9SlE+3Ei6t0AfusOOz5Ar8Ckx663qMxpf9sWJ/2U1JnSpa8+d7Aal6AVarsKXM
         yVUHATIiMsATAXpE4mN6d7ub8/a465+/p8HfgAidyB1r2k2ExIstlIm9cXfcMJte5gv1
         XBMGVB/Ln2EeBr86PUuCgsigyiAnL4eyuU3azSCMK0fFVf+Hbi7YD4lpPJVfNGtfFIom
         3CqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWg8oWhzHnjWLvRTFa03LRU530Y8FqxlcSMdW1xZ3x3NS7zMpDB0R2K/fY+qw3LZdRHEx+lZ3qlsOQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YybtRP4Yce5fE9ICfnPblq0o/7Cvs+riUxg3g/HM9Ka+F3s2Qy1
	wC9VQz8xCDcwwIvPZ1Vsbi0EG+5L+BgI6be7qAHqj2XIJ1R+txMKKWh9zUO/1VJBXypOCTJRU5o
	0vudiZSnloSsvZk1I9+bHL/ZAkN/GEk/J/YqKTK3eES1/TSYofWHw4Cvxzbqy0A==
X-Gm-Gg: AY/fxX7KCa/PQYjNJZe56cwKKMTugdiHttboYcrCsR8ERi1QpjCWtUBNPZaGD4fA2iE
	qq2A8ttTbF3h+x2eYaZPAMZmFGQ1vcQp9aA+VxkI878N0SaYB1kYzsxgNXWqntx37m7c4Reg22Q
	byjvrGb1GfpXgAsHkEBYUlpO4X21R2hW60Nwnw4rxwLkjfqV55D0qsO0g9bqkyQeykuG/yJyGBu
	GcQrrM+AlQaGeLap71RQ8xYDXvu+UrdjroLWjRQSm4V+qKc0XMiRI/iWKQh2wxojsc/n+f3gm6r
	ZfqiILp783Fq1cVQNGEJnX1bPDnmQSwzFYpy5dS/d2p4ufFCRFvRmY7tnv3M0X8KBeA6bFMSK3/
	tvXr2pLZe/bTFbUxTzWgcLgmdmm8LZGkkbg==
X-Received: by 2002:a05:600c:1385:b0:47d:4fbe:e6d2 with SMTP id 5b1f17b1804b1-47d84b2cd6dmr72552905e9.12.1767881277881;
        Thu, 08 Jan 2026 06:07:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHRCfp6entO3V/BR31Far6TJcGMp3EAPQ3dAY6QbDFNrKF2+2e3Jhs1Nmifuq8757Npv4Rh0Q==
X-Received: by 2002:a05:600c:1385:b0:47d:4fbe:e6d2 with SMTP id 5b1f17b1804b1-47d84b2cd6dmr72552445e9.12.1767881277386;
        Thu, 08 Jan 2026 06:07:57 -0800 (PST)
Received: from redhat.com (IGLD-80-230-31-118.inter.net.il. [80.230.31.118])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f68f4ddsm160806445e9.2.2026.01.08.06.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 06:07:56 -0800 (PST)
Date: Thu, 8 Jan 2026 09:07:53 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
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
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Petr Tesarik <ptesarik@suse.com>,
	Leon Romanovsky <leon@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-doc@vger.kernel.org,
	linux-crypto@vger.kernel.org, virtualization@lists.linux.dev,
	linux-scsi@vger.kernel.org, iommu@lists.linux.dev,
	kvm@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v2 07/15] vsock/virtio: fix DMA alignment for event_list
Message-ID: <20260108090639-mutt-send-email-mst@kernel.org>
References: <cover.1767601130.git.mst@redhat.com>
 <f19ebd74f70c91cab4b0178df78cf6a6e107a96b.1767601130.git.mst@redhat.com>
 <aV-4mPQYn3MUW10A@sgarzare-redhat>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aV-4mPQYn3MUW10A@sgarzare-redhat>

On Thu, Jan 08, 2026 at 03:04:07PM +0100, Stefano Garzarella wrote:
> On Mon, Jan 05, 2026 at 03:23:17AM -0500, Michael S. Tsirkin wrote:
> > On non-cache-coherent platforms, when a structure contains a buffer
> > used for DMA alongside fields that the CPU writes to, cacheline sharing
> > can cause data corruption.
> > 
> > The event_list array is used for DMA_FROM_DEVICE operations via
> > virtqueue_add_inbuf(). The adjacent event_run and guest_cid fields are
> > written by the CPU while the buffer is available, so mapped for the
> > device. If these share cachelines with event_list, CPU writes can
> > corrupt DMA data.
> > 
> > Add __dma_from_device_group_begin()/end() annotations to ensure event_list
> > is isolated in its own cachelines.
> > 
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > ---
> > net/vmw_vsock/virtio_transport.c | 4 +++-
> > 1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/net/vmw_vsock/virtio_transport.c b/net/vmw_vsock/virtio_transport.c
> > index 8c867023a2e5..bb94baadfd8b 100644
> > --- a/net/vmw_vsock/virtio_transport.c
> > +++ b/net/vmw_vsock/virtio_transport.c
> > @@ -17,6 +17,7 @@
> > #include <linux/virtio_ids.h>
> > #include <linux/virtio_config.h>
> > #include <linux/virtio_vsock.h>
> > +#include <linux/dma-mapping.h>
> > #include <net/sock.h>
> > #include <linux/mutex.h>
> > #include <net/af_vsock.h>
> > @@ -59,8 +60,9 @@ struct virtio_vsock {
> > 	 */
> > 	struct mutex event_lock;
> > 	bool event_run;
> > +	__dma_from_device_group_begin();
> > 	struct virtio_vsock_event event_list[8];
> > -
> > +	__dma_from_device_group_end();
> 
> Can we keep the blank line before `guest_cid` so that the comment before
> this section makes sense? (regarding the lock required to access these
> fields)
> 
> Thanks,
> Stefano

A follow up patch re-introduces it, so I don't think it matters?

> > 	u32 guest_cid;
> > 	bool seqpacket_allow;
> > 
> > -- 
> > MST
> > 

