Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74704450FE
	for <linux-doc@vger.kernel.org>; Tue, 11 Mar 2025 00:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741653752; cv=none; b=EvQY8+rVVXQ+h77OZe1KXMhR+mMY5aHMqkw3HuNetI/ysXZw3wvimjijWpROWfElsV3XRTibsK1/c8t3OQbPXSOBTodgyFwqwDDcVNizdQ/CXWzjJf+vVxDNKpm/Z8vePkjVzJvwwmEAgWQbA2Wh01CrhMiqyAjM4TdyHYVaN5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741653752; c=relaxed/simple;
	bh=mDO9x/sNKaSh6VKq6BR9qetuUOFySZaiPD1KWPXFKso=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OZQHvVVjF6qQKFgK1YCI6HzxleERlSwKAhm0zQJfKSIX5m8hMwylWcshauPp39GJB9lx95JGBEf5q77KadYe4c7cYvSRuRJ6+Wvc0xYhWEdY6j0wYYfgKkMgeabjsUpuvhjs85nAtTPycKnpZRYPYzg3h/+mhMjdm3fyw2YPXEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XGLqMHUx; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XGLqMHUx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741653749;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=847bTrI9x3dTQBNL5SAKMbZJ6bNHhxo9NrLY7aN1zMI=;
	b=XGLqMHUxKrhj06LIU2B1cbsBVpi/AFR8VmwbYV5v+0hL6wVpeh4B3cR86OxN6G+ks5u+KS
	LHJ51LIEQ2nKOK5PvkbSS/4gxdRsotegKANqYpq1LDxcscRBUvEOreGIjC5adHkn0IXvfV
	n62+XhhydV+sbsQdKFZGqFhyTq4wl7k=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-511-1WwcxHqYNY2zc-XXORbIrw-1; Mon, 10 Mar 2025 20:42:27 -0400
X-MC-Unique: 1WwcxHqYNY2zc-XXORbIrw-1
X-Mimecast-MFC-AGG-ID: 1WwcxHqYNY2zc-XXORbIrw_1741653746
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2ff7cf599beso6886179a91.0
        for <linux-doc@vger.kernel.org>; Mon, 10 Mar 2025 17:42:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741653746; x=1742258546;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=847bTrI9x3dTQBNL5SAKMbZJ6bNHhxo9NrLY7aN1zMI=;
        b=EuTLOnaAD+eRWc9LGlEiC/L0yT32iSsovOE9s80Zm8C1bOTb/T4r1eVsbpZX/I/EoN
         GX4OYiQcDfwg3KBQNhpaCz0s+OhDnIBOeRUQvFSiho9Re4x0lXqWbqH88bATgJTVcHTd
         8Chuwa5TYct3OYQFx0KxBRjGdpokJJd1ifrauo2uUcRgXbYs3CbphUOmfLep5y4n2ylY
         jI/SMNEoZC8ASSe/mwJLmFSI0pSm5esq4lHbhVF4QhsbO4wMcwVvsP93ag+IS5SMAj0e
         /jzhQTSG9NHk9ihhxO2XqqDKHdo4BcD3jafbRrCzXLzV216QMciChkyPoh60KzwonMpJ
         DYeQ==
X-Forwarded-Encrypted: i=1; AJvYcCXp/I9rMaGDNWjWKIhp3EwbUOWefGlbp1umeRscgnY7ionOF/27D9awPHYtydacHgbzpwobvraLvUQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs3+jkd48uLu4Nqv3ENcHQODZpfFd1gjkv/gv1hvp1yw7Bq56Z
	g89IIJFKDZNCnhW+rAmgs/xLtH7Kip+SJdsCZzp8ubh7xAmGJLhznr75ss8Q1guNsZUDIExB5B0
	JQ5kNE1D5Dc1w68mGl9L1aoCq55shIKGemo/ss1AJCxWSg+mITNMwLxIwZa9l96YV822b8d6dKa
	Pk8DPIUnC0bXb+go4H9/rBiWD5+o0sM3yF
X-Gm-Gg: ASbGncu4RNSyAHlSbYMtBcqLst0kAyBemp02iR6cMl1VpGLe30GgKCj7DYZB8DVlABy
	T3bLmech+GkCiFHsEMD8b03vCdjPHRy/cz6tUMZXKjKYuvAmTsmqc8BzpHoArNJcN+pbQag==
X-Received: by 2002:a17:90b:1f8c:b0:2ff:698d:ef7c with SMTP id 98e67ed59e1d1-300ff3701e6mr2209779a91.29.1741653746480;
        Mon, 10 Mar 2025 17:42:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbDtyJiENvXOe613oqH0vAWN8hUrOgIBvwTgQjpWafbqSKNzh+whVUzZLm1l+kq/H8WuSWlOotAIb4Chd6SFM=
X-Received: by 2002:a17:90b:1f8c:b0:2ff:698d:ef7c with SMTP id
 98e67ed59e1d1-300ff3701e6mr2209768a91.29.1741653746073; Mon, 10 Mar 2025
 17:42:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250307-rss-v9-0-df76624025eb@daynix.com> <20250307-rss-v9-6-df76624025eb@daynix.com>
 <CACGkMEuccQ6ah-aZ3tcW1VRuetEoPA_NaLxLT+9fb0uAab8Agg@mail.gmail.com> <2e550452-a716-4c3f-9d5a-3882d2c9912a@daynix.com>
In-Reply-To: <2e550452-a716-4c3f-9d5a-3882d2c9912a@daynix.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 11 Mar 2025 08:42:13 +0800
X-Gm-Features: AQ5f1Jr7Qnv1FpSExilgR3dbxXrVBsVK1HLZstm0K3Mj08GcyKcVawpejY0cXIk
Message-ID: <CACGkMEu9tynRgTh__3p_vSqOekSirbVgS90rd5dUiJru9oV1eg@mail.gmail.com>
Subject: Re: [PATCH net-next v9 6/6] vhost/net: Support VIRTIO_NET_F_HASH_REPORT
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	Shuah Khan <shuah@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, kvm@vger.kernel.org, 
	virtualization@lists.linux-foundation.org, linux-kselftest@vger.kernel.org, 
	Yuri Benditovich <yuri.benditovich@daynix.com>, Andrew Melnychenko <andrew@daynix.com>, 
	Stephen Hemminger <stephen@networkplumber.org>, gur.stavi@huawei.com, 
	Lei Yang <leiyang@redhat.com>, Simon Horman <horms@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 10, 2025 at 3:04=E2=80=AFPM Akihiko Odaki <akihiko.odaki@daynix=
.com> wrote:
>
> On 2025/03/10 13:43, Jason Wang wrote:
> > On Fri, Mar 7, 2025 at 7:02=E2=80=AFPM Akihiko Odaki <akihiko.odaki@day=
nix.com> wrote:
> >>
> >> VIRTIO_NET_F_HASH_REPORT allows to report hash values calculated on th=
e
> >> host. When VHOST_NET_F_VIRTIO_NET_HDR is employed, it will report no
> >> hash values (i.e., the hash_report member is always set to
> >> VIRTIO_NET_HASH_REPORT_NONE). Otherwise, the values reported by the
> >> underlying socket will be reported.
> >>
> >> VIRTIO_NET_F_HASH_REPORT requires VIRTIO_F_VERSION_1.
> >>
> >> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> >> Tested-by: Lei Yang <leiyang@redhat.com>
> >> ---
> >>   drivers/vhost/net.c | 49 +++++++++++++++++++++++++++++--------------=
------
> >>   1 file changed, 29 insertions(+), 20 deletions(-)
> >>
> >> diff --git a/drivers/vhost/net.c b/drivers/vhost/net.c
> >> index b9b9e9d40951856d881d77ac74331d914473cd56..16b241b44f89820a42c302=
f3586ea6bb5e0d4289 100644
> >> --- a/drivers/vhost/net.c
> >> +++ b/drivers/vhost/net.c
> >> @@ -73,6 +73,7 @@ enum {
> >>          VHOST_NET_FEATURES =3D VHOST_FEATURES |
> >>                           (1ULL << VHOST_NET_F_VIRTIO_NET_HDR) |
> >>                           (1ULL << VIRTIO_NET_F_MRG_RXBUF) |
> >> +                        (1ULL << VIRTIO_NET_F_HASH_REPORT) |
> >>                           (1ULL << VIRTIO_F_ACCESS_PLATFORM) |
> >>                           (1ULL << VIRTIO_F_RING_RESET)
> >>   };
> >> @@ -1097,9 +1098,11 @@ static void handle_rx(struct vhost_net *net)
> >>                  .msg_controllen =3D 0,
> >>                  .msg_flags =3D MSG_DONTWAIT,
> >>          };
> >> -       struct virtio_net_hdr hdr =3D {
> >> -               .flags =3D 0,
> >> -               .gso_type =3D VIRTIO_NET_HDR_GSO_NONE
> >> +       struct virtio_net_hdr_v1_hash hdr =3D {
> >> +               .hdr =3D {
> >> +                       .flags =3D 0,
> >> +                       .gso_type =3D VIRTIO_NET_HDR_GSO_NONE
> >> +               }
> >>          };
> >>          size_t total_len =3D 0;
> >>          int err, mergeable;
> >> @@ -1110,7 +1113,6 @@ static void handle_rx(struct vhost_net *net)
> >>          bool set_num_buffers;
> >>          struct socket *sock;
> >>          struct iov_iter fixup;
> >> -       __virtio16 num_buffers;
> >>          int recv_pkts =3D 0;
> >>
> >>          mutex_lock_nested(&vq->mutex, VHOST_NET_VQ_RX);
> >> @@ -1191,30 +1193,30 @@ static void handle_rx(struct vhost_net *net)
> >>                          vhost_discard_vq_desc(vq, headcount);
> >>                          continue;
> >>                  }
> >> +               hdr.hdr.num_buffers =3D cpu_to_vhost16(vq, headcount);
> >>                  /* Supply virtio_net_hdr if VHOST_NET_F_VIRTIO_NET_HD=
R */
> >>                  if (unlikely(vhost_hlen)) {
> >> -                       if (copy_to_iter(&hdr, sizeof(hdr),
> >> -                                        &fixup) !=3D sizeof(hdr)) {
> >> +                       if (copy_to_iter(&hdr, vhost_hlen,
> >> +                                        &fixup) !=3D vhost_hlen) {
> >>                                  vq_err(vq, "Unable to write vnet_hdr =
"
> >>                                         "at addr %p\n", vq->iov->iov_b=
ase);
> >>                                  goto out;
> >
> > Is this an "issue" specific to RSS/HASH? If it's not, we need a separat=
e patch.
> >
> > Honestly, I'm not sure if it's too late to fix this.
>
> There is nothing wrong with the current implementation.

Note that I meant the vhost_hlen part, and the current code is tricky.

The comment said:

"""
/* Supply virtio_net_hdr if VHOST_NET_F_VIRTIO_NET_HDR */
"""

So it tries to only offer virtio_net_hdr even if vhost_hlen is the set
to mrg_rxbuf len.

And this patch changes this behaviour.

Thanks

> The current
> implementation fills the header with zero except num_buffers, which it
> fills some real value. This functionality is working fine with
> VIRTIO_NET_F_MRG_RXBUF and VIRTIO_F_VERSION_1, which change the header si=
ze.
>
> Now I'm adding VIRTIO_NET_F_HASH_REPORT and it adds the hash_report
> field, which also needs to be initialized with zero, so I'm making sure
> vhost_net will also initialize it.
>
> Regards,
> Akihiko Odaki
>
> >
> > Others look fine.
> >
> > Thanks
> >
>

