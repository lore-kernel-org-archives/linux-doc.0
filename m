Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDDD2299A90;
	Sat, 14 Feb 2026 17:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771089086; cv=none; b=UNsWUJ+7RjoTwoeTIY/1dZOWzLkA2Aeg5wQUilQcHfuILdXtJJP2l8LZ7411OoDVHFgs7TGIXyhFgwAUpncQ2nLjctTyo58N3ufslMApjJCuCb5cuqeKk+VBZdtEk4JyVwpykTBhXnePgyrzL3mMmL6dekx0O2UTmd6mVACLzpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771089086; c=relaxed/simple;
	bh=P9CtA3qs5I6DikP48zlgjbhx58Q9uwXOYZ/5J+fYfzw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Huoz8zY+lzN+ZypXmIAktuC/CgHxlmCScVDEU+Ra7QSHNJLqWihwyp/ZARJCufCc2sYzHYeDGnlhtBDW5hZcgYoGG9J1HKdAyCIJT3avo+oAM12300xKtpmegLoBwFy27AKVphXd4rfUAIV3bjAO77oX1kiDwEKtbdWQb9K1c1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Hm8Mixcj; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Hm8Mixcj"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net DE5CC411EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1771089084; bh=Ptnm4/qd24KSEh7dS4XSRQqhdWsswl+BZMgpZ3Jj8HU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Hm8Mixcj6arjLgilY+URBnWFoJSjnLXmSbtsDO2lzW8HxNioLW8cwSaDJCZIiVYfh
	 2QbRZhrL3V2/cU+Oua/TQX3ODRoHg7LT+Vnw930LG+MsJpjLIGGIF7lk1T9Hnd+pm2
	 CSvLZCU9VRtsJtQx1tj9vtnz39sJWBZTLHxW0LveoCjGq0ExoB/ADAf5RSwebDNmig
	 TOD9jf5JslfILDwqus8i5yjiLvN+/RZzP3CfOciKrMaVwnS6QwcGAMZrry3JL6UzKp
	 sfN8sPgmYfmFdlu3YMW0fHBfw3tw7WQIX4nOno3iVJnJeIkBgoVaDbOFAMhH/LG4MQ
	 A6YCPTQoTeaBw==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id DE5CC411EC;
	Sat, 14 Feb 2026 17:11:23 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Ariful Islam Shoikot <islamarifulshoikat@gmail.com>,
 linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>,
 Ariful Islam Shoikot <islamarifulshoikat@gmail.com>
Subject: Re: [PATCH] docs: clarify wording in programming-language.rst
In-Reply-To: <20260214132842.1161-1-islamarifulshoikat@gmail.com>
References: <20260214132842.1161-1-islamarifulshoikat@gmail.com>
Date: Sat, 14 Feb 2026 10:11:23 -0700
Message-ID: <87ms1bqmh0.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Ariful Islam Shoikot <islamarifulshoikat@gmail.com> writes:

> Clarify that the Linux kernel is written in C and improve
> punctuation in the clang sentence.
>
> Signed-off-by: Ariful Islam Shoikot <islamarifulshoikat@gmail.com>
> ---
>  Documentation/process/programming-language.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/process/programming-language.rst b/Documentation/process/programming-language.rst
> index f39d1d3dd9ce..c18e307ccb56 100644
> --- a/Documentation/process/programming-language.rst
> +++ b/Documentation/process/programming-language.rst
> @@ -3,10 +3,10 @@
>  Programming Language
>  ====================
>  
> -The kernel is written in the C programming language [c-language]_.
> -More precisely, the kernel is typically compiled with ``gcc`` [gcc]_
> +The Linux kernel is written in the C programming language [c-language]_.
> +More precisely, it is typically compiled with ``gcc`` [gcc]_
>  under ``-std=gnu11`` [gcc-c-dialect-options]_: the GNU dialect of ISO C11.
> -``clang`` [clang]_ is also supported, see docs on
> +``clang`` [clang]_ is also supported; see documentation on
>  :ref:`Building Linux with Clang/LLVM <kbuild_llvm>`.

So you have tidied up the language, but not addressed the fact that the
information is somewhat outdated.  Clang is a first-class option these
days, and the documentation should probably reflect that.

Oh well, I've applied this as a good start :)

Thanks,

jon
