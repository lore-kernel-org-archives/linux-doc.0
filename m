Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE51C1A267
	for <linux-doc@vger.kernel.org>; Mon,  9 Feb 2026 19:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770666614; cv=none; b=I6FxZcDowOObsbGCdA851Ci0+V3qLnWt23zcuoxQ/VzVnzdFbxT+Z2G2VY2P95xE64RhcsEHDZYOpEyGf8ztsDHdalBRdkOfYN2KPoO1wAcFglxaSWGJhkteNjmB2lC3TYHn47m6uGldGQdhjLoGBuHmCxwa0V4AQ9lO3XAFY44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770666614; c=relaxed/simple;
	bh=/dHcRH1ao0pasUfXN1ZT2uP24555PUMmgPeEP56Sqco=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=gMEg1utwKkzUF8oUBXE7L2bow3awZIZxyqPMi3L5PHqfEbYij2SQ7PHCMF9zGuMhN2CCsaMNLWk3XWnJcbsS6DgIRAyUh9ENlHJQ8FSLqhEAEYRWGsCputigWzczKkouKegmmpCU7xMIgps7I81+bGso8AX/axLUWgBm7OSmrqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=qGh/wpsY; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="qGh/wpsY"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 14D1F40C3E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1770666614; bh=z2Ri/wqNk13+0+5f+7dyoqFpCD+xbenQhAUj1O0NqhU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=qGh/wpsYAuKwAXdWD9G5JFx8IZdfNEsa6uPL27PqjwZSsAQKXIRw0yZMjZ3IcX0Be
	 +Jhe07i0J/N/mHa4AEqFxBRRHRzOI8kDZUX3cG0GCv5z1xAO+oyl1hHtxBus2+ST0F
	 IQuwXdxlqbiRZ/0a2GgTl96Lm803mFqPC1DQKP3gaJcGhcYFLZC4xRIXf0SOBhTeGZ
	 NmxLJxTSylnW9Yg/aaNxRaEs8/j27WWMRzK1IfEXjUfCJWdVF87qIBi0JN2gLLAGoP
	 o2no/cV76Vr/mn8BpbZfL5J2j//XfdLVEVclLVZIrKcidn72W0kTQs+E801eM1GY/+
	 +pxxjnsT/mO9g==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 14D1F40C3E;
	Mon,  9 Feb 2026 19:50:14 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH] docs: kdoc_parser: allow __exit in function prototypes
In-Reply-To: <20260206065440.2412185-1-rdunlap@infradead.org>
References: <20260206065440.2412185-1-rdunlap@infradead.org>
Date: Mon, 09 Feb 2026 12:50:13 -0700
Message-ID: <87ecmt8znu.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Randy Dunlap <rdunlap@infradead.org> writes:

> Handle functions that are marked with __exit to prevent warnings:
>
> Documentation/networking/iucv:35: ../net/iucv/iucv.c:1918: WARNING: Error in declarator or parameters
> Invalid C declaration: Expecting "(" in parameters. [error at 12]
>   void __exit iucv_exit (void)
>   ------------^
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Shuah Khan <skhan@linuxfoundation.org>
>
>  tools/lib/python/kdoc/kdoc_parser.py |    1 +
>  1 file changed, 1 insertion(+)
>
> --- linux-next-20260204.orig/tools/lib/python/kdoc/kdoc_parser.py
> +++ linux-next-20260204/tools/lib/python/kdoc/kdoc_parser.py
> @@ -176,6 +176,7 @@ function_xforms  = [
>      (KernRe(r"^__FORTIFY_INLINE +"), ""),
>      (KernRe(r"__init +"), ""),
>      (KernRe(r"__init_or_module +"), ""),
> +    (KernRe(r"__exit +"), ""),
>      (KernRe(r"__deprecated +"), ""),

Applied, thanks.

jon
