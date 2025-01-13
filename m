Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA32190486;
	Mon, 13 Jan 2025 17:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736789762; cv=none; b=bJyQfl8NXVZ+SfeuULyhAa9a5lv41Y7fLwu2Ln1zzxsPn9P0w06psytTTZMzXyAwWmlXe5M1bayjr1zdSCGyIpqHiFkiB7zKz55LTMQSkxdxCEUmcKFw8XG/xrQXwICc8MCtgl79vvYcK52JNNDHME/bgW9a6j7f6eW4irYO9qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736789762; c=relaxed/simple;
	bh=RIojcznWzcWFg1w7Xj4l9xIRI9rF8MurXt1euuXNQaU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=T2+1eLsC10yuuB4U1QEsq3mEeYSM5wwr3932qIXXTwxH5YWSHHySVbENUDkPeCKhjBgiIjFelkOpDke7dX99AYqHzHzO0yjFit4MU2doeKEwWlNA3SYgFCeJ6py9CGDJdAjLoSSgn0MssfuVOV04pk0F4XZhJi/SeU0b2vbnzR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=riA7h9Xd; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="riA7h9Xd"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 1685040409
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1736789759; bh=SvGFF505S7a53rsM402ITL4SKJcgB71IZ2FzkE1CSv0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=riA7h9XdS3SLiObGCneCBMoxJHnoeX+rUSBXjjF5jA2NYRWv713Uh15vf/dnsjSz5
	 jvLjWJYHFUMP2HASHmO0yoHIWN/hmed67oK4AE1nTcg7iuZ+H8lwivIs7gIrKwJJ5I
	 Nhb6wNrfuTZRtFJLYQPLvk2hcu6fc/fb1Gt+iuqWNf0cg8zxCWy255LN1T88JrFsKj
	 pBhsRJe7lhHz1miNAVrFRTl2plB1Jv8qAq2CQoeaPO25jAFGkfU+AfdUlVjhhh4P8D
	 n4C9LbLJ1YMYife6CqorWu0utx7jmTnwrqWf9y4IY0Ui2+9p+8QEFWqQXllAiWQPSO
	 b9H8j52WwCE8Q==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 1685040409;
	Mon, 13 Jan 2025 17:35:59 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: carlos.bilbao@kernel.org
Cc: avadhut.naik@amd.com, akpm@linux-foundation.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Carlos Bilbao
 <carlos.bilbao.osdev@gmail.com>, Carlos Bilbao <carlos.bilbao@kernel.org>
Subject: Re: [PATCH] mailmap, docs: Update email to carlos.bilbao@kernel.org
In-Reply-To: <20250111161110.862131-1-carlos.bilbao@kernel.org>
References: <20250111161110.862131-1-carlos.bilbao@kernel.org>
Date: Mon, 13 Jan 2025 10:35:58 -0700
Message-ID: <87ikqiboqp.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

carlos.bilbao@kernel.org writes:

> From: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
>
> Update .mailmap to reflect my new (and final) primary email address,
> carlos.bilbao@kernel.org. This ensures consistent attribution in Git
> history. Also update my contact information in file
> Documentation/translations/sp_SP/index.rst to help contributors reach out
> for Spanish translations.
>
> Signed-off-by: Carlos Bilbao <carlos.bilbao@kernel.org>
> ---
>  .mailmap                                   | 3 +++
>  Documentation/translations/sp_SP/index.rst | 2 +-
>  2 files changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/.mailmap b/.mailmap
> index 5ff0e5d681e7..83837191affb 100644
> --- a/.mailmap
> +++ b/.mailmap
> @@ -140,6 +140,9 @@ Cai Huoqing <cai.huoqing@linux.dev> <caihuoqing@baidu.com>
>  Can Guo <quic_cang@quicinc.com> <cang@codeaurora.org>
>  Carl Huang <quic_cjhuang@quicinc.com> <cjhuang@codeaurora.org>
>  Carlos Bilbao <carlos.bilbao.osdev@gmail.com> <carlos.bilbao@amd.com>

Is there a reason you didn't just delete the above line?

> +Carlos Bilbao <carlos.bilbao@kernel.org> <carlos.bilbao.osdev@gmail.com>
> +Carlos Bilbao <carlos.bilbao@kernel.org> <carlos.bilbao@amd.com>
> +Carlos Bilbao <carlos.bilbao@kernel.org> <bilbao@vt.edu>
>  Changbin Du <changbin.du@intel.com> <changbin.du@gmail.com>

Thanks,

jon
