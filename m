Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE7A255E34
	for <linux-doc@vger.kernel.org>; Mon, 10 Feb 2025 18:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739210491; cv=none; b=pF4Fd8HicaWisl6u32ac23Q3IPijtTwvMQXpC9gEcgVIkv6o210NlJTQ0vBtE6K9lV82RD1oiEM/H4MJ5C5xDk+Qmu92u6GS4UOMKdKflJ+TGGzUGQeAf78ZUAt//N6qYUwMj66DoS3MDtNhs/zZfGsWz5MeTnOefyOMlLY3iro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739210491; c=relaxed/simple;
	bh=flwnKuvxd+4U5jN0pKGmiVtt/ji5zPTgIlSYdnv9Jkk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=dllizlKPznhQneVRqt6Iuw+cGUZeRLVqHeyJ90M4GT1GLqeh1IR9lpPAdLPvyvmi9HeuiEYL7BuZYBbD3d2lnQPdr7ek0cWtRQJuFSECJ4MihBWJG8WHAa279zeQWOqdIPgQBZIuYDAg0nojPKw9uiOHyRIrZAa4AR28j6tnY5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=HtkmtI+C; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="HtkmtI+C"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net CB303411A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1739210489; bh=x/NT4JxDvfrGgWcKFBEtIQJA3+ZCBBaRwuhuryuCiRw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=HtkmtI+C6qyTNz9dMg1h5p8rEeiNBpuOJfLVkEwfzIfy5DgiSbPOeZWKqKnaYHJQ7
	 +7EtfHStBsZC8ClGN6llOAy59ctMTCOevdTtchAMyEvZ8l2rkMz9MciqkKbcIhnBin
	 0TcCfTTUZRx194mtnl+zcMRwQr6NrU58NhnGcUE0HMEabU9yv9H4bAZIEkc1LJtO0n
	 zHnNSbAagbGVJPgFH+AWxftSHAEvh+SQ41xnCHM79HQmNUXM8XEsxNsYE+r3SRfhYT
	 k3PeoCxL2M8x6nrvzRA8quka/qztg5OrFslsf3imedAHEFp+OT6gtGMtp5d3YaTtFu
	 019qUchhJknYw==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id CB303411A1;
	Mon, 10 Feb 2025 18:01:28 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, Akira
 Yokosawa <akiyks@gmail.com>
Subject: Re: [PATCH v2] docs: submit-checklist: Expand on build tests
 against different word sizes
In-Reply-To: <05c0b99c-c2e9-4702-90fd-8a4127586424@gmail.com>
References: <05c0b99c-c2e9-4702-90fd-8a4127586424@gmail.com>
Date: Mon, 10 Feb 2025 11:01:28 -0700
Message-ID: <8734gl1xxj.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Akira Yokosawa <akiyks@gmail.com> writes:

> Existing sentence on cross-compilation that mentions ppc64 does not
> make much sense in today's perspective.
>
> Expand it for the benefits of testing against architectures of
> different word sizes and endianness.
>
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> v2: Split out change in the English doc from v1 [1].
>     Keep Randy's Rb tag (as it was meant for the change in English doc).
>
> [1] https://lore.kernel.org/20250128102805.112691-2-akiyks@gmail.com/
> --
>  Documentation/process/submit-checklist.rst | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/process/submit-checklist.rst b/Documentation/process/submit-checklist.rst
> index e531dd504b6c..88b6358258d7 100644
> --- a/Documentation/process/submit-checklist.rst
> +++ b/Documentation/process/submit-checklist.rst
> @@ -91,9 +91,12 @@ Build your code
>       fix any issues.
>  
>  2) Builds on multiple CPU architectures by using local cross-compile tools
> -   or some other build farm. Note that ppc64 is a good architecture for
> -   cross-compilation checking because it tends to use ``unsigned long`` for
> -   64-bit quantities.
> +   or some other build farm.
> +   Note that testing against architectures of different word sizes
> +   (32- and 64-bit) and different endianness (big- and little-) is effective
> +   in catching various portability issues due to false assumptions on
> +   representable quantity range, data alignment, or endianness, among
> +   others.
>  

Applied, thanks.

jon
