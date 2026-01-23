Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C513B2D6E76
	for <linux-doc@vger.kernel.org>; Fri, 23 Jan 2026 15:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769180980; cv=none; b=JfmsdU4dunWkItiazL9gjoKaPm+WyzCnvTmXWQMMTjUEgN52IZareZP2QwvZ30xlEtM2yPwcTMPDrncFMDn6sqVU7J85iZ5rS8nDA+Of11QHQEH1YF7jNgiu/JhdiOXjR1dhqBhU8qu3+BGyigURkqD6MhIqvzhs5ARKdGokVlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769180980; c=relaxed/simple;
	bh=FQE/mFeJxIcrHX8r4xDyKBhbxacwqV3LioVH8MLAdRs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HmQgMXIWaGCN2/0KsYZyVYPaQOULVe+k+i/5kXiVGu4RjfSqUvqQvP+dAjwefltn6rRIwWFK5c3yMZv8f7Er4+oQVikcFfRydTzHZw9W0E3GdrvKTTsgWkmwMm53rizPbWaRfez65JUR5UKQayGdtGGvOLfvSYm3OnG+1NBCdjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tu9RL3bU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tu9RL3bU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28464C4CEF1;
	Fri, 23 Jan 2026 15:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769180978;
	bh=FQE/mFeJxIcrHX8r4xDyKBhbxacwqV3LioVH8MLAdRs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Tu9RL3bUgkHra8xxw/KNcyVuVKMBwJdxzyAtWonoGKLrGR+zHO2jyPCFMSoqTCoNu
	 OsPX264BlWSJ2CsNgxMqDDNz8Ank4+QFF+X9tWxyW6036WFXl38MFnOHw2+VkheK8H
	 F295+xSMjV2iNuzbv/8rHZdJHv+4zICzbcYd0sxGcTKWkw1CVCDJTR8luvUp32ICks
	 w/xbQGrIvaLUen3XL1UD757y1cLnIbpCYbYj2YtyaFJMpkuHkGtjunzgWkCosxaY84
	 oNEHX5P2Izyxd6AjdQPfDLnH+chq37JQbnNEh+VnFFuFLi1oCzgY83slp5du0UkPic
	 LUfgXieDv5wDA==
Received: from localhost ([::1])
	by mail.kernel.org with esmtp (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vjIn1-000000065kQ-3fb0;
	Fri, 23 Jan 2026 16:09:36 +0100
Date: Fri, 23 Jan 2026 16:09:33 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Mauro
 Carvalho Chehab <mchehab@kernel.org>
Subject: Re: Passing SPHINXOPTS is broken
Message-ID: <20260123160933.45ebb2bc@localhost>
In-Reply-To: <faac4df15ab5b87dc5795143ecafb9b725b9118e@intel.com>
References: <db84b28d2997a1ce73ca9bc65c33e2d08a90aae8@intel.com>
	<11148f49962022fde99058c15345add4935bbeff@intel.com>
	<20260123123215.32f6c40a@foz.lan>
	<233a2366263111e61700da07f3692a029fc51a50@intel.com>
	<20260123151033.5acc515f@localhost>
	<faac4df15ab5b87dc5795143ecafb9b725b9118e@intel.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 23 Jan 2026 16:28:37 +0200
Jani Nikula <jani.nikula@intel.com> wrote:

> On Fri, 23 Jan 2026, Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> > With Makefile, there isn't. This didn't change: it is just the same
> > behavior we used to have before the wrapper addition, after this
> > changeset (merged in 2022):
> >
> > 	c0d3b83100c8 ("kbuild: do not print extra logs for V=2")
> >
> > Now, currently it is possible to do that by calling the wrapper
> > directly:
> >
> > 	$ ./tools/docs/sphinx-build-wrapper -v htmldocs --sphinxdirs peci
> >
> > Here, "-v" instructs the wrapper to drop "-q" flag, but doesn't touch
> > KBUILD_VERBOSE, so you won't see kernel-doc debug messages.  
> 
> I'm not really interested in using the wrapper directly. I use make O=
> builds, and I don't want to and I should not have to figure out how to
> do that with the wrapper.
> 
> Again, it should be possible to pass user SPHINXOPTS to sphinx-build.

Agreed, but the problem is that, since a long time, "-q" was always 
aways added when V=0, and we don't have V=2 for docs anymore.

Unfortunately, Sphinx doesn't have a --no-quiet option. So, right now it
preserves the behavior it had for a long time:

- if V=0, defaults to "-q"
- if V=1, defaults to not use "-q", but one can add SPHINXOPTS=-q
  to keep Sphinx build in quiet mode.

What we could do is to add something like this:

	diff --git a/tools/docs/sphinx-build-wrapper b/tools/docs/sphinx-build-wrapper
	index 7a5fcef25429..13731b478822 100755
	--- a/tools/docs/sphinx-build-wrapper
	+++ b/tools/docs/sphinx-build-wrapper
	@@ -165,6 +165,7 @@ class SphinxBuilder:
	         parser = argparse.ArgumentParser()
	         parser.add_argument('-j', '--jobs', type=int)
	         parser.add_argument('-q', '--quiet', action='store_true')
	+        parser.add_argument('-n', '--not-quiet', action='store_true')
 
	         #
	         # Other sphinx-build arguments go as-is, so place them
	@@ -181,6 +182,9 @@ class SphinxBuilder:
	         if sphinx_args.quiet is True:
	             verbose = False
	 
	+        if sphinx_args.not_quiet is True:
	+            verbose = True
	+
	         #
	         # If the user explicitly sets "-j" at command line, use it.
	         # Otherwise, pick it from SPHINXOPTS args

Regards,
Mauro
