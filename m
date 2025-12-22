Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 042923321A3
	for <linux-doc@vger.kernel.org>; Mon, 22 Dec 2025 22:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766441952; cv=none; b=GlIy5Q/ghEoWoj5YyvivYognflqdQGX6e5PSNYqJrQPvDuxiALk+5K0lr20LD8z1fb5kdpJEAwyCI0W3R3TkCD7BusVKqnELgQPsXYqjwGKKo4vclXMlryFQ1R9vQCXtUGAQuc0/vR5RbBFVkI+RrebNBv2EvmKn3GzuIqvp9+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766441952; c=relaxed/simple;
	bh=wD5oZZSfKyWp/yJFlDDXVw4B1A0Xt6RHagQ6lQ3S2Us=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=WWgZjmDCKIZ+TCAiF2WfM3Z4QNoecSrX86qzZ3fDz5DoxW4mtqqfx6FDtoZpLpBkACEoeRhdLXNdliLcOJCbduXuyiJhZhddE/PXL+jkrsm1dj8AzyN+sHt8cOiQZrs1E3V+kCr6SkhjUIFLHEq+P+RI+FNGjhXxEsC5HHEaF8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=k1DnLfl7; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="k1DnLfl7"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net AB0034040B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1766441947; bh=dkJ90dCp+iCWCr2Xa8y/y7wtoODxOLApbWDBHgS1wro=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=k1DnLfl7AYYPFm324wb4QrwQ1+I2N8+HnYhok6z13H78xNebw7pTd+HP8pDrGo3bJ
	 3D7MhAR1x78WlyG59ftZiVYsKvQd4tlVVSastX+05cH1vqcJwwk1rfYxB9NkEnWUyQ
	 FJfnG4SiLWJ5LF1GX9pWZdK4Lnl+C7h1e99PHyaQbza+xUl9gNjbLhIeTdasd17Lao
	 DxcGn9rNOEFfuP+heiCbyLbZOmHAoBd2bIjLE1S19XClOY6yXWF8dnQCr9HNpCH6P8
	 jTy1NcNz8fiGB4szD1dZb6I5cffpax+9pzcDcguO2Z17wQJcfk96JpqWMc05tC+wSL
	 80SiwBs4tt67w==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id AB0034040B;
	Mon, 22 Dec 2025 22:19:07 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Addison English <addison.englishw@gmail.com>
Cc: linux-doc@vger.kernel.org, Addison English <addison.englishw@gmail.com>
Subject: Re: [PATCH v2] docs: fix typo in clang-format documentation
In-Reply-To: <20251208065136.9092-1-addison.englishw@gmail.com>
References: <20251208065136.9092-1-addison.englishw@gmail.com>
Date: Mon, 22 Dec 2025 15:19:06 -0700
Message-ID: <87y0muyxb9.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Addison English <addison.englishw@gmail.com> writes:

> The clang-format documentation contains a minor spelling issue where
> "intended" is used instead of "indented" when describing deeply nested
> code. This patch corrects the typo to improve the clarity and consistency.
>
> Signed-off-by: Addison English <addison.englishw@gmail.com>
> ---
>  Documentation/dev-tools/clang-format.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/dev-tools/clang-format.rst b/Documentation/dev-tools/clang-format.rst
> index 1d089a847c1b..6c8a0df5a00c 100644
> --- a/Documentation/dev-tools/clang-format.rst
> +++ b/Documentation/dev-tools/clang-format.rst
> @@ -88,7 +88,7 @@ Reformatting blocks of code
>  
>  By using an integration with your text editor, you can reformat arbitrary
>  blocks (selections) of code with a single keystroke. This is specially
> -useful when moving code around, for complex code that is deeply intended,
> +useful when moving code around, for complex code that is deeply indented,
>  for multi-line macros (and aligning their backslashes), etc.

Applied, thanks.

jon
