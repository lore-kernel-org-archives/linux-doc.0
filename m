Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1183921FF
	for <linux-doc@vger.kernel.org>; Thu, 26 Feb 2026 22:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772145623; cv=none; b=WJ+8wgT7lrROMVGfzbY51YctNyEw1rd0h+xoJALb4R2NipERtNM2WoT7n5EftS6W5hlcQUo+PO7xU4LBR0GxbuXl/pUhJ0eyWOI4FF83qOFhZ6O11up8y3difWLhhhFWMQZrcgO+w3zTH7GPquPRuOD/RUYAku1emDzVzv/tnG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772145623; c=relaxed/simple;
	bh=Ld+BTpHIXCMjhMvwaNRy4x3ey9fZ6cA0I1NRJtSSXWw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=crkZhFr5LNlWATXHckzhDuG7wadZ+uOWfihcNFFnwz5UX3R9E3S0RWV93zrZ1tldfAu7zxZ180SipQrfWnmyhG5NJoEPhAk5B5EWzuf/W96mvDQdYriq1P8TmT6v43Sfc+FSv4+fJfPYFFYVMid4+Ya++rya70M+ONJsTFl6nko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=IKFv1Lw9; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="IKFv1Lw9"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net D7B4440C9C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1772145622; bh=4wyaZXTM015ZUksuS8viNMy22alUz67T63h8jkp1I6s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=IKFv1Lw9yz4ybDlHWK0hRPmKvOqBUh0zHvRevUIwB0Htrmle9/22agk+DyDmWOPJh
	 FgrpyuAE0dNLAzirQ6/QYzNcnU3BUQ8JMa7BEs+M6Hauzj63L4JWRRFN9CvWR+CrgP
	 eCUETidkLfOKA97KE0SaXZBBBfZhwaETkNABa4H3r043L/mfOKqeOLCIs+q+OdQLm4
	 wtXqgB59aCY5FRl6fRV48M97zBsJjRez0FL5F+CWEY1HDOeONst6h1i3RDgBONW8IQ
	 brmoeA6hZg7Z/fgngGNvY6RuDlPJlgZRGJod6bqRCCh7Eau8PeUvMwCWLWyRNW28oP
	 t7TGf/GvR35hw==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id D7B4440C9C;
	Thu, 26 Feb 2026 22:40:21 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Daniel Pereira <danielmaraboo@gmail.com>
Cc: linux-doc@vger.kernel.org
Subject: Re: [PATCH docs-next] docs: pt_BR: Add translation for
 maintainer-handbooks
In-Reply-To: <CAMAsx6e0HUCw98bTqt9xJ+CaOC+rSA1h54T0WasR_mvKfaS7Mw@mail.gmail.com>
References: <20260226212716.260546-1-danielmaraboo@gmail.com>
 <87o6lb5fbo.fsf@trenco.lwn.net>
 <CAMAsx6e0HUCw98bTqt9xJ+CaOC+rSA1h54T0WasR_mvKfaS7Mw@mail.gmail.com>
Date: Thu, 26 Feb 2026 15:40:20 -0700
Message-ID: <87jyvz5dt7.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Daniel Pereira <danielmaraboo@gmail.com> writes:

> I kept the label
>
> .. _pt_maintainer_handbooks_main:
>
> to follow the pattern of all the other documents I'm translating, only
> changing the initial to
>
> _pt_
>
> .
>
> Would you prefer that I remove this label, or should I keep it for consistency?

Just remove it, please; I'm going to do the same with the English
version.  In general, labels should not be added when nothing uses them,
and the top-of-file habit in particular is something I'd like to
discourage.

Thanks,

jon
