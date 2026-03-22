Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63133644C1;
	Sun, 22 Mar 2026 21:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774214746; cv=none; b=Bzns604LbYpSFu5xTNiNcNctUqkkDzIYUHomXwzoFrwlrMwkwcVZIs8nTl0obKoTp8UWfs8QRe1UcMXloQxdAbN570Fz7kVp22Lzr1M9LCGinos0SLwk2I/oKU22Gu81mJAluqsk3l83NQIeXJKB7cgrjCqtUuQNVf1SB4jEy18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774214746; c=relaxed/simple;
	bh=sLzZwqlgIyIewuma8u6FvE4MBBCLnIib9IormRqucxo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=hvZuC3he6Xuk+O0E2LO0c+nEeswQkptal1dNKM4RtrwgPF7HwKwJqTLUAWuiWXdNtHSTJE48ueFtn0nT2S5plKmbg+nQLA9db6kLY5KHPUJ077Q384SB5WzwrbcY6MjAZt9/Ygea66MOecwE8TwsGs504aQUtJfGxzVL9GPoVt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=GRPdBir0; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="GRPdBir0"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 2846C411EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1774214745; bh=VN0HovmkbKOOtza+Hn4S6PjAcvyHLvcaFjoiB2Ew/30=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=GRPdBir0mIhwM8QN5GPdJs0DjoEy5vsCuAizP3aPLh3+ES5U1kIhWXQ3YQyidIbcS
	 wQrb0yLfbUP5TorCYzQh69pe9HTf3usaJimWfvio7jXjT0Y4T0tdm4pntYNuc176hu
	 zGFofdXbuXW4JnpgmQQrlAz+FZh5y7WOzWL/rs/3ukbFznD10WbPINFl5ha2a/zMa4
	 0oQX43/xcSWXHMVlv94ukaBgFD1GTUfSVqAgDPref7JD1geiNupelcnJ+kUWodYq/o
	 o0z2uZnECkXsWrEv9D6s71uF4zR6pQtMcOxXqGljqEiMAYH5YNh6ctPIUo7njAJKYE
	 9Tf7AW0TWj58Q==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 2846C411EA;
	Sun, 22 Mar 2026 21:25:45 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Aleksandr
 Loktionov <aleksandr.loktionov@intel.com>, Randy Dunlap
 <rdunlap@infradead.org>, Shuah Khan <skhan@linuxfoundation.org>, Sasha
 Levin <sashal@kernel.org>
Subject: Re: [PATCH 00/14] More kernel-doc patches
In-Reply-To: <cover.1773823995.git.mchehab+huawei@kernel.org>
References: <cover.1773823995.git.mchehab+huawei@kernel.org>
Date: Sun, 22 Mar 2026 15:25:44 -0600
Message-ID: <87wlz3blpj.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> Hi Jon,
>
> This series comes after:
>     https://lore.kernel.org/linux-doc/cover.1773770483.git.mchehab+huawei@kernel.org/
>
> It basically contains patches I submitted before on a 40+ patch series,
> but were less relevant, plus a couple of other minor fixes:
>
> - patch 1 improves one of the CTokenizer unit test, fixing some
>   potential issues on it;
> - patches 2 and 3 contain some improvement/fixes for Sphinx
>   Python autodoc extension. They basically document c_lex.py;
>
> - The remaining patches:
>   - create a new class for kernel-doc config;
>   - fix some internal representations of KdocItem;
>   - add unit tests for KernelDoc() parser class;
>   - add support to output KdocItem in YAML, which is a
>     machine-readable output for all documented kAPI.
>
> None of the patches should affect man or html output.

OK, I applied this set too.

Thanks,

jon
