Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794547076;
	b=Y+DbwMOHBZf4cPPRs2Dy0sWBnd6m4YnUBlMTUL0/q4ZKr6OSTPiqK8TmhJi74X3zCzWY
	 VQCKBJDD6SVuesxqa+KgYc2roSek6tlyYEIh8tIhllCsceO+ZUc9xxKyNcko9NhYJjYF7
	 qNnmhZfZfCBKPIxdMOHWcwup8OhrKlAO/+hmgXYFokoW+cTWoffOIpo1FYGh+MZeE41MO
	 7Hxwkz4VDzfCpoTTwTLcvLh/cs4wF2+38btMnCnrP1as+IghJmaxIlYUbUi3264pYWB5Q
	 K8u3z1s24N3p0V6cBNgKo3V0jstz8dcs9VJlGZrYA12BeTLiFi7s02Bvn8bCcI+Bmvg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794547076;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=f+W0yRPPh5LN5Rei1H2okk7m72K0RoxQKNaAvZ54EI4=;
	b=oNOpw+OVnphT9QQxhDNeHAOVlrdTcbxHs3gpu9dbE3s7jL8N5uaApFomk7CeBnT9OXRL
	 Owz95i3kltclWSKORjSZ96iBcu2r5HXBVQToCWMVo2ht0ns4lM77Vz9FZxgiDE692mKAG
	 dkxIcDH4TldIP1BHQurvEzWERrsPAZo3ZENfWnMaEDeC1EBGlmckzxy4vNq6TPKnurLzu
	 QPPpouKRvXKJX6sG0m/BjKhN/KwktgeIDhM2rN1F/bq3IKW9z67d4kQ8MuQsylesEwsSu
	 ckyuiRPHR8+8uXsf/RCQp1qJQsNw7ZqCCi2sKH3XmjApa1i4vboNvvtzSSwIUFZtgIg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XkcAxtUC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96356606A31C
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 05:17:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96356606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XkcAxtUC
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b71ee00f0dso4519a12.1
        for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 21:17:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794547074; cv=none;
        d=google.com; s=arc-20260327;
        b=EHH+oXdoyU/k1mt15yCIu2z1HFgGTzugI1QNG/TT0Wi6jQ6GwLpsGfRhY81+Hq8O0R
         7gWGMMPa94cFgRivXajVvVPd1DOr6DxtVRwEU3dO7V0LzxAVL/nzkXJrjXSo473a6kFX
         4nntH2XKJQRHod7LToTazl+g6ggGKgVHUuILV1T1NM4GbOjvc2bqfUUCBDWfuUa2jOes
         iL/hYJwHsopBK4ApjjUKtzmfKbvzPqVOFzfZsjzP/KR0mFujr26yjU4p1L+HV3IiA0O0
         qszN/sqT60lkmgakbdcS39prTFG++9eM0D+cvVG91IoKqtpGxrxu5Ucswr6fq8e/6r0k
         d4xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=f+W0yRPPh5LN5Rei1H2okk7m72K0RoxQKNaAvZ54EI4=;
        fh=HZBBuSzS+ul63PrDJl18k7/pkgoAsR95bK+iqno/Qho=;
        b=Yuyxbi5A+uEojM5HIGiGjnw5vq9RO304ShX+AFquIYbND9gh5vTX22FN1VJWbjVXGb
         pu7Rz2bAnNolfISNmLoBsjxqcz42XG6pIwVSYrnp3/X4EjDRqXvE6PHJxlvWEdhFwzU8
         BAwE9ffakltXVTLgNAc7UTfOMXm6QHllgHdwlu0ACMYGoWo/WzIUK/2VzlvPyt/Zn9O2
         D8KBG4Wfxx26TaIvCwL047OmJr0FguiS2MyYFnooprqW//57VAgJkJA/lqilR6cv8olS
         DC6REupTOBzHhGXie+2TLiHkKN+TG6OnptrloOSe+4GwlE12+hB/JvVX20TSWmJv7Fr4
         ZnWg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794547074; x=1795151874; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f+W0yRPPh5LN5Rei1H2okk7m72K0RoxQKNaAvZ54EI4=;
        b=XkcAxtUCanemul+RicaP/aozebWZdnRnipw0ipFQorOt0CF/BrSpgOa8erBdCdQ4N4
         VLN7NIrJsbUZs5/qRbv6PVx8HdejsexGCcXBvZF9JMwInu54ZTGyLTXV4CP5Khnt6ZmY
         KtwFVLwvIbCaIc+i4hJo68hl9fk2E5AG+n1NWywpxM5HEwL/Sh5PnG2wSuHDKvMPj93c
         eS9Wdn4dxDybUNs84KncdG8MxZzbqIualdyZuYd1d9+Jv3B6t3kVQ5SHpDpkkDeOs8Hr
         TJbLqq+E4fLdgNwbW0RukXF0HL4RUXNqvH0YKSicntzdAKQfXtwzBHxp8r6Xg1qJ7l/Y
         8paQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794547074; x=1795151874;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f+W0yRPPh5LN5Rei1H2okk7m72K0RoxQKNaAvZ54EI4=;
        b=21w/Ev1tL/G00GKSMcm4bS9lSQRrjoDttAxjrOhhGjVgvHfSOoQ4XbKilQp2qDI0bn
         4ke775Ob7FKHZGqtPs4SeCdgfGQ+vInUuEX65lBat9QRplbpk4k6f/9wVtykDYuPNXAV
         QrKSGxOez5L9avIbPasFP0+DbeOtNHV46UlUfYNparC/+OaE/FLEScE4fjwJU3QOvy9d
         yFbD+XIMA8+K99peUjEgvTh+q4jO4r9PRk/ieds7+CXY09ylC42ytMjJpCQNQ3tOdoa5
         DQTJ5y6OzdczFBduIFq1yM9aZfaZn3/nrxDndrhXNhC1lYzQ7XZLyIZR/SpZ4hAdGKjK
         0bGw==
X-Forwarded-Encrypted: i=1; AL+hErEOVaNalhiOZkVxZNvMsWc3UWadzR+BTNKX+hX8bHpS5bMMZ0JoML9kSwU+Sg/BgHbHwj/T42wyXa0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/1QTGEXvRT0KvwMaxIc784TwaMbgKf/RCESNiLPWcc0ztUeDdv
	j+Y1YYkubV2PqdBxB+afNWa6nDDq6+y2ycBvTAAzJ896bojKBelv9jM4xVvhFTKwrF+WA/wKDIt
	3iLLFeN1pfRw6jbLbMwutLI56iI4MtNdZ3DgKU78j
X-Gm-Gg: AYBFou22aN9OPGd3dhwconNZfWMEgkGgxeSImuoimex4FPKO5FdMLoqmo483aMAezbV
	mmsTpAZNcLGea15rJI5kRczBHMlt3qv6xe2vFSuKslXFiHc3r636vRiy4hqogHcf/9afFYjYi5y
	KoElgos0XlSmO+N49JTZaYORtMPrSOJ9hzorgsDYNs9CjoNS7MDb3wRePpQwCdAnujDv4XYV7M9
	4e+9G8vAQFigF/UHeHoG+Z3znE9fSKg/21sRDYGm+GPYtpC8u/VwPoiNqznz/gnJk6xIHu03yny
	uM5qVnu/30HaP4ZJD6CgNiPixlNkbQWcu2nW8kGMaipTgWZE5N9/JoWhVpRqsdPJ7ifJ/kBEvRX
	qDckYuU9CocRltyrClV6NuA5/lD2NhMWIxi8=
X-Received: by 2002:a05:6402:160d:b0:6b5:70c1:650c with SMTP id
 4fb4d7f45d1cf-6b7c34c6eb8mr48079a12.4.1794547073617; Thu, 12 Nov 2026
 21:17:53 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110102039.1002605-1-bjorn@kernel.org> <20261110102039.1002605-2-bjorn@kernel.org>
In-Reply-To: <20261110102039.1002605-2-bjorn@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Thu, 12 Nov 2026 21:17:41 -0800
X-Gm-Features: AclHuK-EmG-vcwSjI4xi1-iRc2SNUCp5kahvZ3vW1cJ6PmqMOttCBZ_NEdrFdlY
Message-ID: <CAHS8izPnmy4W6f3dWp2NCkmNYxtP8jKm5rxjvPbQc8VdFm0Wng@mail.gmail.com>
Subject: Re: [PATCH net-next v1 01/11] net: Get skb fragment addresses through netmem
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
> skb_frag_address() goes through struct page, so a net_iov never has an
> address. Only unreadable memory should lack one: XDP and BPF read
> fragments through this helper, and AF_XDP UMEM will back readable
> net_iovs. netmem_address() also returns NULL, not a bogus pointer, for
> an unmapped highmem page.
>
> Generic code needs the size of a net_iov to find its address, so keep
> it in struct net_iov_area instead of the devmem binding.
>
> Suggested-by: Mina Almasry <almasrymina@google.com>
> Suggested-by: Stanislav Fomichev <sdf@fomichev.me>
> Signed-off-by: Bj=C3=B6rn T=C3=B6pel <bjorn@kernel.org>

Are the changes for niov_shift some kind of rebase error? I don't see
how they're related. Otherwise changes LGTM.

--=20
Thanks,
Mina
