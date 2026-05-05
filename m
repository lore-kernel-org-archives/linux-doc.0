Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1089481FAD;
	Tue,  5 May 2026 16:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777997115; cv=none; b=JdTZGOnZA9Lr0TbIad9Utz0VvZXLxR9qm3vkaMPGv2on+fpT0ZXOpDXIgSfYxspd7/NTnNkhvpvp0819rE/cUKzR9MMdVZqzRDeTgJGGVlGoC7VXRPXWMB7jFXGT6g9W6CmIXap6+wOapJ5UO/bOU3S/VnPYNPiXVKmWff17seU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777997115; c=relaxed/simple;
	bh=trnk4uG+uuv7clGk9dMv9N6Jna5KQ4Kj/uFyHAZAE+k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Axi70c+0/L/syaMPyf+i7yQrXb8Vug8HAxqrvs8BR/hRVful0h4+XhqUORAKbkfeEGbVbPbpmtxUvDVl5HO9NARAvEXfp5HYn6khGEwQH7CT3m0NLRkuvz5RYi+sEII6Xg+4D40mfi0Dk19TVO+n1P1gPalkMtSZEzQVb50DlEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YodhOV2o; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YodhOV2o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 453F6C2BCB4;
	Tue,  5 May 2026 16:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777997115;
	bh=trnk4uG+uuv7clGk9dMv9N6Jna5KQ4Kj/uFyHAZAE+k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=YodhOV2o7J+a1layHvqfYd50fkptIsErwIZB2qAzJ1LWSlzLnE7XonexnsyfWd8aN
	 mtyEqSVAHkEUMs248G9zacGpHIVJyfkccC36jwuhhCtnxcepdKn5NfwDgnPJ2sMOtL
	 aYTKFupv6Y35vNlSkUMIlaJqJHt1MWwevxbvKIaBLOMs6ZyLIdsjjqa3yEiFxzodf7
	 gvjhOEpCQWiK5JdsVfXxskLIMZEGYtzlx7gMHjVJ8b1V6/jobdvfXCB3L9ifxweeto
	 fdQouHB6TEmdMqL5hyB7vZ+RbXM03qCJvkkpl0T0vQuDOJAi2wSxByflhbVSOmTWz7
	 o4ejh79nvorTQ==
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
Subject: Re: [PATCH v4 10/27] mtd: spi-nor: swp: Create a helper that writes
 SR, CR and checks
In-Reply-To: <20260403-winbond-v6-18-rc1-spi-nor-swp-v4-10-833dab5e7288@bootlin.com>
	(Miquel Raynal's message of "Fri, 03 Apr 2026 18:09:28 +0200")
References: <20260403-winbond-v6-18-rc1-spi-nor-swp-v4-0-833dab5e7288@bootlin.com>
	<20260403-winbond-v6-18-rc1-spi-nor-swp-v4-10-833dab5e7288@bootlin.com>
Date: Tue, 05 May 2026 18:05:11 +0200
Message-ID: <2vxzbjet266g.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Apr 03 2026, Miquel Raynal wrote:

> There are many helpers already to either read and/or write SR and/or CR,
> as well as sometimes check the returned values. In order to be able to
> switch from a 1 byte status register to a 2 bytes status register while
> keeping the same level of verification, let's introduce a new helper
> that writes them both (atomically) and then reads them back (separated)
> to compare the values.
>
> In case 2 bytes registers are not supported, we still have the usual
> fallback available in the helper being exported to the rest of the core.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

I'm confused. Doesn't spi_nor_write_16bit_sr_and_check() do the same
thing? How are these two different?

[...]

-- 
Regards,
Pratyush Yadav
