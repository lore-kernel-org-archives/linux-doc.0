Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461AB36B064;
	Tue, 18 Nov 2025 16:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763482437; cv=none; b=IWyCQSz9d4IY2Oq/bwq3nCQ+ctlT5prlag+3cPmVKnTb9RZZYdDhdMCRhoqw8Xy5P5lqYTccosuNoWHOLyUPqa3xHJk/0/GZEkqafrDYLv2LB0cGuL4W5815Ws//HP6ATMWB6I2RRLa9OAUoLrMxyL9jQDLwg+7xNt0nKf9H4y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763482437; c=relaxed/simple;
	bh=ZErJ1stbDGIyZGoBgeEkPvnY9cCeOZujnAfcZxubxw0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=X3rI3yvPgkBelwGBkwFQZz/GFukoGjUAKJSysxx/gn5ODdnmg0Eu+b9B/ay8xgt0AXabO/BBKgnmnzVvMjH4wDrcLHEbU7l3+wC2cqKRFSuBcyIjfgy95hzB8FeMH/t6IbB2ESpulQXkhDryCoiXDugoVBuo7IaAP8SSvwhW5Gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=U0fXHzTy; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="U0fXHzTy"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 729FA40C42
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1763482434; bh=z/ptu/328X76JEIHZbrfyQlPMFmoz2Zdf92tUTm1rp8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=U0fXHzTy4PUuTgHcgK9tpgm0NBtfFY7RrK8t4KG2Af9VWaFUcxOlCcQFbXfazoQZR
	 +MeBZgilUsXeLZMZuR1RKfsxsOVHQPejqYminbIF01RLpDLmEQ5aOnZz5YJ32XvPub
	 rcMWMXWxwRRlsRZQwvlmc+Wt28YY6CSEF98/Lsas6wne2b7Ul9vzNkIKNnh4HJyWG5
	 xF7RXGsOvuZfzr8cPi1u6jBD6GbDpvIIAl3HHgyKytJ+cc/7mJ8aYrpT8RShGmmNQz
	 O3kRLh0qSyY16C+WNJGLAn/8a4WI0wKtI7CfHnrqAatWlTZjuaktBRTacIdZ6Bekay
	 ROBsUvk+ladpg==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 729FA40C42;
	Tue, 18 Nov 2025 16:13:54 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Ankit Khushwaha <ankitkhushwaha.linux@gmail.com>,
 linux-doc@vger.kernel.org, Mauro Carvalho Chehab
 <mchehab+huawei@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, Dongliang Mu <dzm91@hust.edu.cn>,
 linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, Ankit Khushwaha
 <ankitkhushwaha.linux@gmail.com>
Subject: Re: [PATCH] docs: parse-headers.rst: Fix a typo
In-Reply-To: <20251115114233.32239-1-ankitkhushwaha.linux@gmail.com>
References: <20251115114233.32239-1-ankitkhushwaha.linux@gmail.com>
Date: Tue, 18 Nov 2025 09:13:53 -0700
Message-ID: <87ikf75nem.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Ankit Khushwaha <ankitkhushwaha.linux@gmail.com> writes:

> Replace "vantage" with "advantage" in the description of userspace API
> cross-references.
>
> Signed-off-by: Ankit Khushwaha <ankitkhushwaha.linux@gmail.com>
> ---
>  Documentation/doc-guide/parse-headers.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/doc-guide/parse-headers.rst b/Documentation/doc-guide/parse-headers.rst
> index bd34a6d00ca9..a7bb01ff04eb 100644
> --- a/Documentation/doc-guide/parse-headers.rst
> +++ b/Documentation/doc-guide/parse-headers.rst
> @@ -5,7 +5,7 @@ Including uAPI header files
>  Sometimes, it is useful to include header files and C example codes in
>  order to describe the userspace API and to generate cross-references
>  between the code and the documentation. Adding cross-references for
> -userspace API files has an additional vantage: Sphinx will generate warnings
> +userspace API files has an additional advantage: Sphinx will generate warnings
>  if a symbol is not found at the documentation. That helps to keep the

Applied, thanks.

jon
