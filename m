Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3991B808
	for <linux-doc@vger.kernel.org>; Fri, 23 Jan 2026 14:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769177438; cv=none; b=YlYTrirG+xGiCUrLvdLb6o4AMMUO4SZ02IQNy23MIqCYa6x6EBRdrGXda6s1SeB5P50Hu1yGvKAfhA+PZcj9HkrZv9pT1Z1XJtuGB5BZSd9atOH0g9YGAWjztgj0wZst+Bn2Q+dig8WlKh7ir/4A9JUP4dAdbSaoDIukEC2nXng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769177438; c=relaxed/simple;
	bh=O8i/GpL87tp0BgJHaGLMNFRFwfkamARbr+4yeUQG3jY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uQEzVtaXCtQZanntFM9vTNwS3Q/wE3Zxc12QBBTB2A64t1I3rsc/cc2daLA4TaQOoperi9g8qopF9/T3R4kbtJZq9Y3FZmcXD/wmYwGVlq+lCv2+mrCMrFKP5oTeyhcRi+Pc01JramBxiZa+BI9Tx3532wSyeSXkXlC1JV8da/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JcWHD8OZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JcWHD8OZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C42CC4CEF1;
	Fri, 23 Jan 2026 14:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769177438;
	bh=O8i/GpL87tp0BgJHaGLMNFRFwfkamARbr+4yeUQG3jY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=JcWHD8OZLRZXOEqhLQQZd4L9hbzrcvwjyD9frC8rhGeQDPPDzbwIwbHk5CLakqcsY
	 AK8eGNbJs7BeinImY+9LUwG0ZyMPFubALmL00B0yh3jgLohViq2thRUh6gcCR3bf6a
	 tFNg9E5BvN17KxlyiI7PEp/nOpwE4+mx8vYabp7KHgn7OTy5h/WYO9RcLNj8StlMcP
	 CHIXKUzE7aN+QA+fckaOfBjzWEpz9ws1erIdO60vq4B9egTk51rIx8UC2elPYuKuAT
	 IkMHLsm71sf71CuYYLsKwRV8KCSbx42Zz4TXuS3/P2rB7ohXXZxodFqB8wkUAZdLFr
	 00IShEp0Sw++w==
Received: from localhost ([::1])
	by mail.kernel.org with esmtp (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vjHrw-000000064Ak-0Tlv;
	Fri, 23 Jan 2026 15:10:36 +0100
Date: Fri, 23 Jan 2026 15:10:33 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Mauro
 Carvalho Chehab <mchehab@kernel.org>
Subject: Re: Passing SPHINXOPTS is broken
Message-ID: <20260123151033.5acc515f@localhost>
In-Reply-To: <233a2366263111e61700da07f3692a029fc51a50@intel.com>
References: <db84b28d2997a1ce73ca9bc65c33e2d08a90aae8@intel.com>
	<11148f49962022fde99058c15345add4935bbeff@intel.com>
	<20260123123215.32f6c40a@foz.lan>
	<233a2366263111e61700da07f3692a029fc51a50@intel.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 23 Jan 2026 15:47:30 +0200
Jani Nikula <jani.nikula@intel.com> wrote:

> On Fri, 23 Jan 2026, Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> > On Fri, 23 Jan 2026 13:06:51 +0200
> > Jani Nikula <jani.nikula@intel.com> wrote:
> >  
> >> On Fri, 23 Jan 2026, Jani Nikula <jani.nikula@intel.com> wrote:  
> >> > I was trying to get the regular sphinx-build output.  
> >
> > Just do:
> >
> > 	$ make V=1 htmldocs
> >
> > or:
> > 	$ ./tools/docs/sphinx-build-wrapper -v htmldocs
> >  
> >> > The monster sphinx-build-wrapper thing has this obnoxious and complex
> >> > logic of forcing -q unless you specify verbose in SPHINXOPTS. You'd
> >> > think those defaults should be specified in the Makefile. But no.  
> >
> > It is like there to mimic what we used to have at Makefile.
> >  
> >> > Anyway, setting SPHINXOPTS in the environment or on the make
> >> > command-line doesn't work, because Documentation/Makefile overrides it
> >> > to empty.    
> >> 
> >> Oh, it's more sad than just this. There is no way to use SPHINXOPTS to
> >> get sphinx-build to produce the regular non-quiet output (that the
> >> wrapper calls verbose).
> >>
> >> You have to use KBUILD_VERBOSE to make the damn wrapper not pass -q to
> >> sphinx-build.   
> >
> > KBUILD_VERBOSE is the Makefile's env var that handles V=1.
> >  
> >>The wrapper appends the -q overwriting anything the user
> >> might want to pass on SPHINXOPTS. Which can't be passed anyway because
> >> the Makefile overwrites it.  
> >
> > It is like there to mimic what we used to have at Makefile: it was
> > was always passing "-q", except when called with V=1.  
> 
> I don't want verbose output from e.g. kernel-doc saying "Scanning doc
> for function" bla bla blaa, but I do want the regular Sphinx messages on
> what phase of the build it's at.
> 
> There doesn't seem to be a way to get the regular Sphinx "not quiet, not
> verbose" output, without also going verbose on silly kernel-doc
> messages.

With Makefile, there isn't. This didn't change: it is just the same
behavior we used to have before the wrapper addition, after this
changeset (merged in 2022):

	c0d3b83100c8 ("kbuild: do not print extra logs for V=2")

Now, currently it is possible to do that by calling the wrapper
directly:

	$ ./tools/docs/sphinx-build-wrapper -v htmldocs --sphinxdirs peci

Here, "-v" instructs the wrapper to drop "-q" flag, but doesn't touch
KBUILD_VERBOSE, so you won't see kernel-doc debug messages.

Regards,
Mauro
