Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447C434DB46
	for <linux-doc@vger.kernel.org>; Fri, 22 May 2026 16:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779467763; cv=none; b=r2Iaw/4KsXrhRP1yMY+973ioy4/T5IU4FCNWQFYo9qhAIMKSTT3vaN8mHLYt2lLi8FXF/Xdr4qkm3U6spwprHrBctMOjUeG1TexFlJlstdF07ZggRDq4dgGO0m+wi0/7fVFWWWmXHq9QUgEUUD18Z0U4GHEzpL+AgmdpHqy3ki4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779467763; c=relaxed/simple;
	bh=PiIuawvsW/V9uOyVFPExO5ET3T7YaocVtIThnrSYDWc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=qeVImUHx/XTdMxRsOwJV5yYX7Oml3t+wMZvSeCCJYO7clGwgSL7ALbKmYNKSam/Hz6yRMduQl6wDIuHh6M32xgovC/QmbfFBuMNy3Qk1sY0RbG4ijBmhY9O52Gd40u2Vd5zuaoU48Fi2/oOgCSdRPCY9gCvo3UxjzKyhlYBn37s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=EHdn/+R+; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="EHdn/+R+"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B4C864E42D21;
	Fri, 22 May 2026 16:35:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 799486003C;
	Fri, 22 May 2026 16:35:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0199110811189;
	Fri, 22 May 2026 18:35:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779467758; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=btsefZSxGFHcFJTT/z3TV0y1ng0aLfAJSS13Lt5MOB4=;
	b=EHdn/+R+RWeaz650BsZ+fEZmucY1pz+RwMoCFqs7suF4mddWTOPvg2a8+jjOxEBVrzjGs4
	FzIQ2As7MYD6/fRpiiM3gLnrw5J7qQ8pKJ8JKS5rE4CyUKHUHovj5A7Zi+MOb+srVbiQWL
	0Ou8K1CrZnSFFSLGBKuuYpVc++tyXCE8j2MhglJLNRHotoBRYXjFJFiQAa7CfZ5qpEHUI7
	rKcnPqleQz0IynxValTC7UTX3rnV/kRLB1IuO080KwQkRZV7ii4lKzZVtlixypMLqil1Zq
	VjXRQc91tJeGl+od1ajfy+bKSzmNCw+07NlLpmtuVADJQNcnxlpc1Jj5oKWwLw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Michael Walle
 <mwalle@kernel.org>,  Takahiro Kuwano <takahiro.kuwano@infineon.com>,
  Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Jonathan Corbet <corbet@lwn.net>,  Shuah Khan
 <skhan@linuxfoundation.org>,  Sean Anderson <sean.anderson@linux.dev>,
  Thomas Petazzoni <thomas.petazzoni@bootlin.com>,  Steam Lin
 <STLin2@winbond.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 14/28] mtd: spi-nor: swp: Create helpers for building
 the SR register
In-Reply-To: <0640ef90-52f4-443b-90c9-ac4acb48d59f@linaro.org> (Tudor
	Ambarus's message of "Fri, 22 May 2026 12:56:55 +0300")
References: <20260507-winbond-v6-18-rc1-spi-nor-swp-v5-0-93453e1a9597@bootlin.com>
	<20260507-winbond-v6-18-rc1-spi-nor-swp-v5-14-93453e1a9597@bootlin.com>
	<0640ef90-52f4-443b-90c9-ac4acb48d59f@linaro.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Fri, 22 May 2026 18:35:52 +0200
Message-ID: <87tsrzo107.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

On 22/05/2026 at 12:56:55 +03, Tudor Ambarus <tudor.ambarus@linaro.org> wro=
te:

> On 5/7/26 7:46 PM, Miquel Raynal wrote:
>> The status register contains 3 or 4 BP (Block Protect) bits, 0 or 1
>> TB (Top/Bottom) bit, soon 0 or 1 CMP (Complement) bit. The last BP bit
>> and the TB bit locations change between vendors. The whole logic of
>> buildling the content of the status register based on some input
>> conditions is used two times and soon will be used 4 times.
>>=20
>> Create dedicated helpers for these steps.
>>=20
>> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
>> ---
>>  drivers/mtd/spi-nor/swp.c | 83 +++++++++++++++++++++++++++++-----------=
-------
>>  1 file changed, 51 insertions(+), 32 deletions(-)
>>=20
>> diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
>> index 540cd221c455..8aa0fe297188 100644
>> --- a/drivers/mtd/spi-nor/swp.c
>> +++ b/drivers/mtd/spi-nor/swp.c
>> @@ -125,6 +125,43 @@ static bool spi_nor_is_unlocked_sr(struct spi_nor *=
nor, loff_t ofs, u64 len,
>>  	return spi_nor_check_lock_status_sr(nor, ofs, len, sr, false);
>>  }
>>=20=20
>> +static int spi_nor_sr_set_bp_mask(struct spi_nor *nor, u8 *sr, u8 pow)
>> +{
>> +	u8 mask =3D spi_nor_get_sr_bp_mask(nor);
>> +	u8 val =3D pow << SR_BP_SHIFT;
>> +
>> +	if (nor->flags & SNOR_F_HAS_SR_BP3_BIT6 && val & SR_BP3)
>> +		val =3D (val & ~SR_BP3) | SR_BP3_BIT6;
>> +
>> +	if (val & ~mask)
>> +		return -EINVAL;
>> +
>> +	sr[0] =3D val;
>
> As sashiko already noticed, I think too this should have been sr[0] |=3D =
val

Yes indeed, that is a very good catch. Doesn't bug with my chips which
carry the QE bit in the second register, but it's unintended. Fixed on
my side, I will continue with Sashiko's feedback and send a v6.

Thanks,
Miqu=C3=A8l
