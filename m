Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794075934;
	b=d1CmY/D17M5JKjTNIm+44D+pP3I8EG0lnBW5aUPknhe0xbzeKO/8ZGLK08SJ1e1D1fzw
	 18Q41kyVP1Rn7NhDpBwfLoJtKmjEp1cYkdmFzrwuaCGaHpVmALqRGBZgzezphccheKK5X
	 mt06UwWmnFxGoMgWFtXojkJwbyE2aQffYMNjIYYr7vWXUEVV3T8wcNTsHYXjxy7udNcIM
	 +VVGpD0tm/5MHLhloCdj8Oyo5dQ8c76TcBGaSqa343F19+bIzR1GoXzikibkke2sUm25D
	 I4FjRkrz9U5OWp7VAVi+I1omEFgJocrC9rpgdCjVBf65S0Je7rmY0niYqAadCwwD7Vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794075934;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=o4KEBZgQa5HXSbmQneNQ9t8RBeb6quQFAx0lvX+O4LM=;
	b=RpVBycXHhMSxC8n4sDCUCx2T8p5fHiwEI5J8+aBSY/GhWJz+AcAQMTpvPM19SyQF6Dki
	 1BxCmBOy94HqsYTl8cVSZbnZsxuWJzeTDigpE41UAtzfDBQxgVGQMmFUWxBX7JToghigf
	 3hzv2pg1+jGvYOqWCw8tKk4eAnfKZvQBkpZDF/Lxfjb5rNH4v03Jx+vw20sAGMLSXbdRF
	 nB8EqIeEBaLYkRnGgPVEzwe0vFe7q3g38LFX0OKw4RFbpowHlLObwg19PoQ0jVAPhDC2f
	 DV7mdB3Tv81Zw7d2/EdRNFkSkRWQqIuP/zzxEPnkSGz2hqxG9hBZws08iUdpaLceDbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=ZXFxPfbI;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C3C606A32D
	for <linux-doc@vger.kernel.org>; Sat,  7 Nov 2026 18:25:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72C3C606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=ZXFxPfbI
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c49c32650adso215465766b.0
        for <linux-doc@vger.kernel.org>; Sat, 07 Nov 2026 10:25:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794075933; x=1794680733; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o4KEBZgQa5HXSbmQneNQ9t8RBeb6quQFAx0lvX+O4LM=;
        b=ZXFxPfbIL1yDhO7eAFUmmD5GbEzTzeTMc45MKZEzL2A15eafYpnSeCWHdGS9HOYcDX
         UfifGvvj8hDRRsWB0ca7cSl0soaX2SEyWI4E/iykJiHosDG8fK12wSekdcoB/Ws9axGp
         1udECMKCzZZi/q9tpGpr5/naHelYTBh0JJCeSstKL9TlkU37DMWbx4i+jBVGgDwwLiti
         Adjl6GsUsd2IAOjOpIiRxpGhKdEYUHmef3yUR1vCWTttx8or9aSdBiR9f7/mFqu6uMCH
         UMTAc1dzDC1giOev7pL45ndBOaDrTIvqkuZK5BsNXdTbqEp7AQ1KOCP7rx2aOUi5AkIc
         xdEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794075933; x=1794680733;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o4KEBZgQa5HXSbmQneNQ9t8RBeb6quQFAx0lvX+O4LM=;
        b=2iMryikR6Ns7bstO2GnLVJgV2rvLctygckmtnewB9Ge1rKEOVmx1s89qYhFNJSlidq
         +oZbSq0PayCLRKBbJKvMa5B9nVz3ppps/7mhFqledFm+mdGUxxTBwWyeQ/RtE/V0qLz4
         XPE36YojNio/k5XG0500HrGF+fKBRj7RtiQPXm1fTimWi+LXPIm9G92vKaGiWvarkmnv
         fCyLIYAUKBnNdAHRWkZJvK8+Z5PGETD2/EQiTD/k3V+OuR/HjaPfcDhMSIHh0djlmI9h
         CnlQEoPHj3isB3q+tmOpErs/9pfKN+Ag6wQnwn2M9zX1DtdIsPR+AcEdpeH/MnEaV1Aa
         zHxA==
X-Forwarded-Encrypted: i=1; AL+hErGMk+OkdEuaWyxsFLqd6CYKzf6gFi0c0NXXMHiyNFEix2ywTcnu5Gt+cFgK+FkhbV8CzuC9PipvZ0s=@vger.kernel.org
X-Gm-Message-State: APuU4Z/bYOQPGNXqSw9ZqxuVVYeeqtwSFvgJ0D19pxBhJtyYhHdlEnwe
	nzSDltUxaR1GCTs2jOZEN8tV5BseVSK6QT/N81cOi2RIjWRBjb60CDSDNWAiSLpVgtM=
X-Gm-Gg: AYBFou1921lSbmSu4Vc4KwarcpLA+dySFVsuEl3ndNhO0Sl6ZvvBcYD10klTBvj90nh
	OsnXetIWIrsIKKFFOdTS343KHsyuiZzjhfAEI3otKPRZvYEisN0pFMbdV2QMokVxPE6/5F7++Yk
	TVVAKlWWTRnF/FmAY408qz7iej1fhQBjH35oYJihfALSVt0HQYNLNRtipQmK0HVmXTLLSNsPB38
	4E9twifHuP1M8rCbr6tZbov4n90rbtQ3yBlCF/eKnvNVfGGEKyaAQyOTEuiQ1OCL/jshgJr5Kqm
	tXwezS3voJ8x0HQfSMFB9cCIEZzK54ME80FiglpcLYpNAzPjaxLut44FutZXfbKxiiLcDc3fCij
	J4yyH3B3JIH5U7LBfP94D5QAYKEwWiR8VjKEXf00c7zDut+sQq1xsvwIDTn/LrNmpQOXN7FonnP
	RLhjyuojYpbBe03hgOM1lCFJ2LEhC8HbtZ2fs+Wwe5ZxLQckndU7hZJpi8QtTXM0BLnf0Z3+EAm
	hBGW88u57BhfsjmtgQL/68ARGnaD3pypcUL65tqhBEVxAO1BnVHmqXDqJzis1tWv1/Q5At8/Do3
	0Rr1Dz6pSLrfybHbsOdHlfG0BkED7ErBuRve5HByW4PryQQ68AYfYhEdlw==
X-Received: by 2002:a17:907:3f8f:b0:c49:4450:6248 with SMTP id a640c23a62f3a-c4d34b8d695mr429135066b.16.1794075932804;
        Sat, 07 Nov 2026 10:25:32 -0800 (PST)
Received: from L9JK9NPFH9 ([104.28.20.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a999f00sm644066b.75.2026.11.07.10.25.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 07 Nov 2026 10:25:32 -0800 (PST)
From: Tianyi Gao <tianyi@cloudflare.com>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: netdev@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Eric Dumazet <edumazet@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Simon Horman <horms@kernel.org>,
	David Keogh <dkeogh@amazon.com>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	David Woodhouse <dwmw2@infradead.org>,
	Dragos Tatulea <dtatulea@nvidia.com>,
	Nimrod Oren <noren@nvidia.com>,
	Alasdair McWilliam <alasdair@mcwilliam.dev>,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Magnus Karlsson <magnus.karlsson@intel.com>,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	Alexei Starovoitov <ast@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Donald Hunter <donald.hunter@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Shuah Khan <shuah@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Breno Leitao <leitao@debian.org>,
	=?UTF-8?B?QXNiasO4cm4gU2xvdGggVMO4bm5lc2Vu?= <ast@fiberby.net>,
	Danielle Ratson <danieller@nvidia.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	bpf@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kernel-team@cloudflare.com,
	nh-open-source@amazon.com
Subject: Re: [PATCH net-next 1/8] net: add tx_extra_headroom and LL_ALLOC_SPACE()
Date: Sat,  7 Nov 2026 18:25:26 +0000
Message-ID: <20261107182526.69543-1-tianyi@cloudflare.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <willemdebruijn.kernel.1d64e7848503b@gmail.com>
References: <cover.1794020868.git.tianyi@cloudflare.com> <e90e748e0aefa7cbe1c2b31b8c7902ccf135c3f2.1794020868.git.tianyi@cloudflare.com> <willemdebruijn.kernel.1d64e7848503b@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8bit

On Sat, Nov 07, 2026 at 09:51:07AM -0500, Willem de Bruijn wrote:
> Tianyi Gao wrote:
> > From: David Keogh <dkeogh@amazon.com>
> >
> > Add a tx_extra_headroom field to struct net_device for that purpose,
>
> Main high level concern is just adding an extra field. What's next,
> do we need to add a field extra_extra_headroom?

Thanks for the review.

A user needs more room either in every packet or only in new skbs.
needed_headroom covers the first case and tx_extra_headroom the
second. I do not see a third case.

needed_headroom does not only set the headroom of new skbs. It is also
the minimum that ip_finish_output2() and ip_forward() require of
existing skbs. Raising it for new skbs also raises that minimum. With
XDP on a veth peer and needed_headroom raised to 256, throughput drops
by 2.8% to 5.8% for local TCP and by 4.0% to 20.8% for forwarded
traffic. The cover letter has the detailed analysis. veth also cannot
set needed_headroom from user space today.

pahole on x86_64 (defconfig, net/core/dev.o) shows that the field fills
the 2-byte hole after needed_headroom, so struct net_device does not
grow:

before:
	unsigned short             needed_headroom;      /*    60     2 */
	/* XXX 2 bytes hole, try to pack */
	/* size: 2688, cachelines: 42, members: 187 */

after:
	unsigned short             needed_headroom;      /*    60     2 */
	unsigned short             tx_extra_headroom;    /*    62     2 */
	/* size: 2688, cachelines: 42, members: 188 */

arm64 defconfig gives the same offsets, and the size stays 2752 bytes.

> > together with LL_ALLOC_SPACE() and LL_ALLOC_SPACE_EX(). These add the
>
> Since this already changes callers from LL_RESERVED_SPACE to
> LL_ALLOC_SPACE, could this additional use case be integrated more in
> the struct fields and helpers that are already there?

Changing only the helpers does not help. Without a new field, the
helpers can only add a fixed amount, which every allocation on every
device then pays for. Or they can derive it from needed_headroom,
which brings back the regressions above.

hard_header_len cannot carry it, because AF_PACKET and header_ops use
it as the link-layer header length.

> > +#define LL_ALLOC_SPACE_EX(dev, hlen) \
> > +	LL_RESERVED_SPACE_EX(dev, (hlen) + READ_ONCE((dev)->tx_extra_headroom))
> > +#define LL_ALLOC_SPACE(dev) \
> > +	LL_ALLOC_SPACE_EX(dev, (dev)->hard_header_len)
>
> If having to modify/add these helpers, it's probably a good time to
> switch to actual, type safe and readable, functions instead.

Agreed. v2 will make the new helpers static inline functions.
