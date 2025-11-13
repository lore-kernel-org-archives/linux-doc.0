Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0FA33120B
	for <linux-doc@vger.kernel.org>; Thu, 13 Nov 2025 10:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763029510; cv=none; b=YH1byhDV1hyIcSiADAxASh/JQufhyeZv0CAC1pJnyIK+4bZfCJRM3Mg1EvaCe7tg4fqitYkqFym0MpT0I+6BHtvGZ1nZ6qXu0EClI6+WEhEZKFUimUEmUba3JUtiX+NLjMFhTcb40BBQWCyxqkDyxVKLpSr8zcyRwjx7nK4n4Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763029510; c=relaxed/simple;
	bh=pBG2QgY8XkZ7VPUe8kGoaDSD4QCDLrQ5TvJNO9/H5lk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iAdTkq2y31yg4T3qg3zkOeG2bLh6Ki2ksD3zxDM1b0vhO8bfLzHxAD8K4JJ1S7eZ4gh+COM7b4OCYoylQircF8G+mWsk9wJFQ1mr9zayNaFQ+6/p+HQ+39MtPMEJvaj6f7ThF9MzN2x4vsO74qGMJHXY4axW+JE577JbnO1oD54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DFQ4fERx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DFQ4fERx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 561B8C4AF09;
	Thu, 13 Nov 2025 10:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763029510;
	bh=pBG2QgY8XkZ7VPUe8kGoaDSD4QCDLrQ5TvJNO9/H5lk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DFQ4fERx6MG8pJ9SN3QH8sIQ+CHzifzBe/BJqIugFqnyeVPBe/r1wfi9+TnoP/3OG
	 dhom+2zVKgE+E1VM4aWwnsFffZHJIDJ5MO/veuILbvrE3Ofl1JuWz3hpuZIZREJ3fe
	 RzMgB3tfcRVK/iDnQfFcoUoGzr6iyEKT6OyvXaHr78UFPa5MGttn3Rnq0EXCZpvxxq
	 brf3T76qFHGLnPyCXmjfvGwJJC7DWsOVc8qg1Rogjhkl3nfKvAYHnvYs5xdippeNZO
	 2Ih1OLslVaCaXd3RiBMRohkaqceGHNSG1Il0uACjjsOE9uDhp5TyAwTkOfvjQwYjM8
	 GZANyowNTiQ8Q==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vJUVo-0000000B3Yk-1gXG;
	Thu, 13 Nov 2025 11:25:08 +0100
Date: Thu, 13 Nov 2025 11:25:08 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
	linux-doc@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, 
	Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH 4/4] Documentation: use a source-read extension to
 include the index boilerplate
Message-ID: <f5hk4glkjjnuxzak56jmqzrspngmmuvhezkzq3ahhzxlertd2z@v7p3sm54qokx>
References: <cover.1762948491.git.jani.nikula@intel.com>
 <e404d14ad5e9ed0ddc3f8920efb5d156dff99021.1762948491.git.jani.nikula@intel.com>
 <qf6t4cbpurcssabychbtxplqv7metgglduu4soqjexfxs6ongy@yryw3bnk44y6>
 <5fc09cd5678000ccca68200d9f692376024e4b33@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5fc09cd5678000ccca68200d9f692376024e4b33@intel.com>
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

On Thu, Nov 13, 2025 at 10:12:59AM +0200, Jani Nikula wrote:
> On Wed, 12 Nov 2025, Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> > On Wed, Nov 12, 2025 at 01:56:54PM +0200, Jani Nikula wrote:
> >> Reduce boilerplate all over the place by adding a small ad hoc extension
> >> in conf.py that adds the ../sphinx-includes/subproject-index.rst include
> >> to all SPHINXDIRS builds.
> >> 
> >> Note that the docname is just 'index', because the SPHINXDIRS builds
> >> happen in the subdirectories.
> >> 
> >> Cc: Randy Dunlap <rdunlap@infradead.org>
> >> Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> >> Cc: Jonathan Corbet <corbet@lwn.net>
> >> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> >
> >> diff --git a/Documentation/conf.py b/Documentation/conf.py
> >> index b9a43ee32a00..cb0936a71d52 100644
> >> --- a/Documentation/conf.py
> >> +++ b/Documentation/conf.py
> >> @@ -589,8 +589,14 @@ kerneldoc_srctree = ".."
> >>  # ------------------------------------------------------------------------------
> >>  loadConfig(globals())
> >>  
> >> +# Add index link to SPHINXDIRS builds
> >> +def add_subproject_index(app, docname, source):
> >> +    if app.builder.tags.has('subproject') and app.builder.tags.has('html'):
> >> +        if docname == 'index':
> >> +            source[0] += '\n.. include:: ../sphinx-includes/subproject-index.rst\n'
> >
> > The relative path there breaks SPINXDIRS, when it is pointing to use a sub-sub-dir
> > like:
> >
> >     $ make SPHINXDIRS=userspace-api/media htmldocs
> 
> Ugh, I looked at 'make help' for the "valid values for SPHINXDIRS",
> which only lists the top level directories. Patch 1 is also based on
> this.
> 
> What a surprise, the documentation for documentation is useless.

Yeah, _SPHINXDIRS helper message was introduced back in 2016
on this changeset:
    606b9ac81a63 ("doc-rst: generic way to build only sphinx sub-folders")

On that time, we didn't have much things under Documentation/, so
the helper message makes sense. Also, each subsystem had its own top-level
directory. Nowadays, subsystem-specific documentation is typically under

    Documentation/<core-api|driver-api|userspace-api|...>/<subsystem>

So, SPHINXDIRS is nowadays used to point to the second level directory
on lots of real use cases.

One needs to add an update there at the helper message.

Thanks,
Mauro
