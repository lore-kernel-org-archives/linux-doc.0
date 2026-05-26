Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A7636921E;
	Tue, 26 May 2026 15:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779809731; cv=none; b=qwX+oCqfZ+3t8ximvOOGMQrvHZVNUTJ13mRUJZf3o9YgmFKdCwcDaM5pbp74Iz77i9VNjpQLJBHgtKRDwclUseV7x+uhJCGqRylEj+dxI6n0kjsOZ14Av8wPzQKicXiNdoWHY332vwUeWCOlBjeKEOGGn966e5ccUrfxpuLMbw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779809731; c=relaxed/simple;
	bh=wX5CaZYldP3pyqhR5lllHls5WmvmYsAIKVZyFagKk3s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=MOaLqmM/Ta31VT4caLFYIzoEec82TV1Fpp1jiPuIMWh6tRERicNamn5TGeW6jgbTdNZjV7Jz1p933oNZLPedkwUC+/2b/IRDVOxzh7P+l0HclojohWX8KewFvPmf59+qc+k42BmQoiFjSv3v6sOhkhH1lVn8sSCbE+Ix2y6B6dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CZo4exUQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CZo4exUQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6E2F1F000E9;
	Tue, 26 May 2026 15:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779809727;
	bh=idMbG6Muree+cvLwC3HEjKGEVbk/jCLWFu0evZJQ3Ig=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=CZo4exUQ2oXd7kuFQy8VkDB82ZOWnadorXWtHXCVIm88pFgxiAKvx1RAI09eyQy7l
	 0HM3twUxFtVgIgG0G34YVmSPaBqlQnUiKlsNeL6+BtjaR6in7dJ8IBRtUB0NvE2cim
	 Sl4ZBQUCHOx2ogeVpW6pniOYryqnfzYZIIupJc1IP/krGbGhkSJx8MTT07jtinEjeI
	 Egu2kcUoZMx1jCx3EjC3mHbY9zImTdS4f4sQYMH2k3swblnNRr8aQlBrR/4ldNDe6r
	 YeYVg2UyYq47go1wzR7+SrgvWAVSLAs6AFptom5GmwBELQmLzqpmcYq5ouY4HDj6Gm
	 kSekovzGLJ8XA==
From: Pratyush Yadav <pratyush@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Michael Walle
 <mwalle@kernel.org>,  Takahiro Kuwano <takahiro.kuwano@infineon.com>,
  Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Jonathan Corbet <corbet@lwn.net>,  Tudor Ambarus
 <tudor.ambarus@linaro.org>,  Shuah Khan <skhan@linuxfoundation.org>,  Sean
 Anderson <sean.anderson@linux.dev>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Steam Lin <STLin2@winbond.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,
  linux-doc@vger.kernel.org,  stable@kernel.org
Subject: Re: [PATCH v6 00/28] mtd: spi-nor: Enhance software protection
In-Reply-To: <20260526-winbond-v6-18-rc1-spi-nor-swp-v6-0-4092f1419f8f@bootlin.com>
	(Miquel Raynal's message of "Tue, 26 May 2026 16:56:24 +0200")
References: <20260526-winbond-v6-18-rc1-spi-nor-swp-v6-0-4092f1419f8f@bootlin.com>
Date: Tue, 26 May 2026 17:35:23 +0200
Message-ID: <2vxz8q964210.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, May 26 2026, Miquel Raynal wrote:

> Hello,
>
> Back in October 2025, the "locking" support in SPI NOR was discussed on
> the mailing list (link below). The conclusion was that this support
> could benefit from some enhancements. As I myself had to dig into it,
> here is a proposal.
>
> First issue that I see, the MEMLOCK ioctl is not behaving correctly
> in some cases, as addressed in:
>
>     mtd: spi-nor: swp: Improve locking user experience
>
> Then there is no clear explanation of the shortcuts taken by the kernel
> in terms of uAPI, so there is an attempt to list them in:
>
>     mtd: spi-nor: swp: Explain the MEMLOCK ioctl implementation behaviour
>
> Plus, Tudor also asked if we could cover locking in the testing
> procedure, which is done in:
>
>     mtd: spi-nor: Add steps for testing locking support
>
> In order to simplify this procedure, and because it got very helpful
> during my testing/development, I want to propose additions to the
> debugfs output:
>
>     mtd: spi-nor: debugfs: Add locking support TODO: make the captures again
>
> Finally, I am providing an implementation for the complement (CMP)
> feature in order to allow finer control of the regions locked. This
> feature is for instance available on Winbond chips:
>
>     [core] mtd: spi-nor: swp: Add support for the complement feature
>     [doc]  mtd: spi-nor: Add steps for testing locking with CMP
>     [use]  mtd: spi-nor: winbond: Add CMP locking support
>
> Disclaimer: it was much less straightforward than I initially thought to
> get the CMP feature working correctly. I tested it with as much focus as
> I could, and I am improving the test coverage for the new cases, I am
> also providing extra test cases in the metadata of the commit (which do
> not make sense to test for chip additions, but may be sensible show when
> making core additions like this one), but honestly there are so many
> possibilities, I may still be missing corner cases. I hope this will
> anyway be helpful to others!
>
> All the other patches are misc improvements or style fixes which I faced
> and fixed during my development.
>
> Link: https://lore.kernel.org/linux-mtd/92e99a96-5582-48a5-a4f9-e9b33fcff171@linux.dev/
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied to spi-nor/next. This should give us around 3 weeks to soak in
linux next. Expect the SPI NOR PR a little bit later than usual, around
the start of the merge window so we can maximize the exposure of these
patches.

Apologies once again for the crappy contributor experience, I tried to
get to this sooner, but wasn't much successful at it :-/

[...]

-- 
Regards,
Pratyush Yadav
