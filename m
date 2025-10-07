Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7398BEC
	for <linux-doc@vger.kernel.org>; Tue,  7 Oct 2025 15:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759849341; cv=none; b=lL1QK2U/+d3/K0yPWvM6cgoCqeJC/opo89jDAerfLMXQ6z2SqGi9uXebgj5z2i0DwJ6+E3QN1/hvRrx4cYSgdW2XL6TwcfXBtGTOuhmfA3cb4V1k0eclESzSF2SvEE4p8XIpBbEIjKDyqQoP5KcLU1gt5xIj7Ugj3vMsa5p+47U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759849341; c=relaxed/simple;
	bh=AFgr7O7umkpFyJvJfulS1OAtv0mLp8MOSFjlhixGkK0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=b7+uGdnkh2AWSwh8yA/VubFtTbmojMBPBdLlTLoCGKhIaZbhlArXaXNta0PsQvIAiwLS6AYemCHeH2YIEC29EpNUGqwOGikq5GmpiFSLtCObdT/LNDdqseNr/QcCzi1tuEHy7InHaOMz2v81yOnCl/b81v2mcjYONfA9EftDLVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=fOVtEaLi; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="fOVtEaLi"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 960F840AAD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1759849333; bh=OA7mrkKm/7Tf2dFfUTczOAa7QnWX0NI3QXU33VpCOc0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=fOVtEaLiD0PvaUU1vyr+r6K9rG3KL1LCtHhi8bhs1vnWteq4LL0VfRHDXhez4zJpM
	 A013GF0chaCN5qeaXwQjuxCrDOl9IxTG8WI0kdqBIBVSod5M84Sp60+D00vXJgl6yl
	 SFet+i3ErYV4i4/C9vE1r3YK0xNYkFmXDZivpdXPZgrnnWqVGov8S6Be12kBkP6Gcl
	 ii7A+Fcpwo8Xjje7YAZ8y+XaEXTaljW8auz6HiPgVMrq9/5a+3IRd1A0rOT60TFfqh
	 WbkZmotLeYJBl7CJ9Ab4zVQZx/jidYQhAm3/L+BNzll3ULoVOnkANoEFENwdZV7AIV
	 XruVNzQBCT/MQ==
Received: from localhost (unknown [151.68.15.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 960F840AAD;
	Tue,  7 Oct 2025 15:02:12 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, Akira Yokosawa
 <akiyks@gmail.com>
Cc: linux-doc@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, Mauro
 Carvalho Chehab <mchehab@kernel.org>
Subject: Re: Error at www.kernel.org/doc/html/next/ since next-20250919
In-Reply-To: <20251007-awesome-guan-of-greatness-e6ec75@lemur>
References: <6e4fab41-e8ab-4a43-b942-3e9271deee0b@gmail.com>
 <20251007-awesome-guan-of-greatness-e6ec75@lemur>
Date: Tue, 07 Oct 2025 09:02:09 -0600
Message-ID: <871pnepxfy.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

CC += Mauro

Konstantin Ryabitsev <konstantin@linuxfoundation.org> writes:

> On Mon, Oct 06, 2025 at 11:47:52AM +0900, Akira Yokosawa wrote:
>> So I'm wondering if your build system is doing something different from what
>> is assumed by said "fix" with regard to the way "sphinx-build" is installed.
>
> Yes, looks like I ran across a bug in sphinx-build-wrapper:
>
>     sphinx-build-wrapper: error: argument -q/--quiet: expected one argument
>
> We're invoking the build like this:
>
>     make SPHINXOPTS="-D version=${TAGVER} -q" htmldocs
>
> I see this in the code:
>
>     parser.add_argument('-q', '--quiet', type=int)
>
> Pretty sure -q doesn't take any int arguments, so this should be:
>
>     parser.add_argument('-q', '--quiet', action='store_true', default=False)
>
> For now, I've removed the -q from our invocation, so the build is currently
> running, but this should be fixed in sphinx-build-wrapper.
>
> It also appears that "-D version=${TAGVER}" is also not sticking any more,
> because the new version is being built as 6.17.0 as opposed to the version
> passed as the -D parameter.
>
> -K
