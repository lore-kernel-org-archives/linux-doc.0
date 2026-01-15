Received: from canpmsgout03.his.huawei.com (canpmsgout03.his.huawei.com [113.46.200.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91DFA224AF9
	for <linux-doc@vger.kernel.org>; Thu, 15 Jan 2026 02:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768445093; cv=none; b=Xww9P26cvwYaTFPt6EIklXQ7BPh+/qDhknpDbjFgxjc+fGd5v5xVRfjDIFWRBc+LVb3QEf/UxrKUXf42burAuWwiD6iLVAo4veidOnSNHIVQf/Ti9K0GmFqEGptNUY+nKSfvcaWye0YkH0VoNc1MSE8+pgrTjKE26Bvoab6AFgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768445093; c=relaxed/simple;
	bh=nwxUtVVTXFFp0GlEA8PLwxKXdGxQdDoEG2VcOETjvjk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=djMLvz/W+Xj5nGfUwLk+eP3umxdXS7AZO454HE1GQtJmFIYxIwaZUYIx3/lC05UWhiinAwaCFty40b2F66zmvECMvQunnG3+v0qpdi4Bw+ygmDOo/oa9MVNmcr7suOTPChNYmbUOSsOMe/JfMxPyc17kGWbrTlH5HRyakpFNPHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=rUmROqKg; arc=none smtp.client-ip=113.46.200.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="rUmROqKg"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=kD8pMqkBnK673OYMoLF+VB1INCUrdii9rwJ0htazQvY=;
	b=rUmROqKgJGqsETmxqK4fGXMRIdc6GEWARDd5BkopL21WCc1SmpDjPww0xaAXkLfBDmpnSppW4
	vX24evip9zcFufZKTx6kCqrkscBilRm2WBifb2jY4YuLk3zUR6uNmjHUDd07cC5HNEWi+apogUZ
	6CUWVLhJNFRBAJtAwXtpl7I=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4ds6g55kYLzpTKw;
	Thu, 15 Jan 2026 10:41:05 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 9A535404AD;
	Thu, 15 Jan 2026 10:44:40 +0800 (CST)
Received: from kwepemq200001.china.huawei.com (7.202.195.16) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 15 Jan 2026 10:44:40 +0800
Received: from kwepemq200002.china.huawei.com (7.202.195.90) by
 kwepemq200001.china.huawei.com (7.202.195.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 15 Jan 2026 10:44:40 +0800
Received: from kwepemq200002.china.huawei.com ([7.202.195.90]) by
 kwepemq200002.china.huawei.com ([7.202.195.90]) with mapi id 15.02.1544.011;
 Thu, 15 Jan 2026 10:44:39 +0800
From: duchangbin <changbin.du@huawei.com>
To: Jonathan Corbet <corbet@lwn.net>
CC: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "Mauro Carvalho
 Chehab" <mchehab@kernel.org>, duchangbin <changbin.du@huawei.com>
Subject: Re: [PATCH v2] Rework the jobserver open logic
Thread-Topic: [PATCH v2] Rework the jobserver open logic
Thread-Index: AQHchXOsuqRhwu5s7E2QncgtxuV6s7VShsKA
Date: Thu, 15 Jan 2026 02:44:39 +0000
Message-ID: <a295bc17877e417b913b27e7bec8ebd6@huawei.com>
References: <87cy3cup9s.fsf@trenco.lwn.net>
In-Reply-To: <87cy3cup9s.fsf@trenco.lwn.net>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: kwepemq200002.china.huawei.com (15.02.1544.011)
x-ms-exchange-messagesentrepresentingtype: 1
Content-Type: text/plain; charset="us-ascii"
Content-ID: <51ABA17553087149AAEFB913B0C89394@huawei.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, Jan 14, 2026 at 09:34:23AM -0700, Jonathan Corbet wrote:
> The parsing of jobserver options is done in a massive try: block that hid=
es
> problems and (perhaps) bugs.  Split up that block and make the logic
> explicit by moving the initial parsing of MAKEFLAGS out of that block.  A=
dd
> warnings in the places things can go wrong.
>=20
> Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Signed-off-by: Jonathan Corbet <corbet@lwn.net>
> ---
> v2 changes: send warnings to stderr, s/5/len('fifo:')/.
>=20
>  tools/lib/python/jobserver.py | 143 +++++++++++++++++++++-------------
>  1 file changed, 90 insertions(+), 53 deletions(-)
>=20
> diff --git a/tools/lib/python/jobserver.py b/tools/lib/python/jobserver.p=
y
> index 616411087725e..bcaff993d0bec 100755
> --- a/tools/lib/python/jobserver.py
> +++ b/tools/lib/python/jobserver.py
> @@ -35,6 +35,9 @@ import os
>  import subprocess
>  import sys
> =20
> +def warn(text):
> +    print(text, file =3D sys.stderr)
Maybe this could be:
       print(f"WARNING: {text}", file =3D sys.stderr)
to unify the warnning messages.

> +
>  class JobserverExec:
>      """
>      Claim all slots from make using POSIX Jobserver.
> @@ -58,64 +61,98 @@ class JobserverExec:
> =20
>          if self.is_open:
>              return
> -
> -        try:
> -            # Fetch the make environment options.
> -            flags =3D os.environ["MAKEFLAGS"]
> -            # Look for "--jobserver=3DR,W"
> -            # Note that GNU Make has used --jobserver-fds and --jobserve=
r-auth
> -            # so this handles all of them.
> -            opts =3D [x for x in flags.split(" ") if x.startswith("--job=
server")]
> -
> -            # Parse out R,W file descriptor numbers and set them nonbloc=
king.
> -            # If the MAKEFLAGS variable contains multiple instances of t=
he
> -            # --jobserver-auth=3D option, the last one is relevant.
> -            fds =3D opts[-1].split("=3D", 1)[1]
> -
> -            # Starting with GNU Make 4.4, named pipes are used for reade=
r
> -            # and writer.
> -            # Example argument: --jobserver-auth=3Dfifo:/tmp/GMfifo8134
> -            _, _, path =3D fds.partition("fifo:")
> -
> -            if path:
> +        self.is_open =3D True  # We only try once
> +        self.claim =3D None
> +        #
> +        # Check the make flags for "--jobserver=3DR,W"
> +        # Note that GNU Make has used --jobserver-fds and --jobserver-au=
th
> +        # so this handles all of them.
> +        #
> +        flags =3D os.environ.get('MAKEFLAGS', '')
> +        opts =3D [x for x in flags.split(" ") if x.startswith("--jobserv=
er")]
> +        if not opts:
> +            return
> +        #
> +        # Separate out the provided file descriptors
> +        #
> +        split_opt =3D opts[-1].split('=3D', 1)
> +        if len(split_opt) !=3D 2:
> +            warn('WARNING: unparseable option:', opts[-1])
Calling the warn() function with two positional arguments, but the function=
 is
defined to accept only one.

> +            return
> +        fds =3D split_opt[1]
> +        #
> +        # As of GNU Make 4.4, we'll be looking for a named pipe
> +        # identified as fifo:path
> +        #
> +        if fds.startswith('fifo:'):
> +            path =3D fds[len('fifo:':]
Missing a parenthesis.
               path =3D fds[len('fifo:'):]

> +            try:
>                  self.reader =3D os.open(path, os.O_RDONLY | os.O_NONBLOC=
K)
>                  self.writer =3D os.open(path, os.O_WRONLY)
> -            else:
> -                self.reader, self.writer =3D [int(x) for x in fds.split(=
",", 1)]
> +            except (OSError, IOError):
> +                warn('WARNING: unable to open jobserver pipe', path)
Ditto.

> +                return
> +        #
> +        # Otherwise look for integer file-descriptor numbers.
> +        #
> +        else:
> +            split_fds =3D fds.split(',')
> +            if len(split_fds) !=3D 2:
> +                warn('WARNING: malformed jobserver file descriptors:', f=
ds)
> +                return
> +            try:
> +                self.reader =3D int(split_fds[0])
> +                self.writer =3D int(split_fds[1])
> +            except ValueError:
> +                warn('WARNING: non-integer jobserver file-descriptors:',=
 fds)
> +                return
> +            try:
> +                #
>                  # Open a private copy of reader to avoid setting nonbloc=
king
>                  # on an unexpecting process with the same reader fd.
> -                self.reader =3D os.open("/proc/self/fd/%d" % (self.reade=
r),
> +                #
> +                self.reader =3D os.open(f"/proc/self/fd/{self.reader}",
>                                        os.O_RDONLY | os.O_NONBLOCK)
> -
> -            # Read out as many jobserver slots as possible
> -            while True:
> -                try:
> -                    slot =3D os.read(self.reader, 8)
> -                    if not slot:
> -                        # Clear self.jobs to prevent us from probably wr=
iting incorrect file.
> -                        self.jobs =3D b""
> -                        raise ValueError("unexpected empty token from jo=
bserver fd, invalid '--jobserver-auth=3D' setting?")
> -                    self.jobs +=3D slot
> -                except (OSError, IOError) as e:
> -                    if e.errno =3D=3D errno.EWOULDBLOCK:
> -                        # Stop at the end of the jobserver queue.
> -                        break
> -                    # If something went wrong, give back the jobs.
> -                    if self.jobs:
> -                        os.write(self.writer, self.jobs)
> -                    raise e
> -
> -            # Add a bump for our caller's reserveration, since we're jus=
t going
> -            # to sit here blocked on our child.
> -            self.claim =3D len(self.jobs) + 1
> -
> -        except (KeyError, IndexError, ValueError, OSError, IOError) as e=
:
> -            print(f"jobserver: warning: {repr(e)}", file=3Dsys.stderr)
> -            # Any missing environment strings or bad fds should result i=
n just
> -            # not being parallel.
> -            self.claim =3D None
> -
> -        self.is_open =3D True
> +            except (IOError, OSError):
> +                warn('WARNING: Unable to reopen jobserver read-side pipe=
')
> +                return
> +        #
> +        # OK, we have the channel to the job server; read out as many jo=
bserver
> +        # slots as possible.
> +        #
> +        while True:
> +            try:
> +                slot =3D os.read(self.reader, 8)
> +                if not slot:
> +                    #
> +                    # Something went wrong.  Clear self.jobs to avoid wr=
iting
> +                    # weirdness back to the jobserver and give up.
> +                    self.jobs =3D b""
> +                    warn("WARNING: unexpected empty token from jobserver=
;"
> +                         " possible invalid '--jobserver-auth=3D' settin=
g")
> +                    self.claim =3D None
> +                    return
> +            except (OSError, IOError) as e:
> +                #
> +                # If there is nothing more to read then we are done.
> +                #
> +                if e.errno =3D=3D errno.EWOULDBLOCK:
> +                    break
> +                #
> +                # Anything else says that something went weird; give bac=
k
> +                # the jobs and give up.
> +                #
> +                if self.jobs:
> +                    os.write(self.writer, self.jobs)
> +                    self.claim =3D None
> +                    warn('WARNING: error reading from jobserver pipe', e=
)
> +                    return
> +            self.jobs +=3D slot
> +        #
> +        # Add a bump for our caller's reserveration, since we're just go=
ing
> +        # to sit here blocked on our child.
> +        #
> +        self.claim =3D len(self.jobs) + 1
> =20
>      def close(self):
>          """Return all reserved slots to Jobserver"""
> --=20
> 2.52.0
>=20

--=20
Cheers,
Changbin Du
