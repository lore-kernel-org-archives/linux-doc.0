Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B4A19149F;
	Tue, 14 Jan 2025 17:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736874665; cv=none; b=XGCcC0yTUD6ezM39ToheTQXJ4a7+e+nWD+eNUIFOYNQ3jfdnzToiRB4fMaNx5+oIJzxbmEhyP9F3PvPv4Jt367aUvB7C1lriYFof7TNMf65WZnDm02XsOFxhdFnnVryeEP0XARIPL9S3Qi/9mnIF/o4WDgzaaF85GYGJVJIfD70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736874665; c=relaxed/simple;
	bh=xCL+FRTWbva6aPmLkTx4yyXiRBiblv3rozAX4DoTuBo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=IuH+HMAxihY40LoCwhFIxlyT1JW1lPJlD1HPyNyqXYCt0wi9Cdhb9819LhHanzcN5VkN+Zzno69Xb//20TjcVm6ZkORsTA3BcEzYIJMwT2JGOEzxRVFo17MdbAKnnjo6qWhL2xEZipUj5NOd/eNVgSf+nicVzS43y6lTYavw+Sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Ka3CT+kf; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Ka3CT+kf"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net EF7EB404ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1736874662; bh=N6kNBIK0v9jSNQsLLaGLf3fxnd4KQFTComlgw+IZK7U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Ka3CT+kfqXeh406vFwO1gVWbIjBp7SbCDsM0JnDChdFs6fVaM7KYZBnmgfwZbmARU
	 jObEKGA8XLuVqjEUPlgL5153OXVGvnZO3YnQ9HVa+dZS48Wh0ppgD8i5f5ISb+ODle
	 dCEmAMbFQTqKw93N5djjhELi9o+0cVKQcGwzAd60+TMOV8NyWIH+mtSIWwf3se22aG
	 IZ0wqXfNaxD6YDjcg3Gvp7jW1akjzDWp/Tl+oG+/LmHWOIGx7wEijtGN5XqRsz157j
	 XmEx1dcfupGgMJUnXNGpVv10jI6ffiAZMxpha456ic/RZtx74/mQLnuKg08Brk4IhO
	 Yj8LuMEUAjUUw==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id EF7EB404ED;
	Tue, 14 Jan 2025 17:11:01 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Jiayuan Chen <mrpre@163.com>, linux-doc@vger.kernel.org
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
 linux-kernel@vger.kernel.org, Jiayuan Chen <mrpre@163.com>
Subject: Re: [PATCH v1] docs/arch: remove deprecated function name
In-Reply-To: <20250114094832.350073-1-mrpre@163.com>
References: <20250114094832.350073-1-mrpre@163.com>
Date: Tue, 14 Jan 2025 10:11:01 -0700
Message-ID: <8734hl9v8a.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Jiayuan Chen <mrpre@163.com> writes:

> The dumpstack.c file has undergone many modifications, and the
> print_context_stack() function was removed or rewritten a long time ago,
> so it's better to remove the incorrect guidance. Additionally, no new
> functions will be added to the documentation, as it may be modified again
> in the future. Using 'question mark' and 'dumpstack' is sufficient to
> index this document.
>
> Signed-off-by: Jiayuan Chen <mrpre@163.com>
> ---
>  Documentation/arch/x86/kernel-stacks.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/arch/x86/kernel-stacks.rst b/Documentation/arch/x86/kernel-stacks.rst
> index 738671a4070b..2d355e78008e 100644
> --- a/Documentation/arch/x86/kernel-stacks.rst
> +++ b/Documentation/arch/x86/kernel-stacks.rst
> @@ -113,7 +113,7 @@ Printing backtraces on x86
>  
>  The question about the '?' preceding function names in an x86 stacktrace
>  keeps popping up, here's an indepth explanation. It helps if the reader
> -stares at print_context_stack() and the whole machinery in and around
> +stares at 'question mark' and the whole machinery in and around
>  arch/x86/kernel/dumpstack.c.

Maybe - probably - I'm missing something, but I don't see how this is
going to help our readers?  If there *is* a function that will, by
virtue of being stared at, help bring enlightenment, why wouldn't we
name it?

Thanks,

jon
