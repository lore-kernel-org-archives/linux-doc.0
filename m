Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 667C741A8F;
	Sun, 19 Apr 2026 19:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776626986; cv=none; b=BlqEdaC9/VIZDLtf1bcJWRpHlgJhwrcWFoXcUlEGTL8Zay6UOpxOiV9YxLDtKh+xN0CwPUFriovTxmbRf2ezWZ5Z/Ml+LGzJGqd8Lw8eI93CPTLXuFjTmH2dBNYSSHl91TveKg5GdclT79BNFH5A0PIzx1RYEk8/h2nh2/W8fXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776626986; c=relaxed/simple;
	bh=ugv0pNaxeDCXawFG1XZ1CPMt0QwJASt+uX3Vz0z/JMM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dj1fEVUsJuCBW3OguLs5bijVLdq6bF3JD6N4Pm99si6JOB1+43CbIfbdI/dRow8L4alJwgKn1y4YREe7bZHUKmsMrRLJ2yPZkb4VdYkIPsOPXXAF0wXal90mDv3cUOVF8SE/LJSNOkcSyxkUOl6PO9GY3y+Df2WD+6JXEwcuit8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uEzS+Wu2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uEzS+Wu2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3E64C2BCAF;
	Sun, 19 Apr 2026 19:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776626985;
	bh=ugv0pNaxeDCXawFG1XZ1CPMt0QwJASt+uX3Vz0z/JMM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=uEzS+Wu2ldHv4EK4onKyJRhU/KavI3sCo/PeVL//icVdGYR4sXLEAZxwA9o0Ewt5r
	 GYlBquSL1nBNdmDb3ysOsTAapiMf+hJe5vMqhKAgK/y4ZoTwfNNihS7VOb17oiH7u6
	 IsfJPCJxs5qOBaBPpx6/A7GaEUsEQBWpAq0Da56J9a3mqIds+xbGhx1K7umqu6q6lj
	 X/H4cQaHDcuLLc2qDqoCK6BRIvDReJYa6vc2cx4DsmEpMvwOeYu/+XMW/H2cy4tEKo
	 akViqs9o7Skl1PPqcBWo7zKVm+PnuFEaGt1rrY0eQpOltKQpf5YA2tuBY/IoUjknxY
	 vtdoc25c4Kkuw==
Date: Sun, 19 Apr 2026 21:29:40 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Randy Dunlap <rdunlap@infradead.org>, Matteo Croce
 <technoboy85@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Matteo Croce
 <teknoraver@meta.com>
Subject: Re: [PATCH] docs: escape ** glob pattern in MAINTAINERS
 descriptions
Message-ID: <20260419212940.45334562@foz.lan>
In-Reply-To: <87o6jr2d51.fsf@trenco.lwn.net>
References: <20260409223135.10186-1-technoboy85@gmail.com>
	<72487cc4-b5fa-4a07-bcb5-a6ba479161e3@infradead.org>
	<87o6jr2d51.fsf@trenco.lwn.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 10 Apr 2026 06:50:02 -0600
Jonathan Corbet <corbet@lwn.net> wrote:

> Randy Dunlap <rdunlap@infradead.org> writes:
> 
> > Hi,
> >
> > On 4/9/26 3:31 PM, Matteo Croce wrote:  
> >> From: Matteo Croce <teknoraver@meta.com>
> >> 
> >> Escape '**' in the MAINTAINERS descriptions section to prevent
> >> reStructuredText from interpreting it as bold/strong inline markup,
> >> which causes a warning when running 'make htmldocs'.
> >> 
> >> Fixes: 420849332f9f ("get_maintainer: add ** glob pattern support")

It is probably a little too late for that, but do we need "**" pattern?


> >> Signed-off-by: Matteo Croce <teknoraver@meta.com>
> >> ---
> >>  Documentation/sphinx/maintainers_include.py | 3 ++-
> >>  1 file changed, 2 insertions(+), 1 deletion(-)
> >> 
> >> diff --git a/Documentation/sphinx/maintainers_include.py b/Documentation/sphinx/maintainers_include.py
> >> index 519ad18685b2..54f34f47c9ee 100755
> >> --- a/Documentation/sphinx/maintainers_include.py
> >> +++ b/Documentation/sphinx/maintainers_include.py
> >> @@ -89,7 +89,8 @@ class MaintainersInclude(Include):
> >>              output = None
> >>              if descriptions:
> >>                  # Escape the escapes in preformatted text.
> >> -                output = "| %s" % (line.replace("\\", "\\\\"))
> >> +                output = "| %s" % (line.replace("\\", "\\\\")
> >> +                                        .replace("**", "\\**"))
> >>                  # Look for and record field letter to field name mappings:
> >>                  #   R: Designated *reviewer*: FullName <address@domain>
> >>                  m = re.search(r"\s(\S):\s", line)  
> >
> > It's nice to eliminate one warning from 'make htmldocs', so this is good
> > in that regard. However, there are still multiple problems (not Warnings)
> > with '*' characters in the MAINTAINERS file:  
> 
> I've mentioned this before but done nothing about it ... I really wonder
> about the value of bringing in the MAINTAINERS file in the first place.
> Do we think that anybody is reading it in the rendered docs?

Short answer: 

On my view yes.

---

Long answer:

Your question made me re-think if what we're doing is the best way,
so I ended deciding doing some experiments during the weekend.

I think we need to keep it there, but IMO we need to add more
value to it at the rendered docs. I ended doing some tests here,
by first storing maintainers entry into a dict and then playing
with its output.

On my tests (python 3.14), creating a directory "foo" and placing
there just a small index.rst with a TOC and maintainers.rst
and running sphinx-build-wrapper (to avoid performance measurement
noise), I got:

- current generation takes ~13 seconds;
- doing a parsing step to create a dict and increasing string
  size instead of joining lists - time reduced to ~11 seconds,
  to produce the same content;

I then tested 3 different alternatives:

1. Sorting/grouping entries per ML (excluding LKML and giving
   preference to kernel.org where multiple lists are present)
   Time reduced to 9 seconds;

2. doing (1) and using iglob to pick the actual number of files,
   sorting entries inside groups per their number of files. On my
   machine with a fast SSD, time increased to ~12 seconds;

3. converting into a table with two columns:
	- subsystem name;
	- properties (with all fields per subsystem.

   time increased to ~9 seconds.

After looking at the results, IMO (3) offered a nice
look-and-feel, while providing a good performance compromise.

It was also pretty easy to add 46-lines javascript (incluiding SPDX)
to allow filtering the table by any field or subsystem.

I'll likely post later this week a patch series with (3).

Thanks,
Mauro
