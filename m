Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794248962;
	b=vecJHiQBB0uV6MhaQxI7IPTg5jYCUHlQRxqFuk3zjYMQPlLFs+6He7sicckwGmfmTK5g
	 roge1I3EKGaessiUO5QOG+OhyZg572iXE7+nopVrAiswwGFWdvidV2pMsJmF3PjPDN+Ha
	 3loB0oMnFmT3n+/D9DBon6bfsu5Q2oK7PZqGbluPK/ToJYO22LyqOaPf/W0yfGINlWU0u
	 2U0snABYXz2XdqKQ+LdDkOQq77gF3gKpLF3fzFO0nDB6XPKzUltI3tvkOJZQG9BQ/2ffS
	 9zehYLOWKfTeRpiJ71NLK18CiIqajwA6K43jWSSS3esEjEQgqQJO6f+2KDHrSgbPhnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794248962;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:In-Reply-To:Subject:Content-Type;
	bh=eZXah+GU1zYRZgrwJ8SeyJuEq1JV0JX65ZErGIYWKN4=;
	b=LLdtouE9fzZrHSPF8kN5La/fMY6kRPD5ElKIFWtMt6zSjFRgtPrVWiOD32YYwo+g1Tw7
	 0XEuNn2a7eVXOLZ4RXJeamzW5yHY6h3EGDsH6az4xh2Y2DC9Jgfy16rUqlw3dVDLQvdHx
	 sQtKS7e2qRctBAt+zEWXGZ8cSWsYKLhknDpoHt3uxB1wIJ0AV42BvZwihS6ZZ8MhS2vYU
	 0tPKCwsjLcx8DaPYH+dXWCBDQ7P3/kblSQo3OWMJHm3SY77odJr1CWaOxYnlB4kUfljUX
	 WzjZXW16eo9ReIV7tUEd2CSJccsI1ModVoZSbP/tnn7ozb+L4nwocQQQ+tH3R+NsInQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KSJhy7sp;
	arc=none smtp.remote-ip=74.125.229.6
Received: from mail-dy2-f6.google.com (mail-dy2-f6.google.com [74.125.229.6])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD816070EFC
	for <linux-doc@vger.kernel.org>; Mon,  9 Nov 2026 18:29:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CD816070EFC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KSJhy7sp
Received: by mail-dy2-f6.google.com with SMTP id 5a478bee46e88-35adc681e1aso1649126eec.0
        for <linux-doc@vger.kernel.org>; Mon, 09 Nov 2026 10:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794248961; x=1794853761; darn=vger.kernel.org;
        h=content-type:subject:in-reply-to:cc:to:from:message-id:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=eZXah+GU1zYRZgrwJ8SeyJuEq1JV0JX65ZErGIYWKN4=;
        b=KSJhy7spSVu5bxRcystXBVzm1AoZWAvdpFQsG4ejBx9otx6a4+2dMgf2GDHtdvnAGF
         jA2RS+6Esp+A1s1IsndxuLyW4jjRdT+99xKWuANKBhT7XEBw6JMDu56+D5v78sr+CZQ3
         epMrT3Cb0EOf6gfAYdYs9yft2FRR6cey/8yTtq9j2979h/g75hxWoG4MP8S3dNDq3jTo
         JveOWlD/jjVgTb9h/9sefJef+OQLdIcfAYxIYfK3zpZJFwN+1YZ/gzE45F9G8iGhFOut
         EwlQ0ianw7caxy1nqlGQVzvV5uLTQ9lMZqesTRtpUQ/OFpRz5fRw4c4WhjujA6UhaKph
         H+1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794248961; x=1794853761;
        h=content-type:subject:in-reply-to:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eZXah+GU1zYRZgrwJ8SeyJuEq1JV0JX65ZErGIYWKN4=;
        b=NvbdZjbf0s+IhkGdh2YW40OOCLJu76WK6p1w5M2dYtYI7QQwZ9IaiKfLB+rVnBZfJn
         SRgvBG3t2UQ27ZT7wRq4ABViIPGyZRfDh2YMCaa4n/M+YZxFy6KInOV8gC9dpsdoltWV
         iUTskZUhrH+SXbe/out2uvZBfhZ5kPnMk/0SNcT+H2O0g7djiPHkpdHedhdGHXg16LKK
         S5dLCmnypZYIePMQ/Zo5meTO+SLkJunjOrNlirKPWxa79soFgOaqwCCDusBjFdpxJewJ
         lX7MoI7V1Sf26qSJNVC2c8pr+mmXkqfCd/wCq/amzqfsTZGJwufqsTFgdi+07kl8do/a
         cKlw==
X-Forwarded-Encrypted: i=1; AL+hErEjN/cNa3aQ4S4S07I3vKEhJo/AxbiW243p1OHM81HHDikVUIRfJDTVBDBQbzv3s+yo3DMYSxzR5Vo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/rEqmAOvYJLwxPbVnVxFanPjpjSrw+9bFzvpZ5elpyk+QqVJe8
	c2JgogWzhLGKQ208bdD9m7x6kLfRSYFisSUP23WwepPnSBwxTg3AG3dX
X-Gm-Gg: AYBFou27L0iQL2uRs7eGwuzXpxOCW3aOS3uSGB2eXjx17kQa4dlfkwoTau5yJRZlzeu
	WqOfJnFpaOlF/Oys37ILdpX5ZsuF+ypRhpGhQmZoO/2nrTMc2KmCO0f4T5EII5P2NwKms+uR4KB
	BU+yocEcMt863468h7W3HXq8/gEPx1XFgNKX2AtokxzS18UP7YCna7kplDMpkuT+aCn5HJS6Zlq
	n+OqXHzVEl/hFgbyWQFB02bqNFUpHbhOts4m26YG9o9YapOOGMDaHhJVCEcpVoNtdCVFD4/Gux6
	F7OU/39XKE8J0wB+r+YOVDjQDdrsTycex6jjGRcO/EtNJQxnBhuABHjTcxwCPJJlZ/xOpKBy3Ap
	IvdTpMOVDjcSw01EJh7GJjpsAvEQ0jPk2FW/qZo3Ga92wE71kAyHsFsu0oFF0ufnnl36h1g+V9H
	21k3s3tsa7UAhJlWDpK40LoIia5YVakbV/Qa9Uxxi4FpqvW2HXOJkl0pberUs4FySBARggkwm9I
	qjgjR67C+Li/fm8LDHOvx9eRE9TMnC1+vPq7vjFJw4oDh0ckUqB9BFGCgcyfi9U/9GNul8OA+Pv
	n6XuJoAIDjMentEijiUUiYk=
X-Received: by 2002:a05:693c:41c5:10b0:372:7af9:b916 with SMTP id 5a478bee46e88-3751ef77c8dmr97324eec.18.1794248961138;
        Mon, 09 Nov 2026 10:29:21 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:6e::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520608b52sm102777eec.13.2026.11.09.10.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 10:29:20 -0800 (PST)
Date: Mon, 09 Nov 2026 10:29:20 -0800
Message-ID: <e4def2839d68382fd50e4fe1e6b4f116@gmail.com>
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
In-Reply-To: <179418737248.994134.10509157155829463489@kernel.org>
Subject: Re: [PATCH net-next v3 1/9] bnxt_en: let the stack segment GSO skbs
 with too many frags
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list

> > +#if (MAX_SKB_FRAGS > TX_MAX_FRAGS)
> > +	if (skb_shinfo(skb)->nr_frags > TX_MAX_FRAGS)
> > +		features &= ~NETIF_F_GSO_MASK;
> > +#endif
> 
> [Severity: Low]
> Should this patch have a Fixes: tag?
> 
> Commit b91e82129400 ("bnxt_en: Linearize TX SKB if the fragments exceed
> the max") added the unconditional linearize in bnxt_start_xmit():

[..]

> The commit message describes both problems. Without a Fixes: tag, stable
> kernels that carry b91e82129400 won't pick up this fix.

Will add a Fixes tag, but not sure it's worth the backports..

> [Severity: Low]
> Can the segments that the stack produces here still have more than
> TX_MAX_FRAGS unreadable frags?

[..]

> Could the commit message mention this limitation? Fully closing the gap
> would need a fallback that handles unreadable frags, or a frag limit per
> MSS window at sendmsg time, rather than skb_linearize().

Not sure what's suggested here. The example that's given goes via skb_linearize
and fails cleanly (as expected). Handling this in a better manner is out of
scope?
