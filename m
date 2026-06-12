Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B7E3793A9;
	Fri, 12 Jun 2026 19:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781292188; cv=none; b=c5TKj87x3jHY/gPo9W/10R2++//2pUoW+AhSWjF3OuY2lhWqqQsOaX/MnXEMxfhCimrymum9jX/sR5upgmqne37GqggpjECFMd5iSn38kTKwg0o1ZjAouRIYx72hV8nrPg+JxqfTy1636xyKqhF+4Qe1X0VTGPAFkXsaUEBgSvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781292188; c=relaxed/simple;
	bh=52UPQnVMpNlNFu4WAW2OkVwd2IKumYJCbA3UYhKYCco=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=WDCq9+Ec6iyklo+Hi7UaFd2ih2xf0929TVLMV/kiUZcOdL0QNRY5FbqYwmX0AIjyDxPPbESJ+MJBcfm0Pe9CuVESKRttPXVrrQf20E4PFg6smKSbHSq0pBf19ioie74DJG0d3+YUlgJ/+PDYtQWmKiT9snIrFgh6D95wr8mhozg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=iYjyMCjC; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="iYjyMCjC"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 348EC40E4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1781292187; bh=NbffFQIhIxCqMdIvQ5ur1CIIRP+bZGP9Cq3HmRKJd1w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=iYjyMCjCflYxctQ6jKq1iqUMALrunl/Q3MYtqWpguhsqXl18K39Us/F/Y2ffhPlki
	 z8oUQWaaRWXXBxWNAWfT6mEdiPqvuqiKevTAW7qCclFRy8fF//4Bv0lj7OKy+/HBQg
	 6u7ADRXE/R1TdVz/tDcgmc3ZhrmeN9mCNYMjeMLfNeyvbDBtZLe7Fdwa3BVWtS0T3F
	 CZ1uNoAMLOj5V0VZF4uhY51z7SnPrAblMUupXT9rzGJz1ZFzEdP5DpjlZkVgdE+PTR
	 ZMAwazSLdhMQNx9QsI+ne56pTFSVCrMTZ4jEIY1f7wyA43zHz4AYaF3g2Ri2iRmJ0t
	 2ODScTXprYS7A==
Received: from localhost (unknown [IPv6:2601:280:4600:27b:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 348EC40E4D;
	Fri, 12 Jun 2026 19:23:07 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Brigham Campbell <me@brighamcampbell.com>, Thorsten Leemhuis
 <linux@leemhuis.info>, Shuah Khan <skhan@linuxfoundation.org>, "open
 list:DOCUMENTATION REPORTING ISSUES" <linux-doc@vger.kernel.org>, open
 list <linux-kernel@vger.kernel.org>
Cc: Brigham Campbell <me@brighamcampbell.com>
Subject: Re: [PATCH v2] docs: Fix minor grammatical error
In-Reply-To: <20260609070618.12566-1-me@brighamcampbell.com>
References: <20260609070618.12566-1-me@brighamcampbell.com>
Date: Fri, 12 Jun 2026 13:23:06 -0600
Message-ID: <87a4sz7ecl.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Brigham Campbell <me@brighamcampbell.com> writes:

> Fix minor grammatical error in the administration guide.
>
> Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
> ---
>
> Since v1:
> * Drop pedantic line re-wrapping.
>
> In hindsight, I should have guessed that reflowing the paragraph was
> overzealous. Thanks for the guidance, Randy, Thorsten. I'll remember it
> if I make minor doc fixes in the future.
>
>  Documentation/admin-guide/quickly-build-trimmed-linux.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/admin-guide/quickly-build-trimmed-linux.rst b/Documentation/admin-guide/quickly-build-trimmed-linux.rst
> index cb178e0a6208..3432dc8e1a85 100644
> --- a/Documentation/admin-guide/quickly-build-trimmed-linux.rst
> +++ b/Documentation/admin-guide/quickly-build-trimmed-linux.rst
> @@ -217,7 +217,7 @@ again.
>  
>     There is a catch: 'localmodconfig' is likely to disable kernel features you
>     did not use since you booted your Linux -- like drivers for currently
> -   disconnected peripherals or a virtualization software not haven't used yet.
> +   disconnected peripherals or virtualization software not currently in use.
>     You can reduce or nearly eliminate that risk with tricks the reference

Applied, thanks.

jon
