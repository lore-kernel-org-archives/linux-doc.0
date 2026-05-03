Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7FE6199931;
	Sun,  3 May 2026 14:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777818915; cv=none; b=DfjDCy9P6RiFfTwLXjdu9bux/AFaJJ6iYKfkH27ANP8UW7QvZlUNr31uJvgoI1vpoim+z7o0xBm6NJqf4hrh9QEIsdddnlKKIWl7v7UBGeXsQyr7i2S2bkvlsgGCOfvOtjm6ZStsbAXVXq03air/UZ2/1NVBXtcY0cvE6TxlbyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777818915; c=relaxed/simple;
	bh=kkpinCA2TNcPQQGtKe0EgLxSQpBydr/JcqctiYNQY18=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=JPKklsDl6dfiGUP7Gd/hJ/MCyhWAuBzq5yKeTYUcVU7MMx9PewzzRmfabECkEJJOdFZ1yyMxwC54LyNOL+PEO5fr0fZIxmhYw29r7ZkJPGLSt+UOsjTF407CrL52E0pkV8FFpPywChh+TzIvh+4J6lQ2wiaGMslLG25YiCC9QrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=pa3xVno3; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="pa3xVno3"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 7395D41084
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1777818906; bh=Pb7BFxNf3U63kKwixT5ywxm0H7aoGebyYiLAYZY0jCg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=pa3xVno3bc5Q5Px7hhCtNSvpxBqEUWpjVRkCTJ2x08RP9nw+z7PqxpCH4Pk651fMF
	 5VMeezcMC4wPAFayX5BYm8qOjXxU6CC5Z/mg+16cy1gu/uw7d4MD8hVfbnMvbH8d0C
	 zabfl373u+H2CXu0xWc51ShHfr1hXSNJWQ9eGvyTOfZ0O8E0HSaoV8lhYaMi2riegL
	 6+6scuOs/R9jj3D/pgbmy4o6dr02V18cvjyTE5tIMyWs9onjtXiLs3vEcDcc4DxfRM
	 TTlgaYGxlejXsPP6uBBkjIfs6SIJp1YsfjXhQxWYYCQdkuR27WyM+kGjSoQ4iJcV7s
	 VtW5XmRQSHULQ==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 7395D41084;
	Sun,  3 May 2026 14:35:06 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Wang Zihan <jiyu03@qq.com>, linux-doc@vger.kernel.org
Cc: federico.vaga@vaga.pv.it, skhan@linuxfoundation.org,
 carlos.bilbao@kernel.org, avadhut.naik@amd.com,
 linux-kernel@vger.kernel.org, Wang Zihan <jiyu03@qq.com>
Subject: Re: [PATCH] Documentation: translations: Fix "Linux Torvalds" ->
 "Linus Torvalds"
In-Reply-To: <tencent_B98271DD90AC356719E15C06ACE473BB820A@qq.com>
References: <tencent_B98271DD90AC356719E15C06ACE473BB820A@qq.com>
Date: Sun, 03 May 2026 08:35:03 -0600
Message-ID: <87ecjsef3c.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Wang Zihan <jiyu03@qq.com> writes:

> Fix the misspelling of Linus Torvalds' first name in Italian
> and Spanish translations.
>
> Also fix "Linus Torvald" -> "Linus Torvalds" (missing 's') in
> Italian translations.
>
> Found by Christian Marillat.
>
> Signed-off-by: Wang Zihan <jiyu03@qq.com>

The fixes all seem good.  It should have a proper Reported-by line,
though, and it seems you didn't CC Christian on this email...?

Thanks,

jon
