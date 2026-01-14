Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5113195E3
	for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 09:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768382449; cv=none; b=Tuj3wrki/glk0nDzSs5wsfu/ZKOZGLTQRsH3ChLJW9lVLkLK9VgC0JkyPabqN9UBkQV6cT9MdJBr7grTLAla0KSgJ+LwI0wFjSuTaePt4fLkyGeh8fKuKdUQHT9kKzzMMDGCyljwa+FXgzFMG8PUOoXI1TUeEVf2Rj4abiemdvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768382449; c=relaxed/simple;
	bh=kT7LNOO+fzVgn6Rp6KL5OLVULaBXKFVJ1aaGueRQ8gs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e5ALGqq5cS/KJ78pH2I9xIj/OaNAFBa0lnOpAJyx0js8bD+MeL9M2UynoGLtJ6ujOKev4lP7DciJ6ZNj1sTWCSgPrsRH8TlGUiBl3na31sPHXthUKahmOBlhGDOcMAtmBxCqecRJQLmi37zH3aiXWYS3CXo+pXjEeu4aFy4f6As=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A5TC7AP9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A5TC7AP9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 507D1C4CEF7;
	Wed, 14 Jan 2026 09:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768382449;
	bh=kT7LNOO+fzVgn6Rp6KL5OLVULaBXKFVJ1aaGueRQ8gs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=A5TC7AP9WaP3MwD9Q37Gig+Bbtf2RPrzTFV8Xrm19lsnz4bmfhhYXNZVAuYgrH6OB
	 1OCH2huvSlijPmJgS8GkoQG/9bJOVspNGsP2qnzYC4Deajs11wDzVEuI2xstwBjtMr
	 WIik7+p1KTKmeCg44iTC7nG0vnJHM5lMHeZiZVQaJTwENgryVnO4ZcoZSqyIEqS0GI
	 44Dv4W+LOMPdqtai3NjTcCuzRHveF7AR+Z3ZuKh/+5l8AG8My6Iw9uSMIxj3q7h+IV
	 lJ/2VLvWNtCi0+zz80iBD/tAy6W8Pr6IviqcYb3a1pQVo2uqSu65miT+j6kMK6gg/s
	 YMHxYIjMg9UCQ==
Date: Wed, 14 Jan 2026 10:20:45 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Changbin Du <changbin.du@huawei.com>
Subject: Re: [PATCH] Rework the jobserver open logic
Message-ID: <20260114102045.1c164472@foz.lan>
In-Reply-To: <871pjtxn13.fsf@trenco.lwn.net>
References: <871pjtxn13.fsf@trenco.lwn.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Tue, 13 Jan 2026 13:42:16 -0700
Jonathan Corbet <corbet@lwn.net> escreveu:

> The parsing of jobserver options is done in a massive try: block that hides
> problems and (perhaps) bugs.  Split up that block and make the logic
> explicit by moving the initial parsing of MAKEFLAGS out of that block.  Add
> warnings in the places things can go wrong.
> 
> Signed-off-by: Jonathan Corbet <corbet@lwn.net>
> ---
>  tools/lib/python/jobserver.py | 140 +++++++++++++++++++++-------------
>  1 file changed, 87 insertions(+), 53 deletions(-)
> 
> diff --git a/tools/lib/python/jobserver.py b/tools/lib/python/jobserver.py
> index 616411087725e..cd3bddb6e7560 100755
> --- a/tools/lib/python/jobserver.py
> +++ b/tools/lib/python/jobserver.py
> @@ -58,64 +58,98 @@ class JobserverExec:
>  
>          if self.is_open:
>              return
> -
> -        try:
> -            # Fetch the make environment options.
> -            flags = os.environ["MAKEFLAGS"]
> -            # Look for "--jobserver=R,W"
> -            # Note that GNU Make has used --jobserver-fds and --jobserver-auth
> -            # so this handles all of them.
> -            opts = [x for x in flags.split(" ") if x.startswith("--jobserver")]
> -
> -            # Parse out R,W file descriptor numbers and set them nonblocking.
> -            # If the MAKEFLAGS variable contains multiple instances of the
> -            # --jobserver-auth= option, the last one is relevant.
> -            fds = opts[-1].split("=", 1)[1]
> -
> -            # Starting with GNU Make 4.4, named pipes are used for reader
> -            # and writer.
> -            # Example argument: --jobserver-auth=fifo:/tmp/GMfifo8134
> -            _, _, path = fds.partition("fifo:")
> -
> -            if path:
> +        self.is_open = True  # We only try once
> +        self.claim = None
> +        #
> +        # Check the make flags for "--jobserver=R,W"
> +        # Note that GNU Make has used --jobserver-fds and --jobserver-auth
> +        # so this handles all of them.
> +        #
> +        flags = os.environ.get('MAKEFLAGS', '')
> +        opts = [x for x in flags.split(" ") if x.startswith("--jobserver")]
> +        if not opts:
> +            return
> +        #
> +        # Separate out the provided file descriptors
> +        #
> +        split_opt = opts[-1].split('=', 1)
> +        if len(split_opt) != 2:
> +            print('WARNING: unparseable option:', opts[-1])

On all prints, please use file=sys.stderr.

> +            return
> +        fds = split_opt[1]
> +        #
> +        # As of GNU Make 4.4, we'll be looking for a named pipe
> +        # identified as fifo:path
> +        #
> +        if fds.startswith('fifo:'):
> +            path = fds[5:]

Hmm... moving from partition() to startswith might be problematic...
are we sure that "fifo:" can't be in the middle of the string?

If so, instead of using "5" magic number, I would use len("fifo:")

Except for that, the changes looked OK on my eyes (but I didn't
test).

After addressing the above:

Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Thanks,
Mauro
