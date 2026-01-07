Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E09D322B75;
	Wed,  7 Jan 2026 10:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767783263; cv=none; b=r2KZfzrQudeKaQGONtUOu4xKy7n7pEjkvXG83HJqNrbYpdt8bODoKwUuUfunDsAw/jeJDWtKlMlDZMQUJ4R62YYufbmFwEh136LbpoMZ936TEDh8fm+x+EkSs1tKLk/Oh3iasoNl8rUFwJI1W72gldnXPnuBEoYV+j/QN4uiUSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767783263; c=relaxed/simple;
	bh=2WRUu7nryWgzUE4Vhkua2ZhSDOSeO/gPOyXRHaRTt4w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PcNl8cv31lgFPiQ849HiIzbvJZojtPNIwuginOBRK5EDIgogJFuJgjkjTyHNsVU20RXwoA7SMxTCiXVkwEfIExMszoIEk8PzM/R5lH4JcmZobzz6AH0mOz9IxT/43xH3h8RPBxvHQvVt2EfgKpxpvUjo7M+SRAC8cvzei3DxbTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ix/SqrNg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ix/SqrNg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E38D8C16AAE;
	Wed,  7 Jan 2026 10:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767783263;
	bh=2WRUu7nryWgzUE4Vhkua2ZhSDOSeO/gPOyXRHaRTt4w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ix/SqrNgyC7R27cCEjEGt9MKAfvrD7jpheJ9LWnksx/MdWLQ0nCwKj8bvO38suCix
	 XxTkrDE0ELmM3BljDVuOlopyL+IVhbyCarecbM96X5gVItXE81XY00lYyT9fB4rYCl
	 7GJ9WVif49dg+77/5lkv7IPgu1OVP4G7kFdnnhz1sggevZPwRolAKDg/sHgQC54QHh
	 DYLmT76jHuCdxmgvJG+cLxuR2wxfojsAgRdRh6Sa4B8NmMBcGE6Cr9+ihtFwwdz0VK
	 2OeG0vP+XYL83x3lTn8D9Hd9Ov6JKuOjQxB+etwNLt4xA8xN2c47umMg/xHgLLAwqG
	 Abk1bpJncG64Q==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vdRBE-000000011b1-3RyJ;
	Wed, 07 Jan 2026 11:54:20 +0100
Date: Wed, 7 Jan 2026 11:54:20 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: duchangbin <changbin.du@huawei.com>, Jonathan Corbet <corbet@lwn.net>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] tools: jobserver: Add validation for jobserver tokens to
 ensure valid '+' characters
Message-ID: <aV46vxPWEKs7_eW5@foz.lan>
References: <20251225062622.1500046-1-changbin.du@huawei.com>
 <87zf6qcsu1.fsf@trenco.lwn.net>
 <bc19bb55bee34abb990c00c3006c6710@huawei.com>
 <20260107102910.5cad9d7d@foz.lan>
 <aV4zoXfoKJE0Id4e@foz.lan>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aV4zoXfoKJE0Id4e@foz.lan>
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

On Wed, Jan 07, 2026 at 11:42:38AM +0100, Mauro Carvalho Chehab wrote:
> On Wed, Jan 07, 2026 at 10:29:10AM +0100, Mauro Carvalho Chehab wrote:
> > Em Wed, 7 Jan 2026 08:11:29 +0000
> > duchangbin <changbin.du@huawei.com> escreveu:
> > 
> > > On Tue, Jan 06, 2026 at 02:52:06PM -0700, Jonathan Corbet wrote:
> > > > Changbin Du <changbin.du@huawei.com> writes:
> > > >   
> > > > > Add validation for jobserver tokens to prevent infinite loops on invalid fds
> > > > > When using GNU Make's jobserver feature in kernel builds, a bug in MAKEFLAGS
> > > > > propagation caused "--jobserver-auth=3,4" to reference an unintended file
> > > > > descriptor (Here, fd 3 was inherited from a shell command that opened
> > > > > "/etc/passwd" instead of a valid pipe). This led to infinite loops in
> > > > > jobserver-exec's os.read() calls due to empty or corrupted tokens. (The
> > > > > version of my make is 4.3)
> > > > >
> > > > > $ ls -l /proc/self/fd
> > > > > total 0
> > > > > lrwx------ 1 changbin changbin 64 Dec 25 13:03 0 -> /dev/pts/1
> > > > > lrwx------ 1 changbin changbin 64 Dec 25 13:03 1 -> /dev/pts/1
> > > > > lrwx------ 1 changbin changbin 64 Dec 25 13:03 2 -> /dev/pts/1
> > > > > lr-x------ 1 changbin changbin 64 Dec 25 13:03 3 -> /etc/passwd
> > > > > lr-x------ 1 changbin changbin 64 Dec 25 13:03 4 -> /proc/1421383/fd
> > > > >
> > > > > The modified code now explicitly validates tokens:
> > > > > 1. Rejects empty reads (prevents infinite loops on EOF)
> > > > > 2. Checks all bytes are '+' characters (catches fd reuse issues)
> > > > > 3. Raises ValueError with clear diagnostics for debugging
> > > > > This ensures robustness against invalid jobserver configurations, even when
> > > > > external tools (like make) incorrectly pass non-pipe file descriptors.
> > > > >
> > > > > Signed-off-by: Changbin Du <changbin.du@huawei.com>
> > > > > ---
> > > > >  tools/lib/python/jobserver.py | 2 ++
> > > > >  1 file changed, 2 insertions(+)
> > > > >
> > > > > diff --git a/tools/lib/python/jobserver.py b/tools/lib/python/jobserver.py
> > > > > index a24f30ef4fa8..88d005f96bed 100755
> > > > > --- a/tools/lib/python/jobserver.py
> > > > > +++ b/tools/lib/python/jobserver.py
> > > > > @@ -91,6 +91,8 @@ class JobserverExec:
> > > > >              while True:
> > > > >                  try:
> > > > >                      slot = os.read(self.reader, 8)
> > > > > +                    if not slot or any(c != b'+'[0] for c in slot):
> > > > > +                        raise ValueError("empty or unexpected token from jobserver")  
> > > > 
> > > > So I had to stare at this for a while to figure out what it was doing; a
> > > > comment might help.
> > > > 
> > > > But if it finds something that's not b'+', it simply crashes the whole
> > > > thing?  Is that really what we want to do?  It would seem better to
> > > > proceed if we got any slots at all, and to emit a message telling the
> > > > poor user what they might want to do about the situation?
> > > >  
> > > I suspect that in Make versions prior to 4.3, when generating the "--jobserver-auth=r,w"
> > > parameter, the implementation fails to properly handle situations where file descriptor 3
> > > is already occupied by the parent process (as I encountered where fd 3 was actually used to
> > > open /etc/passwd). This appears to force Make to always use fd3 regardless of its
> > > availability (I'm not sure how Make was written). In contrast, Make 4.4+ versions
> > > default to using named pipes, which avoids this issue entirely.
> > 
> > It would be nice if you could provide more details about how to reproduce it. 
> > Are you doing anything special? What distro are you using? what python version?
> > 
> > > When this problem occurs, the current implementation deadlocks because for regular files,
> > > os.read() returns empty bytes after reaching EOF, creating an infinite loop. My workaround
> > > is to ignore this error condition to prevent deadlock, although this means the jobserver
> > > protocol will no longer be honored.
> > 
> > testing if slot is empty makes sense, but why testing if it is "+"?
> > 
> > > 
> > > As you suggested above, We can output an error message to stderr to inform users, but
> > > must not use stdout, as it would corrupt the tool's normal output stream.
> > 
> 
> After thinking a little bit more about this, IMHO the best is to have
> two separate patches (assuming that there is a good reason why ensuring that the
> slot's character is "+"):
> 
> > You could do something like (untested):
> > 
> >              while True:
> >                  try:
> >                      slot = os.read(self.reader, 8)
> > +                    if not slot:
> > +                        # Stop at the end of the jobserver queue.
> > +                        break
> 
> This would be patch 1, to overcome some issue (probably due to Python
> version) that reading past EOF won't rise an exception. I would very much
> want to see what python version you're using and see if some other
> exception arose (like EOFError), properly described at the patch description.

Answering myself, EOFError is only for input() method:
    https://docs.python.org/3/library/exceptions.html#EOFError

reading past EOF returns an empty string, so the above check is indeed
needed to avoid an endless loop.

> 
> > +                    # Why do we need this?
> > +                    if any(c != b'+'[0] for c in slot):
> > +                        print("Warning: invalid jobserver slots", file=sys.stderr)
> > +                        break
> 
> This seems to be a separate issue. Why do we need to enforce that the slot data
> is "+"? If it doesn't, why this would be a problem?
> 
> Btw, reading:
> 
>     https://www.gnu.org/software/make/manual/html_node/POSIX-Jobserver.html
> 
> We have:
> 
>     "In both implementations of the jobserver, the pipe will be pre-loaded with 
>      one single-character token for each available job. To obtain an extra slot
>      you must read a single character from the jobserver; to release a slot you
>      must write a single character back into the jobserver.
> 
>      It’s important that when you release the job slot, you write back the same
>      character you read. Don’t assume that all tokens are the same character;
>      different characters may have different meanings to GNU make. The order is
>      not important, since make has no idea in what order jobs will complete anyway."
> 
> So, a 100% compliant POSIX jobserver code shall not test for "+", but, instead,
> preserve whatever character is there.
> 
> Yet, checking for "+" is really needed, please add a rationale at the patch
> description justifying why. On such case, we should still:
> 
>     - release the slot(s) we don't want by writing the character via
>       os.write();
>     - print a warning message about why we rejected the slot(s).
> 
> >                      self.jobs += slot
> >                  except (OSError, IOError) as e:
> >                      if e.errno == errno.EWOULDBLOCK:
> >                          # Stop at the end of the jobserver queue.
> >                          break
> >                      # If something went wrong, give back the jobs.
> >                      if self.jobs:
> >                          os.write(self.writer, self.jobs)
> >                      raise e
> > 
> > Yet, if os.read() fails or reaches EOF, I would expect that the "except" block
> > would pick it. It sounds to me that it could be some issue with the python
> > version you're using.
> > 
> > > For
> > > example, in scripts/Makefile.vmlinux_o we have:
> > > 
> > > quiet_cmd_gen_initcalls_lds = GEN     $@
> > >       cmd_gen_initcalls_lds = \
> > >         $(PYTHON3) $(srctree)/scripts/jobserver-exec \
> > >         $(PERL) $(real-prereqs) > $@
> > > 
> > > 
> > > > >                      self.jobs += slot
> > > > >                  except (OSError, IOError) as e:
> > > > >                      if e.errno == errno.EWOULDBLOCK:  
> > > > 
> > > > Thanks,
> > > > 
> > > > jon  
> > > 
> > 
> > 
> > 
> > Thanks,
> > Mauro
> 
> -- 
> Thanks,
> Mauro

-- 
Thanks,
Mauro
