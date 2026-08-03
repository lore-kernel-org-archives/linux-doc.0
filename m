Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60B81A683E;
	Mon,  3 Aug 2026 18:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785780365; cv=none; b=rDzmx301sZUGVZwuOT3Zq6bUU+9fWxi0+4lqtcNzxeIRUghzq54wVF+qYibbC1VmK0S2fFe/pCO80WGh4ASX/yj4u1dUTJH4O5gd6tFCHEGhMa2OHyKiqPS/BwtffpSG6/Set+gec4Ke+e8jKj37lAiZsT7ldQJUuiZTxLm0ZXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785780365; c=relaxed/simple;
	bh=VTXmxqRoTA514OHWJug1Hghqic9D4tlq1Orr37tZT+4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=LWHG8TkXxy3+RKxufSa90Z6nzkaDvjHREU2ylXI/SKSSE1K7BJuWqL/JwrbPDwq2Rv0J3ClK338G10k+ZGvpLXG9oKGbBb1Qryopkn0hj4QZFKLRf+c3zTbuD26rr09ibchHqSSWkx7lGZClXdLXnRzhWtYV1qHrYgQN0nGGIiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=smVpAf41; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="smVpAf41"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net C6789408B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1785780363; bh=3ZbcObBUw8kUcDz1xftJFmSM2DP0T4CURXMaUTY+0x0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=smVpAf41KNfYP6/3EWd2xhX1JoDPPkFYKP9qVO6RvGZFWkZNXGaw81w2HPeqoeoDx
	 q3Txp92I/HhV57ZCr8efxxXiLB1ZZPX1UKXglIeen3ravAOVGuhe6qPg7wpS+yRHxA
	 ibLkcbl+nlDD5mim0FI2DuDQEnU9seXGUXcdDnTxnBkoHyJf37wTJK/ybYHIisJa53
	 U77Jqpov7QuC2yTPHXWn8I/63n5Wa7e33J7igiPGuXhocnd2tgLhPDNwBisBlBRYGD
	 NXk3j0lxaLZ3PwSCMGc+vBiidtEqq34c/gHkVZMJAHjvuLa0K79siOsYXEpJ8hCF9A
	 Kc6DFXj8Rs4Gw==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id C6789408B2;
	Mon,  3 Aug 2026 18:06:02 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Anuj Bolewar via B4 Relay <devnull+bolewara.gmail.com@kernel.org>, Shuah
 Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Anuj Bolewar
 <bolewara@gmail.com>
Subject: Re: [PATCH] docs: kernel-parameters: Remove smsc-ircc2 IrDA parameters
In-Reply-To: <20260802-docs-remove-smsc-ircc2-params-v1-1-91b302e90cce@gmail.com>
References: <20260802-docs-remove-smsc-ircc2-params-v1-1-91b302e90cce@gmail.com>
Date: Mon, 03 Aug 2026 12:06:01 -0600
Message-ID: <87wlu7yt86.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Anuj Bolewar via B4 Relay <devnull+bolewara.gmail.com@kernel.org>
writes:

> From: Anuj Bolewar <bolewara@gmail.com>
>
> The smsc-ircc2 module parameters reference drivers/net/irda/
> smsc-ircc2.c, which was removed along with the entire IrDA stack in
> commit d64c2a76123f ("staging: irda: remove the irda network stack
> and drivers").
>
> Signed-off-by: Anuj Bolewar <bolewara@gmail.com>
> ---
> The IrDA stack and drivers were removed from the kernel in commit
> d64c2a76123f ("staging: irda: remove the irda network stack and
> drivers"). Remove the now-obsolete smsc-ircc2 module parameters from
> the kernel parameter documentation.
> ---
>  Documentation/admin-guide/kernel-parameters.txt | 11 -----------
>  1 file changed, 11 deletions(-)

Applied, thanks.

jon
