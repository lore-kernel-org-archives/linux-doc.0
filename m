Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794441795;
	b=K3KtV8eFlxupjIm9iVNo1sgHaXk1xZZoVPG/qTPxizJtclrU+MhWcXbHsbIRrCIXjcYe
	 6jdQ5kLzb7W658bHYNDxuQ7hbieEtic2ZLrpR98R0ASIlgz/1OsqegbnMxJE4T10VTdnp
	 Nzn9poGOZ2blCliuLXvXR4AwSSrDAw1vpdIABVdiTueJ6klOlXLFJUuW2rvUX1VCAZy4X
	 41tpTpGYOxtryhQrXZtkTeJcGKbpDApSR7+2IEzSKyOLdslvqR/e+vLKuvbbUvcqIoL/H
	 +iDyUWunMjnY/XXcWkLJGJS2iRZixyB9YO9GKqd21r+pBEG25IwaEaSp3M8DbbCLzzQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794441795;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=tSGqJI9Sfy6jLqsvt9BVccCgWOo1O99X2AFDHy843oU=;
	b=UIP4wepOzBmnizMSZ6JsIzRS6ktPkLBUlvXTAgpQrYYKFDoNQ/uJpPr1OuroEM25wPhm
	 UzXrTct3q+za3Pi3hD9lrY2ZbFM2jmkmkKLZ+tns14IIOQE77153b1X7ZOR0F1Itg+1X9
	 HtPQRHmHh7QhgTFEkjYPSnslNmG1Q/Agzh1PVJ5r2dsArypazmRaPXuUMfGOHXEeZZFY2
	 hmHyFpcdb5rVrmXI5hjepscfFGXC0mJ0ADGyDzAN9RagN4AbVoD3gOrjOlPMYSCmuy1CG
	 p/7dxfMRH8XGZfriTkN9ox0yALFqHlNkWLYcHd5OKeVP7gB1y+6rbv+QOk8QujXE9xg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=cILHLZST;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.46
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544F5606A321
	for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 00:03:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 544F5606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=cILHLZST
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6de1fd5f572so1552690eaf.3
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 16:03:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794441794; cv=none;
        d=google.com; s=arc-20260327;
        b=jIjwtkchpD2ClcHiBeFPBeqwOB0NcMPJBMaQ001z8HUXLCpmWFP878L6NSxIcewU4C
         Ierk5v6+2Q/iwa7kDAQL+yWRzRqlDEu8aYLhxP5GNQfJVRxlCNYVjhUZvpex8B3iZODb
         N7hQ6Okes66GQczVQFJFSXqj/CXkJjrfYMMz5DbD+WDo+T8ZaOoEYRmEZWWgaSOsjSmi
         s5QbSR2et/61I3J189TBOzFpDK++BrrwzgBhKzIFIOKdq4i6/Re+HE6pJbkjr+GKmbfC
         McQ7oVzFG3RP0/ck29Bydgd8hgbWwF+Al5AeF+M4DKjP7foDQtVIX3oha1ltVCgUoe8h
         f6lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=tSGqJI9Sfy6jLqsvt9BVccCgWOo1O99X2AFDHy843oU=;
        fh=DD3Ndpr2psSytU0yRdA2Q5m9+XAQJcN1CaSMd7NHCkw=;
        b=guUkM904CR1rg4q8ZawhFlSN/3Dfu1Cm1N875NThFh2lqylXDAJJ5yWElDr/1DcdhH
         wkAmy18mRKhAmnCWHE34G8NR3WpRMmngLBYOZ9vwyZk1s+fFsAp/RF7xviSCyyLQcSGY
         9RDxCAvnQfVlFNK6Gfs3uGLVDjRVKYz5y67ad27OPnO2dJg5Ggy0+qsMpXZfq3A0efH3
         dxYhYKftcB3CXxwTtRhC6hPKz6MfxOm57sMXTw3z5kwYtPbA3zNOI8fSIEqLp6zVnlDT
         ac2gLI1HzAMlk0XNZvEkClxYj33WDG8CTKmya77Op5sMhuxLxU5pB+yIdYxbFPOrdRyD
         yn1A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794441794; x=1795046594; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tSGqJI9Sfy6jLqsvt9BVccCgWOo1O99X2AFDHy843oU=;
        b=cILHLZSTnKQEkbe7N+Oc0kZd1YMJ90v+inoo8hnd/du4Q8+TI7ThmqwGF7mc5pC4Zc
         p3RST8uK9+o/pASznYLtV0Z7weQjU6OIrJgytinvIk4otwF+rNEOKoimbWWnNMqH5buJ
         xCLw9HMNTcZlZTRHoJrN6pcicTv9FCZZeYbCVTLEV3d1vbtkvmzglrLY0Rw0y2iTXn+U
         z7pDnxzc2gWXMtz92BavIWrAnQ1cEvS0+M9IK0CPUjNYAYrv8VaJisHOkU80CgP/RKfw
         MyqjjMvpkeYtcCpkYSm24Gf8unvyyVbX7NIxTeOG3ssNop+SIoW1Unp6JfOBJr+qi4OR
         Btjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794441794; x=1795046594;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tSGqJI9Sfy6jLqsvt9BVccCgWOo1O99X2AFDHy843oU=;
        b=DBQGuAibCNawUaMkr5cLYymhAbpBoaqQa15BolTK6ECWAzFZtSqOyXtSoptq8X6n/B
         FH3uUzYMKrHtgpDPy65Dp39CaLcsne++8jlQcPmuwd5Ws9qqNDEc4qFSFcQ9H8rasB9R
         T3kM6bSsofaoIzurgdWjp2a0OHP6NheBe3137loksTIJ1iKdwkgcDVmT3n3czndqGaZP
         nWT2VNd9kU1qCQ7YDqPBgW4fMPuGCyeqsWcMbYOGUXnthZTXcGgCDIWLT4hlvrMASPmr
         k3MUQZn6rIPbsTNJ6cw0cH9fKIanSWxae8Wl0SCqR79jFP9QX1/Dm+nqbwj8T8OWVy50
         XeZQ==
X-Forwarded-Encrypted: i=1; AL+hErG4dJ3eyd7379a5iH2LPrj9qaZZ6gd9QSjFZ6WYbhphxdjJTCHzz64P9U6d8Wzms23YNZ5E/ucPRY0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/JZyYPPvT0vtxJ+VDhcnEeEiHpYs6EMBpqTVVKKjlG+Wn+j+nD
	c8vtxv15LLFtziCYB71Ome9ETQvYu3Q0I34RUXg585ZprW14+zi4nhNREFLLIZpDJPjzG8fX396
	i/uPsgqB1nWdiPa9dCEGWzSQI4PGhQnjNcGEEIjE1xA==
X-Gm-Gg: AYBFou213uDxb6xAAlPs8aAb50kUFQyu/QhrC9gkzirMAXWzGcsqaWoQ7NAj0Crrye1
	RmK6psrQ9mv5ap9aXmSkjwTlQ5Ivnl0ddk9vxgnvY5qSoXvxlFFf37IVLV61NI5RDMj7Gk7sl8+
	af7UGSN2es/fYwFxwPDUhEFRyrLvdMDbUzB0A+XWXQd+BvlTXSYq/f7yPFRyKciKHytPZyOMDsH
	BMQzgxxT2UlW3SKnaafs+LPGvK7I2JSzLF2Ij8LBUrtM8WDMJ9BlrM+NV4tNXWkGp+CBuqnuhw/
	FZVyXaePGDgVA1iFdAXwK9sSrBzzDz9a5JlEi3ayCRKu5B1ZWRzb8KNhkAFK0Nr6FQGxBBpXxv5
	UgtYmoeTebJE29/arhmT+CPT/gM22SrslQs3g62xWY4dN4Oaa5sqtqGpanPtUIJixceobbISgae
	TpiBsbRknlxg==
X-Received: by 2002:a05:6820:1341:b0:70d:8086:e48e with SMTP id
 006d021491bc7-7191784f4c9mr2405201eaf.20.1794441794070; Wed, 11 Nov 2026
 16:03:14 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1794020868.git.tianyi@cloudflare.com> <e90e748e0aefa7cbe1c2b31b8c7902ccf135c3f2.1794020868.git.tianyi@cloudflare.com>
 <willemdebruijn.kernel.1d64e7848503b@gmail.com> <20261107182526.69543-1-tianyi@cloudflare.com>
 <willemdebruijn.kernel.2c6a653eb65fa@gmail.com> <20261108190831.3f991a13@phoenix.local>
 <20261109154909.32748-1-tianyi@cloudflare.com> <avTOvr+yy+2j8xrQ@dev-dsk-dkeogh-ai2-36d3b9a7.us-west-2.amazon.com>
 <avTSBFpR2t7PO9tx@dev-dsk-dkeogh-ai2-36d3b9a7.us-west-2.amazon.com>
 <CAG4wq-d+LtEi-omGwzgqx14rCp_4J9HztGMpa8ioMsviaPw+ZQ@mail.gmail.com> <avT4CezZCiRhvCXw@dev-dsk-dkeogh-ai2-36d3b9a7.us-west-2.amazon.com>
In-Reply-To: <avT4CezZCiRhvCXw@dev-dsk-dkeogh-ai2-36d3b9a7.us-west-2.amazon.com>
From: Tianyi Gao <tianyi@cloudflare.com>
Date: Thu, 12 Nov 2026 00:03:02 +0000
X-Gm-Features: AclHuK_s8wIPjsY9dzqaekzO2VZaPxMJTb6Tg8Z4dNlh8vuXp1Ar6fObcRSwolA
Message-ID: <CAG4wq-cyLyxnnmhPvL+ZNmnXGjBp=OsbBNE=16j6WRSVJ8uv3w@mail.gmail.com>
Subject: Re: [PATCH net-next 1/8] net: add tx_extra_headroom and LL_ALLOC_SPACE()
To: David Keogh <dkeogh@amazon.com>
Cc: Stephen Hemminger <stephen@networkplumber.org>, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, netdev@vger.kernel.org, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Simon Horman <horms@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	David Woodhouse <dwmw2@infradead.org>, Dragos Tatulea <dtatulea@nvidia.com>, 
	Nimrod Oren <noren@nvidia.com>, Alasdair McWilliam <alasdair@mcwilliam.dev>, 
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	Magnus Karlsson <magnus.karlsson@intel.com>, David Ahern <dsahern@kernel.org>, 
	Ido Schimmel <idosch@nvidia.com>, Alexei Starovoitov <ast@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Donald Hunter <donald.hunter@gmail.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Breno Leitao <leitao@debian.org>, 
	=?UTF-8?B?QXNiasO4cm4gU2xvdGggVMO4bm5lc2Vu?= <ast@fiberby.net>, 
	Danielle Ratson <danieller@nvidia.com>, Kuniyuki Iwashima <kuniyu@google.com>, bpf@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@cloudflare.com, nh-open-source@amazon.com
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 11, 2026 at 11:19:37PM +0000, David Keogh wrote:
> On Wed, Nov 11, 2026 at 09:41:32PM +0000, Tianyi Gao wrote:
>> By the way, I plan to support tcx only in this series. A tcx program
>> is attached to one device, so the kernel knows which device to update
>> on attach. A cls_bpf filter can sit in a tc block that is shared by
>> several devices, which is harder to handle.
>
> tcx only is fine with us. Our chain is attached with cls_bpf today.
> Rather than move it, the simplest option for us is a separate tcx
> program on each device that carries only the tag and returns
> TCX_NEXT, so the existing tc chain still runs after it. A few
> questions so we can check that this works with v2:

Yes, this works.

> 1. Is the tag read for programs attached with BPF_PROG_ATTACH as well
>    as with BPF_LINK_CREATE? "bpftool net attach tcx_egress" uses
>    BPF_PROG_ATTACH, so a startup script could do the whole setup
>    without keeping a link pinned.

Yes.

> 2. When several programs are attached at the same tcx hook, is the
>    value the largest tag among them, and is it recomputed when one of
>    them is detached or replaced?

It is the sum of the tags, because each tcx program can push headers.

Yes, it is recomputed.

> 3. What is the exact form of the tag: which BTF element it must be
>    attached to, and the string format? It would help to have that
>    documented, since programs will depend on it.

This is the form I plan to use, and I will document it in v2:

SEC("tcx/egress")
__attribute__((btf_decl_tag("tx_extra_headroom:64")))
int headroom(struct __sk_buff *skb)
{
return TCX_NEXT;
}

The tag is a BTF decl tag on the main function of the program, and the
value is a decimal number of bytes. The kernel ignores tags on tail
call targets.

> 4. Is there an upper bound on the value, and is a larger value
>    rejected at attach time with an error, or clamped?

The upper bound is still NETDEV_TX_EXTRA_HEADROOM_MAX (512 bytes).

- A tag above 512 is rejected with -EINVAL in tcx_prog_attach(),
  tcx_link_attach() and tcx_link_update() in kernel/bpf/tcx.c.
- Several tags, XDP on the veth peer and VETH_INFO_TX_EXTRA_HEADROOM
  can add up to more than 512. The total is then clamped to 512 in
  netdev_update_tx_extra_headroom() in net/core/dev.c.

Thanks,
Tianyi
