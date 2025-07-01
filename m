Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2901B245029
	for <linux-doc@vger.kernel.org>; Tue,  1 Jul 2025 19:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751397521; cv=none; b=HscO8MV6HbuMuZ9va70T1sB90Bvi4GRdYEAhaagnqFzVV8HDmQnlhW+/d1QEdcF1dKwojALGK9BCPRGRoj+2xV9VOUa2kh1uG8QoOfHbe7QkHZGlQz6X7g5b2j3iBYNFX66JZoISEKlZC4Eyak4Y7MipNUdjpB8xHaiuUqd4RtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751397521; c=relaxed/simple;
	bh=fo/DjEOk+H1j9ZAoUQAYZUTu3Bv69XLGXcXQVHLDRX0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Iny/3LkoFTS/UzDCTWUdYArtxOZ79dtOKcm0vjmSjwypJeO5lJJStZpaQvYpmsOipBRg8eX4zKLoUqzmldPDdjS9PjsasfVDc2sZwx0u5EqJFXSK9N/FJyDJ1UIABAbGNdvPAa/fK4g2afiUnjnX+M4ZcTxAymOXWNXVraJG4oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=bDd1GWYZ; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="bDd1GWYZ"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 1C8FA406FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1751397519; bh=4Ef6zU4KgVEGzJDHK0eVM4/RUzb4EgsZhugMUG9cYns=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=bDd1GWYZ2jHLl385wvLogG5XEUhq9YKlNFa9pSFLS13JCDA2xSuY+wQTNCeoWgO2b
	 IwB1EQyITthVUTuBqlm4PCnlTW7WJjlxOhNgaXemb3r0CvFre5xLB2nCqU7pekNOvF
	 s7WubrA8vZEpamgFXVw07GHIXSJxaeCgvNmxW7rdnZvD3EKLVSod1O56Op2f00pJAo
	 /s0Wa+luCAKMDEBjNHjj9Xmeezds3do8liJa/5FY/wyCvxauqF/IQd73WvL61nK18t
	 i+3Sr40mMzclMcHmFwgfbvlyGB6wLO80UrpvhuTcFC6Qwxlv+oxN98HFp9oFZvdz1l
	 sC/QxatZNiZ7A==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 1C8FA406FC;
	Tue,  1 Jul 2025 19:18:39 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: alison.schofield@intel.com, linux-doc@vger.kernel.org
Cc: Alison Schofield <alison.schofield@intel.com>, Dan Williams
 <dan.j.williams@intel.com>
Subject: Re: [PATCH] docs: ABI: make the KernelVersion field optional
In-Reply-To: <20250626024101.792073-1-alison.schofield@intel.com>
References: <20250626024101.792073-1-alison.schofield@intel.com>
Date: Tue, 01 Jul 2025 13:18:38 -0600
Message-ID: <87tt3vra7l.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

alison.schofield@intel.com writes:

> From: Alison Schofield <alison.schofield@intel.com>
>
> The KernelVersion field has limited practical value. Git history
> provides more accurate tracking of when features were introduced
> and target kernel versions often change during development and
> merge.
>
> Label it optional.
>
> Signed-off-by: Alison Schofield <alison.schofield@intel.com>
> ---
>
> Plan B is to remove the field entirely. 
>
>
>  Documentation/ABI/README | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/ABI/README b/Documentation/ABI/README
> index ef0e6d11e919..315fffe1f831 100644
> --- a/Documentation/ABI/README
> +++ b/Documentation/ABI/README
> @@ -46,7 +46,9 @@ Every file in these directories will contain the following information:
>  
>  What:		Short description of the interface
>  Date:		Date created
> -KernelVersion:	Kernel version this feature first showed up in.
> +KernelVersion:	(Optional) Kernel version this feature first showed up in.
> +		Note: git history often provides more accurate version
> +		info, so this field may be omitted.
>  Contact:	Primary contact for this interface (may be a mailing list)

Applied, thanks.

jon
