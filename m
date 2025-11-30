Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A621F2288F7
	for <linux-doc@vger.kernel.org>; Sun, 30 Nov 2025 23:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764543798; cv=none; b=Kn8nNpSXYIx8H1rpOnX0oKsL7Q8yOtxddcnbtgjUt2ED2+EO2+trF8XCUFUQHUBlRDQzlk1ACrR+Ox4DX7rus5XFQGGNq8REF3LSqsaoUM5Ew4+8njCKriWjroLn7Ku3fjA4kQge0KjTiD0GIrVTeAadqA+OoHtzIhYhJUQIX38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764543798; c=relaxed/simple;
	bh=ZfpCx8knGrouWGNC7nEwvm1zZ9qJ6jvvaYXgkkxNV1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kQrjkKCwCKYOkDESOiqdLcixX2991RT5qU+WG/o375k1iIHhVZWkqZT4Avvyf0hxQLSU13b+IKvyZnYIh+AnQOqc8DPiO6HnGb/j7ClWSj/L3SQa2VsXDWG1ZSSrNOy/kiTrIIrmXbDbjBygiwQASuOmmScxmoSXz/Rm0yFNrNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EsxvGBfN; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=FdkKobo1; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EsxvGBfN";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="FdkKobo1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764543794;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2KYWqOzNj2d5/1Lpu3vgejds9oVTzhmmeGtHmPu0sy0=;
	b=EsxvGBfNEuc7kOaXQhmlW3OSWZq/hed7RpzV6OPvqvTTrEannroP8LsPZUpZUyemofIKTD
	kSGwURSU596PT98LxLizwx0dmsej2uv79THGqO0p8JYrfxXJ39q9PvACBm8J+qPTRs0bhy
	rXbN1SxkcMEnhIpDjYVOVBJhfQqz0I0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-599-DWnoNJt4Oiawu8uEVKwslQ-1; Sun, 30 Nov 2025 18:03:13 -0500
X-MC-Unique: DWnoNJt4Oiawu8uEVKwslQ-1
X-Mimecast-MFC-AGG-ID: DWnoNJt4Oiawu8uEVKwslQ_1764543792
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4779b3749a8so31508985e9.1
        for <linux-doc@vger.kernel.org>; Sun, 30 Nov 2025 15:03:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1764543792; x=1765148592; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2KYWqOzNj2d5/1Lpu3vgejds9oVTzhmmeGtHmPu0sy0=;
        b=FdkKobo1/u87RtBETECfvc9t8LCybntJomznWyIeG+zc8MwiAve/6XvGCZ5bi0dz5p
         okDbDWPmQ9y1wzGEDf1m8IMeDdPIbNkdAVFO+D0IRiZAeWAlfwryeQ4tQ5gDJGWieNYF
         KHR00fm34AFq/A047PajDf8Oe8D46fSBMVDjvD5zCM6P0pfNooYNNLQF5lGvfhp21QfU
         XspUFu62Mx7UtjibcK5uJwW9C5Ikbng7Dl+EPmIKUq7ykoXY7AC2yX6K1+nbILweAbJx
         wK8KwJXmM665qTcPUV/rKQGRAmsUkysqnAOMJkVJvp6ipunk8flJiIpOlGO3IGOS/FtE
         aeRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764543792; x=1765148592;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2KYWqOzNj2d5/1Lpu3vgejds9oVTzhmmeGtHmPu0sy0=;
        b=dOMfyeD6tnVjI0OeVZL9ko6Ank7xCISTc+YXUQUcwbNgHDEBI/GgVmym0wwwHlbTka
         T6AiVEYfqfSRaLKQvMHem3xrYzlFIKL3wfRoxaTbH+xlBUY8TIX1t6JHgRHQeKPuRC98
         Aad7/Pikr07qPFHyqmQxvXx+ALUC08Hrh3tkPkJ1uxAVBZ9Ib/fxuoGtM/RDSpwOHs2C
         VtugbEz5fnskva0MDxOj/u5Uth9fQ60C53otV0yCotQ2zamnW3mtm1CreeOA96T8/3GO
         vo3WlLyG0ahk95ubJmYs39MeD+nkp3kMGTl68rFpl3706jAti6YFwUQu1LoVDLadUFdt
         yc0A==
X-Forwarded-Encrypted: i=1; AJvYcCVpkt1varegzs8OzHs4xjTwvjqTvdC4AHHNfgKZpC2XaKOYWERHGBXPPlOgKjjXYYaXW6ICnBBcF/A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpPN0I4FDoRmcZ2Yd3FwdpKbS86oCrA06t4HiuuChTuZ8eHbTb
	WRf8MVncTJpdHub5LoDWk95HHbfTHprrz9XEjCrwVTFQYcBP9h0vUi/e9FGrn4Zmlig6KD8srZF
	SbO0FkFum5wrfSrqzOSvxws+yqdHA4OnnxOHkeCXPEpTVgi/CTCHuAMDT2WAdYQ==
X-Gm-Gg: ASbGncsSkzY81hAbfRBh3cbypTbOXUadJGuITcbntGzGUIkD3OsXzW0pyB8nxHyZn+u
	BkDvp+sEGTiuYranq4eb4/bhOaqBCDGYZ1ryvM1D3Vh+4mUgr+QpPPr3NS9lbLZDMOlNsYQJT0l
	QtXqZEUxkA3mG7SX+S//dJ/V1yuDcyuBq3J/jVQQO3o2imhrxIejPnN4XFy3ajUUOdaOs/2bKX9
	J/SvbWLaJPXacuX/JmfLj5Ca2JSWPpqM/s3wk87Jnu9wpPvonJqm2tIkgxHQ2su6jgKcHJ1/2Cp
	etwPmvvZnZTdFy6A6OICT6RbUrYDwjpolpwquou3XmZPcl4nIbA9I1LqdC54ybDUYEEcIzD0Yeo
	KdIMK
X-Received: by 2002:a05:600c:6c48:b0:477:7f4a:44ba with SMTP id 5b1f17b1804b1-477c0162ec8mr240933475e9.4.1764543791990;
        Sun, 30 Nov 2025 15:03:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEZ0j3yjeOE/7Gi6Iq/z5xIauDdgH0LX9c1o69qo0dSs0luPALUG491DfapI4ULa5/ALhqkAw==
X-Received: by 2002:a05:600c:6c48:b0:477:7f4a:44ba with SMTP id 5b1f17b1804b1-477c0162ec8mr240933285e9.4.1764543791521;
        Sun, 30 Nov 2025 15:03:11 -0800 (PST)
Received: from redhat.com ([2a06:c701:73f0:bd00:7951:f7c0:f4c7:a98f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1c5c30c4sm23158691f8f.9.2025.11.30.15.03.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Nov 2025 15:03:10 -0800 (PST)
Date: Sun, 30 Nov 2025 18:03:06 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
	Paolo Abeni <pabeni@redhat.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Jonathan Corbet <corbet@lwn.net>, kvm@vger.kernel.org,
	virtualization@lists.linux.dev, netdev@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Mike Christie <michael.christie@oracle.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH v6 3/3] vhost: switch to arrays of feature bits
Message-ID: <20251130180259-mutt-send-email-mst@kernel.org>
References: <cover.1764225384.git.mst@redhat.com>
 <637e182e139980e5930d50b928ba5ac072d628a9.1764225384.git.mst@redhat.com>
 <CACGkMEsw7mgQdJieHz6CT3p5Pew=vH1qp5H2BSag_55w+q9Vnw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACGkMEsw7mgQdJieHz6CT3p5Pew=vH1qp5H2BSag_55w+q9Vnw@mail.gmail.com>

On Fri, Nov 28, 2025 at 10:39:57AM +0800, Jason Wang wrote:
> On Thu, Nov 27, 2025 at 2:40 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > The current interface where caller has to know in which 64 bit chunk
> > each bit is, is inelegant and fragile.
> > Let's simply use arrays of bits.
> > By using unroll macros text size grows only slightly.
> >
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > ---
> >  drivers/vhost/net.c   | 19 ++++++++++---------
> >  drivers/vhost/scsi.c  |  9 ++++++---
> >  drivers/vhost/test.c  |  6 +++++-
> >  drivers/vhost/vhost.h | 42 ++++++++++++++++++++++++++++++++++--------
> >  drivers/vhost/vsock.c | 10 ++++++----
> >  5 files changed, 61 insertions(+), 25 deletions(-)
> >
> > diff --git a/drivers/vhost/net.c b/drivers/vhost/net.c
> > index d057ea55f5ad..f8ed39337f56 100644
> > --- a/drivers/vhost/net.c
> > +++ b/drivers/vhost/net.c
> > @@ -69,15 +69,15 @@ MODULE_PARM_DESC(experimental_zcopytx, "Enable Zero Copy TX;"
> >
> >  #define VHOST_DMA_IS_DONE(len) ((__force u32)(len) >= (__force u32)VHOST_DMA_DONE_LEN)
> >
> > -static const u64 vhost_net_features[VIRTIO_FEATURES_U64S] = {
> > -       VHOST_FEATURES |
> > -       (1ULL << VHOST_NET_F_VIRTIO_NET_HDR) |
> > -       (1ULL << VIRTIO_NET_F_MRG_RXBUF) |
> > -       (1ULL << VIRTIO_F_ACCESS_PLATFORM) |
> > -       (1ULL << VIRTIO_F_RING_RESET) |
> > -       (1ULL << VIRTIO_F_IN_ORDER),
> > -       VIRTIO_BIT(VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO) |
> > -       VIRTIO_BIT(VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO),
> > +static const int vhost_net_bits[] = {
> > +       VHOST_FEATURES,
> > +       VHOST_NET_F_VIRTIO_NET_HDR,
> > +       VIRTIO_NET_F_MRG_RXBUF,
> > +       VIRTIO_F_ACCESS_PLATFORM,
> > +       VIRTIO_F_RING_RESET,
> > +       VIRTIO_F_IN_ORDER,
> > +       VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO,
> > +       VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO
> >  };
> >
> >  enum {
> > @@ -1720,6 +1720,7 @@ static long vhost_net_set_owner(struct vhost_net *n)
> >  static long vhost_net_ioctl(struct file *f, unsigned int ioctl,
> >                             unsigned long arg)
> >  {
> > +       const DEFINE_VHOST_FEATURES_ARRAY(vhost_net_features, vhost_net_bits);
> >         u64 all_features[VIRTIO_FEATURES_U64S];
> >         struct vhost_net *n = f->private_data;
> >         void __user *argp = (void __user *)arg;
> > diff --git a/drivers/vhost/scsi.c b/drivers/vhost/scsi.c
> > index 98e4f68f4e3c..f43c1fe9fad9 100644
> > --- a/drivers/vhost/scsi.c
> > +++ b/drivers/vhost/scsi.c
> > @@ -197,11 +197,14 @@ enum {
> >  };
> >
> >  /* Note: can't set VIRTIO_F_VERSION_1 yet, since that implies ANY_LAYOUT. */
> > -enum {
> > -       VHOST_SCSI_FEATURES = VHOST_FEATURES | (1ULL << VIRTIO_SCSI_F_HOTPLUG) |
> > -                                              (1ULL << VIRTIO_SCSI_F_T10_PI)
> > +static const int vhost_scsi_bits[] = {
> > +       VHOST_FEATURES,
> > +       VIRTIO_SCSI_F_HOTPLUG,
> > +       VIRTIO_SCSI_F_T10_PI
> >  };
> >
> > +#define VHOST_SCSI_FEATURES VHOST_FEATURES_U64(vhost_scsi_bits, 0)
> > +
> >  #define VHOST_SCSI_MAX_TARGET  256
> >  #define VHOST_SCSI_MAX_IO_VQ   1024
> >  #define VHOST_SCSI_MAX_EVENT   128
> > diff --git a/drivers/vhost/test.c b/drivers/vhost/test.c
> > index 94cd09f36f59..f592b2f548e8 100644
> > --- a/drivers/vhost/test.c
> > +++ b/drivers/vhost/test.c
> > @@ -28,7 +28,11 @@
> >   */
> >  #define VHOST_TEST_PKT_WEIGHT 256
> >
> > -#define VHOST_TEST_FEATURES VHOST_FEATURES
> > +static const int vhost_test_bits[] = {
> > +       VHOST_FEATURES
> > +};
> > +
> > +#define VHOST_TEST_FEATURES VHOST_FEATURES_U64(vhost_test_features, 0)
> 
> Did you mean vhost_test_bits actually?
> 
> Thanks

indeed.

