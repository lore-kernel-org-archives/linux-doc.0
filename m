Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794596072;
	b=g5vmm30tHLTogygyqC88w/XCFtVk7KL3yxdzjrqTnONRjB7Kt7/3smzklNDgKLaHjVpW
	 Jb629Ktx5pTF42rqXgefcHpzf22dtz3o1ngYxsnf2smWFayv69Vdw7623EsUlXUKXvrDZ
	 pY3kvQDMmEfS28UXwCjAfyaHTYbizTCKvgPEdu75LtJHst3356B0CmnB+VFI5pujqQ+HU
	 FPewcoC82/4r/Sv2+61nlej09q5olb+XRrNZMms+vnFzcyZkRY4GSDHpWG6Kwg+5RUNm2
	 HYqm5PDyFzfjgGbooIQRlq5Tzu64mpY5QFL1Hk0KMCeonOIl5tPjt/a54zRAXNJ2mlw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596072;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=7R1hXZXnbTwKM70quTRieOgRc26BuTodcH8VZYBkreU=;
	b=fAmGorVEX3Vw9jwihaOUCkdHIs/qEos0+Aqtl2Q7OOk5VKbUitcqPWn7PhwnPcBsXu7i
	 2M+MB/Pmzy+O5bri9+VvHFPFmISSfeZ8MPaQWhr3YoFbZD8fbEq/j9QO1Np2GiGf27vas
	 16Tn7d16skO3EFqqLpWx7Q+pNUYUXyTwVvvUJBMgkqHMyBeaDPAdCBPuUCEYpn+2HpvNY
	 Yod3kerUF3Uy+a2mlKKi3eaHkQnaNB+RIw+Onf1F03lx1pFBH8hKFmzd2FwDu0tOP5gWu
	 TEukZCatloKaFUTZdGFNONyTy3NTi0K6xAjL+HlTCqdLvUC9hdZGQHXW1iDgt+BpURQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=eisEEVVM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A8A4606A33E
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 18:54:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A8A4606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=eisEEVVM
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b791a4b732so649a12.1
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 10:54:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794596070; cv=none;
        d=google.com; s=arc-20260327;
        b=cWOamchrHD2375BVbg28OYOjZFpQvLpLk9hrkaaz9eJTx58MQsthD+q2MLe3cF7Vsh
         rVMhjs+KiN5R0jx2ShCZK1BuZrbCYGnXWi9dD47SC4iOIwVJOhDj6C/gZFAy4gBSG0HF
         ZLX6Tf1vxkgIgaPCSTou6rFRHy7qwhRQlaA+1hzREkt3RFEL95qaCmhnmKcyTI8AXI5Z
         Tj6Z6OTLbsSvSv6yXmkUpye5X+PxJbGvLnjERIcYsdnJhKWdmgucIAXh1MZiCnZVvxbo
         Z9fmuBkWr/vV2omDUUiAooV29W4x8rf+BYtAXUxEN5ltYidUTTQ3AuihNEjNda7zB9QO
         DXKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7R1hXZXnbTwKM70quTRieOgRc26BuTodcH8VZYBkreU=;
        fh=EZJuje9iYpVJ31dW/z7UgqGT10IYJ8y133nIs9rN4Ls=;
        b=Ar/MupPWfcfpcLWVyuCAc/e8Eu4IpFzXXIlQXatdfg19ii8dpu117+qeLpnc8+sa6M
         JQhHmup0cElRtv7VUtqIxUonzAjC3QMu3kdH3IaVZ7TqcJn7QMiTTp/LqoMqLx8g9z9i
         H5grscsI8rPaL9ht2qKioxqVB/4rlEn5xbAPxvTwaeM21L6V7XgwJNYp7jaXEAhTlqwK
         qTRpV9/ioZlTt3dESUtmIAOb6loGl6envSvCOfZJdPfPZD1LU6hFDKC0kGcMiJLKxXCc
         2hAshyPJ4NU0+s1QJ9TFCx1XzFqu744G3MgdWqkzyLN1K+3ci/AY/PqDL58f2UXsdF5W
         QE3w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794596070; x=1795200870; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7R1hXZXnbTwKM70quTRieOgRc26BuTodcH8VZYBkreU=;
        b=eisEEVVM8PCaj/Wxux+iAJmBT1k8bHNU35jNjvPdKn5A1HLZOH5LQ1EY3BcJG6WJSd
         zQJHCca5ZSW272RR8ZqEnxlJfsFyhdrMZusl8QaA4c9HP+xH6avVjT/oc3dDYcv5aBdd
         PX2GBBsx7FbYnffDffV/A8+nFo7zh1u9hueKZ40B79RrQ6sNRvq4xDRAPGyAjZ7E+JEP
         dHQD/L3wxxC2OFdsSm7Io+s1kd8AHRbV0NiLsOq1oDTCRUWH6uhuvzES4DspcfRe/mVS
         XpFUSQpVCuB+A/wp38W4sFKkIzI7LAQear5+guYAQ2EbAMwuzP8+PeaJ1TbqOdpbCAyr
         OtWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596070; x=1795200870;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7R1hXZXnbTwKM70quTRieOgRc26BuTodcH8VZYBkreU=;
        b=TXuOoXHVw9NEHH3vTKBqbzb5m3IejkKiUnkfqz+rGBh4DkdmHb7vs9dfsLoV7ot0RI
         Bhke+/0O2CpQr4kpkAIuFbgwLs/Z07n1zDkL/3fiT7OnvoAC3z5AElwpjl5G8x4X0i2e
         cYlLea+CdLU54yg1txt7gNtA+LfwCF6DOUiKgMqD28tQGjvN9XVQSlxd1mq/zqSkTnna
         LI+/uRqz+J+FsS/E2I0BV/0dMw1WtaPDjmFFWI9OjqblEFa6rz6P+FwiWSuQu8BC5wWU
         3EH2ZFmo3Y8q2nUSboHc5mLd0IJi7+jsrRzWEkMqgVqq/Bzsl2kwWDP3LS5c0q7dj3WH
         V0jg==
X-Forwarded-Encrypted: i=1; AL+hErFT1s4T2CgzSyBWdsPWJoD+2AVo3ZSB+mtdm4H6QL1Ihw7Ed7JRVM3AX09qe9xzfAUHcaeEt2Fbucw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+p/0ODnSa4PccPgW1plcPFOo5sZi3XtcUtrDwkPMNOMaMqWYQl
	2uOVsoqpzF1EyfyQ3wbZdFoXLpbp4Ufmm8AfnKzIPuEEmL1Lnpqjg4cq9GVqyo6/nY7dlEIChAQ
	GXB3Jr4a+BKxLLElO8OWZtc3FcdKny2DIXPThklgt
X-Gm-Gg: AYBFou3Up2zqIOTtoMUB8nV3w9C9a60j6uEwK61KVPve4YhU2FpPxMzgCx1HG2qAcgN
	LRFGVMe4IIdG4W9X9LIaziOhqu11lUw1SHyqCwvLC3CQvXK7yu2te5LazgEshFtiSXDPeOXOOzr
	S5mqo717mNNhZoejDioP7xvnvgq+NuVShIrOCZ3j9+rpFtEsSbw6rdDAcjrNR2R7dZsSoTf3Lti
	PkoO5hZlHMk+XnRBQfPHQEggTmZk3ORXt8izR8gDBkNNMypfMeHuw2Lchbos50p0Q9WNnmKnjzI
	kPweocCx3CQjUxV4x+WL1UG0h4c+8lJaNKpOtz6Bh0SYxIIzQb5v/K0cx1PVZDfZHmLFeiFPMgx
	ZeKxzQtdgg+ZcNuiiru8Tz9zaaAIUrLJ2uw0e1+W0agWZq58DiZAFlyL/huxLtxwyjWY=
X-Received: by 2002:a05:6402:a512:20b0:6b5:76b2:5e18 with SMTP id
 4fb4d7f45d1cf-6b7e0367708mr7837a12.2.1794596070008; Fri, 13 Nov 2026 10:54:30
 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110102039.1002605-1-bjorn@kernel.org> <20261110102039.1002605-4-bjorn@kernel.org>
In-Reply-To: <20261110102039.1002605-4-bjorn@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Fri, 13 Nov 2026 10:54:18 -0800
X-Gm-Features: AclHuK8hJZjvI7zpL7vkOt-X_2SsoIeZHCGx6Ao6kGKYFChdzs729uK5-y6t5Js
Message-ID: <CAHS8izMhFEMu+v4zAm6VqjU=Lz=vMn58Ft6HKya1L-uNY0hL-A@mail.gmail.com>
Subject: Re: [PATCH net-next v1 03/11] xdp: Copy buffers with restricted lifetime
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Magnus Karlsson <magnus.karlsson@intel.com>, 
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Alexander Duyck <alexanderduyck@fb.com>, kernel-team@meta.com, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, 
	Pavel Begunkov <asml.silence@gmail.com>, Jens Axboe <axboe@kernel.dk>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, netdev@vger.kernel.org, 
	bpf@vger.kernel.org, io-uring@vger.kernel.org, 
	"Mike Marciniszyn (Meta)" <mike.marciniszyn@gmail.com>, Weiming Shi <bestswngs@gmail.com>, 
	Nikolay Aleksandrov <razor@blackwall.org>, David Wei <dw@davidwei.uk>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Stuart Clark <stuclar@meta.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 2:21=E2=80=AFAM Bj=C3=B6rn T=C3=B6pel <bjorn@kernel=
.org> wrote:
>
> UMEM stays mapped writable in userspace, and it has a fixed number of
> chunks. The stack must not keep its chunks in an skb or an xdp_frame.
> Mark the providers whose buffers the stack may keep with
> MP_CAP_RETAIN, and copy packets of the others on XDP_PASS, on
> conversion to a frame, and on redirects other than XSKMAP.
>

I'm not understanding why that needs special handling. Devmem stays
mapped and writeable and did not need MP_CAP_RETAIN. Also, today the
stack can keep any pp page in the socket's receive queue for arbitrary
time without _RETAIN. I'm espcially confused you're not adding _RETAIN
as a cap to existing providers, but their netmems can be retained.

> The head chunk is writable by userspace, so it cannot hold
> skb_shared_info, and virt_to_netmem() cannot find a net_iov head.
> Drivers pass kernel memory for both to xdp_init_buff_netmem().
>
> A static key keeps the check off while no such page pool exists. A
> frame copy is linear, so a multi-buffer packet of such a provider
> cannot go to a device or CPU map.
>

Did this actually improve perf? I recall that when I benchmarked the
performance improvement, it was questionable.

--=20
Thanks,
Mina
