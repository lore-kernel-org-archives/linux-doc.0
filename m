Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9343C8700
	for <linux-doc@vger.kernel.org>; Wed, 27 May 2026 07:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779868473; cv=none; b=phy9SloERfFsT7sFU01hWlzjPUzOvTNoA5w1tPXeRPX3aQOPaGizghBQWHuWbi/szLr+LSR9uG4U+QJdUA8QNlp8qqpaOZbDoKgO4r276p/GWQLsbhYuEyuOlvZub5R6QxOIEqFF7rJe8cDN/ZTci218MKc/tjQUmq06U9Vssq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779868473; c=relaxed/simple;
	bh=CCnbIBach2b7ZY6IjHTu31zdg4aqc0EOJLy/8+XgcvQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Zl+SjIuw689rEZUMy/mFEmMhCa2x8qLtTn9Hk5Ljx2+7Z7fleexTFPMtv683ja9zfdYKO68BO2C5uOWL5hIsZR7gA1UMYbl6EGW8gK8U8sjhT2zvgfLiNTa3Dhl2z/A1ynx00qIcDvmtpn1tVTB4CngQXR4eQbk68cNRH8eSQeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=VPIWEIh0; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="VPIWEIh0"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C5A60C2C65F;
	Wed, 27 May 2026 07:54:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 18C5D601A1;
	Wed, 27 May 2026 07:54:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6E85710888942;
	Wed, 27 May 2026 09:54:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779868469; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=CCnbIBach2b7ZY6IjHTu31zdg4aqc0EOJLy/8+XgcvQ=;
	b=VPIWEIh0sjpPUqOYdaRpqxskqNu0SooOSXIFx4pGTi1qMovcRTMmaBerYwGL1G5fDkmvbg
	TRZyPkVyg1wVotOa630qjGY4iI2yk2q8GrVOZQ5V5D0y35eo6o8LuJQTyr8DSuKmx0dkII
	cju7pr+Fx3QoiY/0FaMT+lDED0ta7X7TO88h1kcqyLy1yUDbvEaofmOQiXDN8MkgcTgA2v
	rL/FzzHn5KzjVlnOh49gyK6dNq5OzoL9Vlg8394N8GW7G8JLftajR4AGmbJ7Pu8QDBe01M
	Qnmz51goUmQC2PIsnUPZXnjjGA0bOavyw4gTjnGh/fWPRmX+pvWNcLbU6IeXJQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Michael Walle <mwalle@kernel.org>,  Takahiro Kuwano
 <takahiro.kuwano@infineon.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Jonathan Corbet <corbet@lwn.net>,
  Tudor Ambarus <tudor.ambarus@linaro.org>,  Shuah Khan
 <skhan@linuxfoundation.org>,  Sean Anderson <sean.anderson@linux.dev>,
  Thomas Petazzoni <thomas.petazzoni@bootlin.com>,  Steam Lin
 <STLin2@winbond.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  linux-doc@vger.kernel.org,
  stable@kernel.org
Subject: Re: [PATCH v6 00/28] mtd: spi-nor: Enhance software protection
In-Reply-To: <2vxz8q964210.fsf@kernel.org> (Pratyush Yadav's message of "Tue,
	26 May 2026 17:35:23 +0200")
References: <20260526-winbond-v6-18-rc1-spi-nor-swp-v6-0-4092f1419f8f@bootlin.com>
	<2vxz8q964210.fsf@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 27 May 2026 09:54:25 +0200
Message-ID: <87h5ntl232.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3


> Applied to spi-nor/next. This should give us around 3 weeks to soak in
> linux next.

That's fine. Most of the build related breakages will usually be
discovered within one week. Testing feedback will anyway be much longer
to come.

> Expect the SPI NOR PR a little bit later than usual, around
> the start of the merge window so we can maximize the exposure of these
> patches.

I try to send the MTD PR between mid and end of the first week of the
merge window, getting your PR on the first days of the merge window is
still completely okay since the branches are already pulled into
linux-next.

> Apologies once again for the crappy contributor experience, I tried to
> get to this sooner, but wasn't much successful at it :-/

No worries :-)

Thanks,
Miqu=C3=A8l
