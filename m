Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D5733CE8D;
	Mon, 22 Dec 2025 22:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766442017; cv=none; b=ZKFPVK8GCbsieOzO8bVDoXPXrSMJxj2vQvE4+m3l9zD1j2e1Lt7lToRWLyXHQ5BEL0HT4+tAu72rMxRweV5hmNMlBQvduQ3se6kIrKz/2ZsvRqvMTV8g1i7EaSFwbQLkUiwHnaJkM46O3u5O1qrkKFJL0JLd2R4M0EfzS1C+zwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766442017; c=relaxed/simple;
	bh=/GzBfeRnmhNe2geyiW6zwO3HIHw1a0FtOKJAwpJTMUg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=L70+onMSPvtay6VbOj62vbIzE1aWJU79MVOlP6Z7VYcgExOVVbEoYYBu59AayrSVlTA6V224HUvEmck5Zt2CvsFYJLrOi4oxvVCVypHblJc08yhf2sLn8gH+WiwOPENx+kHeg3inHYKBP90RLEIcDPgb3INJqcp+iQ+BoRs4skI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Tn6adbyc; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Tn6adbyc"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net CB5694040B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1766442016; bh=3RY1QMMacobDKJORWNk1aPIovOrQVB4hR4b5BeI6Zlo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Tn6adbycveFcH83+7oZkYfsIT9OdyCpYf/XEksGPUazLsXkpU5KoHKuZliv/0shIB
	 M5cpbcF/5Fwpk12DbWjekvhIQ8vMhC1DI7difvSYOKPpPtElQXOLq86R9/FJ5t393j
	 0pZa0ULjhgadEZ47SG2BZEXeCO18ebh4nEvEV1AlEpZSnXUovcXrkxkOG6iJevE5G9
	 3okb6PaBdEnsp1YDr/ASFWUGJ3X+ICC6gvvACSIDPti0CRql++4ZJdJ5UMaCVKfEI/
	 XM/X+sL8e2rr7IDdSS+zP/7BNOL/Rks0OgGzcvyMfhlsV83+pN3MWNSr9BwCJ2OMaY
	 O40oSMkKg3+kw==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id CB5694040B;
	Mon, 22 Dec 2025 22:20:15 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Shubham Sharma <slopixelz@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Shubham Sharma
 <slopixelz@gmail.com>
Subject: Re: [PATCH] Documentation: arm: keystone: update DT binding reference
In-Reply-To: <20251207195632.68681-1-slopixelz@gmail.com>
References: <20251207195632.68681-1-slopixelz@gmail.com>
Date: Mon, 22 Dec 2025 15:20:15 -0700
Message-ID: <87tsxiyx9c.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Shubham Sharma <slopixelz@gmail.com> writes:

> Update the device tree binding reference from .txt to YAML.
> Binding was converted in commit 20b3c9a403ee ("dt-bindings: arm: Convert ti,keystone to DT schema")
> and moved to Documentation/devicetree/bindings/arm/ti/ti,keystone.yaml.
>
> Signed-off-by: Shubham Sharma <slopixelz@gmail.com>
> ---
>  Documentation/arch/arm/keystone/overview.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/arch/arm/keystone/overview.rst b/Documentation/arch/arm/keystone/overview.rst
> index cd90298c493c..bf791b2fc43f 100644
> --- a/Documentation/arch/arm/keystone/overview.rst
> +++ b/Documentation/arch/arm/keystone/overview.rst
> @@ -65,7 +65,7 @@ specified through DTS. Following are the DTS used:
>  
>  The device tree documentation for the keystone machines are located at
>  
> -        Documentation/devicetree/bindings/arm/keystone/keystone.txt
> +        Documentation/devicetree/bindings/arm/ti/ti,keystone.yaml

Applied, thanks.

jon
