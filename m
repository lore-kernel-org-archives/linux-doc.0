Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C9A3644D4;
	Mon, 12 Jan 2026 16:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768235371; cv=none; b=f8yPkhaMBgX3FGvSKW+ELR/4aDPqtN8YuJC4kk4zMdcuL0bkIFD+ge7CDhnMqDolWX2gwvgRz2XOlp0WhgzY4YMwL9jPDaX84sNVWlB/etRSrztyZx/DGSEFxUZphqcPcoEoFAAynjqYwsCG5YsL3/aOQQnqZMzAvPZzwXOuSL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768235371; c=relaxed/simple;
	bh=0BtMYjORsNKWy1FhGZKfTtXsaOJ9O0KgpBTkpfizfug=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=lk6vysh/LVXQD/o0lvrQ7SbNUDDiklB/8zvFKa2wUlcfhVuiOHi8Ug6+Rj/cmyZ6y3UqX4jblCCnYmMvP2SRSHBPzr9Nxx99p4ryr6mwlJMW9G7klZybg+6esomTT5SUVxpfzFqCA5GIWX9iJ81mWEdU/rk1rYOoSjMZbiupjk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=di38XCaK; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="di38XCaK"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net CE78D40C42
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1768235370; bh=2woNFljVM7jc1M4GtfXHnwTyD16m3bNYNKWQ3++HV0c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=di38XCaKHOaVnM5dF420M/Znt4UPnVZGwesQlQ1Ke/s3ds86nD91/kG8o7LQdUFkj
	 uYFCSRiRSDxBOqPv1tGOSWju4jxsO9olBR9wULgy/RU5n7gNVrVmBsRZYib9CY/ata
	 axQYjuTEQ+bRVkpkThaBfqWjY5NfjuraC6QRvkILKu6XLklYuMEx6SGVYxH6EEviiT
	 waw26SMxTgX7KZma9Ciq4gNqAexfqdxmIt4OipnrhLjBr/UUWMNI2AJKu9fWXkI3oj
	 N7yyhooFN49z3HzKSeY11eqk2XvY6fFegHkHl3Gt3u6MLa53ovtzq/KT7oFMzcRoGB
	 0l8jRzueRCUiQ==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id CE78D40C42;
	Mon, 12 Jan 2026 16:29:29 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Update for the doc subsystem
In-Reply-To: <20260106231316.24474-1-skhan@linuxfoundation.org>
References: <20260106231316.24474-1-skhan@linuxfoundation.org>
Date: Mon, 12 Jan 2026 09:29:29 -0700
Message-ID: <87ms2i23rq.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Shuah Khan <skhan@linuxfoundation.org> writes:

> Adding myself as a reviewer for doc subsystem.
>
> Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
> ---
>  MAINTAINERS | 2 ++
>  1 file changed, 2 insertions(+)

Applied - thanks!

jon
