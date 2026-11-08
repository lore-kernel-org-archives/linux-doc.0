Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794149242;
	b=Ujq53rHGCqJJsbYOTOtI3XUUaFSg0W4zuUahIeum6Ik4IK753v6oA9BccZv8FwX8rcRv
	 16BhfaG06TLEqQD4/rmY1FWNqusR05lWdALGu7s28T2PVBh+8A95O38+6CK33bfCKmSyB
	 R9Z8fS8THFY5HVQ1E/8z2Wl1EWw9QYU4SHIGgHWHE8+oN6FZAKOiCkpNaUKaYiHwd2dkR
	 8Fr4B/I8tqjKdd0AkQLvhMEoaWTpgnUK3iD/tBK6WZAI/oA+c2Uc5IzWaoClIR/15O8qG
	 9g8HCStXV03R3M2rYXgJwqLhh95ZOL7sBq79Up395CZEXm53oMoa3XMNPwhojQNPzeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794149242;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=0JULXnRo86HLIVjSE/ozuXF9QO2DLs0cXMWvTzF3qn8=;
	b=fi/D7XgBWvJFGOagKDRoYL/rmTc+bDSbJyqZfPFK3kzL/yMY/nCKG2wsmLJ85LOI0CET
	 Oyl2HHKfG4K4dGH6Os7wgq7nZCN+CG60AAF/joxn2xUTTm4zctg9JmaMFvuR6TSZehAQm
	 hmWxHaLzQ0hiWfgv6rGlvGCYxjTh8OK4GsZvtT3ShnZYaM1zQ+fEvJb5UksFRLIC8jUjf
	 x/Hq9mK0fN/KrA1i9vNIdg7G9s1Wh797nwBBN3Qs12dY75sB6l1bOHFJgnyWU0AjyO9KF
	 vg6K+tVAqdegVst52n4B9gNtf4sU3jrnKF1hGZTyRuvw8BvX6TYjsUOM3FyW+MF4hgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z4xrUWgT;
	arc=none smtp.remote-ip=209.85.222.41
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC4D8606A320
	for <linux-doc@vger.kernel.org>; Sun,  8 Nov 2026 14:47:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC4D8606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z4xrUWgT
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-99911ead46dso56991241.1
        for <linux-doc@vger.kernel.org>; Sun, 08 Nov 2026 06:47:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794149241; x=1794754041; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0JULXnRo86HLIVjSE/ozuXF9QO2DLs0cXMWvTzF3qn8=;
        b=Z4xrUWgTEXoSZf61sz94mFYlfQums2nt0QPefvmUtLCB4R/vgWtotFq9TLBLJEq4G7
         j1Rb+FGgfCN3jzYXibimWvaV9/6P4IBW3lSRcbgDZMqDuQudo7z+YR08qESm5dn1YsbG
         Gz3kKp6y5HJwdoQ5xAhy4CDbzlLIext5PVII/g7equldt+t1mgHe3Z45LkOAqeTM1HXX
         eBIybtNSrtnospCJ0R+u/e7ZHd4JvY0EPJQpJOavI/AnO/s8zQonStKKV5s9FXEnllUo
         rBmfIOfICoW086IicNKtlrN6/xzxExjJ/KjQWjuUeIwGWd2f8+7DwpGoIaj4uMw23Mr3
         xmJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794149241; x=1794754041;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0JULXnRo86HLIVjSE/ozuXF9QO2DLs0cXMWvTzF3qn8=;
        b=nZ/GLw2lNT+BBSwCyPXbb3bvTvOYcB7NCM9zeGFJiGgg4yG7lhFf9sXdZpK4ouZfNy
         Wyi7xYiynxOiVM4vzZmboPjYIiyTEsZhuF6WIDibnmAXCuXYpBT0FGEut8bDUMKZdRvp
         vJeGNjDvfpLqvbk3x2I77mcji4mHJJduvYH//67GtrGdiGqrLcQUQH5nFlA/pG9FsD9X
         fLDqSaizOOBTBrVG5VT8F4sp5s61Acf6/yCof9a0+YwYGM19JZHWv2pxVIMhiIX6MvZP
         UB4G0HzxgskYNaOTspJaUpgtEPMQkl0x45/KFHxiO2BCNMzGTJCjQqv7OkqQx0bpUx3I
         c1nw==
X-Forwarded-Encrypted: i=1; AL+hErH5l0Reo7/yD2zqdtxjaVDyZH9p41QrTmQGJTs2VOENK+4pAXAz7AotgMgN4Wvd1c8unZzmrTqBLRE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/j0yvvcH/j5GEmS70ce60MCRh0gE9yqeZnV64ErpkGCQl1jKAp
	QEabhyC0Sy0aNDwHtCt0g1Jm0r6QwkqRZTEABhpLxhi7bK3j+kJbJkc6
X-Gm-Gg: AYBFou2Ouvo9j+9s2Os6PMicoD+69iMxsfpte3Vr8rCyRe4+Dg3Id/fIq5rg27ww3H3
	vbZENVaksiPIWMqMSJTl3kR7BpTLuGoRUD20EYYuFhEdnB9MrWSeoJ+UVbXjXlCqisUK0kjycqV
	6HvLgUdFAyQ7Cowusk/BOzjrXylb4xDkaiitWxz3EESv9c9JSGsX4TPIeFUJZfBaS/NMqrK6SWf
	Kawl1gWFqD96H6KvNRBz4kh+CWDI/6pW1NWkWJEjcfvvF8dpOs75YEQO4KAKQoxoU0xYnDSFpnr
	ceo1W5nJKh/tviKn8VSSJ5nr7swbIWTxQ7CY0/EFrN9vRecTYsm9EmLFlZJIAHje0VsqyH5EVND
	KYACjh/enFYbLEeFesEckYblzRZyrFgkMr6x9mocukDcGyy2xrqEqnwueIj28xjxQSJ4CUGb08u
	CTyeNlGIUt+o7sx+j9YaMpsNrq2y1CaaneaKwhOFWSiYHTEoFrIoQMM72CwxEA9rxyX8q7WvMUl
	aA5cyQXFeIVCGzMkSlXl8L5l6zt1Jy9Ul/UlyxE7d435HpRwi9IzQomX63WTLIHs04YYDN+8trC
	1AwDSgc5EbnFyFS0l1XlBrqYm9wyLqqz9T9Mv7CbRx4kBTmaJh32IyVvD7C2nRW4bB4gLuyTChh
	3xNTrX73zed3SCfeqMwggCxqdzVAqM8NnSECiRuBgI96MzkktZ/QLJGTmxCQCqK8ftqMHYXk=
X-Received: by 2002:a05:6102:c09:b0:7c3:e156:da3c with SMTP id ada2fe7eead31-7d2db19223cmr459510137.15.1794149240821;
        Sun, 08 Nov 2026 06:47:20 -0800 (PST)
Received: from gmail.com (223.230.150.34.bc.googleusercontent.com. [34.150.230.223])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99c02a28e4asm1839813241.8.2026.11.08.06.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 06:47:19 -0800 (PST)
Date: Sun, 08 Nov 2026 09:47:19 -0500
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Daniel Zahka <daniel.zahka@gmail.com>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Donald Hunter <donald.hunter@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, 
 linux-kselftest@vger.kernel.org
Message-ID: <willemdebruijn.kernel.1735f64577408@gmail.com>
In-Reply-To: <20261106-psp-v3-0-a8dd38f5a727@gmail.com>
References: <20261106-psp-v3-0-a8dd38f5a727@gmail.com>
Subject: Re: [PATCH net-next v3 0/5] psp: support rekeying psp protected tcp
 connections
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Daniel Zahka wrote:
> A note on v3:
> To keep this series short, I have split off some of the content that
> appeared in v2, and also have planned future work that will make this
> feature more robust, but not necessary to start. Here is the current
> queue of follow up series:
>  1. core tracked tx-key-count stat and SADB drain test case (from v2). I
>     see this as able to stand alone as a series, and I also would like
>     to report key deletion errors, but will have to touch mlx5 for that.
>  2. core to end grace period if BQL is stalled. I think this deserves
>     its own series for human discussion.
>  3. Rate limiting rekey uAPIs. This has been suggusted by the bot, but

Hey, I'm not a bot! :P

>     whether or not it is needed depends on a bit on the deployment
>     model.
> 
> Original cover letter:
> 
> The PSP architecture spec states the need for rekeying connections in
> the event of a device key rotation. After a device key rotation has
> occurred, a new rx derived key needs to be generated and sent out to the
> other end of the connection sometime before the next device key rotation
> occurs.
> 
> Because PSP connections involve two different keys at each endpoint,
> one for decrypting ingress traffic, and one for encrypting egress
> traffic, there are two types of rekeying events that need to be
> supported. From the perspective of one endpoint of the connection:
> 
> 1. rx rekey: we need to allocate a new spi + decryption key pair to
>    provide to our peer.
> 
> 2. tx rekey: our peer has provided us with a new spi + encryption key
>    pair which we should use for encrypting traffic immediately.
> 
> In the case of rx rekeying, there is a period where it makes sense to
> accept packets authenticated from either the previous or current spi. To
> deal with that, we allow a psp_assoc to remember the last spi that was
> valid on a socket due to a rekey. If authentication state does not match
> the most recent assoc, the stored state from the previous assoc will be
> tried.
> 
> In the case of tx rekeying, as soon as we install the new tx key, we
> have no use for the previous one, and it can be disposed of immediately.
> The only catch is in the case where hw uses a key handle in tx
> descriptor state, as opposed to inlining the key directly. In this
> case, psp core needs to be sure that any of these unaccounted for
> references to key state are gone by the time it tries to sync a deleted
> key to hw.
> 
> To deal with this race condition, we introduce a different path to key
> deletion for psp_assocs removed from the socket during a tx rekey. psp
> core will use bql byte counters filled out by the driver to determine a
> conservative grace period where key handles can be disposed of.
> 
> Lastly, some test cases for rekeying are included that go through key
> rotations and rekeying.
> 
> There are some packetdrill tests that are queued for upstreaming [1].
> 
> Future work can include a time based rate limit on the rx-assoc/tx-assoc
> uAPIs to prevent an untrusted user from creating lots of wasted PSP
> assocs and consuming SPIs, SADB space, etc. For now, users should use
> network namespaces, or otherwise not present PSP devices to users that
> could abuse this.
> 
> [1]: https://github.com/danieldzahka/packetdrill/commits/psp-rekey/
> 
> Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>

For the series: Reviewed-by: Willem de Bruijn <willemb@google.com>
