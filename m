Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40EDC3624AB
	for <linux-doc@vger.kernel.org>; Mon, 27 Jul 2026 17:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785172379; cv=none; b=b9xb5HwIUezkXqaNi0v9ZYesq2JRRYGJxrZQrg3hBfYKmJ3S26Sj7swy0A8lWKByB3qVuM6l25f3gmCcuTkgsvAw48BHk+i7hUrnA/nvAgQRQl0FCX94iBB9r0gZKOuofKKj55P9MaxZkAuAJ8f0VWE4Xvtap2MI23CEpwUyUkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785172379; c=relaxed/simple;
	bh=GUvg1OvMWeBo17iFOZYqPbjz7WOOgO7fLmvZ5xfMdY8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=XtwCUsfSsvxDhDaZBwo6GoX0zpvMgTf+6iNbqdeLB4ASogxbGdcb6skbjUMf6Nk7zFNLDXKE7dVoLaY5xWTIBQhYu2VeyDsG9sYlFXmNhatA1AHqUVQmhBd+JWxp++QlPtlKcZpiZvO1h/nI+FajPiOCgNDSAuJmwCy756hcr6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=H1z9+Tqo; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="H1z9+Tqo"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 3E96F408B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1785171848; bh=KuVSC8RadY+LK86Bwdw/4JgOl2/sK70FYFnSHTYlTgk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=H1z9+TqoYuss7JjoQTGjCaRVPO0aDz8CHY6bp06sEg39a1jzsgRFiNb8/04tduQeN
	 fDW67ArT0WivAkcnHiJX1/ovInBmNT2LoDOOkJiXQ4jY+pME+GW0NSWsQ/P8We5n6e
	 R5y7dkVo9WbPsDICbaJFDVbQsEaRSKdFrnOyI+7OMVVx4/YHFmyvfjfHUaIFjt1hR+
	 vxCM134thZGB9jEEemPVsUyb+cxfjU8Y/Enl4PGDAUxRHmGcRNqeM6LOzUhZQLgwC3
	 SV+eusI42GzLDGkSMWbODTZxs80qM+c0SX2yowTKb6os53cl9ldWm32kh4OyQhWsIK
	 mWgShsoT4kYVQ==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 3E96F408B2;
	Mon, 27 Jul 2026 17:04:08 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Xavier Claude <contact@xavierclaude.be>, linux-doc@vger.kernel.org
Cc: Xavier Claude <contact@xavierclaude.be>, linux-mm@kvack.org
Subject: Re: [PATCH] docs: add example for psi info
In-Reply-To: <20260726134037.24412-1-contact@xavierclaude.be>
References: <20260726134037.24412-1-contact@xavierclaude.be>
Date: Mon, 27 Jul 2026 11:04:07 -0600
Message-ID: <87tspkicu0.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Xavier Claude <contact@xavierclaude.be> writes:

> Provide an non zero example with explanation of the values.
>
> Signed-off-by: Xavier Claude <contact@xavierclaude.be>
> ---
>  Documentation/accounting/psi.rst | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)

This may be a good change, but you really want the memory-management
developers to look at it...adding linux-mm in the hopes that might make
it happen.

Thanks,

jon

> diff --git a/Documentation/accounting/psi.rst b/Documentation/accounting/psi.rst
> index d455db3e5808..dadab65f872d 100644
> --- a/Documentation/accounting/psi.rst
> +++ b/Documentation/accounting/psi.rst
> @@ -64,6 +64,20 @@ as well as medium and long term trends. The total absolute stall time
>  spikes which wouldn't necessarily make a dent in the time averages,
>  or to average trends over custom time frames.
>  
> +For example, the following output::
> +
> +	some avg10=7.52 avg60=12.59 avg300=24.82 total=2128219913967
> +	full avg10=5.70 avg60=10.56 avg300=22.40 total=2014527537356
> +
> +This means that for the last 10 seconds, 5.7% of the time (so 0.5
> +seconds) was lost on cpu cycles because all the running processes where
> +waiting on the resource. On the same period, some tasks where not
> +schedulable during 7.5% of the time (so 750ms) because they were waiting
> +on the resource. But for a longer period of 300 seconds, we see that
> +more than 20% of the time (so 60 seconds) is wasted due to resource
> +contention. Moreover, since the total time wasted because tasks were
> +waiting on the resource is 2014527.5 seconds.
> +
>  Monitoring for pressure thresholds
>  ==================================
>  
> -- 
> 2.55.0
