Received: from canpmsgout05.his.huawei.com (canpmsgout05.his.huawei.com [113.46.200.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDEAD3E832F;
	Thu,  8 Jan 2026 11:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767871939; cv=none; b=kQiwlQuhxulYhkaBvwylgoPuyGFGq9b98R+omZKRj+xd71lcCowKJ29ArclwPlCNP5q1YqIrAIPbOFkPkbCzOmKMAbM1BjJNhn/Xq7knnoLP+c5pOQlBygaafuYl4s8NIkmJgsMkmDjbkqV2rTsGz7u/Ca+jo10WJzYDJnDMm/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767871939; c=relaxed/simple;
	bh=08od9wRKxufYbdF5pHSLWVf2z7PwO8mBq2rvoabeAvE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nCwrf0bc6jeTPsZj1KYQUiV00XcwQjZUiuwf4LuQRE13PxTQKVH6b0c09qw4/SGcromVp8+eUyup/tYqnbhNw4hym2YFTi6aWgrrespSM6t7Kt+3ZrR4H/E1hmxyPhAXCcp5FtqvZxd/3UBrMlBTrj9Vk4DHaqdnA44KAYtrODg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=RAEHi8TE; arc=none smtp.client-ip=113.46.200.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="RAEHi8TE"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=tkHDfCgfM0040JQeSR0ZqZ4ajotKdK/zfLimj8AVzfc=;
	b=RAEHi8TEYmWbe3xwlNRS+JNNFL73UKmnwhWsC44S6YXHAiw6u/drx6jktY/P4vFFHAEA0V9Ho
	hP23fD7MlO0pVj2i0y9NKC/uMPJuBJZokfYkCrjF9nmNQIFnKnQLkOax5cMT/ajOnASxcbVVw8I
	GGKWaKWwDdkh1o8W90MAOaQ=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4dn2jb3gwNz12LCr;
	Thu,  8 Jan 2026 19:29:07 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id 2E64740363;
	Thu,  8 Jan 2026 19:32:11 +0800 (CST)
Received: from kwepemq200001.china.huawei.com (7.202.195.16) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 8 Jan 2026 19:32:10 +0800
Received: from kwepemq200002.china.huawei.com (7.202.195.90) by
 kwepemq200001.china.huawei.com (7.202.195.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 8 Jan 2026 19:32:10 +0800
Received: from kwepemq200002.china.huawei.com ([7.202.195.90]) by
 kwepemq200002.china.huawei.com ([7.202.195.90]) with mapi id 15.02.1544.011;
 Thu, 8 Jan 2026 19:32:10 +0800
From: duchangbin <changbin.du@huawei.com>
To: duchangbin <changbin.du@huawei.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Jonathan Corbet
	<corbet@lwn.net>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Mauro
 Carvalho Chehab" <mchehab+huawei@kernel.org>
Subject: Re: [PATCH v3] tools: jobserver: Prevent deadlock caused by incorrect
 jobserver configuration and enhance error reporting
Thread-Topic: [PATCH v3] tools: jobserver: Prevent deadlock caused by
 incorrect jobserver configuration and enhance error reporting
Thread-Index: AQHcgJAk4iGZOc9jdUeFyR5S30tTdLVII1SA
Date: Thu, 8 Jan 2026 11:32:10 +0000
Message-ID: <451b4ecf8a334bdeb6aa99527ad7802b@huawei.com>
References: <20260108111534.2952866-1-changbin.du@huawei.com>
In-Reply-To: <20260108111534.2952866-1-changbin.du@huawei.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: kwepemq200002.china.huawei.com (15.02.1544.011)
x-ms-exchange-messagesentrepresentingtype: 1
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E371CD45E3D10849A2B2EAE881E61023@huawei.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, Jan 08, 2026 at 07:15:34PM +0800, Changbin Du wrote:
> When using GNU Make's jobserver feature in kernel builds, a bug in MAKEFL=
AGS
> propagation caused "--jobserver-auth=3Dr,w" to reference an unintended fi=
le
> descriptor. This led to infinite loops in jobserver-exec's os.read() call=
s
> due to empty token.
>=20
> My shell opened /etc/passwd for some reason without closing it, and as a
> result, all child processes inherited this fd 3.
>=20
> $ ls -l /proc/self/fd
> total 0
> lrwx------ 1 changbin changbin 64 Dec 25 13:03 0 -> /dev/pts/1
> lrwx------ 1 changbin changbin 64 Dec 25 13:03 1 -> /dev/pts/1
> lrwx------ 1 changbin changbin 64 Dec 25 13:03 2 -> /dev/pts/1
> lr-x------ 1 changbin changbin 64 Dec 25 13:03 3 -> /etc/passwd
> lr-x------ 1 changbin changbin 64 Dec 25 13:03 4 -> /proc/1421383/fd
>=20
> In this case, the `make` should open a new file descriptor for jobserver
> control, but clearly, it did not do so and instead still passed fd 3 as
> "--jobserver-auth=3D3,4" in MAKEFLAGS. (The version of my gnu make is 4.3=
)
>=20
> This update ensures robustness against invalid jobserver configurations,
> even when `make` incorrectly pass non-pipe file descriptors.
>  * Rejecting empty reads to prevent infinite loops on EOF.
>  * Clearing `self.jobs` to avoid writing to incorrect files if invalid to=
kens
>    are detected.
>  * Printing detailed error messages to stderr to inform the user.
>=20
> Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Signed-off-by: Changbin Du <changbin.du@huawei.com>
>=20
> ---
>   v3: format exception with repr(e).
>   v2: remove validation for all bytes are '+' characters. (Mauro)
> ---
>  tools/lib/python/jobserver.py | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/tools/lib/python/jobserver.py b/tools/lib/python/jobserver.p=
y
> index a24f30ef4fa8..bd231f847032 100755
> --- a/tools/lib/python/jobserver.py
> +++ b/tools/lib/python/jobserver.py
> @@ -91,6 +91,10 @@ class JobserverExec:
>              while True:
>                  try:
>                      slot =3D os.read(self.reader, 8)
> +                    if not slot:
> +                        # Clear self.jobs to prevent us from probably wr=
iting incorrect file.
> +                        self.jobs =3D []
oops, I should not change the type of self.jobs. So it's better to be:
			   self.jobs =3D b""

--=20
Cheers,
Changbin Du
