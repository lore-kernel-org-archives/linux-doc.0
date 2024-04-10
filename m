Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079B93E485
	for <linux-doc@vger.kernel.org>; Wed, 10 Apr 2024 23:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712792184; cv=none; b=mbmE1n/bx86PALW9cfmLnHPDI8sxWdeAv1wm65miPZiZSWAFOK42mU6RKA0PX1g3GKE5yhCqWI975BvH0TFzkDmPd421DU/6YdqXAwjrGtzl3Nn8BmzHXRY4osk3WArc4a+aRc3IPrBXAKtjiQhLeBNy5oUHLJ+B+mi2EFEvhTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712792184; c=relaxed/simple;
	bh=Sfgys4M0mbwIrdfuWwMajETGhNADtXZMucFfJySAp98=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=tb63o9C10V5q2WRLzL2+IN+dZapOcvU0uX14mqPmS0iDtqUnSoeo2pE6Y87AAT+jWXghXeKCDpzN89lF9lASDDfP92VnK8LqLhb620Ct3ROqVon1ldSZPnwYqguKYvDUv/AVb5MXIUoySZghMP00dAk3JIS/oVYcMaiyBffke28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=iFhs0DdX; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="iFhs0DdX"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 174AE47C26
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1712792182; bh=QZKAIMSrSrLsquQzUA3fkcN3C0F1fIOPeZYoL05jK+A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=iFhs0DdX1fuo+Z5k0BBrJDHePNtW7R63HTOm8JH5WZpZUcQyhZN/BF0IdIs+LKfdK
	 2REaOv0Wp0vbsCm9ZoEIAQiVHIQ8rI9ZrWc3NnODFuvDd5OtonxqlsCEYMKaNuN2+c
	 bYrGI4tz4wqEfHy4wSOYHtbGQAnzISqPLASHmwpXJt9EIalZpRjfX5Q4tyyC0RvBew
	 0t9Slsy1zH85AHvFdvkxi10jBphtoiYLG+2vYwcea5ZfCN9nmbTbtMVFqfc+b4gz9e
	 oO3TPXvs/MDXtyCQmXf066czt78VemIyxmJbHxgoKLWwigQm3reWfeoiTPbu2VzeIQ
	 ezwZikNuxq8Pw==
Received: from localhost (unknown [IPv6:2601:280:5e00:625:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 174AE47C26;
	Wed, 10 Apr 2024 23:36:22 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: linux-doc@vger.kernel.org, =?utf-8?B?0JjQstCw0L0g0JjQstCw0L3QvtCy0Lg=?=
 =?utf-8?B?0Yc=?= <relect@bk.ru>, Randy Dunlap
 <rdunlap@infradead.org>, Akira Yokosawa <akiyks@gmail.com>
Subject: Re: [PATCH v2] docs: Detect variable fonts and suggest denylisting
 them
In-Reply-To: <02ef631f-a53a-4795-95fc-e97723386f80@gmail.com>
References: <20240323120204.155678-1-akiyks@gmail.com>
 <20240406020416.25096-1-akiyks@gmail.com> <87le5lszxm.fsf@meer.lwn.net>
 <02ef631f-a53a-4795-95fc-e97723386f80@gmail.com>
Date: Wed, 10 Apr 2024 17:36:21 -0600
Message-ID: <87v84osscq.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Akira Yokosawa <akiyks@gmail.com> writes:

> On Wed, 10 Apr 2024 14:52:37 -0600, Jonathan Corbet wrote:
> [...]
>> Meanwhile, it occurred to me that it would be good to let the Fedora
>> folks know that this breaks, so I've filed a bug there; we'll see if
>> they have any thoughts on the matter as well.
>
> Actually, I opened:
>
>     https://bugzilla.redhat.com/show_bug.cgi?id=2271559
>     "google-noto-sans-cjk-vf-fonts is not compatible with XeTeX"
>
> the other day as a bug in google-noto-sans-cjk-vf-fonts.

Ah...I filed mine under texlive, no wonder I didn't find yours first :)

> In response, Peng Wu (one of font package maintainers) opened:
>
>     https://bugzilla.redhat.com/show_bug.cgi?id=2272153
>     "xelatex doesn't support font face from named instance of variable fonts"
>
> as a bug in texlive-base.

I'm not sure why I didn't find that one, though...I did look.

> In #2271559, I was asked to help report this issue to upstream XeTeX,
> which is in my to-do list.
>
> It sounds like there should be a way for XeTeX to identify variable fonts
> and ignore them.

It seems like it should certainly be possible.  We may end up carrying
the workaround for a long time, though, before any fix filters through
to users.

Thanks,

jon
