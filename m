Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.79.88.28
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793635879;
	b=Y1ojYDdb7yiagIDklfTVSaNlgqUKwl0m/gkvCrladdRLMFcdH2HPZJl6X4UE0rx5G/NO
	 vYYRBtbsM3ofMW5zlOx9TYhHQUr6yTxYmlG8v235XWSpskLlN27zryEh389pfDyH6P/QF
	 jgXs4A9EKWP+wxrLgkNmvh42TAQWr9xiFxG+ZialWMSe57ATaxsf6lZy45Pwl0Psj0ly1
	 qxZLBNqYl8dp7IPO4/9SUZQJt66kk/roUEhypr1UJjbREHNlKm+PdFrEvoygNSMRUjbBI
	 bzOF2RfwuqOJJPSk5n6/TJWZ00bXsT189iWYKScooV1a43xuehfGgLyWVykiQwwFHgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793635879;
	h=DMARC-Filter:DKIM-Filter:DKIM-Signature:Received:From:To:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=djqEA/t3PRcNlOvGKA3S2flmdfP8elCHvbteH61xTYM=;
	b=zJ5h3DvxuN8WMYNKkf7c/G8SpFT/6dM46yipYn+MWK7E6Wjyl9JOQQ3TkESkXFdB7HUT
	 r4Td4CaW94omZx4gDa8jCcqnSVIh79joLJB7GffY3D2Ul7vyupuPHUlMeMb9QCtk3U+Aw
	 bDJmCO5Wq6fw2dhp+tgw5oJ0demeZNxPuLCO8khV86SIe6arBiyjGmO5BNQdtLUxb8xFf
	 myUxEIiS1CTtEVx7E+cBeEuZijVjaLCzWRi3bJxR5hTfywv97Avt8vf2JtRzkKBAYgaIA
	 dYlDzd7u78C0Xaev/T/92F2Kg6sbEbWpwvD/NSzdUc7jprG4GPceRDtFyVDc5vBbGgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lwn.net;
	spf=pass smtp.mailfrom=lwn.net;
	dkim=pass header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b="Ioyx3M/q";
	arc=none smtp.remote-ip=45.79.88.28
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 231B46070D9B
	for <linux-doc@vger.kernel.org>; Mon,  2 Nov 2026 16:11:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 231B46070D9B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=Ioyx3M/q
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 4779B40430
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1793635878; bh=djqEA/t3PRcNlOvGKA3S2flmdfP8elCHvbteH61xTYM=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=Ioyx3M/quKScj2io+M7Dnduzzm/Ui/mM/8ev6SzwNISCE/DlntJvB3NtJMYrHPPsl
	 X6v7DVVLcmaYMSNCm/i/QXmZFsltEoPsWJjsLotaRmWLCve0TLcorMYwI5vHLaR+z6
	 VYdHCpcdGGoasGr7FRljZZheZyYFPjtUjMcYYbM2wf+GpYvAqBPuP/slBijdgftxX2
	 SX2nmZNILLGphPgoVBbJ0P0AftFbSLtCpqcWWadyJ/LXn/GvP26uhDBKeqPUydFWk9
	 uIwLsgjcamCPC+mxIf2Qpsxnx17OHPX+5UlbK1A6k2e/apUU2jPnqC7m1irO0xQnTB
	 0GBiRo6BBMv9Q==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 4779B40430;
	Mon,  2 Nov 2026 16:11:18 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Daniel Pereira <danielmaraboo@gmail.com>, linux-doc@vger.kernel.org
Subject: Re: [PATCH 00/11] docs/translations/pt_BR: process: sync with
 English and fix errors
In-Reply-To: <20261024132158.39493-1-danielmaraboo@gmail.com>
References: <20261024132158.39493-1-danielmaraboo@gmail.com>
Date: Mon, 02 Nov 2026 09:11:17 -0700
Message-ID: <8733tjdxi2.fsf@trenco.lwn.net>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Daniel Pereira <danielmaraboo@gmail.com> writes:

> This series reviews part of the Brazilian Portuguese translation of
> Documentation/process against the English originals.
>
> Patches 2-6 sync coding-assistants.rst, security-bugs.rst,
> maintainer-netdev.rst, maintainer-soc.rst and changes.rst with changes
> made to the originals. The other patches fix translation errors against
> the English text, markup that renders differently from the original,
> and cross-references that pointed to the English documents even though
> the targets are translated, adding the pt_BR labels needed for that.
>
> The changes are limited to updates and fixes; nothing is rewritten.
> "make htmldocs" builds without new warnings.
>
> Daniel Pereira (11):
>   docs/translations/pt_BR: process: fix 1.Intro.rst and add labels
>   docs/translations/pt_BR: process: coding-assistants.rst: add bug
>     procedure
>   docs/translations/pt_BR: process: security-bugs.rst: sync with English
>   docs/translations/pt_BR: process: maintainer-netdev.rst: sync with
>     English
>   docs/translations/pt_BR: process: maintainer-soc.rst: sync with
>     English
>   docs/translations/pt_BR: process: changes.rst: sync with English
>   docs/translations/pt_BR: process: license-rules.rst: fix lists and
>     table
>   docs/translations/pt_BR: process: 2.Process.rst: fix translation
>     errors
>   docs/translations/pt_BR: process: fix cross-references and list markup
>   docs/translations/pt_BR: process: restore links, emphasis and headings
>   docs/translations/pt_BR: process: fix kernel-docs and enforcement
>     statement

Series applied, thanks.

jon
