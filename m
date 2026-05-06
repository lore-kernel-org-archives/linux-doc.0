Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B762D3A75;
	Wed,  6 May 2026 09:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778061307; cv=none; b=thXbX9WfXT14GIavhuKH3xS4LvHgwfKlGankRIWJYlUjbh5c6XcHn08AbAs1qkGftSJryZ6BKFhhxD3S3t6cx7AWX4brY7jryENBlVCNkv0h5h6aOqE1G1Lf6TOeL8i0bXSvwwXn0vrNnYbSQFRUuLrvJ98YP3h9W0WSa1GlBjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778061307; c=relaxed/simple;
	bh=kry9DMuUnA50j0a4HF1Gs9PIvidQcY7aI9zrq2OMqy4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Q3OfAsYk9KbFtZOpluUx9zWMwE8wog0LfVhKrPIzKnTOr7jdlvlVywbmxXG4u0cQSD/T9VzgsyrCoJOapLJEy1++nISAEEOJO5BKQlnC1PaDKqEez0FIlhRl8LR0vmOUPUeb3RViHIc5hFJeFSDyhytoSg274zeaMElSkBpwB0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=w/K8N5T1; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="w/K8N5T1"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 56D2E4E42BDB;
	Wed,  6 May 2026 09:54:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2B8596053C;
	Wed,  6 May 2026 09:54:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D2F25102F1D29;
	Wed,  6 May 2026 11:54:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778061291; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kry9DMuUnA50j0a4HF1Gs9PIvidQcY7aI9zrq2OMqy4=;
	b=w/K8N5T1Svt/xDNEBV6ax1XTRM83cFoNBt3d8gaLlAfaXLqtb+ymSSvo01oPl7WAc1plJF
	9qHr7K731lDqUul6+eo0b/HW4MtTW/KxewO/pjvaZcppCLHhdmY0DRHgYWPpTHbz+egL6g
	D5K1JzUbOvG8CJSz5yA7sYCABXNoiF6nrlBNMnfmnmW5o4sWVXTQwMBXwVyxp/8nNSwd3j
	rAn+CiT0eXLu6bEhv68LMfVEbIBHTtGxXTOjOVwv2aHCttq1jgaTVlwpQlngo4V21nTzjI
	ci+MgVj82Dm8TMsK7ltflGvKW4YLlmT/5t/Ds1zyviZJgU9v4S5YhJu1Yv1GGQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Michael Walle" <mwalle@kernel.org>
Cc: "Pratyush Yadav" <pratyush@kernel.org>,  "Takahiro Kuwano"
 <takahiro.kuwano@infineon.com>,  "Richard Weinberger" <richard@nod.at>,
  "Vignesh Raghavendra" <vigneshr@ti.com>,  "Jonathan Corbet"
 <corbet@lwn.net>,  "Sean Anderson" <sean.anderson@linux.dev>,  "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>,  "Steam Lin"
 <STLin2@winbond.com>,  <linux-mtd@lists.infradead.org>,
  <linux-kernel@vger.kernel.org>,  <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v4 10/27] mtd: spi-nor: swp: Create a helper that writes
 SR, CR and checks
In-Reply-To: <DIBH3CCTRHPW.1J4LOJQAJ50XE@kernel.org> (Michael Walle's message
	of "Wed, 06 May 2026 11:06:22 +0200")
References: <20260403-winbond-v6-18-rc1-spi-nor-swp-v4-0-833dab5e7288@bootlin.com>
	<20260403-winbond-v6-18-rc1-spi-nor-swp-v4-10-833dab5e7288@bootlin.com>
	<2vxzbjet266g.fsf@kernel.org> <DIBH3CCTRHPW.1J4LOJQAJ50XE@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 06 May 2026 11:54:45 +0200
Message-ID: <87cxz8n9qy.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

On 06/05/2026 at 11:06:22 +02, "Michael Walle" <mwalle@kernel.org> wrote:

> On Tue May 5, 2026 at 6:05 PM CEST, Pratyush Yadav wrote:
>> On Fri, Apr 03 2026, Miquel Raynal wrote:
>>
>>> There are many helpers already to either read and/or write SR and/or CR,
>>> as well as sometimes check the returned values. In order to be able to
>>> switch from a 1 byte status register to a 2 bytes status register while
>>> keeping the same level of verification, let's introduce a new helper
>>> that writes them both (atomically) and then reads them back (separated)
>>> to compare the values.
>>>
>>> In case 2 bytes registers are not supported, we still have the usual
>>> fallback available in the helper being exported to the rest of the core.
>>>
>>> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
>>
>> I'm confused. Doesn't spi_nor_write_16bit_sr_and_check() do the same
>> thing? How are these two different?
>
> So I've never come around to finish reviewing this series due to
> personal reasons, but here are my remarks. Personally, I really
> don't like all these multiple helpers doing almost the same thing.
> But it is what is is for now.
>
> Back when reviewing this series, I've digged into this and it mostly
> evolve around how to enable the QE bit, that is defined in the 15th
> SFDP DWORD. One could see how we could consolidate all the status
> register handling in one function which are then called by the
> different (specified) quad_enable helpers.

I already had a look, it doesn't seem so straightforward. But I will
look into it deeper, I am willing to improve things. There will anyway
be a wide variety of helpers because there is a wide variety of QER
possibilities. What we can do though, is to decouple status register
writing and QE bit masking.

However, I would like to point that this is totally orthogonal to the
whole (almost 30 patch long) locking cleanup and CMP feature series, so
I do not plan to change this particular implementation in
v5. Reorganising these helpers should be done in its own follow-up
series.

Thanks,
Miqu=C3=A8l
