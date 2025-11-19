Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8737B1FAC42
	for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 17:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763573749; cv=none; b=iUmb1RNTm74yEOy9xLR3O8+pUEi9CL2wbFiIbW/YfvnMMsGVklNgO6WkliFsDzrRUx0F/9f6YUFWuGMPsj+HJPGhl/Jyh48yZGC2O6blAmmy3E0FteOWuUwsYeCJktFZ29M1aTQ97L7HG4y47nGFUsH73CULj4hrUjXPQc1l+W0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763573749; c=relaxed/simple;
	bh=JE3ZocJgP/VAvyhM1Nig7+ipiCHwKKj5khD2Q0uXfC0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=RIApuzsPGOWSTEsQk+TuZSk796bk5q/UHmFmmzY2hs17NNbwJmroYgkYF5ZBgyMqlb8oHMwUrs5AYygRZwk/zkheN95g2BSs4mvtQMeyvV/swyS6tkwYP7eQdmAjSGtY12+l2wvf3l31YM1jUCpP/zApxhsGzDaA4JFnQbz9doA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=hkCS2Pd3; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="hkCS2Pd3"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5DB851A1BBE;
	Wed, 19 Nov 2025 17:35:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 23A3260699;
	Wed, 19 Nov 2025 17:35:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6ACE510371739;
	Wed, 19 Nov 2025 18:35:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763573742; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=rF28Pbs77AhuXC+S9VeRzylQ5MN3PM7kjXAHE+zhARc=;
	b=hkCS2Pd3AU3R3wlUlX/iR32CzQUm3UAvCGfJOsk0lybfoCRwY9RtFz0oidnKpzOUFWVgIB
	zrwFv++vjdJ4V1pj2iESA6wacwgUCAZAN5cfgAduiIXx09IlqA5N2lT/hDA/wT7YiWjFwo
	50+5JhdPO+2dPhve1tH/nWE47st8Pg4an48j0ZhPQIDkRyqp4/1mbd67m6QGbfErRrg0Zw
	PNlWYnZQK1NRSV9yi1msl8k6eyQRAAhhmACDCROPZXO81HU7Tz0IcxF/b2Q1w9xNcmnLML
	nk9WJduO8FOuLWUB3yw9OTRe6cSRHZL7cX8eIKRgyRPe/ucRSqz8n3lj1LAIwg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Michael Walle" <mwalle@kernel.org>
Cc: "Tudor Ambarus" <tudor.ambarus@linaro.org>,  "Pratyush Yadav"
 <pratyush@kernel.org>,  "Richard Weinberger" <richard@nod.at>,  "Vignesh
 Raghavendra" <vigneshr@ti.com>,  "Jonathan Corbet" <corbet@lwn.net>,
  "Sean Anderson" <sean.anderson@linux.dev>,  "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>,  "Steam Lin" <STLin2@winbond.com>,
  <linux-mtd@lists.infradead.org>,  <linux-kernel@vger.kernel.org>,
  <linux-doc@vger.kernel.org>
Subject: Re: [PATCH 16/19] mtd: spi-nor: Add steps for testing locking support
In-Reply-To: <DECLLWEB1UTF.JO173TKNZ28M@kernel.org> (Michael Walle's message
	of "Wed, 19 Nov 2025 11:27:27 +0100")
References: <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-0-487bc7129931@bootlin.com>
	<20251114-winbond-v6-18-rc1-spi-nor-swp-v1-16-487bc7129931@bootlin.com>
	<DEBTGMKJKVAC.OT51M7UDN4IV@kernel.org> <87tsyqcqcl.fsf@bootlin.com>
	<DECLLWEB1UTF.JO173TKNZ28M@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 19 Nov 2025 18:35:38 +0100
Message-ID: <878qg2apsl.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

>> 5) If your flash supports locking, please got through the following test
>>    procedure to make sure it correctly behaves.
>>
>>    Warning: These tests may hard lock your device! Make sure:
>>    - The device is not hard locked already (#WP strapped to low and
>>      SR_SRWD bit set)
>>    - If you have a #WP pin, you may want to set `no-wp` in your DT for
>>      the time of the test, to only make use of software protection.
>
> Yes that is much better. BTW, I've never seen "#signal" but only
> SIG#, nSIG, SIGn or /SIG, maybe I haven't paid too much attention.

Ah, right. I'm fine either ways. I'll look for occurrences and use one
of your suggestions.

>> Please amend this text if you still think it is missing his goal.
>
> What about
>
>     - If you have a WPn pin, you may want to set `no-wp` in your DT for
>       the time of the test, to only make use of software protection.
>       Otherwise, clearing the locking state depends on the WPn
>       signal and if it is tied to low, the flash will be permanently
>       locked.

Yep, I'll use that.

>>>> +    root@1:~# flash_lock -u /dev/mtd0
>>>> +    root@1:~# flash_lock -l /dev/mtd0 $(($size - (2 * $bs))) 2 # last=
 two
>>>> +    root@1:~# show_sectors
>>>> +    software locked sectors
>>>> +     region (in hex)   | status   | #blocks
>>>> +     ------------------+----------+--------
>>>> +     00000000-03fdffff | unlocked | 1022
>>>> +     03fe0000-03ffffff |   locked | 2
>>>> +    root@1:~# flash_lock -u /dev/mtd0 $(($size - (2 * $bs))) 1 # last=
 one
>>>
>>> huh? shouldn't that be 1 * $bs?
>>
>> I don't think so:
>> - first we lock the last two blocks (offset: size - 2 blocks, length: 2
>>   blocks)
>> - then we unlock the penultimate block so that only the last block
>>   remains locked (offset: size - 2 blocks, length 1).
>
> Yes you're correct. I've read the -u for a -l (and somehow assumed
> a complete unlock in between).

You cannot imagine how many times this happened to me while
writing/testing/documenting all this :-)

Thanks,
Miqu=C3=A8l
