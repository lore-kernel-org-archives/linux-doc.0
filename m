Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D4F12C544;
	Wed,  1 Oct 2025 14:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759327937; cv=none; b=tA2kPhfBIamnAE25UeFwXcgrG7fH9hHnfXSG+AKcV3GIDifm2Lqk0TqHWou+6breJj4pkjEwfEBDDtwazl81yT/k0nUQQ+GpAUFJzQB4Gf+WkXxsteGAOZvClZqYSX4omQB7h7D68wnUP8a9j8TFYsr9IUdx60TmDDT0qMu0mpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759327937; c=relaxed/simple;
	bh=uahD/+ZZ+IY99xy1Cv1s7bOHviyIrbnHViZFjrz3aTI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TjFLp44f7b3kyAqllR54c9utSnQziF3ezJ3/FZYwYgwt3Kdw9BjHiB4Paf2UHekeEIGpQICBUniVwqN6SOzm18ItMx7Tgaz32tVxC817iIvt+ti22vWHT5eZglwez5pwOt8uF9+SI9kRE6i+NIBqEi+DEaL2DUzVJROrKMHLpRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G1QpTTpo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G1QpTTpo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1720BC4CEF1;
	Wed,  1 Oct 2025 14:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759327937;
	bh=uahD/+ZZ+IY99xy1Cv1s7bOHviyIrbnHViZFjrz3aTI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G1QpTTpoR+lePkMocujHu2GcOwi1mbUVyI6/V6fhzyM8cmlJpPGaaXJXEpQ454U1b
	 zmEdLn5TK5I/5i2bRU5k1CZ1T81e5IgoGhTEsZyYCDQylMr9Ql7SuAsmyDTxOelpAe
	 xEumMIT+c9kHhUoqeBfJ8TiTRHAWHi7fF3PvluFqLOibPCGLsCV6gYcp+7pZ3T6FSc
	 cPSpCidEPBkbRmqOaclDdN5Go2wKP2y5DTGprv+ruXKaSHOj6HJqp270wuGul60/Nn
	 kFvP1ajyZiek1eZsckMionXA7HGOizexjY/MPa88ME5mS/dvzvrluepJ2Dn+2QZmvM
	 lGbUrsXg4/+og==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1v3xZ0-0000000BJ1T-3yn0;
	Wed, 01 Oct 2025 16:12:14 +0200
Date: Wed, 1 Oct 2025 16:12:14 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
	Linux Doc Mailing List <linux-doc@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] docs: Makefile: use PYTHONPYCACHEPREFIX
Message-ID: <qgbruvoxfxk6ghpx65oe55jsl5ea7bmxkk7lx2tgz6jdx3ddkc@zznhcva66a56>
References: <cover.1759135339.git.mchehab+huawei@kernel.org>
 <65f341d516c329e2b57252176b188ae68f3bb6ca.1759135339.git.mchehab+huawei@kernel.org>
 <87a52avl0i.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87a52avl0i.fsf@trenco.lwn.net>
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

On Wed, Oct 01, 2025 at 06:55:57AM -0600, Jonathan Corbet wrote:
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
> 
> > Previous cleanup patches ended dropping it when sphinx-build-wrapper
> > were added. Also, sphinx-pre-install can also generate caches.
> >
> > So, re-add it for both.
> >
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > ---
> >  Documentation/Makefile | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/Makefile b/Documentation/Makefile
> > index f764604fa1ac..cf26d5332fb5 100644
> > --- a/Documentation/Makefile
> > +++ b/Documentation/Makefile
> > @@ -60,8 +60,10 @@ else # HAVE_SPHINX
> >  
> >  # Common documentation targets
> >  htmldocs mandocs infodocs texinfodocs latexdocs epubdocs xmldocs pdfdocs linkcheckdocs:
> > -	$(Q)@$(srctree)/tools/docs/sphinx-pre-install --version-check
> > -	+$(Q)$(PYTHON3) $(BUILD_WRAPPER) $@ \
> > +	$(Q)PYTHONPYCACHEPREFIX="$(PYTHONPYCACHEPREFIX)" \
> > +		@$(srctree)/tools/docs/sphinx-pre-install --version-check

The problem is the "@" here...

> > +	+$(Q)PYTHONPYCACHEPREFIX="$(PYTHONPYCACHEPREFIX)" \
> > +		$(PYTHON3) $(BUILD_WRAPPER) $@ \
> 
> This causes an immediate build fail for me:
> 
>   /bin/sh: line 1: @./tools/docs/sphinx-pre-install: No such file or directory
>   make[2]: *** [Documentation/Makefile:63: htmldocs] Error 127
>   make[1]: *** [Makefile:1808: htmldocs] Error 2
>   make: *** [Makefile:248: __sub-make] Error 2

Fixed and will resend you a new version. This /3 series, plus a RFC
for kernel-doc are the only one pending.

I'll send the RFC in separate, and send a new version of this one.

> 
> jon

-- 
Thanks,
Mauro
