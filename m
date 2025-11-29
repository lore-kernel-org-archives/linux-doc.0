Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED69F3112D0;
	Sat, 29 Nov 2025 15:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764430219; cv=none; b=mPbz6ruDdpJuIQAdk4qrBw4UkYYCr//m+u15gcWMZu6/0yHJczKPn4L7bbhr+FLWVDXOFYSfOdywQMpCVmWZW6s3JxpN06A9RaOqH+vvYhd+DCIt3m5v/ljirRb1PLP/HG4r5kos9t5bgrk9o2hDb0O2enCFS5s6+4UK6YznE2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764430219; c=relaxed/simple;
	bh=9SkAg1rhB/aTnARHO7XP0n1Iy2XvftX6fX5HNedyD3Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=YHdk7/SXMhnMP3dTfbGxHNn55F3YC21ADGCcFpDf7nmpw1DGjRiEXbdFSdg2Hw+v+HvB5V0Zx9Uzw3xOgfiJd6Hhs6omTAlI48vb27CeDaVdyQNj5eNjUwgd/XPHy1TOo9sQxK5aqbq6/JjFOIiA4A04jJqhnNaBOr5cL/iZDds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=cTIR3J3E; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="cTIR3J3E"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net EC706406FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1764430215; bh=v7TU8fPH4JzK4CxnXuvfu9uYS+PXeGs5jdnygtM/9cc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=cTIR3J3EorNCCbBCh2lxF2Z74KK7iGmg2RrYjShETcOHC2vnB9y1AF4e8l8R0oZJC
	 U7cYi0EnbSfrBnTkKjmD8MRkSvsaUWldRyTiwzhnTyOgXrSzZ7yVw/6c+bZljnaxug
	 vqV6UENDoC3itvlijwMKtF+s32SPAraV3vjFWOieMCwUHFiAGTZmUMen9ws+DVCc5S
	 w5YETzJ+nRbE0/2q23tYgPqOrm38LsldaNojvKBBc0ds86YGjra8USNbp3TbuLcEiQ
	 Shy4gv2KhKgXfpd36VY3/iOY8pDS/HhqRxILMCxQpbD4ALcuejiS8CxM4SZ+OkRpDH
	 uX7Ao2IK2ilHw==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id EC706406FB;
	Sat, 29 Nov 2025 15:30:14 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: kdoc_parser: add data/function attributes to ignore
In-Reply-To: <20251127063117.150384-1-rdunlap@infradead.org>
References: <20251127063117.150384-1-rdunlap@infradead.org>
Date: Sat, 29 Nov 2025 08:30:14 -0700
Message-ID: <877bv8rh4p.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Randy Dunlap <rdunlap@infradead.org> writes:

> Recognize and ignore __rcu (in struct members), __private (in struct
> members), and __always_unused (in function parameters) to prevent
> kernel-doc warnings:
>
>   Warning: include/linux/rethook.h:38 struct member 'void (__rcu *handler' not described in 'rethook'
>   Warning: include/linux/hrtimer_types.h:47 Invalid param: enum hrtimer_restart (*__private function)(struct hrtimer *)
>   Warning: security/ipe/hooks.c:81 function parameter '__always_unused' not described in 'ipe_mmap_file'
>   Warning: security/ipe/hooks.c:109 function parameter '__always_unused' not described in 'ipe_file_mprotect'
>
> There are more of these (in compiler_types.h, compiler_attributes.h)
> that can be added as needed.
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: linux-doc@vger.kernel.org
> ---
>  tools/lib/python/kdoc/kdoc_parser.py |    3 +++
>  1 file changed, 3 insertions(+)

Applied, thanks.

jon
