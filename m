Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A5D3659F1;
	Wed,  4 Mar 2026 22:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772664613; cv=none; b=fFLhT6OCaId6tGPmax6NFeE+H+PFLaH8OzCyhtG3t/rYfr3fVezqozG4j8e04ZLOryPRfPpraWZ0xdiZBLtYJOQ09E3Fi4WLnh5PCTTpqc3CiBxaL2ZTFodeiLzOqRGjwwZ5WuXLPvXBZd6eNTlqRtPOkFbhn9r0zb3IHUvTY5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772664613; c=relaxed/simple;
	bh=YXpbKo+WC4BPjNSd5KFKyYk8imo6IEU0XKtMOStpWR0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=jQB9Q6J+7MeY2dJtE5EzR9S9crtXDxGEH5WninbEksaqgrKgbozFw35oNYrjaxx5p9XXMpD8nCGgFJftL33VOa8dQ01C6OzEnGd+UDg70lKCduErfNa0+Jh5gfnPVJFmVBm9BgGUNIYGen6VUGphMUSDSP69XzPPO33yWYOxmaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=PqdzqlDZ; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="PqdzqlDZ"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 5104E40B4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1772664611; bh=8om0wLzvtL3ghv7FdAiRQZVFJlorqfLl29lPeIFbKcw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=PqdzqlDZgVCwKsr2Kl22LwWI1aGws/aiXOOk2xrsnpMqzqox3mcYppoFlovE8NlXi
	 iKKyi7yOFAh6FBR+PJ0Ny14PSQ7BwaNARXsTHyYCXKd+bXM6pLOMKGliq52/kNpWv0
	 /KV/Id7pOffZTg4gm5U70/1wbkfOS54eSvVJypsZxzvrijapIopmQMISwXgRUHS12V
	 vd35h3lM+ohFFUVzwK18ziP2/TlrCrKXPIsNCzT8gUffUHDai6i8gk0mcHCrqNXYfY
	 eLFhRnPte5u/6FfuD+CjX66iKsBwkf1r8E6bKbnt+Js5Iyzwtn/egKy9X7eNjdX2hq
	 hVr2zS0iUtYsQ==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 5104E40B4E;
	Wed,  4 Mar 2026 22:50:11 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, Shuah Khan
 <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org, Kees Cook
 <kees@kernel.org>
Subject: Re: [PATCH] MAINTAINERS: fix '*' wildcard formatting
In-Reply-To: <20260304224201.1072044-1-rdunlap@infradead.org>
References: <20260304224201.1072044-1-rdunlap@infradead.org>
Date: Wed, 04 Mar 2026 15:50:10 -0700
Message-ID: <87o6l343bx.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Randy Dunlap <rdunlap@infradead.org> writes:

> It seems that these wildcards confuse some parser (docutils, sphinx,
> or maintainers_include.py), so quote them to avoid this issue.
> Also insert a hyphen ('-') before "all files" in several places
> to make the html output easier to read.
>
> Fixes this htmldocs warning:
>
> linux-next-20260304/MAINTAINERS:40: WARNING: Inline strong start-string without end-string. [docutils]
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Shuah Khan <skhan@linuxfoundation.org>
> Cc: linux-doc@vger.kernel.org
> Cc: Kees Cook <kees@kernel.org>
>
>  MAINTAINERS |   10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

I remain unconvinced that dragging all of MAINTAINERS into the docs
build brings any joy.  Is that something that you actually use?

(That said, as long as we're doing it, it should work properly)

Thanks,

jon
