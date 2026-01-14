Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52CC437F74A;
	Wed, 14 Jan 2026 08:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768380216; cv=none; b=QYYg4YGA2tKMvHhu2nq4WQFBb9E8abr4q5ssSf6jlqfniuZCY3nBuNOlAUI2FDaTpraJXUi/yANtDQTqZRexEMWnlwuIpJBfBUjYfKiJfUsvGTsPAPxn6pS6yg/Sea9FXGJyKqEXak+OBxIYwCxTnJ3uByT8PuztzbGXdBq0tkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768380216; c=relaxed/simple;
	bh=fl4VwoWXjkSy5PFc91xe9etfRN1oPaIFkKb+owU0LC8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KW6v0pEBfCSQkcGl3kEeuUgsfn9zgCNdwNOn5ZfL8ny+Ix/mGiOkRzOQXAdAlaeRrUMiLe0KtLst08Nh1VJIMpeC2L4WuZCtipxMVjYCcOp3HMH4swFyCoDOzn7aPEQhKGjgMfUNw4HaBx0uwuVEb96eHJc3hpaSyGT1BpJdIWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ORATLRgu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ORATLRgu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1079C4CEF7;
	Wed, 14 Jan 2026 08:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768380215;
	bh=fl4VwoWXjkSy5PFc91xe9etfRN1oPaIFkKb+owU0LC8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ORATLRgu/oZI/k+vqsasUBtoHYpepq+B1BQWnBupQ5dkO4/9gUJdbbxAQMBhaL8Ut
	 Q0Co41h4pr4AF/ag3OxrjxnZ5W96NPLrNDXJyl/G3l0yeER4f5lYNDkpAWQEygLyWx
	 9EC2QSkFL00BEG9GtOY+ZQKM159lNfMS84rECg+Mf1JyIiyCpaq1hbGuIowXmLNOqL
	 o2ZcHfS8+/yYIv0UYNg+4Qsg7f7IgvdM+9E3z9eXT4C1+yTo0EMgVmYA8AlGV0WTbN
	 xP0/Z7/tZW+Ft0NHe52TYD/rMzEjKXU5a2P5zCVs9P92GlSF8Pa0fI0MB2wnvIZblC
	 anJaejeIP8LQg==
Date: Wed, 14 Jan 2026 09:43:28 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>, Shuah Khan
 <skhan@linuxfoundation.org>
Subject: Re: [PATCH RFC] docs: add python module documentation
Message-ID: <20260114094328.28f1a157@foz.lan>
In-Reply-To: <87wm1lw89g.fsf@trenco.lwn.net>
References: <e1c3feccfc2728e1fa0ec3230be1e3c26bb92dfd.1768324835.git.mchehab+huawei@kernel.org>
	<87wm1lw89g.fsf@trenco.lwn.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Tue, 13 Jan 2026 13:46:35 -0700
Jonathan Corbet <corbet@lwn.net> escreveu:

> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
> 
> > Hi Jon,
> >
> > While checking/improving docstrings inside kernel-doc, I noticed
> > that some changes there aren't Sphinx-compatible. Also, there are
> > several functions and some classes that miss documentation.
> >
> > Being responsible for doing some documentation work, I felt blamed
> > on not having a good documentation of our own dog food :-)
> >
> > So, I'm adding kdoc documentation to the Kernel documentation. The basic
> > change is just a couple of extra lines at conf.py, plus a few *.rst files
> > pointing to the files we want to document:  
> 
> At a first glance, this looks like a worthy task.
> 
> I've never really played with autodoc. 

once enabled, it is easy to add documentation. To document an entire
module, all we need is to add:

	.. automodule:: kdoc.kdoc_files
	   :members:
	   :show-inheritance:
	   :undoc-members:

undoc-members mean to show functions and vars that don't have
any comments. IMHO we want that, as it will help checking what parts
are missing docs. There are ways to exclude parts of the document from
the docs (I'm not planning to use them).

So, at the ReST, we need to add an automodule for each new file there.

> Sure you don't want to fix up kernel-doc to read Python code too? :) 

:-D

> Seriously, though, I worry that
> it could end up cluttering the code with a bunch of sphinxstuff, but the
> only way to really see is to try it.

Most of the documentation is extracted from standard python docstrings,
which will be handled as ReST. If you look at the patch, you'll see
that most of the changes are related to the lack of docstrings
(which also satifies linters, like pylint):

     def get(self, key, default = None):
+        """Get a value from optional keys"""
         return self.other_stuff.get(key, default)

Sphinx has the special "#:" syntax for comments that we want to
be at the documentation. So:

     # output mode.
-    OUTPUT_ALL          = 0 # output all symbols and doc sections
-    OUTPUT_INCLUDE      = 1 # output only specified symbols
-    OUTPUT_EXPORTED     = 2 # output exported symbols
-    OUTPUT_INTERNAL     = 3 # output non-exported symbols
+    OUTPUT_ALL          = 0 #: output all symbols and doc sections
+    OUTPUT_INCLUDE      = 1 #: output only specified symbols
+    OUTPUT_EXPORTED     = 2 #: output exported symbols
+    OUTPUT_INTERNAL     = 3 #: output non-exported symbols

and:

+    #: Highlights to be used in ReST format
     highlights = [

Add documentation to variables. Sphinx is smart enough to preserve
such comments on inherited classes, so, no need to document the same
functions 3 times for base, man and rest at kdoc_output.py.

So far, IMHO, all such changes will ensure that we'll have a good
documentation for python scripts.

Going further:

Documenting class instances will use the default representation,
which may not be the best. Adding a  __repr__() allows adjusting
it (*):

+    def __repr__(self):
+        return f're.compile("{self.regex.pattern}")'
+

With that, all documentation for KernRe() will use it. For instance,
sphinx_cblock is documented as:

	sphinx_cblock = re.compile("^\.\.\ +code-block::")

	    Sphinx code block regex

(*) I opted to use re.compile() instead of KernRe() because it
    was simpler and more intuitive for people just looking at the
    docs. We may, instead use KernRe() and then check if:

	- flags != 0
	- cache != True

    and then output it as:

		KernRe("pattern")
		KernRe("pattern", cache=False)
		KernRe("pattern", flags=Re.I)

    but IMO just printing the pattern is enough for doc purpose.

On this patch, the only sphinxstuff are the usage of "#:" 
and one Sphinx-specific notation here:

	-!!! Caution !!!
	+.. caution::

Thanks,
Mauro
