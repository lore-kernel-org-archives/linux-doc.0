Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C3638B7B8;
	Thu, 15 Jan 2026 12:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768481850; cv=none; b=eHhNUcFBkUxNMVzzUGnNqgY3QTIe5I1sc0XLzGhby8oeUd/8KVEfFeiaVOCON3BmDF3khy1yWk2xNPqqzScUGo+D7qjbF7Aesx843HgpwMdZlVzaNocUAka3zpgmHSNOjVtRFa+DANvFxuzRHZR0P3jjrbERONy4Rsc/mMcH1AU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768481850; c=relaxed/simple;
	bh=tQbTEITJjZKghpFRIxT5G22cLTaiE1iJ3knL60KmiOY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K0V7Nr+yNCghH6RN/30IvZBVmrx+34lA15pSnCzbc65F+7f0C5Cgywlyn7tfP1VM4BOuCJHgfoa9ulWIpOt0M/QqXg4k7xPTNUpYtPZ2AQ7y9Lj6yX64D/g0XEJt0EORvrU/oOsbNEShBdho4qdkiCoxCmZppz+7uuMGzuO9k38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OHOPx5NJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OHOPx5NJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0EDBC116D0;
	Thu, 15 Jan 2026 12:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768481850;
	bh=tQbTEITJjZKghpFRIxT5G22cLTaiE1iJ3knL60KmiOY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=OHOPx5NJ7lYgzZ6C+r/eOnuXcmt2ug+A4pyPOvyWuSZV5t8Ix+We57Npw3gxc2gGu
	 JtWEcdwp19M0T0DJOTZK2Q1+deeFdK4hR3OuYrhUehNmjUVb7vq2hIIvDDQ6zzBzn9
	 8oJZGd+fqQKbVQwS5Ve6cVCFGP6WBDnNPtml6ui7QJJIX9IgsRGDq6HOJJJanJoLz4
	 yARvYDJ450btJZ54xzHlLgVkATpMLuZ3J7Anj7ATdrJrSOCiuLq06zmePlGSpxnHv9
	 Qn8Iiq9mraaPLPlwnKhq+QZqeBKDOgk8yuGM8dW/5+OqI2nbAoRSfGwD/jlY0yTgVb
	 9peXLEcJHrcnA==
Date: Thu, 15 Jan 2026 13:57:26 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Linux Doc Mailing List
 <linux-doc@vger.kernel.org>, linux-kernel@vger.kernel.org, Mauro Carvalho
 Chehab <mchehab@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH 02/13] docs: enable Sphinx autodoc extension to allow
 documenting python
Message-ID: <20260115135726.035fbdc8@foz.lan>
In-Reply-To: <7ed33e37aab4971cc2762ffa5ff5602856857685@intel.com>
References: <cover.1768396023.git.mchehab+huawei@kernel.org>
	<6aa5a5b4a686f07c8f3e6cb04fe4c07ed9c1d071.1768396023.git.mchehab+huawei@kernel.org>
	<8e5e9257091275c6a3ddbbb254ca15ed55020627@intel.com>
	<aWjRdFNJ_FMVnypU@foz.lan>
	<7ed33e37aab4971cc2762ffa5ff5602856857685@intel.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Thu, 15 Jan 2026 14:18:45 +0200
Jani Nikula <jani.nikula@linux.intel.com> escreveu:

> On Thu, 15 Jan 2026, Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> > On Thu, Jan 15, 2026 at 12:19:48PM +0200, Jani Nikula wrote:  
> >> On Wed, 14 Jan 2026, Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:  
> >> > Adding python documentation is simple with Sphinx: all we need
> >> > is to include the ext.autodoc extension and add the directories
> >> > where the Python code sits at the sys.path.
> >> >
> >> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> >> > ---
> >> >  Documentation/conf.py | 11 ++++++++---
> >> >  1 file changed, 8 insertions(+), 3 deletions(-)
> >> >
> >> > diff --git a/Documentation/conf.py b/Documentation/conf.py
> >> > index 1ea2ae5c6276..429fcc9fd7f7 100644
> >> > --- a/Documentation/conf.py
> >> > +++ b/Documentation/conf.py
> >> > @@ -13,11 +13,18 @@ from  textwrap import dedent
> >> >  
> >> >  import sphinx
> >> >  
> >> > +# Location of Documentation/ directory
> >> > +doctree = os.path.abspath(".")  
> >> 
> >> Looking this up based on __file__ would be more robust than cwd.  
> >
> > Agreed.
> >  
> >> Calling this doctree is misleading because doctree is a specific Sphinx
> >> term that means something else. The doctree directory is where the
> >> parsed and pickled documents are cached.  
> >
> > Yeah, you're right: better use a different name.
> >  
> >> 
> >> Oh, I see that you're just moving this, but this is something that
> >> should be fixed first.  
> >
> > It can also be changed afterwards. Anyway, this should be on another
> > series, as such changes don't have anything to do with sphinx.ext.autodoc.
> >  
> >>   
> >> > +
> >> >  # If extensions (or modules to document with autodoc) are in another directory,
> >> >  # add these directories to sys.path here. If the directory is relative to the
> >> >  # documentation root, use os.path.abspath to make it absolute, like shown here.
> >> >  sys.path.insert(0, os.path.abspath("sphinx"))
> >> >  
> >> > +# Allow sphinx.ext.autodoc to document from tools and scripts
> >> > +sys.path.append(f"{doctree}/../tools")
> >> > +sys.path.append(f"{doctree}/../scripts")  
> >> 
> >> These would be much nicer with pathlib.Path.  
> >
> > I guess we agree to disagree here: patchlib basically overrides math divison 
> > operator to work on patches like[1]
> >
> >     p = Path('/etc')
> >     q = p / 'init.d' / 'reboot'
> >
> > This looks really weird on my eyes. I can't see why this would be better
> > than:
> >
> >     q = "/etc/init.d/reboot"
> >
> > And yeah, I've seen examples in c++ that does similar things overriding 
> > math operators to do something else. Never liked this kind of math operator
> > abuse.  
> 
> Resistance is futile, you will be assimilated. ;)

Yeah, one day I might be forced to move to it. There were much more 
assimilation attempts with regards to IPv6... So, far, I've been
resisting  ;-)

> The upside is everything's a Path object rather than a string, giving
> you methods that you'd expect paths but not strings to have, avoiding
> the tedious string manipulation all over the place.

This could make sense if this were supposed to work outside Linux 
(or Unix). As this is not the case, we don't need class abstraction
to handle directory deliminator, which is mainly the reason why 
someone writes methods and classes like os.path and pathlib.

Also, os.path has methods already to handle them in a portable way.

In this specific case, it could be using it like:

	sys.path.append(os.path.join(doctree, "/../scripts"))

to do patch contactenation, or, to be portable on other OSes:

	sys.path.append(os.path.join(doctree, "..", "scripts"))

IMO, both are easier to read, and IMHO more direct than:

	from pathlib import Path

	script_path = Path(doctree) / ".." / "scripts"
	sys.path.append(str(script_path))

Also, pathlib is more error prone, as if one does:

	>>> doctree="/tmp"
	>>> import sys
	>>> from pathlib import Path
	>>> script_path = Path(doctree) / ".." / "scripts"
	>>> sys.path.append(script_path)

It ends placing PosixPath() at the list:

	>>> sys.path
	['', '/usr/lib64/python314.zip', '/usr/lib64/python3.14', '/usr/lib64/python3.14/lib-dynload', '/usr/lib/python3.14/site-packages', PosixPath('/tmp/../scripts')]

which I don't thing it would do the right thing to do.

Regards,
Mauro
