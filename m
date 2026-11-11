Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794359279;
	b=w/CsNI/f0AQc02/maxAelr4b5Pfl+OrQ+7pFt6pZ1I/IwaT3clzousPs4Yq4jajHt1VJ
	 3ANahNDTmnzNc889kYjEnRoVVSCdBdSABnrJwom9w999O/gw4Dxp7UbhE9SdFBLlWgMlN
	 bQg0HsnJKG06TGx7GN47h4FHKk3l7KnnWNngpnajhQI4hsMwuqgggUIaHMxnK2oYPQfjr
	 JUxVuiKvQ5PkaN1LCiuWtrwQ7a+r4/U/cJ3xfVPJgf79e2ylrEg0W3CJmqC5s6yDmEpt1
	 fjFzfM+0LkMlOunkTY1qffHrMIHCwAzxfHTAwO6bQEAyo6mHweZlqbqo6QiKQ5ociMQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794359279;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=8MFwGdApl0d4OiJqtJrDFLzpxo7TMPDirGuojCnnp6s=;
	b=UjZpXkqUESZwfSxk/4pSzw7tc44QbPuLngjsfgQ4ztctazOuZcay7wLit6pqy6wMZZxX
	 +EynRyHV+XJiSxeRHi9ka+sYn1yPIW906ITztv4ciqPSeReF/x6fKh265ywCpCkFGv7DU
	 jKDdDm7UWXznxvOpEHh8W1c7FC003p+10eEG8ZpKn5X16IO212QnEn+JmVGUUnn77nXfm
	 xf+yVB6jW9A+XSt7D2JRuy1qmdVgdmJMvSn6qkRZSTDfRQ6oTYafZvCxzxN2C783Prl05
	 N8G17hI5dBW57AZUWa8P+ZxYUZb2G7Ed9pQJd5a3rjIctx3vawzMTcPfc2RBTQmEOfA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=EjLXsw8R;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.53
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE0F606A321
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 01:07:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EE0F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=EjLXsw8R
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-70b875f6f13so2110625eaf.0
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 17:07:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794359278; cv=none;
        d=google.com; s=arc-20260327;
        b=L8rye9SNJKXa7AQET8cworlUokzgpxcDjGjIzTMT2dJQo62raYJTPXWX/HZwldjuz+
         EsNfhi7oL6d2MhX32WwBdqgQ7IdluKxwTJ4opi+hMqfeNjzd6XazRC3cPsvRkK2DTywa
         jVyoL46ahKCcu+P2K5J6jH9P9bHh844mHrhlMb3W6wTkamM18oVAd/0XDfbzdGvtUzQn
         gKNUCUDyDhAotSdPXHlHw+WaduHF1JyDVx7reNR0sIIHHhCouWrjL9z2pgpU5P2RIjjC
         bZ+ludnzVQy6e3HGtbqCjnwwCVNs7O2Le98UYozISjklAUvkvirHi3PWvEmNCRlza6ib
         wiQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=8MFwGdApl0d4OiJqtJrDFLzpxo7TMPDirGuojCnnp6s=;
        fh=9peviM1OR8gdnxmNlK70cAo/rIYcUaiNqrsAQ0ZL78Y=;
        b=TiWIDj0+ES0re2IwD9dg7ss5fmgZhyR+VIKPMU8g8o69QUrkKHH8TpC/wKTCvUozFE
         gEm8bVXo8HVOa6QNuYE90KotTU1GpmBtgywv4+NkXyHyt7amhlzaUJ8t7+fUszbws6Tp
         zuOj5CJqZxTHRAFGuDMXWdHq37IMMTKwhC1s0mTVV6zeNPJbXC0HGhcZzqRQtDvDkX35
         HZWXnqVezaXb8gOWxClKGO14Hvkeq70Rlq+M7pZds4Hr6GW/NVNbUs0GYd30Q3yLDwiP
         hET8K0It5N2Wd+M727etAXSh6ZOucam0/RFhdrP+azzrrbwfLuu2MO77RhQe+uN7BFsH
         kV/A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794359278; x=1794964078; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8MFwGdApl0d4OiJqtJrDFLzpxo7TMPDirGuojCnnp6s=;
        b=EjLXsw8RYK9LddS4DSnzgL5BG+S85ls0lQHexUCxrrgOE8c+nbSlDaIhvMJmh3Eer5
         vXDdlz1/G98drqKh2hlkTWXUSxGkTgmok0qV2/fAFr71FqSgI1rOfEqm9I91pXhGhN+a
         fGhndmMZH5sQtIcdP2A7UiHMpAinpCQNyPuX/7J16MOG6BqZ0YCXUzkwK1YtUfg0GrQp
         Di4IW2RD0lI82lG0B9Mjfd+WCIP8XIOqnfufvF5iAwcdpNhJDSJ67VHK1ubTbL/9PMK+
         e61eCud7B1dK+MmTSNY22IE2hj2vuMWWhpkIMajTHeoeI5K75VM17Y4BrNZH7Z8DDmLy
         3Hzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794359278; x=1794964078;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8MFwGdApl0d4OiJqtJrDFLzpxo7TMPDirGuojCnnp6s=;
        b=mJpZVZII00g9oR+/XLibEfmtpU2x8zhh20wov2mfPGGbXXw9mU2ZQE+46wxTAzzZO8
         9PXzG07vNNSMZDUkGbjAogLpV4wEJwFdO0GY6iYkv+uPM8eJYF2s5ZCOcAz8xB3JgsA2
         ZZ22pijII17wUpIycJRkjLjtVvWARAOcf/bWlvFaM/j0PfmW1TBgvK4jaqhzlMIg/xKU
         j8zw55Lv+j2uq0iRnZ/9mkYflyWxCvyItBaeALh/jLCJyA/NFyXpA03novGdW1Pgq/9i
         NEWiM8IeT04pmtkbxryYGvH5iXSQqZXKV83rnDVl0Jru6EVHG06wN6Y4hFnPCxfF9Rts
         CCSA==
X-Forwarded-Encrypted: i=1; AL+hErHqZjqhpxHXsXGz4AR57wSQpQdJksCmcxnE3AWoGedybBCyaDofh1Le6wh0mbL9fQlFTeWv6OGIeqw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/KBpYZhxKi1NaG6vjPw9q5SFo00Tv1eNxC2zLeOizf1BGfRQwB
	lSvYhVCCovmx8yLCnh7N2fKEFpzLQHPTh6Nnmvr/BEagE3zijWlRcNfdtAHyR0Fq6XQuFJeh2Uz
	vjUT1m8Gh4UunT0jbBUig/kqLuC6dmnwQ3eqZT6iO/A==
X-Gm-Gg: AYBFou1KGxblrCDcHj+RWNWQyycdzHCmduBJE07C6HnMH6Mqi6tCSxSc27TkZajfLaS
	ASykh7NRgp71tiC3C1DQOz0XcUAt1hbBkOu1XwOgts+aPHK9YzhTXXcmG1quybq2qKngzuMIT+4
	FraKQ9x2YJuvUgBLGuhLtD2KudZptcaB6igjb/g2DSUJpKq9QhfPTqYfnAFoVRJukxNrk1tVeOd
	5KiN7M2kUPJTFh4/XRrB4t5zug67UAAK/suLqWX/l/EWHugSGXzBodjpdXHSFZ6Mbn23RV1myUl
	LeZuTrxgS/DUDUc68N+2k2YqW2YiSR96BwdD4GociStSrXYOU1S/FZL0pq8Kh3QbG7NkQ15oSUf
	DRTNJbtJuafJ/7eE3od0KPvW/NKoEoNuPLZA+K9BETwmL4LzFIRjYWey+qLx1hi/zwMNqm8Bcoa
	7xV+wvWdyodg==
X-Received: by 2002:a05:6820:16a9:b0:716:c04a:4771 with SMTP id
 006d021491bc7-71917858218mr598043eaf.24.1794359278033; Tue, 10 Nov 2026
 17:07:58 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1794281983.git.tianyi@cloudflare.com> <avOvI8xrHI0dwyHj@devvm16445.scu0.facebook.com>
In-Reply-To: <avOvI8xrHI0dwyHj@devvm16445.scu0.facebook.com>
From: Tianyi Gao <tianyi@cloudflare.com>
Date: Wed, 11 Nov 2026 01:07:46 +0000
X-Gm-Features: AclHuK9OIHzq1A_ViLb9jLKzo-flUIoCHThbTHbypb5m7BOmw6IeVMdp_ZFoAAw
Message-ID: <CAG4wq-egD55NZDw+OKVKTKN2tQJ9oKEC504wFv=xoMXyJ-0z4g@mail.gmail.com>
Subject: Re: [PATCH bpf-next 00/15] xdp: add SKB core extensions to keep RX
 metadata until skb creation
To: Stanislav Fomichev <sdf.kernel@gmail.com>
Cc: bpf@vger.kernel.org, netdev@vger.kernel.org, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Jakub Kicinski <kuba@kernel.org>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Vladimir Vdovin <deliran@verdict.gg>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Donald Hunter <donald.hunter@gmail.com>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Tony Nguyen <anthony.l.nguyen@intel.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, Magnus Karlsson <magnus.karlsson@intel.com>, 
	Tushar Vyavahare <tushar.vyavahare@intel.com>, Jason Xing <kerneljasonxing@gmail.com>, 
	Nikolay Aleksandrov <razor@blackwall.org>, Madalin Bucur <madalin.bucur@nxp.com>, 
	Ioana Ciornei <ioana.ciornei@nxp.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Chris J Arges <carges@cloudflare.com>, 
	Jakub Sitnicki <jakub@cloudflare.com>, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, intel-wired-lan@lists.osuosl.org, 
	llvm@lists.linux.dev, kernel-team@cloudflare.com
Content-Type: text/plain; charset="UTF-8"

Hi Stanislav,

On 11/10, Stanislav Fomichev wrote:
> Awhile ago we discussed the alternative of adding setters for xdp
> metadata. Then the veth (or whoever turns xdp frame into an skb) can
> apply whatever metadata it needs (and there is some magic behind the
> scenes that takes it into account when creating an skb). That keeps
> the layout and most of the code outside of kernel. Have we considered
> that here?

Thanks for the reminder. Yes, we considered [1] and [2], and took
parts of them.

The alternative setter model in [1] requires a program on veth or
cpumap to call the setters for the RX metadata. We want to avoid that:

- On veth, an XDP program removes software GSO from the peer, limits
  its MTU, and can copy skbs from the peer.
- On cpumap, each entry would need a program only for this.

This series achieves the same with only the XDP program on the NIC,
which stores the values with kfuncs in the skb core extension area
after the xdp_frame. cpumap and veth take this area into account when
they create the skb, which is the "magic behind the scenes".

[1] https://lore.kernel.org/all/20250616145523.63bd2577@kernel.org/
[2] https://lore.kernel.org/all/aGvcb53APFXR8eJb@mini-arch/

Cheers,
Tianyi
