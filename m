Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21262BDC1D
	for <linux-doc@vger.kernel.org>; Thu, 20 Nov 2025 12:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763641203; cv=none; b=shiki8DrPe9aI25/VqTesI/Zib7BvJGmsKHhxOoo7TpbuGA5q2NNWLXAKBcgOIgjD+pRPKpj2lNpNGisWa/tnsnezVXxSzjig7UF4V7vlIM/Ut8CuY9fdlA7+WWvQLojhimbyvW9eP9kL5vCTyZOtsTDdlZ8rv8dXFl8GV/6mQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763641203; c=relaxed/simple;
	bh=at1e75hOWpRKvRRLbvhWM9/uctq5gzPahra6Oo6jHMc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nQ/4tkBKboD09ps/TMt0/VKuTqI/znRUlBFEcytLQIcK7D7qiWF7RVJVjD2c2PEq2EeiMZHs5Z3btTrYSGXJ1RhwqWEJ0keaAzrB1o5eRZTC51dCpup760iENY30MPw/PU7x/0bLpmEaMJ3qdS3d/SlVCR3Sw4ZZ87WajuINFhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=E3Y9BJGZ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=tUnV/aKw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="E3Y9BJGZ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="tUnV/aKw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763641200;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pw7frUWnVBP5/bK04W/QcbdTjEKCzyz1vTHmtbnF5zE=;
	b=E3Y9BJGZBuUjkdFg9Cg6J06IJX6limeJu7JtoZSL+l1NI8EQGerdXZJgZ/eodZ8WvvsHeX
	rwhYE0zYZKtMkrLdF7a7OJFqL7vQErP6KjbVcalUH7KQutFOOakFrRWOD+dynFfQEw6YK4
	uE8gRtj10sbpF47Q4fj2977WTzrWAl8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-176-LXYIpNxNPFirgeBI0upz1A-1; Thu, 20 Nov 2025 07:19:58 -0500
X-MC-Unique: LXYIpNxNPFirgeBI0upz1A-1
X-Mimecast-MFC-AGG-ID: LXYIpNxNPFirgeBI0upz1A_1763641197
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-42b478551a6so389922f8f.1
        for <linux-doc@vger.kernel.org>; Thu, 20 Nov 2025 04:19:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1763641197; x=1764245997; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Pw7frUWnVBP5/bK04W/QcbdTjEKCzyz1vTHmtbnF5zE=;
        b=tUnV/aKwNPveV58Vpl1u4WXidLL0tPUXnGzIG9fac8c3t01U4/KSsOBgS2ratf4qGv
         n5FUQc+VOON5CgkFl7wexHNru6RdTKly02m7n8JWcM7HUyGxfnwzKc3bziDtEqsRheEs
         hgCa1WSWPX49Vc+3IzUx9wNcn8gq8s1+0XD4D87S5xZAiYDIsvhNtYOcPNnRj20SaHus
         mqeGGsHiN5CgcSOwpjJ7kMWeW2dAkBCIdZF73wM0L+0aWqapFG25roJIix+yYKrcMzpo
         xGfvkaYG4i461Z4KKnzicBwn9u4UNO4tI2vst/4Kc6kHGBwSzara3F5kzML/8lx9t7TV
         54Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763641197; x=1764245997;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pw7frUWnVBP5/bK04W/QcbdTjEKCzyz1vTHmtbnF5zE=;
        b=c4uFLynFKdIyvwOU9l15mDXxFAPyWl00pZ692Csq3im6qGlCdA1W4Ax4rn4bRt6hNf
         yap988Zp4zSoGpC7Fuw8CDnzFmKuWyYYwBN1z20GQsb7oxRvGoxaycnenZL5xBnTMZUp
         dZ7b4ieL1t76RxHKMy8WYXRPdO+4uGOALvKndKhHu37WyyFSKn8oOOoloflrVrQmgrON
         ticYXF8fw1FdY/NFR63adc5k+mEUJr2B1jeuRxPmMK0ESymkl4CGW98DB5DychChgLJo
         +A7OgQcFn9nUzEqVUuRvV9JhhJhg/69h4rOeMlm66SLyHeCEqd9MtZvEZiQvTfVFHeKc
         gTJA==
X-Forwarded-Encrypted: i=1; AJvYcCXWUhPZJuF+EUy7n62RRDKFCuwH+5viZqKSR5Z6P2AFCzC1GTND/skJ4HNysBHe1mj087ZuNxmrAcc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3cf1hcY7xVsk7FpKVnm8W1SAKwxrYwi8C8OtK+TzofnuMaZYp
	Js+Mt8e2kXq7uRyb11zOtdz2gVA/XYbwhFQCeoaiWnXJEQejPlL52sudVB2tof+b40BQgvovQgz
	6TkHAb3Ev7Exx394A49C3pp0jU/UURcih4Jci26gp+NupFvlyux30oXR8zYrPvA==
X-Gm-Gg: ASbGncvF9uGLYftxNaA8uMx7PCxkxaqRj+CJcZdD6aFfC8etotFyDDU5Qzw1mBtTKBy
	6+de0ZzFD6e5dAcTZt9ImShpY5tHH3+EwQ0rYRfcSeD6LcC1CEGm9W/W4A71hfkuqSJat9LiBaV
	GOh9+ZfpMXIIKK3AMWM+Q0fL2go9MgJIycqxbwCKMnA/VE7zAn2Lge9POTfo2hazcNginR4JI65
	LQTxNMFt0ap7kE61o4yGoY6pP7HJEsu7p0t4EVdNj7v1hBPMWlkpmvG2hc+OEq3Asibi+zQECPl
	Xf17QeVYMzwwJrzueVydYat/qQ1FuPef05keLD7NzEu9delNStmw9N0Ix72OBW74GCr919TmeNJ
	J+g5sglpnYp8I
X-Received: by 2002:a5d:64c4:0:b0:42b:3ee9:4772 with SMTP id ffacd0b85a97d-42cbb2b1a79mr2179233f8f.52.1763641197245;
        Thu, 20 Nov 2025 04:19:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGDT5eOsby5onmtLuvobHZk2SYkA/y2Wh5xP/wocdvM4KSJix9fhaPkAeUQspjHNj61Efl/0A==
X-Received: by 2002:a5d:64c4:0:b0:42b:3ee9:4772 with SMTP id ffacd0b85a97d-42cbb2b1a79mr2179197f8f.52.1763641196791;
        Thu, 20 Nov 2025 04:19:56 -0800 (PST)
Received: from [192.168.88.32] ([212.105.155.41])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fba201sm5107021f8f.32.2025.11.20.04.19.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Nov 2025 04:19:56 -0800 (PST)
Message-ID: <a0543467-df01-4486-9bac-d1a3446f44cc@redhat.com>
Date: Thu, 20 Nov 2025 13:19:54 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v7 3/5] net: devmem: implement autorelease token
 management
To: Bobby Eshleman <bobbyeshleman@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 Kuniyuki Iwashima <kuniyu@google.com>, Willem de Bruijn
 <willemb@google.com>, Neal Cardwell <ncardwell@google.com>,
 David Ahern <dsahern@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Jonathan Corbet <corbet@lwn.net>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Shuah Khan <shuah@kernel.org>, Donald Hunter <donald.hunter@gmail.com>,
 Mina Almasry <almasrymina@google.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Stanislav Fomichev <sdf@fomichev.me>,
 Bobby Eshleman <bobbyeshleman@meta.com>
References: <20251119-scratch-bobbyeshleman-devmem-tcp-token-upstream-v7-0-1abc8467354c@meta.com>
 <20251119-scratch-bobbyeshleman-devmem-tcp-token-upstream-v7-3-1abc8467354c@meta.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20251119-scratch-bobbyeshleman-devmem-tcp-token-upstream-v7-3-1abc8467354c@meta.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/20/25 4:37 AM, Bobby Eshleman wrote:
> @@ -2479,10 +2504,12 @@ static int tcp_recvmsg_dmabuf(struct sock *sk, const struct sk_buff *skb,
>  			      unsigned int offset, struct msghdr *msg,
>  			      int remaining_len)
>  {
> +	struct net_devmem_dmabuf_binding *binding = NULL;
>  	struct dmabuf_cmsg dmabuf_cmsg = { 0 };
>  	struct tcp_xa_pool tcp_xa_pool;
>  	unsigned int start;
>  	int i, copy, n;
> +	int refs = 0;
>  	int sent = 0;
>  	int err = 0;
>  
> @@ -2536,6 +2563,7 @@ static int tcp_recvmsg_dmabuf(struct sock *sk, const struct sk_buff *skb,
>  			skb_frag_t *frag = &skb_shinfo(skb)->frags[i];
>  			struct net_iov *niov;
>  			u64 frag_offset;
> +			u32 token;
>  			int end;
>  
>  			/* !skb_frags_readable() should indicate that ALL the
> @@ -2568,13 +2596,32 @@ static int tcp_recvmsg_dmabuf(struct sock *sk, const struct sk_buff *skb,
>  					      start;
>  				dmabuf_cmsg.frag_offset = frag_offset;
>  				dmabuf_cmsg.frag_size = copy;
> -				err = tcp_xa_pool_refill(sk, &tcp_xa_pool,
> -							 skb_shinfo(skb)->nr_frags - i);
> -				if (err)
> +
> +				binding = net_devmem_iov_binding(niov);
> +
> +				if (!sk->sk_devmem_info.binding)
> +					sk->sk_devmem_info.binding = binding;
> +
> +				if (sk->sk_devmem_info.binding != binding) {
> +					err = -EFAULT;
>  					goto out;
> +				}
> +
> +				if (static_branch_unlikely(&tcp_devmem_ar_key)) {

Not a real/full review but the above is apparently causing kunit build
failures:

ERROR:root:ld: vmlinux.o: in function `tcp_recvmsg_dmabuf':
tcp.c:(.text+0x669b21): undefined reference to `tcp_devmem_ar_key'
ld: tcp.c:(.text+0x669b68): undefined reference to `tcp_devmem_ar_key'
ld: tcp.c:(.text+0x669c54): undefined reference to `tcp_devmem_ar_key'
make[3]: *** [../scripts/Makefile.vmlinux:72: vmlinux.unstripped] Error 1
make[2]: *** [/home/kunit/testing/Makefile:1242: vmlinux] Error 2
make[1]: *** [/home/kunit/testing/Makefile:248: __sub-make] Error 2
make: *** [Makefile:248: __sub-make] Error 2

see:

https://netdev-3.bots.linux.dev/kunit/results/393664/

> @@ -2617,6 +2664,7 @@ static int tcp_recvmsg_dmabuf(struct sock *sk, const struct sk_buff *skb,
>  
>  out:
>  	tcp_xa_pool_commit(sk, &tcp_xa_pool);
> +

[just because I stumbled upon the above while looking for the build
issue]: please do not mix unrelated whitespace-change only with
functional change.

/P

