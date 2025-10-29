Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F16E33F36A
	for <linux-doc@vger.kernel.org>; Wed, 29 Oct 2025 15:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761753153; cv=none; b=aAY+Lg5ZPqrRFDrh+5AVzeUVrxLqU/52W8pJH66tBz7YlDVUUyFq27u1W/WruqSRL16vVGZwuQlS62F6FVZUM5P030O+DIPdgKpty+A5T9KxHsHmGylyzpvv6fHecdMmsegRdGRmAz4VufDEZWECKubHg4rzTLcLFTwot9WFfBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761753153; c=relaxed/simple;
	bh=SghLkSft8r1xMDb8Gh3StsCWG/3ORXvrDG76WDWaBxE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=GOzusHG/UzwwoP6vlNpulNZlmt87PzMEOgl8dzlaXmRScxHrVzocFePnBMom7LASjmmR9WLpy3KUze5MypVFfJEjGvK5ZhId2Pf3VzseVhq8Z53+ZawSE/2t2TPqELfTF5evHbLRy02xXibQvEvNues5dF+vTxx32kowzAEOxSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=GsX5M5jZ; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="GsX5M5jZ"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 49E92406FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1761753151; bh=l2LrmqfOKUbJLF3ZETQ8L2stv5Ss0DEqguwvYJfTv0M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=GsX5M5jZsnOH0RM/ew0YOAP0LZf/ZSKgsqqO6mlIFHzjeT4Vjcq4fQPMVQxnRYOU3
	 qdPBqTL6bkgBnm0ZKZ4GXeLogafY5nmj1xaTgN8kzc+iSl6LS4hbHQ5zT09ixTnhIE
	 I9/D8raDkpIwOb/h8iStKfuUZGMfvyDBI+7XY3efkva8WO2ufzAC3Sylj5mbnnb9WE
	 uMRKir9TpkBgl8hBw77FK0xRgbFKNjkrCqKfNTG0kgF2bmVS5XIiskl3CdBQmyjQj7
	 fLVMUkV8yZFkn6h8sMeR6XbvVq9/ZuOfChKKrcx7jRbwjpyCicR1Uh+PHlhIAaKO5G
	 7GbF7FJZR/ZFQ==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 49E92406FB;
	Wed, 29 Oct 2025 15:52:31 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Akira Yokosawa <akiyks@gmail.com>, linux-doc@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Randy Dunlap
 <rdunlap@infradead.org>, Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>, Akira Yokosawa <akiyks@gmail.com>
Subject: Re: [PATCH] tools/docs/sphinx-build-wrapper: Emit $SPHINXOPTS later
 in args list
In-Reply-To: <91aef821-6355-4135-b179-69b845a827f6@gmail.com>
References: <eaf4bfd8-fb80-45d0-b3ec-4047692ebbed@gmail.com>
 <91aef821-6355-4135-b179-69b845a827f6@gmail.com>
Date: Wed, 29 Oct 2025 09:52:30 -0600
Message-ID: <87v7jxr9hd.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Akira Yokosawa <akiyks@gmail.com> writes:

> On Sun, 19 Oct 2025 23:24:51 +0900, Akira Yokosawa wrote:
>> The option list to sphinx-build via SPHINXOPTS should have higher
>> priority than those the wrapper comes up with.
>> sphinx-build will choose the latest one if there are duplicates.
>> 
>> To restore the behavior of Makefile era, when the documentation builds
>> at https://www.kernel.org/doc/html/next/ had been depending on it,
>> reorder the flag list.
>> 
>> Reported-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
>> Closes: https://lore.kernel.org/20251007-awesome-guan-of-greatness-e6ec75@lemur/
>> Reported-by: Akira Yokosawa <akiyks@gmail.com>
>> Closes: https://lore.kernel.org/c35e690f-0579-49cb-850c-07af98e5253a@gmail.com/
>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
>> ---
>> Hi,
>> 
>> Not having hearing from Mauro on this _minor_ regression, I went
>> forward and made this fix.
>> 
>> Konstantin, could you test this against your doc build environment
>> for linux-next?
>
> Jon, could you consider applying this fix and making it be tested
> directly at https://www.kernel.org/doc/html/next/ ?
>
> The custom "next-2025mmdd" tag there would be helpful for us to catch
> regressions in linux-next docs builds.

It doesn't seem like there should be any regressions ... I've applied
it, thanks.

jon
