Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0766318B0A
	for <linux-doc@vger.kernel.org>; Sat, 17 Jan 2026 10:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768646701; cv=none; b=WIpMMatYEd7HXhJhsBy9BODP1MXWzSSnZsO4PAvrcjOMiX54L/bkU7Jtpqnj/pe1660zFKASEV4u2BKOqq3+OMDXXwAUc+sTQdTi/xkGTBOvTtseaXj383tY5NFh79TqWMiJMgqn8yqw0MNlvx/wxPh7iY391hR5+Tw7XtzPLLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768646701; c=relaxed/simple;
	bh=oJ+JZAEwluS02XPTByYwDWPhOpttqnCZwFMCpppqXI0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jSeBV662HyUbCXc7tNDtGBqocPgfIIZlAKL3Ph3SjOQqZokpRjcwDjCFrWNYcHg2DYyHpcoCq4ihDSaSPctYeBRxKo7uZPUF9NI/huZx4vWTwyKGyypTBWJppcZt35UBZyaGbdZRsRdpfotSRhLJeiNT+mBTlP/81ghbQgxeQLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qYafz7p/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qYafz7p/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8552DC4CEF7;
	Sat, 17 Jan 2026 10:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768646700;
	bh=oJ+JZAEwluS02XPTByYwDWPhOpttqnCZwFMCpppqXI0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qYafz7p/FYkbsfgg3BksStG3zXACS/k7ZQu2zLOSMiphjOzzcX8An1IOkafhZ/l5F
	 oFr1gGkxlj8gYgBZG+1KmAlt/01djwOH1XQvDsT0xvGJc+X32SSUKj3FYSf79o8wmO
	 v4Iv6yqftlHBlNC0OUh4z8BWpnh1+bqQoAZ3akhnA55XkdfCO41BnyOQYXcUdv3V3q
	 xXN+/7RwzMpKaL3naQ4Zdo4oZ3ShbP+2dQ0JsCZKkWmj0K3bk8/A8Vz8RUSNgHBHDB
	 kdQr+4bVfynuPI8JKePFk7tRmadg3uIxVEjpLjeNK7OFK3TYave5GOZzlKJdv4lvmO
	 TkGDtNwycIrrQ==
Date: Sat, 17 Jan 2026 11:44:56 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Changbin Du <changbin.du@huawei.com>
Subject: Re: [PATCH v3] Rework the jobserver open logic
Message-ID: <20260117114456.48121ec0@foz.lan>
In-Reply-To: <20260117113632.18b19b4f@foz.lan>
References: <875x91pid4.fsf@trenco.lwn.net>
	<20260117113632.18b19b4f@foz.lan>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Sat, 17 Jan 2026 11:36:38 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:

> Em Fri, 16 Jan 2026 10:39:19 -0700
> Jonathan Corbet <corbet@lwn.net> escreveu:
> 
> > The parsing of jobserver options is done in a massive try: block that hides
> > problems and (perhaps) bugs.  Split up that block and make the logic
> > explicit by moving the initial parsing of MAKEFLAGS out of that block.  Add
> > warnings in the places things can go wrong.
> > 
> > Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > Signed-off-by: Jonathan Corbet <corbet@lwn.net>
> > ---
> > Changes in v3:
> >   - Let warn() take multiple arguments
> >   - Fix syntactic brown-paper-bag error
> > 
> >  tools/lib/python/jobserver.py | 143 +++++++++++++++++++++-------------
> >  1 file changed, 90 insertions(+), 53 deletions(-)
> > 
> > diff --git a/tools/lib/python/jobserver.py b/tools/lib/python/jobserver.py
> > index 616411087725..7659b93fd566 100755
> > --- a/tools/lib/python/jobserver.py
> > +++ b/tools/lib/python/jobserver.py
> > @@ -35,6 +35,9 @@ import os
> >  import subprocess
> >  import sys
> >  
> > +def warn(text, *args):
> > +    print(f'WARNING: {text}', *args, file = sys.stderr)  
> 
> Nit:
> pylint would complain about that: it should be "file=sys.stderr".
> 
> Heh, we should really write a coding style for python and define
> what linter we would use, if any ;-)
> 
> > +
> >  class JobserverExec:
> >      """
> >      Claim all slots from make using POSIX Jobserver.
> > @@ -58,64 +61,98 @@ class JobserverExec:
> >  
> >          if self.is_open:
> >              return
> > -
> > -        try:
> > -            # Fetch the make environment options.
> > -            flags = os.environ["MAKEFLAGS"]
> > -            # Look for "--jobserver=R,W"
> > -            # Note that GNU Make has used --jobserver-fds and --jobserver-auth
> > -            # so this handles all of them.
> > -            opts = [x for x in flags.split(" ") if x.startswith("--jobserver")]
> > -
> > -            # Parse out R,W file descriptor numbers and set them nonblocking.
> > -            # If the MAKEFLAGS variable contains multiple instances of the
> > -            # --jobserver-auth= option, the last one is relevant.
> > -            fds = opts[-1].split("=", 1)[1]
> > -
> > -            # Starting with GNU Make 4.4, named pipes are used for reader
> > -            # and writer.
> > -            # Example argument: --jobserver-auth=fifo:/tmp/GMfifo8134
> > -            _, _, path = fds.partition("fifo:")
> > -
> > -            if path:
> > +        self.is_open = True  # We only try once
> > +        self.claim = None
> > +        #
> > +        # Check the make flags for "--jobserver=R,W"
> > +        # Note that GNU Make has used --jobserver-fds and --jobserver-auth
> > +        # so this handles all of them.
> > +        #
> > +        flags = os.environ.get('MAKEFLAGS', '')
> > +        opts = [x for x in flags.split(" ") if x.startswith("--jobserver")]
> > +        if not opts:
> > +            return
> > +        #
> > +        # Separate out the provided file descriptors
> > +        #
> > +        split_opt = opts[-1].split('=', 1)
> > +        if len(split_opt) != 2:
> > +            warn('unparseable option:', opts[-1])
> > +            return
> > +        fds = split_opt[1]
> > +        #
> > +        # As of GNU Make 4.4, we'll be looking for a named pipe
> > +        # identified as fifo:path
> > +        #
> > +        if fds.startswith('fifo:'):
> > +            path = fds[len('fifo:'):]
> > +            try:
> >                  self.reader = os.open(path, os.O_RDONLY | os.O_NONBLOCK)
> >                  self.writer = os.open(path, os.O_WRONLY)
> > -            else:
> > -                self.reader, self.writer = [int(x) for x in fds.split(",", 1)]
> > +            except (OSError, IOError):
> > +                warn('unable to open jobserver pipe', path)
> > +                return
> > +        #
> > +        # Otherwise look for integer file-descriptor numbers.
> > +        #
> > +        else:
> > +            split_fds = fds.split(',')
> > +            if len(split_fds) != 2:
> > +                warn('malformed jobserver file descriptors:', fds)
> > +                return
> > +            try:
> > +                self.reader = int(split_fds[0])
> > +                self.writer = int(split_fds[1])
> > +            except ValueError:
> > +                warn('non-integer jobserver file-descriptors:', fds)
> > +                return
> > +            try:
> > +                #
> >                  # Open a private copy of reader to avoid setting nonblocking
> >                  # on an unexpecting process with the same reader fd.
> > -                self.reader = os.open("/proc/self/fd/%d" % (self.reader),
> > +                #
> > +                self.reader = os.open(f"/proc/self/fd/{self.reader}",
> >                                        os.O_RDONLY | os.O_NONBLOCK)
> > -
> > -            # Read out as many jobserver slots as possible
> > -            while True:
> > -                try:
> > -                    slot = os.read(self.reader, 8)
> > -                    if not slot:
> > -                        # Clear self.jobs to prevent us from probably writing incorrect file.
> > -                        self.jobs = b""
> > -                        raise ValueError("unexpected empty token from jobserver fd, invalid '--jobserver-auth=' setting?")
> > -                    self.jobs += slot
> > -                except (OSError, IOError) as e:
> > -                    if e.errno == errno.EWOULDBLOCK:
> > -                        # Stop at the end of the jobserver queue.
> > -                        break
> > -                    # If something went wrong, give back the jobs.
> > -                    if self.jobs:
> > -                        os.write(self.writer, self.jobs)
> > -                    raise e
> > -
> > -            # Add a bump for our caller's reserveration, since we're just going
> > -            # to sit here blocked on our child.
> > -            self.claim = len(self.jobs) + 1
> > -
> > -        except (KeyError, IndexError, ValueError, OSError, IOError) as e:
> > -            print(f"jobserver: warning: {repr(e)}", file=sys.stderr)
> > -            # Any missing environment strings or bad fds should result in just
> > -            # not being parallel.
> > -            self.claim = None
> > -
> > -        self.is_open = True
> > +            except (IOError, OSError):
> > +                warn('Unable to reopen jobserver read-side pipe')  
> 
> I would add {repr(e)} here, to allow debugging what error was raised:
> 
> 	warn(f"Unable to reopen jobserver read-side pipe: {repr(e)}")
> 
> (or pass it via args, as the logic below)
> 
> > +                return
> > +        #
> > +        # OK, we have the channel to the job server; read out as many jobserver
> > +        # slots as possible.
> > +        #
> > +        while True:
> > +            try:
> > +                slot = os.read(self.reader, 8)
> > +                if not slot:
> > +                    #
> > +                    # Something went wrong.  Clear self.jobs to avoid writing
> > +                    # weirdness back to the jobserver and give up.
> > +                    self.jobs = b""
> > +                    warn("unexpected empty token from jobserver;"
> > +                         " possible invalid '--jobserver-auth=' setting")  
> 
> Maybe you should print "opts" here as well.
> 
> > +                    self.claim = None
> > +                    return
> > +            except (OSError, IOError) as e:
> > +                #
> > +                # If there is nothing more to read then we are done.
> > +                #
> > +                if e.errno == errno.EWOULDBLOCK:
> > +                    break
> > +                #
> > +                # Anything else says that something went weird; give back
> > +                # the jobs and give up.
> > +                #
> > +                if self.jobs:
> > +                    os.write(self.writer, self.jobs)
> > +                    self.claim = None
> > +                    warn('error reading from jobserver pipe', e)

Forgot to mention: instead of passing "e" (which would be converted
internally to str(e), better to pass repr(e).

The difference is that, when you use repr(e), it will print:

	<error subclass>: <error description>

e.g. something like (*):

	BrokenPipeError: Pipe not found

Having the error class at the beginning helps a lot if in the future we 
would need to fine tune it.

(*) I just picked a random OSError subclass from 

	https://docs.python.org/3/library/exceptions.html#os-exceptions

    just for the sake of the example

> > +                    return
> > +            self.jobs += slot
> > +        #
> > +        # Add a bump for our caller's reserveration, since we're just going
> > +        # to sit here blocked on our child.
> > +        #
> > +        self.claim = len(self.jobs) + 1
> >  
> >      def close(self):
> >          """Return all reserved slots to Jobserver"""  
> 
> 
> 
> Thanks,
> Mauro



Thanks,
Mauro
