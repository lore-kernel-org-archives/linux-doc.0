Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.196
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794248963;
	b=OYxspRUqW9l9GguzOw5C0Vu8KMy+mZnGAsjlO37a1V++ipoDEXp9T0BRe/c95zovAp+Q
	 nyM7xy/O1dsYKDGReZOsftWnRDWF4TfuhfIaeTfd6sSYQRzMDszgNLXx7BBQkLx1jxDqM
	 laDP4J4CQ0HrWH0/Iy59TSvy9PQHl6DKimlaND5xAAcJz/UG52FDNDHcFLhAbGoEW6tO3
	 js945TUjCF0fhZG4yhuqP4PnE7Ccf5a7WPSGU/Esej8zVTb0/oxHvmlWXXwhP/NRLIrvB
	 r+R4D8fbMLhHX4cLE5uJdPeDTlbvkd1afgWwbcs2BEzcJawIt4KNRfH0mFAZxTKlqdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794248963;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:In-Reply-To:Subject:Content-Type;
	bh=KcVmoMQgperP1wPlpI/4lZIUWk5pcHjD9u34purQ6ks=;
	b=L3TQex54+NvvHM+JeVPYJYw6y6onNkJH9WUUxgnt0d5onBd1n3+WnwdC0YUYwRu5oE+N
	 hu50jKYaUQ/RgQBXoeunxWu0OSmBJegVegsMb6auxVi8kMUFCO+IVdt8nvyvXZT9e9Bc0
	 IC2gK9M5VotV+/u7TFu07dqRxxOf3d0s4i2RaMTs9+4qop37qkMoajp1yPvO1UfyVEm0p
	 5PBMf81JRSHpG0LnjRw/MJY4e4yNLB7LYbo5Vk6xzzh22vnutAmQEmbtre+HRDr5/RYAT
	 zXINQF/Kcx7+ddOLEHhdTt3J0HfdObp0Tzj4V33RO5qdHpyJcXkQMNWlq7ux7Hp636g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X7wedxBS;
	arc=none smtp.remote-ip=74.125.82.196
Received: from mail-dy1-f196.google.com (mail-dy1-f196.google.com [74.125.82.196])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3502260A3838
	for <linux-doc@vger.kernel.org>; Mon,  9 Nov 2026 18:29:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3502260A3838
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X7wedxBS
Received: by mail-dy1-f196.google.com with SMTP id 5a478bee46e88-37198ed3727so1620882eec.0
        for <linux-doc@vger.kernel.org>; Mon, 09 Nov 2026 10:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794248962; x=1794853762; darn=vger.kernel.org;
        h=content-type:subject:in-reply-to:cc:to:from:message-id:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=KcVmoMQgperP1wPlpI/4lZIUWk5pcHjD9u34purQ6ks=;
        b=X7wedxBSS8iZNbIq3uVV6Lk387o+XeGOfTW6Zk2cySFVKqEWn7Djj69lXsU8s/kpKz
         tJiJ1NC1pNUqxiy43lTvIzQnaR1XWltnvNswRXYTYKvJhMy1Ym9sy/gLTRWhTzeoZy/r
         kf9IurJNAyUB0JwvE50fsKX5uraHf+5WXfCjtNq7xr/i9v+AGqhqYTaRQLpfpje/s44G
         JAaCcBLIk5pgtY0fMS2yln/+byA2YY2Cjh8Vsy4CPhQB/kcoPBKf8PLdF0pQZM0hwa2X
         mCEmy0QrvQXIQcY0xkadgOuk8+FykA/urSyQYxogIANNQn5HVGBPGbcSPTXfDKNUDh9f
         93Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794248962; x=1794853762;
        h=content-type:subject:in-reply-to:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KcVmoMQgperP1wPlpI/4lZIUWk5pcHjD9u34purQ6ks=;
        b=wiD0Cj8Pvdo6yjPfOQsgrbyWyxTldEV6aHF0G7IbtoNQAyxdoAbMIvmFvp9DMqhs5V
         1XxMbPuGfTdmbq8iWKTZAQWu1ONFmFihb+gxsOTUq5x3LTgasY3CuBsKMNctWHap4t+h
         Gg+KoFXwREQT1lfwEadPj6lyGXJo+NV4KH8yTEtLnjZsCsufoZ0L5aua3ueJkeODAs4h
         nEoOrmaI4tpxTlAo1th5F/yQ3roxceX6yB96k4819uv3uEG90C4AmqUB7zj09WEdaY9u
         4Ragurkb4H0MsIMX38mfGw+U9vLBUOklKHUzmUQ8kvDEJ8Q7eFuGeViTUb7Fs+9fqPLI
         e82A==
X-Forwarded-Encrypted: i=1; AL+hErFjrxQaPtpoHVDNpbcUB2PvJHrgOZZ8z+rAPCvkRlbTSyQ2slbpGkDB0g/KaooGojHB1kcw53r0L10=@vger.kernel.org
X-Gm-Message-State: APuU4Z/SFUlIyTv7nmY7zObrWggn8zMoF5ylQ4pfWzVkrDnvL5/Rnha5
	8UyDqIiusTN2LMPz1Xf7yibgb13ekGhhPwIlC/11nFFc6FfzGyGkyOMw
X-Gm-Gg: AYBFou02lb9cVoPK0AqsqZZVLGtc6J7oFf7LhVWpmKjDehz5gVhGR3zBTPDB7IvOb8z
	S8FO369mabODAvcXxOXkkByGX/1xa0GaEpFH70pLXfQDXRk13U2MJvM/loKtMXmryN8RJDaUOI3
	DV+rWkDW+KSKd1mi3pen2W/UDG+aoi+us8pDofrz+CVn89yd/2mT7Bd+7xAMeXWeWVrGWN1cc4k
	Mcno1RYxlZ3vuhySNqAijVWALKhFrsS2VobJqXwWV06LmZgB0jB3wuKVXugLIVqeQwmdMC1NY8Q
	4uKaCtcKbCkIy84vjN2+aCPDN8qi8E5XAkRtRQ0JgMCr5SaoxpXWaPPl7gQHpNfZdIf/xeX5hWo
	clNnj2xE+lzdS6EYgOWTiRW0krHEczMb+ca08df8RD+Lv9W4Yez+oeicQm6aNwvRLtQWsVUI4Yo
	VNSkd0ipHKQJ45Gs9uuw+7M3eeGVBI1i3LLGGOTYR7OJJwrPftSn8JLK+QBbp4xkjB4FaUN/1Tb
	EKzVOpHLzEYlPuxKev9cHcHf5vOM89QrtgI372Zf+re3HyRsbRUvU/4wm+wqXO5z4RYbgL0m57R
	4nukj7dgy3I9XfRViJT4g44=
X-Received: by 2002:a05:693c:8312:b0:36a:2473:9b2f with SMTP id 5a478bee46e88-3750a20b93bmr299470eec.23.1794248962308;
        Mon, 09 Nov 2026 10:29:22 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:73::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3752060c4b6sm117168eec.15.2026.11.09.10.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 10:29:21 -0800 (PST)
Date: Mon, 09 Nov 2026 10:29:21 -0800
Message-ID: <86219505a92ebc720950d87dc76662f3@gmail.com>
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, andrew+netdev@lunn.ch,
 edumazet@kernel.org, horms@kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org, rdunlap@infradead.org, michael.chan@broadcom.com,
 pavan.chebbi@broadcom.com, saeedm@nvidia.com, tariqt@nvidia.com,
 mbloch@nvidia.com, alexanderduyck@fb.com, kernel-team@meta.com,
 sdf@fomichev.me, dimitri.daskalakis1@gmail.com, almasrymina@google.com,
 dtatulea@nvidia.com, bobbyeshleman@meta.com, asml.silence@gmail.com,
 daniel@iogearbox.net, razor@blackwall.org, leitao@debian.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rdma@vger.kernel.org, linux-kselftest@vger.kernel.org, leon@kernel.org
In-Reply-To: <179418737701.994134.5100743053640770189@kernel.org>
Subject: Re: [PATCH net-next v3 4/9] net: devmem: add a per-device netmem TX
 frag size limit
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list

> > @@ -734,6 +734,7 @@ zerocopy_fill_skb_from_devmem(struct sk_buff *skb, struct iov_iter *from,
> >  
> >  		size = min_t(size_t, size, length);
> >  		size = min_t(size_t, size, iter_iov_len(from));
> > +		size = min_t(size_t, size, binding->tx_max_frag_size);
> 
> [Severity: Medium]
> Is this the only place the new cap is enforced? The netmem.rst text added
> by this patch says "Devmem TX frags are capped at
> netdev->netmem_tx_max_frag_size". TCP MTU probing looks like it can merge
> the capped frags back together later.

[..]

> Could tcp_clone_payload() compare skb_frag_netmem() and stop merging once
> the binding cap is reached? Another option is to skip MTU probe
> coalescing for unreadable skbs.

Hmm, let me comment on Mina's patches, might be easier not to merge
netmems in tcp_clone_payload at all?

> [Severity: High]
> This isn't a bug introduced by this patch, but the same merge check in
> tcp_clone_payload() looks like it can also combine frags from different
> net_iovs. skb_frag_page() returns NULL for both frags, so the page
> comparison always passes and only the offsets are compared.

[..]

> Should the merge test compare skb_frag_netmem(), the way
> skb_can_coalesce_netmem() does? Nothing later in the series changes
> tcp_output.c.

Mina is gonna take care of this:
https://lore.kernel.org/netdev/20261108013838.1454450-3-almasrymina@google.com/
