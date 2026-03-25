Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617FF38F941;
	Wed, 25 Mar 2026 23:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774479970; cv=none; b=jbkgJkEZuxFRv8Ma5Zmzf8FOfoNh6FYqHxn1knlwCuXAWonlr2oRLeMtBMY4qay1vmnFq83f5o0pN3fkxsCvEu2i4h4EoS/zJjgabRb23X7ulu5ruOARrA3fIeZ2L9iYZeOsdsdVwWXq8qUn120w+pFpbWGbJMNqeFWB+I0g4JI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774479970; c=relaxed/simple;
	bh=eicldxdUl1w0e0JJzsUvACttb4/YjmTCaYoatoJB34U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ds68Q8iu7yaFKi065gU5UZiz3fvOw7Wt69AKJVjnY8y2wpNLEOi13jS0orvBjcUc4XCLAhKoStyrudJY6csvupn4dvinqh7Qqnd4O7Qeq0Km7pSczNcpIkn+58CbN0B0kwjAgT1XgBInjgkk/PRPNmOwmFw5u60EIKgJbxquc+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=rdYzV0U/; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="rdYzV0U/"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 69599411D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1774479968; bh=CuPgvrDLxhFcaWohabELHo/hOHuD2A3FhQ2uX/Ya0Fw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=rdYzV0U/Ucro84OcxqJV0BCipeOKlR5EbIn9hecKwSwcfn9WWgpBkrRXV557GqG7A
	 zHE5M4BDdLdRZCzK98ASFMKLZCgNrjkEbrQCeDdd5xXTnFcmGQ3NCEfcUcjIOblt2J
	 aysQq5MahYde2G30gdthoUMDZWP4fRQngBAJhTIc8VapXOoE2IFsAp6+PtYAofRPAb
	 kjt/AgJbT4afMHEzzTskF0dKvGX66iKlCawuTmp2F0UCtRfmfoDDX9YnndDgt/u6pF
	 BmszyFLZFg+Hu0lYI+TxgqdVBVPTZ5xJqkxQ8cquqOZXf0No9HvDw3bKZ5AsV1Ryx3
	 dtCCrmzJ11PsA==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 69599411D3;
	Wed, 25 Mar 2026 23:06:08 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Rito Rhymes <rito@ritovision.com>, Rito Rhymes <rito@ritovision.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-doc@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] docs: rework footer with semantic markup and
 responsive layout
In-Reply-To: <DHC7Y88CXPP8.1AXPXN8YUPK1D@ritovision.com>
References: <20260321131857.14166-1-rito@ritovision.com>
 <20260322182251.49484-1-rito@ritovision.com>
 <877bqzg146.fsf@trenco.lwn.net>
 <DHC7Y88CXPP8.1AXPXN8YUPK1D@ritovision.com>
Date: Wed, 25 Mar 2026 17:06:07 -0600
Message-ID: <87bjgbecgw.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Rito Rhymes" <rito@ritovision.com> writes:

> We could use a CSS override if the goal were only to change how
> the footer looks. But CSS cannot change the footer's semantics for
> accessibility, and that's where a fundamental issue lies.
>
> The default theme renders the footer as a generic `div`, and
> `class="footer"` does not give it any semantic meaning. Screen
> readers and other accessibility tools do not treat that the same as
> a real `<footer>` landmark.
>
> To fix that properly, we need to change the markup, either by
> rendering a native `<footer>` element or by adding
> `role="contentinfo"` to the existing container. That requires
> replacing the footer template/component, not just overriding its CSS.
>
> Since the footer appears on every page, I think it's important to
> ensure its a11y-friendly, so it makes sense to fix it at the markup
> level rather than just overriding the CSS to be mobile-friendly.

Please, include the context you are replying to so people can follow the
discussion.

We are not going to fix Sphinx accessibility piecemeal in this way.  If
that is really the objective, I think the right thing is to work with
the Sphinx project directly and come up with a proper plan for all of
their major elements.  Tweaking the footer - the contents of which will
be read by the screen reader and understood just fine - doesn't really
address that problem.

Thanks,

jon
