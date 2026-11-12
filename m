Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794472366;
	b=rmcUVrRW034FGvSYu6I0eOk+ze4XT3oW3ohPF+SDBbcRlwUdqLiP0mDu/kCDM0EVB4jS
	 iA2iqAhuAb5KnVgCkQfLD4MKQWs9CyMpepoo3a7o4khTP03PKlDi0Ii3uXk76jLhsZXi1
	 s2bYaIKktSMPguhsw1CIqPvYpyrVedWkSkCabVtzs+ffq4UOAhozIZM+56WzUhWjBfCKq
	 Y+ProTq8NzuGGMP2bG4Je+s/lKG837LSBX4/pX3EafOXPubDn1obsEusZsVWwap3SKRSh
	 47quhfrVBz8STYHU3JGmE4eHEqFP7Nq4f4kCbAA18sT4Q4rynOWawFcNYbQ1gL4QRnA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794472366;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=0l9eWNYt+4OdoC01Aa/h4I10jx5l5dY/DXFWNFAegOg=;
	b=sXERFQvKBj5w/PMmJdQku31bdT+iP5GS0X7lfvlZ/bmqyqL/Wh1aI6yr5Mf8UkAOu0qb
	 cES7iQWE7d81gZ/uv4A6GxIIC3lDaSU1reBtOkUyv1xftj20trwxPyr8igk0ZzYIvQ0ei
	 44QTUszCPtNJm/iU7QhTDMITYG6odEeSgjAc3oeSreAZjkV1DsIdac30vnuSvPIx7KaVR
	 9/g1run9hnZD6CYR/MOuikxk+PPVdEjL/A/pKD4hEwMb3Xn6m40QsyL8qQInCZYvtnz8t
	 LFEciJTuz3HWTOrMDa6VxDC5tfqzNKUeHqj3dC/jvObSjc9qf+odSQ4Axdi7EwXS22g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IjZZzhPX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2466160A5BD7
	for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 08:32:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2466160A5BD7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IjZZzhPX
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b596afb4c5so4614285a12.1
        for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 00:32:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794472364; cv=none;
        d=google.com; s=arc-20260327;
        b=CrY2tPZBZtmgVp6S1Wab2nEM30v4whA6ENTno0yEKuxICa1SnKoSefTbhJFYNHuL0D
         VAzBf2k0yaS6Bz3lL9/2TCZ1i6kKkKEY1sG9Cj0NEsUjSVByttJ4f7es8S8SAVz6oUOB
         APaPv3tmenKm4HCgWOMybmpKSHJGg//eA0pfuN1bneDRl34/3QOsRNtVnEOBuS65NK6U
         zreVLP3+G3JnP2GwftM8XcnDOWs6TBSL4YKGnDD12zXlTw/zhAu2UJ4nxrmY8wCSS/9z
         6Cse7O5K0H04ehFdqHQp9eI81eO/HGw4gRtbZdBXs6OHY5cDuHvyVA1/tLm+1hG0j2Su
         ++Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0l9eWNYt+4OdoC01Aa/h4I10jx5l5dY/DXFWNFAegOg=;
        fh=NGd7MaopBj8kh/my0zzD6XF3a8gtpn1ho4HBOQUa3jM=;
        b=j6DEu4TFik9ZUuiGBO0b3t0Wdwj1pZBJfUCHXydZamWyrqcBtBEOMuIn5eCphEhbR0
         rrkuow62gSkujCGBr3ZZr/cnGKeIM97KRdty5JRXCvOQ0f+a4wHBTmQ+RByQ/adRgaGN
         b0VR5PKgDJ5aX1uOyD1YJBQ+RU1FwwTNWElnX0G/PRhJFE9hhno6/CJK+B1g/7IXyEx1
         9v2H5wW1Lay23C6kFdWDGlCsij364OlN7nszgc0aHv26ACDPbgVi1RF1ikYJ+1bAwigg
         HGi8wI9s6voFW+XWraxS9qohN14vstjjZnJXD/T7GCTkeiqRBhutDQ/5tiHUZzArx3nk
         lN9w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794472364; x=1795077164; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0l9eWNYt+4OdoC01Aa/h4I10jx5l5dY/DXFWNFAegOg=;
        b=IjZZzhPXrQb+C82MzXH+yaFZMdw3I1fS6f+ZKPUlu4rKAv7YGY/A4npfbHZ01BDx4/
         vehtR2RomeLqZqfjL08oP+6ImriXxgfvzxYVKbLJ5TeraSk7AGdN2BqZCr8Wfl8Y6rKb
         hLv1UqaQKCKAPrnqdk/3nPwU63dOGY6TlaP1LNzhv3oNk0/OxVEzF2RdbLEzQ5w9cEX4
         CDX3IJKXBPew0T49m9+pPKYVvmv1QcvsMgpSfZrVqfxCa7YIZusZzdVD8FqruquU+RON
         bGCSzVs/dSbZYdxZLgr3yfjig8gMvd2nyMgu+eUgDB2zpv7w8KhcsyyzDz+XmXgXnOt1
         V+Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794472364; x=1795077164;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0l9eWNYt+4OdoC01Aa/h4I10jx5l5dY/DXFWNFAegOg=;
        b=MFfuEDjv5TKkjOrDJVcK3V9xkkBP+d5+j8s5CK1ksPnX0fFTzvw1dXpQia1AUmzWer
         Ct0DT6QVqWykrQH98Iyc6PLxZBc8aXeFQssqyF5ZOCwG8NJtyirTQTfmI2dyOM3Z5v2I
         4TEhzREmdqQ3C6iKX0IrrIdj7kb6vgdpt8aIm3twSehmJqb5rOHH4s3z4XQRJoy5nBOb
         ig0Vivh6MqMqbDB0c+mmg/2zu237Q33IRNuEeqc/XEqw6lCjFDLADQoqJn34IrztW0+V
         4nLd6zWz23aumwXU/xb3pG/AbkM6BOfVcs9vey4La+UKhf/OZkCkixrFV/+KpliulMJ2
         B1Wg==
X-Forwarded-Encrypted: i=1; AL+hErF/lzGedzYv+6v4vmzLNPYC2RUo4XsVx8EglUyncouM8ySxPSCZxmWHdqFPIR1s/iwBLXbm1GK7UHs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8PbRefS+Qu1ZlUuV+/SlYkPtwInlfu3CSTHkrETXgTXItHOvuI
	7YlT9Ek3GYEjyy6RmXB62rSqHbMRSYlVrKqszwTZ+oFhJ63mG0hVeUklYgnO5GYw7SuWObQ7xFv
	yM1C+U54EUJuocw9oWez0vIi+DhI5PcM=
X-Gm-Gg: AYBFou2hkjvoijEGNDDAI+nbE6fN5oHunL2JE5hUjuOy0WkHZJy0Ma4ihi/WAIDFXB2
	7Qn3lNZE9eQIZl2v0GrluKgL558Yn/flftfqFxRAVot3XtaVwxNSFk68hTUn5v+XTsKUblTEplk
	k3RhyMk+rHrrYiUZxGeaHUuIKhq0QCtwv0d1ZQL9w4CgRfPJqJpxG2WfYTxSyf1YoEMbNkqEZqS
	Yv1b3u2oUqCbUG7vAfCO/R/ugxAIKfk/A+qUB00DOX6nrNYS5zuL8TE7F0kZeP7lMFwZL5+M9mr
	H6i95i3hnhyjZUfHcA/tnJaaZ2FaUKENVEHWAJkfFscVsEkp9tfIhLZE17mAIpH12o2Q1goKAv8
	VjVLFvsuA5tUPyl9EfIh1MUFKah2HhjdlTQSDh7P2Ntyxgp5S8D8HZPI0NP2fBrtAo3RCtAE=
X-Received: by 2002:a05:6402:2711:b0:6b7:a357:375b with SMTP id
 4fb4d7f45d1cf-6b7a3573c70mr809364a12.40.1794472364208; Thu, 12 Nov 2026
 00:32:44 -0800 (PST)
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
From: saeed bishara <saeed.bishara.os@gmail.com>
Date: Thu, 12 Nov 2026 10:32:32 +0200
X-Gm-Features: AclHuK_JmHtMGasdG1MlcgZSR9JInf5KlnPcivwlvNEZTX0IPHWZAk1Q01MwQ2M
Message-ID: <CAHfVqdVYBbs8zu40nEaCDvGVNeXHe2DXh0dGxEcgL3kP8S8_HQ@mail.gmail.com>
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
	Mina Almasry <almasrymina@google.com>, 
	"Mike Marciniszyn (Meta)" <mike.marciniszyn@gmail.com>, Weiming Shi <bestswngs@gmail.com>, 
	Nikolay Aleksandrov <razor@blackwall.org>, David Wei <dw@davidwei.uk>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Stuart Clark <stuclar@meta.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 12:27=E2=80=AFPM Bj=C3=B6rn T=C3=B6pel <bjorn@kerne=
l.org> wrote:
>
> skb_frag_address() goes through struct page, so a net_iov never has an
> address. Only unreadable memory should lack one: XDP and BPF read
> fragments through this helper, and AF_XDP UMEM will back readable
> net_iovs. netmem_address() also returns NULL, not a bogus pointer, for
> an unmapped highmem page.
Does this mean that skb_frag_address_safe() is practically identical
to skb_frag_address()? I assume highmem page is the only case where
non niov page isn't mapped.
>

>   *
> - * Returns: the address of the data within @frag. The page must already
> - * be mapped.
> + * Returns: the address of the data within @frag, or %NULL if the CPU ca=
nnot
> + * read it.
"CPU cannot read" isn't accurate, I assume that in iouring case the
buffer is mapped to userspace.
>   */
