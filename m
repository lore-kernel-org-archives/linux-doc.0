Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4474C34FF70;
	Mon, 12 Jan 2026 16:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768236746; cv=none; b=JqDybD/mj507I/m69OOowKJBr/YK5Ad4sAsaM0KgTK6GZDJrQaxc7zmT9f9bkfEK0i9qBkTViG13b9lq/DftyL56ULdDJWCdK5fYyxdXlPHio0yfVWLIK4Dyc3kHAlsCWPqhEUxbp0QMzl8PC5PPmeRc6J33K4F0ubUZo4nrnzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768236746; c=relaxed/simple;
	bh=kGVNshfUYntRkFNEkDmh2aSrtEYbt+FtswnFkgwqqQE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sAPLxfb3vPFjMc1/NplHQhv0qx2YycY21krJ+F27KQylLHkrKrexkye7XeGRSrLmWFjvt5vFGUDlsBULodRUtNHftdMkpDZJxSxNpVszkUOicoXVmkyjVjCOPn1reNHR5Al7s81wDwm9m79vOB4+ZZfFB0DXy4wV6//8b6wY1Dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fYyfrLYU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fYyfrLYU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70DE1C116D0;
	Mon, 12 Jan 2026 16:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768236746;
	bh=kGVNshfUYntRkFNEkDmh2aSrtEYbt+FtswnFkgwqqQE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=fYyfrLYU0fRytJBvD7zh8n5Dsv/OIcdMxh0Ja6EzuFlwb29mahDLK/n3RqA6RhU+X
	 scKiE6yVy9r4kmS6IJdLDjDHsXepLX4jcJa40PWYl+rqMFtRoplQ6tj+ObDzwPh33V
	 06qixQw0pHEzlJ/wvUWBeAVqR33ueH+FlkawyElJXEsOeIAJei0GGi6jG5mSGZxLWE
	 mQjF5G5iZQ65QRlYMl9D8KFFg/L3/DPKnalclb+vP7w3nh7mtvYBg37IthmdePKUGM
	 MIkzXnmBhU8FTeRIeKvFZLD6TJ58PTNo+8siCsQQgKdxt0an5vR+msa0TD1La0jPf7
	 VcL65a0ZLOM9A==
Date: Mon, 12 Jan 2026 17:52:21 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Changbin Du <changbin.du@huawei.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] tools: jobserver: Prevent deadlock caused by
 incorrect jobserver configuration and enhance error reporting
Message-ID: <20260112175221.2d59c161@foz.lan>
In-Reply-To: <87v7h6241p.fsf@trenco.lwn.net>
References: <20260108113836.2976527-1-changbin.du@huawei.com>
	<874ioq3jad.fsf@trenco.lwn.net>
	<87v7h6241p.fsf@trenco.lwn.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Mon, 12 Jan 2026 09:23:30 -0700
Jonathan Corbet <corbet@lwn.net> escreveu:

> Jonathan Corbet <corbet@lwn.net> writes:
> 
> > The warning comes from JobserverExec::open(), for an exception that
> > appears to be expected.  This is the sort of use of exceptions that has
> > made me almost swear off them entirely in Python - it's a huge try block
> > that is using exceptions to hide a bunch of the assumptions and logic.
> > I'll be posting a patch shortly to remove this non-exceptional exception
> > case.  
> 
> Here's a first step, just to show what I have in mind.
> 
> jon
> 
> From bdbb48e153714ae1c9e5214ba3ecd6142536ee6f Mon Sep 17 00:00:00 2001
> From: Jonathan Corbet <corbet@lwn.net>
> Date: Mon, 12 Jan 2026 09:19:49 -0700
> Subject: [PATCH] jobserver: Begin to split up the big try: block
> 
> The parsing of jobserver options is done in a massive try: block that hides
> problems and (perhaps) bugs.  Start to split up that block and make the
> logic explicit by moving the initial parsing of MAKEFLAGS out of that
> block.

Agreed. Still, I would try to minimize the number of try/except, as those
makes the code more complex to read. 

FYI, when I converted it to a class in a way that it could
be re-used by doc build, I opted, by purpose, to preserve the code
as much as possible, to be bug-compatible with the original version,
but yeah, this big try/except would work better if split.

> Among other things, this removes the warning:
> 
>   jobserver: warning: IndexError('list index out of range')
> 
> Seen after the application of bbf8c67aa6ae8.
> 
> Signed-off-by: Jonathan Corbet <corbet@lwn.net>
> ---
>  tools/lib/python/jobserver.py | 28 ++++++++++++++++++++--------
>  1 file changed, 20 insertions(+), 8 deletions(-)
> 
> diff --git a/tools/lib/python/jobserver.py b/tools/lib/python/jobserver.py
> index 616411087725e..c674319f6cb1f 100755
> --- a/tools/lib/python/jobserver.py
> +++ b/tools/lib/python/jobserver.py
> @@ -58,15 +58,27 @@ class JobserverExec:
>  
>          if self.is_open:
>              return
> -
> +        self.claim = None
> +        self.is_open = True  # We only try once
> +        #
> +        # See what they have told us to do here.
> +        #
> +        try:
> +            flags = os.environ['MAKEFLAGS']
> +        except KeyError:
> +            return

I would use, instead:

	flags = os.environ.get('MAKEFLAGS', '')

No need to have a return there...

> +        #
> +        # Look for "--jobserver=R,W"
> +        # Note that GNU Make has used --jobserver-fds and --jobserver-auth
> +        # so this handles all of them.
> +        #
> +        opts = [x for x in flags.split(" ") if x.startswith("--jobserver")]
> +        if not opts:
> +            return

... as, if MAKEFLAGS is an empty string, opts will be an empty list, causing
it to return.

> +        #
> +        # OK, parse the result.
> +        #
>          try:
> -            # Fetch the make environment options.
> -            flags = os.environ["MAKEFLAGS"]
> -            # Look for "--jobserver=R,W"
> -            # Note that GNU Make has used --jobserver-fds and --jobserver-auth
> -            # so this handles all of them.
> -            opts = [x for x in flags.split(" ") if x.startswith("--jobserver")]
> -
>              # Parse out R,W file descriptor numbers and set them nonblocking.
>              # If the MAKEFLAGS variable contains multiple instances of the
>              # --jobserver-auth= option, the last one is relevant.



Thanks,
Mauro
