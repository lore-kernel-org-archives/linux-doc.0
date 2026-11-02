Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793650973;
	b=VZZUvuh8UG8xY2EaIg1amefGfCDMeIoOomd7D3g8nJZG66Qu0VGFC/lQculSYRPbrooy
	 gyNebLNRLww7KzyBUQ1H80vB990JiDNGxY9idFAFxZqYYuHZN+8JUUFmvWNcmq29JpwL9
	 MJoGcSz1fO9YAiCysABVPqPRM6QcW3S0pa79audhrloNa8+blRjQutuHsuayQUObQ4d12
	 EQ2WNaEDzU7KccoAPCqQUspg+3jV1kdHRpfnmcwRvOioRVqmsj8L/QNFABLXIEEHplXVl
	 GKSQNyJu3pUG5FaEaVS6Ik4+RvC6NTRuFAKmZ+5VvXz/r88J8hdihLuGRgqRzYfqd/A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793650973;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=nGgNd76Kt0jva/qUzoPfHVBqT3P4/TT41j1U9WFJiKc=;
	b=06C+EMIXSebQDcouLHMdfzolhaFw8aPsjyW8EmX2BMu6VP9yaKipqPpTep5VgtK/Z0sk
	 uJIYSmYL9pKhwVC6mT5VAKRqmgBFjBZut8foFoA9R9EQtEAfECQGMv6OLNHKMFcVDOlpl
	 zjq/3PowxPOvKon4HSGQKvswp3BhsnKZn/DMEgsjOga6eF10njS1h4nLg88wlX04Z9ObH
	 hR8fc4sf6nIq9FFhes9MdBwk4j3Wte5Q9WlZAVkqnhFuSVEeJWwbmC7VYJgKHpMW1Id/E
	 yDXVaUNBf+2WSsrM6LYPOZAv5MnL+T8o3cEzLoCV3i2jDCciY4pEdhkIs0+zhwfDThA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WTLeoXaM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B8D606A326
	for <linux-doc@vger.kernel.org>; Mon,  2 Nov 2026 20:22:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35B8D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WTLeoXaM
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6afac79b3a3so1645a12.1
        for <linux-doc@vger.kernel.org>; Mon, 02 Nov 2026 12:22:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793650972; cv=none;
        d=google.com; s=arc-20260327;
        b=dRlKuGaagZCCYaE3S7JY7/3+LR5/Bu9r8i627q2Q42UIEdGZEGL88+M++WUCwcarDR
         QFdJwLgdb7JljRWZoHG8d+ZwgE3KdceB9EjOi1fMT0j+czjctjxnwehHoFsUd4OGWMet
         5vfbAg7IH/q1VC6USJ0oFBecFag28zkhjHU0xujMQx8HZjsUYdBJ8FG0PfhUtwBkPr9r
         X9D3AKDIVZnQiT07uE78dnULBiLNC6ySM7hBIE4ra8LTLQjNO53U364W0HzyEhbyP9aZ
         B8BNmIx9eZqwwlvOUGf5wKizSWsyLr+yqP4byXOakh4qvj9L7T082JSfjiTUyUgDjRvq
         3GVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nGgNd76Kt0jva/qUzoPfHVBqT3P4/TT41j1U9WFJiKc=;
        fh=qj9Yt9iwZfJ8Ee7fRIUx3tPgVD12WuCNehaq70oKXak=;
        b=kCBX9+wuCag8GKjDQuTOb7fSsEtcTkX6S53HPGYH+/5esoLezN8U674jFQKtZRMn2H
         jtC9Y52DhwMlsfQyGZRN1qBxL02RTjuMEmm9dojN0Mh0mceli137qmZhCK5BAXvnUCUw
         RLGc1I2ySx+/2NbnVZvePgSJY/RD8f4PXDw0k0EBRgfHZSvOoW5VLoPXhsmasPa40zSI
         kdpv0wsMScVw02WU04d5TRuJO9IfhnmgiTlbcUmZCPNuBIX7OnMLSq9DQ9E6Y32MfRIi
         SGWfkKiYNCFTmtGr7KOK6s5g0pmenghBVnG6IkPh8sr6NGe62UAYkiFMrTUwzgEAsU0n
         GYyg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793650971; x=1794255771; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nGgNd76Kt0jva/qUzoPfHVBqT3P4/TT41j1U9WFJiKc=;
        b=WTLeoXaMbtfPh80tQmf3HQ8nC5kUQuN+8gdXjvA6WP/CGdQLaKBX0NRnTgYdebT6he
         9KhygIdY7O49++KNHeK7e9mU/LKRtMA81exivUt7gaasEtNiZJxhCQjZytYS0Ri386w9
         TZ5guUlHsNSEWUnUW0Q/NXpy7jC8D97ZTb/FMclBBwVp+gIiG8BlwBNyOTJs1VnOae50
         e2LnGFCcNlaRnWNwsLTwuF5C9vPy4jQzKKCB7UJccqg3aMJL9WReg7EK8lskUB3nJ/WN
         StUbNHwe/JORsebqg9SPN5NlXsEDIZZrHgJCQfs1VoVGvcwWrVOjyCCXH03jcPZe56y3
         X7wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793650971; x=1794255771;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nGgNd76Kt0jva/qUzoPfHVBqT3P4/TT41j1U9WFJiKc=;
        b=gaPAcOn+kehokWbX9ZcemKozoYmyQiWXG4CZHsWL67PfA/M5kkOAj1YIilSs8QbQIA
         iSOavzmz+ug7Yg2dwpK8yT7hwx5kDUXPgLfZ6IW4c11+29ji4sOEC7/gGMVxQ2w+cURX
         98yglikL1fGeUpVnkL/sisgzysev0EsNgDYkcTuHkMXuW09wC93YX7RyyPcv8JsfciK3
         ZTVRd1TiSvah/ADjvjFQbDzBkJnvsBJ6n03iwah37rxIQmb4QTURrTcXlt4C1g/v6Krk
         B8kCPxFvevn7dl7E3mY1rWYfawycgd5XY9I3dsliD3aKpWGq4McX//vbZvrb9ZCoQrQr
         r7Ww==
X-Forwarded-Encrypted: i=1; AKwUvBwEF+HYQA1XiXlZ8Hg334Lpu6jWjUPDCIZjNW+exx4Np7+AJnjQ7IGPhSREF8H2LMag4oFvgfpRodc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/FVLqmgJZ8Sa7EhqwPHPb0JM9wFIhy5GE9tAyfD9XkOuX/fZI
	y5Ya0qT/2mJN9gLK5wb5uAShuusGBGmzch2UxPA7DDZ6WnTGofpS2PI/oogY0evPYiKu6od0T3l
	BJmigpZX00VAaQ2hZurztkS1sjQLtgUBRy3t24YAr
X-Gm-Gg: AYBFou2FuUf/2XwoX+7lr5wV7tHlsslCvOYc1LErGehQDA9SEbaw1FB6IlYyTDQrh0o
	XOgVVYwCV0EVRAHvf62USienb84IaLT708AztTMgQYpi9rNTN4U8ErWeakWPwBGCXERkpEi/gjE
	PbEc7P9NpSqUA92/PBZbx2Bchyx74iDwGG24KG6EJ6PoUkazAZeFWo+tA1S4hu8tDf13IB7JG3E
	hKHHErAjRHf1KRtETEt1jl6Z+f0BCRTHtkbbGJPHgO9rUJx6M4qFX0lYsCHNcjVRC/m42jbpHix
	f7Kqm0904aBlKoOVj4a73D4B9pCgeA5JM8mUtRN/N9+k2Sy/Ghyd79Y1F0v/YJS4CjDg6ZsBkJn
	DkcuxtEGUhzfkIZ21MmbpTHEe0gfOsTvPX+1seIh3EUWYiERfkoxj8jjovIChCEw7+jQ=
X-Received: by 2002:a05:6402:15d4:b0:6b1:aa31:a627 with SMTP id
 4fb4d7f45d1cf-6b539cf5521mr2845a12.4.1793650971061; Mon, 02 Nov 2026 12:22:51
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
References: <20261102191438.1059771-1-sdf@fomichev.me> <20261102191438.1059771-3-sdf@fomichev.me>
In-Reply-To: <20261102191438.1059771-3-sdf@fomichev.me>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 2 Nov 2026 12:22:39 -0800
X-Gm-Features: AclHuK-QodshQH_GCQKz7_frUweWOEIBaSlwEKwxSIRLVgKwE5w2Aav3CTXsWCY
Message-ID: <CAHS8izPefhGytGNeDWZzgZOi=gLeigZ63nFnkq1ERXXGwrNkeg@mail.gmail.com>
Subject: Re: [PATCH net-next 2/7] net: devmem: charge the frag length to TX
 skb truesize
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
> truesize isn't well defined for devmem TX frags: they point into a
> dmabuf which stays mapped for the lifetime of the binding, and freeing
> the skb releases no memory. The charge only feeds sk_sndbuf and TSQ,
> which limit queued bytes.
>
> Charge the frag length instead of PAGE_SIZE:
> - TCP uncharges in bytes (tcp_trim_head(), tcp_fragment(),
>   tso_fragment()), so the charge must not be smaller than the frag.
>   PAGE_SIZE only guarantees that while net_iovs are PAGE_SIZE.
> - Frags shorter than a page now count their length, not a page.
>

I don't know about this patch. The justification reads a bit like.
"net-iov charging is weird and broken anyway, so we can do whatever we
want. Charge size instead of PAGE_SIZE for no reason."

I agree that charging for net-iov is extremely weird. Neither of
today's net-iov types actually allocates any memory. Of course when I
was developing the original infra, I took every shortcut I could and
just charged net-iov as regular memory, but that doesn't mean we can
do whatever we want.

I think either:

1. say net-iovs are not really occupied memory, so do a global cleanup
that charges 0 for all net-iovs (optionally making it conditional on
the net-iov type, so in the future someone can easily add a net-iov
that actually can be charged)", or
2. change the net-iov size to be actually size instead of PAGE_SIZE,
and keep the current 'we charge net-iovs even though they're not
really memory', and then this patch makes sense.

But I welcome disagreements.

--=20
Thanks,
Mina
