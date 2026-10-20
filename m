Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792538025;
	b=a6vJRncS6lmpSxovoYW3TsQxF2OEYsViMTq+O8ruqDy37+ons1992Aa8kaN1/+pJ4DGK
	 69zWwxj1o6bl6VAGBBlqEf4fWD3ivhJ4RdyQDwBBCBR8f3K5ENEigJM96KNZ8IkAcaar4
	 PRiwcvFW0x+VHO4fQykIqa2x41I8e+OAW3nvT5RBt7//FZ4XjWAcBm9p2WOBVHu9dX4kx
	 FlY3uN+D2iWfwWRTQLM7L/EF5XIBxqW6On7FsEJsMknMONPaFr6gTGMtOTOQxnB0ueilV
	 zp/KYqCnH/7sCrdSpzSaaK7PZ+N9a6gsH3KHv/iD3kwDzva8wX7oKqZA6oSU2k9+JAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792538025;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=rJ15NYGDexAwiy4HWGRqahFWgTYhKLwbhvNqgPq1/FI=;
	b=TcNCxb5Z4yDKP1rhyJch0wratzPeovSEZZ92f+9H/nRh9YYrdOM2jbUm3drgcbMdk/iO
	 64fToZabozeByGkGw6DOzFjWqOD94zUfL2e1NOV18S1i3RVaFEI6QAhzauIAHoBZUaQlJ
	 FRRljuZo1G8U9vfzWKuvgEifvqLNBaettVaYZn1kWqL33mHhcrDmJj/VvnUQqu8ZYu7M1
	 FPWcG5R3Yj5wRQ8/MHscNHr2QQIJeMnAXxOSBcGJHqXX+gCSkd4uNPakIdUmEoaKf4+MH
	 n/ibVFNBWe7GGF+1pABguzwMx6k0GgW+E0vk4eXyBBFzx5NrQcEKTHLfblJMBj8pkAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ccTkz4he;
	arc=none smtp.remote-ip=209.85.222.53
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF5BF606A31C
	for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 23:13:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF5BF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ccTkz4he
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-9909e82513fso121652241.0
        for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 16:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792538024; x=1793142824; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rJ15NYGDexAwiy4HWGRqahFWgTYhKLwbhvNqgPq1/FI=;
        b=ccTkz4he0AFx8q8gX2Y4zERCLVWLeXCKRJcETB4Q4zQmAWIdlDYdokfGMTpUmv9ifb
         lYUZ+G2LBtMNKJegq49JC9MGtwhO8WubETfYqguFaYXh6ThI+T5JHcxfmLYGgv4mNoal
         xzd8btA+WJoJCJs+Sma+SY4qraTuXyxvVe6qwdJGyo9iq3u03yWfe1R3s7BYdv4Xmctf
         56I3WbcJP60v2ZVnFlnsDyqC6Wu6yFZV0TiN4bRPyIi1XL4Ucl0cqX/mP3up8iZG3H8D
         dDmM5+BR8TU7Km7T8Vr1IgSp8FnnB8AhgWssfKKUgFoVwAdJ6Cws1MvBq6hRjWn9E/XQ
         w3DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792538024; x=1793142824;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rJ15NYGDexAwiy4HWGRqahFWgTYhKLwbhvNqgPq1/FI=;
        b=VxgZ8TyaMJao5C439o0Eanjk9OxO+6uCDrglsXIUKaTOQTpv6xL8hpJ4+e7WVr0C2/
         lQ66qWp290sgZIa1ZaFiUDTYkelBZV+OtVyYYx5+Vb8PU/u9pa3iPfac/wGWUzxQhOyF
         HxRhd6BmlLcEHDLVoB5ttMZGcFwaX5X5YNyJRABDc4MdntxMrstYdRrg2EQqwSScydyK
         mRcFASVsAdIIZ482c+rvQ1sO9riHBN+Z3MFDzSaR+y/IhdR/mcwCvyDLLHGkbPz4ud35
         CgLjKJ3XcLQrb10ZZnBazO+1IjVjNC5O2KAPPqsTTL5u4YOWpsuSp6X7jNHEfxG1DTuQ
         5trA==
X-Forwarded-Encrypted: i=1; AKwUvByNmavcAt9Bw5N0wt+uHIl5iiT4h05XbmOENPQCJ1ubfILbINm2tQsWQC81BiRh787EihIwFfMniR4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIfAL6vJ1NsPuVbEFKHO5LlBtux0LBj5vbig1Bd8/wWPQpCzFI5
	Dsp84LttwAJdVAjM2DFU+Au1GpPNPqvEiAEL48mthhIjtoogrYX+KxWz
X-Gm-Gg: AYBFou1c9fPBJvl9wGKGOOKW490x4UFAS/SXlrLSd0sLcQk3qQNqVDj/MPHCUz4n5z8
	N1HILce9pYmswIOratM3gkUzOLKhuO7i4i1JH4PPK+wfFUdatZEldlBJ1rQAj2sXsV2CbfMQx6f
	VPhlpTYgFNPRB325AN567rTUYnYC9S3DWJc7E9EVIMAQ9ybXCuLRFBTRpsVOs1B2gjaPIV1r6y8
	SDhdXtqwbq9/+YECozLzc4W0HoMaDVpExU/x+NafejHYYD0BXD+Gr7qOZX2wVLghbVLNAmc5jbW
	uzMT/GP/8Ng6AYOPcKWWKlJxm8WH2UZjzkgeCDyC6RwDu5dJYGS9yaWhC+YlPZiTODJGw/fARJE
	Ue4ukeiCxEZPnS0DouyE1Jv6lu/0AD9Uq1gWESDZqC07VlydjJb3F2A5vQs6lU+Ar9etGF+vYwW
	mU4yQupmSA9FxckY/n5H4nvRHoxifoOCm268siTj/f2aRmcSqT/twbDfzhxaRPA564vSD5eI4iU
	mgfa6VWQiRf4VV5rpd8e/L0fcgzgC4aHXY8HX1ol/Rfg96YgA85h2UVFamJBwH2LlzJaGqaEcCn
	o0dbw5/bvct4sTXzEzIzwXKMQQqRpsRDl2x4TQ==
X-Received: by 2002:a05:6102:291f:b0:7bb:64cc:1362 with SMTP id ada2fe7eead31-7cc926d26a9mr190460137.6.1792538023910;
        Tue, 20 Oct 2026 16:13:43 -0700 (PDT)
Received: from gmail.com (111.46.245.35.bc.googleusercontent.com. [35.245.46.111])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cc9236f63csm803396137.5.2026.10.20.16.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 16:13:43 -0700 (PDT)
Date: Tue, 20 Oct 2026 19:13:42 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: linux-kernel@vger.kernel.org, 
 Chris Arges <carges@cloudflare.com>, 
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
 Phil Sutter <phil@nwl.cc>, 
 Jason Wang <jasowangio@gmail.com>, 
 =?UTF-8?B?RXVnZW5pbyBQw6lyZXo=?= <eperezma@redhat.com>, 
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 netdev@vger.kernel.org, 
 virtualization@lists.linux.dev, 
 Max Krasnyansky <maxk@qualcomm.com>, 
 Rusty Russell <rusty@rustcorp.com.au>, 
 Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Simon Horman <horms@kernel.org>, 
 linux-doc@vger.kernel.org
Message-ID: <willemdebruijn.kernel.34b42ddc625c5@gmail.com>
In-Reply-To: <20261020165610-mutt-send-email-mst@kernel.org>
References: <cover.1792411304.git.mst@redhat.com>
 <6f23c55c6eba3e3ec6b2c7e3a80728a326ed58af.1792411304.git.mst@redhat.com>
 <willemdebruijn.kernel.187d58ff2bce5@gmail.com>
 <20261020165610-mutt-send-email-mst@kernel.org>
Subject: Re: [PATCH net v3 6/8] net: add a sysctl to opt out of virtio net hdr
 checksum validation
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Michael S. Tsirkin wrote:
> On Tue, Oct 20, 2026 at 03:54:23PM -0400, Willem de Bruijn wrote:
> > > +/*
> > > + * Protects changes to virtio_net_hdr_csum_check_disabled_key and each
> > > + * net->core.sysctl_virtio_net_hdr_csum_check. Readers don't use a lock.
> > 
> > it appears that they take the mutex_lock below
> 
> Some of them? But
> virtio_net_hdr_csum_check_disabled doesn't, that's the point, right?
> 
Yes, but the statement is then too absolute:
_some_ (or most) readers don't use a lock.

