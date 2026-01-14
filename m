Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110BE2F39B8
	for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 20:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768422536; cv=none; b=iTvHcuiUIJ1AlTPTYtGjZXhB2n5A+j86t3RnFCte2QauEq1t0sniQAmonYS9xc1VDjh4jiTsrQsuzSM73cCkuEHRIFjv7EEqF1AW+me8s62M80Dvuh/RuVtE2JQMfnnsCjWiK5bYpLL8lOCZL9Ge5vMvU1AVisB2Cfznn8eBl7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768422536; c=relaxed/simple;
	bh=r67WnsFyyUPruDTCFF05MAP/z3gNqrMDQ0bcJZBalWE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LhLuV2Q+bYtY1ObtKeQq+TQhFw4x7BTSeKPGL+N0E2z3ruIj5G3U9DeZm+iqIf10/hsQPgUayWkdq9JRjeTTRiL3Lq1lRGdGfm4NKwmSnT8gYre558sFKz9WeFQi6r29bJWmG/2DBfsC6UZbNppZmWU/VN8bUSHV4hZCnaaidHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sIpQB95t; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sIpQB95t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FAA9C4CEF7;
	Wed, 14 Jan 2026 20:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768422535;
	bh=r67WnsFyyUPruDTCFF05MAP/z3gNqrMDQ0bcJZBalWE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=sIpQB95tPxX81EuE/CzLojUYAPlr9klr5x88hebfY87dieSXl4EpZpbLS/M5OK43V
	 HMZ3njnMcZY3x9+3hnt0T8cfSaMLROCXuoOQwX5NCl2H6ADTm8vCVTeSjd8fQIgFIr
	 j2hApHbIaCPs1Z2+oFCl4ofVXrhIiRBDo82bEiegptaTkDbVLzvQ2q4juc0DY9X5V4
	 perak6wRKR8E6PJrIERU1X4QArD/6HaBm0gQenwB4tJ8CuGnVrBDLk8n1fLGuDjF6j
	 L6OhFglGYaX9aWM4FETsv1FYPe6t5seoZ4mPLFhGDYjVrZo0Rzajpxbd/NIFNfFJE5
	 x6GJEL9LVWtUQ==
Date: Wed, 14 Jan 2026 21:28:51 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Changbin Du <changbin.du@huawei.com>
Subject: Re: [PATCH v2] Rework the jobserver open logic
Message-ID: <20260114212851.77d67dcd@foz.lan>
In-Reply-To: <87cy3cup9s.fsf@trenco.lwn.net>
References: <87cy3cup9s.fsf@trenco.lwn.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Wed, 14 Jan 2026 09:34:23 -0700
Jonathan Corbet <corbet@lwn.net> escreveu:

> The parsing of jobserver options is done in a massive try: block that hides
> problems and (perhaps) bugs.  Split up that block and make the logic
> explicit by moving the initial parsing of MAKEFLAGS out of that block.  Add
> warnings in the places things can go wrong.
> 
> Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Signed-off-by: Jonathan Corbet <corbet@lwn.net>
> ---
> v2 changes: send warnings to stderr, s/5/len('fifo:')/.
> 
>  tools/lib/python/jobserver.py | 143 +++++++++++++++++++++-------------
>  1 file changed, 90 insertions(+), 53 deletions(-)
> 
> diff --git a/tools/lib/python/jobserver.py b/tools/lib/python/jobserver.py
> index 616411087725e..bcaff993d0bec 100755
> --- a/tools/lib/python/jobserver.py
> +++ b/tools/lib/python/jobserver.py
> @@ -35,6 +35,9 @@ import os
>  import subprocess
>  import sys
>  
> +def warn(text):
> +    print(text, file = sys.stderr)
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
> +            warn('WARNING: unparseable option:', opts[-1])
> +            return
> +        fds = split_opt[1]
> +        #
> +        # As of GNU Make 4.4, we'll be looking for a named pipe
> +        # identified as fifo:path
> +        #
> +        if fds.startswith('fifo:'):
> +            path = fds[len('fifo:':]

I would prefer to encapulate "fifo:" on a var.

With or without such change:

Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

> +            try:
>                  self.reader = os.open(path, os.O_RDONLY | os.O_NONBLOCK)
>                  self.writer = os.open(path, os.O_WRONLY)
> -            else:
> -                self.reader, self.writer = [int(x) for x in fds.split(",", 1)]
> +            except (OSError, IOError):
> +                warn('WARNING: unable to open jobserver pipe', path)
> +                return
> +        #
> +        # Otherwise look for integer file-descriptor numbers.
> +        #
> +        else:
> +            split_fds = fds.split(',')
> +            if len(split_fds) != 2:
> +                warn('WARNING: malformed jobserver file descriptors:', fds)
> +                return
> +            try:
> +                self.reader = int(split_fds[0])
> +                self.writer = int(split_fds[1])
> +            except ValueError:
> +                warn('WARNING: non-integer jobserver file-descriptors:', fds)
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
> +                warn('WARNING: Unable to reopen jobserver read-side pipe')
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
> +                    warn("WARNING: unexpected empty token from jobserver;"
> +                         " possible invalid '--jobserver-auth=' setting")
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
> +                    warn('WARNING: error reading from jobserver pipe', e)
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
