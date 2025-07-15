Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535882BEC59;
	Tue, 15 Jul 2025 19:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752607773; cv=none; b=O2xl+QGOB5MJEn+s4ZV9mqlUeVRpym9pHd5C/4GfPu3w7ArvYSlVACVgpLKHZpTGNAdkB76Lw6y846LHf8xVm6U6siSq6nVc2LMGPTJEUpEjdkPmnRsNVPlGOjtIlzcxhyNb5YGfhCikUG4HtuHVATTk62bPLgghclKzeP7C0DM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752607773; c=relaxed/simple;
	bh=tD2M3STvO6QMH8CUOiJax6XIEfdOHUIyi5nrrYjhorw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=rgPX3sKk0Fy+6jCgtEivs4yWrIbE+IP8dzHcnV/hp11lReSIInvylaFD3+nXcdzxl0Y8w3NAVXe7yyXEvCEYji16ej9ckseJ5gA7cjCblmsAS+o0gPa56R4JAogS2s3YlCABK5t21z5VkRLwrm87lb4JjoAKx2ozdjGnNBrn1qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=eOl18izD; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="eOl18izD"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 61C934040B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1752607770; bh=9rLpOJ6yYHLhvtBiJSu80vzIO9Kmxclnk+mvKnUWy2o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=eOl18izDfSKpG46K5hoYfTjxdc04U7Ll9a8zYXFlHZ47meu8f54jvT1H7jJI50m3J
	 3+d4czHAq+3YArMPTwX5xcsMY4Be78QXgsDEsuRchik/OngIyXxaz8w4xpUoIsC73F
	 NhejithuWqwJkMY8uX0e/HtAKxZv98RqY5N+qwJ0vw5MB62evJUCSjuFgt4qOGZUU6
	 5jMjuWCbxeKVjNGsRFGPdpbT9YraBa7KEMrrUMzT1xcfvo/h91wpdkbxBbp4iSD29X
	 5oyR4uQQ8NZZ9eD3/PLLM8CRytVUC13gjF/lSP8hsBKctS633oOxrwN6N9X4nwkxaq
	 r53WO5bJP6lBg==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 61C934040B;
	Tue, 15 Jul 2025 19:29:30 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Andrew Donnellan <ajd@linux.ibm.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Nicolas Saenz Julienne
 <nsaenzju@redhat.com>
Subject: Re: [PATCH] Documentation: core-api: entry: Fix typo "systcalls" ->
 "syscalls"
In-Reply-To: <20250715061529.56268-1-ajd@linux.ibm.com>
References: <20250715061529.56268-1-ajd@linux.ibm.com>
Date: Tue, 15 Jul 2025 13:29:29 -0600
Message-ID: <87jz49fe1y.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Andrew Donnellan <ajd@linux.ibm.com> writes:

> Fix a typo: "systcalls" should be "syscalls".
>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Nicolas Saenz Julienne <nsaenzju@redhat.com>
> Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
> ---
>  Documentation/core-api/entry.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/core-api/entry.rst b/Documentation/core-api/entry.rst
> index a15f9b1767a2..e406a325341d 100644
> --- a/Documentation/core-api/entry.rst
> +++ b/Documentation/core-api/entry.rst
> @@ -105,7 +105,7 @@ has to do extra work between the various steps. In such cases it has to
>  ensure that enter_from_user_mode() is called first on entry and
>  exit_to_user_mode() is called last on exit.
>  
> -Do not nest syscalls. Nested systcalls will cause RCU and/or context tracking
> +Do not nest syscalls. Nested syscalls will cause RCU and/or context tracking
>  to print a warning.

Applied, thanks.

jon
