Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B8F1C695
	for <linux-doc@vger.kernel.org>; Thu, 16 Jan 2025 01:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736989629; cv=none; b=qq1/vxKGLO2fLMR7nSeENBuf3gUMQbP2peOcmm4nHK7NCy2o9OHMYu3UmU250Yi18zmZjwuuYQ5bt/Z6zjt5+AIuQE5uyHoOaHpwgN6qHGTRrkNUUWPBpkuM0cSdLBbt3VLcOeJRYkRQEivw1vrbyyHkXBXVOw5zEHS0odbrZzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736989629; c=relaxed/simple;
	bh=wlj81as0MSR+2QoKMzymAk7Z0bJsw6YvCNC5UATgJPE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nD3HNAD8weVq/uFFNwgquO2np9CCKGIkE7k/pC0gbtZ1CEU0kyxHmBPc6o51eBdFxPlgn+qKlK0v/sYcPXUK7ncOQ9ACd7fJfFg9Uc8pPOPKuEszpKk6zW5zo5zhCekkW3qQzKxa6NXTRqE3+XC7x4kOZZ45KdLyegyKJuea6TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=c6CHozNQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c6CHozNQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736989626;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wlj81as0MSR+2QoKMzymAk7Z0bJsw6YvCNC5UATgJPE=;
	b=c6CHozNQ3cABqv47p2DRAo+iKhjcEiTi3qiXXVXXKYen1EdrTmiUi1sAL7QwNRmSUAKZSh
	Y2I8rq0ID7+E0VvwWzcITofTOIIqSHjRUrwhW6+DjmQrWPHu4yeo3knzOQHBLJQlEp2ERl
	eXxxFObz3HjTkjrT+g+V4cm+9X9rHWs=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-133-GMN3KEtzP7qkKd5y24elJg-1; Wed, 15 Jan 2025 20:07:05 -0500
X-MC-Unique: GMN3KEtzP7qkKd5y24elJg-1
X-Mimecast-MFC-AGG-ID: GMN3KEtzP7qkKd5y24elJg
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2ef9204f898so848037a91.2
        for <linux-doc@vger.kernel.org>; Wed, 15 Jan 2025 17:07:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736989624; x=1737594424;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wlj81as0MSR+2QoKMzymAk7Z0bJsw6YvCNC5UATgJPE=;
        b=rzfBHZ522cnIUNjEUTO5bsYsTUQTn9zNG2wR1nrTdVys+HhPqO2FQ5NadR9srH/mKS
         gm8Yr80DzWz0a+gvsUdMHBgexEsqCTXVsqDbiPqIuYF8RxKTLoeE2RRKg/GQb+yRRZr9
         BMg1YDLtuEI+Fs1x/b97FUOhAYbY/TzxrkyVVtI/am32+L44Zdh8+q2a9q8Ipjn9VHSq
         vsHXgRvS+qAB5ALTgMnVu+7/xdQNfokYLdqbUcUjnlTzXPWQEVTCMDE3YdpeoMfXgsE5
         Uo5/yiwX8CiTKEMLAP/AOPasguVE1AVm1WBsKUykPnNC/ix7TG3iI/HVvzXtfKlohbl1
         YSHw==
X-Forwarded-Encrypted: i=1; AJvYcCXqB+Km7UpCAkmGRZIIdZ7fEunSEBJRPI6pODm8kJjSCLRoqXHXILysLFYMnplMqHbR3ySOPTMTj6g=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv5Y1JFn3fi8xcN7QTK9lpIIu9Ayj4spYPXWoJDMlRh7wSeqM5
	d86aEXih2YW4Gmrv/hc4LtmzM+k7Gr5N04KDfTWGMe7OoEOqadZqzxPKqoO9KSuDdPQKDIubVan
	GLdcXntHCTY3LLbilDEZhg7DHSF9SBCk+YYvOexZ/QsCBBBGTqUpoBPdyto9xKGP7u+P6uui5SV
	cjW0OrLfq/QitpLqXrINO+tv8xXOX34DW1
X-Gm-Gg: ASbGnctqSp0wh3eAn1Tt5IwdqL+ONo89Q4j6sG6W7uTAOX833gGmxROcAKKYd5tsUyN
	3rbakyQCgJQSdB+iaFnxpI/bqKBQjFNQfHXkKi3M=
X-Received: by 2002:a17:90b:51cb:b0:2ef:3192:d280 with SMTP id 98e67ed59e1d1-2f548f162acmr41742263a91.5.1736989624168;
        Wed, 15 Jan 2025 17:07:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFXTlxUYfojfThpUlYe1bY0TrNIHeZ7wOATIqqDywvf5ON2WLv7gIgxHZLXiKaVB1ytp3colHV+0p05xw+gzAU=
X-Received: by 2002:a17:90b:51cb:b0:2ef:3192:d280 with SMTP id
 98e67ed59e1d1-2f548f162acmr41742236a91.5.1736989623732; Wed, 15 Jan 2025
 17:07:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250109-tun-v2-0-388d7d5a287a@daynix.com> <20250109-tun-v2-3-388d7d5a287a@daynix.com>
 <CACGkMEsm5DCb+n3NYeRjmq3rAANztZz5QmV8rbPNo+cH-=VzDQ@mail.gmail.com>
 <20250110052246-mutt-send-email-mst@kernel.org> <2e015ee6-8a3b-43fb-b119-e1921139c74b@daynix.com>
 <CACGkMEuiyfH-QitiiKJ__-8NiTjoOfc8Nx5BwLM-GOfPpVEitA@mail.gmail.com> <fcb301e8-c808-4e20-92dd-2e3b83998d18@daynix.com>
In-Reply-To: <fcb301e8-c808-4e20-92dd-2e3b83998d18@daynix.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 16 Jan 2025 09:06:52 +0800
X-Gm-Features: AbW1kvY854xB4UWOJdJLBydWl06vsh4taL7pE63yt9P1_IVO_L6kO5WvWI7S_B8
Message-ID: <CACGkMEvBU3mLbW+-nOscriR-SeDvPSm1mtwwgznYFOocuao5MQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] tun: Set num_buffers for virtio 1.0
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Shuah Khan <shuah@kernel.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, kvm@vger.kernel.org, 
	virtualization@lists.linux-foundation.org, linux-kselftest@vger.kernel.org, 
	Yuri Benditovich <yuri.benditovich@daynix.com>, Andrew Melnychenko <andrew@daynix.com>, 
	Stephen Hemminger <stephen@networkplumber.org>, gur.stavi@huawei.com, devel@daynix.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 15, 2025 at 1:07=E2=80=AFPM Akihiko Odaki <akihiko.odaki@daynix=
.com> wrote:
>
> On 2025/01/13 12:04, Jason Wang wrote:
> > On Fri, Jan 10, 2025 at 7:12=E2=80=AFPM Akihiko Odaki <akihiko.odaki@da=
ynix.com> wrote:
> >>
> >> On 2025/01/10 19:23, Michael S. Tsirkin wrote:
> >>> On Fri, Jan 10, 2025 at 11:27:13AM +0800, Jason Wang wrote:
> >>>> On Thu, Jan 9, 2025 at 2:59=E2=80=AFPM Akihiko Odaki <akihiko.odaki@=
daynix.com> wrote:
> >>>>>
> >>>>> The specification says the device MUST set num_buffers to 1 if
> >>>>> VIRTIO_NET_F_MRG_RXBUF has not been negotiated.
> >>>>
> >>>> Have we agreed on how to fix the spec or not?
> >>>>
> >>>> As I replied in the spec patch, if we just remove this "MUST", it
> >>>> looks like we are all fine?
> >>>>
> >>>> Thanks
> >>>
> >>> We should replace MUST with SHOULD but it is not all fine,
> >>> ignoring SHOULD is a quality of implementation issue.
> >>>
> >
> > So is this something that the driver should notice?
> >
> >>
> >> Should we really replace it? It would mean that a driver conformant wi=
th
> >> the current specification may not be compatible with a device conforma=
nt
> >> with the future specification.
> >
> > I don't get this. We are talking about devices and we want to relax so
> > it should compatibile.
>
>
> The problem is:
> 1) On the device side, the num_buffers can be left uninitialized due to b=
ugs
> 2) On the driver side, the specification allows assuming the num_buffers
> is set to one.
>
> Relaxing the device requirement will replace "due to bugs" with
> "according to the specification" in 1). It still contradicts with 2) so
> does not fix compatibility.

Just to clarify I meant we can simply remove the following:

"""
The device MUST use only a single descriptor if VIRTIO_NET_F_MRG_RXBUF
was not negotiated. Note: This means that num_buffers will always be 1
if VIRTIO_NET_F_MRG_RXBUF is not negotiated.
"""

And

"""
If VIRTIO_NET_F_MRG_RXBUF has not been negotiated, the device MUST set
num_buffers to 1.
"""

This seems easier as it reflects the fact where some devices don't set
it. And it eases the transitional device as it doesn't need to have
any special care.

Then we don't need any driver normative so I don't see any conflict.

Michael suggests we use "SHOULD", but if this is something that the
driver needs to be aware of I don't know how "SHOULD" can help a lot
or not.

>
> Instead, we should make the driver requirement stricter to change 2).
> That is what "[PATCH v3] virtio-net: Ignore num_buffers when unused" does=
:
> https://lore.kernel.org/r/20250110-reserved-v3-1-2ade0a5d2090@daynix.com
>
> >
> >>
> >> We are going to fix all implementations known to buggy (QEMU and Linux=
)
> >> anyway so I think it's just fine to leave that part of specification a=
s is.
> >
> > I don't think we can fix it all.
>
> It essentially only requires storing 16 bits. There are details we need
> to work out, but it should be possible to fix.

I meant it's not realistic to fix all the hypervisors. Note that
modern devices have been implemented for about a decade so we may have
too many versions of various hypervisors. (E.g DPDK seems to stick
with the same behaviour of the current kernel).

>
> Regards,
> Akihiko Odaki
>

Thanks

