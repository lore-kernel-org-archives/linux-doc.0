Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8476630504D
	for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 09:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763545806; cv=none; b=bA9HMPXWVTN5iCyxWoS+SWJb183WDoklTDpgn2LyNSlhDTqD3Bl7K2lEEbQ7Iu4ENe1FLBpajxmPs/Nd3bw0amiO5UPZbmtj2goUwKPim6WYSZHhv49VbB5160zaeT/gG0OXh63A0JgaE3MyFXnwSQPS1ZuUZp/Qb2EmPiv2Ws0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763545806; c=relaxed/simple;
	bh=1TOp3TyNqp9fvTognm5EaBymbRnEbazC0vxgnfiwNVQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=eXbb9ZEjut/8kG9AsapwaDTiDpGNQoZNW0ocbbvDL1RIpaqbzd5C62GNMaZCJ9/XMCtOr7Hb+R3ZfWZVIcrdVp6MulmrQoXUciIFi6+eJgeNxqKwIw8su6Yk6smP3BTyXaTtjI5PgO+harr5ojnu74601Ht6TuskwFCvNNdBdq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=NDCz8PCM; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="NDCz8PCM"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id BB6904E41794;
	Wed, 19 Nov 2025 09:50:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9190460720;
	Wed, 19 Nov 2025 09:50:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D22C810371A18;
	Wed, 19 Nov 2025 10:49:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763545802; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RrIjwcjwliZ95lPsOv8XtZAnAsO3R4A3FRoqGR2mI7g=;
	b=NDCz8PCM2Nkvg9vaH8fUswy6MvH7QqLHVik27q6zknsVFM3ymgUpBZoCgJOm3wK4ZhAvGg
	IbY1ET4w44no3ZXy7ziwRYbdlBgyco0O7Sq/IK60yIV8hgvnpPnPeZmINbccHHKHzybi8k
	/nY8hhDhJUO7g179uU9lCQl8ZQqNgkWOYWz6K+L9VIZjeToDsdIoP1wCzJq0MwSmgo+9LI
	eQp15tOtt4ArbVhjuRMpiufS0+OM/LZIo2KCHbJNDFl8XoT86W1sGRrIR/vuaOV75KObXw
	4kUzbJZCtxN7c5WTJ2Q9VLPgGp81MQXYdBYFXxpQGi3ojTo9JTbuQE3ntc5/pg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Michael Walle" <mwalle@kernel.org>
Cc: "Tudor Ambarus" <tudor.ambarus@linaro.org>,  "Pratyush Yadav"
 <pratyush@kernel.org>,  "Richard Weinberger" <richard@nod.at>,  "Vignesh
 Raghavendra" <vigneshr@ti.com>,  "Jonathan Corbet" <corbet@lwn.net>,
  "Sean Anderson" <sean.anderson@linux.dev>,  "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>,  "Steam Lin" <STLin2@winbond.com>,
  <linux-mtd@lists.infradead.org>,  <linux-kernel@vger.kernel.org>,
  <linux-doc@vger.kernel.org>
Subject: Re: [PATCH 15/19] mtd: spi-nor: debugfs: Add locking support
In-Reply-To: <DEBTY3TV74T2.2N3VRS6HGWDXD@kernel.org> (Michael Walle's message
	of "Tue, 18 Nov 2025 13:46:52 +0100")
References: <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-0-487bc7129931@bootlin.com>
	<20251114-winbond-v6-18-rc1-spi-nor-swp-v1-15-487bc7129931@bootlin.com>
	<DEBTY3TV74T2.2N3VRS6HGWDXD@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 19 Nov 2025 10:49:57 +0100
Message-ID: <87o6oycpx6.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hello,

On 18/11/2025 at 13:46:52 +01, "Michael Walle" <mwalle@kernel.org> wrote:

> On Fri Nov 14, 2025 at 6:53 PM CET, Miquel Raynal wrote:
>> The ioctl output may be counter intuitive in some cases. Asking for a
>> "locked status" over a region that is only partially locked will return
>> "unlocked" whereas in practice maybe the biggest part is actually
>> locked.
>>
>> Knowing what is the real software locking state through debugfs would be
>> very convenient for development/debugging purposes, hence this proposal
>> for adding two extra blocks at the end of the file:
>> - A "software locked sectors" array which lists every section, if it is
>> locked or not, showing both the address ranges and the sizes in numbers
>> of blocks.
>
> I know the file is called software write protection (or swp) but
> it's really a hardware write protection, isn't it?

Well, it depends on your configuration I guess? Without #WP pin I don't
know how to call that. I had in mind that software meant "using the BP
pins" and "hardware" meant "toggling #WP". But I have no strong opinion
about this wording.

>> - Some kind of mapping of the locked sectors, which pictures the entire
>> flash. It may be verbose, so perhaps we'll drop it in the end. I found
>> it very useful to really get a clearer mental model of what was
>> locked/unlocked, but the array just before is already a good source of
>> information.
>>
>> Here is an example of output, what is after the "sector map" is new.
>>
>> $ cat /sys/kernel/debug/spi-nor/spi0.0/params
>> name		(null)
>> id		ef a0 20 00 00 00
>> size		64.0 MiB
>> write size	1
>> page size	256
>> address nbytes	4
>> flags		HAS_SR_TB | 4B_OPCODES | HAS_4BAIT | HAS_LOCK | HAS_16BIT_SR | HA=
S_SR_TB_BIT6 | HAS_4BIT_BP | SOFT_RESET | NO_WP
>>
>> opcodes
>>  read		0xec
>>   dummy cycles	6
>>  erase		0xdc
>>  program	0x34
>>  8D extension	none
>>
>> protocols
>>  read		1S-4S-4S
>>  write		1S-1S-4S
>>  register	1S-1S-1S
>>
>> erase commands
>>  21 (4.00 KiB) [1]
>>  dc (64.0 KiB) [3]
>>  c7 (64.0 MiB)
>>
>> sector map
>>  region (in hex)   | erase mask | overlaid
>>  ------------------+------------+---------
>>  00000000-03ffffff |     [   3] | no
>>
>> software locked sectors
>
> drop "software" here.

Okay.

>
>>  region (in hex)   | status   | #blocks
>>  ------------------+----------+--------
>>  00000000-03ffffff | unlocked | 1024
>
> I really like that.

:-)

>> 64kiB-sectors locking map (x: locked, .: unlocked)
>> |.......................................................................=
...........................................................................=
...........................................................................=
...........................................................................=
...........................................................................=
...........................................................................=
...........................................................................=
...........................................................................=
...........................................................................=
...........................................................................=
...........................................................................=
...........................................................................=
...........................................................................=
..........................
>>  ...........................|
>
> Maybe put it into an own file. In any case, a sane line wrapping
> would be good. And add a leading offset, ie, "0000: xxxx.....".

I was unsure about doing that, but yes that makes sense. May I call it
"locked_sectors_map"?

[...]

>> +	sr[0] =3D nor->bouncebuf[0];
>> +
>> +	if (!(nor->flags & SNOR_F_NO_READ_CR)) {
>> +		ret =3D spi_nor_read_cr(nor, nor->bouncebuf + 1);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>> +	sr[1] =3D nor->bouncebuf[1];
>
> Shouldn't that go into the former if conditional? bouncebuf[1] might
> never be read.

Yes, that's correct. I don't remember why I did it this way, probably a
bug, I'll move that line.

> Also, until now, reading the "params" debug file never interacts
> with the flash, but with this patch it does. We don't do locking
> here which looks wrong. Maybe we should just cache the protection
> bits. Not sure.

I guess caching the status registers makes sense, but we'll still have a
possible race when accessing the 2 registers. Is it okay to
ignore this very unlikely case in debugfs? Otherwise I might just lock
the entire device for the time we access the cached registers.

>> +	spi_nor_get_locked_range_sr(nor, sr, &lock_start, &lock_length);
>> +	if (!lock_length || lock_length =3D=3D params->size) {
>> +		seq_printf(s, " %08llx-%08llx | %s | %llu\n", 0ULL, params->size - 1,
>> +			   lock_length ? "  locked" : "unlocked", params->size / min_prot_le=
n);
>> +	} else if (!lock_start) {
>> +		seq_printf(s, " %08llx-%08llx | %s | %llu\n", 0ULL, lock_length - 1,
>> +			   "  locked", lock_length / min_prot_len);
>> +		seq_printf(s, " %08llx-%08llx | %s | %llu\n", lock_length, params->si=
ze - 1,
>> +			   "unlocked", (params->size - lock_length) / min_prot_len);
>> +	} else {
>> +		seq_printf(s, " %08llx-%08llx | %s | %llu\n", 0ULL, lock_start - 1,
>> +			   "unlocked", lock_start / min_prot_len);
>> +		seq_printf(s, " %08llx-%08llx | %s | %llu\n", lock_start, params->siz=
e - 1,
>> +			   "  locked", lock_length / min_prot_len);
>> +	}
>> +
>> +	seq_printf(s, "\n%dkiB-sectors locking map (x: locked, .: unlocked)\n",
>> +		   min_prot_len / 1024);
>> +	seq_puts(s, "|");
>> +	for (i =3D 0; i < params->size; i +=3D min_prot_len)
>> +		seq_printf(s, spi_nor_is_locked_sr(nor, i, min_prot_len, sr) ? "x" : =
".");
>
> As mentioned above, newlines as well as a leading offset counter
> would be nice :)

Arf, I was hoping I could escape that step, but ok, fair enough :-)

Miqu=C3=A8l
