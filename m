Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362AC233134;
	Fri, 15 May 2026 13:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778853173; cv=none; b=iXNI7CBWtnAK0+Bl9hFKmkRjbwPEr55jKf1fWvbRu+XR3XoYp0Asp54oOW3tbXngUkJhuzAaYvJQsuKe00J1Ul57kaom4vJWH3UInYJti2UMvCwH+MFi5Uqqx45wDGWeslipPr9YMECzPndase4oJv5Ewhx33sDhR1/QdOnTGk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778853173; c=relaxed/simple;
	bh=PvCcuupWZTAEVVfTjqkD7s6OLt3vYU/D8K0tV2C38oY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=a9C1+cJR2dSPEACP5gPuGLBeg9puOUGZ/JPXbOmrphepiXNjACh12lW1mOhLzT6EMkyooVw3kh1dOAnWYmj1JCEGGRftSo1ktgVyUogsmj0xNTg9e1KV1o/b4pHT5DeFOhH0ARff/m/ezWOJpTSDZ4xzZqyir15zq+3VLfMSstY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=o1UgBH3l; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="o1UgBH3l"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 9AEC7410BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1778853171; bh=pumQKjzuoXuJIVeU0dee4TPG7tOfwP42PYrT/VbYnjQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=o1UgBH3lUVAGQe25B0nZd62Kl8YgBleNBEgACDlpJzeBIqvQbd7tmlBG8bRWB2gLo
	 YKnx6buaugJdrCk+a8GXNy+Yho7PlpxHaeWpeI2jIFj2P52h2waxMVLW2PEKpd+aVX
	 MV4gHRJJ1qLc23NReeMjwZWEUBcN/qrMkzpxdh3+nBYlKSQXIo+8xI5mesUPtdU1Uw
	 UOykOeo25YayrbIvfYW1+9SAEmEyR4z2SFCZDLGiSAjSJmnUUZainqY2uYFodk48/J
	 EUfjSxAZ9BNUrI9NEZjjMdPSnNKmmYeLccGEQnpozyFHRWPlcJI7SJLePs7xaxWuCs
	 ejXf5dSkgdljA==
Received: from localhost (unknown [IPv6:2601:280:4600:27b:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 9AEC7410BD;
	Fri, 15 May 2026 13:52:51 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Clinton Phillips <clintdotphillips@gmail.com>
Cc: Clinton Phillips <clintdotphillips@gmail.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: sphinx-static: fix typo "wich" -> "which"
In-Reply-To: <20260513195956.25307-1-clintdotphillips@gmail.com>
References: <20260513195956.25307-1-clintdotphillips@gmail.com>
Date: Fri, 15 May 2026 07:52:50 -0600
Message-ID: <87cxywsrt9.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Clinton Phillips <clintdotphillips@gmail.com> writes:

> Trivial typo fix in a CSS comment for the documentation theme.
>
> Signed-off-by: Clinton Phillips <clintdotphillips@gmail.com>
> ---
>  Documentation/sphinx-static/custom.css | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/sphinx-static/custom.css b/Documentation/sphinx-static/custom.css
> index f91393426..5aa0a1ed9 100644
> --- a/Documentation/sphinx-static/custom.css
> +++ b/Documentation/sphinx-static/custom.css
> @@ -30,7 +30,7 @@ img.logo {
>      margin-bottom: 20px;
>  }
>  
> -/* The default is to use -1em, wich makes it override text */
> +/* The default is to use -1em, which makes it override text */
>  li { text-indent: 0em; }

Applied, thanks.

jon
