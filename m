Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0973CCFA6;
	Wed, 27 May 2026 07:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779868284; cv=none; b=ZKq5usUwyChzUrgWWIYkyiwkJTb9uGAtrYhc4l5o/vMZDkFuSyvTBUIGLvDs1yYKNxvPQOMlKZ3XEmBf0L2ywL/ERkiaDG0e4sH1gzECagI4Ay/YnT6f6Q1HAlQrIQOQkkrT5Qq94iGsG86rojp3J1oh/s5NJE/SHTrL4IZ3czA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779868284; c=relaxed/simple;
	bh=1hAPk0fCzqKDEWyYlZld8zHu9LYU5ItX3xTPPOXG93w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=nvx/bsILjdpoQbAyjzjQgCnJgZbWeqnjZ8m9o60LQ7OFLhpu43VQ/gyLur2UMSmOZAekTQQ4YJKrgSwNx1GrrZ6TU6rYpekpympHYwSf9HMLKgxHvVIx7RQ2gHWjZXISTiQJgFEEXZ3lcJ6eUodCR6xZdOC/g6aQwTN/3XYyMsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=C/ux/zih; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="C/ux/zih"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E68E04E42D64;
	Wed, 27 May 2026 07:51:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B9003601A1;
	Wed, 27 May 2026 07:51:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CB1AF1088805F;
	Wed, 27 May 2026 09:51:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779868277; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=1hAPk0fCzqKDEWyYlZld8zHu9LYU5ItX3xTPPOXG93w=;
	b=C/ux/zihO8IHOB1g5WttQW5EU71hCn3ZPiATSjNDLmaPPcZruY/j64VUAG7U54lppvi6sK
	H3ObYWKG32jW8pp6pDLaR4DADasGoDpLg/8l+OsXAMWQ1Sn5UieTyjd8PR0dsK9kDRg5LT
	KzI7ISjePwtE2EZnbMP3ZXXhGlLXQLpInhNz7TddzyjsdDRvSVlxesVIkj3gdh0AfpBPPp
	j/xTkCzud86K/rENIJinYtHem/MX0IqljP/+2CisHdn2r1wsTiim7BcODKrNhf02xjLW/t
	c5H72244z7BXYuBkXS7Neow+vKpGI/Vkw96+FeNiQX5yzLToplg9OCb1Vjrbxg==
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
In-Reply-To: <2vxzcxyi42qh.fsf@kernel.org> (Pratyush Yadav's message of "Tue,
	26 May 2026 17:20:06 +0200")
References: <20260507-winbond-v6-18-rc1-spi-nor-swp-v5-0-93453e1a9597@bootlin.com>
	<20260507-winbond-v6-18-rc1-spi-nor-swp-v5-4-93453e1a9597@bootlin.com>
	<9432f07f-3724-4257-b6ab-84721e619f78@linaro.org>
	<875x4fphgr.fsf@bootlin.com>
	<779f2680-2c67-4bbd-9576-bde8e83d111d@linaro.org>
	<87o6i7o0tj.fsf@bootlin.com> <2vxz8q965ub7.fsf@kernel.org>
	<87v7cakz7u.fsf@bootlin.com> <2vxzcxyi42qh.fsf@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 27 May 2026 09:51:14 +0200
Message-ID: <87mrxll28d.fsf@bootlin.com>
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

>> I know what the maintainer load can be, sometimes it does not play well
>> with the rest of the your personal and professional duties. But the
>> series has already been on the list for about 8 months, it's been looked
>> at by other people, the ones who had enough time to dedicate to it. From
>> my perspective, asking such contributions to wait indefinitely and then
>> suggesting partial application without a technical reason is not a
>> sustainable way to handle contributions. This series has not moved much,
>> it could have been applied *much* earlier. I've now addressed most of
>> the comments from Sashiko, v6 is coming, further improving the quality
>> for sure, as there were bugs - there are always. I am of course happy to
>> address further technical concerns, if there are any, but I would
>> strongly prefer merging the series as the coherent set it was intended
>> to be, rather than only taking the preparatory parts.
>
> Unfortunately I am only a patch monkey for SPI NOR these days and do not
> have any time to do reviews, especially for big series. I mainly check
> for reviewed patches and try to apply them. Even that is becoming harder
> these days since I am more busy at new $DAYJOB.

I fully understand that.

> I understand your frustration, and do take the blame for this, but
> unfortunately can't promise anything better in the future. We pretty
> much don't have any active reviewers in SPI NOR. Michael and Tudor are
> also short on time these days. If your employer cares about SPI NOR,
> perhaps you can encourage them to support developers in helping out with
> reviews and maintenance.

Well, I believe I already take a faire share in reviewing and
maintaining the subsystem :-) I even started getting a look into spi-nor
patches recently since I ramped up on the subsystem.

Michel and Tudor regularly make useful feedback, Takahiro is ramping up,
I try to keep enough availability for maintaining NAND, SPI NAND and
anything that is MTD but not in one of the three main subsystems. I
don't think we are in a bad maintainership situation.

> Applying the reviewed patches reduces the total patchset size and does
> make things easier to review and land. So I don't get why you are so
> opposed to the idea.

Applying series partially is okay; specifically for this series,
patches 1-8 could have been taken alone, but a bit earlier IMHO.

> But anyway, I'll bite the bullet here and apply the series. You
> generally have high quality patches so I am not super worried about this
> to begin with. We can deal with the bugs or shortcomings later I
> suppose...

Just to be clear, I am not asking for a fast path here. We need to
follow the contribution and review model, because that is the saniest
model that worked well for us until now. I am however opposed to the
statut quo situation that was progressively settling because of the lack
of availability.

Also, I am always following closely when patches get applied, so I can
respond quickly in case of breakage.

Thanks for your work Pratyush, don't get me wrong, your work is highly
appreciated, and your availability is a parameter we will comply with.

Cheers ;-)
Miqu=C3=A8l
