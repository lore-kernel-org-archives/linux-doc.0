Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2137C46AA61
	for <linux-doc@vger.kernel.org>; Tue,  4 Aug 2026 14:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785852006; cv=none; b=sp7F+p9pip300rs2U/JwPgefN0CGxIH+UK9eyTsc56wpuLPw6MC88GLjWDaQMq7u0hZwQAcqnMySL2SHCgGo46uMdQhEwYfSGKyO9ayVgUSGKXz4DSO46b9uPXRFuelG5z1AKbmUvslYOh48OKaS1ovlch5weYwlxk5GmeDH/A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785852006; c=relaxed/simple;
	bh=b0JBRU6rqpkPXrm1qWf7pXWY36DQNN4pFrWdsUcCfRQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 References:In-Reply-To; b=XIy2GpkY0me4AJJmtM4f5D4qt4Sdv7+EcLV5wLq0ELcDh+yvBPfGM+OLsrYCZzeaibqa6j6BqyGxgLdfOu0by9uik413JUhqFukCW2Kb4yx+LXphMpHeYiqB8JegG2bh6M1P/nXPmuiujjamXC+dSRLjXAL0KwQJiPHWVEJ6gT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Mj+JLglX; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Mj+JLglX"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 252431A13F7;
	Tue,  4 Aug 2026 14:00:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DE94B6029E;
	Tue,  4 Aug 2026 14:00:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 838EE11C32D07;
	Tue,  4 Aug 2026 15:59:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785852000; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=MYnFL+Ypzk65SO1mMV3bxTpELL+AnLmHbo2YIKN+9EQ=;
	b=Mj+JLglXM94XslZsQU7fXYAe6m62MC7ClEsA/Op4j65rqs3F8Z/LbOsiBo4o8IpdB5b6Aa
	rqpzD/HiBbVkzUioi+kPQwixxs+MRkBusR/LMvoZAnq+GKZtWN8NTBRmjYzd5+Bin7s6r1
	6zfs8xMvy8gF2wMc/IUZoTJi7xQL/WUcIJsOQm9pDRm5VZI3IPohvcpftgw8LKPD82qbYd
	7VA/8KnEfkb6tvNIR/zv1R3ftZDxrJ0ftefk918dgPBjv/3P4GTQdr98/vDskOa/q1XG5T
	c42xjWR+8ULiIZu02DuX3bIj72O4diVfm49zLPRAP3GN63J0F4fh3LTDWMSawg==
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 04 Aug 2026 15:59:58 +0200
Message-Id: <DKG7P6BAPV5Q.1UO4XWHZT8H15@bootlin.com>
Subject: Re: [PATCH 0/2] Documentation: html: show sections in the sidebar
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Jonathan Corbet" <corbet@lwn.net>, "Shuah Khan"
 <skhan@linuxfoundation.org>
References: <20260803-show-sections-in-sidebar-v1-0-b4fdc847525d@bootlin.com> <87cxvzxbin.fsf@trenco.lwn.net>
In-Reply-To: <87cxvzxbin.fsf@trenco.lwn.net>
X-Last-TLS-Session-Version: TLSv1.3

Hi Jonathan,

On Mon Aug 3, 2026 at 9:13 PM CEST, Jonathan Corbet wrote:
[...]
> This looks like it could be a nice improvement, but I have a couple of
> thoughts...
>
> - Did you check the PDF build to be sure that the captions don't intrude
>   in some sort of obnoxious ways?

It isn't a problem for the Yocto Project documentation PDF. You can have a =
look
at the current PDF for it (with the ":caption:" properties):
https://docs.yoctoproject.org/dev/_static/theyoctoproject.pdf

And here would be the equivalent PDF with the ":caption:" properties _remov=
ed_:
https://lufi.bootlin.com/r/JbwZLTrHzJ#s/bmg9ZecGftbwZjvfJzaeh/ustGIzT1mKYJf=
5Yayu8=3D

I can't spot any differences.

I'm struggling to get things right to build the PDF for the kernel docs, so=
 I
wasn't able to test it :-/ If you have some container image that I could us=
e, it
might help as it seems to be related to my host packages versions.

For ePUBs, as Randy mentioned, TOC is handled differently and the captions =
are
not seen in odd places.

> - I'd tweak the CSS to remove the white space below the section
>   headings, just to bind them to their subsections properly.

Got it, I added that for the next version.

Thanks!
Antonin
