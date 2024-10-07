Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517B018BBB2
	for <linux-doc@vger.kernel.org>; Mon,  7 Oct 2024 17:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728321837; cv=none; b=VwrkWKj/2yH3+MwYOfOLv2EQUJa6/I1TEDir2qhW4PRUr9e1NvjZsnFZvOzroiw2ytt9a9NM8g/rMlS98kgVqsIoRlPR/btgew//aZohTMZyTw9MlIvbECCsifE/lkoj9XSRExzwZKkDjzgrlJOokjmeCDOAyv29PD4rDrItOEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728321837; c=relaxed/simple;
	bh=3NwF4kl15EvPSL9S1W67/J4ysqxHWnOEUpA4ncEnilo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=VscFCGALkhs67OuaNm+8CNrro5He678UgOkPpO64k3pGkkgyP8JcCVNepQdhSij8axusRRjcZ5X9XPFFqwdZFmfd7iUCjvP5iA83sZbLLDXNkLDcqDZm0x+pvLkh76YxWO+5liaLFWyYMTJJeduxcFC9CFsw6a6DjEg5kw/F7s4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=a9hb+toM; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="a9hb+toM"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 79BC442B38
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1728321834; bh=j/U7mGRh8Th5tDBj2wSk9n8m7xNx78Y4tYr1XIaRjrA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=a9hb+toMWsPT4/wIJdQvoip27LPbgpmAs4eozM8/wbBWNY3QR5Wd7RjBUnT3Gi/K/
	 x496I1uHU3ZYmuYjeiRETqRokMqZkNQ1j3XXkMxKzncIxj5G93TE/7mGhVl0NsvbPn
	 jEIw3bGo28PB5sD1wXJyCD8GfgLOGYX+X+qZnpzXpxqq2g9MtsIwgRrvJIsOdib+/x
	 C5u0deYBdQ+vhxrGu/SSLGDK8xk2NZZJJFMkHWcu0kDtUJhtXugFYGc4dAvnOKJ8rv
	 8OjpQnPgA3JTxpsN0pVU09tEZVJYY6tx8GUbu8bjnzy1K6PxsiqN0AMxkUp9mq63fu
	 kmOvUagzv/wBA==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 79BC442B38;
	Mon,  7 Oct 2024 17:23:54 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: bernhard+linux-doc@lsmod.de, linux-doc@vger.kernel.org
Cc: Alex Shi <alexs@kernel.org>, Yanteng Si <siyanteng@loongson.cn>, Bernard
 Zhao <bernard@vivo.com>, "Bernhard M. Wiedemann" <bwiedemann@suse.de>
Subject: Re: [PATCH] docs/zh_TW+zh_CN: Make rst references unique
In-Reply-To: <20240920070144.26947-1-bernhard+linux-doc@lsmod.de>
References: <20240905113531.65375-1-bernhard+linux-doc@lsmod.de>
 <20240920070144.26947-1-bernhard+linux-doc@lsmod.de>
Date: Mon, 07 Oct 2024 11:23:53 -0600
Message-ID: <87frp7j07q.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

bernhard+linux-doc@lsmod.de writes:

> From: "Bernhard M. Wiedemann" <bwiedemann@suse.de>
>
> We found that sphinx parallel processing would randomly pick
> one or the other
> https://github.com/sphinx-doc/sphinx/issues/6714#issuecomment-2362212754
>
> Signed-off-by: Bernhard M. Wiedemann <bwiedemann@suse.de>
> ---
>  Documentation/translations/zh_CN/dev-tools/gcov.rst | 8 ++++----
>  Documentation/translations/zh_TW/dev-tools/gcov.rst | 8 ++++----
>  2 files changed, 8 insertions(+), 8 deletions(-)

Applied, thanks.

jon
