Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE2419004A
	for <linux-doc@vger.kernel.org>; Sat, 17 Jan 2026 10:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768646202; cv=none; b=jnJB2pXgKmMtlRcXh/JoZByQiMRFFtilC3JWRcrAOJ+htm+byzL2xYWVKEvsmcK1KSks1g+tS2+2yIXrB3cIP+izytzl/TG3JWRQgPeMK03alR9J7qxFGnLgKgJ11/Ox7QmqaM2zH88lUasyGdjktd3+tbLIMB9VKSkPEXXeX2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768646202; c=relaxed/simple;
	bh=G05Jh7CN2A8gMAPAmK6VHx0XNXTbuvS7n5VK3irzfvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W7wxJXPUO6a8b7tep5Z1/vm9fo9l82kUg5CnU/KcodxlYdov5MO/kzHfxcqwuJSmVmMGpOhFYYp2PJUrSRIcOcJSZ5yaHCm5z9+iSjoY60gx90bIDtOUDx2oSRMcGpCdPcwF20Q1EoJFRWdjWPp2519wKHOA5mYQ764AyeS5lUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aY3mnRS0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aY3mnRS0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0604C4CEF7;
	Sat, 17 Jan 2026 10:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768646202;
	bh=G05Jh7CN2A8gMAPAmK6VHx0XNXTbuvS7n5VK3irzfvQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=aY3mnRS0AzZcnu84hzKR0kMTH0MYz2M9EtZQy//9zRvWJynyrr8Rbh1sEbjUk10gV
	 bSiZc9IRO1GoEXu93nuxK83NuOvHRGVVRWDQVXH2FK8YJuUErMsoG34ABAHMSg/fl0
	 WXZbnuC1WqFDj2deO4ApkgsyHWv7GFF4Wr5MCk4E5o8e6LpUpd8AqQVnvsjp2m7sZT
	 6tV5PXpV4ZqC1e6Ryh4Z2cvnTw0nuexrmeB41XSXpUUX8RHz1NlPqKI19vnEXwP5qf
	 rBBRSv2hiNYMPnSIwIfflOdn4i8pYwOI/Thgi3zeH/YYOaYI1tg6hXTEVuxFlznlSU
	 VCaYg6cRsccMA==
Date: Sat, 17 Jan 2026 11:36:38 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Changbin Du <changbin.du@huawei.com>
Subject: Re: [PATCH v3] Rework the jobserver open logic
Message-ID: <20260117113632.18b19b4f@foz.lan>
In-Reply-To: <875x91pid4.fsf@trenco.lwn.net>
References: <875x91pid4.fsf@trenco.lwn.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Fri, 16 Jan 2026 10:39:19 -0700
Jonathan Corbet <corbet@lwn.net> escreveu:

> The parsing of jobserver options is done in a massive try: block that hides
> problems and (perhaps) bugs.  Split up that block and make the logic
> explicit by moving the initial parsing of MAKEFLAGS out of that block.  Add
> warnings in the places things can go wrong.
> 
> Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Signed-off-by: Jonathan Corbet <corbet@lwn.net>
> ---
> Changes in v3:
>   - Let warn() take multiple arguments
>   - Fix syntactic brown-paper-bag error
> 
>  tools/lib/python/jobserver.py | 143 +++++++++++++++++++++-------------
>  1 file changed, 90 insertions(+), 53 deletions(-)
> 
> diff --git a/tools/lib/python/jobserver.py b/tools/lib/python/jobserver.py
> index 616411087725..7659b93fd566 100755
> --- a/tools/lib/python/jobserver.py
> +++ b/tools/lib/python/jobserver.py
> @@ -35,6 +35,9 @@ import os
>  import subprocess
>  import sys
>  
> +def warn(text, *args):
> +    print(f'WARNING: {text}', *args, file = sys.stderr)

Nit:
pylint would complain about that: it should be "file=sys.stderr".

Heh, we should really write a coding style for python and define
what linter we would use, if any ;-)

> +
>  class JobserverExec:
>      """
>      Claim all slots from make using POSIX Jobserver.
> @@ -58,64 +61,98 @@ class JobserverExec:
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
> +            warn('unparseable option:', opts[-1])
> +            return
> +        fds = split_opt[1]
> +        #
> +        # As of GNU Make 4.4, we'll be looking for a named pipe
> +        # identified as fifo:path
> +        #
> +        if fds.startswith('fifo:'):
> +            path = fds[len('fifo:'):]
> +            try:
>                  self.reader = os.open(path, os.O_RDONLY | os.O_NONBLOCK)
>                  self.writer = os.open(path, os.O_WRONLY)
> -            else:
> -                self.reader, self.writer = [int(x) for x in fds.split(",", 1)]
> +            except (OSError, IOError):
> +                warn('unable to open jobserver pipe', path)
> +                return
> +        #
> +        # Otherwise look for integer file-descriptor numbers.
> +        #
> +        else:
> +            split_fds = fds.split(',')
> +            if len(split_fds) != 2:
> +                warn('malformed jobserver file descriptors:', fds)
> +                return
> +            try:
> +                self.reader = int(split_fds[0])
> +                self.writer = int(split_fds[1])
> +            except ValueError:
> +                warn('non-integer jobserver file-descriptors:', fds)
> +                return
> +            try:
> +                #
>                  # Open a private copy of reader to avoid setting nonblocking
>                  # on an unexpecting process with the same reader fd.
> -                self.reader = os.open("/proc/self/fd/%d" % (self.reader),
> +                #
> +                self.reader = os.open(f"/proc/self/fd/{self.reader}",
>                                        os.O_RDONLY | os.O_NONBLOCK)
> -
> -            # Read out as many jobserver slots as possible
> -            while True:
> -                try:
> -                    slot = os.read(self.reader, 8)
> -                    if not slot:
> -                        # Clear self.jobs to prevent us from probably writing incorrect file.
> -                        self.jobs = b""
> -                        raise ValueError("unexpected empty token from jobserver fd, invalid '--jobserver-auth=' setting?")
> -                    self.jobs += slot
> -                except (OSError, IOError) as e:
> -                    if e.errno == errno.EWOULDBLOCK:
> -                        # Stop at the end of the jobserver queue.
> -                        break
> -                    # If something went wrong, give back the jobs.
> -                    if self.jobs:
> -                        os.write(self.writer, self.jobs)
> -                    raise e
> -
> -            # Add a bump for our caller's reserveration, since we're just going
> -            # to sit here blocked on our child.
> -            self.claim = len(self.jobs) + 1
> -
> -        except (KeyError, IndexError, ValueError, OSError, IOError) as e:
> -            print(f"jobserver: warning: {repr(e)}", file=sys.stderr)
> -            # Any missing environment strings or bad fds should result in just
> -            # not being parallel.
> -            self.claim = None
> -
> -        self.is_open = True
> +            except (IOError, OSError):
> +                warn('Unable to reopen jobserver read-side pipe')

I would add {repr(e)} here, to allow debugging what error was raised:

	warn(f"Unable to reopen jobserver read-side pipe: {repr(e)}")

(or pass it via args, as the logic below)

> +                return
> +        #
> +        # OK, we have the channel to the job server; read out as many jobserver
> +        # slots as possible.
> +        #
> +        while True:
> +            try:
> +                slot = os.read(self.reader, 8)
> +                if not slot:
> +                    #
> +                    # Something went wrong.  Clear self.jobs to avoid writing
> +                    # weirdness back to the jobserver and give up.
> +                    self.jobs = b""
> +                    warn("unexpected empty token from jobserver;"
> +                         " possible invalid '--jobserver-auth=' setting")

Maybe you should print "opts" here as well.

> +                    self.claim = None
> +                    return
> +            except (OSError, IOError) as e:
> +                #
> +                # If there is nothing more to read then we are done.
> +                #
> +                if e.errno == errno.EWOULDBLOCK:
> +                    break
> +                #
> +                # Anything else says that something went weird; give back
> +                # the jobs and give up.
> +                #
> +                if self.jobs:
> +                    os.write(self.writer, self.jobs)
> +                    self.claim = None
> +                    warn('error reading from jobserver pipe', e)
> +                    return
> +            self.jobs += slot
> +        #
> +        # Add a bump for our caller's reserveration, since we're just going
> +        # to sit here blocked on our child.
> +        #
> +        self.claim = len(self.jobs) + 1
>  
>      def close(self):
>          """Return all reserved slots to Jobserver"""



Thanks,
Mauro
