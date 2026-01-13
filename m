Received: from canpmsgout04.his.huawei.com (canpmsgout04.his.huawei.com [113.46.200.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF16B1C5F1B;
	Tue, 13 Jan 2026 01:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768269166; cv=none; b=g+Zyz7XFStS2KDnPEaculn1p4EHIgg2vTZQLLTpgam8tYRIjYR0GuRba1JJ2Twu+NzYUmKMTCkW3/v7njUKI0yuQyjPxXU/2UQiVzI+K7oY50H/3pW+JVuyxojFTE0zdsim6nN3xRhu1cZ7dXSF0Q1pFK5SDpaxdD5sDpg/o4eQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768269166; c=relaxed/simple;
	bh=+vSDnevRA5GbidOkeuTnMf3c2LwlAqvZ9DSuM/86O48=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rFm7N+arf19FZSul2Inf8kN5inBEJpZd2ONAEWXG5YVop9kEMOtINE1dUQCRyvc1bLg6/DizcQkCywECHhN7mJSyIgNjFC+4gprYMbdZfw9Z1PCQCC+qNVCuxPLNSDmOhrthy2nyRNaiQzOItcwxKBeDWZq/Oj9mbA6fYiDhM2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=Vn8FGEDw; arc=none smtp.client-ip=113.46.200.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="Vn8FGEDw"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=OFMVttkU1yg8HjwVoATyqQbr8PAT/idRQsYh8YjwUO8=;
	b=Vn8FGEDwxsfq8icPsOb65FlHYyjQyUq3hRnVOqVzlp46zlS4Nkb4it0HSVikMdpoua9FttZ8Y
	DIPZpFuhm/LAAliB9hRsyYkygx81RqrAgEwGlQqkYp74UZMnY1T7n+U9Xsb8xlXKdEQNdtoNNw0
	VSdXYRwKEYTIxddLoy3kc6Y=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4dqscB4Fwwz1prv2;
	Tue, 13 Jan 2026 09:49:14 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 5CF8940538;
	Tue, 13 Jan 2026 09:52:35 +0800 (CST)
Received: from kwepemq200002.china.huawei.com (7.202.195.90) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 13 Jan 2026 09:52:35 +0800
Received: from kwepemq200002.china.huawei.com (7.202.195.90) by
 kwepemq200002.china.huawei.com (7.202.195.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 13 Jan 2026 09:52:34 +0800
Received: from kwepemq200002.china.huawei.com ([7.202.195.90]) by
 kwepemq200002.china.huawei.com ([7.202.195.90]) with mapi id 15.02.1544.011;
 Tue, 13 Jan 2026 09:52:34 +0800
From: duchangbin <changbin.du@huawei.com>
To: Jonathan Corbet <corbet@lwn.net>
CC: duchangbin <changbin.du@huawei.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Mauro Carvalho Chehab
	<mchehab+huawei@kernel.org>
Subject: Re: [PATCH v4] tools: jobserver: Prevent deadlock caused by incorrect
 jobserver configuration and enhance error reporting
Thread-Topic: [PATCH v4] tools: jobserver: Prevent deadlock caused by
 incorrect jobserver configuration and enhance error reporting
Thread-Index: AQHcgJNbdFGBp4bzgEqXGciEmp3gubVONEEAgAEpEgA=
Date: Tue, 13 Jan 2026 01:52:34 +0000
Message-ID: <34c98e3ca24e4c88b9ba61c6f637671b@huawei.com>
References: <20260108113836.2976527-1-changbin.du@huawei.com>
 <874ioq3jad.fsf@trenco.lwn.net>
In-Reply-To: <874ioq3jad.fsf@trenco.lwn.net>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: kwepemq200002.china.huawei.com (15.02.1544.011)
x-ms-exchange-messagesentrepresentingtype: 1
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2C441C692F52CF4F9FBF717FB36D7EEF@huawei.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, Jan 12, 2026 at 09:08:58AM -0700, Jonathan Corbet wrote:
> Changbin Du <changbin.du@huawei.com> writes:
>=20
> > When using GNU Make's jobserver feature in kernel builds, a bug in MAKE=
FLAGS
> > propagation caused "--jobserver-auth=3Dr,w" to reference an unintended =
file
> > descriptor. This led to infinite loops in jobserver-exec's os.read() ca=
lls
> > due to empty token.
> >
> > My shell opened /etc/passwd for some reason without closing it, and as =
a
> > result, all child processes inherited this fd 3.
> >
> > $ ls -l /proc/self/fd
> > total 0
> > lrwx------ 1 changbin changbin 64 Dec 25 13:03 0 -> /dev/pts/1
> > lrwx------ 1 changbin changbin 64 Dec 25 13:03 1 -> /dev/pts/1
> > lrwx------ 1 changbin changbin 64 Dec 25 13:03 2 -> /dev/pts/1
> > lr-x------ 1 changbin changbin 64 Dec 25 13:03 3 -> /etc/passwd
> > lr-x------ 1 changbin changbin 64 Dec 25 13:03 4 -> /proc/1421383/fd
> >
> > In this case, the `make` should open a new file descriptor for jobserve=
r
> > control, but clearly, it did not do so and instead still passed fd 3 as
> > "--jobserver-auth=3D3,4" in MAKEFLAGS. (The version of my gnu make is 4=
.3)
> >
> > This update ensures robustness against invalid jobserver configurations=
,
> > even when `make` incorrectly pass non-pipe file descriptors.
> >  * Rejecting empty reads to prevent infinite loops on EOF.
> >  * Clearing `self.jobs` to avoid writing to incorrect files if invalid =
tokens
> >    are detected.
> >  * Printing detailed error messages to stderr to inform the user.
> >
> > Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > Signed-off-by: Changbin Du <changbin.du@huawei.com>
>=20
> So I've applied this; it appears to work, though I can't really test the
> error case that it is intended to fix.
>=20

Here's my local test result in case you need it.

$ make ARCH=3Driscv LLVM=3D1 LLVM_IAS=3D1 -j$(nproc) Image
  ...
  AR      drivers/built-in.a
  AR      built-in.a
  AR      vmlinux.a
  GEN     .tmp_initcalls.lds
jobserver: warning: ValueError("unexpected empty token from jobserver fd, i=
nvalid '--jobserver-auth=3D' setting?")
  LD      vmlinux.o

--=20
Cheers,
Changbin Du
