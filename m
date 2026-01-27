Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B407322A7E4;
	Tue, 27 Jan 2026 17:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769535759; cv=none; b=FQqvAS+uVM7zCC0zoBvIvSI+PrOhzEwnY7GekBuVO1D5PmGfJoniNVwhQTyQJi8tv0s9fKzDD9MccRHEFheJcElnK0RixyXvqTkOpVJ6qCcRhpCpftm7TMxdqMkk1Px223zmu6EKp8atrQeKu5P1gPHHUSqj87Cv2JrbnQfWeOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769535759; c=relaxed/simple;
	bh=zc/hv4dCXONl8lO4oWGtWxq+gVpBJejN0xeDztly9PA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=it67fBUIdxJ4HsNjAnWEjNAFLpzQWN9wumSwx2AqcafknIpYJYJV0X9s3pM2C7CLUGSSBrHNNdvybjfkmAEloKzRMwzoUxXvruUOLaZiHLyBco9JoqHiC3EymJHbMSf1HHiHYEGAKTcidj0iPM+O1jKjg/j7mwHOi/RGY5cKf5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=qno1sYk6; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="qno1sYk6"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net ED84840423
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1769535757; bh=M8pc3tMwtRC1rDCkiBE6oyQxTGOp5hD53MyRGXJE5JE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=qno1sYk6nIjynyYymDCUGtatlj0PY1eMckERsnO4zM/XfqvDeiF3ifl9V33Z7HkJS
	 1SDej4rXxUIMSGssQJNqboM9otvkU4hxEs1cv/zs+oIPgYonHCR8jMpNZGVM5Ee1wk
	 GtZgvDbImRAkugRjFYThWJMYjRqUoNtQUH6Y2AOCQENSduCsY9lmmQaDSBTyV6xm2P
	 5P+KemGqupUjLBjQlCR1t5bliXW04HM8ETRC7pVh1CHLKENSk3NNO4Kju8r6cjcxp+
	 MmIUVMbiK3daMjaponFWL+jocChw+Kcn8uMGUF9BrDRfANSNSh/pyPYe2xnPa/UWU0
	 jg23uuUfz/NTg==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id ED84840423;
	Tue, 27 Jan 2026 17:42:36 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Yulong Han <wheatfox17@icloud.com>, mchehab@kernel.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, wheatfox
 <wheatfox17@icloud.com>
Subject: Re: [PATCH] docs: automarkup.py: Skip common English words as C
 identifiers
In-Reply-To: <20260125124450.2005006-1-wheatfox17@icloud.com>
References: <20260125124450.2005006-1-wheatfox17@icloud.com>
Date: Tue, 27 Jan 2026 10:42:36 -0700
Message-ID: <87cy2v9ckz.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Yulong Han <wheatfox17@icloud.com> writes:

> From: wheatfox <wheatfox17@icloud.com>
>
> The automarkup extension incorrectly recognizes common English words
> as C identifiers when they follow struct/union/enum/typedef keywords,
> causing normal text like "... (a simple) struct that" (in `workqueue.rst`)
> to be rendered as code blocks.
>
> This patch adds Skipidentifiers list to filter out these words.
>
> Signed-off-by: Yulong Han <wheatfox17@icloud.com>
> ---
>  Documentation/sphinx/automarkup.py | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/Documentation/sphinx/automarkup.py b/Documentation/sphinx/automarkup.py
> index 1d9dada40a74..c2227ab0a891 100644
> --- a/Documentation/sphinx/automarkup.py
> +++ b/Documentation/sphinx/automarkup.py
> @@ -46,6 +46,12 @@ RE_namespace = re.compile(r'^\s*..\s*c:namespace::\s*(\S+)\s*$')
>  #
>  Skipnames = [ 'for', 'if', 'register', 'sizeof', 'struct', 'unsigned' ]
>  
> +#
> +# Common English words that should not be recognized as C identifiers
> +# when following struct/union/enum/typedef keywords.
> +# Example: "a simple struct that" in workqueue.rst should not be marked as code.
> +#
> +Skipidentifiers = [ 'that', 'which', 'where', 'whose' ]
>  
>  #
>  # Many places in the docs refer to common system calls.  It is
> @@ -163,6 +169,10 @@ def markup_c_ref(docname, app, match):
>      if c_namespace:
>          possible_targets.insert(0, c_namespace + "." + base_target)
>  
> +    # Skip common English words that match identifier pattern but are not C code.
> +    if base_target in Skipidentifiers:
> +        return target_text
> +
>      if base_target not in Skipnames:
>          for target in possible_targets:
>              if not (match.re == RE_function and target in Skipfuncs):

I've applied this as an obvious improvement.  I do suspect, though, that
a better fix would be to have the automarkup code just not do markup for
"struct" references that don't exist.

Thanks,

jon
