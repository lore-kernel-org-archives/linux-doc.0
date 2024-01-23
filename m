Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4F33DBBB
	for <linux-doc@vger.kernel.org>; Tue, 23 Jan 2024 21:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706046427; cv=none; b=Xye7LPl8CKn/PTbzNKo+KGTwSntOw7wDt/qiAQ0TiAEbeEE5fAW6/+FudgBtTjIit6beHivjZWwz2uYuA7flWex5T7u/VdxfW/cclIg8YUK/oAanYA+9bzr8yrcKsGzP9ltXsGIo/04JXJARgUVUB8R7vFqlrKEnmTyTXFQY9BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706046427; c=relaxed/simple;
	bh=2XD20V5s3Bexc6cj+REmws74xVVQ09gFtHoXlMHTqVU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=B+uu5iBSm0sN32SPvKwgSW2Pz02dKxXTiEYdp7GRyOmrRlpbhPRcK466olV/TypDibZmXb8ZsTXQGD+cAPagpOByvxsWEXLSWsX4drpq+D0D/Inn2gkih0eE4XCMv2JX6gB0XYCmSPkes5D/WHVwIC5GCxKBS4vpir0G4fUGQFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=n7U0yFlu; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="n7U0yFlu"
Received: from localhost (c-98-53-138-11.hsd1.co.comcast.net [98.53.138.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id C687B7A98;
	Tue, 23 Jan 2024 21:47:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net C687B7A98
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1706046425; bh=w+LofhryyfMqii4fffAUs4wgq9FbTCZWmkjoJRrCs/k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=n7U0yFluAqO7w8iWvSEgD6cPSWvdZe7hvRF8pCyRIAs2WoKOVW3ljRGHLlBS1xam1
	 4Mp6fJXsjD8g+/dGljngrdN6G6W9fMghWcQEaemUZG2fOEdQI/6IFFGLVnuu93hUkJ
	 TSQZajUyFQV1tlfJ37TxEz2wxPLIey3W7fpQmkQZfGksXD8jq/9fY3/hPkb21AOEI9
	 zx6fW9/qL0WeAhA8iuyn0TnZhaeQB/3ABLN1YcM7sFGbDf/MGewi9UmTmyiP0CXAsC
	 Hichm0FXraUF6INi+r9Hk6lNYfI/bGkM12eZfbc7YrPgiL1WMJ6SvTqfIlH+KFFnIy
	 J7QCDg2lDkO4Q==
From: Jonathan Corbet <corbet@lwn.net>
To: Vegard Nossum <vegard.nossum@oracle.com>
Cc: linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org, Vegard
 Nossum <vegard.nossum@oracle.com>
Subject: Re: [PATCH] doc: admin-guide/kernel-parameters: remove useless comment
In-Reply-To: <20240111085220.3693059-1-vegard.nossum@oracle.com>
References: <20240111085220.3693059-1-vegard.nossum@oracle.com>
Date: Tue, 23 Jan 2024 14:47:04 -0700
Message-ID: <87frynk9if.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Vegard Nossum <vegard.nossum@oracle.com> writes:

> This comment about DRM drivers has been there since the first git
> commit. It simply doesn't belong in kernel-parameters; remove it.
>
> Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
> ---
>  Documentation/admin-guide/kernel-parameters.rst | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/Documentation/admin-guide/kernel-parameters.rst b/Documentation/admin-guide/kernel-parameters.rst
> index 102937bc8443..4410384596a9 100644
> --- a/Documentation/admin-guide/kernel-parameters.rst
> +++ b/Documentation/admin-guide/kernel-parameters.rst
> @@ -218,8 +218,3 @@ bytes respectively. Such letter suffixes can also be entirely omitted:
>  
>  .. include:: kernel-parameters.txt
>     :literal:
> -
> -Todo
> -----
> -
> -	Add more DRM drivers.
> -- 

Applied, thanks.

jon
