Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A663F344D83;
	Mon, 30 Mar 2026 15:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774886031; cv=none; b=EMC9/AN4jDQP+vILjcVpNJqcbnLquLrIn6WTUKr9wNGCvOeRKSUzTvM9f++4BCFeQ83owU1oE1sk42ipS5C/L/cVgmS5E4KDl0J2K5IaDlvehnudW1GEcG8WBRazt4ETAe/MU9zI1UVvBdqnqR+k4RxjKcgmw1bVKLLUTwo1e/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774886031; c=relaxed/simple;
	bh=NdpRDx495rb8EfTdiYv3AnVuWs60vC4+5nPQv24TLX4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=LK7A9str19wBhauAViCsN6uqu2GDk2Mr3u6Ru8/tvcdamRXSd6kRL6dDcj5nS9FdtTwSV7K+8Ssg3oHwxhtNjvP+o/z5G20yIR44r5VQB6myq5z7PC2L/e+5dYsF6WCs4JIXCDQOHPVI2Zb9lEuU1m2ziBwo5bD5Qped+8r+TcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=R15mioJv; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="R15mioJv"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net E3AE8411C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1774886030; bh=R04eVhjxsO+rxLAwYhTb14kUBtpVDVwhzkI0v7VGfig=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=R15mioJvSRhDIb/8EbJj0w+etDAB/Rn9L4dailSu0tFmQ5EU4GAl5wNkqM92cucdK
	 CnMe2VWTSw/F0NNR+BVCE29vddW/mdStNs0xSdWYzQcIdQf5GspxbRwAK4rKqGYUca
	 FfyEXf+lbnVKPh7s4987WMGpzGEdhnRIbUkAKIW+czZBbS2BGtqEnS9Ye/ERrqG+Hj
	 CaJcm3wIhrmQeoH3LXcKbPmh3GD/6FGi5VB/+bnWHxw2MyYc/k/nsLscaRdaRBjdw6
	 vVVrYDYasq9QMzArz2VhVPsNv43WJapHlJZYYw0P5x5YgFsuiEzUABoj1Am+XeuUGo
	 X1XHk/7xvGEyA==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id E3AE8411C2;
	Mon, 30 Mar 2026 15:53:49 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Rito Rhymes <rito@ritovision.com>, skhan@linuxfoundation.org,
 mchehab@kernel.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Rito Rhymes
 <rito@ritovision.com>
Subject: Re: [PATCH] docs: generate a static 404 page
In-Reply-To: <20260329180448.24614-1-rito@ritovision.com>
References: <20260329152047.5736-1-rito@ritovision.com>
 <20260329180448.24614-1-rito@ritovision.com>
Date: Mon, 30 Mar 2026 09:53:48 -0600
Message-ID: <87zf3pnwj7.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Rito Rhymes <rito@ritovision.com> writes:

> Broken links in static deployments currently fall back to a
> generic web server 404 page, which leaves users on an orphaned
> error page with no direct way to continue navigating the
> documentation site. Add a dedicated not-found page so deployments
> can serve a project-specific 404 instead.
>
> It keeps the normal documentation layout around the error state so
> users still have the search box, table of contents, footer links,
> and a clear route back to the documentation root. The penguin
> logo makes it less generic and adds character to what is
> otherwise a frustrating page to encounter.
>
> For translated documentation, generate 404 pages whose return
> link keeps users inside the current translation instead of always
> sending them back to the English root documentation.
>
> Actual 404 handling remains a web server concern.
>
> Signed-off-by: Rito Rhymes <rito@ritovision.com>
> Assisted-by: Codex:GPT-5.4

I don't think that this makes a lot of sense.

Who are your users, what is your use case?  Who do you think will do all
of the setup work to create a server with a custom 404 page, but can't
supply the page itself?

This is the kernel documentation, not a web-site construction kit.

Please slow down and think about solving real problems.  There is So
Much Work that needs to be done with the kernel documentation, but none
of it has to do with this stuff.  And, in any case, the merge window is
approaching, so significant changes will not be accepted at this point
even if they otherwise make sense.

Thanks,

jon
