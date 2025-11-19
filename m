Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B936C31A067
	for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 06:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763533588; cv=none; b=Y3AN4Zy9Eglp+XKRaVSEtH6t0rTUDV63ChJTW1RedU3UKiY4jjrbJXGutLcracy12i2Mf3Ciw1Mvk7zUikoisnY7y3JMFLKUUyRDAGtJUYODcatIctHEt22iL5LO/42sc6T+LgoMuSta554hBTRsNCcHieKbhKsqTb5b0kXegAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763533588; c=relaxed/simple;
	bh=5EDc/f+VmsHhTS8Xoex2CMoDeMz7q9mQHhQgB7L90Ng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UhA06uts4dhj5Kf31ibjUgvMB2707nHHwSCtSjlDcFA+TdPIbYcPElqRbt5sWw5e1iBxysYlnS+YiElWH2dPIXa48WO4JlQd8aOI2W51BXquRuxmQzBZ/YN3m3cF/8aj0wCWjiaCjMsSSihJKHvxoDrW/BblrUul4bGBSHzR41g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HAKSS9uy; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=g7yEL0VI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HAKSS9uy";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="g7yEL0VI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763533584;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y1HKVzAgxx7i6yZ83N1XooYE8usn83cITm9aQzQHukg=;
	b=HAKSS9uyszSNjKnzz0qK+EnvJXllAxrfuxxCqQb7bLlCKBeFPB/hTPqtUVHEOfXm8T/NEb
	E4DfUlhmOPy+qcGFgU1+7pQdNx4SOw5Vwo8AN+J14FiZdZtXu9hgvUK3AGwFc4f2WYBbd2
	E94grnOSuunCNAcDYxmiqUweSisFqoM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-10-7VqbTKdCPxKc-RLpCktOHA-1; Wed, 19 Nov 2025 01:26:23 -0500
X-MC-Unique: 7VqbTKdCPxKc-RLpCktOHA-1
X-Mimecast-MFC-AGG-ID: 7VqbTKdCPxKc-RLpCktOHA_1763533582
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-429cd1d0d98so4300639f8f.3
        for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 22:26:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1763533582; x=1764138382; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=y1HKVzAgxx7i6yZ83N1XooYE8usn83cITm9aQzQHukg=;
        b=g7yEL0VI2JbRyVQg5jLA7SxM2YqkQc+8obmmUwZX9fPJQ/QirrvAKksAPU3j8kGmIJ
         kycnioDgDr4GreC5j/r7+1zP4evqyk3yZVlKv1iqDjkVRMIdLHizCkZLRUp8GUyJrJSh
         C8GXJkVOrYz6ECiuh7/qwF6mAAnrmw2Lw1PAaNdv58HtGkyMOLS0MbsRZlZx3IypbDIC
         Jxw3UcUz39p52HbH/T3Wag3qwPoUAckcdsgyRa0U7KW5Pp2YvIOxOMoCTbHzmBJhipNh
         RZUXsiUfdsIo/y1k8Nfpw+7GaNo4AADQI9N6VupDwU9Ytm7/BOacX1KPvIKDmLnTTbRM
         aczA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763533582; x=1764138382;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y1HKVzAgxx7i6yZ83N1XooYE8usn83cITm9aQzQHukg=;
        b=D6vWoOw9XDbbJ9aMY7DUvetFIE+4m1Q+hPa6khzV3i06LyKBwwpCwgEExqdvR2hVGv
         ZlAQMjd65o97gar9nWeM1yo6/RP7QoWqmEkb7/VXoQUnZB+YDgW5DP+WOacxvhFLxAL6
         yksRpZj5E08gKwtU78WVZBMjHflho6PBuRl3P3Y9LS+t2zMLA68+HyVVitSadG/WH8nj
         Ozsg3kS2qIpc2dgKUikbmAsdDrmWb1TLywxXjA6JNtWQhMfuTRh2yonj4hPhHgKc80Ib
         hvBPTnLdquZ7gcxzgw2piDaoK2/qWoVOcwg/0lbYSfx7aGh2CnBho2COerArxPtW2yjx
         Vc/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUi39o7U828pVq0WB1INbAud+mGw2xNfUjVrpbV4W91WGHmJhaPWiqRk+KYVa6KGLbdR1kQt0EaXG8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx33rQWV+7hPyKpdyZ2vf+KfZYv6N+m2ms25nQTmlClgGdlNeph
	gJE8nuc3YGOiQ7Sl3jCRVPO1+wOr3ODIp8TtT8naNVCc8tcBgc8Qvr/0RBIN/rgmVaQZ4uSC1br
	/3RsrnIHmTPds7t+Hrq2/CIKBPq708oNM8a/ejBR6ZuGDTVBFqt9Y7MMS34+G7A==
X-Gm-Gg: ASbGncvNRg5a3Aq4s4/PygTCyghNg7A4C2SvxXnfdoxvJSeszs9LITfrESBrUpMcOpB
	RQP9Aq4etAD0X/l3sp8UKNaaW42TokPsue7pwipsHxqicrCNAKIg0TbjnkDbQ/nQnJnBTROr2a9
	rucGejKfRXVm44vWaeRyXKzCBpQ5XaOxMJHTm9cE6iVO3dwBSqleI/CSXYn3I3P/uD9qUEIJSc+
	GBMfqP8fs6agrjzFIWG+9zx8cEQBCPgxwfPWOELCSu2s8lxvVbCaySR2d1f46BDmC+nTHGWhCmq
	poWJobO9al99VS+dHU93MPZMGwlMAKPmfVvNhOx30zYei2oNwyXG3P25I/CP87UmC5ZuhYBKeSd
	rlrsoDtHoMVlnmhCR2QME6fLcfEkXnQ==
X-Received: by 2002:a5d:64e7:0:b0:429:cd3f:f45f with SMTP id ffacd0b85a97d-42b5933dc54mr17627892f8f.7.1763533581546;
        Tue, 18 Nov 2025 22:26:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGHbEIgDvwzU/PwaPvTTi3zQKc9nOXwTgJs02XEdEtPndPNL32NuK0ZEl+WnP3eYo21GNBnmw==
X-Received: by 2002:a5d:64e7:0:b0:429:cd3f:f45f with SMTP id ffacd0b85a97d-42b5933dc54mr17627860f8f.7.1763533581006;
        Tue, 18 Nov 2025 22:26:21 -0800 (PST)
Received: from redhat.com (IGLD-80-230-39-63.inter.net.il. [80.230.39.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f206e2sm36522931f8f.41.2025.11.18.22.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 22:26:20 -0800 (PST)
Date: Wed, 19 Nov 2025 01:26:17 -0500
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
Subject: Re: [PATCH v4 2/2] vhost: switch to arrays of feature bits
Message-ID: <20251119012322-mutt-send-email-mst@kernel.org>
References: <cover.1763278904.git.mst@redhat.com>
 <17c98c7304b6d78d2d59893ba7295c2f64ab1224.1763278904.git.mst@redhat.com>
 <CACGkMEu28fHr7Bo5Zm4chwOj-xBmTYcHM3TfXRx8OZ3OhO8q8Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACGkMEu28fHr7Bo5Zm4chwOj-xBmTYcHM3TfXRx8OZ3OhO8q8Q@mail.gmail.com>

On Wed, Nov 19, 2025 at 10:03:58AM +0800, Jason Wang wrote:
> On Sun, Nov 16, 2025 at 3:45 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > The current interface where caller has to know in which 64 bit chunk
> > each bit is, is inelegant and fragile.
> > Let's simply use arrays of bits.
> > By using unroll macros text size grows only slightly.
> >
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > ---
> >  drivers/vhost/net.c   | 34 +++++++++++++++++++---------------
> >  drivers/vhost/scsi.c  |  9 ++++++---
> >  drivers/vhost/test.c  | 10 ++++++++--
> >  drivers/vhost/vhost.h | 42 ++++++++++++++++++++++++++++++++++--------
> >  drivers/vhost/vsock.c | 10 ++++++----
> >  5 files changed, 73 insertions(+), 32 deletions(-)
> >
> > diff --git a/drivers/vhost/net.c b/drivers/vhost/net.c
> > index d057ea55f5ad..00d00034a97e 100644
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
> > +static const int vhost_net_features[] = {
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
> > @@ -1734,14 +1734,14 @@ static long vhost_net_ioctl(struct file *f, unsigned int ioctl,
> >                         return -EFAULT;
> >                 return vhost_net_set_backend(n, backend.index, backend.fd);
> >         case VHOST_GET_FEATURES:
> > -               features = vhost_net_features[0];
> > +               features = VHOST_FEATURES_U64(vhost_net_features, 0);
> >                 if (copy_to_user(featurep, &features, sizeof features))
> >                         return -EFAULT;
> >                 return 0;
> >         case VHOST_SET_FEATURES:
> >                 if (copy_from_user(&features, featurep, sizeof features))
> >                         return -EFAULT;
> > -               if (features & ~vhost_net_features[0])
> > +               if (features & ~VHOST_FEATURES_U64(vhost_net_features, 0))
> >                         return -EOPNOTSUPP;
> >
> >                 virtio_features_from_u64(all_features, features);
> > @@ -1753,9 +1753,13 @@ static long vhost_net_ioctl(struct file *f, unsigned int ioctl,
> >                 /* Copy the net features, up to the user-provided buffer size */
> >                 argp += sizeof(u64);
> >                 copied = min(count, (u64)VIRTIO_FEATURES_U64S);
> > -               if (copy_to_user(argp, vhost_net_features,
> > -                                copied * sizeof(u64)))
> > -                       return -EFAULT;
> > +
> > +               {
> > +                       const DEFINE_VHOST_FEATURES_ARRAY(features, vhost_net_features);
> > +
> > +                       if (copy_to_user(argp, features, copied * sizeof(u64)))
> > +                               return -EFAULT;
> > +               }
> 
> Any reason to use a standalone block here?

Just so we can name the variable "features", as well as
having the declaration stand out a bit more.


> >
> >                 /* Zero the trailing space provided by user-space, if any */
> >                 if (clear_user(argp, size_mul(count - copied, sizeof(u64))))
> > @@ -1784,7 +1788,7 @@ static long vhost_net_ioctl(struct file *f, unsigned int ioctl,
> >                 }
> >
> >                 for (i = 0; i < VIRTIO_FEATURES_U64S; i++)
> > -                       if (all_features[i] & ~vhost_net_features[i])
> > +                       if (all_features[i] & ~VHOST_FEATURES_U64(vhost_net_features, i))
> >                                 return -EOPNOTSUPP;
> >
> >                 return vhost_net_set_features(n, all_features);
> > diff --git a/drivers/vhost/scsi.c b/drivers/vhost/scsi.c
> > index 98e4f68f4e3c..04fcbe7efd77 100644
> > --- a/drivers/vhost/scsi.c
> > +++ b/drivers/vhost/scsi.c
> > @@ -197,11 +197,14 @@ enum {
> >  };
> >
> >  /* Note: can't set VIRTIO_F_VERSION_1 yet, since that implies ANY_LAYOUT. */
> > -enum {
> > -       VHOST_SCSI_FEATURES = VHOST_FEATURES | (1ULL << VIRTIO_SCSI_F_HOTPLUG) |
> > -                                              (1ULL << VIRTIO_SCSI_F_T10_PI)
> > +static const int vhost_scsi_features[] = {
> > +       VHOST_FEATURES,
> > +       VIRTIO_SCSI_F_HOTPLUG,
> > +       VIRTIO_SCSI_F_T10_PI
> >  };
> >
> > +#define VHOST_SCSI_FEATURES VHOST_FEATURES_U64(vhost_scsi_features, 0)
> > +
> >  #define VHOST_SCSI_MAX_TARGET  256
> >  #define VHOST_SCSI_MAX_IO_VQ   1024
> >  #define VHOST_SCSI_MAX_EVENT   128
> > diff --git a/drivers/vhost/test.c b/drivers/vhost/test.c
> > index 42c955a5b211..af727fccfe40 100644
> > --- a/drivers/vhost/test.c
> > +++ b/drivers/vhost/test.c
> > @@ -308,6 +308,12 @@ static long vhost_test_set_backend(struct vhost_test *n, unsigned index, int fd)
> >         return r;
> >  }
> >
> > +static const int vhost_test_features[] = {
> > +       VHOST_FEATURES
> > +};
> > +
> > +#define VHOST_TEST_FEATURES VHOST_FEATURES_U64(vhost_test_features, 0)
> > +
> >  static long vhost_test_ioctl(struct file *f, unsigned int ioctl,
> >                              unsigned long arg)
> >  {
> > @@ -328,14 +334,14 @@ static long vhost_test_ioctl(struct file *f, unsigned int ioctl,
> >                         return -EFAULT;
> >                 return vhost_test_set_backend(n, backend.index, backend.fd);
> >         case VHOST_GET_FEATURES:
> > -               features = VHOST_FEATURES;
> > +               features = VHOST_TEST_FEATURES;
> >                 if (copy_to_user(featurep, &features, sizeof features))
> >                         return -EFAULT;
> >                 return 0;
> >         case VHOST_SET_FEATURES:
> >                 if (copy_from_user(&features, featurep, sizeof features))
> >                         return -EFAULT;
> > -               if (features & ~VHOST_FEATURES)
> > +               if (features & ~VHOST_TEST_FEATURES)
> >                         return -EOPNOTSUPP;
> >                 return vhost_test_set_features(n, features);
> >         case VHOST_RESET_OWNER:
> > diff --git a/drivers/vhost/vhost.h b/drivers/vhost/vhost.h
> > index 621a6d9a8791..d8f1af9a0ff1 100644
> > --- a/drivers/vhost/vhost.h
> > +++ b/drivers/vhost/vhost.h
> > @@ -14,6 +14,7 @@
> >  #include <linux/atomic.h>
> >  #include <linux/vhost_iotlb.h>
> >  #include <linux/irqbypass.h>
> > +#include <linux/unroll.h>
> >
> >  struct vhost_work;
> >  struct vhost_task;
> > @@ -279,14 +280,39 @@ void vhost_iotlb_map_free(struct vhost_iotlb *iotlb,
> >                                 eventfd_signal((vq)->error_ctx);\
> >         } while (0)
> >
> > -enum {
> > -       VHOST_FEATURES = (1ULL << VIRTIO_F_NOTIFY_ON_EMPTY) |
> > -                        (1ULL << VIRTIO_RING_F_INDIRECT_DESC) |
> > -                        (1ULL << VIRTIO_RING_F_EVENT_IDX) |
> > -                        (1ULL << VHOST_F_LOG_ALL) |
> > -                        (1ULL << VIRTIO_F_ANY_LAYOUT) |
> > -                        (1ULL << VIRTIO_F_VERSION_1)
> > -};
> > +#define VHOST_FEATURES \
> > +       VIRTIO_F_NOTIFY_ON_EMPTY, \
> > +       VIRTIO_RING_F_INDIRECT_DESC, \
> > +       VIRTIO_RING_F_EVENT_IDX, \
> > +       VHOST_F_LOG_ALL, \
> > +       VIRTIO_F_ANY_LAYOUT, \
> > +       VIRTIO_F_VERSION_1
> > +
> > +static inline u64 vhost_features_u64(const int *features, int size, int idx)
> > +{
> > +       unsigned long res = 0;
> 
> Should this be u64?

Ugh. Yes.

> > +
> > +       unrolled_count(VIRTIO_FEATURES_BITS)
> > +       for (int i = 0; i < size; ++i) {
> > +               int bit = features[i];
> > +
> > +               if (virtio_features_chk_bit(bit) && VIRTIO_U64(bit) == idx)
> > +                       res |= VIRTIO_BIT(bit);
> > +       }
> > +       return res;
> > +}
> > +
> > +#define VHOST_FEATURES_U64(features, idx) \
> > +       vhost_features_u64(features, ARRAY_SIZE(features), idx)
> > +
> > +#define DEFINE_VHOST_FEATURES_ARRAY_ENTRY(idx, features) \
> > +       [idx] = VHOST_FEATURES_U64(features, idx),
> > +
> > +#define DEFINE_VHOST_FEATURES_ARRAY(array, features) \
> > +       u64 array[VIRTIO_FEATURES_U64S] = { \
> > +               UNROLL(VIRTIO_FEATURES_U64S, \
> > +                      DEFINE_VHOST_FEATURES_ARRAY_ENTRY, features) \
> > +       }
> >
> >  /**
> >   * vhost_vq_set_backend - Set backend.
> > diff --git a/drivers/vhost/vsock.c b/drivers/vhost/vsock.c
> > index ae01457ea2cd..16662f2b87c1 100644
> > --- a/drivers/vhost/vsock.c
> > +++ b/drivers/vhost/vsock.c
> > @@ -29,12 +29,14 @@
> >   */
> >  #define VHOST_VSOCK_PKT_WEIGHT 256
> >
> > -enum {
> > -       VHOST_VSOCK_FEATURES = VHOST_FEATURES |
> > -                              (1ULL << VIRTIO_F_ACCESS_PLATFORM) |
> > -                              (1ULL << VIRTIO_VSOCK_F_SEQPACKET)
> > +static const int vhost_vsock_features[] = {
> > +       VHOST_FEATURES,
> > +       VIRTIO_F_ACCESS_PLATFORM,
> > +       VIRTIO_VSOCK_F_SEQPACKET
> >  };
> >
> > +#define VHOST_VSOCK_FEATURES VHOST_FEATURES_U64(vhost_vsock_features, 0)
> > +
> >  enum {
> >         VHOST_VSOCK_BACKEND_FEATURES = (1ULL << VHOST_BACKEND_F_IOTLB_MSG_V2)
> >  };
> > --
> > MST
> >
> 
> Thanks

