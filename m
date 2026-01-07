Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F5E301701;
	Wed,  7 Jan 2026 09:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767778156; cv=none; b=kYS3bu6Ld7fGlnwOdkKEDZ6+Rrdl2Hlt0EMQwJhTYlhs5E4fCFXGkZjCQRw/4fNt7WVZx76fCfamuEVRTdeDBfRCWaZgOguoBnRciu62aMXf67qQuthNAgLcxzK1R4DfVe+bUMdnglBiKewlwU0CArX7FGI8bZx+97aQQyJyR4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767778156; c=relaxed/simple;
	bh=Kl56TSNPocmBs9zet2ugKNa0L24OHV5xIKtoFO0xIdk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pjffsDifiOUej6Lk/b1qP8BFzk+UBZ3+WdiQdAmrAPeio24OQWVqzdmi+MrNWiMD/BV0WWnT5xq/LfWgTsxKVV4uMk3/U/+6+B1MTCk+Wf/JIY8jnjWdNoMVwrjP2n5ytXWu1mE53FSzPr7CpQmVBvuxRK+rSGVx0qD6JUr24wY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VRwaVaKh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VRwaVaKh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE6A5C4CEF7;
	Wed,  7 Jan 2026 09:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767778156;
	bh=Kl56TSNPocmBs9zet2ugKNa0L24OHV5xIKtoFO0xIdk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=VRwaVaKhOAJUDTWwRfbHckFTROSGHGfisHblGDnbpXP3wbCY+QBSa2x6rJxJWko9N
	 AScjkxIf6zKwoKO0RsSG/NgarkXO36/cdkIYjwD36u3TA3X45Wz73l3mMHzmNdZqjG
	 tz+P80V7JR5eeKS21VBx6RCZVek0DufWGF4LqjH8Rk2PWsm8ub0Mip4qjqOdDbnh1L
	 vSPWGmHQ4lcsqe/nMstw8z5t/a29C30FYnhDrCxLRyQ1VGIoGuXb/t7oAOuiAnAhaV
	 ngGzl3XH4Owlh8Ry/dZhlc4E37Q5yF4Hulw9n2ZHnQind+DEM8cWCYfyG9/WXT83wL
	 nyB28fl6xpR6g==
Date: Wed, 7 Jan 2026 10:29:10 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: duchangbin <changbin.du@huawei.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, "linux-doc@vger.kernel.org"
 <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] tools: jobserver: Add validation for jobserver tokens
 to ensure valid '+' characters
Message-ID: <20260107102910.5cad9d7d@foz.lan>
In-Reply-To: <bc19bb55bee34abb990c00c3006c6710@huawei.com>
References: <20251225062622.1500046-1-changbin.du@huawei.com>
	<87zf6qcsu1.fsf@trenco.lwn.net>
	<bc19bb55bee34abb990c00c3006c6710@huawei.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Wed, 7 Jan 2026 08:11:29 +0000
duchangbin <changbin.du@huawei.com> escreveu:

> On Tue, Jan 06, 2026 at 02:52:06PM -0700, Jonathan Corbet wrote:
> > Changbin Du <changbin.du@huawei.com> writes:
> >   
> > > Add validation for jobserver tokens to prevent infinite loops on invalid fds
> > > When using GNU Make's jobserver feature in kernel builds, a bug in MAKEFLAGS
> > > propagation caused "--jobserver-auth=3,4" to reference an unintended file
> > > descriptor (Here, fd 3 was inherited from a shell command that opened
> > > "/etc/passwd" instead of a valid pipe). This led to infinite loops in
> > > jobserver-exec's os.read() calls due to empty or corrupted tokens. (The
> > > version of my make is 4.3)
> > >
> > > $ ls -l /proc/self/fd
> > > total 0
> > > lrwx------ 1 changbin changbin 64 Dec 25 13:03 0 -> /dev/pts/1
> > > lrwx------ 1 changbin changbin 64 Dec 25 13:03 1 -> /dev/pts/1
> > > lrwx------ 1 changbin changbin 64 Dec 25 13:03 2 -> /dev/pts/1
> > > lr-x------ 1 changbin changbin 64 Dec 25 13:03 3 -> /etc/passwd
> > > lr-x------ 1 changbin changbin 64 Dec 25 13:03 4 -> /proc/1421383/fd
> > >
> > > The modified code now explicitly validates tokens:
> > > 1. Rejects empty reads (prevents infinite loops on EOF)
> > > 2. Checks all bytes are '+' characters (catches fd reuse issues)
> > > 3. Raises ValueError with clear diagnostics for debugging
> > > This ensures robustness against invalid jobserver configurations, even when
> > > external tools (like make) incorrectly pass non-pipe file descriptors.
> > >
> > > Signed-off-by: Changbin Du <changbin.du@huawei.com>
> > > ---
> > >  tools/lib/python/jobserver.py | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/tools/lib/python/jobserver.py b/tools/lib/python/jobserver.py
> > > index a24f30ef4fa8..88d005f96bed 100755
> > > --- a/tools/lib/python/jobserver.py
> > > +++ b/tools/lib/python/jobserver.py
> > > @@ -91,6 +91,8 @@ class JobserverExec:
> > >              while True:
> > >                  try:
> > >                      slot = os.read(self.reader, 8)
> > > +                    if not slot or any(c != b'+'[0] for c in slot):
> > > +                        raise ValueError("empty or unexpected token from jobserver")  
> > 
> > So I had to stare at this for a while to figure out what it was doing; a
> > comment might help.
> > 
> > But if it finds something that's not b'+', it simply crashes the whole
> > thing?  Is that really what we want to do?  It would seem better to
> > proceed if we got any slots at all, and to emit a message telling the
> > poor user what they might want to do about the situation?
> >  
> I suspect that in Make versions prior to 4.3, when generating the "--jobserver-auth=r,w"
> parameter, the implementation fails to properly handle situations where file descriptor 3
> is already occupied by the parent process (as I encountered where fd 3 was actually used to
> open /etc/passwd). This appears to force Make to always use fd3 regardless of its
> availability (I'm not sure how Make was written). In contrast, Make 4.4+ versions
> default to using named pipes, which avoids this issue entirely.

It would be nice if you could provide more details about how to reproduce it. 
Are you doing anything special? What distro are you using? what python version?

> When this problem occurs, the current implementation deadlocks because for regular files,
> os.read() returns empty bytes after reaching EOF, creating an infinite loop. My workaround
> is to ignore this error condition to prevent deadlock, although this means the jobserver
> protocol will no longer be honored.

testing if slot is empty makes sense, but why testing if it is "+"?

> 
> As you suggested above, We can output an error message to stderr to inform users, but
> must not use stdout, as it would corrupt the tool's normal output stream.

You could do something like (untested):

             while True:
                 try:
                     slot = os.read(self.reader, 8)
+                    if not slot:
+                        # Stop at the end of the jobserver queue.
+                        break
+                    # Why do we need this?
+                    if any(c != b'+'[0] for c in slot):
+                        print("Warning: invalid jobserver slots", file=sys.stderr)
+                        break
                     self.jobs += slot
                 except (OSError, IOError) as e:
                     if e.errno == errno.EWOULDBLOCK:
                         # Stop at the end of the jobserver queue.
                         break
                     # If something went wrong, give back the jobs.
                     if self.jobs:
                         os.write(self.writer, self.jobs)
                     raise e

Yet, if os.read() fails or reaches EOF, I would expect that the "except" block
would pick it. It sounds to me that it could be some issue with the python
version you're using.

> For
> example, in scripts/Makefile.vmlinux_o we have:
> 
> quiet_cmd_gen_initcalls_lds = GEN     $@
>       cmd_gen_initcalls_lds = \
>         $(PYTHON3) $(srctree)/scripts/jobserver-exec \
>         $(PERL) $(real-prereqs) > $@
> 
> 
> > >                      self.jobs += slot
> > >                  except (OSError, IOError) as e:
> > >                      if e.errno == errno.EWOULDBLOCK:  
> > 
> > Thanks,
> > 
> > jon  
> 



Thanks,
Mauro
