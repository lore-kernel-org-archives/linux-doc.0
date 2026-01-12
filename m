Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC0924A07C
	for <linux-doc@vger.kernel.org>; Mon, 12 Jan 2026 16:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768235733; cv=none; b=QLFaLkFds6rgpdMT7CufKzSWiQGu7ZtBl64JE1zccsGFFrRTrIhOWlgqNLWEO8Ooocus0wHyDG9YwSwbmQoERjIf4kroywvSPRxwecFYgP1Juv7a1j0kXxiXp4DQ9THB1CvttKn87r6MgKufKVKy2Dd0YRSoJCBpdDdcL96Lv/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768235733; c=relaxed/simple;
	bh=12qkblN5d+CktOgDC03FN7fleSYDgpupxB5ZwYoXDx0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=i1lbTkiADLwY3loP+VduumZY71IGmsgdKerk0jmo7wTw97EnxhLDPtWC2wKjJf6cGP6Zv/WmlUpboR3RiWm3+iEyDV4IL2v+cBTMVMbyo12SlWPDRHlHH01RHidDTFzDzxEEvWaw1I6q/lvt+m4Fb6BdUOO1G9irCnflO+y+ZVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=DWjAM93u; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="DWjAM93u"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 9296E40C42
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1768235731; bh=P2aiE2nA5jQN3YZw1hLMLxPPBXg1B+AYjlklENJe+lk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=DWjAM93ubf/79JGif1jW+EuKAI0ypT80gC9eMYJ5R/X3yvIvj9n95tgbnxw0jjwGN
	 O+sjFUI9eeqiv2r8NKf8D0mbDw9DdPs1J/SwAoMImKuWVA4DhPYJzF6r9nC2ZTSagV
	 G/isrqLkGcDimG39403Zi4+dQQtJkEAHFAvint+zaP6JCSnseHKQYKAnaJwcjKIQaS
	 ZS46bV2cRC/So4r2U314oZPKRiHEptyiZrb4xQAEbr3YRyWsDJ1LEScz9Y1nsBqyIw
	 NAin/cPLk+PbonvZfCgjJuQz8eZJlPolSfGgtD4KlheMPvncAF5rsgeR2aCwjj79pQ
	 aBAIpTk4AaCFw==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 9296E40C42;
	Mon, 12 Jan 2026 16:35:31 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Petr Vorel <pvorel@suse.cz>, linux-doc@vger.kernel.org
Cc: Petr Vorel <pvorel@suse.cz>
Subject: Re: [PATCH v2 1/2] Documentation: bug-hunting.rst: Remove wrong
 'file:' syntax
In-Reply-To: <20260111223643.174812-1-pvorel@suse.cz>
References: <20260111223643.174812-1-pvorel@suse.cz>
Date: Mon, 12 Jan 2026 09:35:30 -0700
Message-ID: <87ikd623hp.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Petr Vorel <pvorel@suse.cz> writes:

> Link to another document does not require 'file:', therefore it was
> shown in generated html.
>
> Preformatted text requires just ``...``.
>
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
> Changes v1->v2:
> * Remove backticks (Jonathan Corbet)
>
> Link to v1:
> https://lore.kernel.org/linux-doc/20260109152336.84674-1-pvorel@suse.cz/
>
>  Documentation/admin-guide/bug-hunting.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Both patches applied, thanks.

jon
