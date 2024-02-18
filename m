Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C821C360
	for <linux-doc@vger.kernel.org>; Sun, 18 Feb 2024 00:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708216823; cv=none; b=Z6uH3BuIWalqw2nufqMfwgXJO978Z+1ZA7hAZ24vlNI8LrVCgmpxdmnfOIy73cjlrSa+R68b54uKM1bbopxerkY6e/G8aOwzpbCiPZvh0OCMIJXFlAyv/YAP5IRfwDWTsgeYu8ph73k+a+gtKsx4r5llHbJwBwZDkWifXgIiY14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708216823; c=relaxed/simple;
	bh=AOkUgB1b71Q61HmhthppaU7AcqxWwAY7xWnfFaPQSiQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GFDUSJpit4WgFwjQ8GHrD28C4rKl9+P8ebwVmde2FMCuhdc5Zu2OmQG/TS9gVuooQa15kME9V2v2At3bqBE4fC2hsuR0EQJVSHbNnTQEo+cqCxp4hRzlFrhGGCICY/URAGlMc3fszExgHiXbe6qYpCq8DDnFprp1LpkPdUfTWGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PsiSZZdX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PsiSZZdX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72EADC433F1;
	Sun, 18 Feb 2024 00:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708216823;
	bh=AOkUgB1b71Q61HmhthppaU7AcqxWwAY7xWnfFaPQSiQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=PsiSZZdX3l/ZIAqwzlQuLJ23F/0lLylwcLneshRIX9tPN8Japxu3s7fg3Avwmz/ct
	 6RdkKG/4ulkCNdWLgLsNkk4W8ZjEuYvCfpOgotRR6TC9vOvqrGrF2Wj2fxJrB00b9M
	 fJUJtEBpJ7JkTXtW5MfHTZKuFSSYXKJWgf4gxgICIvn9BxzLNj3ACugAixeVFShI48
	 WhdtUcZrA6JHIcPXhzYyF+9Y/A2naxOwS2duv32NsBsKUtyFKZsa+1usv7t5RiRxIi
	 wC86A9ugva4fz/Sl1Zqkhm3JgTtw7QZUj47LBZimdgGMJ4iVLj8CpYXbyVTcyjGzWI
	 Ss3+HJlT2fuow==
Date: Sun, 18 Feb 2024 01:40:19 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>, Vegard
 Nossum <vegard.nossum@oracle.com>
Subject: Re: PDF misery
Message-ID: <20240218014019.35fcf19e@coco.lan>
In-Reply-To: <8734tqsrt7.fsf@meer.lwn.net>
References: <8734tqsrt7.fsf@meer.lwn.net>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Sat, 17 Feb 2024 14:29:24 -0700
Jonathan Corbet <corbet@lwn.net> escreveu:

> So, FYI, I have Vegard's PDF-generation fix applied here, but I've not
> pushed it yet (even though I think it's fine) because I wanted to be
> sure that all was well with PDF generation.

Yeah, LaTeX Sphinx output is really tricky, requiring workarounds from
time to time to address some issues.

> The first change removes the deepest level of nesting in an impressive
> set of enumerated lists; the second removes the nth-level subsection
> heading markup for "Sorting xfarrays".  Having either of those present
> will cause Latex to blow a fuse.

...

> I'm surprised that nobody else is reporting this problem.  I honestly
> don't see a fix other than changing the organization of the document to
> avoid both deeply nested itemized lists and section structure, which is
> less than entirely desirable.  I think there are good reasons for
> avoiding structures that deep, but limitations in the tooling aren't one
> of them.

The maximum indentation level seems easily fixable. See my PoC at the
end of this e-mail.

From:
	- https://tex.stackexchange.com/questions/571826/too-deeply-nested
	- https://stackoverflow.com/questions/1935952/maximum-nesting-level-of-lists-in-latex

And some local tests I did on Fedora 39, the default enum indentation
limit is 7.

This is configurable by adding \setlistdepth after using enum item,
e. g.:

	\usepackage{enumitem}
	\setlistdepth{9}

I guess we can add something like that to latex_elements at conf.py to 
increase the maximum limit.

> Incidentally, on F38, I also run into a similar Latex error in
> .../userspace-api/media/v4l/pixfmt-rgb.html, which has a set of tables
> from hell.  On F39, that somehow works.  Weird.

I remember in the past I had to increase some LaTeX memory limits,
but it seems that this is not required anymore.

> 
> The *other* problem is that PDF generation of the Chinese, Korean, or
> Japanese translations fails with:
> 
>   xdvipdfmx:fatal: Invalid TTC index number
> 
> This, I am thinking, is likely some sort of F39 bug.  xdvipdfmx is
> finding the CJK fonts just fine, but then something clearly goes wrong.
> I'll try to find the time to narrow that down and perhaps put in a
> proper bug report.
> 
> Meanwhile, I wish I knew what to do to make the PDF build a bit more
> robust.  I wish that rst2pdf or rinohtype would progress to the point
> where they could be used, and Latex could be taken out of the picture,
> but no such luck.

I haven't tested rst2pdf for a while on Kernel builds. It works fine
when producing IGT documentation, but the docs there are too trivial
to cause issues.

Didn't try rinohtype yet.

Ideally, if one of those would work, that would be a lot better, as
LaTeX makes it a lot more complex than it should be.

> Oh well...sorry for rambling at you...I wish I had a good plan for
> making this whole thing better.
> 
> jon

Regards,
Mauro

---

The way the .tex file below is, it builds fine with:

	$ xelatex  -halt-on-error /tmp/test.tex
	This is XeTeX, Version 3.141592653-2.6-0.999995 (TeX Live 2023) (preloaded format=xelatex)
	...
	Output written on test2.pdf (1 page).
	Transcript written on test2.log.

If you remove this line:

	\setlistdepth{9}

You'll see the error:

	$ xelatex  -halt-on-error /tmp/test_without_setlistdepth.tex
	This is XeTeX, Version 3.141592653-2.6-0.999995 (TeX Live 2023) (preloaded format=xelatex)
	...

	! LaTeX Error: Too deeply nested.

	See the LaTeX manual or LaTeX Companion for explanation.
	Type  H <return>  for immediate help.
	 ...                                              
	                                                  
	l.60                 \item
	                           item level 7
	No pages of output.
	Transcript written on test_without_setlistdepth.log.

And it indicates that it fails when level == 7.


-


\documentclass{article}

\usepackage{enumitem}
\RequirePackage{enumitem}

\setlistdepth{9}

\setlist{nolistsep,
         leftmargin = *}
%
%
\newlist{myEnumerate}{enumerate}{9}
\setlist[myEnumerate]{
    font        = {\bfseries} ,
    topsep      = 0pt }
\setlist[myEnumerate,1]{label=\arabic* ---,ref=\arabic*}
\setlist[myEnumerate,2]{label=\arabic{myEnumeratei}.\arabic*),ref=\themyEnumeratei.\arabic*}
\setlist[myEnumerate,3]{label=\roman*),ref=\themyEnumerateii.\roman*}
\setlist[myEnumerate,4]{label=\Roman*.,ref=\themyEnumerateiii.\Roman*}
\setlist[myEnumerate,5]{label=\themyEnumerateiiii.\roman*.,ref = \themyEnumerateiiii.\roman*}
\setlist[myEnumerate,6]{label=(\arabic*)}
\setlist[myEnumerate,7]{label=(\Roman*)}
\setlist[myEnumerate,8]{label=(\Alph*)}
\setlist[myEnumerate,9]{label=(\roman*)}
\newcommand{\ben}{\begin{myEnumerate}}
\newcommand{\een}{\end{myEnumerate}}
%
\newlist{myItemize}{itemize}{9}
\setlist[myItemize]{
    topsep      = 0pt }
\setlist[myItemize,1]{label=\textbullet}
\setlist[myItemize,2]{label=---}
\setlist[myItemize,3]{label=---}
\setlist[myItemize,4]{label=---}
\setlist[myItemize,5]{label=---}
\setlist[myItemize,6]{label=---}
\setlist[myItemize,7]{label=---}
\setlist[myItemize,8]{label=---}
\setlist[myItemize,9]{label=---}
\newcommand{\bit}{\begin{myItemize}}
\newcommand{\eit}{\end{myItemize}}


\begin{document}

\section{Main section}

\section{Subsection}
\ben 
  \item item level 1
  \ben
  \item item level 2
    \bit 
    \item item level 3
      \bit
	\item item level 4
	  \bit
          \item item level 5
            \bit
              \item item level 6
              \bit
                \item item level 7
                  \bit
                  \item item level 8
              \eit
            \eit
          \eit
        \eit
      \eit
    \eit
  \item item level 2
  \een
\item item level 1
\een

\end{document}
