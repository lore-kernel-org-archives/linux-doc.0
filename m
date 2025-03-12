Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A2F433AD
	for <linux-doc@vger.kernel.org>; Wed, 12 Mar 2025 03:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741748412; cv=none; b=ejmZd9kv8lgi0UE17bgu6zHUzmpog+V3WxE4FDc1H91o74V2B+eyhMQJWYuOBZ2IrNnyInnQJlJ3ZK2pc0ATnTzxNhua3Zy99oRnQgFdeH2GTTSjCg6YmacKA46nkAdIKkpqs2SAd4Uu3xDvPTMnyvs8a3xVLOClYmsL5LxlQzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741748412; c=relaxed/simple;
	bh=uh729120lBrgt14eq8/qws4JD1PfEtETFf5h4dUiehI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BHeQp344m1q0rpNC/WlYo9S173hbFAvegnuI6H0TLK4+S0Ettj28sG/2R3Uarbhp8MnIGEW3j1S/5COzVlsXiHNiOCVT2aesK08xo6u7u6udnx5/r3ObvWwUKz7PJ6Hjx0YA25zyklJK/oYvYVTKLLjxx3GbPsG40K7LZ+erUHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Mp4Fz3tb; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Mp4Fz3tb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741748409;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FPO7R0eIW5tnFxhT73UA9jvPdIiqGpsDvnFvTsNRiiU=;
	b=Mp4Fz3tbxJiZMvsD6hfvpeFdwo03iVMThCe0yJP/vcVlrLwFNIN98Qu4OGgENceB6CjewT
	nesvGG4rg58Rx4kUh8gDN7Y0lEUgmhDEzwGkbnG9semiqNCfiEcf5sUyqtQ7ezvqfAuujJ
	j+X1sSZAAIzBvsITJ/nABwjTKXd7xSA=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-230-BprRD1ufMKCzKjvERiTP8g-1; Tue, 11 Mar 2025 23:00:08 -0400
X-MC-Unique: BprRD1ufMKCzKjvERiTP8g-1
X-Mimecast-MFC-AGG-ID: BprRD1ufMKCzKjvERiTP8g_1741748407
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2feb47c6757so9881277a91.3
        for <linux-doc@vger.kernel.org>; Tue, 11 Mar 2025 20:00:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741748407; x=1742353207;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FPO7R0eIW5tnFxhT73UA9jvPdIiqGpsDvnFvTsNRiiU=;
        b=L1FPYbvr5Xlbg+wesoRn/DnGk5o7Jnf1lbsiDkvAVHsntsCgQ0zmSNBYlz7rFqh+KR
         TVUMkwQ2VrAiTzAtSUfCeK1cj2SJFfLb9P5Syj+Z3LYemexVmkrJQ3Hn4QRCWeqjtUKZ
         bqGTEPfvn5G786TEjVEenXtDjEOGOeMXMwsDyi/XIXWuH0/d2NsWfX7HS+Z9jjOkufZj
         x/ksq97w2MiPfbJRMAf7CuwztYCvKtKfR+kODLH70spXWoLI36pQNS9J/6g5d/MRXl8C
         kGdIHD3ZHxl7Y1TMpJ1a4RdXw/Ya8sQfMij6/0kqBT151cy5l8qIb1oPNm9jiVK0DqJi
         gvoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPltYrX+Ech5upCJBXjdbCjq4zWvXVZysd5AoTmoquvYhMv3h+s+zsZILdMRGqF5UHoANwEzuzS5o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqxqkYA8+caTksk8/UO5GRcb6mf4YBMe+Txia+mvoVhZAH+DJG
	/xFl/j4eI0F00v2ZVdZM3zfudnBErN2cqGT1aRuc/6Ie7UoxWZbapn8vQwsjrDvnmyGp1KDl9tz
	8lvHbqLlODZTXRbWs8ru7WZIx+yKovZm7f1SdFpSd0371gAsoeyeHQUiWxyu4Qj2xuZpD+Tmho2
	UkiVp5/9LEZ2oJEzLj6u6ar2zIVfOSR0LY
X-Gm-Gg: ASbGncuTVTM9jvZiFTIwJFSfCr0eT94D1ZdBXTGXbwQXCIfEUK6RFCprUpNhUGZaNYr
	K7B1Gz9jKOXhyQ8vFRYlr69CeAolOOm3AoggOgv+1POgFhMEEbkp/0Z1T7aWpWR+H5yYqlg==
X-Received: by 2002:a17:90b:35c6:b0:2ff:4bac:6fa2 with SMTP id 98e67ed59e1d1-300ff100782mr8803705a91.16.1741748407253;
        Tue, 11 Mar 2025 20:00:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IET6lsV/yTA4z+MP1noXOIunYsp3qN8L1Z8eiyVimjBwI0oZIPPsINtQsWF9heOMDn6TbEv142XFxBfq24rdok=
X-Received: by 2002:a17:90b:35c6:b0:2ff:4bac:6fa2 with SMTP id
 98e67ed59e1d1-300ff100782mr8803670a91.16.1741748406897; Tue, 11 Mar 2025
 20:00:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250307-rss-v9-0-df76624025eb@daynix.com> <20250307-rss-v9-3-df76624025eb@daynix.com>
 <CACGkMEsNHba=PY5UQoH1zdGQRiHC8FugMG1nkXqOj1TBdOQrww@mail.gmail.com>
 <7978dfd5-8499-44f3-9c30-e53a01449281@daynix.com> <CACGkMEsR4_RreDbYQSEk5Cr29_26WNUYheWCQBjyMNUn=1eS2Q@mail.gmail.com>
 <5e67a0a6-f613-4b0a-b64e-67f649e45c3e@daynix.com>
In-Reply-To: <5e67a0a6-f613-4b0a-b64e-67f649e45c3e@daynix.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 12 Mar 2025 10:59:51 +0800
X-Gm-Features: AQ5f1JqQKEMLpBM7U-YYsZ15IkMLY-FYatkHcqLxAc5jqhv4juthUfs4s77Xshk
Message-ID: <CACGkMEv83iR0vU00XGOGonL1fkd=K1b-shCcNb1K8yJ9O+0BDQ@mail.gmail.com>
Subject: Re: [PATCH net-next v9 3/6] tun: Introduce virtio-net hash feature
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

On Tue, Mar 11, 2025 at 2:17=E2=80=AFPM Akihiko Odaki <akihiko.odaki@daynix=
.com> wrote:
>
> On 2025/03/11 9:38, Jason Wang wrote:
> > On Mon, Mar 10, 2025 at 3:45=E2=80=AFPM Akihiko Odaki <akihiko.odaki@da=
ynix.com> wrote:
> >>
> >> On 2025/03/10 12:55, Jason Wang wrote:
> >>> On Fri, Mar 7, 2025 at 7:01=E2=80=AFPM Akihiko Odaki <akihiko.odaki@d=
aynix.com> wrote:
> >>>>
> >>>> Hash reporting
> >>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>>>
> >>>> Allow the guest to reuse the hash value to make receive steering
> >>>> consistent between the host and guest, and to save hash computation.
> >>>>
> >>>> RSS
> >>>> =3D=3D=3D
> >>>>
> >>>> RSS is a receive steering algorithm that can be negotiated to use wi=
th
> >>>> virtio_net. Conventionally the hash calculation was done by the VMM.
> >>>> However, computing the hash after the queue was chosen defeats the
> >>>> purpose of RSS.
> >>>>
> >>>> Another approach is to use eBPF steering program. This approach has
> >>>> another downside: it cannot report the calculated hash due to the
> >>>> restrictive nature of eBPF steering program.
> >>>>
> >>>> Introduce the code to perform RSS to the kernel in order to overcome
> >>>> thse challenges. An alternative solution is to extend the eBPF steer=
ing
> >>>> program so that it will be able to report to the userspace, but I di=
dn't
> >>>> opt for it because extending the current mechanism of eBPF steering
> >>>> program as is because it relies on legacy context rewriting, and
> >>>> introducing kfunc-based eBPF will result in non-UAPI dependency whil=
e
> >>>> the other relevant virtualization APIs such as KVM and vhost_net are
> >>>> UAPIs.
> >>>>
> >>>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> >>>> Tested-by: Lei Yang <leiyang@redhat.com>
> >>>> ---
> >>>>    Documentation/networking/tuntap.rst |   7 ++
> >>>>    drivers/net/Kconfig                 |   1 +
> >>>>    drivers/net/tap.c                   |  68 ++++++++++++++-
> >>>>    drivers/net/tun.c                   |  98 +++++++++++++++++-----
> >>>>    drivers/net/tun_vnet.h              | 159 +++++++++++++++++++++++=
+++++++++++--
> >>>>    include/linux/if_tap.h              |   2 +
> >>>>    include/linux/skbuff.h              |   3 +
> >>>>    include/uapi/linux/if_tun.h         |  75 +++++++++++++++++
> >>>>    net/core/skbuff.c                   |   4 +
> >>>>    9 files changed, 386 insertions(+), 31 deletions(-)
> >>>>

[...]

> >>> Let's has a consistent name for this and the uapi to be consistent
> >>> with TUNSETIFF/TUNGETIFF. Probably TUNSETVNETHASH and
> >>> tun_vnet_ioctl_gethash().
> >>
> >> They have different semantics so they should have different names.
> >> TUNGETIFF reports the value currently set while TUNGETVNETHASHCAP
> >> reports the value that can be set later.
> >
> > I'm not sure I will get here. I meant a symmetric name
> >
> > TUNSETVNETHASH and TUNVETVNETHASH.
>
> TUNGETVNETHASHCAP does not correspond to TUNGETIFF. The correspondence
> of ioctl names is as follows:
> TUNGETFEATURES - TUNGETVNETHASHCAP

TUNGETFEATURES returns the value set from TUNSETIFF. This differs from
TUNGETVNETHASHCAP semantic which just return the capabilities.

+static inline long tun_vnet_ioctl_gethashcap(void __user *argp)
+{
+       static const struct tun_vnet_hash cap =3D {
+               .flags =3D TUN_VNET_HASH_REPORT | TUN_VNET_HASH_RSS,
+               .types =3D VIRTIO_NET_SUPPORTED_HASH_TYPES
+       };
+
+       return copy_to_user(argp, &cap, sizeof(cap)) ? -EFAULT : 0;
+}

TUNGETFEATURES doesn't' help too much for non-persist TAP as userspace
knows what value it set before.

> TUNSETIFF - TUNSETVNETHASH
> TUNGETIFF - no corresponding ioctl for the virtio-net hash features

And this sounds odd and a hint for a incomplete uAPI as userspace
needs to know knowing what can set before doing TUNSETVNETHASH.

>
> Regards,
> Akihiko Odaki
>

Thanks

