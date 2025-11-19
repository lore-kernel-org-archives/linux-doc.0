Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3960733D6CB
	for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 09:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763544004; cv=none; b=iTBkHP1rO985oCcIC6c/qhB0oQLeg7KwlMD/P+FdafbLB5cPKOhbMjVewhfSRnq1R2EpS40hZo3AdrIZT54k+ANtVebq7aKJbAsPvDjhEgEUl5YsxZMcPqwTt+Ps1ym+THIRrul+cTh5hgtp4/JDNedNiiAYIANaH8FxOSIOKNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763544004; c=relaxed/simple;
	bh=EwmAMJIFnDR1EPtnj98McrOf0sLvp4Xwrmi0okZD8zs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=jTtVd07BWsINuF7xhh0W4O8VDsKzlhQ2YfCmHY0qI48BfjwQb6pXEKIzDEvULqoEdKRaCFFpGz4U/JyWj41mngX9IbMkhH7L4k9EN/8Nwoi9gYjvpz2hJycPQcvIhRULp1NjqCEI8jtP8upFIpdzKAl0Kg6vPDdZXlUaeTZHO+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=O10zcVHl; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="O10zcVHl"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 08631C11185;
	Wed, 19 Nov 2025 09:19:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3DB7760720;
	Wed, 19 Nov 2025 09:19:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7D83F103719CC;
	Wed, 19 Nov 2025 10:19:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763543996; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=EwmAMJIFnDR1EPtnj98McrOf0sLvp4Xwrmi0okZD8zs=;
	b=O10zcVHlY/aJcAjawEWMiDdTh8d1BH0PW++33KZruso/M0VDJ2AlRoDqGkGi1uJFRGbMO6
	oU+Tc4t6IFJn0/k+hI/u5AHYSrnyIki/kRn62y1AUxx4qlH15R/FwfNu8V5lqSzI7YfH1N
	jS00FiHEzUlS/oa2t4mQ2SMptJ1G2Qkb12RQVKOjfU1cQdydDfveU2H9x28R4RiVy4JcMn
	USl/D63hao41vo8jb90elvT752uw9shGzK1Ll0TdQCWxYeL6knzudD1jxTAjNkckDq36Dj
	Yzj199duac2yoKeg+icTrQ05z981kkkx6upPQ6MPegdJy5BtSuu2xxyofPRAiw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Michael Walle" <mwalle@kernel.org>
Cc: "Tudor Ambarus" <tudor.ambarus@linaro.org>,  "Pratyush Yadav"
 <pratyush@kernel.org>,  "Richard Weinberger" <richard@nod.at>,  "Vignesh
 Raghavendra" <vigneshr@ti.com>,  "Jonathan Corbet" <corbet@lwn.net>,
  "Sean Anderson" <sean.anderson@linux.dev>,  "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>,  "Steam Lin" <STLin2@winbond.com>,
  <linux-mtd@lists.infradead.org>,  <linux-kernel@vger.kernel.org>,
  <linux-doc@vger.kernel.org>
Subject: Re: [PATCH 07/19] mtd: spi-nor: swp: Clarify a comment
In-Reply-To: <DEBQB9D7POZD.2S729874RIZH6@kernel.org> (Michael Walle's message
	of "Tue, 18 Nov 2025 10:55:58 +0100")
References: <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-0-487bc7129931@bootlin.com>
	<20251114-winbond-v6-18-rc1-spi-nor-swp-v1-7-487bc7129931@bootlin.com>
	<DEBQB9D7POZD.2S729874RIZH6@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 19 Nov 2025 10:19:53 +0100
Message-ID: <87zf8icrba.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

On 18/11/2025 at 10:55:58 +01, "Michael Walle" <mwalle@kernel.org> wrote:

> On Fri Nov 14, 2025 at 6:53 PM CET, Miquel Raynal wrote:
>> The comment states that all power of two sizes are not supported. This
>
> No it says "some power-of-two". That's clearly not all :)

Ah crap, I failed at replicating the comment here. Well, the change I
believe is still correct but the commit is indeed wrong, I'll fix it.

> I'm fine with either:
> Reviewed-by: Michael Walle <mwalle@kernel.org>

Thanks,
Miqu=C3=A8l
