Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942D246DFEB;
	Mon, 24 Aug 2026 16:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787590650; cv=none; b=k/pWfl1UPQhjIc7igd9lapPRMZqEUgQLzGcBPTAr/HRwNGYwjZUPSQvfXcoMOAUlL0Vl9keC80MIl6PUyikb/O+p+p8t1+zquw1NAA+gJTxAhAg7X4JruTqC8niXTTgp7esMwDKWZTDtwaKvv9XZ0sOeo3GcFVLeNKOIrxD+Xas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787590650; c=relaxed/simple;
	bh=UScjwLeiP7F1DeJq1yHi/xkbYrMFx9cLnEUluagHNIM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=tj7Ng71r+CsSi8E9cPEVVfjqPfo55qYhjh2v+BcjZw6x8oB/iQAA2qTBwyGp09BiRQO3UAbgddXvRGQhfQLx87o+pMXYhViMSGA+p9kYksB71Ep6jQLRYzo/SjW4CkbVYo49O3jzllt+8J76QlYCBJHsrPXYQvW83IZ0Ub68XOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=OcpdICNP; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="OcpdICNP"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 66A2040904
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1787590642; bh=4j2Rd4lvkbfF/2bOc/1tm0GlFWbqaGiHE0d0aL+bCm0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=OcpdICNP9r7jzDw+IchTMgA7YSgT6LbwZLRUXsXmqKWt6CF2Tt6haljjRI3mQ88gT
	 ujGGGJdDWBLUKNBI/jEhk4aMVML72zN8ets6/K7FQ0rRu0F5GjHMqdCtpkaEPVRnqh
	 W06ztS4OaiOwFxKRB41C6IyoKTtNIcrh7C0SmBAS0uJMGbyHXtdp1HSN74BKM9Mg/M
	 FimfUC9WRY1XiV4Lx62lOhhRqVDAyqVCqG4EFlZ0vpQM3y67hRk0P73me1UMd+gPcQ
	 ltSpXXbg/lFkfZljUHn1Dd/bMZ0XwdW5/AVJW78wCO5k1mcyloJ60IFAH5kqnWZnyF
	 24zmGv+TXziBQ==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 66A2040904;
	Mon, 24 Aug 2026 16:57:22 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>, Shuah Khan
 <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, Thomas
 Gleixner <tglx@kernel.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/7] docs: cpu_hotplug: Fix multi-instance removal calls
In-Reply-To: <20260822121651.1559-2-kmehltretter@gmail.com>
References: <20260822121651.1559-1-kmehltretter@gmail.com>
 <20260822121651.1559-2-kmehltretter@gmail.com>
Date: Mon, 24 Aug 2026 10:57:21 -0600
Message-ID: <87fr03zcb2.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Karl Mehltretter <kmehltretter@gmail.com> writes:

> The function is named cpuhp_state_remove_instance(), not
> cpuhp_remove_instance().
>
> Fixes: c9871c800f65 ("Documentation: core-api/cpuhotplug: Rewrite the API section")
> Assisted-by: Codex:gpt-5.6-sol
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
>  Documentation/core-api/cpu_hotplug.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

These patches could really benefit from Fixes tags.  For this one, it
should be:

  Fixes: c9871c800f65 ("Documentation: core-api/cpuhotplug: Rewrite the API section")

Can I trouble you to fix the rest of them as well?

Thanks,

jon
