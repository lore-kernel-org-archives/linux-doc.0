Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0013730ED;
	Tue, 18 Nov 2025 16:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763483488; cv=none; b=iwAbu/uVc7rawKe3tKGjohj1/w9qv26bBbCvL/QydFtkLx0JxHVUc1B0BjL6DnLGF0GL9g9g/t+YPEJtQMxvulNtTGepTYIq7BVnCOVGpb30HsLJgOT3ZFl4YN1TngjoJB53Ttvi36frl42Ud0gn/Lg4xg+xGEOJJDBbaBZ0p+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763483488; c=relaxed/simple;
	bh=F9+GESOjuM+M3gt3ai9Ro032/kzBXGp7spyY0XQIUFo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=KKAHnL9HSgSqmvJxPlmUMXe2UuSqFuKYRKv60Ldbtvs33mV5g8SP9mVEkpQ/lCE7Q9JVQxzAW4I91Hs7qbNtBJKpl3/425E2FvKfEgC0vzLlUkkw1wXaPx4MWCXN3GEO2OrfjyJK4oNW7ME6qr56pAnPODjTnaxhW0gpaCNPGcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=SdW/iSLu; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="SdW/iSLu"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net B607740C42
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1763483485; bh=lFHFc4QEt5XHraAor9JKQdRc6P1MjY+0+/NCLSAvubw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=SdW/iSLuuRnpRCWt+1v2ZDE3+ngkfMFT5TUvyJD2Tp5JpWEvN/orf0n84IJIqI1mZ
	 gz4a2OJQVRw+WXnkbaROnFa65s9lwalLdz/wjA2iryuIuXXCqvglHlS0p1zEXUs7xb
	 SgL7Kn1k9V3pI9fjWeusBbHNXpqSG6KMIgMORn/wCOoPfj2v1Ilyc4fK3z5ycprTE0
	 3qd4TZM2HGPOUlNUkjgTqpdkV84V4ToG1pCpfWzsqCsjNOSZXbcRqtNARbepda26Vd
	 7wZI+aKYeiRY67aFaD5X4Un+7YanDljxb3V39TvAeYyGfbLuahd2+2nXvdRdy1FfXT
	 YiFMuAMnFT/NQ==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id B607740C42;
	Tue, 18 Nov 2025 16:31:25 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: eanut 6 <jiakaipeanut@gmail.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v2] Documentation/admin-guide: fix typo and comment in
 cscope example
In-Reply-To: <CAFb8wJvoKtiOA0DZqNJhHALe97=BFkGeLwDYpK=x7L1woLQ6NQ@mail.gmail.com>
References: <CAFb8wJvoKtiOA0DZqNJhHALe97=BFkGeLwDYpK=x7L1woLQ6NQ@mail.gmail.com>
Date: Tue, 18 Nov 2025 09:31:24 -0700
Message-ID: <871plv5mlf.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

eanut 6 <jiakaipeanut@gmail.com> writes:

Thanks for working to improve our documentation.

> This patch updates the Linux documentation for cscope, fixing two issues:
> 1. Corrects the typo in the command line:
>        c"scope -d -p10  ->  cscope -d -p10
> 2. Fixes the related documentation comment for clarity and correctness:
>        cscope by default cscope.out database.
>        ->
>        cscope by default uses the cscope.out database.
>
> Changes since v1:
>  * Added the second fix for the documentation comment line.
> Thanks to Randy Dunlap for pointing out this additional correction.

This kind of information belongs below the "---" line so that the
maintainer doesn't have to edit it out later.

> References:
>  * [PATCH] Documentation/admin-guide: fix typo in cscope command example
> https://lore.kernel.org/linux-doc/6017104c-740d-43db-bc53-58751ec57282@infradead.org/T/#t
>
> Signed-off-by: Jiakai Xu <jiakaiPeanut@gmail.com>
> ---
>  Documentation/admin-guide/workload-tracing.rst | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/Documentation/admin-guide/workload-tracing.rst
> b/Documentation/admin-guide/workload-tracing.rst

This patch has been line-wrapped by your email client and does not
apply.  Please, before resending, send the patch to yourself and be sure
that you can apply the result.

Thanks,

jon
