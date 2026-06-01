Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B3123393C;
	Mon,  1 Jun 2026 18:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780340351; cv=none; b=KV0wGulwBcQnYEBnoia7VHkjjRlGVWEkXb9MBx6Oj8qGAMDfeZTvIrp7BtCwg2dnmD124zn7KhEP3R851DbaFGX2TD7pOh2z7j/cOw8oCq7UBcmsT6wp7WBHh3a0ZkHJs1EUCHkSO+kauaYtBytkhaI9AWBw0PvQGn2yJSBWBEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780340351; c=relaxed/simple;
	bh=6YT6ylBV0ROEtYh2APnCjPmbPUvjUpKduZnsV5fEQTI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=A8NIpto+WgAQbHyqLSdPpoxdPWQbIKmhpBqLF2Eix4lToFroYA9Ibrf9iSofyBl2cXHS8pJNY6n+YDsjx2bvDKlHwF0kg3JANjS0IRl1AhR7bpBlc3TChK/LG2rAj2AnYecZ5M3Ludy0xNc8ygcAvT7OsRVL3DR967KN1CDDWpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=VqTRiNIN; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="VqTRiNIN"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 9E4EF40E49
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1780340349; bh=WrusUivRqQDnpmsgABdVhDkLao/MvWOmxoWlLDmtGtM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=VqTRiNINrHwHAdrzXlL8HVh3qoYdmgl48ZFABshou1+5F6OW3VnT3lTPHtsXidh5j
	 HIUcnAuCWiI0JnaBtVEwChKqHT4ablvMhCMhKZQHzCN0etEUbn51iyAyb/IveRgshX
	 gcpR0AOzDRrc4LmOIkkqVL1Q0n2PdcI0SROn5nd8+yktVg4Gqwwrx6o4kKud14bdPn
	 8BTtbgLyCOJ7LWow/fo45O9DL5cCGdNfpl05f4G7gc48yTkWYWKnuBHdKIvqpkK1qz
	 FtRHzkIVuFTy6Ku8AXDceraxfVk+fLPIO3dXUyEMfOfrxLDrzP1Su+SnTfcdPBq+dK
	 9fggJjOtwcnMw==
Received: from localhost (unknown [IPv6:2601:280:4600:27b:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 9E4EF40E49;
	Mon,  1 Jun 2026 18:59:09 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Costa Shulyupin <costa.shul@redhat.com>, Shuah Khan
 <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Costa Shulyupin <costa.shul@redhat.com>
Subject: Re: [PATCH v1] docs: kernel-parameters: Remove sa1100ir IrDA parameter
In-Reply-To: <20260531135455.4113157-1-costa.shul@redhat.com>
References: <20260531135455.4113157-1-costa.shul@redhat.com>
Date: Mon, 01 Jun 2026 12:59:08 -0600
Message-ID: <87y0gy84ub.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Costa Shulyupin <costa.shul@redhat.com> writes:

> The sa1100ir parameter referenced drivers/net/irda/sa1100_ir.c,
> which was removed along with the entire IrDA stack in commit d64c2a76123f
> ("staging: irda: remove the irda network stack and drivers").
>
> Assisted-by: Claude:claude-opus-4-6
> Signed-off-by: Costa Shulyupin <costa.shul@redhat.com>
> ---
>  Documentation/admin-guide/kernel-parameters.txt | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 4420eb72b378..459ed0d72aeb 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -6735,8 +6735,6 @@ Kernel parameters
>  			restrictions other than those given by hardware at the
>  			cost of significant additional memory use for tables.
>  
> -	sa1100ir	[NET]
> -			See drivers/net/irda/sa1100_ir.c.

Applied, thanks.

jon
