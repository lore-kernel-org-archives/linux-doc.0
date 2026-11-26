Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795690877;
	b=irxIvbzDDIHQdHulUvfh4Q+fudzha8G2iObo+sk1IR1AQkbidaCuboC+aHHaVbin1fBe
	 3MsN5x5ZL2HtxsVSzPmIKV4LSjHJZLf3Z556zQgekD28rRZP4sTBPL+BculRnI8Xt2ysx
	 2xEETGMZwnKrhfMl0hWosgObzlvD1qe0XDT0s9VvYSpu9Ia0tsEMv3QVxyMmbD6VdO2Pd
	 nQDx9nnC86+8MFHThut8zgHQz066mGr4k0T1pqjMqlKUrljxsDZdKfAEJInvHCn/Q+sb6
	 y8LZ0bIX/22gPEU5S9dt5dSQhOj0wTZst6J57TlcWR9KAPBE/fCojlblv/7MXWpvCEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795690877;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=9w5AEZ00ldKkg/YYySuzq7oRUsGsgwOxx6Rdnue+ceI=;
	b=HzIiOoNzzNYkY4YViSYVQeKNFCqE0eUnlgKUKciojyvruW1cHrjCz8YWW7AxwZLvDlDv
	 hZqtLjayWHLUnOpsH9wQbJMM6JV7kLmUaVJVPAcm8fzru/B6mJFJQ0jJyKfmPt16WLkMy
	 DpVIwM40uZjnJyqag8YcgMjFz37ANVGWOIfSzbvPmTQemCa6NSEvJdrA9is5WJZ+e3kAM
	 NWxJ2qFfbbSNsxRPeNdqBRRjolMnlLfdXC+j+4515gFPSJ8FLuKw2w7v9NT/CnY5rNL62
	 /Bfmd4I1AbQARZXvG1Yh7Bu9bss+fNCsn/bcSZWALpTvMM874Vc3537l5Ao3PdKGieA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=YKDyj+27;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F91606A31C
	for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2026 11:01:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66F91606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=YKDyj+27
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 06BAE1A17E2;
	Thu, 26 Nov 2026 11:01:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C5F7060237;
	Thu, 26 Nov 2026 11:01:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AD16611E6B36B;
	Thu, 26 Nov 2026 12:01:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795690870; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9w5AEZ00ldKkg/YYySuzq7oRUsGsgwOxx6Rdnue+ceI=;
	b=YKDyj+27WLUu23Osv1n6c4pCOh/vJ4pJ2r4DPBqon9fyBEk5oHc1MpktuOW+ySBDu6UH7U
	ccfU6JuV0qYHqOK74PlAk3Fxm9MvVBa1XzmyWySngoMKppBsxxJ3thuGEOFzpjj9DTnMFy
	UbGTeqpZizcP7cSLm2dwa9+HEraL5qsRtI0dYUHRlv4NrpC2/YPGeunI0G4adQyWaI6JyT
	NVsgghxmzsAQbhD0iEafly5fSo2OAyYYbOx+pn/gh0O03Cp+q7m9Kp3BejevheRYyxwbJH
	/S//61yyJoq5q4icBI4VWqK7O9R8TxFR8RXrsbtSpEkY9dyur73ArvgMGQt74w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Orgad Shaneh <orgads@gmail.com>
Cc: richard@nod.at,  vigneshr@ti.com,  tsbogend@alpha.franken.de,
  linux-mtd@lists.infradead.org,  linux-mips@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linusw@kernel.org,  kaloz@kernel.org,
  ulli.kroll@googlemail.com,  john@phrozen.org,  nico@fluxnic.net,
  dwmw2@infradead.org,  corbet@lwn.net,  linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 0/4] mtd: point() for cfi_cmdset_0002, on simple maps
 only
In-Reply-To: <20261126085906.814373-1-orgads@gmail.com> (Orgad Shaneh's
	message of "Thu, 26 Nov 2026 08:59:02 +0000")
References: <20261126085906.814373-1-orgads@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 26 Nov 2026 12:01:05 +0100
Message-ID: <87ecc7yhzi.fsf@bootlin.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hi,

> One question: a cramfs on AMD flash falls back to the block device
> today. After 2/4 it keeps its image pointed while mounted, as it does
> on Intel flash, so jffs2 writes to the same chip wait until cramfs is
> unmounted. Is that acceptable, or should point() in cfi_cmdset_0002
> be opt-in?

I am not particularly knowledgeable on this area, Vignesh could you
please have a look?

Thanks!
Miqu=C3=A8l
