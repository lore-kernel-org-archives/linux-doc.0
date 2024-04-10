Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6346181322
	for <linux-doc@vger.kernel.org>; Wed, 10 Apr 2024 21:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712782906; cv=none; b=tJFGRSNb8E6e9TXh7Ks7xAjaueBqwduKakew5xt3uwfkLuSBBLbloFVMckDr01bn0mVajT6cfBoroOhzX/ITh1W/5sMAl7UJyfHvkjrCAIUPzxDWsRbuxlqPzKeB4aUoqGdf/EVEtm13wUYgXQxlgaUi4WYn8el0YVWXlfk5lag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712782906; c=relaxed/simple;
	bh=ki1myCbJ+SIp9GQ2PceX+BUBbr6vmy5/4xsnQqG7Rmg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=a03xKbnVo+CdCw51l6VuZu9my3iOh3p/WiXqjZKM10GYPoNJ8WAQCO69NGBurVv7wJ6TC1m8N4cofZ+pTCO4F3DsN7NJeL2b5ufNFXT8X02pD3Dgi4+V2D+foxSNKNEje8k/uY+3vU2bcbMPMxQM+wk7PFlzJVPByv+uX3BJjvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=M5RBCr7D; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="M5RBCr7D"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net C373147C26
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1712782358; bh=K0UE5LpZEj22Vla+9d2h1SDJRAq5kGVNwQTHhTz174Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=M5RBCr7DfHx2xLgPpxWwjy/ALdtWGd3WAUH1XjMW4LVBEnHX2/zZ9q6i2PJ4W7G1m
	 e1KY9ZUV8SugdQ9DCYDxEZj1ArA+OMsbevePhlicvZ75SOd4prD64fAlgEbUvI/3bs
	 XH3Dt5JX/79d0/mc7+7KjBze+0VVIMWAhR3hB9G/3evivEwvI3wSMOraPNdIz9VH2A
	 JbJI26zFvGI91xN5MqY7SaOzEARr3j9coDapmwxXYDX6Le1tfq/vmy4MqLn1R4Rkyt
	 l9GtKC2DZ+a+78Vj9oRTheaiuyBIKNtAwY9MnPsPIvKJvJM11VoprylqF98cSjK4e3
	 HqEi0WTCd9WEQ==
Received: from localhost (unknown [IPv6:2601:280:5e00:625:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id C373147C26;
	Wed, 10 Apr 2024 20:52:38 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: linux-doc@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>,
 =?utf-8?B?0JjQstCw0L0g0JjQstCw0L3QvtCy0LjRhw==?= <relect@bk.ru>, Randy
 Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v2] docs: Detect variable fonts and suggest denylisting
 them
In-Reply-To: <20240406020416.25096-1-akiyks@gmail.com>
References: <20240323120204.155678-1-akiyks@gmail.com>
 <20240406020416.25096-1-akiyks@gmail.com>
Date: Wed, 10 Apr 2024 14:52:37 -0600
Message-ID: <87le5lszxm.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Akira Yokosawa <akiyks@gmail.com> writes:

> Fedora and openSUSE has started deploying "variable font" [1] format
> Noto CJK fonts [2, 3].  "CJK" here stands for "Chinese, Japanese,
> and Korean".
>
> Unfortunately, XeTeX/XeLaTeX doesn't understand those fonts for
> historical reasons and builds of translations.pdf end up in errors
> if such fonts are present on the build host.
>
> To help developers work around the issue, add a script to check the
> presence of "variable font" Noto CJK fonts and to emit suggestions.
> The script is invoked in the error path of "make pdfdocs" so that the
> suggestions are made only when a PDF build actually fails.
>
> The first suggestion is to denylist those "variable font" files by
> activating a per-user and command-local fontconfig setting.
>
> For further info and backgrounds, please refer to the header comment
> of scripts/check-variable-font.sh newly added in this commit.
>
> Link: [1] https://en.wikipedia.org/wiki/Variable_font
> Link: [2] https://fedoraproject.org/wiki/Changes/Noto_CJK_Variable_Fonts
> Link: [3] https://build.opensuse.org/request/show/1157217
> Reported-by: Jonathan Corbet <corbet@lwn.net>
> Link: https://lore.kernel.org/r/8734tqsrt7.fsf@meer.lwn.net/
> Reported-by: "=D0=98=D0=B2=D0=B0=D0=BD =D0=98=D0=B2=D0=B0=D0=BD=D0=BE=D0=
=B2=D0=B8=D1=87" <relect@bk.ru>
> Link: https://lore.kernel.org/linux-doc/1708585803.600323099@f111.i.mail.=
ru/
> Cc: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
> Changes in v2:
>
> - Stop suggesting removal of variable-font packages. (Jon)
> - Rewrite changelog and add a couple of links for reference. (Randy)
> - Suggest denylisting "variable font" files for XeLaTeX in "make pdfdocs"
>   as a less invasive option.
> - Simplify message from check-variable-font.sh and expand the header
>   comments of the script.
> - Add template of fonts.conf for denylisting in the header comments.
> - Add rules for activating the XeLaTeX only fonts.conf in
>   Documentation/Makefile.

Thanks for working on this.

I've verified that the message comes up at the right time (though before
waiting a half-hour for things to fail would be better :) and that
following the advice in the script makes the build work.  I *did* have
to do a "make cleandocs" after adding the fonts.conf file, though,
before the build would succeed.

So I've applied this, for now at least, but I do wonder: might it be
better to stash this fonts.conf file in-tree somewhere and just pull it
in automatically?  Would that create problems for anybody if we were to
do so?  That might be a bit nicer than failing and making people set up
the workaround on their own.

Meanwhile, it occurred to me that it would be good to let the Fedora
folks know that this breaks, so I've filed a bug there; we'll see if
they have any thoughts on the matter as well.

Thanks,

jon
