Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33EC2C029F;
	Tue,  6 Jan 2026 21:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767735462; cv=none; b=Kc7edgisFjMh9AMFkYenLnvfYzolhcvq15swcqiGBtxxY/PizxuI4vcYtk/LDLhfHh/tst6Frb14BZKqYHjj+tDDjlZNSRfJh3jJOU8U/GVEZZZd2FbfWMsUBvU1ZxjmGWF+HWzvg7hEkwGNy80ulHGGZc4hwDQNhe7hT9hPLd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767735462; c=relaxed/simple;
	bh=Z7caaMNYYadkxq5J2ESBA4RjTew5v+PjDwXW0ujSbBY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=s3SaGYhNH57kl6sJNpI9Q6lzRdiUW0DZuQDOEbANkwyzUulnqS64PwLX0M/skSkaFEsFHIpJ4V3KwSLXfFUOit9HPePMoPiLRFBScqWq6ZZi3jl+e9GywgVwEEVB0kAKei08ZcGJTi0MYZSGKiS6PHSt+ofWJj2hDMxWKd80JYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=eRN1qYED; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="eRN1qYED"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 2BB4E40C7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1767735460; bh=yGlgri+7O4k2tjs3DElizsYHrH7ZhS5W7J/s2MsbJj8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=eRN1qYEDPxdFDc7BTJ7nKvlFx0hnNqKXg4u81BSrX+sKswvM4R/j9uYI2u0HALyVd
	 7rXgf0J9wa0v/G2FibhJ96oOHMrThOZi3HiQQAZrisFgKp2WcjGOU+jAhhkbSAMSFQ
	 1jn7fzaxCQRndSwA0BGOkcT3d6Em7AAZET9I3rcIL98svj/faeLAzFXWEM10axBZZ5
	 SI12NFoCgRK3y+0ASQHyrGSHD2mWNuzc/f5sIBa1xofwuStIUWMbvnVG9spa9NTT+G
	 1FWCKD1DIK7W5fy/bCJ1POg1iOZ5trNSf8q/DFIFWOdBiIIJMr4OycaJsRKoZS8t3y
	 T5SK2x0TlxbUw==
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net [71.229.227.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 2BB4E40C7D;
	Tue,  6 Jan 2026 21:37:40 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: mustafaelrasheid@gmail.com, Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Mustafa
 Elrasheid <mustafaelrasheid@gmail.com>
Subject: Re: [PATCH v3] docs: Makefile: wrap SPHINXDIRS help text
In-Reply-To: <20251227125244.6407-1-mustafaelrasheid@gmail.com>
References: <88fe4b63-13cd-47ce-8408-1e9d6f947b3a@infradead.org>
 <20251227125244.6407-1-mustafaelrasheid@gmail.com>
Date: Tue, 06 Jan 2026 14:37:39 -0700
Message-ID: <87h5sye82k.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

mustafaelrasheid@gmail.com writes:

> From: Mustafa Elrasheid <mustafaelrasheid@gmail.com>
>
> When using `make help`, SPHINXDIR doesn't wrap around 80 characters,
> causing text to overflow or wrap in incorrect ways,
> which then makes the text difficult to read
>
> Signed-off-by: Mustafa Elrasheid <mustafaelrasheid@gmail.com>
> ---
> v3:
>   - Moved SPHINXDIRS to a new line for better readability
>   - Added `-g 75` to increase the goal of fmt instead of 93% of `-w 75`
> v2:
>   - Added '-s' in fmt to prevent word segmenting at the end of lines.
>   - Reduced width in `fmt -w` to account for the added indentation of
>     `sed`
>
>  Documentation/Makefile | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied, thanks.

jon
