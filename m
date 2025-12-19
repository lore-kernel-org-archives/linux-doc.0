Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8601A33ADB4;
	Fri, 19 Dec 2025 21:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766180317; cv=none; b=khokVXSHMJwOXghums4EvwUorAM1gBZSD+FKTQ5AE2l/fhdDCEJHvE9U4eOqGz3LqDmjItW3bAfieELn1GX3Mh3LfVWuHWOGJ1idxTxQ+xjR9RtSmmlQGjvHGVvZGXSCgvfpzddNMT388oShJ7dEGlVx/iHexpspJjUCr+bge1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766180317; c=relaxed/simple;
	bh=Bc+I+fxymkyjoi3nC3oyY3Hrn+uJmDgkF/cBlwdx4ds=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Tw0LnBwoFg8jyXSTctVW5uIhy+bmUp2jTb50f+CrfVYk5huwelPSp/8XUFZJKeNmaiF+dP9hfc/RuCfhgrihDdsYGkOJghiIwqu/eew9NRc5KfA34umOcaFodgx5dEJymOEmIU5ogvfnT92BKLbYLzC3yGXxytgYrO4HbtVvCko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=EF7n9ibv; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="EF7n9ibv"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 42DAE40AE7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1766179874; bh=eShDNxwlSi7BYNb0FE+LhvColTXB4St88MfbW/iSuk8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=EF7n9ibvvGwPZ8WeRi6NVxzXvigS7IM9IkqeVG5Qh3PnqLTepm7sI1zA7OdOVQy4s
	 XxdMg4lHjIzz9u8mD9xGJ/Hqj/adMvaFacZ4GMaN/TIAd8ZNt6FoXS4yaIY4ei/Rr1
	 ZNUjaZXGnsjNVPkbGDtQiQ3HA0eJxqFzGHVGlv4s2v+rhvxE7GgLKVfMjFs9JMTWip
	 TNQaaqGO4ghrT7dyATfHe4O9+Z8rh7sS0Nt5CLTZTJCXGtsOTNTDQCumtWLFxFvee2
	 otNA/ZYpe0OdGRsF6aSWQQ00PEBElJWipUrqXWXF3vZhabRvRugXTT9TMp+b1S39y4
	 uc1lNg/Qu3d8g==
Received: from localhost (unknown [IPv6:2607:fb91:7e8:98b9:6989:490e:a537:bfce])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 42DAE40AE7;
	Fri, 19 Dec 2025 21:31:14 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Thorsten Blum <thorsten.blum@linux.dev>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: kernel-hacking: Remove comma
In-Reply-To: <20251219171827.44015-2-thorsten.blum@linux.dev>
References: <20251219171827.44015-2-thorsten.blum@linux.dev>
Date: Fri, 19 Dec 2025 14:31:12 -0700
Message-ID: <87pl8akvkv.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Thorsten Blum <thorsten.blum@linux.dev> writes:

> The comma is wrong, remove it.
>
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  Documentation/kernel-hacking/hacking.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/kernel-hacking/hacking.rst b/Documentation/kernel-hacking/hacking.rst
> index 0042776a9e17..06fcb7c662d3 100644
> --- a/Documentation/kernel-hacking/hacking.rst
> +++ b/Documentation/kernel-hacking/hacking.rst
> @@ -49,7 +49,7 @@ User Context
>  
>  User context is when you are coming in from a system call or other trap:
>  like userspace, you can be preempted by more important tasks and by
> -interrupts. You can sleep, by calling :c:func:`schedule()`.
> +interrupts. You can sleep by calling :c:func:`schedule()`.

That's a fine change, but can I prevail upon you to get rid of the
usless :c:func: annotation while you're playing with that line?

Thanks,

jon
