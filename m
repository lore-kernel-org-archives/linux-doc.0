Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B218227380A;
	Mon, 22 Dec 2025 21:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766440413; cv=none; b=pg2Pa/ir3ouhpdmxOfFQO2awzut98RxPyeTftBCTiP476VHrRe1YOC8lj4eq7xOJZ99XZiwKuCtVrnExz4ZwRfAPnTExpo4eR7Eh2a4mJaf9zuzlLZKC8KqCpmKStKcPODpdMTsVF8JB/g21IAvdT+5A7TNUBUMtcpDj5eQJ7Ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766440413; c=relaxed/simple;
	bh=qJht2+TAYpiWsuIe/ACIFRmcALr0rLAwGfSlyqvdLzc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ruS5juewvYj6VCBkN2L5pUMssLhnX9Sh6vHyd3YIVhZhKHw7NTQ1uGONAyd0CvjbqrjUeVAKHPXWPiQDmGhE8URU5+S0yLoNMiHV9aC6nbKXzGsCw3hVQMjbLWF8UlYzME+TX5Yeh27UF7RAGexwLZeFvSdI0XSV8MQR5Ywbk38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=DCOhkcXm; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="DCOhkcXm"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net E3EFD4040B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1766440411; bh=qJht2+TAYpiWsuIe/ACIFRmcALr0rLAwGfSlyqvdLzc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=DCOhkcXmfmR4bIU4QNJ2oJ/uGqOgJU6Jj+NzP/j5CQdSXoeZlJi+ii4hW5hbIXZqG
	 M5sIawCPJ3JYIAXNG9L0yOiTsk/uFOAFnlPJ9a9ds3d+9Sgnh1Lz/McBkX6H4/afA2
	 /pUz1a0awr7FR2z/MiwVRaB7M+0gvK5T1P0KeS+mbML8hxpWKFk9+PszbrSoaFchID
	 qnbmHPZ6Qnn+4qui4jeTYRf7EG0CQ3Z6kdpy1i+nOAI4AEeFvKltOPlC/GrenkXRef
	 LkroTwqZ7ndMa3559OUtRxuPDrUY+YtQXD01+UUuPXukEdADAgDuP1XoTB9uqwy8zV
	 VOvGfvc5RHq9A==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id E3EFD4040B;
	Mon, 22 Dec 2025 21:53:30 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Linux Doc Mailing
 List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v7 0/6] kernel-doc: add support for documenting vars
In-Reply-To: <cover.1765894964.git.mchehab+huawei@kernel.org>
References: <cover.1765894964.git.mchehab+huawei@kernel.org>
Date: Mon, 22 Dec 2025 14:53:29 -0700
Message-ID: <87sed218va.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> Hi Jon,
>
> Please ignore v6. I ended adding a R-B at patch 6 instead of on patch 5.
>
> As suggested and discussed with Randy, this small series add support
> for documenting variables using kernel-doc.
>
> - patch 1: add support for the new feature;
> - patch 2: extends to support DEFINE_*;
> - patch 3: document two media vars;
> - patch 4: fix an issue on kernel-doc.rst markups and automarkup;
> - patch 5: document it;
> - patch 6: better handle DEFINE_ macros when they don't have static/type;
>
> Since version 5, I'm using "c:macro" to describe variables, as it
> avoids Sphinx C domain to try parse the variable. This makes it more
> flexible and easier to maintain in long term.

I've applied the set, thanks.

jon
