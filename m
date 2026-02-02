Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7193629ACDB;
	Mon,  2 Feb 2026 17:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770051677; cv=none; b=q71cH5+7tHg56TG4jOBeUXS3V76vCB/v0P3LZeSjcI801myqlziPfPpY+lRDwIRBycAmox7BRv1BondxRm8iz76M45j6cCzSnhUHduYPmh5ZXW7zCbVkAxLMTlCT9CuGared/Y+LFdfcYPBdR/81v5BJB+YcGxycXt6PswovPJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770051677; c=relaxed/simple;
	bh=s1t8/P4R5hupW82nVa2fIbWu0kCF/T1d07BFb39w5Zk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=YiMl37YyvNt+w6Qbt0tG6a5K1k+Efp1L5DIIM3PyJEe1zKOR/XiduOgCIGNrO3hed1kPoWvWY6GvSZ2jCoFHXSONPWJEE9wdPTXBd0OldG2HJL2M7DnOTYmQuJn9BFj2MudbtXjm/SEUmc+7thH+4ZnQ3CcNg/68mqbzIgEfCRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=TJmKmXx2; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="TJmKmXx2"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net A455B40422
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1770051675; bh=PTQzQeutSAi+siwicrVZtGZsmn/Y1FzLb2k8a4aMe4c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=TJmKmXx2OXHfkiRWQ9ImLTocT+M6thwOTU/gePcSp3IaB6R8OLFdZvccEqN8aTAxa
	 fSxBw37Pa/SZOOl5XmUGZScVESbcCM+XvN24qaLRs5ZpNpTY2VF9BO93QYYy1j2ZHV
	 pHukowKJFNZrbse7ou6UajhR4nUJOMe8h5e1fMmrssI8AsqGt+3DS/gMk2RncEalUY
	 xXJMwAFrfYdglP5LZoJpthz04wTkQy78JM/3BO70Ovl993kCz6xRHCS38hlbycSg9K
	 oneP5J6KNa4EJEVeAswCqdLNyr8hGfYZVIICwRlWA7cOqSOaOeAnPp3NlyrvxjUa3S
	 GY1nBVTXk+eIw==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id A455B40422;
	Mon,  2 Feb 2026 17:01:15 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Randy Dunlap
 <rdunlap@infradead.org>, Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH 0/3] Some kernel-doc fixes
In-Reply-To: <cover.1769500383.git.mchehab+huawei@kernel.org>
References: <cover.1769500383.git.mchehab+huawei@kernel.org>
Date: Mon, 02 Feb 2026 10:01:14 -0700
Message-ID: <87bji7rsf9.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> Hi Jon,
>
> This small series contain 3 patches:
> - patch 1 fixes PDF docs build, as reported by Akira;
>   (I'm resending this one as-is from its v2)
> - patch 2 addresses a complain from Jani about not being able
>   of disabling "-q" flag when building docs with V=0;
> - patch 3 addresses an issue indirectly reported by Jani that
>   it the env vars that affects the wrapper aren't documented.
>
> With regards to patch 2, docs build honours V=0 by adding a
> "-q" flag.
>
> When V=1 is set, there are two effects in place:
>
> 1. sphix-build will be called without "-q";
> 2. Sphinx extensions will increase their verbosity levels.
>
> Sometimes, it is desired to just remove "-q" without increasing
> extensions verbosity. That's what patch 2 does.
>
> IMO, at least patch 1 should be merged during Kernel v6.21
> development cycle.
>
> Mauro Carvalho Chehab (3):
>   docs: kdoc: Fix pdfdocs build for tools
>   docs: sphinx-build-wrapper: allow -v override -q
>   tools: sphinx-build-wrapper: improve its help message
>
>  tools/docs/sphinx-build-wrapper  | 42 +++++++++++++++++++++++++++-----
>  tools/lib/python/kdoc/kdoc_re.py | 10 +++++---
>  2 files changed, 43 insertions(+), 9 deletions(-)

I've applied this set, thanks.

jon
