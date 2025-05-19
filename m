Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23A9283FD3
	for <linux-doc@vger.kernel.org>; Mon, 19 May 2025 15:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747667078; cv=none; b=eqJsVkNjyZSBb5vpa33dVLA2rxoTHMUsVc0AzaSrsIzRcs4f5FPkmAnRdCTzVBs8qeJPX3yi20lNlYBY88NPahUT9HnrBqjZAnvt4UnzV7RqPz7T1ZVVRcHITR+2LeXNapfwcaQJahvUGXo6PUUhNUy4vUUg9q0AuypyNMERoSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747667078; c=relaxed/simple;
	bh=n+WLNKy7fbKVP9BX+SAxEfLsVNKeSlmy2dv2QYsftcw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=jKdn9SdRb/z2B4HAwh7T15tTiiARPZPoxPwxdkN8YgEkGf51VTotEEDlBV45rVBHaygtMAS0FgxPNwFewbjp2j5QN9nKVSRRvdw0o5lc4PxsAAxCMpGREXSEwQIpF4n28+zn6dWNJWcDRb7ML57uxWIJFpo4GG0woRXmLJEgbhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Zi9euy6a; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Zi9euy6a"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 09A0941EC5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1747667075; bh=FKmusqwuqgqMIL2Osz4FjOAD/dphQn61Bnhu2XVauY4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Zi9euy6ajn3eE6pgE5Grx85mQNLphtN10rip883MrytV9BupFuZJaOwyPJ3T69QUb
	 fs2YZI0cEaAoXONIYEXM6cNIxeSNJnVUB9ZRqFV7QbrBaxEQh7m+C+eK7Vbez9jMj1
	 7/LPgFdDkapNDLK7WDsQV8iijpcEzMxaWGSIhedgHPrGMr8cmj/iKhHPxXi23ATnUl
	 Yg9ZrgPw15mwZ/X/3quivmsLZhRv5rtuvN2UQ36ztReCHvYaOPfMTXq7+Y4NZYdhcN
	 MNdYRKJYkYf7xDUX4JGx3lm4VIhkSn17aTNg8+HfnXcp2sQmqMad9Qpgd9IqMK0CIg
	 KIajxJbXXbKuQ==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 09A0941EC5;
	Mon, 19 May 2025 15:04:34 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Utkarsh Tiwari <utkarsh02t@gmail.com>
Cc: linux-doc@vger.kernel.org, trivial@kernel.org, Utkarsh Tiwari
 <utkarsh02t@gmail.com>
Subject: Re: [PATCH] Documentation: NTB: Fix typo
In-Reply-To: <20250519080248.648971-1-utkarsh02t@gmail.com>
References: <20250519080248.648971-1-utkarsh02t@gmail.com>
Date: Mon, 19 May 2025 09:04:31 -0600
Message-ID: <87plg4iqv4.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Utkarsh Tiwari <utkarsh02t@gmail.com> writes:

> Fix 'peace' to 'piece' in the ntb documentation
>
> Signed-off-by: Utkarsh Tiwari <utkarsh02t@gmail.com>
> ---
>  Documentation/driver-api/ntb.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/driver-api/ntb.rst b/Documentation/driver-api/ntb.rst
> index e991d92b8b1d..a49c41383779 100644
> --- a/Documentation/driver-api/ntb.rst
> +++ b/Documentation/driver-api/ntb.rst
> @@ -35,7 +35,7 @@ anyone who has written a pci driver.
>  NTB Typical client driver implementation
>  ----------------------------------------
>  
> -Primary purpose of NTB is to share some peace of memory between at least two
> +Primary purpose of NTB is to share some piece of memory between at least two
>  systems. So the NTB device features like Scratchpad/Message registers are

Applied, thanks.

jon
