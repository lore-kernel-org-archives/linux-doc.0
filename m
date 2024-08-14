Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6FDA156CE
	for <linux-doc@vger.kernel.org>; Wed, 14 Aug 2024 08:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723624596; cv=none; b=RY3v3pTGD+zOAanpDM7w0fzkuynEZgbFVTE7yLpehSWeAXc7YyQE4YCfvBXQjptVOVpU+H1DpiwhMamvxs6ISv7xcoHPQviCMqG2YnoD4J6e4jFfyS/e0r6oiQPJ8LqTuQQ1Im7aMwR0oTSt7rbJ6d26ZMdTeCPuwxNqH6HCoME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723624596; c=relaxed/simple;
	bh=hyjZnHQ4Geep7rnRD32Hp+mtpSbinqM0GXywFbLLAIQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=N9FbqAysobXbInd2UEVgWcEdz11tFH4CKtkmMLDheRRv60ro27nhu5zTeQzC7qrXxjVBRdZ430AWMWUNhGMS7HX4CjSKy8/0jUzfsAuMPG6RO/8j6atE5ct+LbazE40sFvKvWwsCv9Uyve4zeH48xXKBxevPIxdsk+RZ4kAuxjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=Xnqx0Dv+; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="Xnqx0Dv+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=4CbV4+bLZpGKvso5LvU4EZGuIbkcuerkS9rqheuhtvI=; t=1723624594;
	x=1724056594; b=Xnqx0Dv+1XHWbGd+fZUqcg6A6TbSfqMpYNEv+ALs2FD4Y53aVYeu7NFFcwNoT
	yBH6P3uaTPaVRKDts8hDHXvFMXtQaROdvDnxToSIVT6K9l6ZiqFnZ0se66kC6LYjXT8x+UnPNaq4Q
	BEG7CfgTGOOyl4aJ+mMkhJRHZt8s4VtyHUhIZxMF/arn0p6wsgXcLOgHifMDYIRVzcXr7CN3cABru
	b8P27Qs1n6o2xPSxYgDBNdaHBVP8e/4C3MMurG1QT/BCgv9ssn/Gf6/ddkEErp7QzFNV5h6Z3jvOI
	bz0mxUMW01ppiiZ0yRv3zv4Hxpf0LP7/nt6J5zcYLNJoNezCjg==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1se9Ub-0005Q6-01; Wed, 14 Aug 2024 10:36:29 +0200
Message-ID: <282f7889-9ca7-46e1-aa7d-04463ee741a6@leemhuis.info>
Date: Wed, 14 Aug 2024 10:36:28 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] LFX Task: Fix grammar and spelling errors in
 reporting-issues.rst files
To: Jonathan Corbet <corbet@lwn.net>, surajsonawane0215@gmail.com,
 linux-doc@vger.kernel.org
References: <20240813012457.388-1-surajsonawane0215@gmail.com>
 <8734n88h1l.fsf@trenco.lwn.net>
From: Thorsten Leemhuis <linux@leemhuis.info>
Content-Language: en-US, de-DE
Autocrypt: addr=linux@leemhuis.info; keydata=
 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 n7RI
In-Reply-To: <8734n88h1l.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1723624594;37aff650;
X-HE-SMSGID: 1se9Ub-0005Q6-01

On 13.08.24 19:32, Jonathan Corbet wrote:
> Thank you for working to improve our documentation!  I have a few
> comments on this patch, though.

Yeah, many thx for this! Two quick additional comments from my side:

> [...] 
>> diff --git a/Documentation/admin-guide/reporting-issues.rst b/Documentation/admin-guide/reporting-issues.rst
>> index 2fd5a0302..e68c1f8f1 100644
>> --- a/Documentation/admin-guide/reporting-issues.rst
>> +++ b/Documentation/admin-guide/reporting-issues.rst
>> @@ -56,7 +56,7 @@ developers. It might be all that's needed for people already familiar with
> [...]
>> @@ -353,7 +353,7 @@ come up with other words to use as search terms. Also make sure not to use too
>>  many search terms at once. Remember to search with and without information like
>>  the name of the kernel driver or the name of the affected hardware component.
>>  But its exact brand name (say 'ASUS Red Devil Radeon RX 5700 XT Gaming OC')
>> -often is not much helpful, as it is too specific. Instead try search terms like
>> +often is not much helpful, as it is too specific. Instead, try searching terms like
> I am not convinced this change improves things; the document is
> suggesting the sort of search terms that might be useful.

I'm not a native speaker, but I think Jonathan is right here.

Furthermore: I'm not sure how strict we handle the 80 character limit in
the docs these days, but this document follows it, except in a few
carefully chosen places where that would be odd or confusing. This
change breaks with that approach. Given that this individual change
likely will be dropped this is not much of a problem, but...

>>  the model line (Radeon 5700 or Radeon 5000) and the code name of the main chip
>>  ('Navi' or 'Navi10') with and without its manufacturer ('AMD').
>>  
>> @@ -472,7 +472,7 @@ before proceeding.
>>  Note, you might not be aware that your system is using one of these solutions:
>>  they often get set up silently when you install Nvidia's proprietary graphics
>>  driver, VirtualBox, or other software that requires a some support from a
>> -module not part of the Linux kernel. That why your might need to uninstall the
>> +module not part of the Linux kernel. That's why you might be need to uninstall the

...the same problem happens here.

Ciao, Thorsten
