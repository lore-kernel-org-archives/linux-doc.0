Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9433E1864C
	for <linux-doc@vger.kernel.org>; Wed, 14 Feb 2024 22:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707950566; cv=none; b=WSj16mXbPvoeElLvcRJXBnzhTSja4z0UhfW0QaXXMH4wR2ZfmcVTDE/Ox3GU+rRypLMAxnZrMPCNBVuDUioIWa4OZz76EwxHinoJwGd8mwAeNCVbZ8WL1JCF0PJI3ZduLiOGKV9Bza5Z6MtmWR3ARxxDltSl6ThSQ/9AiJwT6xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707950566; c=relaxed/simple;
	bh=4pN6mL0k3AML5JfE7M6c/mKY6sv1QtzX2/+WUslRnOw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Q8dG6XwuZflQwXcyuKAWlJh8Xdj8VIp5qYzG2ga0u0x3nFICSISQg4j56L7jRxp+N7oAcMDJ5ic69u4MlkZ+Z8JHFhuda/swxG6z0TdjYL+OhH01i3OjI14jMkaG3rl2bmS+xw8zw/3P3u0t5h3WXS75o3c3LGvf7iiIMd7M6YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=krH+rCH3; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="krH+rCH3"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net CBC8A42A45
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1707950564; bh=4pN6mL0k3AML5JfE7M6c/mKY6sv1QtzX2/+WUslRnOw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=krH+rCH3t0HNOWqEYd+VMYbXNBhq+5eXL/o8OH9cz7rUsm0HlcKRpTGvaGMffC6l/
	 scke/eZSQCCScVCqkoYX612EaWTFXZW6HajrjdBCOmJv290RGZy4hWu6gnreSc05XJ
	 ++cb36b6wlwUtWO+bqA2zbrXBYa3FxpwlBikP/rMefdJV9GkQqLIJ7se3k6K2IIood
	 f699hZBg6sqcFWcSAGuPRfvPdvKTL0R0bv7S1UFxH62rIFIIvRGOkSSjL20oW6ky0a
	 IDExEKXnDiCPEI1e3PuBxPZ2R5xyyQ83cA7LmAiTs7IeDnThJrDKPXxLwNhoJJTAu5
	 Qyy/ul15JtyDg==
Received: from localhost (unknown [IPv6:2601:280:5e00:625:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id CBC8A42A45;
	Wed, 14 Feb 2024 22:42:43 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Vegard Nossum <vegard.nossum@oracle.com>
Cc: linux-doc@vger.kernel.org, Vegard Nossum <vegard.nossum@oracle.com>
Subject: Re: [PATCH docs-next] scripts/kernel-doc: reindent
In-Reply-To: <20240208161705.888385-1-vegard.nossum@oracle.com>
References: <20240208161705.888385-1-vegard.nossum@oracle.com>
Date: Wed, 14 Feb 2024 15:42:43 -0700
Message-ID: <878r3mzmzg.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Vegard Nossum <vegard.nossum@oracle.com> writes:

> This file is using an ungodly mixture of 4 spaces, 2-wide tabs, 4-wide
> tabs, _and_ 8-wide tabs, making it really hard to find good editor
> settings for working with this file.
>
> Bite the bullet and reindent it by hand. I tried using both perltidy
> and vim, but neither of them were up to the task without changing too
> much or getting confused about what they were supposed to be doing.

OK, I've applied this, all seems well.

Thanks,

jon
