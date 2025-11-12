Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6957C33A014
	for <linux-doc@vger.kernel.org>; Wed, 12 Nov 2025 13:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762953111; cv=none; b=plRo2IdZwF1tcAwwo7/zsjPR/L+OOLeHBZHjregwLfJbq+1F6SX787bOMNSxTrrtXOt2Dkd6nJHRE+8fO296M+jO2K7CGbl9Xl5Tj49iZTifxsKsy6AU+Wuuj9cb2Dmu6uzMkWtRf2SBKuZTHF/tZbNWHDnnWUPxspU1IvwkG54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762953111; c=relaxed/simple;
	bh=YWRbBFvum7ueZDz4ehiF9X4M6T8yyONxKxJL06/IeGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CVVID9GiIXHyqoFVYrTDztv/OB0e64j7+ua9zz5mqDnxy9WHAqjmhzRHV2dIpx6zCF9tMwhFANuLCmReY8pd7nlWKJQ5Lx+J/YuvnPf2CMNGyD8LfvMMDkWNdPdNTAveMpDAaX7lja04Oc2OPLbQjbE1zILWlSp0VL6CTVaA5Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fWvAJ1m8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fWvAJ1m8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F07FFC19423;
	Wed, 12 Nov 2025 13:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762953111;
	bh=YWRbBFvum7ueZDz4ehiF9X4M6T8yyONxKxJL06/IeGU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fWvAJ1m8Mtl90T5+3U2JgPTs2VTAT1//l8c+8qYiAGjwOpVvWRh1ow0ck21iXUb47
	 hw/HO8Lf8OOqdIM8vPBxPRxpwYOv3A39nAtMEMM8EXtKLZXDDa4+j7R88zcKDs3qK1
	 HWGqdDOKLxWnSn5wMzvIqu4RGlz6uVi77oOdzgM2cCQ2OFaOBvHs0l5HE49dfgjhjq
	 +JOlIenJkcxHabDm+nsGwyS2H2vXrNbyPT7YjjwjBJ15rJ8HofpzVOkPG1WH4mFoGh
	 mg8OgWaNIgXGRFsHHbh64NYTS8adBTpsunVPljeLMs4M5eiZarRRaHkXEjKDj1Rvc4
	 5EbOdyAJjE9SA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vJAdZ-00000009RBB-0IwA;
	Wed, 12 Nov 2025 14:11:49 +0100
Date: Wed, 12 Nov 2025 14:11:49 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Linux Documentation <linux-doc@vger.kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>
Subject: Re: confusing ReST/html
Message-ID: <qyjbpdktj3w4t75mtbu6chbib4zjfvspphtm2h75wbdgbmmgdc@u3wnqfzurjyd>
References: <0fa53fbb-8505-4107-8f1f-4082123fdde6@infradead.org>
 <20251112101942.211ae19e@foz.lan>
 <d317715fddedc8059d865e131d9a9799c1940703@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d317715fddedc8059d865e131d9a9799c1940703@intel.com>
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

On Wed, Nov 12, 2025 at 02:08:50PM +0200, Jani Nikula wrote:
> On Wed, 12 Nov 2025, Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> > Hi Randy,
> >
> > Em Tue, 11 Nov 2025 20:59:25 -0800
> > Randy Dunlap <rdunlap@infradead.org> escreveu:
> >
> >> I'm comparing Documentation/core-api/index.{rst,html} and
> >> Documentation/driver-api/index.{rst,html}.
> >> 
> >> Lots (but not all) .rst files end with something like
> >> 
> >> .. only:: subproject and html
> >
> > This is related to partial documentation builds.
> >
> > - On PDF, we don't want to have an "Indices" section. With PDF, LaTeX
> >   will always generate an index, outside the "Indices" section, so it
> >   ends producing an empty section there.
> >
> >   That's why the rule has "and html".
> >
> > - Our building system adds "subproject" when one uses SPHINXDOCS.
> >   The above logic ensures that a partial build will have its own index.
> >
> >   If you want, try to add/remove it and see what happens when building 
> >   with SPHINXDOCS. Btw, the quickest one to test is peci:
> >
> > 	make SPHINXDOCS=peci htmldocs
> >
> >   If everything is working as expected (I haven't test it for years),
> >   on index.rst that contains it, you'll see an index. Removing it will
> >   produce an output without any index (but I guess it will still have
> >   the sidebar).
> 
> :ref:`genindex` creates a *link* to the index, which will be created
> regardless of whether you have that link or not.

True, but without the link, genindex won't be accessible from
index.html.

> >
> >> 
> >>    Indices
> >>    =======
> >> 
> >>    * :ref:`genindex`
> >> 
> >> Both of the core-api & driver-api index.rst files do...
> >> with the difference being that core-api/index.rst has
> >> one space following ".. only::" while driver-api/index.rst
> >> has 2 spaces following ".. only::".
> >> 
> >> Does that make a difference?
> >
> > No, I don't think so.
> >
> >> 
> >> When looking at the end/bottom of core-api/index.html,
> >> there is *NO* heading "Indices" and *NO* link "Index" as there
> >> is in driver-api/index.html.
> >> Why? 
> >
> > See above. You'll only see it if you use SPHINXDOCS=core-api.
> >
> >> There are other cases like this one:
> >> 
> >> $ cd Documentation; git grep "^\.\. only:: [^ ]"
> >> 
> >> RCU/index.rst:.. only:: subproject and html
> >> core-api/index.rst:.. only:: subproject and html
> >> rust/index.rst:.. only:: rustdoc and html
> >> rust/index.rst:.. only:: not rustdoc and html
> >> trace/index.rst:.. only:: subproject and html
> >> virt/index.rst:.. only:: html and subproject
> >> wmi/devices/index.rst:.. only:: subproject and html
> >
> > On a side note, I don't like very much this solution, as people can 
> > forget about that.
> 
> Not only that, but people appear to have cargo cult copy-pasted the
> ".. only:: subproject and html" bit all over the place for no good
> reason.
> 
> >
> > Perhaps it would be possible to do it on a different and more automatic
> > way, by doing some changes at the way partial builds are handled by
> > sphinx-build-wrapper.
> >
> > on some brainstorming I did while writing the script, it came to
> > me that one possibility would be that the wrapper would create a
> > temporary structure with symlinks to the documents. E.g. when one
> > does:
> >
> > 	make SPHINXDOCS="peci foo" O=/tmp/build htmldocs
> >
> > This would create something like:
> >
> > 	$ tree /tmp/build/source
> > 	/tmp/build/source
> > 	├── index.rst
> > 	peci/
> > 	│   ├── index.rst	# Symlink to kernel source file
> > 	│   └── peci.rst	# Symlink to kernel source file
> > 	└── foo/
> > 	    ├── index.rst	# Symlink to kernel source file
> > 	    └── foo.rst		# Symlink to kernel source file
> >
> > where index.rst would be auto-generated and would contain something like:
> >
> > 	.. SPDX-License-Identifier: GPL-2.0
> >
> > 	.. toctree::
> > 	   :maxdepth: 1
> >
> > 		peci/index
> > 		foo/index
> >
> > 	.. only:: subproject and html
> >
> > 		Indices and tables
> > 		==================
> >
> > 		* :ref:`genindex`
> >
> > There are some advantages of such approach:
> >
> > - cross references between multiple SPHINXDIRS will be solved;
> > - this will speedup such builds, as, right now, the building system
> >   serializes the build for each directory individually. With such
> >   approach, it will build everything in parallel;
> > - this will simplify the logic inside conf.py.
> >
> > The disadvantages are:
> > - some extra complexity at the wrapper;
> > - a new temporary directory will be needed ("/source" on my example)
> 
> You'll get all the error and warning messages referencing some ephemeral
> file inside a temp or build directory, which is confusing to say the
> least.

True.

> > Comments?
> 
> When you have problems with Sphinx, you should first try to figure out
> the possible solutions in Sphinx, instead of hacking in Makefiles.
> 
> In this case, the solution to the index boilerplate is literally half a
> dozen lines in conf.py [1].

Saw your patch series. Indeed it sounds a better solution. Will do
some tests here.

> 
> 
> BR,
> Jani.
> 
> 
> [1] https://lore.kernel.org/r/cover.1762948491.git.jani.nikula@intel.com
> 
> 
> -- 
> Jani Nikula, Intel

-- 
Thanks,
Mauro
