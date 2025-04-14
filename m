Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D47AB13D531
	for <linux-doc@vger.kernel.org>; Mon, 14 Apr 2025 16:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744648042; cv=none; b=NwwinJbl1dNPWBUYnDEZjMIWt7bBG9RjCtGZ1OYfm8HqB3+5HrUWkZAM0FJr5ZK4fhQKscd0rrIjlazteeRXS86YtXmVGd1LPURe/rFdh+89gbN6OMqAF3j3olKfKHp7FgNPLKsyGQT2DEVyyjqyi0V3WY54FEOVRldFQC9y9Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744648042; c=relaxed/simple;
	bh=gn9BL5+cLf0GxLK13J+IPORHm01ix+CiRp98VF8xXpo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=rAGhXrLMjCl+P6Sw5qyNkRfGiNIEUSYf11Df5ZqILRo31uTNqnNZe1Nrb6GglmtL7xSf+L9xmC9lJj7qXkWKlYHCZNHsmvP3QVqS+72LB26jUuXKLXg3Qo5IowKSKjE3H9Ueexcce/eWw9QHR8GD+kd/zi4t0NYdtTEERojYlmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=ao9qKy9K; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="ao9qKy9K"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net E494E41062
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1744648040; bh=S8VQftal0JDr0OZ/UF0hM+IYA3kVZXEv+/6XWF0wVkA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ao9qKy9KrChAgUHQ2m2s4UEH5RKbznILtonE/46BA6JjupZ34nZJFZj2S6mVJDtlE
	 N4/9FzT8lm29Y74ONffGmvnE+HGZg/CFxTUaKR1c9Emnf6oe/qLN+wlqN7QfB+4UMG
	 OzgRBxJuAC5rDvdbfQWu6M1F/fKRaZauEyuo9h7uAqlA7AamQnSIie+ouRwWcpfB/X
	 nmeUzWZ+ziqOEy2DU7DC8VLPzW6PwrYeQ3evwJ+Q5WIGW4pLQUdKxorrt6V6JPI8Oq
	 Q5Zl1jm8m3ez6VFXMxoucDL918ISObpiCeUtekOixIUjkh4zBemZGIw3tw/2NMCBiZ
	 72MNVo8dusuyQ==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id E494E41062;
	Mon, 14 Apr 2025 16:27:19 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Jelle van der Waa <jvanderwaa@redhat.com>
Cc: linux-doc@vger.kernel.org, James Addison <jay@jp-hosting.net>, Thorsten
 Leemhuis <linux@leemhuis.info>
Subject: Re: [PATCH v3 1/1] docs: Disambiguate a pair of rST labels
In-Reply-To: <20250407195120.331103-2-jvanderwaa@redhat.com>
References: <20250407195120.331103-1-jvanderwaa@redhat.com>
 <20250407195120.331103-2-jvanderwaa@redhat.com>
Date: Mon, 14 Apr 2025 10:27:19 -0600
Message-ID: <87semaaeu0.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Jelle van der Waa writes:

> From: James Addison <jay@jp-hosting.net>
>
> According to the reStructuredText documentation, internal hyperlink
> targets[1] are intended to resolve within the current document.
>
> Sphinx has a bug that causes internal hyperlinks declared with
> duplicate names to resolve nondeterministically, producing incorrect
> documentation. Sphinx does not yet emit a warning when these
> duplicate target names are declared.
>
> To improve the reproducibility and correctness of the HTML
> documentation, disambiguate two labels both previously titled
> "submit_improvements".
>
> [1] - https://docutils.sourceforge.io/docs/ref/rst/restructuredtext.html#hyperlink-targets
>
> Link: https://github.com/sphinx-doc/sphinx/issues/13383
> Signed-off-by: James Addison <jay@jp-hosting.net>
> ---
>  Documentation/admin-guide/quickly-build-trimmed-linux.rst     | 4 ++--
>  .../admin-guide/verify-bugs-and-bisect-regressions.rst        | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

The patch makes sense, and I've applied it, but ...

- When you forward a patch like this, you are really supposed to add
  your own Signed-off-by tag to it.  Given the nature of the patch and
  the explicit acknowledgment from James, I've concluded I can proceed
  without it.

- The headers of this patch have:

	From: Jelle van der Waa

  ...which doesn't help in the generation of a proper reply.  Something
  to look into.

Thanks,

jon
