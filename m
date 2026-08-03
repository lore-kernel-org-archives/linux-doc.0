Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2006427FA9;
	Mon,  3 Aug 2026 18:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785780228; cv=none; b=qVYAy2N+TcJVahSsn1yrB2nlRXNlRm1g6EpLFCCbU/0QqSAAIqnFiLWa1aHnDZ5D0Ycs0sqq0elhdNjXfz43JyTAnZE+MUP0WUx0IUorGn0SAqLFNRnEqFrpLCOQfygm9l6iS9KzFteQ1eBd2jiZPPPNZaob84GAPfJ9QsmQ/bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785780228; c=relaxed/simple;
	bh=YN+y4YXjAehkjyzuCD5YoNn9Ya7Ltff6kUFHGK0Y98A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=TbajsDKDh4UXQAlDzfhZXelc6+VicR9rHuOz/rh5TzVe/7cqceGYXm9AYIp7SRxOnSYsxaVFq0L5ngk2ikSYR4cCxFi+8igaGx4ftFNl3c5z1TUOSFZQcRr8EyiB8EpKr1eLG0u/mdkMda257X7jesIPrawchsdombnWrPbJAuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=TbIkY+4r; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="TbIkY+4r"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net B012F408B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1785780225; bh=xwim34XZSDCluE0zjuqd+zJAPh1Y8MvGNGE8Tq9rr5E=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=TbIkY+4rOx07/0XkG+7e4PUGvQazV/aKRfUQTvwZJ+FF05MLnxQCxUqzG7zZQh62B
	 3BNFdLpwOANvITBgxuAd0aeJqo644ON7hMBcRSjekaw/4NCVxIlkAdwTTOvtVK5UFY
	 2ATcQM6LENJ+yOjAIO843r35gkz6d6YGBz2KmlgtewgDRSKF4KGI8irHtCKTMI8bSb
	 B+jOOFDVeXRcxsBsiIs1JcLWhl4k9lmzC45vulZ3lq5f9GMPoQKk5y69909aUbyRjI
	 D76JE4kOA0xWjxf6rZTmCGLl0axS0R6SbNs0bvcz1NnGlwXQ6XDRQKM+++PpDRCflB
	 d1guTi0AGmb2w==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id B012F408B2;
	Mon,  3 Aug 2026 18:03:45 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, Shuah Khan
 <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: docs: add reviewer
In-Reply-To: <20260803172850.47704-1-rdunlap@infradead.org>
References: <20260803172850.47704-1-rdunlap@infradead.org>
Date: Mon, 03 Aug 2026 12:03:44 -0600
Message-ID: <871pcf13pb.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Randy Dunlap <rdunlap@infradead.org> writes:

> Add myself as a reviewer for the documentation subsystem.
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Shuah Khan <skhan@linuxfoundation.org>
> Cc: linux-doc@vger.kernel.org
>
>  MAINTAINERS |    1 +
>  1 file changed, 1 insertion(+)
>
> --- linux-next-20260731.orig/MAINTAINERS
> +++ linux-next-20260731/MAINTAINERS
> @@ -7778,6 +7778,7 @@ F:	include/linux/dmi.h
>  DOCUMENTATION
>  M:	Jonathan Corbet <corbet@lwn.net>
>  R:	Shuah Khan <skhan@linuxfoundation.org>
> +R:	Randy Dunlap <rdunlap@infradead.org>
>  L:	linux-doc@vger.kernel.org

But ... last I checked ... you've only reviewed 2,364,987 documentation
patches, you sure this isn't a bit soon? :)

Applied, thanks.

jon
