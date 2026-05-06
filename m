Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1FB53E92BB
	for <linux-doc@vger.kernel.org>; Wed,  6 May 2026 08:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778057889; cv=none; b=RRcTSHq1l+lMzo3kwfOSZQrX5CY5XHVOi+DdnAL7grNlUb23TbY0iImdUukEJDY7hQGzqW3vuf4iwR8XP4642Kz+FBPHhT14EynnxOoNQulYVYKkoZQOoUlalXoXdvYy/xPqcDSffvO/IzTore3jyNps5LbnyILNBbQ941Dey/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778057889; c=relaxed/simple;
	bh=JlXk+xatlEthntP1Ub/7zc6zElbOfS0IevTloFk5T9U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=DE6V5igbk/jkB9+6QMgk77+CO91ga5TZNZw8JlyqYAiUIzGS+xrrK3PUWijBHm0ELKcVSG9moVdlyjNRwaS09xOosYnBLAYpWbYBMnTZ9cYrt9eFHu8QhtgT+XAYidK+GFU7Gv49UXHeFt+fr/nzzjL53PHPkmi3OEJY3M6a2Ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=GOmeB9p+; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="GOmeB9p+"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C7A36C5DC41;
	Wed,  6 May 2026 08:58:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 952886053C;
	Wed,  6 May 2026 08:57:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 12E47102F225A;
	Wed,  6 May 2026 10:57:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778057878; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=JlXk+xatlEthntP1Ub/7zc6zElbOfS0IevTloFk5T9U=;
	b=GOmeB9p+Zgol6RKfZq+3lJODiae8HJr1e7SJTAaKdNuz6vtrCeaHTOri3SC+D23e6AZm7T
	iouGhxkvZ4fGKHjAlKPW2jOaAFJZdPmRX4jjOZTtjtAGh7w01QVvUs+iQEsAWK8QM0fqps
	Oxy1uvzsElg1FBq4mGfBff4tybAjEr1ilNmQI5n3l9bpEk4nl+6bx8HeJ7KL8c9n30Mr4f
	ehFCJBvc45T/ZqyZJ0ZY/JfKNM92EVJCD28CGBANrPrHvn07RjXsYMsJiX4OTCrjTRNRqp
	BuzOw2f+Ymb4ZZwVZvmFo8COV1sEBT2b2VQL/U7/mbosRxRXcJpzlOrn3JeOFA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Michael Walle <mwalle@kernel.org>,  Takahiro Kuwano
 <takahiro.kuwano@infineon.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Jonathan Corbet <corbet@lwn.net>,
  Sean Anderson <sean.anderson@linux.dev>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Steam Lin <STLin2@winbond.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,
  linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 10/27] mtd: spi-nor: swp: Create a helper that writes
 SR, CR and checks
In-Reply-To: <2vxzbjet266g.fsf@kernel.org> (Pratyush Yadav's message of "Tue,
	05 May 2026 18:05:11 +0200")
References: <20260403-winbond-v6-18-rc1-spi-nor-swp-v4-0-833dab5e7288@bootlin.com>
	<20260403-winbond-v6-18-rc1-spi-nor-swp-v4-10-833dab5e7288@bootlin.com>
	<2vxzbjet266g.fsf@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 06 May 2026 10:57:55 +0200
Message-ID: <87tsskncdo.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hi Pratyush,

On 05/05/2026 at 18:05:11 +02, Pratyush Yadav <pratyush@kernel.org> wrote:

> On Fri, Apr 03 2026, Miquel Raynal wrote:
>
>> There are many helpers already to either read and/or write SR and/or CR,
>> as well as sometimes check the returned values. In order to be able to
>> switch from a 1 byte status register to a 2 bytes status register while
>> keeping the same level of verification, let's introduce a new helper
>> that writes them both (atomically) and then reads them back (separated)
>> to compare the values.
>>
>> In case 2 bytes registers are not supported, we still have the usual
>> fallback available in the helper being exported to the rest of the core.
>>
>> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
>
> I'm confused. Doesn't spi_nor_write_16bit_sr_and_check() do the same
> thing? How are these two different?

The prototype says it all:

static int spi_nor_write_16bit_sr_and_check(struct spi_nor *nor, u8 sr1)

It writes sr1, and you can give only sr1. But because it is a 16bit
write, it also writes cr/sr2 on which the caller has no control. This
helper is actually very chip specific, because that is one way among the
different SFDP QER field possibilities to write the QE bit.

Giving more control to the caller, including the position of the QE bit
as well as the possibility to set other bits in cr/sr2 is what is
intended in this helper. This is an internal helper btw, only the core
uses it.

Note: I will send a v5 with an update of the naming convention because
it is not super satisfying. I already have that patch, and I was waiting
for this series to get in for sending the follow-up improvements, but if
we go for a new iteration I can include these patches in. There will be
a fix of the QE bit handling in the swp.c core I am touching as well (I
forgot to handle a case).

Thanks,
Miqu=C3=A8l
