Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B424C6C;
	Tue,  6 Jan 2026 21:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767736484; cv=none; b=VupJN1TbR9w+ouWOgOHERUCHg7V0PMJUZrxpJsGN1OVt9dBirDTLxXkEelxiR4+tQPtiktSvikvROxaw8WkFNWD3yUz8qQK7oYyHg3axAQKasuLo4bTVtJnKMA9xSYufHfXvtYWvmu4hCdHc5oivsvy6BZpqu0/i2GYiJ7DrJe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767736484; c=relaxed/simple;
	bh=uyr7wUGYQb1kxqkh3uAj4Z9ODHNBtoj3wVbM94OJeGw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=r+oSXOiN0+aX8F4LLm5WKMnrXXt08tTZiOZyKsZ21qzqYxhJX21y2Cn+DwAnoghN2anyFdwoPzV18bvzUcCGkXIbYsrFVFE0fbw2XdT0YW3iITDGsrWg7tW7GoaQy7GK52Pbg2BfYQsyRCxntpXm/Y5NGctgmMAgWdg6nUN3/Lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=l8rz5T1E; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="l8rz5T1E"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 06F3540C7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1767736482; bh=iDVnki288ij5RM+JoKQszdq82e9Yxm+u+guzL6/jbkk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=l8rz5T1E+UPUMtlUOXsmkLg4SELzTlZiJ+QqzV5EBKP5d3Ozh/zI1fVlAaXiWyRhW
	 OGeICPwkoDYTKUSUdWisX43OdFJIzX/hae0wJJi2R9QTgUzdWS9SRzC+/9Mnyn1Oul
	 P2OuhJbnnI5OCzD7MEAdL4EY9nk2JBWX9Uvl5jZoaEETe0zwKhq9lnNcJxpISxMxbW
	 hOu2RBAMmhxP4LjI85ogTnUyzntLlLOMMh4ooQc5BODceFufTTtkVEmjxgK5U8M7LW
	 t1amTvy4nvT55/w//6XtKR5Xxn77KMs/xuTYzvqoyffWCIr0dnLngkmqhU4IVinAhN
	 DWL4IMxNEqsfw==
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net [71.229.227.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 06F3540C7D;
	Tue,  6 Jan 2026 21:54:41 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: SeongJae Park <sj@kernel.org>
Cc: SeongJae Park <sj@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Docs/translations/ko_KR: remove memory-barriers
In-Reply-To: <20251225014027.15948-1-sj@kernel.org>
References: <20251225014027.15948-1-sj@kernel.org>
Date: Tue, 06 Jan 2026 14:54:41 -0700
Message-ID: <87qzs2cspq.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

SeongJae Park <sj@kernel.org> writes:

> The memory-barriers.txt Korean translation is quite outdated.  The last
> update on the translation was made on 2022-10-10, by commit ee5a86f451f7
> ("docs/memory-barriers.txt/kokr: Fix confusing name of 'data dependency
> barrier'").  After the date, the original memory-barriers.txt got seven
> more changes so far.  The most recent one was made on 2025-11-05.  But
> none of those are applied to the translation.
>
> Maybe I can work again on keeping it updated.  But, given the
> advancement of translation tools, I think it might not be worth keeping
> it at all.  Remove the outdated translation.
>
> If it turns out to be worthy to keep the translation and someone willing
> to keep it updated steps up, this could be reverted.
>
> This change was inspired from the last kernel summit discussion [1].
>
> [1] https://lpc.events/event/19/contributions/2259/
>
> Cc: "Paul E. McKenney" <paulmck@kernel.org>
> Signed-off-by: SeongJae Park <sj@kernel.org>
> ---
>  .../core-api/wrappers/memory-barriers.rst     |   18 -
>  Documentation/translations/ko_KR/index.rst    |    1 -
>  .../translations/ko_KR/memory-barriers.txt    | 2952 -----------------
>  3 files changed, 2971 deletions(-)
>  delete mode 100644 Documentation/translations/ko_KR/core-api/wrappers/memory-barriers.rst
>  delete mode 100644 Documentation/translations/ko_KR/memory-barriers.txt

Applied, thanks.

jon
