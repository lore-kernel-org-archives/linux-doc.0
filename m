Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795641314;
	b=H2GdhZ5v2Pb5r7ps0zpoo3SOrQsmTtxmUIuLISWj3glAgWpJcZ0wsVVTEdxweYupjaS3
	 9+wtio9z7S8l/a0Ve86kKuQUxrpSj6z51D3ph2m8NZi6asFHzCHA8ZulS7VH0sFyb5Iii
	 z2uVoK6ewCbRemZesngzh4SVlzYKQTRdu+Ut+pK2v9nHt8uQRJ4k9jvWP3gViXdFExWEo
	 a2caRwiedKdhArejwHDObOH8gNm4HbRDtFKt5ybFC3f7jxj2xayxO/k4tf/wLy79IF984
	 DcQQZgbUFTzXeeXhRu8JWPmfrUwnADmm6whW628awGaTbT+wI8lG4gREuTK5ERC5TvQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795641314;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=v2Q5BQdNA5CO0G0HRlTvOkzonEqCKg9Nq/F3I2z+4W8=;
	b=NRoF/ECL+M1ViFZynn2/u6wiCO3ge+xMZzmvi8pqQ8V8QecKN3BjpSKTRXUvccZAB6Ml
	 NnAkuJq+C0ST02tSE/vRR+MpM1BLn9MmgUvsVl3uWEIDlAZreCptFuI+U/7p21IYZvMFG
	 y7Ees09KQAjnCl8RYfQs5iRVmew+gW75gLQNF+qdY5LHtANXduV9hQ/0+iYAAia8DX+hq
	 mrUfvgAIDP4DLSPs7mnwzNIP9fOZz5BGJ/jFu7FsKd0g2T8XMYnmULEWOi8tT2NrWUk9c
	 sJ4kXwiLNSUCL97q4TISaJ3gAYNGAoS0cdDiAVoHzlNA+kc4XqpMg2yRCu5j45/HrOg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=ZFZGa1Mu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.172
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A0F606A321
	for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 21:15:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85A0F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=ZFZGa1Mu
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8b0ca1ebc8bso55864127b3.2
        for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 13:15:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795641313; cv=none;
        d=google.com; s=arc-20260327;
        b=UAhooQP4fERZ9t2eJBpQiZqxjOPWnoCkhRzYPLfjj3mURRX4wBkJfjDYJaFrO2HgYy
         l5VnOzXh6Rd974HSWtRsJlxkm/sU8MmY/bLjB6VW+BPvRYZGW/MeCz4+c4apA/yqowx3
         WkwtLZPUpX1TlENW81/+GhSXVJKu9w1d3kMeiHJsHrqav5V1rK0rej4MtYGvTHGIiNl8
         GbkZkEQcbKXoFGqtqpdvVY64D399V6isJ/F8KuL9ER41a+xgwjTKcqtG6vOjrVA2TxEI
         /PH3UjqJCSSLtvlYVYBfZcqnffpjqijQZjT2OpKojVOT2AEmlqgwdoMsaQUHtM103mJc
         z7+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=v2Q5BQdNA5CO0G0HRlTvOkzonEqCKg9Nq/F3I2z+4W8=;
        fh=o3F4NvkLxq1+eTJW9ofRhUsq3MKiNJL0O9AuUYEF7Wk=;
        b=ezfCE7i9+gUxWiWw1cGPwzBF0gMDJiAZaPlyg+Tyr3M9qOrSgq5RGDFb+S6K9Q+QLt
         tpF5brdJxP5Xj5fBzPv5O4vBEAZguK8gCT01xjZSOHLxOS8+7wT0sEEErTeVuMglWeVp
         h2se/fUL601iRRJm+meiqE7TI+GImUzs+e3XcUeH4GSw8rmqLwfFH0SVzcnwmUw0PlZS
         Ao3zuEcn0NRPRSWX75Tu88OLCp5DlfE77xxlpkDgVz7nTKspTVXiiCmztOGgh43FeaqM
         K2QicGoNKM7n4DKQ25GyW9zW8CrKC/+Unvz2c4Kd2K6gpPvxiTsX7p7+E/xxVl8Ls74n
         xPOw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1795641313; x=1796246113; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v2Q5BQdNA5CO0G0HRlTvOkzonEqCKg9Nq/F3I2z+4W8=;
        b=ZFZGa1MuixAy7IjqsLRjY3SC2wAYhkVYCbqN/PVHdn1TM6cmbtD2eRYhqN8A+siVVP
         btUqX/zenGSbVIfr02R/5p+0+h+5DzzOrdwaY/Gelrhz4Vx6jIZfKk57P1PkCT49sU8x
         b3NiMSXkhqHdA0ObMv+/ZNPMqaIR3PVmzpf6/hwl9/dvbvOCH1caXW56EXHVRxrh44Y2
         9LjVNlPYZwwZt6QTPK7OElvfcE09PMvp/BsN5xFr5rpQ3/ySs+4K73CK0Fb0PikHcIG0
         LovIokxWXQN7mPthNCukcvqbGvJBoG4gjzp2fUpJCzr1kcepNE3+QV6ajRdTd+P3DNMP
         h9mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795641313; x=1796246113;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=v2Q5BQdNA5CO0G0HRlTvOkzonEqCKg9Nq/F3I2z+4W8=;
        b=qIErxp4m2hw/DsYuAbkUkCo+2qNY2NnDQtkVC4sKZgsp3V6SH9LQJWPy5Z9iBs7bRp
         FVYZG4AODHSwTVeN5cdZATjsU/xicVx+g9QJXJe6xzqlMd03xsGDsoEsAXvNG5GFFpO3
         vuDwoipU4llM9G+HfDYdNtEmKx/6S6ByhUzEHwzKq98rrexmmVgLXl9UicX3DGVGh9q/
         Z9RLbFd9w3/QNBlpd2435G+DZg69bStEXHSxlGOjzG6dnkMCwymFLC0vGzRtd13t+cYP
         XTW/uU0nrF5bvq3BIlQW0Cno3xu9/mUUtezk9fYQaBIXHiCz+rHYQ8ShTu1Re1kiJ6YY
         iDKQ==
X-Forwarded-Encrypted: i=1; AL+hErEB31GYH6rVVN+IpOE02IWwKIuNpMMQlUNTRHg4voooUXYP/fUY9Yo27nNglVndMW81/xOPcRrtPiM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+S2t7fAAFu79bU0j7rjOneo6ioLDUN1cXYQDGuFx6rv26OIQi/
	XKTuyGJjbw47cozm0Hzw5/hXsXsEHMkFSmtSOY5128SlIzH5AWeMyDpswkv2uM1TPSVRdECsJMd
	Wk35f1NQ8La0h9eMozfAVKJiKjkykyGPKQ8+33bx9+g==
X-Gm-Gg: AZFdTZdnPkYxEdeRkSYmmCF4LO/c/jw24epydjLP8iDohfRqocrNsBIBed6qoReBLxd
	2OhRFKyZV5JXAwWBEtmunPPdq52mrSNPquCDVqaJz5STSznO6iRqTO5ffq83I4mcjO2geRAtkHk
	G5ecKWKjF54liQYDrzBNt9I4iRtEWix9N81X1fvVtOnb7pNCUuTDpTWJJlZwsThF2nQrtX2ij2i
	L9AJ9s1+A340ZcY/IpAfKWTrOWDHoPx2UxX1ENsYb4iLr8u+TTSvME0vyCiITb2wDkKgarv4Zat
	a/1nenbqZ+otsy9Ga8HBf4m8XhBzNVRxr62suHcK/onDFd1jVT+mhyM6sNsGK46HHZYX2jeI1sW
	u8nD7hMbRhanPpNFuusO4LHCJJh4XDMYqqcmiYOQuu0ZrOaoiVBcN09jhGoVGs9rtFUSb
X-Received: by 2002:a05:690c:4d41:b0:8b3:527b:d18f with SMTP id
 00721157ae682-8b520456090mr78329377b3.11.1795641313439; Wed, 25 Nov 2026
 13:15:13 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120-tcp-l3mdev-exempt-ports-v1-1-ccc2a3a6cd09@nexthop.ai> <179556272605.3135.9300919500524716345@kernel.org>
In-Reply-To: <179556272605.3135.9300919500524716345@kernel.org>
From: Kalash Nainwal <kalash@nexthop.ai>
Date: Wed, 25 Nov 2026 14:15:02 -0700
X-Gm-Features: Aa3M54pDddf1z2GThzIkP6Ya0YrZfZnwcPcCDFy0GPN_7KFQAEfTKsiiMCChi8o
Message-ID: <CAAv61uTjxQD6WUU-ZH1YG6Q_rOzPD5MKtAJvRQnmpm-nqFAs1g@mail.gmail.com>
Subject: Re: [PATCH net-next 1/2] tcp: add net.ipv4.tcp_l3mdev_exempt_ports sysctl
To: netdev-bot+sashiko@kernel.org
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, corbet@lwn.net, 
	skhan@linuxfoundation.org, rdunlap@infradead.org, dsahern@kernel.org, 
	idosch@nvidia.com, ncardwell@google.com, kuniyu@google.com, 
	netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Thanks for the review. v2 addresses these as follows.

> [Medium] fix the lookup instead of adding a sysctl

I kept the sysctl. With both listeners present, today's result is
stable but depends on creation order and address family. Making the
VRF-bound listener always win would change that for every
tcp_l3mdev_accept user and may break some existing clients,
so v2 keeps the default and makes the new behavior user configurable
per port.

That said, I can change the default lookup instead if maintainers prefer that.

The per-port scope is intended: on a listed port, a VRF with no
listener of its own refuses the connection instead of falling back to
the unbound listener.

The sk_incoming_cpu tie does not apply to listed ports: the unbound
socket returns -1 before any score is added.

> [Medium] the docs say more than the code does

Fixed. The docs now say that only listener lookup changes, and that
established lookup and bind() conflict checks still follow
tcp_l3mdev_accept.

> [Low] a listener bound to the receiving device also matches

Fixed in the docs.

> [Low] CONFIG_NET_L3_MASTER_DEV

Fixed. The sysctl, field and bitmap now exist only with
CONFIG_NET_L3_MASTER_DEV, next to tcp_l3mdev_accept.

> [Low] net_cachelines documentation

Fixed.

> [Low] bitmap updates are not atomic

This is the same handler and behavior as ip_local_reserved_ports, and
it only matters for a single write longer than a page. I left it as
is.
