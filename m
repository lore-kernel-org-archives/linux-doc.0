Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54042DFA32;
	Tue,  6 Jan 2026 22:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767738222; cv=none; b=tAXelMmSf0m0tTDj7F7U3gG94Tec9oAouwckXfQlWBaloIsS4XtnAMfmxJia03aNL+uknaoa/BP15GbpLUJssu6W5d9XPM8l0hT+WM4WBiOrIYaXcDQPZik5kPJBj858fGpx3MxPrJxxvkcbfkc60LQClBXCUNV9Xv7moxPGd2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767738222; c=relaxed/simple;
	bh=kA/CZGazNjF0PyzgSuT0j71AaFqM3SvbSzr03t8BR1I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=PbcwZR2gmDnKMtGpRL4COJPZU1L2J4DgvMimYhZoVvPETUEZJMEyFPBRYnTndQ3x2MIMFlEd+oEaf39OT/aWY4oCbgTHTS9Ix7OkGHKwTh+ExzvyJaEtlgcOr/uR03V9wK8tfy9ssZqdyx7qAwU4kLFFg713DACZaEiVZhT0OpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Jd9UJC2i; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Jd9UJC2i"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 1FEBA40C7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1767738220; bh=yv+stMkiWEGechdbMig5qW95kgUZAMc9a/NgYZmJWXo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Jd9UJC2iudgbzDAeTxeyn8AMFUazQugUtnE1qQVxP7Q6YdO/ZhO3JMe2f99mRe1Mf
	 vInI8xwM+p8+Auz+xENBpWVePrOp+elW020vQbK1ik7zWiyXlZbzjXLZdhfksrRcTd
	 wNTwBpH/fNdaAh6Pa/ELPzZM/916M+0fgOjbomqbVR216h3s36ZWEL33S+tWgkzrUW
	 cdPHpPFNqvz+jY5PhfFipsgBg5JU7mjbV9hEQa5ZCOsiJYGAz3i8lY1KEqjw8k4XCn
	 HXJcnFuOo4CGyGbNecQW5vc6/qrKdvGZbQaNYhb/TUgM+UIJcFQXplz4uSkeHuSaf4
	 /KgSQWLfux2mw==
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net [71.229.227.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 1FEBA40C7D;
	Tue,  6 Jan 2026 22:23:40 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Yu Liao <liaoyu.ly@bytedance.com>, bp@alien8.de,
 linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org, x86@kernel.org, wangsiqi.3@bytedance.com,
 liaoyu.ly@bytedance.com
Subject: Re: [PATCH] Documentation/kernel-parameters: Add tsa under
 mitigations=off
In-Reply-To: <20251225121438.38427-1-liaoyu.ly@bytedance.com>
References: <20251225121438.38427-1-liaoyu.ly@bytedance.com>
Date: Tue, 06 Jan 2026 15:23:39 -0700
Message-ID: <87h5sybct0.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Yu Liao <liaoyu.ly@bytedance.com> writes:

> On X86 AMD systems, mitigations=off also disables the Transient
> Scheduler Attacks (TSA) mitigation. Add it to the list.
>
> Signed-off-by: Yu Liao <liaoyu.ly@bytedance.com>
> ---
>  Documentation/admin-guide/kernel-parameters.txt | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index a8d0afde7f85..f4a2bf906bf3 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -3998,6 +3998,7 @@ Kernel parameters
>  					       spectre_v2_user=off [X86]
>  					       srbds=off [X86,INTEL]
>  					       ssbd=force-off [ARM64]
> +					       tsa=off [X86,AMD]
>  					       tsx_async_abort=off [X86]
>  					       vmscape=off [X86]

Applied, thanks.

jon
