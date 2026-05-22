Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894F62C031E
	for <linux-doc@vger.kernel.org>; Fri, 22 May 2026 15:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779465313; cv=none; b=EUi3lAbSTvYvXeTP57BwD6tIcLDI716jtIkITsPR5nkKzbMj4Qh59KN3yQjYu20GMVAfK5z+go6F1XL39bWNmR/kPjHz4w6zFWHW3r5/reKRcvFT9TmOI1nBolOmLn1itZ4q14/JALvUthedhvQNKYfn3EdHqbmR4kFM+n20ivQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779465313; c=relaxed/simple;
	bh=VBHCCrIT6aJTUQLBZidYi9sgYkOpDfnCQeYwsTA2g9U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=q+pREU7hRztkcuFR+kXnSXP+HgZ5PiamKDWxrsRHlE9PQ1OJKntgLc6o8nyMBLnh6qiQ3dV/b7J1jQS7xFbX6UD9ofQPliN6DTkJkGjhM2ELORHTxkmM1HCgODwOGIU4YIMz+BhSmDAhTm9z27mSUE77plcPEuUMv55U0tiE2+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=njWClgMq; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="njWClgMq"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 92068C2C65B;
	Fri, 22 May 2026 15:56:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C2E1A6003C;
	Fri, 22 May 2026 15:55:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 13B7B108115FB;
	Fri, 22 May 2026 17:55:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779465307; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=VBHCCrIT6aJTUQLBZidYi9sgYkOpDfnCQeYwsTA2g9U=;
	b=njWClgMqEAgLUk1EtuycW1xHkCJfoqB0ww/YhqrzC7MedSwoErbd56BDT6iuWowNPVfuZj
	ifZ1Y4zSEmpNoP3U20CbKhT/yCYEC6djYz93snsFhSOU/4tqmEi1POJ6YvSKEzdj2cZ4yJ
	srDybx7RHTyxkWmnTRRoaxfWwj5Au94QsiSvpSXOTe9vP1wSwEM5WzK90l0OE3mcYSnc57
	HuXtGA6xxlGYDxzA8qgMCUn8gq6+ukAk//c1379ak1AUS0dMagywSwtzCzKrCZO7lcWH1i
	gGJ2MQi2Q1WelBLRh6KZdwZ7d/Wtndhd+4AI2O/SAn5zgT7SxLBBYs5uxAPbTQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Michael Walle
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
In-Reply-To: <9432f07f-3724-4257-b6ab-84721e619f78@linaro.org> (Tudor
	Ambarus's message of "Fri, 22 May 2026 12:10:45 +0300")
References: <20260507-winbond-v6-18-rc1-spi-nor-swp-v5-0-93453e1a9597@bootlin.com>
	<20260507-winbond-v6-18-rc1-spi-nor-swp-v5-4-93453e1a9597@bootlin.com>
	<9432f07f-3724-4257-b6ab-84721e619f78@linaro.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Fri, 22 May 2026 17:55:00 +0200
Message-ID: <875x4fphgr.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

On 22/05/2026 at 12:10:45 +03, Tudor Ambarus <tudor.ambarus@linaro.org> wro=
te:

> On 5/7/26 7:46 PM, Miquel Raynal wrote:
>> Fixes: 3dd8012a8eeb ("mtd: spi-nor: add TB (Top/Bottom) protect support")
>> Cc: stable@kernel.org
> Fixes shall be the first patches in the set.

Technically speaking all four first patches are fixes, except I don't
ask the first one to be backported. The reason why we ask fixes to be
first in the series is because we want them to be as independent as
possible from previous cleanups/changes. Here each four first patch are
targeting completely different places and should not interact with each
other. Anyway, I will re-shuffle the patches.

As for Sashiko's feedback, the AI raises the same point as our previous
discussion: the QE bit handling is really bad, and I am working on
improving this, in another series which waits for this one to land.

However the other warning it raises is IMO wrong: mixed-modes chips
(either read or write working in quad mode, and the other in single
mode) should enable their QE bit anyway. Please raise a warning if you
think this assumption is wrong.

Thanks,
Miqu=C3=A8l
