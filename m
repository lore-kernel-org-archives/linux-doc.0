Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448494499B3;
	Fri, 10 Jul 2026 19:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783712856; cv=none; b=VGu3ieR8YWfaXbV6cJPTY0SBWzp0pybyAitQINSUvw8X2A9OBZCXxqYB+4E+TTBbw5ESmkcoP1WzmZ++752l94yvjI+qCWuTy0HIkoIFL/XfPAdjF2zDYYHx92J7moziFkZKP0ftuWwe3wA9XMMsXXj3jVT+qqayvaV86HsdSEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783712856; c=relaxed/simple;
	bh=0X/qCCKL9UANwFgR3pTc0oc/lfNkg0wO1r173BWHSAE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=k22enhowf50EaAWy7fAiRyRa5B5V/aOu0N+kDAxcQ8bPjMxhw3bkzscQCSO2uw8XNZR7hEBpFUTL1MYno0VjQpkN9gr60GsCpNmCONhL5HyinFcwtQkS7IobGdPXqDau2YGsHT8rzuSORlXQIGysP9SJqCR7C4wyWOHP7mRrITY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=SC4E8LPZ; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="SC4E8LPZ"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 580CE4108A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1783712854; bh=00BSXGOOGWfgLcBkQzMzpCXADoTtnnnoI+P3mZOGIgY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=SC4E8LPZP+3WA8lqxo3Zstc5pzdctDg4CizYA3bTYuECYrknq6A86IfwoMcwhUu6m
	 7zKKt3VW/CDDYklI5uKxkKGhYd7O6MnoYCTfV5e81gDxv+Hv+jqGz585LQAU1S4Psn
	 wMFLvYabsXKtS8GvCsdtUTZ5N1q+ipgMxuQH4kIqGwsJe6t7zgQxnt4z8Ilnle4tM3
	 OTgIty/2sMulOb8iSJtZS+Ryxss4KAgi2fRKA0x0LusOSR5DZ9mTnfYL10WNuy8Smf
	 ceurop63088A05xBGooAmxTufmIJO7gRH4ZyGNwgoQxaMFKdmhj/fgNEI6oBKCIxB4
	 ctMVpUrLjEj0A==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 580CE4108A;
	Fri, 10 Jul 2026 19:47:34 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Seongjun Hong <hsj0512@snu.ac.kr>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Seongjun Hong
 <hsj0512@snu.ac.kr>
Subject: Re: [PATCH] docs: ABI: README: fix grammatical error
In-Reply-To: <20260701125501.93170-1-hsj0512@snu.ac.kr>
References: <20260701125501.93170-1-hsj0512@snu.ac.kr>
Date: Fri, 10 Jul 2026 13:47:33 -0600
Message-ID: <87ik6mk4oa.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Seongjun Hong <hsj0512@snu.ac.kr> writes:

> The Note describing how to write ABI documentation fields contained
> a typo. "The fields should be use a simple notation" should be
> "The fields should use a simple notation".
>
> Signed-off-by: Seongjun Hong <hsj0512@snu.ac.kr>
> ---
>  Documentation/ABI/README | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/ABI/README b/Documentation/ABI/README
> index 315fffe1f831..27c962e6a872 100644
> --- a/Documentation/ABI/README
> +++ b/Documentation/ABI/README
> @@ -62,7 +62,7 @@ Users:		All users of this interface who wish to be notified when
>  
>  
>  Note:
> -   The fields should be use a simple notation, compatible with ReST markup.
> +   The fields should use a simple notation, compatible with ReST markup.
>     Also, the file **should not** have a top-level index, like::

Applied, thanks.

jon
