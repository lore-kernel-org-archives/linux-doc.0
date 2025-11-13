Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A362DF6E9
	for <linux-doc@vger.kernel.org>; Thu, 13 Nov 2025 10:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763028690; cv=none; b=WO3qbmyS7wx/qoTYNnlReONUN4Rk4bu6isf+eAe996cF6qarpoUASGygZBDNJEcNwnvgCtcTmpHDUnH2B+AwfREBm2VWXH1U5WspagJqysJUPF8zIIOJoWiBXGCHKW1QEXvyfp0NmKJjY8zU/lEQQcreS1RhkIp7mjv0/6eaMuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763028690; c=relaxed/simple;
	bh=3EaZYYuN+4sGryMa/yHUPG1mtQZ3Q51iiRKYP6PmB6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HXyziBrnbH352LIPkfCHRVghU7vZocAT5/CWGZpTBNEceSFFCz+VLx1/MxM6AW5u7Kgv65DXjzDX0bXe3pgy/qaY1DNU3qSvcbHM6LGcAttlCMNN6klBQnqxABQ5yn/djaTtms6l1Q4pZgIQwMg3+94n7o0I4jwp3za4d2uDrok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZvS9jKcf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZvS9jKcf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD1C3C113D0;
	Thu, 13 Nov 2025 10:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763028689;
	bh=3EaZYYuN+4sGryMa/yHUPG1mtQZ3Q51iiRKYP6PmB6Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZvS9jKcfZpSiKhX1Vx2sH8gzj4qqJBh40OB54ffansHhSJt3mQPVIyNl64qA9Rhla
	 RG2tFpnk542grcFD4Le9qPUVlnUb9nCNL4UjsM9Z/4fdsZcOeV2CYSHgQa3Jj5jRCF
	 TUFLgb3CtEFR9ZmzanmHa/ydQS6dEF3POequ622C/L6h0C5ItkDvnp/F+daQuYvxMi
	 +9vD9osDcZZSIGOWUGBv8QxnaB4PKznL3OMJEeA325mKAg0j9Kksp4xNsPh2i91FzZ
	 bUOlaGYtmsRS8wWUrUhaQZ2+jI3Ra+dwTLGnpNaTudvgJieof0LdAwLYf3FTzmZF20
	 D1VyrX4naRRtQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vJUIZ-0000000B2Zq-425V;
	Thu, 13 Nov 2025 11:11:27 +0100
Date: Thu, 13 Nov 2025 11:11:27 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
	linux-doc@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, 
	Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH 3/4] Documentation: include the boilerplate for
 SPHINXDIRS index link
Message-ID: <7caoju2mniyk7xbpiwxwomxxn6rec4vyfcpjtujzmvzwkxvjkq@m2iu5m3slpd6>
References: <cover.1762948491.git.jani.nikula@intel.com>
 <87e4998a80a32d447555d35940bee77aa14a6813.1762948491.git.jani.nikula@intel.com>
 <jhrbxpwu7ef6f72mxxsw4r4xstte2ncydotp4ygmnbwmw7e4lh@hfhaitekjgc3>
 <e5d0dd034919c0d1e9e327be25e47543190310e1@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e5d0dd034919c0d1e9e327be25e47543190310e1@intel.com>
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

On Thu, Nov 13, 2025 at 10:04:17AM +0200, Jani Nikula wrote:
> On Wed, 12 Nov 2025, Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> > On Wed, Nov 12, 2025 at 01:56:53PM +0200, Jani Nikula wrote:
> >> Repeating the index link boilerplate everywhere is tedious. Put it in a
> >> subproject-index.rst snippet in a new sphinx-includes directory, and
> >> include it.
> >> 
> >> We'll have to use the relative include, because a) includes are relative
> >> to the source file, b) top level include with
> >> /sphinx-includes/subproject-index.rst does not work with SPHINXDIRS
> >> builds, because the root is the subdirectory in that case.
> >> 
> >> Cc: Randy Dunlap <rdunlap@infradead.org>
> >> Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> >> Cc: Jonathan Corbet <corbet@lwn.net>
> >> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> >
> >
> >> diff --git a/Documentation/conf.py b/Documentation/conf.py
> >> index 574896cca198..b9a43ee32a00 100644
> >> --- a/Documentation/conf.py
> >> +++ b/Documentation/conf.py
> >> @@ -38,7 +38,7 @@ else:
> >>  doctree = os.path.abspath(".")
> >>  
> >>  # Exclude of patterns that don't contain directory names, in glob format.
> >> -exclude_patterns = []
> >> +exclude_patterns = ['sphinx-includes/*']
> >
> > This doesn't work the way on might expect. The problem also affects
> > patch 4.
> >
> > Basically, when SUBDIRS is used, include and exclude patterns need
> > to be dynamically calculated, as, instead of building docs using
> >
> > Documentation/, the logic builds inside documentation/<directory>
> >
> > So, instead, you need to do:
> >
> >     dyn_exclude_patterns.append("sphinx-includes/*")
> >
> > To ensure that it will pick just the right includes directory.
> 
> Sphinx will only look for files within the source directory passed to
> sphinx-build. With SPHINXDIRS, the Documentation/ is not it. There's no
> need to specifically exclude anything that's outside of the source
> directory hierarchy.
> 
> The whole dyn_exclude_patterns looks like overkill to me. It should just
> look at exclude_patterns, and remove anything that's outside of the
> SPHINXDIRS specified, and remove the SPHINXDIRS prefix from the
> remaining ones.

It is not overkill: this is needed to ensure that the patterns
will be applied the right way. See for instance those:

    if has_include_patterns:
        dyn_include_patterns.append("netlink/specs/*.yaml")
    else:
        dyn_exclude_patterns.append("netlink/*.yaml")
        dyn_exclude_patterns.append("devicetree/bindings/**.yaml")
        dyn_exclude_patterns.append("core-api/kho/bindings/**.yaml")

if one calls:

    make SPHINXDIRS=netlink htmldocs

the path needs to be recalculated to drop "netlink/".

In the very specific case of your pattern, it depends if you're
storing it under Documentation/sphinx-includes or elsewhere.

-- 
Thanks,
Mauro
