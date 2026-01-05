Received: from canpmsgout05.his.huawei.com (canpmsgout05.his.huawei.com [113.46.200.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14EA52D7DD7;
	Mon,  5 Jan 2026 08:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767601367; cv=none; b=Ph1iiZivP35HMQdRw88tF7tTJPjadI0df33D8HJGn4CTZAOMOy4cC/yNfF3Z2HDl9rQFLwv99+8OblRcHGvmfEJNIpjxj14IuB/8Q89LmvPihCiuIOJTVPH4tLTf1cR11SMm/MAAvRwl9b7qGd84fgrSlCD8Rke0LPfCTTw9XMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767601367; c=relaxed/simple;
	bh=FjOvVRt7bwYSzUgsUvkPcA7kMO2u5NBl/oYuCx+GFSI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LBL9vRMvU8yPdWRGQkw6PP0OCS800sdqQltzE58kxfjSJPkEy+bJfTd9TDGmUNGq+1qsevpMhR8LOc/0lUZFvyX8avAfs/FC1NF3L35k4oT8/QdQak+dMyf9x6o5oSQpT+7WoxJDZ/9bL42SPasc5lrvr/4ETcI4iaAtN4pfdwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=gNfp9dyt; arc=none smtp.client-ip=113.46.200.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="gNfp9dyt"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=8mqNqypQgL4V2WTC8YUa+iVx1IcxwsbDIHbuVbzmLek=;
	b=gNfp9dytZ32YQw4nxxCEMSNOsN1TytVW9spLtGPyvd94lEQQI7p/wUA91pOJAEiXQKeniNSGZ
	f6lmdonB8yBW9y/QGAOvpL4oDaeOviyJ+Q2Wyn03uzojfQTzuKiWdQ6W6ZFUyUu8R6hTJCDpV0p
	KjmZMbpz2drIIqahBwiPxyo=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4dl6fB5MRLz12LDK;
	Mon,  5 Jan 2026 16:19:30 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 409EE2016A;
	Mon,  5 Jan 2026 16:22:36 +0800 (CST)
Received: from kwepemq100002.china.huawei.com (7.202.195.14) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 5 Jan 2026 16:22:36 +0800
Received: from kwepemq200002.china.huawei.com (7.202.195.90) by
 kwepemq100002.china.huawei.com (7.202.195.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 5 Jan 2026 16:22:35 +0800
Received: from kwepemq200002.china.huawei.com ([7.202.195.90]) by
 kwepemq200002.china.huawei.com ([7.202.195.90]) with mapi id 15.02.1544.011;
 Mon, 5 Jan 2026 16:22:35 +0800
From: duchangbin <changbin.du@huawei.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
CC: duchangbin <changbin.du@huawei.com>, Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH] tools: jobserver: Add validation for jobserver tokens to
 ensure valid '+' characters
Thread-Topic: [PATCH] tools: jobserver: Add validation for jobserver tokens to
 ensure valid '+' characters
Thread-Index: AQHcdWdrFHx32OniNEiud4ksj7qjorVDTfIA
Date: Mon, 5 Jan 2026 08:22:35 +0000
Message-ID: <f1755f03f74e4e4ba8a0a91c9da1a74f@huawei.com>
References: <20251225062622.1500046-1-changbin.du@huawei.com>
In-Reply-To: <20251225062622.1500046-1-changbin.du@huawei.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: kwepemq200002.china.huawei.com (15.02.1544.011)
x-ms-exchange-messagesentrepresentingtype: 1
Content-Type: text/plain; charset="us-ascii"
Content-ID: <01A4CA6D5D34F344B33A0581A8678951@huawei.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Kindly ping for this fix. This patch resolves the issue where kernel compil=
ation
gets stuck in certain situations.

On Thu, Dec 25, 2025 at 02:26:22PM +0800, Changbin Du wrote:
> Add validation for jobserver tokens to prevent infinite loops on invalid =
fds
> When using GNU Make's jobserver feature in kernel builds, a bug in MAKEFL=
AGS
> propagation caused "--jobserver-auth=3D3,4" to reference an unintended fi=
le
> descriptor (Here, fd 3 was inherited from a shell command that opened
> "/etc/passwd" instead of a valid pipe). This led to infinite loops in
> jobserver-exec's os.read() calls due to empty or corrupted tokens. (The
> version of my make is 4.3)
>=20
> $ ls -l /proc/self/fd
> total 0
> lrwx------ 1 changbin changbin 64 Dec 25 13:03 0 -> /dev/pts/1
> lrwx------ 1 changbin changbin 64 Dec 25 13:03 1 -> /dev/pts/1
> lrwx------ 1 changbin changbin 64 Dec 25 13:03 2 -> /dev/pts/1
> lr-x------ 1 changbin changbin 64 Dec 25 13:03 3 -> /etc/passwd
> lr-x------ 1 changbin changbin 64 Dec 25 13:03 4 -> /proc/1421383/fd
>=20
> The modified code now explicitly validates tokens:
> 1. Rejects empty reads (prevents infinite loops on EOF)
> 2. Checks all bytes are '+' characters (catches fd reuse issues)
> 3. Raises ValueError with clear diagnostics for debugging
> This ensures robustness against invalid jobserver configurations, even wh=
en
> external tools (like make) incorrectly pass non-pipe file descriptors.
>=20
> Signed-off-by: Changbin Du <changbin.du@huawei.com>
> ---
>  tools/lib/python/jobserver.py | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/tools/lib/python/jobserver.py b/tools/lib/python/jobserver.p=
y
> index a24f30ef4fa8..88d005f96bed 100755
> --- a/tools/lib/python/jobserver.py
> +++ b/tools/lib/python/jobserver.py
> @@ -91,6 +91,8 @@ class JobserverExec:
>              while True:
>                  try:
>                      slot =3D os.read(self.reader, 8)
> +                    if not slot or any(c !=3D b'+'[0] for c in slot):
> +                        raise ValueError("empty or unexpected token from=
 jobserver")
>                      self.jobs +=3D slot
>                  except (OSError, IOError) as e:
>                      if e.errno =3D=3D errno.EWOULDBLOCK:
> --=20
> 2.43.0
>=20

--=20
Cheers,
Changbin Du
