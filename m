Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3AFC42C4ED;
	Fri, 31 Jul 2026 13:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785502971; cv=none; b=qeFHZR70ak0aX3C65n3cwvvdBpCJSN2lg1fRsdEM5ASiVqWc72dlPlhNwPKEio+3Esbi9W9iHVXHP7y536RlTyp4Z7aAFQYuE+nv6L2J7l7JKGDu+hGvQzxz3+DJ3TlSOgdjbgcC/wpOdLV/dAMz2WRGp//ORyVWOv5OyV2bs1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785502971; c=relaxed/simple;
	bh=YFsu+YDj/jjj+7s/lF6lUwMwGqse0VA/0+JvUaoBMSE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=RWbB03jU1Om2wqwFSTalJpkGJ6ucyegNIaEiFkWAJ7Z4fr8HoMW5Dk2dFggyA0O5xKkcuW25crGCL1ozb63AK7AY2XGtmn+VISdhzoE0FVm2C/M0RI0oyBBhYmQRVqEqyXyqsYJjpXfQ+I6kzHZLiGkVEwDQjsncrzuzyUQ3ZDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=SjNMD+hK; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="SjNMD+hK"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net A831D408BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1785502967; bh=KuTULgOExBpUWiLTpQ5xPv5Aynvk/U7EHCS1gvqGdFw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=SjNMD+hK5gk5PaVgVo4t5Xk0PY1vMvXsN782l/Ju+LSafXMVjMwYndXcGFEbeYWV0
	 +K8pycmLDK7gB9p51j29dwDrEvD0nQDRoI8rt8XGC7/k3zAI5bwotjHEuSrdEA2stX
	 yvVFKrYXhxHrQceDP2fl03xPZ48ayntX0RTZ34iMxz1BbXr2VR1vDSl9z4D9X68EdC
	 uk+rEF8xxE1vFnrfA2/f3dXlWr69XeHC2f4GhdOmLmVj12H6u2vbBhKpztMCG9gDZv
	 koDpPYShlWpu1qTtA1XbU46a3byifsrmxrAH2RlwPKeU+VaFxXR3Y6Y7I/UUgEzB37
	 K2qv6jw76D5OA==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id A831D408BB;
	Fri, 31 Jul 2026 13:02:47 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Weijie Yuan <wy@wyuan.org>, Chen-Yu Yeh <chenyou910331@gmail.com>
Cc: Alex Shi <alexs@kernel.org>, Dongliang Mu <dzm91@hust.edu.cn>, Yanteng
 Si <si.yanteng@linux.dev>, Hu Haowen <2023002089@link.tyut.edu.cn>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: update Traditional Chinese documentation
 maintainers
In-Reply-To: <amxHIcHC0vjcp5bG@wyuan.org>
References: <20260731032101.7244-1-chenyou910331@gmail.com>
 <amxHIcHC0vjcp5bG@wyuan.org>
Date: Fri, 31 Jul 2026 07:02:46 -0600
Message-ID: <87o6fn5n2h.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Weijie Yuan <wy@wyuan.org> writes:

>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 2f9472c1a090..60f77e7fd3f5 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -27460,10 +27460,11 @@ F:	kernel/trace/trace_osnoise.c
>>  F:	kernel/trace/trace_sched_wakeup.c
>>  
>>  TRADITIONAL CHINESE DOCUMENTATION
>> +M:	Chen-Yu Yeh <chenyou910331@gmail.com>
>> +M:	Weijie Yuan <wy@wyuan.org>
>>  M:	Hu Haowen <2023002089@link.tyut.edu.cn>
>
> Agreed: Haowen is always welcomed :-)

Nonetheless, I'm not sure I see the value of listing a maintainer who
has not maintained for years; a move to CREDITS may be in order.

> I remembered Haowen sent a patch here [1] aiming to change his name and
> address to:
>
> Haowen Hu <srcres258@furdevs.cn>
>
> Can we pick it up here?, while it may also needs Haowen's double check..
>
> [1] https://lore.kernel.org/linux-doc/20260220160201.41149-1-srcres258@furdevs.cn/

I resisted that because it was the third time churning all of those
email addresses in all of those files.  If we are going to address them
now, I think the best thing is to simply remove them.

Thanks,

jon
