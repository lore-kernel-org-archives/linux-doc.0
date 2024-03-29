Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CFF8149C5F
	for <linux-doc@vger.kernel.org>; Fri, 29 Mar 2024 14:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711722968; cv=none; b=ewbA+Eo3nQvWWCsRDfj0D8ceGT2nlUvMU8Xphsrsd9K246rcHZqlk29ZZ6b0U4qt4ACXD0RMGbgkxbRtmL4L1TIvNjlCa9hkyMtvPJ6LZm5nBh2kYJF6wHZVaVUTIItj1rRhU3PEBHWYJ8knV+mVTkwkkNkyiXkZQktyaoMrfWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711722968; c=relaxed/simple;
	bh=dFxLaHGnqHS7YMEF+Lr6TBMOkUNGxHgPAgNmCT3tHfU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=AAxMV240ktdP1FbVXsc+89vobCttmfY7yiwWtS0rxjfTuIb3BAz8H/adil1VS7zQpvcmFFb2kPdGBuQiquyQkHDKzYv/9HvEqgXA1cm6BSME+sNMdLw3z5oSjM1XSQ7zOGY+h8Ioh0/1lNQsx8D26RmLYGlrqysrQVOPifOWcdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=eKIiW+sD; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="eKIiW+sD"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net EDE1F45E3F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1711722955; bh=3e6NtER+4j7ul8uFWXiSKK1i1m6r60RknFn8Vy1nDow=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=eKIiW+sDBdbo0Xdr0m8S4cyQewjYKIbYhdN96txSJHT3quc9JWFsC+QlQpYvy61gD
	 u4iv1srhwTm216pUOcN44GCb4au1IhUGOhbmY/ryZsbynZCgoJqmSChkJxqmiPgIBj
	 +Hb0OiaRc/S0NH5B1cfotSe6iTlT2XMwRzRI6ZGpp+s5stU9yo1b0aEe0q5onktjwF
	 4amToHG1elktSUpuUARZRZFjP/WbrNVJgfZwqkYwmseeLUaW+BudDG7UQN/qmXuAQX
	 oa5O55XC+iwyxSmtANtRyyLQA0i70HGdPWFC+uks3S0c8Q9hXA2VVpvMi3SajWQSUW
	 t8CMgSAuvlrNw==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::646])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id EDE1F45E3F;
	Fri, 29 Mar 2024 14:35:54 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: linux-doc@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>,
 =?utf-8?B?0JjQstCw0L0g0JjQstCw0L3QvtCy0LjRhw==?= <relect@bk.ru>
Subject: Re: [PATCH] docs: Detect variable fonts and suggest removing them
In-Reply-To: <20240323120204.155678-1-akiyks@gmail.com>
References: <20240323120204.155678-1-akiyks@gmail.com>
Date: Fri, 29 Mar 2024 08:35:54 -0600
Message-ID: <87jzll5cmt.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Akira Yokosawa <akiyks@gmail.com> writes:

> xelatex doesn't understand variable font format.  Recent deployment
> of variable Noto CJK fonts in Fedora and openSUSE tumbleweed breaks
> builds of translations.pdf.
>
> To help developers work around the build error, add a script for
> checking existence of variable form of those fonts and emitting
> suggestions.  Invoke it in the error path of "make pdfdocs" so that it
> is activated only when PDF build actually fails.

[Back after three weeks far from home...]

The problem with this is: removing those fonts breaks other things.  I
ended up putting them back onto my system after, as I recall, Emacs
stopped displaying non-ASCII text correctly (or at all).  So we may be
giving advice that some users come to regret having followed.

As a result, I'm really not sure what the best thing to do here is.

jon
