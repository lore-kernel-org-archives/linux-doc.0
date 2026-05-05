Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F92148B373;
	Tue,  5 May 2026 16:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777997674; cv=none; b=iup7QSp6/wq/1q+OPzo+NOEcoQX7vx+4IjJK2nOL6vPUG01RlfUA+vySrAVF15U6mKKE85MT/F19+A0igxBW2ulQCl5h7IH2CgQw8hNjdFs9SBQvdlKMUckhT4xKR7kpfYG589RGekizr5MCrsirJFbbD5hfdDh6dP3wJN8WHew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777997674; c=relaxed/simple;
	bh=/g1Ox+gTCBSY9A/ja/iJ7Sh7jfXHI2TVv6ev9lMDqks=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ipDHFcN/hPwFmroRnctnDyy8kJg37jI4RStFSO3RfWiA2ogZY30SYkDV0GSJY9bt39XLFUuKi6cj8Ndo141uYfZcyp8dY48egzcAqAeBQ0G5kCN6hr22UrL8ovruE7XQLidCu4XusfvAqJr5OfEZAFarvZ2jyC6/KmhjllHF8XU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DYMvY6LQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DYMvY6LQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D469AC2BCB4;
	Tue,  5 May 2026 16:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777997674;
	bh=/g1Ox+gTCBSY9A/ja/iJ7Sh7jfXHI2TVv6ev9lMDqks=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=DYMvY6LQMT3aYGRFAMej5fDU51HPZ1TWgUlguVWYgpYTB94G4SeJaAr4IcPpXrEon
	 MGlSeg5qBMT4iThkZxOjW8qqZRyMLwLzctVjI+kC3inE6jdkQYzqoVUO53H0p81wTl
	 exxtoCSa2/+GKtOu47I9XgL+SCDLMQQslARcb99hAvkiOWSmr4/XOB0Fuo/B6zPmL9
	 BrR3P9rygWsWQxiVwKXnwOQJSjxSJ1BZQDa2i3x0refWnikblIl/Yd+cZuSW1aoEbt
	 pR7Xrpm3O0O5YyP7YeMPauyi8N+2+RJly8M8oWzEg7gDHzcMdeabQ9zZwU8QjS2YRg
	 nxePhPrwQS4zQ==
From: Pratyush Yadav <pratyush@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Michael Walle
 <mwalle@kernel.org>,  Takahiro Kuwano <takahiro.kuwano@infineon.com>,
  Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Jonathan Corbet <corbet@lwn.net>,  Sean Anderson
 <sean.anderson@linux.dev>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Steam Lin <STLin2@winbond.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,
  linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 16/27] mtd: spi-nor: Create a local SR cache
In-Reply-To: <20260403-winbond-v6-18-rc1-spi-nor-swp-v4-16-833dab5e7288@bootlin.com>
	(Miquel Raynal's message of "Fri, 03 Apr 2026 18:09:34 +0200")
References: <20260403-winbond-v6-18-rc1-spi-nor-swp-v4-0-833dab5e7288@bootlin.com>
	<20260403-winbond-v6-18-rc1-spi-nor-swp-v4-16-833dab5e7288@bootlin.com>
Date: Tue, 05 May 2026 18:14:30 +0200
Message-ID: <2vxz7bph25qx.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Apr 03 2026, Miquel Raynal wrote:

> In order to be able to generate debugfs output without having to
> actually reach the flash, create a SPI NOR local cache of the status
> registers. What matters in our case are all the bits related to sector
> locking. As such, in order to make it clear that this cache is not
> intended to be used anywhere else, we zero the irrelevant bits.
>
> The cache is initialized once during the early init, and then maintained
> every time the write protection scheme is updated.

What is the reason for doing so? Do the reads have side effects?

>
> Suggested-by: Michael Walle <mwalle@kernel.org>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
[...]

-- 
Regards,
Pratyush Yadav
