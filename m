Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C452032D;
	Mon, 25 May 2026 20:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779740234; cv=none; b=aYKtpYE4K9u+uY1NZHXVmyd4jtKpZKEjeO0RHV9lKvwQ4IpH93dtBMad5ecfU6f7y3ZdZB+tjRyPUEWUV26MBCS+ortlsQ0Ra1ht0yAPTupa5bmeaNgXCZr02jo0Hphr4dLybllFWRHppGyadrTj4qPMGfZWKGF4qTcDg3Rs9wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779740234; c=relaxed/simple;
	bh=9St+23T4ZWbodsJnE1Sb0jbfKhmYm43xFCeYRF6vMhQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=IHcY++eDro4CKTSnu+Mq7XWrwDE9QgNT6AIdCuKIRLOikNBd7ZukLZqINGOrM8Ux+bcuNtyoDQAWStzam+JSddgBAFstldiFWipZ3a8WU/lF8G/ePVrzp25HtEJuxkERse1YlLZh7fEi/deliykDB3oLTd3TRR+UkIKY2VkAzw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=la/zpYo2; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="la/zpYo2"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 4D5A440B0C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1779740232; bh=evOSW8le8jGYEdnDauDxm34GWwO19llaOmsSDeb8Xqo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=la/zpYo2pW/COzPVR5YxsgaMTJoWXXc/rg4+LerU1i5ahN3IaJzZsyY6X/ZMAJQwY
	 9vtUaV1gYiLTYwN5XCDBhLTJ2VNedzxDCJIw3kXqyOQhu1PDjwwd1Rl7UAj7Y/qdmC
	 0KuDHGfZRRuS2BF7QfbJ24mUbPiTCZ9BVTNu8N3PZN8RcDWoWZ/9gCBRNLjVj4KAHy
	 5gIQxSdnWu2+NGcc3uOOuexR1Gk4wsGgUw8j3VdSFOP8O2H/cfoCoua7iiMwRqSCZ2
	 XiL8Qc5kSqnLtgymbINWQmKm48PvD+uquSlM1kyKxBUjQJ3LeoW0iLlFB0Zg/F1+X3
	 eYmdG/8RSp5Sg==
Received: from localhost (unknown [IPv6:2601:280:4600:27b:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 4D5A440B0C;
	Mon, 25 May 2026 20:17:12 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: MigMarGil <miguel.martin.gil.uni@gmail.com>, skhan@linuxfoundation.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, MigMarGil
 <miguel.martin.gil.uni@gmail.com>
Subject: Re: [PATCH] docs: md: fix grammar in speed_limit description
In-Reply-To: <20260519095622.9541-1-miguel.martin.gil.uni@gmail.com>
References: <20260519095622.9541-1-miguel.martin.gil.uni@gmail.com>
Date: Mon, 25 May 2026 14:17:11 -0600
Message-ID: <87cxyj1by0.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

MigMarGil <miguel.martin.gil.uni@gmail.com> writes:

> Replace 'This are' with 'These are' in the md sysfs speed limit
> section to correct grammar and improve readability.
>
> Signed-off-by: MigMarGil <miguel.martin.gil.uni@gmail.com>
> ---
>  Documentation/admin-guide/md.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

This patch looks fine, but we need a proper name in the signoff, please.

Thanks,

jon
