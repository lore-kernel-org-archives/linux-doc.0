Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB71E7261D
	for <linux-doc@vger.kernel.org>; Fri, 23 Jan 2026 11:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769168143; cv=none; b=ObJPyAapZaKX29Wy9awk+XCcISLonEfwvFQZcVjTfj92xD06J3UG69nar+Zgdp1Aqfx7E91FbK9cislGAP4DOA1yFP10peVARoQbmiQBjTa2kX32PBrq5Xj+QpeTAFYTGLsjStLbPdo7NpbycvcCzBH1ynqZp7r3JZARKeBt0Gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769168143; c=relaxed/simple;
	bh=5Xy66rF/JqaHQZQpJhb4zpyE05Dm+U483j+Vq1kFAZE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SBs4YW2GlyJIih4/CV+YBuD712ExMyYR1EbsHXQiXhWjB0OEyWYitU1XwsTQ26R1eLe8m7tcDpFEoApQCfx9WsS2nt70sqH+NUTHsS6+FYjuMfyYiAah6I4x+V1Ng2LceNn4cggrTwZc5cWYBS7elSqOjOJ0kpiOxjDqJAET2nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pPEYJH2t; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pPEYJH2t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C976C4CEF1;
	Fri, 23 Jan 2026 11:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769168143;
	bh=5Xy66rF/JqaHQZQpJhb4zpyE05Dm+U483j+Vq1kFAZE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=pPEYJH2th2QEs7jPWhZk/jdkhRoPPqv61ToMQf+M4FJiiai1yEF/wkL7tcGw8RYwU
	 S/ivh6PLG+N6SmW1+039nKLobXOI3adMsStqZcW6721cdICYdyx4mMzLaA0Bz59IEK
	 8ZQIGvtqqFar3BWL9jtZvfP2NQ3UpoHDm5Cwm28wxkxvN8GOkk4Y5p5pPjreIoLyga
	 aRzP+5Hfjkh8IkVe/zZAMs1Vcmr8nmbdFCxNBFmhfWIDa8/0Dw8Arwm0z3RxKDozJW
	 tRk5QksGYNHhr9c5bcXhaQ6ysV8t3BN1bSt41XC8qXdOLpLGAViZ3VSnWOdURm6CSU
	 gh+r4PI79WelA==
Date: Fri, 23 Jan 2026 12:35:39 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Mauro
 Carvalho Chehab <mchehab@kernel.org>
Subject: Re: Passing SPHINXOPTS is broken
Message-ID: <20260123123215.32f6c40a@foz.lan>
In-Reply-To: <11148f49962022fde99058c15345add4935bbeff@intel.com>
References: <db84b28d2997a1ce73ca9bc65c33e2d08a90aae8@intel.com>
	<11148f49962022fde99058c15345add4935bbeff@intel.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 23 Jan 2026 13:06:51 +0200
Jani Nikula <jani.nikula@intel.com> wrote:

> On Fri, 23 Jan 2026, Jani Nikula <jani.nikula@intel.com> wrote:
> > I was trying to get the regular sphinx-build output.

Just do:

	$ make V=1 htmldocs

or:
	$ ./tools/docs/sphinx-build-wrapper -v htmldocs

> > The monster sphinx-build-wrapper thing has this obnoxious and complex
> > logic of forcing -q unless you specify verbose in SPHINXOPTS. You'd
> > think those defaults should be specified in the Makefile. But no.

It is like there to mimic what we used to have at Makefile.

> > Anyway, setting SPHINXOPTS in the environment or on the make
> > command-line doesn't work, because Documentation/Makefile overrides it
> > to empty.  
> 
> Oh, it's more sad than just this. There is no way to use SPHINXOPTS to
> get sphinx-build to produce the regular non-quiet output (that the
> wrapper calls verbose).
>
> You have to use KBUILD_VERBOSE to make the damn wrapper not pass -q to
> sphinx-build. 

KBUILD_VERBOSE is the Makefile's env var that handles V=1.

>The wrapper appends the -q overwriting anything the user
> might want to pass on SPHINXOPTS. Which can't be passed anyway because
> the Makefile overwrites it.

It is like there to mimic what we used to have at Makefile: it was
was always passing "-q", except when called with V=1.

Thanks,
Mauro
