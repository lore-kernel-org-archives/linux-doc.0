Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79313DBD46;
	Tue, 26 May 2026 10:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779791953; cv=none; b=EmPYvA/zsP4BdqZRUyucqpD8SYEkNU7t7fG64/7LgCs5FVEWx3OT+bSYU0DGq0slL9GJHu4HzOAiMiygjE/EfDnvyKmSQlxCUYQsxIS2SPM6E2P69o5nj1WXQx4lwPkQ8Sa29jyLQsMokIqLEyz0tWFvahXidSU4qozCBAU6eME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779791953; c=relaxed/simple;
	bh=Mb6jR+0huoXc9SGM7mM2JEsxyQRL6LGDl24weSuJayI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=jqzNGLmogdvAD82RH/t6tG/szMICddFL6gIO+mKqGrdGYKLMLvOF7Q3za6esCG7q0V80vUflpR/nxcKxSLS9F7j8kUXVlq+bSUvfLtepx50VcxOfdVKnGYeRl1yGatkN+HX4+L0nUxRIzldxX5+1PW9zPibEYvNFTyCECX1077c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FESVv6Km; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FESVv6Km"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E61761F000E9;
	Tue, 26 May 2026 10:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779791952;
	bh=azs2doTn6WRcYeDt2Z4GFWdIIH9QPs8kBk3Pel10+sg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=FESVv6KmUcG9mG5Val3ZWzwaoCbxIW1TDDMFUzHpao8wF25ZG7ukaHj6TbohtehGB
	 ep0rgCAzaaV5mOlavkP1E5/bas4By3CpxMdnlLvcaR28FE4Vz9sTq0oZHUGbyGTMn6
	 ypXswy17YuWTuva6bSVoj3pU0XRitbc90haYGUFbf+D1MM5Z10e+D9wTkqyiAwDYHt
	 SVjAm5aGSnI9e7JToacTBktRYu2p46jVjkF31GNbTCDHstcQGdZFbzrVLgLxYuGF3s
	 Q6UjQ90f/v5RZa4WQFq+PmNBsS+2RHnqqYDTl3l/J0yIZKNTMRH1/2+gCQ/2C1+Wwm
	 Eunr4anIacNvg==
From: Pratyush Yadav <pratyush@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,  Takahiro
 Kuwano <takahiro.kuwano@infineon.com>,  Richard Weinberger
 <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,  Jonathan Corbet
 <corbet@lwn.net>,  Shuah Khan <skhan@linuxfoundation.org>,  Sean Anderson
 <sean.anderson@linux.dev>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Steam Lin <STLin2@winbond.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,
  linux-doc@vger.kernel.org,  stable@kernel.org
Subject: Re: [PATCH v5 04/28] mtd: spi-nor: swp: Improve locking user
 experience
In-Reply-To: <87o6i7o0tj.fsf@bootlin.com> (Miquel Raynal's message of "Fri, 22
	May 2026 18:39:52 +0200")
References: <20260507-winbond-v6-18-rc1-spi-nor-swp-v5-0-93453e1a9597@bootlin.com>
	<20260507-winbond-v6-18-rc1-spi-nor-swp-v5-4-93453e1a9597@bootlin.com>
	<9432f07f-3724-4257-b6ab-84721e619f78@linaro.org>
	<875x4fphgr.fsf@bootlin.com>
	<779f2680-2c67-4bbd-9576-bde8e83d111d@linaro.org>
	<87o6i7o0tj.fsf@bootlin.com>
Date: Tue, 26 May 2026 12:39:08 +0200
Message-ID: <2vxz8q965ub7.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, May 22 2026, Miquel Raynal wrote:

>>> Technically speaking all four first patches are fixes, except I don't
>>> ask the first one to be backported. The reason why we ask fixes to be
>>> first in the series is because we want them to be as independent as
>>> possible from previous cleanups/changes. Here each four first patch are
>>> targeting completely different places and should not interact with each
>>> other. Anyway, I will re-shuffle the patches.
>>
>> you don't need to resend just for that I think. Pratyush or Michael can
>> re-shuffle when applying.
>
> It's a bit painful to do while applying, I will send a v6.

I didn't get what we want to shuffle. Do you want to have this patch as
03/28 and "mtd: spi-nor: Make sure the QE bit is kept enabled if useful"
as 04/28? If only that, I can do this myself when applying.

And here's what I am thinking: the first 9 patches are reviewed and good
to go. I want to land them in this merge window so we cut down your
patchset and land stuff sooner.

Unfortunately I just can't seem to find time to review this series so I
hope this helps some at least.

-- 
Regards,
Pratyush Yadav
