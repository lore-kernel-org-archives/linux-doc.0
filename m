Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793650069;
	b=TBR+9rotQE5ZKn+UAvxYQT1CACOnVGYIxSeUAhcVql3ZTzGzxOyZ9PC2mf4EtKDSLxh6
	 7VqaLhupo6E/N4QjdhTG50W0R/QI7gmrVr7ZZHTKwJ/zn4RMXl1/8PHMBeUToaEwLkESo
	 NJc6e+lNa0i5h8k5mC3QOnDcVdKbLq+oA1L5mg5eVLA/+vCabMmpf5Tsy/EX7gr9Bmftx
	 jAo8tZ6VkVfRdYtn5czq4Td7K7Q8usfO9VOtQ2QQSlPTvmc85qFp5L1vweHTrl68Ghcue
	 2eClUIQWt/1sF/4uA1dLm9nU059LJTWha+ngFLNRMEgGLtQ2YRoIfvYAT4QfhrsR+sg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793650069;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=2y2WavsP8svBBeJai9Uevzqpj1fQ7NNZDo+HgkQhGww=;
	b=RH5TJK9TjJUumO1lEqZQaekBBaBlPyWnOPu5o4I3r98bR4SMOYzb8VYKmj8vtrSlhd8H
	 GjWUbu1MDAYTG/8neK7mkUQOuNsJ/9vkH3oPTxWg8Tbu0VUeptGA8rmrjAdlIlxDomqAE
	 RLhGwlWlNSCRhPIaUrWIY55RpSjMrQiwxwVXLpbShOz4su9kxHtfY2IcgBtuREYAhJjBy
	 nQSlhixSDYcTS6irwJ0e84N9tTjKCMmPbmXyVR0dLZZWMEmG3KbTzGUD8CXNNvIBwRzWB
	 ctcjuIHdMK5WEfbI9PrZ89wsaILtlcB4uq+u0eLCCoBIxDN7B1F34/Cd8z1VKuNrXWg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jk8TrkOl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0F5606A326
	for <linux-doc@vger.kernel.org>; Mon,  2 Nov 2026 20:07:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF0F5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jk8TrkOl
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b1b12de661so1785a12.0
        for <linux-doc@vger.kernel.org>; Mon, 02 Nov 2026 12:07:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793650067; cv=none;
        d=google.com; s=arc-20260327;
        b=r1FW/OBag6gnUusz7IeT7ihmSGqfmoKeE7BIMyK7qpX4AcznS8ASvPESbrJMAs/KBl
         KOZkPDeXDis1WZUsCXG6mXpRC3InezpuLGdLGb9AjI3z/24HfvCZYE3YVh6J7hAX+Vd4
         +cu8rDlFgE4WLD0fbb+0252F0KMOeLJyV40HOa4lh7/+VHGZijD3Cdgeh64oaurn7HPp
         wkKObGgrDnVMaB5z4sbLKRizonucaYGWfe2bYEeRINzqOilXowPnZPQwnvAbvkLeZe6h
         nJXQiH0UG3Y7PiMZb3hXW6GgPTNnXS53NzWcIeB3I82H6Jn3X0FZ2BcpEhLcxUHcpN/O
         wlIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2y2WavsP8svBBeJai9Uevzqpj1fQ7NNZDo+HgkQhGww=;
        fh=IIihqrrVTsqBoFGPBpYvEEteQJF7TDbkl7F/4YhtwNc=;
        b=ORSLStUGII4ZqeuHNPVhWkQKujc1UKBTETs37+SQVoDZigDhPD6c3jtBA5wZ1+EGg2
         otaODUDZ3lifkBsvtV3sOf8YlR58JOtEVGlqFRih5XZt93AMjE7ERH4sgQG2K8wBm7v8
         bUK9mN3N/KhnTsK+cma6l+DRX0KVJS6LKZVkohA5gfWEPWjRU8MK+Suip1t0gJ2hvYHM
         IwKgOpQ3OHH2qTG6ntd82NENgWGAQciRIrwrnUduLs4jN2frLNbjaMTn7h5G9E5/Lgvx
         a5JJMlGzTpPL+mBb1gpemqo3oL/UFmSLodkn8OMSQB1WIjIifS/Xyxpmb2tCgINexMuJ
         QsKQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793650067; x=1794254867; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2y2WavsP8svBBeJai9Uevzqpj1fQ7NNZDo+HgkQhGww=;
        b=jk8TrkOlsW97Uh2N2lxEQCWSr5BDOlLraKDAJDImF5X93emauVjuWCB4kRG5DXJ2mg
         oXi8tL+XOW49nPtI2u2njp9hmZSDUMa6G/1KMaO9Q5qzNu07fJxBg+FGZwHSPkrB/3+p
         +n35tr9rPg7bWoPu4eX8xtne358FzfbxYLhTbxaih9uGNnm8EspyFlcWvKfSR929T1wP
         PdhuKIXNMBvyc8JGPZ0UjLnzK8d/ugvhnqcVfKUScJJXgrIRL8SofUmBK+358GTHLXn6
         4DOPImXL7BUxCQKWkh8a6VYnY27wG/hPyzEY2mSBDHGTrMVjqQIyvUjbN5Mtc+HYQcjd
         XJ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793650067; x=1794254867;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2y2WavsP8svBBeJai9Uevzqpj1fQ7NNZDo+HgkQhGww=;
        b=t46Wq8SXvP6WBFyns5QsxZNtZDJ7SgGIRb3tKvTItio4dldhXLS+RqTsY0SxDOBdI8
         FLaFLSSBt33ObbLOdg7pclcXZDgqrS1ra2x+3zqafLN+/85wRj/RyogEuSN93XyWpUmt
         o+DYpiejdwI2VgpSyQIFIDEJQlkcmfe/WfVijlb89GTDdlfp9Wzs8lPJsnLTBkKK5VCy
         JjrTidOPuQTAVJYNQbba0uoAY9+8caKwWDI/iAMap7FX4Jf0EidsE0uZ0JCxHUoD4ZF+
         d5W7MFGlP1ixKXXMDBJVcB7j1oE2dk5DB5+WUXGX3Nl6lOSrZ2H30sWZAdwxOYOYojuy
         ruAQ==
X-Forwarded-Encrypted: i=1; AKwUvBxcnrR/+iQYzYgqtmC8lCBvRZiYvZ3J2CWJVtYTRxIDFh7t3L3MCaVXUgpBQdJEzK5QjFwHSDOQirI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9bmpt+1adUeN1H/Sk4y6K8cRlkypFKoFfomai2hZheVPetLJZv
	+gIBAeRJovh96DsbUwM6S5rCOBq7xIWE3kpaV9VRSaxV4FxZa4ykzb/vQATVaftB/dCqpj9QroN
	OU6p4dZLxFnERU0gxnklpNUAjXRhpN2Izu2L2tAp4
X-Gm-Gg: AYBFou0YcNcUzRza47mWJoU7KZQpsgMq7ExLp2vfPMv7KGJY/K955xbuvpBGJzzhMqv
	xv0L+FJNcqjkHZqxPgpcYumgY9KQ9EyVMX1VzDKgFRQG7WEtDPPpoVJr9W3Jlck7j9c79ChXcBu
	uOfsev0og8kmHsAAEqhTvZCbPRyPQWV8Mo4Fu6dML/NQHLaVhRTfhU7OcGkO9Be3FsTUXiNorQd
	DyxD+iSSbF7llqhpzNJFwd+KxkcggcdKrZtdig4kG6qh7geRBlHTsmiJa9Pk7fNkcvn6Uby6sh7
	JyP+baA8VTUUcJd/hSVOvIGwg123FSAeyYBWQskqam3rIfjhtUEV1MGD439zkiCAMZJ5dzmK6LJ
	roBdV5+tgExtj7xDyN/82hPrOJFQrcXqAK578Kw1CZjVd0eGtHXFi7PXQI/g/HJTHp4CJnNpLtp
	5NEWBOQl1FSNMm
X-Received: by 2002:aa7:d752:0:b0:6b4:629a:6352 with SMTP id
 4fb4d7f45d1cf-6b539cf7661mr6374a12.5.1793650066614; Mon, 02 Nov 2026 12:07:46
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
References: <20261102191438.1059771-1-sdf@fomichev.me>
In-Reply-To: <20261102191438.1059771-1-sdf@fomichev.me>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 2 Nov 2026 12:07:34 -0800
X-Gm-Features: AclHuK9gfr07IGAAZ9tA7d9yIuAWy2wfQLlcGX2KzOTTr8xZ9Khn8LIVGKzus2g
Message-ID: <CAHS8izPAaA5fNGmA6TTAuo7z8T4-+1xmR0yF=OZH6EAcQEF-RA@mail.gmail.com>
Subject: Re: [PATCH net-next 0/7] net: devmem: size TX net_iovs from the
 dmabuf layout
To: Stanislav Fomichev <sdf.kernel@gmail.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, andrew+netdev@lunn.ch, 
	edumazet@kernel.org, horms@kernel.org, corbet@lwn.net, 
	skhan@linuxfoundation.org, rdunlap@infradead.org, michael.chan@broadcom.com, 
	pavan.chebbi@broadcom.com, sdf@fomichev.me, bobbyeshleman@meta.com, 
	asml.silence@gmail.com, daniel@iogearbox.net, razor@blackwall.org, 
	leitao@debian.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 11:14=E2=80=AFAM Stanislav Fomichev <sdf.kernel@gmai=
l.com> wrote:
>
> TX bindings use PAGE_SIZE net_iovs, so a frag covers at most a page.
> A 64KB skb needs 16 frags, and MAX_SKB_FRAGS caps devmem skbs at about
> 68KB, which makes BIG TCP ineffective for devmem TX.
>
> This series picks the TX net_iov size from the dmabuf sg table instead:
> the largest power of 2, up to 2MB, which aligns every DMA segment. With
> a 2MB hugepage-backed udmabuf a BIG TCP skb takes a few frags. There's
> no UAPI change since TX addresses are dmabuf offsets.
>
> TCP still bounds skbs by size_goal, so frags get larger, skbs don't.
> A single frag can now be as large as the skb, which matters for
> NETMEM_TX drivers with tso_max_size above 64KB:
> - mlx5: 32-bit length per data segment
> - gve: splits frags into 16KB descriptors
> - fbnic: keeps the default 64KB tso_max_size
> - bnxt: 16-bit BD length, devmem TX frags are capped at 32KB by a new
>   per-device limit
>
> Tested on two mlx5 400Gb/s hosts with kperf (udmabuf, 32KB RX
> net_iovs, 2MB hugepage-backed TX buffer), series backported to a 7.1
> kernel on the sender only. 4 flows, MTU 4200, 6 x 60s runs, medians
> (CPU over the 3 runs where every flow got its own CPUs):
>
>                               before    after
>   frags per skb (sender)       16-17      1-2
>   throughput (Gb/s)            389.6    389.6
>   sender sendmsg CPU (sys)     12.0%     6.7%   (-44%)
>
> The link is the bottleneck, so the gain is CPU, not throughput.
>

I mean, test single flow please so we see the throughput gain. But
CPU% reduction is good enough reason to merge I guess too.

--=20
Thanks,
Mina
