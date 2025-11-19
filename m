Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24763375CB
	for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 09:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763543633; cv=none; b=UgBGONRKq/lU6Gv5WkVQ0fQ3I1cB5/VdD9XZnP1ry+73zYjdA3ZatOVttGFM5+9hSm6MQvp4DyjP235tCabUa3xk1fQ4awCNv7/RL/X/k6SkkmuYNLtzkSAkMZbJmZujQ06CN+fw2cstASGCRJ9nJ75tZKIbw4toSwHhDjuuITc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763543633; c=relaxed/simple;
	bh=SwAf6Q7/J6cwntk2+IGC5jzf5hBghbZ1t807N2gYSMQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=XXgMzl3uMEEYHX5OuMFkC+uExZsjgtWFlqmVhlK0020tDwZqjeAASWG1kHfnY4uC4vB+vvf+jUE1bGzwjForTzItDfk2e1iEO0yfHqxnhGtwLaYJWjtnbr8ET8gwXvzITw5uHjKPasrd7Lp+Zaxc2dcn3rsPPASAwEl03jBycWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=YORGXyt9; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="YORGXyt9"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 9C89CC11185;
	Wed, 19 Nov 2025 09:13:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C6C9460720;
	Wed, 19 Nov 2025 09:13:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3BD8810371970;
	Wed, 19 Nov 2025 10:13:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763543622; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=vMMrY05Eqt0VUIufdiGTc8WpNMw7bbAM4JjsWqLutZI=;
	b=YORGXyt9XK/2WQhb33i0122+Dbh14Djvx2VbyxvxdSiZAAaNY0BvxK77iHRxaG3A46clT/
	rOD2vms2HCX0wia2ZRT6ft7fW+xbNJcrf1WDYvKcEr4bXQhMK0kF3B4zJdpyPuP1nDgmxZ
	UusgFtSAD4KOFZrUcHKpqmTPRmkKawMkjyKi1d2aSlBaWNKtuZjDqTGxH92qr8xXMszIVr
	I9+afPllRCFn8KXtfzWThSOVRzZpQ7Jg9sNWEDfRmCMcBezlWp6fuji1Lv3cOzrXEyLDdi
	xlinBHr15Tdc/yjVzKXfZ+NHHjTlDniQwBPtXn8NWlT1BHu2t893D5mEma+nig==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Michael Walle" <mwalle@kernel.org>
Cc: "Tudor Ambarus" <tudor.ambarus@linaro.org>,  "Pratyush Yadav"
 <pratyush@kernel.org>,  "Richard Weinberger" <richard@nod.at>,  "Vignesh
 Raghavendra" <vigneshr@ti.com>,  "Jonathan Corbet" <corbet@lwn.net>,
  "Sean Anderson" <sean.anderson@linux.dev>,  "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>,  "Steam Lin" <STLin2@winbond.com>,
  <linux-mtd@lists.infradead.org>,  <linux-kernel@vger.kernel.org>,
  <linux-doc@vger.kernel.org>
Subject: Re: [PATCH 02/19] mtd: spi-nor: swp: Improve locking user experience
In-Reply-To: <DEBPI49KKW00.3MSWMX9HQL7JZ@kernel.org> (Michael Walle's message
	of "Tue, 18 Nov 2025 10:17:55 +0100")
References: <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-0-487bc7129931@bootlin.com>
	<20251114-winbond-v6-18-rc1-spi-nor-swp-v1-2-487bc7129931@bootlin.com>
	<DEBPI49KKW00.3MSWMX9HQL7JZ@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 19 Nov 2025 10:13:36 +0100
Message-ID: <87bjkye667.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

On 18/11/2025 at 10:17:55 +01, "Michael Walle" <mwalle@kernel.org> wrote:

> On Fri Nov 14, 2025 at 6:53 PM CET, Miquel Raynal wrote:
>> In the case of a single block being locked, if the user want to fully
>> unlock the device it has two possibilities:
>> - either it asks to unlock the entire device, and this works;
>> - or it asks to unlock just the blocks that are currently locked, which
>> fails.
>>
>> It fails because the conditions "can_be_top" and "can_be_bottom" are
>> true. Indeed, in this case, we unlock everything, to the TB bit does not
>> matter. However in the current implementation, use_top would be true (as
>> this is the favourite option) and lock_len, which in practice should be
>> reduced down to 0, is set to "nor->params->size - (ofs + len)" which is
>> a positive number. This is wrong.
>
> This only happens if you try to unlock the first sector, correct? If
> my maths are correct, trying it on the last sector, lock_len should
> be 0, i.e in that case "ofs + len =3D=3D size".
>
> If it's the first sector (or sectors), lock_len will end up with
> "size - N * 64k", which is clearly wrong.

That's it. Actually I forgot to mention it was happening only with the
first sectors, not the last ones, so yes you are correct, it matches my
maths and experiments.

>> An easy way is to simply add an extra condition. In the unlock() path,
>> if we can achieve the results from both sides, it means we unlock
>> everything and lock_len must simply be 0.
>>
>> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
>> ---
>> For me, this result was clearly unexpected, but I am not sure this
>> qualifies as a fix.
>
> That's definetly a bug, esp. because it will lock an entire
> unrelated region. And it seems to go back all the to commit
> 3dd8012a8eeb "mtd: spi-nor: add TB (Top/Bottom) protect support").
>
>> ---
>>  drivers/mtd/spi-nor/swp.c | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
>> index 9b07f83aeac76dce2109f90dfa1534c9bd93330d..9bc5a356444665ad8824e9e1=
2d679fd551b3e67d 100644
>> --- a/drivers/mtd/spi-nor/swp.c
>> +++ b/drivers/mtd/spi-nor/swp.c
>> @@ -281,7 +281,9 @@ static int spi_nor_sr_unlock(struct spi_nor *nor, lo=
ff_t ofs, u64 len)
>>  	use_top =3D can_be_top;
>>=20=20
>>  	/* lock_len: length of region that should remain locked */
>> -	if (use_top)
>> +	if (can_be_top && can_be_bottom)
>> +		lock_len =3D 0;
>
> Could you please add a comment stating that if both are true, it
> means that both adjacent regions are unlocked and thus the entire
> flash will be unlocked.

Ofc.

Thanks,
Miqu=C3=A8l
