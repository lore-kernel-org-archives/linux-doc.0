Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72531420DD
	for <linux-doc@vger.kernel.org>; Mon, 13 Jan 2025 03:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736737484; cv=none; b=UnpdVdDBBnIYlagwDbPvy4Xtwfnxqp3H4jwLjM/X/64KJ9YKuSm/R70uqSZd8Po/xJ/1FLexQY6xuwHKdGc035eYuEyHER1OH8yOu2GR7rPk0wS083HqxEigWgyWw5sB1/y+rRgRaZmIkkUz9nuXk4VOfHmQ28gf3aH8XdzP9Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736737484; c=relaxed/simple;
	bh=yRJfycwjDy0VxrwiaDvig/uV5jBkPvBFTkhNp60TiSo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MfymaEVZhXUTff/Iwg7+VDrcKO3jCsjGODIUJIO97lZwpGW3/huDl0F8gZ992zVYLHSf4ByRt57VWCeNjHG5GO5UPeG8R6hBUYXH/2rgA2geeP1PcbF0pCktSnv9/E55jgqjAnVRb5U6Cf06ejYiNgAbowpneugArjmDYLy/6jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ic+KuflZ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ic+KuflZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736737481;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yRJfycwjDy0VxrwiaDvig/uV5jBkPvBFTkhNp60TiSo=;
	b=ic+KuflZVzppCHHrflQ8bJaWOkU9hB86UfqXDCaQuQIW0pYLWWoADA/m1eIWvQ6D4UTObj
	cxLqFrfyHWTT8l3g1hTSAyQOvcu+3tfaKC6ngRAkikhrL0ugMzHIVcE0GIDnw+Ev9W7VT8
	oVX+yPBRKOKck1qohRptKb2ECkwDAr4=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-361-FmEJkRTSM8KiqBP1_JGaCQ-1; Sun, 12 Jan 2025 22:04:39 -0500
X-MC-Unique: FmEJkRTSM8KiqBP1_JGaCQ-1
X-Mimecast-MFC-AGG-ID: FmEJkRTSM8KiqBP1_JGaCQ
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2ee9f66cb12so6904358a91.1
        for <linux-doc@vger.kernel.org>; Sun, 12 Jan 2025 19:04:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736737476; x=1737342276;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yRJfycwjDy0VxrwiaDvig/uV5jBkPvBFTkhNp60TiSo=;
        b=hbOV9+DQjbQmbApwug76OlstxfjV0X0m0EAsnStfpDNjTqDMREO9+Fxjpjq3rOykHp
         WlGCTCSKot0cj49esydUJCCKLsCOqp3tsYbj1DMj1g/spbilSb3GAb0HxWEcolpPmuqI
         dtJK4+T9CcDaBb4qeW9XCUxlATom4CRn5XWlQyzlIFlViIeWeit9/EENdwe+z4XNGVya
         WQ0vbQ0mk9fwRzlcGt0Mo0bHAF5XuzJNgJOGLCjvy6r7tKi4KdhGi0wTmCycaxlXM/Od
         c8Vt6TuGL/OoJlpNcmCX688ORJAYOgB2tnmkwZBwRvXz+Fwrdfjzf9gPp6/xVCbNSMrZ
         1gDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUD0K/Y199CDnfeFPsEpNJnjsZma/Yg7FKapnd+HVonPPzB4IN/vEyYl2oePnyeI+25F/CwyFqHlcE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5FfgjdENclD2UWgNSoZGiCR21LV9A3+AfxHhKzxKVAYKueyNy
	nGbbpbvkpz1p4iVq7YaOv/URaid/urHD8B8uFQ4LgGdEbjY11sAFS4Vg7V5ys3Ggiv6WV0Ein3F
	Mq+qNxv4wo+PyhgS+5gIlbtZjI3Hbtv2VON8SA4a4T5Fy7ITMEMfF5HJU4xQzz4ECmc/65/HN5F
	Kwr4iw138GWorhliL0/PbwLCu58WCOTL7C
X-Gm-Gg: ASbGncvLADXRn4jlYb8AWZvOxl9r+HH5X4s+pk53AH3OTS1W0SjN/QVnTN0Rf45KVG7
	WjfreS75aNvQoysAJW6cOhhJMO6UY5moVEswaK5c=
X-Received: by 2002:a17:90b:5145:b0:2ea:37b4:5373 with SMTP id 98e67ed59e1d1-2f548eac588mr28389812a91.10.1736737476520;
        Sun, 12 Jan 2025 19:04:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE3vQ4vRdPBx0guyoTg5ZpyZUQ/sA/eheHAAs75pTrkZhjd2AbRMvv82RBzJBTsua8lQjGaRuJEc2TbijFE4yM=
X-Received: by 2002:a17:90b:5145:b0:2ea:37b4:5373 with SMTP id
 98e67ed59e1d1-2f548eac588mr28389757a91.10.1736737476052; Sun, 12 Jan 2025
 19:04:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250109-tun-v2-0-388d7d5a287a@daynix.com> <20250109-tun-v2-3-388d7d5a287a@daynix.com>
 <CACGkMEsm5DCb+n3NYeRjmq3rAANztZz5QmV8rbPNo+cH-=VzDQ@mail.gmail.com>
 <20250110052246-mutt-send-email-mst@kernel.org> <2e015ee6-8a3b-43fb-b119-e1921139c74b@daynix.com>
In-Reply-To: <2e015ee6-8a3b-43fb-b119-e1921139c74b@daynix.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 13 Jan 2025 11:04:24 +0800
X-Gm-Features: AbW1kvZHQU9iIwkWwKeABYuwHLZExY2G4KWx_BvVBrd2ec7v_BAcbnTLlgvVmZE
Message-ID: <CACGkMEuiyfH-QitiiKJ__-8NiTjoOfc8Nx5BwLM-GOfPpVEitA@mail.gmail.com>
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

On Fri, Jan 10, 2025 at 7:12=E2=80=AFPM Akihiko Odaki <akihiko.odaki@daynix=
.com> wrote:
>
> On 2025/01/10 19:23, Michael S. Tsirkin wrote:
> > On Fri, Jan 10, 2025 at 11:27:13AM +0800, Jason Wang wrote:
> >> On Thu, Jan 9, 2025 at 2:59=E2=80=AFPM Akihiko Odaki <akihiko.odaki@da=
ynix.com> wrote:
> >>>
> >>> The specification says the device MUST set num_buffers to 1 if
> >>> VIRTIO_NET_F_MRG_RXBUF has not been negotiated.
> >>
> >> Have we agreed on how to fix the spec or not?
> >>
> >> As I replied in the spec patch, if we just remove this "MUST", it
> >> looks like we are all fine?
> >>
> >> Thanks
> >
> > We should replace MUST with SHOULD but it is not all fine,
> > ignoring SHOULD is a quality of implementation issue.
> >

So is this something that the driver should notice?

>
> Should we really replace it? It would mean that a driver conformant with
> the current specification may not be compatible with a device conformant
> with the future specification.

I don't get this. We are talking about devices and we want to relax so
it should compatibile.

>
> We are going to fix all implementations known to buggy (QEMU and Linux)
> anyway so I think it's just fine to leave that part of specification as i=
s.

I don't think we can fix it all.

Thanks

>

