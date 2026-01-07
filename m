Received: from canpmsgout10.his.huawei.com (canpmsgout10.his.huawei.com [113.46.200.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D7023EABB;
	Wed,  7 Jan 2026 08:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767773496; cv=none; b=dFQTVvHKkulxI1YBy5IQ93A66AyNmdRXtQvzngKnAFMBGF2s/Xfcj5dxkVieRXSVwROs2NES+pn+ZWUp5GEWpVWvW2iN9ARbNgAMYR+V8f9NssutW19oUEm7lJOx3gW7R4YDA8EU/yGMlSyuHfElK0QPIyeGUvV66KRYIE+ly+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767773496; c=relaxed/simple;
	bh=ztgBUvHy1R8tc0YkTzqSxyNRyuWWu43hlqLGXi94S+4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cObDDpxfmy0Vhj6PzdY5WTslDwwKJrxb8Qb3dd3jvQv3gW49kf6CCm6pU4sXHZHB7khppxN1hqH7SsW53wNM2dwSiJUd4KvNIXffmUm7aR+sNuMoPjmVdmrqbGtWavhQgZ6OCJwLhyDSCecbZ8+TeDRTZPxd+Jr9Wukz+iWarYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=YpVhqku0; arc=none smtp.client-ip=113.46.200.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="YpVhqku0"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=tg04fKuMpgF3sow9K9bUEXpB1EapCK4aQEG6BXZsYcE=;
	b=YpVhqku07Q3u44v/Ne3lqz+RwL875+i2phhLTUhZv5nXOQ8J+vnAVu6iMRTmoEmzX4GrfwtPM
	w/YpNXCzNpefXpGYpJYkXcd4grFeu7hDg5HnmirA0ZIeUB6gWJzbZwUxYID+GFfnVU74qiNzC1W
	sVuIb7+ZV6GyiAa5LxLVmas=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4dmLJK1HYLz1K9Cs;
	Wed,  7 Jan 2026 16:08:17 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id 7E84B40363;
	Wed,  7 Jan 2026 16:11:30 +0800 (CST)
Received: from kwepemq500002.china.huawei.com (7.202.195.240) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 7 Jan 2026 16:11:30 +0800
Received: from kwepemq200002.china.huawei.com (7.202.195.90) by
 kwepemq500002.china.huawei.com (7.202.195.240) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 7 Jan 2026 16:11:29 +0800
Received: from kwepemq200002.china.huawei.com ([7.202.195.90]) by
 kwepemq200002.china.huawei.com ([7.202.195.90]) with mapi id 15.02.1544.011;
 Wed, 7 Jan 2026 16:11:29 +0800
From: duchangbin <changbin.du@huawei.com>
To: Jonathan Corbet <corbet@lwn.net>
CC: duchangbin <changbin.du@huawei.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] tools: jobserver: Add validation for jobserver tokens to
 ensure valid '+' characters
Thread-Topic: [PATCH] tools: jobserver: Add validation for jobserver tokens to
 ensure valid '+' characters
Thread-Index: AQHcdWdrFHx32OniNEiud4ksj7qjorVFPHoAgAEzEIA=
Date: Wed, 7 Jan 2026 08:11:29 +0000
Message-ID: <bc19bb55bee34abb990c00c3006c6710@huawei.com>
References: <20251225062622.1500046-1-changbin.du@huawei.com>
 <87zf6qcsu1.fsf@trenco.lwn.net>
In-Reply-To: <87zf6qcsu1.fsf@trenco.lwn.net>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: kwepemq200002.china.huawei.com (15.02.1544.011)
x-ms-exchange-messagesentrepresentingtype: 1
Content-Type: text/plain; charset="us-ascii"
Content-ID: <5DF65D9CC216CD4AB988E1CF8F9574E8@huawei.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, Jan 06, 2026 at 02:52:06PM -0700, Jonathan Corbet wrote:
> Changbin Du <changbin.du@huawei.com> writes:
>=20
> > Add validation for jobserver tokens to prevent infinite loops on invali=
d fds
> > When using GNU Make's jobserver feature in kernel builds, a bug in MAKE=
FLAGS
> > propagation caused "--jobserver-auth=3D3,4" to reference an unintended =
file
> > descriptor (Here, fd 3 was inherited from a shell command that opened
> > "/etc/passwd" instead of a valid pipe). This led to infinite loops in
> > jobserver-exec's os.read() calls due to empty or corrupted tokens. (The
> > version of my make is 4.3)
> >
> > $ ls -l /proc/self/fd
> > total 0
> > lrwx------ 1 changbin changbin 64 Dec 25 13:03 0 -> /dev/pts/1
> > lrwx------ 1 changbin changbin 64 Dec 25 13:03 1 -> /dev/pts/1
> > lrwx------ 1 changbin changbin 64 Dec 25 13:03 2 -> /dev/pts/1
> > lr-x------ 1 changbin changbin 64 Dec 25 13:03 3 -> /etc/passwd
> > lr-x------ 1 changbin changbin 64 Dec 25 13:03 4 -> /proc/1421383/fd
> >
> > The modified code now explicitly validates tokens:
> > 1. Rejects empty reads (prevents infinite loops on EOF)
> > 2. Checks all bytes are '+' characters (catches fd reuse issues)
> > 3. Raises ValueError with clear diagnostics for debugging
> > This ensures robustness against invalid jobserver configurations, even =
when
> > external tools (like make) incorrectly pass non-pipe file descriptors.
> >
> > Signed-off-by: Changbin Du <changbin.du@huawei.com>
> > ---
> >  tools/lib/python/jobserver.py | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/tools/lib/python/jobserver.py b/tools/lib/python/jobserver=
.py
> > index a24f30ef4fa8..88d005f96bed 100755
> > --- a/tools/lib/python/jobserver.py
> > +++ b/tools/lib/python/jobserver.py
> > @@ -91,6 +91,8 @@ class JobserverExec:
> >              while True:
> >                  try:
> >                      slot =3D os.read(self.reader, 8)
> > +                    if not slot or any(c !=3D b'+'[0] for c in slot):
> > +                        raise ValueError("empty or unexpected token fr=
om jobserver")
>=20
> So I had to stare at this for a while to figure out what it was doing; a
> comment might help.
>=20
> But if it finds something that's not b'+', it simply crashes the whole
> thing?  Is that really what we want to do?  It would seem better to
> proceed if we got any slots at all, and to emit a message telling the
> poor user what they might want to do about the situation?
>
I suspect that in Make versions prior to 4.3, when generating the "--jobser=
ver-auth=3Dr,w"
parameter, the implementation fails to properly handle situations where fil=
e descriptor 3
is already occupied by the parent process (as I encountered where fd 3 was =
actually used to
open /etc/passwd). This appears to force Make to always use fd3 regardless =
of its
availability (I'm not sure how Make was written). In contrast, Make 4.4+ ve=
rsions
default to using named pipes, which avoids this issue entirely.

When this problem occurs, the current implementation deadlocks because for =
regular files,
os.read() returns empty bytes after reaching EOF, creating an infinite loop=
. My workaround
is to ignore this error condition to prevent deadlock, although this means =
the jobserver
protocol will no longer be honored.

As you suggested above, We can output an error message to stderr to inform =
users, but
must not use stdout, as it would corrupt the tool's normal output stream. F=
or
example, in scripts/Makefile.vmlinux_o we have:

quiet_cmd_gen_initcalls_lds =3D GEN     $@
      cmd_gen_initcalls_lds =3D \
        $(PYTHON3) $(srctree)/scripts/jobserver-exec \
        $(PERL) $(real-prereqs) > $@


> >                      self.jobs +=3D slot
> >                  except (OSError, IOError) as e:
> >                      if e.errno =3D=3D errno.EWOULDBLOCK:
>=20
> Thanks,
>=20
> jon

--=20
Cheers,
Changbin Du
