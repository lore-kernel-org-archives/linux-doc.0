Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.79.88.28
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795621298;
	b=PjESD/U8MQahjv78DX3t+I6u3AOU+2Xnyyp+1MS1LlExtBbGFXoR+xI1tQ7MQPZPpHl/
	 wip3C078j0oPghrvGn5/tgWE24jr78+qMUUnUTMwGZTXMEQ7Ja7ZEjXn9PASDkd9lYsO+
	 m/p7lVNt/al4x7xSW6bZXpM5ixp3RqIxMWMxxKnk4tXG1lm1P/MSA2DKtPvNVAiPaprJp
	 guZKZtg2Q6PCeWDWOm591qkg3z8PFDQo53LMwrJH27lk50m+YKUAxaDiQd+jH14tNJW+l
	 oU7k6+4hGSeRsqvcOK3AeIZRixtJavZnZXlKsEIDGo30HLNGdO2IjZAFI56P7Uo4FfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795621298;
	h=DMARC-Filter:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=ydPB2vzOxH2QMMXw43qif//oRkcVBYvbVV/EPbQRZaU=;
	b=kejo/4QC9TqamG3Z7AaetO+4T0A7AD0eaC5JaXxAmR1KMG7AqWVWjPvYqqYhP3NZiUhR
	 q1VOEhm9OOLbcRU3j9xbB2wtM1KqBuk3nX4k37g3gI7BEK8+YE1GPiggLR+KrqrZduHz1
	 WIOduptwqgmbXswjnCIT5yWjxiAvFj9lilkJYyvSELdK5jZ/uSBWnJhQoyXssT5n8Ai0S
	 4Ds6eG/FUaxllKybBr8/0t8jXh2iyZdaWOXM439pS+VVARU7+OYwjkx4gCSw0CVPLtyWx
	 LYnyofYb9H8CLLNJ2k9FkCluzra+zl2cfbPGcTuzXBmODeKgTlG0B/8iIhyWUXehMkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lwn.net;
	spf=pass smtp.mailfrom=lwn.net;
	dkim=pass header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=aE9+UZtV;
	arc=none smtp.remote-ip=45.79.88.28
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD84F607DE94;
	Wed, 25 Nov 2026 15:41:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD84F607DE94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=aE9+UZtV
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net A4E60410D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1795621297; bh=ydPB2vzOxH2QMMXw43qif//oRkcVBYvbVV/EPbQRZaU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=aE9+UZtVkYHUluiXDMrz27q7tcgaT9BjUEXNC0gDG1yA+g24U7olB7uBhXN3VbYA7
	 4SIq16S+1WZ8jDQpBSuBQ78kjZlfD+f1DlpwgazWGAEb9lOm9Wpf1RAqK4HU+lF3YI
	 B/aguarb5ibV0YBHdTxrJKsJC8O26RZgXXlYcg4lz1S5H6OScIsIdV3ebzE2z/Et3Z
	 K4nZCOsEJQKpGTM94F0STj8dTODeSySdSda6Cghf/cg2lGNyfGJQ+bvjf1W2ncBUQH
	 gZhiwXMN5jwa9DzbGOOW0K8yj0svxXOAz2G4KQdOW83rjtCMN2VvaSIDeFiQVvcAgm
	 gcXgaPM0OML4Q==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id A4E60410D3;
	Wed, 25 Nov 2026 15:41:33 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Manuel Ebner <manuelebnerli@mailbox.org>, Shuah Khan
 <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>
Cc: Manuel Ebner <manuelebnerli@mailbox.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] docs: doc-guide: add hint to review patch
In-Reply-To: <20261119055403.1294471-2-manuelebnerli@mailbox.org>
References: <20261119055403.1294471-2-manuelebnerli@mailbox.org>
Date: Wed, 25 Nov 2026 08:41:25 -0700
Message-ID: <87tsl4yl3u.fsf@trenco.lwn.net>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Manuel Ebner <manuelebnerli@mailbox.org> writes:

> For the case of a duplicate patch, review the other patch instead of
> sending own patch.
>
> Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
> ---
> I was considering
>>If the other patch hasn't been applied to _mainline_ yet it's good
>>to review it and state that by replying with the 'Reviewed-by:' tag.
> which is better?
>
> [v2]
>  'send review' -> 'review and send reviewed tag' (Jonathan Corbet)
>  'applied ' +'to next'
>
> [v1]
>  https://lore.kernel.org/all/20261116082209.1100175-2-manuelebnerli@mailbox.org/
> ---
>  Documentation/doc-guide/contributing.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/doc-guide/contributing.rst b/Documentation/doc-guide/contributing.rst
> index ee2f896a21..3657408a5e 100644
> --- a/Documentation/doc-guide/contributing.rst
> +++ b/Documentation/doc-guide/contributing.rst
> @@ -129,9 +129,9 @@ looked like this::
>  The entire process only took a few minutes.  Of course, I then found that
>  somebody else had fixed it in a separate tree, highlighting another lesson:
>  always check linux-next to see if a problem has been fixed before you dig
> -into it.  If the other patch isn't applied yet it's good to give it a
> -'Reviewed-by:' tag to help it get applied.  This way your effort is not in
> -vain.
> +into it.  If the other patch hasn't been applied to linux-next yet it's good
> +to review it and state that by replying with the 'Reviewed-by:' tag.  This
> +helps getting the patch applied, so your effort is not in vain after all.

So this is on top of your other patch?  Why not just make a patch that
does it right from the first place?

I'd just put the period after "review it".

jon
