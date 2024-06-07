Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com [188.165.51.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1987843AB3
	for <linux-doc@vger.kernel.org>; Fri,  7 Jun 2024 17:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.165.51.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717782332; cv=none; b=ktqyk/CHThwGXirkzGGd/Kh4CAtXeivkIyuhGX+UQfgnGqI+N9KLBxdjZMv0V6Cw1qb727Ag2PLPi/EdRQgcbassH4ZwGQBZNLHn5SYdMKsk3SEkHnNYxDnaMVnT7SvyVzZdtcMRWg1ZqZQ3JjwyzKCiA2uRLME82iNeKXSDYLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717782332; c=relaxed/simple;
	bh=oQMcO4J7iTyHNZJsTJLTJXEz3spwX3ZDFn05fm4cpdY=;
	h=Date:To:From:Subject:Message-ID:MIME-Version:Content-Type; b=eC2nBspLve4fft28beEEBuPPYgEEl8IaD5ue+nc1sF6KesH2Mt7buB1WoajWGT4m2rF3HH9ZxmVVG60QHfa49MIfYl/uS5R7M/DFcN4O2oaFA6c9unZDEd9rLP3+EeLw0MG4932MxjQQ+XVRlfoBMs60DYrnWZHxVTGtECoTd9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=Eh0CypYE; arc=none smtp.client-ip=188.165.51.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="Eh0CypYE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1717782314; x=1718041514;
	bh=oQMcO4J7iTyHNZJsTJLTJXEz3spwX3ZDFn05fm4cpdY=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Eh0CypYE8cun41Lx+k3fjFVYhJJxOXWxkQrqLq9Q/OOkeF7IIBYdUoC+jRs9GBk7R
	 2Rncf/KuoSWMxLJgz8Uuz+oy2DIffmq9hD/djbloD8zu3CRii4vBAw0PEkSrYYygKB
	 bCl6+8jhFFDKi3C8WgConYHTq7tjxHrQOCoDnSV/d8uuHnOoArkK0toMBz92d5XnyP
	 SoAdjFrnzX8tJkB4ifYSwEAv7fnDpQWsl0/VIKTHKwFVd3jIrCPHTCpeuJhzdayNMB
	 HF8KvF1ZmY29ik04mPc0eCUJwVKSaWF0dYUnwQo4DtBAws2C+LGTqqBsHkIIOJjYKo
	 aikCT6zkbJuhQ==
Date: Fri, 07 Jun 2024 17:45:10 +0000
To: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
From: Matic Urbanija <maticurbanija@protonmail.com>
Subject: Translation of kernel documentation
Message-ID: <Enls7GJQSRW6Z77NFFcLl19W5U8xKlzEGyKAIOr36JDcFQMaEYewfYgYUz5WcNW3X7Xfi7btGAXNT8Ue_WMGIjaxgdDZiKTk_CcGj-fIMH0=@protonmail.com>
Feedback-ID: 816150:user:proton
X-Pm-Message-ID: 7003811f2511d1d1f1c752ef17972f6e26ae99d2
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,=20

first of all, I'm terribly sorry if this isn't the right place to ask about=
 translation. I sent an email to helpdesk but so far no answer from them.

My name is Matic Urbanija, I am a teacher at Vegova - Upper Secondary Schoo=
l of Electrical and Computer Engineering and Technical Gymnasium Ljubljana,=
 Slovenia (https://www.vegova.si/about-us-vegova/).=20

I would like to translate kernel documentation into Slovenian language. May=
be some of my students would also like to participate.

Are there some special requirements or procedures which have to be fulfille=
d before starting translation project? What is the proper or recommend way =
to start to translate the kernel documentation?

Best regards,

Matic Urbanija
