Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB12E3904F9;
	Thu, 15 Jan 2026 11:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768477830; cv=none; b=Hpt8JQpAaKYySiXw9ZySSEddKt/ALhbzXIJSoXydA0hQzxhUms5QY0fDKt5eCRnQ3lT+5mIIINtxJe0e2tNLpuyFOPye5yGaGaP3tTtFhbgVkETPBNQ7/G+i9rujce5HoLMEh4ojN7jbEyuKb2UmqeZX6PSu8WfHBZk/75GKYXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768477830; c=relaxed/simple;
	bh=JQGvIx3RK2klAmCnEcOh7zgcth49wM3m+5L2IoCstSo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KuKR6GJg0DznjeaPV2vIdIonyk8UX3G+UXcrcSqFzyR5mBQZQsQ/7WzWC8ndM3MoxbG0/vEcmjRTaa2g5sRHEBz8UYSm8o3zB+SpRO3R2IL8lD8XhYBTLX5kgPnqBLBp+lJFfAZosmWrJRNYHm9x92FrEZk3xrSmwW1GqiB5rWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BhqVRGaR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BhqVRGaR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ECF3C116D0;
	Thu, 15 Jan 2026 11:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768477829;
	bh=JQGvIx3RK2klAmCnEcOh7zgcth49wM3m+5L2IoCstSo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BhqVRGaRV6+x5R3kjDUdJgEBvl/go+7Y5Odcdue7VV+soPABXx1zJsWBCyiUgRG8Z
	 z6dvmAN07qwE7Pt+eUWJIDUtlOXF7UwWoazIgje38sXukFIxG9BGVfFnXyf03urnz9
	 yD4YGZPt8M0xk4sIpE4R9cMhj2FQsel1FcY7CJDej8hEp3u961qpVvlLsrxqtQjQpo
	 sVnTtQsNntTvzxQU4KZcZM7izNbvwr5+3ucpSx/g4sj6CFzjQcvh3UDL7nQMdtWLtd
	 G/z01H3YpF2oP00CtIkU4yZQrh+AsC7W+M8wcysYghbU4IGVtjnn+dq3trNy7jDQgm
	 rq7wVkXUN7+zg==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vgLru-00000003uFn-3RVa;
	Thu, 15 Jan 2026 12:50:26 +0100
Date: Thu, 15 Jan 2026 12:50:26 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Linux Doc Mailing List <linux-doc@vger.kernel.org>, 
	linux-kernel@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH 02/13] docs: enable Sphinx autodoc extension to allow
 documenting python
Message-ID: <aWjRdFNJ_FMVnypU@foz.lan>
References: <cover.1768396023.git.mchehab+huawei@kernel.org>
 <6aa5a5b4a686f07c8f3e6cb04fe4c07ed9c1d071.1768396023.git.mchehab+huawei@kernel.org>
 <8e5e9257091275c6a3ddbbb254ca15ed55020627@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8e5e9257091275c6a3ddbbb254ca15ed55020627@intel.com>
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

On Thu, Jan 15, 2026 at 12:19:48PM +0200, Jani Nikula wrote:
> On Wed, 14 Jan 2026, Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> > Adding python documentation is simple with Sphinx: all we need
> > is to include the ext.autodoc extension and add the directories
> > where the Python code sits at the sys.path.
> >
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > ---
> >  Documentation/conf.py | 11 ++++++++---
> >  1 file changed, 8 insertions(+), 3 deletions(-)
> >
> > diff --git a/Documentation/conf.py b/Documentation/conf.py
> > index 1ea2ae5c6276..429fcc9fd7f7 100644
> > --- a/Documentation/conf.py
> > +++ b/Documentation/conf.py
> > @@ -13,11 +13,18 @@ from  textwrap import dedent
> >  
> >  import sphinx
> >  
> > +# Location of Documentation/ directory
> > +doctree = os.path.abspath(".")
> 
> Looking this up based on __file__ would be more robust than cwd.

Agreed.

> Calling this doctree is misleading because doctree is a specific Sphinx
> term that means something else. The doctree directory is where the
> parsed and pickled documents are cached.

Yeah, you're right: better use a different name.

> 
> Oh, I see that you're just moving this, but this is something that
> should be fixed first.

It can also be changed afterwards. Anyway, this should be on another
series, as such changes don't have anything to do with sphinx.ext.autodoc.

> 
> > +
> >  # If extensions (or modules to document with autodoc) are in another directory,
> >  # add these directories to sys.path here. If the directory is relative to the
> >  # documentation root, use os.path.abspath to make it absolute, like shown here.
> >  sys.path.insert(0, os.path.abspath("sphinx"))
> >  
> > +# Allow sphinx.ext.autodoc to document from tools and scripts
> > +sys.path.append(f"{doctree}/../tools")
> > +sys.path.append(f"{doctree}/../scripts")
> 
> These would be much nicer with pathlib.Path.

I guess we agree to disagree here: patchlib basically overrides math divison 
operator to work on patches like[1]

    p = Path('/etc')
    q = p / 'init.d' / 'reboot'

This looks really weird on my eyes. I can't see why this would be better
than:

    q = "/etc/init.d/reboot"

And yeah, I've seen examples in c++ that does similar things overriding 
math operators to do something else. Never liked this kind of math operator
abuse.

[1] got from textbook example at https://docs.python.org/3/library/pathlib.html

-- 
Thanks,
Mauro
