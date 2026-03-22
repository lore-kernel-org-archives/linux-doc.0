Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE2E10785;
	Sun, 22 Mar 2026 21:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774215093; cv=none; b=WuOCiF43sjfVxVB0CyK/PeLaOjPuYw9q/p8LwVVKyl0DOdhe2/YOTC2jJNmDY0ssOelSQ75QDN7gdHGrcIIBqY7VNkEx8K7g7PmI9iQzXIVkw5G10EBcRycadRLlSpGFDq6ekOyoSqLAJ8nkYrTrIAvZFzn9blYPjixhXUnoHno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774215093; c=relaxed/simple;
	bh=BrF74nDAIGd7L30lHbXRMmvjGIRaq6jy0igU0FMQLbA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=BwwKGMNCRFyGT19W/7i/IfoBTLNUaGsRBT+3I/s3JMjorN1q5O+AwPuQTPEdnSbUdW9/ADTKvmf9nKT3AALQi1daHxHF9KY490DgWtpVnesdPEEA/vZalNQ34rxnInxAaozNjoE/tZUflIWa62fCGQQxibhcOKvUSPTLYz1qUgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=pBAQagoC; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="pBAQagoC"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net C7278411EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1774215090; bh=7pEzzLyuu3bmen1FeLjdxYVvGdMIbaeCdfPHrVn+4lM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=pBAQagoC7IUc5fy8sPiRULhWHwZIpNH3rUPSLiIdTGP0T34MhFf6d8orhnZQFMcLI
	 0Zd2zQOLzB9eZSvoW7uhYhjolu/b9X8BX1rTJmvP3r1tn9MLKWh6DAh3Kgj4CKIUd6
	 Z228H/o6/g185+P/RK8LbaZfa9lPtIDVzBBD8uyAMJaEaTSH1wpRh/ARUmBNJYVWGe
	 GFvb9bHtSjHh2cySA7/Px6BZHe1PStb8xx49ybd64O0IvGLifdf4kg7Dee/WwK0I4w
	 ZUGEYyfGvnEEn/YkEhGlxdKoEV1IK+YHH+t6KxvKUV9maIeDYqBRM4XViP5/7ZW9UM
	 92UVYGcGCN8NQ==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id C7278411EA;
	Sun, 22 Mar 2026 21:31:30 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Rito Rhymes <rito@ritovision.com>, linux-doc@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Rito Rhymes <rito@ritovision.com>
Subject: Re: [PATCH v2] docs: use logo.svg as favicon
In-Reply-To: <20260321125532.9568-1-rito@ritovision.com>
References: <20260321111217.2404-1-rito@ritovision.com>
 <20260321125532.9568-1-rito@ritovision.com>
Date: Sun, 22 Mar 2026 15:31:29 -0600
Message-ID: <87se9rblfy.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Rito Rhymes <rito@ritovision.com> writes:

> Use the existing documentation logo as the HTML favicon.
>
> This makes generated documentation pages use a matching browser tab
> icon without introducing a separate favicon asset.
>
> Signed-off-by: Rito Rhymes <rito@ritovision.com>
> ---
> v2: add commit message body and missing Signed-off-by
>
>  Documentation/conf.py | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/conf.py b/Documentation/conf.py
> index 679861503..9b822ab47 100644
> --- a/Documentation/conf.py
> +++ b/Documentation/conf.py
> @@ -455,6 +455,7 @@ if html_theme == "alabaster":
>  # The name of an image file (relative to this directory) to place at the top
>  # of the sidebar.
>  html_logo = "images/logo.svg"
> +html_favicon = "images/logo.svg"
>  

This seems straightforward enough; applied, thanks.

jon
