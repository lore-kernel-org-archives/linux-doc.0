Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555CB335573
	for <linux-doc@vger.kernel.org>; Fri, 16 Jan 2026 18:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768588159; cv=none; b=d8LaeBGjchZ94P0kHm2PMFXXy7Mi4MGEZoIMtDO0E0zS7xrTIfZmqSFv38TAWmgkw5hZ27z/BJsfxWJ85ostTfzL394qXSU4y6voj/Oi6IQ0GEoHgSmFnnQQHrTc38gwPpm1pnh/6QiSlULw39H55c/qWq0vNofMxxtr9w1T5TA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768588159; c=relaxed/simple;
	bh=OVLkH/DI521hwl8F1386gqExY44eNCoof9kF9sX8Jr4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=tsD3QDpuVCXzTg5cRl8zvw3qRArS+coPENzdNcxQGHSjdGpVK8D3A++LXkPT/g31vdsQopzbRmlW02sWxRi1Cj006wWyCZsipPaiHuVNHRoKiT98+Wme45S6IJAYAw7s3rKOBkbdGprSRfytPXLyB/qqdPb+1BQIeof04ZQbuZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Dr29EfQM; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Dr29EfQM"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 6512B40425
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1768588157; bh=qUU/AD22JoX3zUO6Zi4OLajnlTtooAvMGVsAqwvU1Sk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Dr29EfQM2PGuMSLlUUb8D+DeTh39+6r4p/5MrLXvHnPg86L3f7bYg6AsKaXRdyKpz
	 RoVGo+UHJVnS1X9275MDNpDyHW+Kz+mFMYC2IIvJ4PmwPp1yhl7u+z7+2IgDGjC65h
	 ROG0VZRolajAI3ocrC5HmLRYIM4e7T7ZQNjawrr4mePpHd6UeI7OcnGxK7yIJGLqos
	 /j9pfE02ui7SXD3+cmqQrsyLIw9IEOjxB3BbnatDsxMf0xBksLxt7U1cURAzYLXr0K
	 ISldRUf1c62rODnEbll4Z1QuaDALAf+TpW0YgksQCzy0dLfAIUIKJhzjRfSsJ8KqBU
	 ICrC9NqgvO2VQ==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 6512B40425;
	Fri, 16 Jan 2026 18:29:17 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Petr Vorel <pvorel@suse.cz>, linux-doc@vger.kernel.org
Cc: Petr Vorel <pvorel@suse.cz>, Alejandro Colomar <alx@kernel.org>,
 man-pages@man7.org
Subject: Re: [PATCH v3 0/3] Documentation: Link man pages to https://man7.org/
In-Reply-To: <20260113113612.315748-1-pvorel@suse.cz>
References: <20260113113612.315748-1-pvorel@suse.cz>
Date: Fri, 16 Jan 2026 11:29:16 -0700
Message-ID: <87a4ydo1hf.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Petr Vorel <pvorel@suse.cz> writes:

> Changes v1->v2:
> * Remove `...` (italic) from non-existing man pages (Jonathan).
> * Squash fix for sp_SP to following commit (Jonathan).
> * Remove :manpage: also from fxyzzy(3) (non-existing man page).
> * Add CSS for man page.
>
> Link to v2:
> https://lore.kernel.org/linux-doc/20260111233534.183272-1-pvorel@suse.cz/
>
> Link to v1:
> https://lore.kernel.org/linux-doc/20260109183012.114372-1-pvorel@suse.cz/
>
> Petr Vorel (3):
>   Documentation: Remove :manpage: from non-existing man pages
>   Documentation: Link man pages to https://man7.org/
>   Documentation: CSS: Improve man page font
>
>  Documentation/conf.py                            |  3 +++
>  Documentation/process/adding-syscalls.rst        | 16 ++++++++--------
>  Documentation/sphinx-static/custom.css           |  8 +++++++-
>  .../it_IT/process/adding-syscalls.rst            | 16 ++++++++--------
>  .../sp_SP/process/adding-syscalls.rst            | 16 ++++++++--------
>  5 files changed, 34 insertions(+), 25 deletions(-)

I have applied this set, thanks.

Even nicer, of course, would be to have automarkup recognize man-page
references and add the links automatically so we wouldn't need the
:manpage: noise.  Something for another day, I guess...

Thanks,

jon
