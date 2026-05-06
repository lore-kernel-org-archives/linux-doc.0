Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F81261388;
	Wed,  6 May 2026 08:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778057989; cv=none; b=jHBu8Js5IdjiAAlxffuA6xezVQw1jWZlY7ZzIGi4M8fbJ2g+iuxRv9UiIMYKQe1zanquWobtPPKkQ7w6xYEryUMCZJotIe16jxiNew0EQNBccbcDdC5vLYNvUQNSDz6qIMyYwGTyaXOnN6TCZTyn46yGBuRsUV3wyjXMRdaud2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778057989; c=relaxed/simple;
	bh=gzSc2B+pvsAFlgPTcA86xIYUW5pnwYqBlDVEl3YjGLI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=mFRRqd2+Fv1lrEA4uR6tbqSxcwSiwHHJNeslJG8bJ86L+T0+Z+qEohiK47NrPFFBniYBEa0+2n1m4c/yht1gk1D5oPmxHxXNEq0EbNNp5uTamOpngaOP5UMjOYULY1TAz/FUZXXLalZkNPFAYck94EtHGaHASeG5/p047GyMg/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=qD3dfdhn; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="qD3dfdhn"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id AF1374E42C09;
	Wed,  6 May 2026 08:59:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7E16B6053C;
	Wed,  6 May 2026 08:59:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 22115102F225A;
	Wed,  6 May 2026 10:59:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778057985; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=gzSc2B+pvsAFlgPTcA86xIYUW5pnwYqBlDVEl3YjGLI=;
	b=qD3dfdhnBnhmEeUzlbUmYK+F37PHB9DPbRnq+Z64mQsrHNR+DCLGh95FG+tx8h4It+CHZd
	qKhe0XUSS84e5dPIFl6IHPmCLCLweexa+q0nxIJ3RXtME3Hs2dJftwntfN4fNJc/THBnaQ
	LhVqR41k8iBoby7on90yB3wq+/9kRlYgvgSmcLiadStp90PEgj0W0ZzFgeYi2aTFoATlji
	eps/wAf1lqTez/lT1M/fN8ysVB9S467nNWzptPxYLbi+2KqIJPXCJbH9J5vae52szb9vur
	pMDeOi7jLmRFu2jvJ6VNQHAu95hAFGXoNWFStrbbLGU+ldKLq/IXRz8p+ihmbg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Michael Walle" <mwalle@kernel.org>
Cc: "Pratyush Yadav" <pratyush@kernel.org>,  "Takahiro Kuwano"
 <takahiro.kuwano@infineon.com>,  "Richard Weinberger" <richard@nod.at>,
  "Vignesh Raghavendra" <vigneshr@ti.com>,  "Jonathan Corbet"
 <corbet@lwn.net>,  "Sean Anderson" <sean.anderson@linux.dev>,  "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>,  "Steam Lin"
 <STLin2@winbond.com>,  <linux-mtd@lists.infradead.org>,
  <linux-kernel@vger.kernel.org>,  <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v4 16/27] mtd: spi-nor: Create a local SR cache
In-Reply-To: <DIBGRTZ3BUEE.1GIAWVBNNXUY5@kernel.org> (Michael Walle's message
	of "Wed, 06 May 2026 10:51:20 +0200")
References: <20260403-winbond-v6-18-rc1-spi-nor-swp-v4-0-833dab5e7288@bootlin.com>
	<20260403-winbond-v6-18-rc1-spi-nor-swp-v4-16-833dab5e7288@bootlin.com>
	<2vxz7bph25qx.fsf@kernel.org> <DIBGRTZ3BUEE.1GIAWVBNNXUY5@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 06 May 2026 10:59:43 +0200
Message-ID: <87o6isncao.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3


>>> In order to be able to generate debugfs output without having to
>>> actually reach the flash, create a SPI NOR local cache of the status
>>> registers. What matters in our case are all the bits related to sector
>>> locking. As such, in order to make it clear that this cache is not
>>> intended to be used anywhere else, we zero the irrelevant bits.
>>>
>>> The cache is initialized once during the early init, and then maintained
>>> every time the write protection scheme is updated.
>>
>> What is the reason for doing so? Do the reads have side effects?
>
> I don't like that a debugfs read will issue a SPI transaction, at
> least not these informational files.
>
> If we ever want to access the registers in the flash, we should have
> a separate debugfs file/interface.

Indeed, the intent was to be able to generate complete debugfs output
without any physical access.

Thanks,
Miqu=C3=A8l
