Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8186133CE8D
	for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 09:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763543912; cv=none; b=mCBMl8j3w+pEDtapoyeG1S+NnasA3TkZ/n92Am1B8t6SQNg/CH6921YiKdhMTWzKnZag4F9+tIU2dVlsn1cYnck/996GILRUwr4laBQ7cr5ny2st4+oQBooT4rs1JKEvcv3x53LOn1i5ZfoVIbRPnOlWmzkyOnPnQAooPgFkPTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763543912; c=relaxed/simple;
	bh=vdONSkkFqXLdvRGOYBIPVd7ZYbdzNvgziwXdvEzdYeM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=oPUKBKqHTYiTkT/bB09kf+CUvTWAx40pNczqmOLX2vnBGUIT0rImCp/3cQY3XrT80/YVGNfn/V5/obTuTW1+1GdoyMPnnnvtkuMKsn0aJmJXZYWQIZ8P0nuXZWVWiMOGb6at+gytoXhm15lpeKyO8sZvMvnZ2JiFhGcVDnHAgkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=HIETclIQ; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="HIETclIQ"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 74C0A1A1BD0;
	Wed, 19 Nov 2025 09:18:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4A48460721;
	Wed, 19 Nov 2025 09:18:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3A1E4103719DE;
	Wed, 19 Nov 2025 10:18:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763543906; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=qaMenLfvLw2Uad2z/52NeS/7HGvf+XS4cn22Ov6FPYo=;
	b=HIETclIQRdK5ecv2f7KZjGW7UMNfFdmXCTTW//dK0HO4dNTFVk/YjZWHf8MwXbmksy9hb3
	YjkfJI/n4D7bG1i+M249qqhCqM/yHTRj/uUrZB39zINJad8auuoeffM6efrptLnjmDI/XP
	E5SZ2oHX+Ivv6bcitYM2Y1LGE5O1tco+3sATiJh4qIBgWyyWGwbu7vz3z5AhRBzAdJU7wI
	+w1F2efBL7j0H9BYhdXumJ3DUHc7pzjzcRzbN5jEqmgWc9dib7j6spckkm4UYX6xB5LksZ
	YuJaNTKNCuUTs6LroZRg1QWa4fNVOf07jk4FJyr3d+wKRjbdpim0URDZVokr2Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Michael Walle" <mwalle@kernel.org>
Cc: "Tudor Ambarus" <tudor.ambarus@linaro.org>,  "Pratyush Yadav"
 <pratyush@kernel.org>,  "Richard Weinberger" <richard@nod.at>,  "Vignesh
 Raghavendra" <vigneshr@ti.com>,  "Jonathan Corbet" <corbet@lwn.net>,
  "Sean Anderson" <sean.anderson@linux.dev>,  "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>,  "Steam Lin" <STLin2@winbond.com>,
  <linux-mtd@lists.infradead.org>,  <linux-kernel@vger.kernel.org>,
  <linux-doc@vger.kernel.org>
Subject: Re: [PATCH 06/19] mtd: spi-nor: swp: Explain the MEMLOCK ioctl
 implementation behaviour
In-Reply-To: <DEBQ9IUDZJ7T.33VMFGMNKPEUY@kernel.org> (Michael Walle's message
	of "Tue, 18 Nov 2025 10:53:42 +0100")
References: <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-0-487bc7129931@bootlin.com>
	<20251114-winbond-v6-18-rc1-spi-nor-swp-v1-6-487bc7129931@bootlin.com>
	<DEBQ9IUDZJ7T.33VMFGMNKPEUY@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 19 Nov 2025 10:18:23 +0100
Message-ID: <875xb6e5y8.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

On 18/11/2025 at 10:53:42 +01, "Michael Walle" <mwalle@kernel.org> wrote:

> On Fri Nov 14, 2025 at 6:53 PM CET, Miquel Raynal wrote:
>> Add comments about how these requests are actually handled in the SPI
>> NOR core. Their behaviour was not entirely clear to me at first, and
>> explaining them in plain English sounds the way to go.
>>
>> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
>> ---
>>  drivers/mtd/spi-nor/swp.c | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
>> index 9bc5a356444665ad8824e9e12d679fd551b3e67d..ede03f26de3c65ff53c1cb88=
8c2c43aea268b85a 100644
>> --- a/drivers/mtd/spi-nor/swp.c
>> +++ b/drivers/mtd/spi-nor/swp.c
>> @@ -341,6 +341,14 @@ static int spi_nor_sr_is_locked(struct spi_nor *nor=
, loff_t ofs, u64 len)
>>  	return spi_nor_is_locked_sr(nor, ofs, len, nor->bouncebuf[0]);
>>  }
>>=20=20
>> +/*
>> + * These ioctls behave according to the following rules:
>> + * ->lock(): Never locks more than what is requested, ie. may lock less
>
> That behavior sounds so wrong... The user requests a region to be
> locked, and it isn't actually locked.

Agreed. I really got puzzled by that.

>> + * ->unlock(): Never unlocks more than what is requested, ie. may unloc=
k less
>
> That seems somewhat sane.
>
> Maybe we should return -EINVAL if ofs or ofs+len aren't at sector
> boundaries. Yeah it's a change in the UAPI, but I'm not sure the
> current behavior is not harmful and misleading.

I would even go further and propose to return -EINVAL whenever the
request is not exactly doable. Being at a block boundary is not enough,
as there are many boundaries we cannot describe with just 4 protection
bits.

But this is somewhat a uAPI change indeed. So in the first place, I will
keep this comment. But if we feel like we should make the uAPI stricter,
it can come on top. Doing this would require a broad acknowledgement.

>> + * -is_locked(): Checks if the region is *fully* locked, returns false =
otherwise.
>> + *               This feeback may be misleading because users may get a=
n "unlocked"
>> + *               status even though a subpart of the region is effectiv=
ely locked.
>> + */
>>  static const struct spi_nor_locking_ops spi_nor_sr_locking_ops =3D {
>>  	.lock =3D spi_nor_sr_lock,
>>  	.unlock =3D spi_nor_sr_unlock,
>
> Anyway, as it is how it's currently behaving:
>
> Reviewed-by: Michael Walle <mwalle@kernel.org>

Thanks!
Miqu=C3=A8l
