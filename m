Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C9542C4E4;
	Mon,  3 Aug 2026 18:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785781049; cv=none; b=qR/VFNH5g6+Wa9MzBX3c6Y+yrxGGqHObocClPj2ipC8MY3vf6G7BHCL6CQrBKZ+XXTTgDbq8e0ytQzFRP0X++fH437jJrP5eAkCUn6+aNb1eduCRSk6bQKF8akaDIY1nyRrXOCSe5PhWy7y20geMZ7xnRbngbEVtdRs/vxw0bXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785781049; c=relaxed/simple;
	bh=HeFlKmKBnWP15jTejGxSYan33ytNzn8l3w0gPe81Gpo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=oivRORfhFlp0OzAEjCAOppZYsl9bd3Ig6CL6hDITGJZOY9Y80N4uKOwIzAe/ZgVh1QnSjfweR081fW9UzUUn82/DCw4Z8bDRYrzI9sztc9Tg7d1dk40kNQIBvEnk6Iaef9acqMAG6eleKw4bDd1H4i2pChkXphxmYSZo3ciJboA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=NyrRycCl; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="NyrRycCl"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net D7197408D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1785781048; bh=JTlJ9FdiKr0hhzNapj8QZCc3rItO+HxMfZEQXuwBzg4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=NyrRycClC2zv5WGY1FXL43XfsHB11A/OHFgWMumdhwTvaFzfhxxuC2VusJWOmV+Zc
	 DWut8IQwNqTxKqSJQx0L6aPCN5o0OgJmxt6A8dhgXXZYLZHd450eD2AnykyFNIUDOD
	 iT7JGxXFI9wZIOuncxbOBnLa0kbIPN0ozoAlguUx/CIs8xIFGrz/oFK7lhh6/0VLUm
	 1EclCA2CAIa7gRtf2d5VHwVrvOZbGWX35tSAniwfK5bGYrrT9A3jZoKGFxW5hJiAc6
	 I3WBbk83zcnmpZ4pgM7vygoULhcYao7zL8O3Zsws/w7AvnLRmRZFb46vSApX+m44Jp
	 PHttyGS6N72zw==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id D7197408D2;
	Mon,  3 Aug 2026 18:17:27 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, Shuah Khan
 <skhan@linuxfoundation.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: kdoc_parser: drop extraneous blank line in
 warning message
In-Reply-To: <20260729052736.1423688-1-rdunlap@infradead.org>
References: <20260729052736.1423688-1-rdunlap@infradead.org>
Date: Mon, 03 Aug 2026 12:17:26 -0600
Message-ID: <87o6fjysp5.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Randy Dunlap <rdunlap@infradead.org> writes:

> Drop an extra newline (blank line) on warning messages for (2 places):
>   expecting prototype for typedef. Prototype was for typedef {symbol}
>     instead
> and
>   expecting prototype for {struct|union}. Prototype was for struct|union
>     {symbol} instead
>
> This makes these messages consistent with the similar enum warning,
> which has no extra blank line.
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Shuah Khan <skhan@linuxfoundation.org>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: linux-doc@vger.kernel.org
>
>  tools/lib/python/kdoc/kdoc_parser.py |    6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied, thanks.

jon
