Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F3218E10
	for <linux-doc@vger.kernel.org>; Mon, 15 Jan 2024 20:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="BpxeiBqQ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=tVxJxTtN/iaE9EgHzT4x1YMr9SF5sMcaeuSfEKou7wk=; b=BpxeiBqQ5JwcLNQ5tH1D4B80HH
	nGDoYuGjywIQow4BfJNuFG/FrC6K1ccTQhcuMvreDxnGY4VyL9ocn/48IRqxTtOu/LnmImUQ01JQF
	b918oxpPElPS2QSq/SArcw74eVBrTUNwJWUpcDzZdVwpWxdrqdBw4GJATdXDTkQG7Yuxw/zFDCgB2
	LXef6aeamuRQXalOxFOw5gWrI+lLp0yVwkm6THmv+2wfa0ZciUO9NPfGyh6PRdRK4v4pAAz+kC0/2
	xb4s+6uCsxdtqtUF4iOwak+BzD/rAJRlQ9nn7CR0nAOYZB5DsfrW8FYZPYBOjwDqJZ1RRCF8tQCrV
	MrllpdGQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1rPTNa-00AicV-By; Mon, 15 Jan 2024 20:16:18 +0000
Date: Mon, 15 Jan 2024 20:16:18 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	linux-doc@vger.kernel.org
Subject: Re: Help required - kernel-doc, code block and backslash
Message-ID: <ZaWSkvm8qsXgBVEP@casper.infradead.org>
References: <87y1cqbg01.fsf@somnus>
 <87ttnee69t.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ttnee69t.fsf@meer.lwn.net>

On Mon, Jan 15, 2024 at 12:38:38PM -0700, Jonathan Corbet wrote:
> Anna-Maria Behnsen <anna-maria@linutronix.de> writes:
> 
> > Hi,
> >
> > I'll try to integrate some documentation which is already written in
> > code comments into the kernel documentation.
> >
> > There I face the problem with a backslash at the end of a line in a
> > 'code block' and this ends up in removing the newline.
> 
> Yes, kernel-doc does that...looking at the history, that behavior was
> added in 2012 (commit 65478428443) because otherwise multi-line macros
> are not handled properly.
> 
> Fixing this properly is not going to be all that easy; the code reading
> the source file is well before any sort of parsing, so it has no idea of
> whether it's in a comment or not.
> 
> A really ugly workaround... put something relatively inconspicuous, like
> "     .", after the backslash, and at least your formatting won't be
> mangled.

Well ... if we're into "ugly workaround" territory, we could use '^ *'
as a marker for "we're in a comment, ignore the backslash".  My skills
in this area are terrible, so would something like this work?

while (!/^ \*/ && s/\\\s*$//) {

I would try it myself, but Something Changed, and even without it,
I've just started getting:

Sphinx parallel build error:
AssertionError

when I run make htmldocs.

