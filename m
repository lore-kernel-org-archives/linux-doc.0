Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 363F31925BC;
	Mon,  9 Mar 2026 16:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773073292; cv=none; b=tw/3cqhOcwMp9Q7sbGoPeYcovbPv/WVepky3INud/1dVFhcshqbCMVkBNcGtRmXIz/aUaFwU8vakOu7E09Y/wACw52R9B9AjfsOtjspdjm0dsxYm0O7RIwbYrl02ASEiTKCa9wNGrhzm4hpl8AZ2MK1f4n1tMRoOOP6dw5LvzkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773073292; c=relaxed/simple;
	bh=yX9YtCXZYyoX0zikx2wYESPfEP1mBT0kkmP7c1NwVLg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=r+yhIO5pU0FqBEhZhiOnP3+mGaCjcdrAMVe5EkolsC3nb3ICrGYshrM1V3NXzLlHaNEA0p5zsIlngyPe9DaqJeWbP3WfvJ2x/8WSePQZtcEoYPECu9xLOFput0C14nk6E0uZKSYSNZBSGWRNhNCAHjTB5OKWGDtq84bnNo+BfR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=pxnVTSMS; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="pxnVTSMS"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 9931540C9C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1773073290; bh=4hpO5F1M8R0usnPbMC2xSY3wuI70f8Bo9mVAar0LpqI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=pxnVTSMSbb6goghMddQySlJlcQhQ5HAHjR59ZLdD4zrQu3kqguecL0PdwlWUKRRAN
	 8Owru4aon/hqn7XQel3x9B0S9XcLeWwlod07tvfrhqufdf/FV4pDd83GIC5Q5nLb1n
	 XBxg6ch82x6jNNlnwXduqZShZnG58cEWRXKnhAnbMDQ+02JRfh4nBW0cr1rMWSYLJF
	 yOTmH27YJPKSehBRzzvmTmfxARjCCQqKGg+IHsccJaHaBj9DbTZk4nji9iReise4/b
	 5KP/83M12dRz1gg2NTYjNk46Z8v7IL2wljT0k7lfh5BaKUvIQkHGj9jKxE3PO9sL5b
	 o4lNEnnIkIgMA==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 9931540C9C;
	Mon,  9 Mar 2026 16:21:30 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Andrew Davis <afd@ti.com>, Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Davis
 <afd@ti.com>
Subject: Re: [PATCH v2] docs: driver-api: device-io: Split out relaxed
 access mention
In-Reply-To: <20260303183628.80776-1-afd@ti.com>
References: <20260303183628.80776-1-afd@ti.com>
Date: Mon, 09 Mar 2026 10:21:29 -0600
Message-ID: <87a4whvura.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Andrew Davis <afd@ti.com> writes:

> We list all the normal non-relaxed device io functions first, but also
> list just the "read" versions of the relaxed device io functions.
> Instead of adding the "write" versions to that list, fix a statement
> below which should describe the relaxed versions so it is understood
> that both read and write have relaxed versions.
>
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>
> Changes for v2:
>  - None, rebase on v7.0-rc2 and resend
>
>  Documentation/driver-api/device-io.rst | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/Documentation/driver-api/device-io.rst b/Documentation/driver-api/device-io.rst
> index d1aaa961cac4d..5b94973f44762 100644
> --- a/Documentation/driver-api/device-io.rst
> +++ b/Documentation/driver-api/device-io.rst
> @@ -56,7 +56,6 @@ Both read and write accesses are supported; there is no prefetch support
>  at this time.
>  
>  The functions are named readb(), readw(), readl(), readq(),
> -readb_relaxed(), readw_relaxed(), readl_relaxed(), readq_relaxed(),
>  writeb(), writew(), writel() and writeq().
>  
>  Some devices (such as framebuffers) would like to use larger transfers than
> @@ -67,7 +66,7 @@ guaranteed to copy data in order.
>  
>  The read and write functions are defined to be ordered. That is the
>  compiler is not permitted to reorder the I/O sequence. When the ordering
> -can be compiler optimised, you can use __readb() and friends to
> +can be compiler optimised, you can use readb_relaxed() and friends to
>  indicate the relaxed ordering. Use this with care.

...and we really think it's better to not just list the functions that
are available?

Among other things, the list would then automatically link to the
documentation for each function ... assuming, of course, that we ever
got around to documenting them...

Thanks,

jon
