Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 788C63451A8
	for <linux-doc@vger.kernel.org>; Thu, 16 Oct 2025 14:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760626264; cv=none; b=k10a4xtIduy7gXqasrTqPndg9hFAbIM65buZm45OC0rSHDwQKCx0gQMgbnYrjMw6JQ7ou51WxZwdbuu+xH1uv5LLvkLgRLoBLLY+AL6ouPODvYl9du74m+OdOHzU34DBNKWrgzwzfZTbQHqJgxue4mnO2WEB5nF5psfiNdn0eVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760626264; c=relaxed/simple;
	bh=0UX858MpJw+MYGZQzGM621+QYT8OUeh2rPZrre15ei0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=eQ36U0sy85BRVow0ysckHIa8ngvOveWvxHmCUt0l4U8nSGNmUna413Z8KR0k0M+2QAJa8R23c6orww3VYkZI/vrnA9eSLW8wircT1sFWf74/aKNkQP+sYqtymUHOxptq08xMOwcLCgbah9Ci20Y0rMtm0m3gdYg6jqhaRKhi718=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=knOCtAgH; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="knOCtAgH"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net B530D406FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1760626256; bh=0UX858MpJw+MYGZQzGM621+QYT8OUeh2rPZrre15ei0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=knOCtAgHcaFYkJLFzH+ETSpllS/SanOPEQnoqOn4yNp5cB2BVOBaFNyu3gzC9ALoe
	 tfOSpXqrzxavD9sSO4FpNeCf0OE3ahNGGjxuTn72WTcy29kmbgUKwAINpBz+KLcIwB
	 +QqMMzoYYoYDUaVVSYn5VyqU60tjTzAfN9M2R42+sofNCY9uKJau79B+Xc7ISNzoVa
	 ko3zsTvwEO87FdltsMY+/4BM1PXyPbm8yhet6QW/5/hkaATeAmy1rXtHoZSqkQMLif
	 H7197FRr7LNQe0ou5kE+tIjpU5oYZTEwOlyoCe35yWo+NBxok8gdK/j2vi3kWqzHXk
	 kaCo5f5NsKSYA==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id B530D406FB;
	Thu, 16 Oct 2025 14:50:56 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Randy Dunlap <rdunlap@infradead.org>, Linux Documentation
 <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: parse_headers.pl ?
In-Reply-To: <9391a0f0-7c92-42aa-8190-28255b22e131@infradead.org>
References: <9391a0f0-7c92-42aa-8190-28255b22e131@infradead.org>
Date: Thu, 16 Oct 2025 08:50:55 -0600
Message-ID: <87ikge6gts.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Randy Dunlap <rdunlap@infradead.org> writes:

> Hi,
>
> Documentation/doc-guide/parse-headers.rst talks about some
> parse_headers.pl file but I cannot find such a file.
>
> Is there a replacement for this documentation?
> What should it be?

Mauro deleted it in aebcc3009ed5; clearly there's some docs work that
needs to be done to finish the job.

jon
