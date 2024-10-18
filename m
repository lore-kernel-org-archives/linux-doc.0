Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDBEB17BB25
	for <linux-doc@vger.kernel.org>; Fri, 18 Oct 2024 08:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729239330; cv=none; b=p0IfV0qNgP5mcIxDVXm4Nzuz7rKHaTaHeXo6dXomoHeUb8KdpajszWm9aQLDopVv3HVji4mfaTz5jXAWz6tc5R6eZmTvnflMXV+b+hM9lszgRVRbssr5oRDSyuYee69ulmoXkaII7u+NpysOWFCb+ZcGCY4B3cix1bpQA6Rgsd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729239330; c=relaxed/simple;
	bh=RyCuiX7Z7beQNgjkYjzS1E6I9EFHABI+uLFOdorHDUA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=REATReWz1SjdFQl2w+Sl9/3tTYWcDSlTOLcQnhbzWEcUM7tyofjr8/uAopvkadAebgVNIdG1Z7eVhrjsW2vyuKTzqyBR54PDihXpymPPrfLsmRkAtD8fcJ+iG5uGf2bR8Bq6q65EK2XNwZvu2wsQWPiozWB8cJfgQoCEMItS5IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LNeddTMH; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LNeddTMH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729239326;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yr2YuJLh1oBlVb3LAJ7sYOHk9wkq05eBctRIWz59ZDw=;
	b=LNeddTMH8AlEWYJBJR6TdYyS31gX1hZoA0dU3PXI4KA1Zq127bA1bepsU/kJ1uukFAeUzo
	ibTjBKCgQYEhDhu1B1yhW/zLc7/8Iua9Z2/hD6eqkHdQGrm9T3pjdCtdZEiUfy4hyY5Dsg
	EbroMNA6cxm6ZCUgt9XoaX1P/O9kfwE=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-39-jC_i_SyKPDS94m0eNNTXVQ-1; Fri, 18 Oct 2024 04:15:25 -0400
X-MC-Unique: jC_i_SyKPDS94m0eNNTXVQ-1
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-5e4df21f22dso1721020a12.0
        for <linux-doc@vger.kernel.org>; Fri, 18 Oct 2024 01:15:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729239324; x=1729844124;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yr2YuJLh1oBlVb3LAJ7sYOHk9wkq05eBctRIWz59ZDw=;
        b=qJ4rs95PaESujx7NE7MS5x4BiyuN+nJqKweeaOa+2rHfB4ppDCnCZC4ttmgtbLlgS1
         +yq3MxzOvELS6G3f1e2WKLKYUN16o6chxsueGUuiLNS2oawKe3Qi/F5oXvecqSWQ5t0B
         VqV+rLegvlsJmxYLZ8g1001MY9Bf7Q3yVUCckDyI8e4ZVVzXkBVvOWg+/uRPZvg28bJ7
         7q5/pgsQUpsPyreVBqyVMW8GnrOyYT8P/fZNwS4sIntl8Wa+DLKbvtLgXy4S1BgYMH35
         X8gZ9QDHWb4DmUpkur8Mw8q5cmkDh8djVw37I0rOjf+hA84Fh4VqBoUV+TL1xhirSEfb
         UBHA==
X-Forwarded-Encrypted: i=1; AJvYcCWllVlSGLm2c/ZL42NGE8VsQ/hGbiDnJyDDhcbtW8IOjwMPYwiwHGc3/J2bYswOJfQUqEJuDJ5ydhc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrfjHCnU4lyee62eAj3wJLKlq38TNAJ8EzGGgGC962lX4dTU9s
	DOy0fOs7vBtAvlZy9x6ft0SxH1NIJKg6yXQCo1mA5+4lcO5Hq/2v0/luLLXF+Gfc8x2b8rC9+LJ
	W/hCAwvlR2XfmvaddFjECdTu230y9zVjkznkHd6UHT8Md/MBUbJZ3XSAsy7nKng1Q0j+2Y/6Lvc
	wVSpti3/4I+RkrIResPfw4/4tFC0qRzPUG
X-Received: by 2002:a05:6a21:178a:b0:1d8:aa1d:b30c with SMTP id adf61e73a8af0-1d92c9f8becmr2035166637.1.1729239324401;
        Fri, 18 Oct 2024 01:15:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGLD3LtPmdn3YgZFunCmr4YCke9ZeVKhkDNBtOgm6i/o4DVa5u2WpwUUag2e6tVVnOKvDE1CSmiKahP3Ex3VII=
X-Received: by 2002:a05:6a21:178a:b0:1d8:aa1d:b30c with SMTP id
 adf61e73a8af0-1d92c9f8becmr2035126637.1.1729239323920; Fri, 18 Oct 2024
 01:15:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008-rss-v5-0-f3cf68df005d@daynix.com> <20241008-rss-v5-7-f3cf68df005d@daynix.com>
 <CACGkMEsPNTr3zcstsQGoOiQdCFQ+6EG6cSGiZzNxONsH9Xm=Aw@mail.gmail.com> <4bc7dfaa-a7cd-41f4-a917-e71b5c7241f7@daynix.com>
In-Reply-To: <4bc7dfaa-a7cd-41f4-a917-e71b5c7241f7@daynix.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 18 Oct 2024 16:15:12 +0800
Message-ID: <CACGkMEtt7a4+gadQt2=3zz+MCUtueuWj+zwaHR_gXCvLg=0PcQ@mail.gmail.com>
Subject: Re: [PATCH RFC v5 07/10] tun: Introduce virtio-net RSS
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	Shuah Khan <shuah@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, kvm@vger.kernel.org, 
	virtualization@lists.linux-foundation.org, linux-kselftest@vger.kernel.org, 
	Yuri Benditovich <yuri.benditovich@daynix.com>, Andrew Melnychenko <andrew@daynix.com>, 
	Stephen Hemminger <stephen@networkplumber.org>, gur.stavi@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 12, 2024 at 6:29=E2=80=AFPM Akihiko Odaki <akihiko.odaki@daynix=
.com> wrote:
>
> On 2024/10/09 17:14, Jason Wang wrote:
> > On Tue, Oct 8, 2024 at 2:55=E2=80=AFPM Akihiko Odaki <akihiko.odaki@day=
nix.com> wrote:
> >>
> >> RSS is a receive steering algorithm that can be negotiated to use with
> >> virtio_net. Conventionally the hash calculation was done by the VMM.
> >> However, computing the hash after the queue was chosen defeats the
> >> purpose of RSS.
> >>
> >> Another approach is to use eBPF steering program. This approach has
> >> another downside: it cannot report the calculated hash due to the
> >> restrictive nature of eBPF steering program.
> >>
> >> Introduce the code to perform RSS to the kernel in order to overcome
> >> thse challenges. An alternative solution is to extend the eBPF steerin=
g
> >> program so that it will be able to report to the userspace, but I didn=
't
> >> opt for it because extending the current mechanism of eBPF steering
> >> program as is because it relies on legacy context rewriting, and
> >> introducing kfunc-based eBPF will result in non-UAPI dependency while
> >> the other relevant virtualization APIs such as KVM and vhost_net are
> >> UAPIs.
> >>
> >> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> >> ---
> >>   drivers/net/tap.c           | 11 +++++-
> >>   drivers/net/tun.c           | 57 ++++++++++++++++++++-------
> >>   drivers/net/tun_vnet.h      | 96 +++++++++++++++++++++++++++++++++++=
++++++----
> >>   include/linux/if_tap.h      |  4 +-
> >>   include/uapi/linux/if_tun.h | 27 +++++++++++++
> >>   5 files changed, 169 insertions(+), 26 deletions(-)
> >>

[...]

> >> diff --git a/include/uapi/linux/if_tun.h b/include/uapi/linux/if_tun.h
> >> index d11e79b4e0dc..4887f97500a8 100644
> >> --- a/include/uapi/linux/if_tun.h
> >> +++ b/include/uapi/linux/if_tun.h
> >> @@ -75,6 +75,14 @@
> >>    *
> >>    * The argument is a pointer to &struct tun_vnet_hash.
> >>    *
> >> + * The argument is a pointer to the compound of the following in orde=
r if
> >> + * %TUN_VNET_HASH_RSS is set:
> >> + *
> >> + * 1. &struct tun_vnet_hash
> >> + * 2. &struct tun_vnet_hash_rss
> >> + * 3. Indirection table
> >> + * 4. Key
> >> + *
> >
> > Let's try not modify uAPI. We can introduce new ioctl if necessary.
>
> 2, 3, and 4 are new additions. Adding a separate ioctl for them means we
> need to call two ioctls to configure RSS and it is hard to design the
> interactions with them.
>
> For example, if we set TUN_VNET_HASH_RSS with TUNSETVNETHASH before
> setting struct tun_vnet_hash_rss with another ioctl, tuntap will enable
> RSS with undefined parameters. Setting struct tun_vnet_hash_rss with
> TUN_VNET_HASH_RSS unset also sounds unreasnoable.
>
> Letting the new ioctl set TUN_VNET_HASH_RSS does not help either.
> TUNSETVNETHASH still sets the bitmask of allowed hash types so RSS will
> depend on two ioctls.

I meant let's avoid introducing an ioctl with function 1 in one patch,
and adding 2,3,4 in exactly the same ioctl in the following. It breaks
the uABI consistency and bisection.

We can add all in one patch.

Thanks

