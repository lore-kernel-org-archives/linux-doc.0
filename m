Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.161.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794433305;
	b=uPjLdEJgkFgDKSl/iWdtXgZkICa5kANInkyeT88Fzm60zMv0KHp4ktFwJaSGfQdFCF0S
	 73WbTMrvOMD1Fay4vCKcn2Oc7SGqM7nxkOefTpqdwsey3TR62aZY+3uKSZiwFnMW5vkiy
	 RW3/oCKecxPCzJnAzmnrx080edqCCBzp2K8ulvARTD8raqy3pIMDw7hgzWV7G8ZNGfRQL
	 9kO506QBQCULZIjHruNF10ZfuUk9v8wypSem0JE2Yvv4AMo+0DZ1N5B3zOep/a4Ju831Z
	 Y0dKeFKDbYjv3DRVsEU0PWxyLa19GJx90s/kUJgOa1yanZNJmRi+Tsy6sua9p1h2bMg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794433305;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=I3NsBH7dbDhUWpFoVCuwiBWZEyjMNzIdlKNXXp/dwQk=;
	b=1xLxVzI40yHFgpqllkYzChQSQ/vjEntThTPdJlp4uuxW42t9R2QL3WH28BwPyGvMp3gw
	 tBQZF3FL5igpdhLKTYuqC3Rl4V7IpF1oUmpDbm1kQEDrbfkz0Y1laz+hJNpHCVBPouDbJ
	 9ls1tM7bJevUyYBENOHG5fS+uyyaFP4NaH4Z2MsfNjHmn/X4HNi82BNAfL2o/UYpXyJZS
	 kS7qiwu+dLcckCDvfpGaVe92be0l6E1B+YF6IlCJkdFRWLlT74rXFwfY7to0YeRsag9pu
	 Pv7WKvvZ0j7alXvWDbIbwRPsKW0zrE1a2GkEgvh+w0vxJFrETNaOSkjKw69tI+8ri8g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=UcyXBCV8;
	arc=fail smtp.remote-ip=209.85.161.43
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8306B606A324
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 21:41:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8306B606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=UcyXBCV8
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6b8e2d8df4fso2144725eaf.1
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 13:41:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794433304; cv=none;
        d=google.com; s=arc-20260327;
        b=A90ZMbUnE14hBWlA+TgUHMG+GnbE14rnGZUA35gEGZlGSl/WdESZ3xj813exDYo+KR
         WuiVb0GiXYbImFohHGJ/XIqvCzqc1f1+LJ+Nw9Ymi7Te6P4kWNafJemlm+cyWqbxCE3o
         6cCrvKWYCwPxU7mriunJ7VJTRWqLnlsFvs4ri2d/wPOB7/jkJLzYQ67IhGfjuBzA7vBT
         hZaaAl/W7EK9UrK6/PPd3QZx7t2I0rijINOKtbI4CrZcc47KL2rUzS0fkL7H2w7iuXZP
         y6N+Tl1uUhTQsbCAwUBE/NSquZYxjwf+8qAU8diDYowm+tiKpHYykLrvtQ43Z0WFhpT8
         o00w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=I3NsBH7dbDhUWpFoVCuwiBWZEyjMNzIdlKNXXp/dwQk=;
        fh=hox91r6Yyxz9SBV+5483IOxYwjDmkNLLZTNPGkRVp8E=;
        b=QvAZKmDiHYrqkUXPgH+5PP0gAm6qskBNR5zORDC44kYKZJPMwSsUInahnNXJc5H48+
         NeZtfRvVk5r1s6LVeUFRuFr/KoE9ZR1rCvFVeAZDY83AcBgRgnfUpaZsMWh150be6P52
         CYM5akrkpOszg01zHO5TtyWx8EvbqC95DK2XGPvZ3+KyCtoGlGLwTWlsGDnk7pCQJeau
         IPv1uVIX++sIYKgUuc76Pk6cw3u78Chii2buEUlkKLpXC7vJWEkGAubqCjlGQfaRCYIu
         dFm5CLTHfZoEwUrWLI3PGUn3VE0fAdObQaXWMWg54bLhjw7d1GvfpGIK3W7PtlxT4EKC
         P0pQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794433304; x=1795038104; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I3NsBH7dbDhUWpFoVCuwiBWZEyjMNzIdlKNXXp/dwQk=;
        b=UcyXBCV8rw5ddDzDbkoaJQUVWsIT6kVT6wFFWaz1WNOTMbtQXHB0ZwAqYFcr23lc/l
         7Av723/mVkuv1fOQ79N1SNhCfGc2WVDE7cx217hf1YgVFaYMwIN7Q0bLPWoxkBQCpAeA
         q3vC3GcTxOGHRg8wY+fKEME/WsXwlxDoth3MH8wNkNJnDq5Mldxkv0PeHRBYE7Uuxeko
         LHd1kyueEJ02RLdSIH/OyvhdIO7gIrV8aGNUYZeuBK4UVS45ZUo2quIU3AVZhRDlZ9at
         4rr3WJlBr2V4t0HbZicTPu7UluOtwoWSsbYyEJg3lkeg9bNphizDGEc3BEzwiH4a0tfw
         jWHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794433304; x=1795038104;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=I3NsBH7dbDhUWpFoVCuwiBWZEyjMNzIdlKNXXp/dwQk=;
        b=ya8aTKoSTxME3Rvq76GLw8t+vMZWWFP7Ggh3urDQAkV5tmCs6KIS353rLJruGbOx22
         7Mq6NdEN4z8tpsECwb6Qm5RNzDjMuYd1ii+W657caprGai6n42BoJ+Xv3hKNp1Vm4k0I
         RatTtDUvmIGwgmJNXMWzz8JuLG0UyTQ/PxEXBbRGJVkxuqmG5dDo9KWUHTNZoAMGJU0C
         S5rKxMBUp2mwCruTf9nlqVvUIY+z0QOAZ6nkf4FQ3Odf4kGApOPFemNyETW7xzJi2VF2
         q3TA21K8CLSaIT8QY+Qc03fE9gMpneqszldoZojfBzc1VmGmqzGnCuIc7A05p8EP1SmI
         rBAg==
X-Forwarded-Encrypted: i=1; AL+hErG8v+aldCDAQG77BDVYiyGdJfKZfE8IpuinryXMQ9muzeSRPU0PcDeb6Nf6vdH1KitWiZNkquGExSI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8hq5RCs6713X3PFjiB89PE6m+eISU5TvzWTUZBO3v7aQysXGWt
	gJLSL2Ea9bR1d7a2YKNVa3QC+UllC+xKOsJ1RAbRD8qTQ0x3GjDDEKLiEkkDidkX5JGBioPVnR8
	SU3aMuyxaAlb8MqOdr6iu/jOkT9QrBkAOmlB8fzqVnQ==
X-Gm-Gg: AYBFou2e15F9u2FmswBj6zve7HUg2vkLZCgnXGZtOy9NVKc2mk9jB9+1XEW16jUMf2d
	Bmkq0CUJj9zwrkljnwIAsj0PLp5J4APv3wn2PQNwLO1pD5Sxayonu9qPuPVX2NtLbmZQPOEVya2
	pXQLyuxt8QnWVsaC/woNtAAvT4TVGPj+RC7aNctj/1aF1THuFup2VvNM7kcAsDNEuzxqDbj7YB1
	ETYpZxxVuzQdt+b8PBfq/EqA4kVazBV14kByjdVnkuaOXcBFX5b5LZZ0mHDY+m3JhtCRNqmkI53
	mHl8u8R02Z3flgKP2MHTZnB100F7oj/XKj567Qhpbs4P69AXa3xBuh5wD6rjZF5522pBUC5U2C9
	3aBycI+4SafoYufKR1UxEjjtqPHNcjebZ3m6YZqe8ZGTvkfgnJTOxvtzskzMYXW1pC99yz2PBJf
	efZ7ifgeOkfw==
X-Received: by 2002:a05:6820:441b:b0:6d8:ccbf:a7c2 with SMTP id
 006d021491bc7-7191797df4fmr2278556eaf.68.1794433304290; Wed, 11 Nov 2026
 13:41:44 -0800 (PST)
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
In-Reply-To: <avTSBFpR2t7PO9tx@dev-dsk-dkeogh-ai2-36d3b9a7.us-west-2.amazon.com>
From: Tianyi Gao <tianyi@cloudflare.com>
Date: Wed, 11 Nov 2026 21:41:32 +0000
X-Gm-Features: AclHuK9Lzd82c8LN3lRJw2ClwKtYPqt-3w9VlW5CxKeZCzjufsRqZ2sayCWq8TY
Message-ID: <CAG4wq-d+LtEi-omGwzgqx14rCp_4J9HztGMpa8ioMsviaPw+ZQ@mail.gmail.com>
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

On Wed, Nov 11, 2026 at 08:37:24PM +0000, David Keogh wrote:
> Our TC egress programs are not attached individually. A loader keeps
> a chain: only the head is attached to the NIC, and the rest, including
> the program that encapsulates, are reached by bpf_tail_call through a
> prog array. The head can change as programs are added and removed.
[...]
> For the BPF-side declaration to cover the TC egress case, it needs to
> account for tail call targets. Tianyi, how were you planning to handle
> a program that is only reached by tail call?

Thanks for checking how your hosts run the program.

My current plan is that the kernel reads the tag only from the program
that is attached with tcx. One way to use it is for the loader to tag
the head with the largest headroom that any program in the chain can
push. The tag describes the whole chain, so it does not matter that
the head pushes no headers itself. When the loader replaces the head,
the new head carries the tag and the kernel reads it again.

- The value can be larger than needed for some packets, because the
  tail call targets push headers of different lengths.
- Auto-tuning has its own problems, as stated in my previous reply
  [1].

I cannot find a solution where the value is always set correctly and
no UAPI is needed. What I can do is keep this UAPI minimal.

By the way, I plan to support tcx only in this series. A tcx program
is attached to one device, so the kernel knows which device to update
on attach. A cls_bpf filter can sit in a tc block that is shared by
several devices, which is harder to handle.

Let me know if this plan does not work for you. I plan to post v2
around next Monday.

[1] https://lore.kernel.org/all/20261108214356.95406-1-tianyi@cloudflare.com/

Thanks,
Tianyi
