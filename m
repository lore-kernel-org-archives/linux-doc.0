Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247303793A9
	for <linux-doc@vger.kernel.org>; Fri, 12 Jun 2026 19:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781292112; cv=none; b=e81CmjwX21h/iUTE1WcC380HFD5evCbFYgU3RZDglcj22Vju8YGxf6mPD3yebsU7nlTUXWf550MSyBnDDlYUu8v8Ee8cChpAEwOKBPn7wU5Nsu7zfOXs8hq2nNB6P+ueu/wTFXhYEYfKcypESb7AQxGjBKdq17PSskgfgt0sSq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781292112; c=relaxed/simple;
	bh=rGxGeIlyQROGNdwC3iIogkKw2subYwsPutbMqa2IoQU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=GSGoIWs7toacUiaYLtg5/qzq2F8VToqyFtlTcaA5nIf0Nqf7H4LVeL5i+QKBgoo0CDki2ChuHPaqw3k6mvZB/yGiIoPUMsxbQxviSY9rMMRQ9OTaJHyPbZayx+evmNBm+XfNJctAhW60N0ssFu0cIwxwA1lGKj900b3gFytiXhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=e65oY+5S; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="e65oY+5S"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 7305440E4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1781292110; bh=iBXUBw5EYTIyF/PB1MWw7I5XspGR6xCDiVEcV9Takoc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=e65oY+5SEzmXxkA0vvv6nGjtadvfzBGW6L70w0CtNvYlpcq2kVjO3yu6lUL6O63ub
	 BGhZVSEmlSA7TVF2IHLjsRK3aYZe+a0bXGHbzd4ci3qRsbhEuJN9NrfOCde1sigKsB
	 ILWyxu2NDxRqFO6VeYdLBJyXxGPejGmWgHZ0GABcGk8LV5+wn2+8OkwGVdfaRr3iHI
	 BHzKRbsPCK7NuUiaAIT7dlfccQaAKy3vCKBrghLvc9MGoojRW9RaOHDi6ENBbhZ8PL
	 xinEkV/f9lUkrqidxEf6mnjFAX4hSmX0XOrfO2HeVzcd81OA0mIBDAV/rCYQv8PBpj
	 XAFMTtM+ubxaw==
Received: from localhost (unknown [IPv6:2601:280:4600:27b:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 7305440E4D;
	Fri, 12 Jun 2026 19:21:50 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>, Shuah Khan
 <skhan@linuxfoundation.org>, Avadhut Naik <avadhut.naik@amd.com>,
 Dongliang Mu <dzm91@hust.edu.cn>, "GitAuthor: Ethan Nelson-Moore"
 <enelsonmoore@gmail.com>, linux-doc@vger.kernel.org
Cc: Federico Vaga <federico.vaga@vaga.pv.it>, Carlos Bilbao
 <carlos.bilbao@kernel.org>, Alex Shi <alexs@kernel.org>, Yanteng Si
 <si.yanteng@linux.dev>, Hu Haowen <2023002089@link.tyut.edu.cn>
Subject: Re: [PATCH] docs/{it_it,sp_SP,zh_CN,zh_TW}: update references to
 removed CONFIG_DEBUG_SLAB
In-Reply-To: <20260611010014.412841-1-enelsonmoore@gmail.com>
References: <20260611010014.412841-1-enelsonmoore@gmail.com>
Date: Fri, 12 Jun 2026 13:21:49 -0600
Message-ID: <87ecib7eeq.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Ethan Nelson-Moore <enelsonmoore@gmail.com> writes:

> CONFIG_DEBUG_SLAB was removed in commit 2a19be61a651 ("mm/slab: remove
> CONFIG_SLAB from all Kconfig and Makefile"), but references to it
> remained in documentation. The English documentation was updated to
> refer to CONFIG_SLUB_DEBUG in commit 5969fbf30274 ("docs:
> submit-checklist: structure by category"), but these translations were
> never similarly updated. Update them.
>
> Discovered while searching for CONFIG_* symbols referenced in the
> kernel but not defined in any Kconfig file.
>
> Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
> ---
>  Documentation/translations/it_IT/process/submit-checklist.rst | 2 +-
>  Documentation/translations/sp_SP/process/submit-checklist.rst | 2 +-
>  Documentation/translations/zh_CN/process/submit-checklist.rst | 2 +-
>  Documentation/translations/zh_TW/process/submit-checklist.rst | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)

Applied, thanks.

jon
