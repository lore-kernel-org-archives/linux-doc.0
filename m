Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9CD536EA86
	for <linux-doc@vger.kernel.org>; Fri, 15 May 2026 14:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778855042; cv=none; b=X/iBhWNp6ptwxWcVTo1ubCJEgsppelwOVfZ8z/L1wr7Kg07Q9B7F1whNJy5FfCPlkcMNSPtZCmjDB+DgpmGTxjhE89akD7VoA23yjVwZ1ujTNvJH1Is+Il1iMicIBrBhFR5+cdbW1Cp98t2yjY8RG+0x+dN1tlqpBX1L7Mx+AG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778855042; c=relaxed/simple;
	bh=Vm/osYbTBgn0GbjA6RbPms4tZyz9GrfcKhbGzdialG4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=feC3YbdmQEoImsBM4/inO733lJVNxfsb95MSZNse39VC9uxzbItLuQ9ZZ8BKza0cShgSn80rx5WVff6zGrrTJSEw7Ng0SzVC75OEM4AIC4A8wtkVxmHHDJfTa4AdGQULn338B9Ozbc/7GYovqbytKXGCdb/uHJ1AGKTACqXWpeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=qgX0yWdt; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="qgX0yWdt"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 31EB2410B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1778855041; bh=vJkYCmocxCht2qwBk/F+G/Nz3u5Ni0ovYkMD1ukfxQo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=qgX0yWdtlilQAj2cepD5ei/VvkYo3r/6MoijKPMyJFM3oj1M76x1YZdN/qRU34Ym2
	 MSFjJqqb4G8Dv9ktaARAu2VILpXapJ1HqGpsNDIUbCfM3P+2sv4oaNps6gnwsLvD1l
	 a9qRp3Nm3bAcYPW36eJC+VWjpHYJ+egKBV7vkNMKyhOuof+2ClmnyWj9CyL0RtNXZY
	 0yMFcBGJYgXdjEjCKzYbViCwbgzoVStkcXAxQIxEbH71NqFtEbHYVV4BccW4U54xfB
	 dbEadiNmgQ7pLaINpJes+P6X2Q5MvkS3K95QYT6w7zkuclJ499NOI7ya5hfA1q+1/x
	 WkUrmjSdmk6nw==
Received: from localhost (unknown [IPv6:2601:280:4600:27b:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 31EB2410B5;
	Fri, 15 May 2026 14:24:01 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Daniel Pereira <danielmaraboo@gmail.com>
Cc: linux-doc@vger.kernel.org, Daniel Pereira <danielmaraboo@gmail.com>
Subject: Re: [PATCH v2] docs: pt_BR: translate process/license-rules.rst
In-Reply-To: <20260503160352.160135-1-danielmaraboo@gmail.com>
References: <20260503160352.160135-1-danielmaraboo@gmail.com>
Date: Fri, 15 May 2026 08:24:00 -0600
Message-ID: <87ecjcrbsv.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Daniel Pereira <danielmaraboo@gmail.com> writes:

> Translate the license-rules.rst document into Brazilian Portuguese.
> This document provides guidelines on how licenses should be identified
> and handled within the kernel source code.
>
> Additionally, update the pt_BR/process/index.rst to include the new
> translation in the documentation tree.
>
> Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
>
> ---
> v2:
>   - Fixed docutils warning: "Line block ends without a blank line" on line 72.
>   - Removed stray '|' character from the translation file to fix the build.
> ---
>  Documentation/translations/pt_BR/index.rst    |   1 +
>  .../pt_BR/process/license-rules.rst           | 483 ++++++++++++++++++
>  2 files changed, 484 insertions(+)
>  create mode 100644 Documentation/translations/pt_BR/process/license-rules.rst

Applied, thanks.

jon
