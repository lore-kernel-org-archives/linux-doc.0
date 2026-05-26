Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A33F3BCD21
	for <linux-doc@vger.kernel.org>; Tue, 26 May 2026 14:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779806657; cv=none; b=gl0pVFKOj7cpV52D9zFK5ZUvppBBQLTU0fC9ZdWx1o4oD+aLx46esN3bEAnSYaBFwgWuVkGDro5ny6GMeHZLuBQ4t46rcc6jYWXmU6AxJ1Sp/POLT4+APpLZ0/EFdSryaDedjY6GLYR4Q9l/YvCXVAtJBwoO7wJqi+qtqj1XIaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779806657; c=relaxed/simple;
	bh=p5nt9YTtEoTZf0kfn3EpHA1X6rrmupT53YJix95PNrU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=gl5myzl1kFcHaC0/JQmCbbEGFmu9iAk19sJHd/aOA793sooSmc9qagM1hHlycOuxfiZ74A75+rGfIQLa1YNxkMm4bXCRyA2fSE5zwW+3Beg+/8TzKmjBicnsh36FB2LCCWy8H/Rw1HWJO+UItZxNFDwJ+mdEhdHlxgxukY6W200=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Vv+hmA47; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Vv+hmA47"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id BFD071A36C7;
	Tue, 26 May 2026 14:44:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8456F6011D;
	Tue, 26 May 2026 14:44:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2FAF110888872;
	Tue, 26 May 2026 16:44:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779806652; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=p5nt9YTtEoTZf0kfn3EpHA1X6rrmupT53YJix95PNrU=;
	b=Vv+hmA47N3XhbjDiDUSrk2tGTIMJ10KaA1NKpWXwAmBiOjPjMsNPt2J5UkiXHZi56+XWtF
	leSfo1gOjz2HrKiDS52d9Yt4e8EALXnMNdjRqUtAPgzVAA3Jpt/X2G6DDBU9j3G5g9y3nK
	VQt16fM+ArBXKbfKfkrFTlQX6SrIsfw5U2v05n8X5GNjDvAHCYof4JVnQ1zKzE6nvwRrl2
	FBSX+611O3XCO4Fr49q56FDiEwgb2D90rJv5HUPQok3ztqfKrTCpAttu0yTm53Tk9YonB3
	FLOTPMJFLvBtoq6fkfwjh46zZC+Ud+qHiDgy4D0obi/gzvZDRkvHfvVg9m6jQw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Michael Walle
 <mwalle@kernel.org>,  Takahiro Kuwano <takahiro.kuwano@infineon.com>,
  Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Jonathan Corbet <corbet@lwn.net>,  Shuah Khan
 <skhan@linuxfoundation.org>,  Sean Anderson <sean.anderson@linux.dev>,
  Thomas Petazzoni <thomas.petazzoni@bootlin.com>,  Steam Lin
 <STLin2@winbond.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  linux-doc@vger.kernel.org,
  stable@kernel.org
Subject: Re: [PATCH v5 04/28] mtd: spi-nor: swp: Improve locking user
 experience
In-Reply-To: <2vxz8q965ub7.fsf@kernel.org> (Pratyush Yadav's message of "Tue,
	26 May 2026 12:39:08 +0200")
References: <20260507-winbond-v6-18-rc1-spi-nor-swp-v5-0-93453e1a9597@bootlin.com>
	<20260507-winbond-v6-18-rc1-spi-nor-swp-v5-4-93453e1a9597@bootlin.com>
	<9432f07f-3724-4257-b6ab-84721e619f78@linaro.org>
	<875x4fphgr.fsf@bootlin.com>
	<779f2680-2c67-4bbd-9576-bde8e83d111d@linaro.org>
	<87o6i7o0tj.fsf@bootlin.com> <2vxz8q965ub7.fsf@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Tue, 26 May 2026 16:44:05 +0200
Message-ID: <87v7cakz7u.fsf@bootlin.com>
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

> And here's what I am thinking: the first 9 patches are reviewed and good
> to go. I want to land them in this merge window so we cut down your
> patchset and land stuff sooner.
>
> Unfortunately I just can't seem to find time to review this series so I
> hope this helps some at least.

I know what the maintainer load can be, sometimes it does not play well
with the rest of the your personal and professional duties. But the
series has already been on the list for about 8 months, it's been looked
at by other people, the ones who had enough time to dedicate to it. From
my perspective, asking such contributions to wait indefinitely and then
suggesting partial application without a technical reason is not a
sustainable way to handle contributions. This series has not moved much,
it could have been applied *much* earlier. I've now addressed most of
the comments from Sashiko, v6 is coming, further improving the quality
for sure, as there were bugs - there are always. I am of course happy to
address further technical concerns, if there are any, but I would
strongly prefer merging the series as the coherent set it was intended
to be, rather than only taking the preparatory parts.

On top of that, as mentioned previously, I now have additional spi-nor
improvements and cleanups waiting behind this series. Keeping such a
large stack of out of tree patches for months is becoming painful to
maintain.

Thanks,
Miqu=C3=A8l
