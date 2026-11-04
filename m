Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793806882;
	b=y/goH6HZB6t6pkbDUS8HiqsyqrVQf09NXz+HO8uw+y2RL4oHBt7M+sd8HBbXRkgi8Vuj
	 VPJNOVDSqEVFPclQXkxiXl3nVOqJZzV5tHwwff7Mpoo9vwEegYdZWut+kosgEY+swXBww
	 mUuV17x3fzIHAkdWmq2lXb4+5oRWhM9smwsIQ9MbDqpyL+3KnWv6keiSSKAz6yfyNLNnW
	 6OL0n07pfO6sbBrIxWTQTVLtkejCUvNa8qwQBv3Hur8kqH7Ms1uEc6uuPXTZAXTH2UKrC
	 tQqQfvCcjwP+vcUeezw0velqzkcBkWhYNoI1otCn2mZ32nTexkZnz+7MKU/hTa5UoAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793806882;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:In-Reply-To:
	 Mime-Version:References:Message-ID:Date:Subject:From:To:Cc:
	 Content-Type;
	bh=o/kOhyN2ooFYx8Pst2gddYQu9Aw2TL0sBUfCDuxPOOQ=;
	b=pPsMxqCdu3uQriClXlCp8P9QnJ+2be88HSfZvsmE5J13UBd6bwR+4SxZEZMEmLBhUA4t
	 2AeUMVD1yv6Z+1ng7wSUF5tBvJJD/KBk4jQ18zH+T+4vIb+fkuKRV3hqutfnO2+v76qd6
	 iKGu5/1/+oG6EvyUYtbtwInJBPCn7+rkm0uVeP5tNFOgDxOS3f/B5ziR7cuu4fgmei+J0
	 o7uJERD6eSGke71zX1pXrcajJJ6ZZEPHBo5Zb4GAefFsozm+XFvOKA05wuB3Vat8ruyiV
	 go/k8Op2ddU/SyDv/RwKUQVPJ7e7OFauc/ASyjcFfXJUgIA7Uk+QZeWZuGismHwEYSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HjMV6rni;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C625606A333
	for <linux-doc@vger.kernel.org>; Wed,  4 Nov 2026 15:41:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C625606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HjMV6rni
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3662e7a9299so2918376eec.1
        for <linux-doc@vger.kernel.org>; Wed, 04 Nov 2026 07:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793806881; x=1794411681; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:date:message-id:references
         :mime-version:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=o/kOhyN2ooFYx8Pst2gddYQu9Aw2TL0sBUfCDuxPOOQ=;
        b=HjMV6rnirPdJA5id8UtVqWjrEqOxCFYgbInEUndmQBG9IGwqDf4eKd2nUhUcDuBa3W
         naoBjcrkRW9gQf1MgmsEvth6cdjetKsDsXk5XwDhxNum0s1qFMPG5+ilvaSzEQ+xZYwY
         Tv84bFqfYa5rKy+gTZBe0bSqag2Uj/m70AJqsib5x6i3m9jVMzOnLwUHLDlB5N/Yy0bM
         XL/iW1TkDGelxrI33iHoh2+RTycqt68eYKdYqnBam82nBZdAnsI5QqyOYER9lr7Q8Uol
         5fCr82D46xBT1klUloOTTCg1G6OOxhv2vXv4GNihAsw8nlvpL4SA20uZbSuQ4dPVuriQ
         4jHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793806881; x=1794411681;
        h=content-type:cc:to:from:subject:date:message-id:references
         :mime-version:in-reply-to:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o/kOhyN2ooFYx8Pst2gddYQu9Aw2TL0sBUfCDuxPOOQ=;
        b=c099m+5y/rFscG3CA4NI7G2tMuJbhUg0FbuL/fLQlqban/WiSRzoC5OnSIMmF9bcYj
         JEAVcRSg418H22pKxhX2kWIR5AmU0i6up6cd/0N6aAWPazB2JaPyNjdmjkZeScNUpGxE
         HSCKTdm61TvPiSD9ZqrvA+umf+oYiriPJAThdpTRjFoa9oFsGrOBljZDzHaWbzYv0/bg
         29yqziAbr/c/dObhFmO7fB2SfgSVqreqO6UzvVbIpe4lsyBTSwWzAl4u6V7732iwWQrg
         7BFjLewtlLvWnvMGXJNuJgyFJ0OG+H6Spyyfu5bpZMCd2SlD+5lG7Mqn9DxWLVtpdP6p
         HHYg==
X-Forwarded-Encrypted: i=1; AKwUvBy1x5eDV4ZlI2IQ6L4j+tRailyXvB+uWlhORom51hUo4hJ5mvnJaSo8WsIOe6uZLrNf/7BaUtoKwMg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9iO5V91n5Or/V1ZJxMWERn/GlwyFk3hiNXK9wuqv99O0rqOOFQ
	rApY7BMjfK+NbDj268YDmaQSGQcEZUyTeVWFAzY48kUsuLnQ6p5IDC9WoHjBGukqsxbZXKghxdt
	gh3YoYIngq9k5LnrLweU6jBvDEQ==
X-Received: from dycmb18-n2.prod.google.com ([2002:a05:693c:20d2:20b0:359:198a:8046])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7301:3d06:b0:358:eccb:af7c with SMTP id 5a478bee46e88-36a42404840mr35928950eec.33.1793806880735;
 Wed, 04 Nov 2026 07:41:20 -0800 (PST)
In-Reply-To: <20261103235152.1904727-5-sdf@fomichev.me>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261103235152.1904727-1-sdf@fomichev.me> <20261103235152.1904727-5-sdf@fomichev.me>
Message-ID: <18e4e1daa184cadc.3137322e32382e36372e3935.ceab9.0000sendgmr@google.com>
Date: Wed, 04 Nov 2026 15:41:20 +0000
Subject: Re: [PATCH net-next v2 4/7] net: devmem: add a per-device netmem TX
 frag size limit
From: Mina Almasry <almasrymina@google.com>
To: Stanislav Fomichev <sdf.kernel@gmail.com>, netdev@vger.kernel.org
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, andrew+netdev@lunn.ch, edumazet@kernel.org, 
	horms@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org, 
	rdunlap@infradead.org, michael.chan@broadcom.com, pavan.chebbi@broadcom.com, 
	sdf@fomichev.me, almasrymina@google.com, bobbyeshleman@meta.com, 
	asml.silence@gmail.com, razor@blackwall.org, daniel@iogearbox.net, 
	leitao@debian.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 3, 2026 at 3:51 PM Stanislav Fomichev <sdf.kernel@gmail.com> wrote:
>
> Devmem TX frags are bounded only by the net_iov size, which is about
> to grow up to 2MB, more than some devices can describe in a single TX
> descriptor.
>
> Add netmem_tx_max_frag_size, U32_MAX by default, and cap devmem TX
> frags to the limit of the device the binding is attached to.
>
> Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
> ---
>  Documentation/networking/net_cachelines/net_device.rst | 1 +
>  Documentation/networking/netmem.rst                    | 6 ++++++
>  include/linux/netdevice.h                              | 2 ++
>  net/core/datagram.c                                    | 1 +
>  net/core/dev.c                                         | 1 +
>  net/core/devmem.c                                      | 1 +
>  net/core/devmem.h                                      | 1 +
>  7 files changed, 13 insertions(+)
>
...
> diff --git a/net/core/dev.c b/net/core/dev.c
> index 3ac700d37e59..ba2f887dcd39 100644
> --- a/net/core/dev.c
> +++ b/net/core/dev.c
> @@ -12350,6 +12350,7 @@ struct net_device *alloc_netdev_mqs(int sizeof_priv, const char *name,
>         dev->gro_ipv4_max_size = GRO_LEGACY_MAX_SIZE;
>         dev->tso_max_size = TSO_LEGACY_MAX_SIZE;
>         dev->tso_max_segs = TSO_MAX_SEGS;
> +       dev->netmem_tx_max_frag_size = U32_MAX;

I wonder if netmem_tx_max_frag_size should default to PAGE_SIZE instead
of U32_MAX, and have drivers opt in by raising it after verification
(e.g. SZ_32K for bnxt and U32_MAX for mlx5 in this series)?

With U32_MAX as the default, large frags are enabled on all NETMEM_TX
drivers unless they opt out. For example, fbnic also has a 16-bit TX
descriptor length (FBNIC_TWD_LEN_MASK) and only avoids hitting
dma_error here because its tso_max_size happens to be 64KB today, and
gve hasn't been tested with >PAGE_SIZE devmem TX frags yet. Defaulting
to PAGE_SIZE (similar to tso_max_size = TSO_LEGACY_MAX_SIZE above) seems
safer for existing and future drivers.
