Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794150786;
	b=NkAghBORuCc80tYwDCL4EU0Bp39jRAOGfEKV8wZd03NxzZA42br9t6JOpfkr+C/9/SH6
	 Ot2rIfHXMm/uiWH72GF+rN94X6wpEIXiFuwQZKJfOC264vompqTFXnQZ6W6rARlM0QEtU
	 mjoCD14Rc2yv6L1rC+AiLrRb6sAJhdyHiTFY40I4k+en5Hu90gb5om/NdneHffRUroRD2
	 0uegpxVf6pi7NuwQZE1dG1/RMOrvU+R2gIg5zwD1LSGB6DDW0hCiT1IZhBWZ2D30fXCgo
	 hmSbIWvXpjGhpERazZW7ducL+tm1b6fxMxqwC0VWjVQxUmuAMYU0YvC3OGCu8sDKnBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794150786;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=oGOpptMTTRvU+q+lGfxSAwJKiB4VoXJ/0q8Ure01rsI=;
	b=IbYY0FSXf2jcNudbh7AMM52pegMU9fzPNUr631Abj5L/HbJhm+ArybozrKVnd5WyXaIe
	 gbyX1bOZMzglmNJt6FJgpj9czWiD57gYk2B105pD+Cz0S/U402/bbnarbLWvGCcPPfKs5
	 hFev1QoS4xWCmCuOF/tu9BpzVYs71G29lx0Wq1+sjo1YDwdR+3N/2gJJ2yDG07Q05yp4D
	 +Jt0uszu3+rHmYFapf9lfSRtnheD2YJIdmzOqd8bE58fvl9PbRBcXRXFUVpGxoWZqLz5R
	 uqyzEhPCMqLEJzA5BtYkqMbgp/GtAoofawrB07t0WO7+7zLZ901kBwqP2WNS1XQh9rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="gQ8KArV/";
	arc=none smtp.remote-ip=209.85.222.42
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E20606A32A
	for <linux-doc@vger.kernel.org>; Sun,  8 Nov 2026 15:13:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31E20606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gQ8KArV/
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-98fea7e52b7so74149241.0
        for <linux-doc@vger.kernel.org>; Sun, 08 Nov 2026 07:13:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794150785; x=1794755585; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oGOpptMTTRvU+q+lGfxSAwJKiB4VoXJ/0q8Ure01rsI=;
        b=gQ8KArV/ErbsVTXda3c9mTt1T9/eZSFNq5fU2hi92W6EJ8QEPp6hstG1ZKrfTTKuCc
         6fJdT2zddwVPqHY0dKFwv4p91YTgDtmIDdAhYaXTS3SS+u6dDKU5CGob3wri1RZx1phL
         4bmJ5mAcBjzwlr6WuixJp8lWzr4KMK+74i+QENNkzHlIOFd8A6dDN4wvKZ+y7/C3NYfr
         wpD8s84LSUxk0othXtncH9vgHxVoGqDatOLHXpHfPrE3Xs2mKY3sq320MQPxsvZRWoxB
         TtlrLoRibfOEiDkIkABgHwKAuTnwXCG7JUdQxIr7MkKA5fdaTQaG0vNJIokjKs8yATrW
         XaQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794150785; x=1794755585;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oGOpptMTTRvU+q+lGfxSAwJKiB4VoXJ/0q8Ure01rsI=;
        b=bhLBna+reXH/9hfLDz73CRKzmqqGapoxiS+6G4t0Rqnj9R7MNteu5DYkYz9CiuqxsG
         E4qCTj8ZHYqqJIIG3aVY2uwMgXtLiarvfrUEEI18xA0hsgp8k9sMRde94+aAhJT5kOqm
         vrdNJU1UQ8oUwB9O943tJk924Tnkeol6M6aZOnovxMukX3gjAUaZB4Z5aCZ3exaRxIoD
         rDynSFT2Q7TyRY+144izHiumdSMdBGfy+2g20sG+eBNaepYIv1iXCrEq0tsfzzkV7pmS
         wJ0z6s1QDJTxz/U+IY6C2myHFXmf9s2j/KI+C+Lj59Jl3g4OC9/M2GYQpDUha3Vu6N8G
         ++JQ==
X-Forwarded-Encrypted: i=1; AL+hErEsQdLWcDsaHptIHhEL4YFZ8MWsAmU+oLLz2yWeiuffzQ3rnJbtKw9/1Yi/JoXl0J3hCfxl/wHDBAg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8MdKDFkvS2bFZTnK8bZ+w6WrDKGYlzNja6ylpklWzOpaXgsXiR
	1iaEuqIMsKgGfBa7kYgd4JE+agbqMZvUp9QBJyJ6m8l0zthVhiyUsey1
X-Gm-Gg: AYBFou1vY4vV8tgqig8C6huhev5GeEthfrAUnKeYXP7OsBsV4EJ/tq/SvAEOMfANFzx
	cHcgWRPqk5ulW3a/BmafnO5NLkJxv81pQr50SWa0mvbqOcyeKmSn5YYVjuT+PYr0W47YYBQUesi
	p9Z/zzYS1iworml9qDvECUcTSDoma5QyUeGsrify9Npb9rIyd5yrPJ3QevqyX5LKB7GKKOkLpbc
	d2F3M5DPPHUpoTX7ZxSX8MnjA3oXT7f4uZBZc0apfnm+CNIekOoXElPPoyq+i7hqjyKEqeURyfx
	5iFzKB8wcgc0tVj3OATSLS0Wo95UG3w/noTDC0VkBb5RKoKwBToM7/oDc+V+lSgRcKvazjop6gx
	eHdtxddLGl5SyqmYKj4+nq+YSGcLV251lGj9KCTccubkoJ0RqgSBwEPCzeZl5CMyzDz+J4BjQFF
	gsog0mWCny9HNmnMNxxiWHPhBAF3yAoL/DsSF0gU08o1BsTGcVdMhNkAMyerb/facqeW6l1odxA
	LU7rNIXNcBxf1dCRvW3a07Dxo8fO0XL48PmwdgWTsZf/MIfG9TbgWGq/w1b/Kjsvj1PvlXjpbbD
	vvHoDu+WoEAGIpVFTHwb5zcFV3Er2BYLtPmGbUPKtcDgEI9Deh4bdHB+xOR3WHnNvc/AEUByAVz
	Zp3PaPIA6Re2Qitf5SkUgsTzQ4SlQaUTuFV6D46O0JqU2lqAQTaEn9OECSyqV9/4pAzPzHJU=
X-Received: by 2002:a05:6102:41a6:b0:7a6:85d6:84c3 with SMTP id ada2fe7eead31-7d2daab4c34mr493239137.3.1794150785073;
        Sun, 08 Nov 2026 07:13:05 -0800 (PST)
Received: from gmail.com (223.230.150.34.bc.googleusercontent.com. [34.150.230.223])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d2daf08fe5sm2083603137.0.2026.11.08.07.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 07:13:04 -0800 (PST)
Date: Sun, 08 Nov 2026 10:13:03 -0500
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Tianyi Gao <tianyi@cloudflare.com>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>
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
Message-ID: <willemdebruijn.kernel.2c6a653eb65fa@gmail.com>
In-Reply-To: <20261107182526.69543-1-tianyi@cloudflare.com>
References: <cover.1794020868.git.tianyi@cloudflare.com>
 <e90e748e0aefa7cbe1c2b31b8c7902ccf135c3f2.1794020868.git.tianyi@cloudflare.com>
 <willemdebruijn.kernel.1d64e7848503b@gmail.com>
 <20261107182526.69543-1-tianyi@cloudflare.com>
Subject: Re: [PATCH net-next 1/8] net: add tx_extra_headroom and
 LL_ALLOC_SPACE()
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

Tianyi Gao wrote:
> On Sat, Nov 07, 2026 at 09:51:07AM -0500, Willem de Bruijn wrote:
> > Tianyi Gao wrote:
> > > From: David Keogh <dkeogh@amazon.com>
> > >
> > > Add a tx_extra_headroom field to struct net_device for that purpose,
> >
> > Main high level concern is just adding an extra field. What's next,
> > do we need to add a field extra_extra_headroom?
> 
> Thanks for the review.
> 
> A user needs more room either in every packet or only in new skbs.
> needed_headroom covers the first case and tx_extra_headroom the
> second. I do not see a third case.
> 
> needed_headroom does not only set the headroom of new skbs. It is also
> the minimum that ip_finish_output2() and ip_forward() require of
> existing skbs. Raising it for new skbs also raises that minimum. With
> XDP on a veth peer and needed_headroom raised to 256, throughput drops
> by 2.8% to 5.8% for local TCP and by 4.0% to 20.8% for forwarded
> traffic. The cover letter has the detailed analysis. veth also cannot
> set needed_headroom from user space today.
> 
> pahole on x86_64 (defconfig, net/core/dev.o) shows that the field fills
> the 2-byte hole after needed_headroom, so struct net_device does not
> grow:
> 
> before:
> 	unsigned short             needed_headroom;      /*    60     2 */
> 	/* XXX 2 bytes hole, try to pack */
> 	/* size: 2688, cachelines: 42, members: 187 */
> 
> after:
> 	unsigned short             needed_headroom;      /*    60     2 */
> 	unsigned short             tx_extra_headroom;    /*    62     2 */
> 	/* size: 2688, cachelines: 42, members: 188 */

Thanks.

Pushing back on another design choice: the UAPI change. That both cannot be
undone, and is fragile and laborious, requiring manual admin arithmetic.

The RFC patch mentioned two other approaches: explicit headroom requirement
labeling for tc and BPF, and dynamic adjustment of this field whenever a
realloc in the stack is encountered.

They are left for future work. But should those instead be implemented
first? As said, this manual hackery cannot be undone. While in-kernel
mechanisms can be refined and built upon.

It seems to be that this series is trying to address a few related
situations and argues that no single solution fixes all except for manual
adjustment. But likely a combination of the above (and more) will.

This does leave the veth peer to solve, but that does not seem
fundamentally intractable.

