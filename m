Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF0481724
	for <linux-doc@vger.kernel.org>; Fri, 28 Nov 2025 02:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764297615; cv=none; b=XKp3yyqYUdGc0Iq1j5iyLdkm7IZHwsgX+iLIgkiM0fK8XLoUu4DqjzcpPwxGEIl057cyCkzcRdQj1AkTk9c2eddm/9OyjdW52LWAUcCLzDAD6iPvFHnjR0V0cNdKPzXDvISZOQBclwOvldJtc1ew4p8qN8Drvz4EoZDVVI3tb5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764297615; c=relaxed/simple;
	bh=nqBlYAzg6qxQEMzgk9fJKhYVwAMlfJjMd6zbIrDkIsA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o47dZS89pMN9ck8gF65jiKHttiMJX6xG2UCl97WsYXI22HtAqDcFpQIflH4JpEBzwyT9cbleDDFOEwrLVt73QDN9/bT2BqBXQMSUup198gaD+BX96qBphqAaEUoFDn2VbWc+jzg8DVyKwro/BXjAI3yIMA76zlJZtddXkX/qZuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dtp8CLyy; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=WUBPBups; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dtp8CLyy";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="WUBPBups"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764297612;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sgfHeihlC+8u1mHu0tUzhZgmVFrgBxrrACIpxiuhkOQ=;
	b=dtp8CLyyKRQXNaHy2h0DqYw002b993NEL55QQeWV650jqOXn/5yWY5CI5MbL8LBtmFodyp
	pq7cx9JjQhy2f+MKYCehG9YDx95BGkECU2k3Cgpk6dGNfxqmmSenBr3uzHNqbfSjYbtALH
	BEp9G6iFQhHlD/bFiaf/xgTmGz+yf94=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-245-zeJ9bI8UP1W-CcMDy0X2kA-1; Thu, 27 Nov 2025 21:40:10 -0500
X-MC-Unique: zeJ9bI8UP1W-CcMDy0X2kA-1
X-Mimecast-MFC-AGG-ID: zeJ9bI8UP1W-CcMDy0X2kA_1764297609
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-343daf0f38aso1348767a91.3
        for <linux-doc@vger.kernel.org>; Thu, 27 Nov 2025 18:40:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1764297609; x=1764902409; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sgfHeihlC+8u1mHu0tUzhZgmVFrgBxrrACIpxiuhkOQ=;
        b=WUBPBupsLTGwrL4ustwHzBDcKuoNA5oKsMOehyx9mLuhCOA2lb6TQjmjkb0d4Dasif
         7aoYs5ij7ruDxYXAr+4ESxWkbxoDIFpmAaB0aLI9W8/vSBQd4wMnQNh+YDhkx1KvVT4e
         98iVKMpju8aNiaVHDShGYm0+K5a3d4+0b7CE8mFdYRe5TzX4x/zv+BcWJfzgysFydcRe
         5DnU9CgH9Npy9KoqWusAbN4at0lgC/ao05wD3jNHVaOD2Rr0NLWhyU8qmNGrQxyXxlZO
         d5ZKTlN+lOWgA80obEltLPpimpWBV8oorkYlOmJM9r2yrwMyx9KoyvgBuMlCWpfUvi5M
         rrwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764297609; x=1764902409;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sgfHeihlC+8u1mHu0tUzhZgmVFrgBxrrACIpxiuhkOQ=;
        b=EE7So6s9EcT8D1ZgWMIhGuwxiJZ4LEUTnpjSo/nS8V6uIM0Tfpoedo7OlF1vKwBHUg
         kLfmLHvnL0sCVwQqlHL8dOxKw7ZdR2WQLeEUC3FTlXUohAKQyHnp1Lu2z8QW32BZi9c8
         7+tDrLLoP78+Yse3tiZ/O6pIpx7rKULTAmSJbV8D+fGIzh7j0hH08JmnKT1BIqJZDbkV
         hDntWF7IWK8fUIt3rtqiRXVLOeF+oC/3JzOlhKKeWlAg2UNBGziNnvNzROSSERCzr+pS
         B+Am6/XnbkHY8oT67njkzQi5YB6P34ZP3XCioZVOJwsrB8KDEYk2seFZ7aqmI9AcD0XI
         zYWA==
X-Forwarded-Encrypted: i=1; AJvYcCU2Rsx8QTkYBR5mmtrHcvjdwJl1wRSHPb4sB7Hsim8UGEsQqIkxiDe8A96KJECXhupjREApuL92KhU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEtpbedue+9kVJgPqlYjOIY0iFWqZdX0NdiUyKMcDIwM8hPMyl
	+K+y77wi6ts5Gc+D5WqUGguzY8sRpzG0wVY5x5ZnDqQT8hWCABBwJDS/G09CV1lPi1ireBm0wGz
	BBT4FsUbnY9QIMAxxkNUJYjGrJd8DKIGIGQ/uGrBxKFZERH/0O8ip5UVZYHTICyOUDUYmwyRsff
	/MP2AgKdesZMduqdfBGEkYeKJB24+DALJf20eV
X-Gm-Gg: ASbGncsk6AsWQeHOTmlfcyPYpqCkePojlAXS2aFfAJ/reHuEwyLB7piGpvOBESwo3ah
	QgRqpyf4CWmWbMiHTqHWuv34yL1NBHQMZzWOgUFWa1H5LHz8QP7W+Ttr9+mqqQvR43vxdO5f52t
	IK05XnWBcnioLed0tY3+L3rGTPmRPtDS1BSHxKCaXeKNLDYV0ME3R36hGdJJloKmHs
X-Received: by 2002:a17:90b:1c04:b0:340:dd2c:a3da with SMTP id 98e67ed59e1d1-3475ebe6a55mr11921895a91.8.1764297609139;
        Thu, 27 Nov 2025 18:40:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG4wo+b8mDxiFvbp2FfPvxTIFKnSoRJlDC8td/QTiw0D2SXKZ1egJpMpwXj6ItWG1NiPOtXpEz0QFH1u2tvrDA=
X-Received: by 2002:a17:90b:1c04:b0:340:dd2c:a3da with SMTP id
 98e67ed59e1d1-3475ebe6a55mr11921862a91.8.1764297608647; Thu, 27 Nov 2025
 18:40:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1764225384.git.mst@redhat.com> <637e182e139980e5930d50b928ba5ac072d628a9.1764225384.git.mst@redhat.com>
In-Reply-To: <637e182e139980e5930d50b928ba5ac072d628a9.1764225384.git.mst@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 28 Nov 2025 10:39:57 +0800
X-Gm-Features: AWmQ_bm__a-YRsaDl414Cee-_MAMOHTjKQ-R-ohBFRIeA6P5kRzykoXAUMexjlk
Message-ID: <CACGkMEsw7mgQdJieHz6CT3p5Pew=vH1qp5H2BSag_55w+q9Vnw@mail.gmail.com>
Subject: Re: [PATCH v6 3/3] vhost: switch to arrays of feature bits
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, 
	Paolo Abeni <pabeni@redhat.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Jonathan Corbet <corbet@lwn.net>, kvm@vger.kernel.org, 
	virtualization@lists.linux.dev, netdev@vger.kernel.org, 
	linux-doc@vger.kernel.org, Mike Christie <michael.christie@oracle.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
	Stefano Garzarella <sgarzare@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 27, 2025 at 2:40=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com>=
 wrote:
>
> The current interface where caller has to know in which 64 bit chunk
> each bit is, is inelegant and fragile.
> Let's simply use arrays of bits.
> By using unroll macros text size grows only slightly.
>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>  drivers/vhost/net.c   | 19 ++++++++++---------
>  drivers/vhost/scsi.c  |  9 ++++++---
>  drivers/vhost/test.c  |  6 +++++-
>  drivers/vhost/vhost.h | 42 ++++++++++++++++++++++++++++++++++--------
>  drivers/vhost/vsock.c | 10 ++++++----
>  5 files changed, 61 insertions(+), 25 deletions(-)
>
> diff --git a/drivers/vhost/net.c b/drivers/vhost/net.c
> index d057ea55f5ad..f8ed39337f56 100644
> --- a/drivers/vhost/net.c
> +++ b/drivers/vhost/net.c
> @@ -69,15 +69,15 @@ MODULE_PARM_DESC(experimental_zcopytx, "Enable Zero C=
opy TX;"
>
>  #define VHOST_DMA_IS_DONE(len) ((__force u32)(len) >=3D (__force u32)VHO=
ST_DMA_DONE_LEN)
>
> -static const u64 vhost_net_features[VIRTIO_FEATURES_U64S] =3D {
> -       VHOST_FEATURES |
> -       (1ULL << VHOST_NET_F_VIRTIO_NET_HDR) |
> -       (1ULL << VIRTIO_NET_F_MRG_RXBUF) |
> -       (1ULL << VIRTIO_F_ACCESS_PLATFORM) |
> -       (1ULL << VIRTIO_F_RING_RESET) |
> -       (1ULL << VIRTIO_F_IN_ORDER),
> -       VIRTIO_BIT(VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO) |
> -       VIRTIO_BIT(VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO),
> +static const int vhost_net_bits[] =3D {
> +       VHOST_FEATURES,
> +       VHOST_NET_F_VIRTIO_NET_HDR,
> +       VIRTIO_NET_F_MRG_RXBUF,
> +       VIRTIO_F_ACCESS_PLATFORM,
> +       VIRTIO_F_RING_RESET,
> +       VIRTIO_F_IN_ORDER,
> +       VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO,
> +       VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO
>  };
>
>  enum {
> @@ -1720,6 +1720,7 @@ static long vhost_net_set_owner(struct vhost_net *n=
)
>  static long vhost_net_ioctl(struct file *f, unsigned int ioctl,
>                             unsigned long arg)
>  {
> +       const DEFINE_VHOST_FEATURES_ARRAY(vhost_net_features, vhost_net_b=
its);
>         u64 all_features[VIRTIO_FEATURES_U64S];
>         struct vhost_net *n =3D f->private_data;
>         void __user *argp =3D (void __user *)arg;
> diff --git a/drivers/vhost/scsi.c b/drivers/vhost/scsi.c
> index 98e4f68f4e3c..f43c1fe9fad9 100644
> --- a/drivers/vhost/scsi.c
> +++ b/drivers/vhost/scsi.c
> @@ -197,11 +197,14 @@ enum {
>  };
>
>  /* Note: can't set VIRTIO_F_VERSION_1 yet, since that implies ANY_LAYOUT=
. */
> -enum {
> -       VHOST_SCSI_FEATURES =3D VHOST_FEATURES | (1ULL << VIRTIO_SCSI_F_H=
OTPLUG) |
> -                                              (1ULL << VIRTIO_SCSI_F_T10=
_PI)
> +static const int vhost_scsi_bits[] =3D {
> +       VHOST_FEATURES,
> +       VIRTIO_SCSI_F_HOTPLUG,
> +       VIRTIO_SCSI_F_T10_PI
>  };
>
> +#define VHOST_SCSI_FEATURES VHOST_FEATURES_U64(vhost_scsi_bits, 0)
> +
>  #define VHOST_SCSI_MAX_TARGET  256
>  #define VHOST_SCSI_MAX_IO_VQ   1024
>  #define VHOST_SCSI_MAX_EVENT   128
> diff --git a/drivers/vhost/test.c b/drivers/vhost/test.c
> index 94cd09f36f59..f592b2f548e8 100644
> --- a/drivers/vhost/test.c
> +++ b/drivers/vhost/test.c
> @@ -28,7 +28,11 @@
>   */
>  #define VHOST_TEST_PKT_WEIGHT 256
>
> -#define VHOST_TEST_FEATURES VHOST_FEATURES
> +static const int vhost_test_bits[] =3D {
> +       VHOST_FEATURES
> +};
> +
> +#define VHOST_TEST_FEATURES VHOST_FEATURES_U64(vhost_test_features, 0)

Did you mean vhost_test_bits actually?

Thanks

