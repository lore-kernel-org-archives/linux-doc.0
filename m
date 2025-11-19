Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63970271468
	for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 17:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763574257; cv=none; b=c7rgLpvzrxgdFVWLlHo55A/ka9+q/TCkYh9gt7Q/4i0xg6nX+bWkYVL7pXdUQ7I4w5crH6698M3d6PXkgVUa0KfIJnvJpEI+sDPhb2Ii1FGMrvMvqSaf0B3Rba5YGcmw6moQaRQzvqmt+GpYGd9wgqIpmJYYdRzTB9HequpId5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763574257; c=relaxed/simple;
	bh=+sRPpe4+y1KVf741yaXjBtM1q02M21j5kOo18EKtnko=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=WfXjmSIkPJRUM+w06gMTJMo0EaxC/HldQYqslMFs1aHAar5y8vopz1pqqMEHrbrxE2ZFFgFcqQkiNuyQ1PxNDoC9xTKqy7tGP+scOUl6L7+oFWdFU4Ez+zqgeKd+yZMTaOmRO/wh/wijCaf5bU+CsJC55Pzt+AOwkNLPEy5PE+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Pl0bKUDP; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Pl0bKUDP"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 8BCA24E4179C;
	Wed, 19 Nov 2025 17:43:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 42F6B60699;
	Wed, 19 Nov 2025 17:43:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 594CB10371739;
	Wed, 19 Nov 2025 18:43:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763574238; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=AXtUbYj6Nl9CcqXkT0NrCWVaH1xW9piGU/0IGqHhuBg=;
	b=Pl0bKUDPWUQeRJcWn8QS3hAINFIXxD/PZZejTj6mm6kJ76Z0djfO7IlUYgAF3QzZ+w7v6n
	CMhIntGiPNMh4RpXWFja1ONicbg1dGeKFyphaJSWJmqEkwgSkHu6qALo322qjXtfLT0aAb
	Bs+FyIkIaUgRUTrg3NtnvouGY49y6jTfQYnFULEVg+u4KOX8kRYVtBehtmFxxTR47oY104
	xz3/adGmxF81lOMmpJhp+1o76j8rApy4RV0q1sbc2nrQX3UqEoEGTserfmoKpqU257PHKq
	7n0i2HZZb62PhWHLaTCu2qzC0sufBkF9Zw87yIsPYdGuaKPKNQKIeZeocYlo+Q==
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
In-Reply-To: <DECM3POB6LJF.2LZA9PMGSJBVR@kernel.org> (Michael Walle's message
	of "Wed, 19 Nov 2025 11:50:42 +0100")
References: <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-0-487bc7129931@bootlin.com>
	<20251114-winbond-v6-18-rc1-spi-nor-swp-v1-15-487bc7129931@bootlin.com>
	<DEBTY3TV74T2.2N3VRS6HGWDXD@kernel.org> <87o6oycpx6.fsf@bootlin.com>
	<DECM3POB6LJF.2LZA9PMGSJBVR@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 19 Nov 2025 18:43:53 +0100
Message-ID: <873469c3za.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

On 19/11/2025 at 11:50:42 +01, "Michael Walle" <mwalle@kernel.org> wrote:

> On Wed Nov 19, 2025 at 10:49 AM CET, Miquel Raynal wrote:
>> Hello,
>>
>> On 18/11/2025 at 13:46:52 +01, "Michael Walle" <mwalle@kernel.org> wrote:
>>
>>> On Fri Nov 14, 2025 at 6:53 PM CET, Miquel Raynal wrote:
>>>> The ioctl output may be counter intuitive in some cases. Asking for a
>>>> "locked status" over a region that is only partially locked will return
>>>> "unlocked" whereas in practice maybe the biggest part is actually
>>>> locked.
>>>>
>>>> Knowing what is the real software locking state through debugfs would =
be
>>>> very convenient for development/debugging purposes, hence this proposal
>>>> for adding two extra blocks at the end of the file:
>>>> - A "software locked sectors" array which lists every section, if it is
>>>> locked or not, showing both the address ranges and the sizes in numbers
>>>> of blocks.
>>>
>>> I know the file is called software write protection (or swp) but
>>> it's really a hardware write protection, isn't it?
>>
>> Well, it depends on your configuration I guess? Without #WP pin I don't
>> know how to call that. I had in mind that software meant "using the BP
>> pins" and "hardware" meant "toggling #WP". But I have no strong opinion
>> about this wording.
>
> See my previous mail and commit 18d7d01a0a0e ("mtd: spi-nor: Avoid
> setting SRWD bit in SR if WP# signal not connected"). Personally, I
> really don't like the "software" write protection, I mean you can
> just use read-only for that partition or whatever. Locking for me is
> really backed by the hardware. I.e. we use that to be really sure,
> that we have a bootable bootloader and no one can break it.
>
>>>> 64kiB-sectors locking map (x: locked, .: unlocked)
>>>> |.....................................................................=
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
............................
>>>>  ...........................|
>>>
>>> Maybe put it into an own file. In any case, a sane line wrapping
>>> would be good. And add a leading offset, ie, "0000: xxxx.....".
>>
>> I was unsure about doing that, but yes that makes sense. May I call it
>> "locked_sectors_map"?
>
> I don't have a strong opinion here, but locking might be on a finer
> granularity than sectors. Not with the BP scheme but IIRC I've seen
> locking schemes with 4k blocks for example. So maybe just something
> more general like "locked_erase_blocks_map" or just
> "locked_blocks_map", up to you.  It's just debugfs ;)

I find "sector" more generic than "erase block" or even "blocks". A
"sector" meaning is intimately related to what the vendor wants a sector
to be, unlike a block that carries the historical flash-related meaning
of an erase block. I also have the maths definition in mind, which is
basically a start and end.

We can go for locked_blocks_map. Technically speaking, the size of a
block as defined in the BP bits is left to the vendor, it could very
well be any size I guess? So that sounds fine.

>>>> +	sr[0] =3D nor->bouncebuf[0];
>>>> +
>>>> +	if (!(nor->flags & SNOR_F_NO_READ_CR)) {
>>>> +		ret =3D spi_nor_read_cr(nor, nor->bouncebuf + 1);
>>>> +		if (ret)
>>>> +			return ret;
>>>> +	}
>>>> +
>>>> +	sr[1] =3D nor->bouncebuf[1];
>>>
>>> Shouldn't that go into the former if conditional? bouncebuf[1] might
>>> never be read.
>>
>> Yes, that's correct. I don't remember why I did it this way, probably a
>> bug, I'll move that line.
>>
>>> Also, until now, reading the "params" debug file never interacts
>>> with the flash, but with this patch it does. We don't do locking
>>> here which looks wrong. Maybe we should just cache the protection
>>> bits. Not sure.
>>
>> I guess caching the status registers makes sense, but we'll still have a
>> possible race when accessing the 2 registers. Is it okay to
>> ignore this very unlikely case in debugfs? Otherwise I might just lock
>> the entire device for the time we access the cached registers.
>
> Oh I meant caching it in the core/swp.c (and invalidating/updating
> when the bits are written) and just display it here. That way we
> just keep that reading this file won't actually trigger any SPI
> xfers.

I understand that but there is still a race:
- swp.c writes cached_st[0]
- debugfs.c reads cached_st[0]
- swp.c writes cached_st[1]
- debugfs.c reads cached_st[1]

debugfs would get old st[0], new st[1]. The presence of the CMP bit in
st[1] really changes what st[0] means.

Questions is, do we care?

If yes, we can probably protect these cached registers inside the spi-nor
device lock.

Thanks,
Miqu=C3=A8l
