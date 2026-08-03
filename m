Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0D3312815
	for <linux-doc@vger.kernel.org>; Mon,  3 Aug 2026 18:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785783304; cv=none; b=sDDH2Pqb48ZvWwTQs/Sf+OEWoBe/V2GxnH6yszmzmf+sUfCszvxcYbb/uJo36w6nXPrr1DIIaIyHf4BqQJPzwr1jLXZ5Ww+itB90GJ7HhjHJ3INulS4zovXI6h27TouIhokL9hdBcn8rLGJObKUDyJzUVrOPBFCncA6YS9smbvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785783304; c=relaxed/simple;
	bh=VX5Vy0lQAf1RQ7kVYta1XqSxu6+WfeiX1eYkkzH1JZk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=RIqpzWi5tVPTB18FAWPKavLOrTxlcp2+G0k1Cp2gAfZ5WKwUuG9zM22s4iCZY3JcH0uOn5Abx62QBx6lftZ6D/dIYllhyKbZnvQkoQnEGuuZJJnynl1PMNhhPJBfyRY72dwff92yEWR/VhSXyb+leAvsePLOzuSkwCZ6E7bbNmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=YIvtEIwt; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="YIvtEIwt"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 1A996408B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1785783302; bh=0F52mNV9uXw8ySNGiEk5gGtjqCUQxCmLDYsGM1O6MLQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=YIvtEIwtFnXtUSE17/Z9uRXkDkZW8k3oI+wc4WYZ/g9naOLCXfhqbMExNhwG8CTI6
	 /wFbzeS85tbazqSQMbhzm0wAGfkZsvUQMzVNV93uY8LaG4EHlHe+xja6xxMZCwzQi3
	 91bNDmXGQ9jL2i0Vw7yope5+DMu7sESjq5MqRV6rYFRphWe8R+Puv9nAB54sQRYc1l
	 IYTk2/0U+lzuUJVW1eu0QG+sdeVkoVq6rtgM5B+eAlbGgiyYqMVWpMNWxIfgXpb8d5
	 AfLD2wrVxXvP1xlV8IzgTBidkmORDS7ATETk5i/GewUVH4Qsd8Y9VOq93es0HdOdkL
	 mfnzkEaQl7xlA==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 1A996408B2;
	Mon,  3 Aug 2026 18:55:02 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Ygor Otavio <ygorotavio.sjc@gmail.com>, danielmaraboo@gmail.com
Cc: linux-doc@vger.kernel.org, Ygor Otavio <ygorotavio.sjc@gmail.com>
Subject: Re: [PATCH v4] docs: translations: pt_BR: fix email-clients.rst and
 add to index
In-Reply-To: <20260726235352.3926-1-ygorotavio.sjc@gmail.com>
References: <20260726235352.3926-1-ygorotavio.sjc@gmail.com>
Date: Mon, 03 Aug 2026 12:55:01 -0600
Message-ID: <87pkzzxce2.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Ygor Otavio <ygorotavio.sjc@gmail.com> writes:

> For V1 Translates the documentation regarding email clients info for
> Linux into Brazilian Portuguese, maintaining consistency with original
> formatting rules.
> For V2, the erros "bullet list ends without a blank line" and "inline
> interpreted text start-string without end-string" were fixed. The others
> erros that appeared after the submission of V2 ware also fixed.
> For V3, the spelling errors pointed out during the review were
> corrected, and the missing index.rst file was added
> For V4, The last spelling and character errors have been corrected.
>
> Signed-off-by: Ygor Otavio <ygorotavio.sjc@gmail.com>
> ---
>  Documentation/translations/pt_BR/index.rst    |   1 +
>  .../pt_BR/process/email-clients.rst           | 368 ++++++++++++++++++
>  2 files changed, 369 insertions(+)
>  create mode 100644 Documentation/translations/pt_BR/process/email-clients.rst

That is not an even remotely appropriate subject line or changelog.
Your subject should be "docs: pt_BR: translate email-clients.rst" or
something similar.  The changelog should describe the *patch*, not the
process that led up to it.  That sort of inter-version information can
be useful, but it belongs after the "---" line so that the maintainer
does not have to edit it out.

I have applied the patch and fixed things up this time.

Thanks,

jon
