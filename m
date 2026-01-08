Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491C83ACF05;
	Thu,  8 Jan 2026 08:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767860662; cv=none; b=neijI7rLPzdL29zCCrssJiMAVDClFCEU5A2Jug4Gfk87PezL/xih0N8nQmWgbdQ32BXwjhh2GKIQdphAou+VzMqKlnXKD03pWYzMZNqXq5Dv73rFaOE3oREu5A3L+Ca3FF6AUUy3didDlXcFnjLLs7rMHFvzEMh62NFvx5U4pyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767860662; c=relaxed/simple;
	bh=+PPyYg6oyt1OTEEov1e5FBB4mZA5mhAjz4kZGqxdB24=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B0dpL2niccPB77Ef7wJhrg4+1HNyVPt01GfcYaq9oo93w/kUM/X55XKpq0AD8F1E80QZWV9hMAOUWVMVY1jv/K0Kjd4vY86ZmVtMaJr/oIc55EXaEWLj0jbWjoNZ9ZZtpwDrTbTaCkeg+ORleP2BFwpTpAMZ9Gp9sxUi/dCTbls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SNytNhY2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SNytNhY2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FC35C116D0;
	Thu,  8 Jan 2026 08:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767860661;
	bh=+PPyYg6oyt1OTEEov1e5FBB4mZA5mhAjz4kZGqxdB24=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=SNytNhY2dCvvY9s7rrndIIElIFs27EFPqmMUwCkHExkNzFJlmXRbpgfexy/9z4q3k
	 fvrs+fY6hqGpwu+d2KCWsrF/KooLXOPaF3rb/iz7Tj8ldFWvYNdtPfR3AMwXrK5t9P
	 4g7Yr1EZOBriexWg9HBwA/HxAK2Pg4Z9DunJfbf3pdTPLONad3ZwuQ0DlHe9uvWPPb
	 m1LDpPou1k6vxuGl40nRNnudyifQ6wbh5d3KSY+32er1lQKqd1HJmpaoW0nvaq7yaZ
	 Iiobt2KBbO7jVrREzz4SZWqgebJnoyHgf3ZK3A96mbEtd00R06bjP/UryYHyoSOGiQ
	 ERUQL/Z9xjoVg==
Date: Thu, 8 Jan 2026 09:24:17 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: duchangbin <changbin.du@huawei.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, "linux-doc@vger.kernel.org"
 <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] tools: jobserver: Add validation for jobserver tokens
 to ensure valid '+' characters
Message-ID: <20260108092417.20e97f91@foz.lan>
In-Reply-To: <9ec672bde2cc4b14905175ca22cbb737@huawei.com>
References: <20251225062622.1500046-1-changbin.du@huawei.com>
	<87zf6qcsu1.fsf@trenco.lwn.net>
	<bc19bb55bee34abb990c00c3006c6710@huawei.com>
	<20260107102910.5cad9d7d@foz.lan>
	<aV4zoXfoKJE0Id4e@foz.lan>
	<9ec672bde2cc4b14905175ca22cbb737@huawei.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Em Thu, 8 Jan 2026 02:58:05 +0000
duchangbin <changbin.du@huawei.com> escreveu:

> On Wed, Jan 07, 2026 at 11:42:38AM +0100, Mauro Carvalho Chehab wrote:
> > >=20
> > > It would be nice if you could provide more details about how to repro=
duce it.=20
> > > Are you doing anything special? What distro are you using? what pytho=
n version?
> > >  =20
> > > > When this problem occurs, the current implementation deadlocks beca=
use for regular files,
> > > > os.read() returns empty bytes after reaching EOF, creating an infin=
ite loop. My workaround
> > > > is to ignore this error condition to prevent deadlock, although thi=
s means the jobserver
> > > > protocol will no longer be honored. =20
> > >=20
> > > testing if slot is empty makes sense, but why testing if it is "+"?
> > >  =20
> > > >=20
> > > > As you suggested above, We can output an error message to stderr to=
 inform users, but
> > > > must not use stdout, as it would corrupt the tool's normal output s=
tream. =20
> > >  =20
> >=20
> > After thinking a little bit more about this, IMHO the best is to have
> > two separate patches (assuming that there is a good reason why ensuring=
 that the
> > slot's character is "+"):
> > =20
> > > You could do something like (untested):
> > >=20
> > >              while True:
> > >                  try:
> > >                      slot =3D os.read(self.reader, 8)
> > > +                    if not slot:
> > > +                        # Stop at the end of the jobserver queue.
> > > +                        break =20
> >=20
> > This would be patch 1, to overcome some issue (probably due to Python
> > version) that reading past EOF won't rise an exception. I would very mu=
ch
> > want to see what python version you're using and see if some other
> > exception arose (like EOFError), properly described at the patch descri=
ption.
> > =20
>=20
> My Python is 3.12.3, and GNU Make is 4.3. But I don't think the issue is =
caused
> by the Python interpreter. Instead, my shell opened /etc/passwd for some =
reason
> without closing it, and as a result, all child processes inherited this f=
d3 file
> descriptor.

Maybe there's something weird with your PAM settings and/or /etc/nsswitch.c=
onf. I
saw some issues in the past related to kerberos/ldap/radius/sso timeouts.

>=20
> $ ls -l /proc/self/fd
> total 0
> lrwx------ 1 changbin changbin 64 Jan  8 10:40 0 -> /dev/pts/0
> lrwx------ 1 changbin changbin 64 Jan  8 10:40 1 -> /dev/pts/0
> lrwx------ 1 changbin changbin 64 Jan  8 10:40 2 -> /dev/pts/0
> lr-x------ 1 changbin changbin 64 Jan  8 10:40 3 -> /etc/passwd
> lr-x------ 1 changbin changbin 64 Jan  8 10:40 4 -> /proc/2468162/fd
>=20
> In this case, make should open a new file descriptor for jobserver contro=
l, but
> clearly, it did not do so and instead still passed fd 3. Once I get a cha=
nce,
> I'll look into how Make 4.3 actually works.
>=20
>=20
> > > +                    # Why do we need this?
> > > +                    if any(c !=3D b'+'[0] for c in slot):
> > > +                        print("Warning: invalid jobserver slots", fi=
le=3Dsys.stderr)
> > > +                        break =20
> >=20
> > This seems to be a separate issue. Why do we need to enforce that the s=
lot data
> > is "+"? If it doesn't, why this would be a problem?
> >=20
> > Btw, reading:
> >=20
> >     https://www.gnu.org/software/make/manual/html_node/POSIX-Jobserver.=
html
> >=20
> > We have:
> >=20
> >     "In both implementations of the jobserver, the pipe will be pre-loa=
ded with=20
> >      one single-character token for each available job. To obtain an ex=
tra slot
> >      you must read a single character from the jobserver; to release a =
slot you
> >      must write a single character back into the jobserver.
> >=20
> >      It=E2=80=99s important that when you release the job slot, you wri=
te back the same
> >      character you read. Don=E2=80=99t assume that all tokens are the s=
ame character;
> >      different characters may have different meanings to GNU make. The =
order is
> >      not important, since make has no idea in what order jobs will comp=
lete anyway."
> >=20
> > So, a 100% compliant POSIX jobserver code shall not test for "+", but, =
instead,
> > preserve whatever character is there.
> >=20
> > Yet, checking for "+" is really needed, please add a rationale at the p=
atch
> > description justifying why. On such case, we should still:
> >=20
> >     - release the slot(s) we don't want by writing the character via
> >       os.write();
> >     - print a warning message about why we rejected the slot(s).
> >  =20
> Thank you for the information. I previously misunderstood that reading fr=
om the
> jobserver would only return a '+' symbol, but now it's obviously not the =
case.
> At this point, we seem unable to verify whether it's a valid jobserver fi=
le
> descriptor, so we have to read the entire file contents util EOF.

Agreed. I guess that just checking "if not slot" should be enough for such
purpose.

If you can still reproduce the original issue, I would try that and
see if it works, e.g. this should likely be enough:

                    slot =3D os.read(self.reader, 8)
                    if not slot:
                        # Stop at the end of the jobserver queue.
                        break =20
=09

>=20
> > >                      self.jobs +=3D slot
> > >                  except (OSError, IOError) as e:
> > >                      if e.errno =3D=3D errno.EWOULDBLOCK:
> > >                          # Stop at the end of the jobserver queue.
> > >                          break
> > >                      # If something went wrong, give back the jobs.
> > >                      if self.jobs:
> > >                          os.write(self.writer, self.jobs)
> > >                      raise e
> > >=20
> > > Yet, if os.read() fails or reaches EOF, I would expect that the "exce=
pt" block
> > > would pick it. It sounds to me that it could be some issue with the p=
ython
> > > version you're using.
> > >  =20
> > > > For
> > > > example, in scripts/Makefile.vmlinux_o we have:
> > > >=20
> > > > quiet_cmd_gen_initcalls_lds =3D GEN     $@
> > > >       cmd_gen_initcalls_lds =3D \
> > > >         $(PYTHON3) $(srctree)/scripts/jobserver-exec \
> > > >         $(PERL) $(real-prereqs) > $@
> > > >=20
> > > >  =20
> > > > > >                      self.jobs +=3D slot
> > > > > >                  except (OSError, IOError) as e:
> > > > > >                      if e.errno =3D=3D errno.EWOULDBLOCK:   =20
> > > > >=20
> > > > > Thanks,
> > > > >=20
> > > > > jon   =20
> > > >  =20
> > >=20
> > >=20
> > >=20
> > > Thanks,
> > > Mauro =20
> >=20
> > --=20
> > Thanks,
> > Mauro
> >  =20
>=20



Thanks,
Mauro
