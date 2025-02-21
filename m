Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C1A1FBC86
	for <linux-doc@vger.kernel.org>; Fri, 21 Feb 2025 20:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740169297; cv=none; b=PC/fR+pF3OEXXegvVmI0D8KyKXjqrbmKFtFXCjDgCFCeHbkfiLOylFpZwDo56IKk1qHaemNdrwktlElvjIzddz5e709MpgXwvkLLdKzOjrIV/eXp9WW74+XhTwCdfJ2ZRPJ7nGGDG458KNUmqXiQ9nR19yNOtNLkafWEo4yjbPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740169297; c=relaxed/simple;
	bh=6a21aRy9aL3ShnWtX9g5AiMxR61q6Xe1QTGDN2WHhqw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HibQHE5LwRIhHTYtHwbdemNKSFSSLCwaKm0Al/NTLf193YrmDbM0rBsa1lZ0gFbVypEy7bbVa4v3cfaOMiv7Eei/CAlRM2UN5SCV18H+q0I4APtqhlUv8Tp+4AcI7gbPD7+o2LyQxtwQr/n6vOS0c7f0vJpQtFwXHIB5gO9kLiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=bXNHQPsm; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="bXNHQPsm"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 0619A404E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1740169285; bh=PU/SwfBa85h+HLRw99vDkvdGq/5DCYk+ej3ps660cEQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=bXNHQPsm00KZW9AceWRarNUjTQRF0Yyi1z6FGZ+5axT0ojB6YyZJ6UGxdDfxjNSW3
	 j/+aM2kgoLIrTzmEx7w0uo2qwxrI5i+3i8oHeVQAKvBjTJFMgjw2bSnFdpLthwPok4
	 /43wJfylP2JDtVTHLinnBM7O/s8+TggSXg0B4w4MzfCGHdHSS5W5eZstv11CEtRSxG
	 +Tvy8LBLRD//EpqPYfND2CiZb0qDlaFQTEMSXxrkRKOL1ZdphrCeJt40sNYttF5fWW
	 W55oQfqGoGbgNgQTTTb/W1PsLngQg1iYrGG/SmvjZqizDZIEqHpoheXCcqGN3sVYiT
	 6/EHr9MFxF3cQ==
Received: from localhost (unknown [IPv6:2601:280:4600:2d7f::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 0619A404E4;
	Fri, 21 Feb 2025 20:21:24 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: linux-doc@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>, Tsugikazu
 Shibata <shibata@linuxfoundation.org>
Subject: Re: [PATCH v2] docs/ja_JP: Convert SubmitChecklist into reST with
 belated updates
In-Reply-To: <20250217060132.64670-1-akiyks@gmail.com>
References: <20250217060132.64670-1-akiyks@gmail.com>
Date: Fri, 21 Feb 2025 13:21:24 -0700
Message-ID: <87r03rgibf.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Akira Yokosawa <akiyks@gmail.com> writes:

> This is a brand-new translation against
> commit 2783096fb1dd ("docs: submit-checklist: Expand on build tests
> against different word sizes"), rather than an update of
> ja_JP/SubmitChecklist, which has never updated since 2008 except for
> trivial changes not involving translation.
>
> As we now have two reST contents under the ja_JP translation,
> to avoid duplicated boiler plates, split out ja_JP's own disclaimer
> part into a new section and put a reference to it at the beginning of
> each doc.
>
> As there is no prospect of ja_JP to have a lot of translated docs,
> keep those .rst files in the toctree of ja_JP/index.rst.
>
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> Cc: Tsugikazu Shibata <shibata@linuxfoundation.org>

Applied, thanks.  It's good to see the Japanese translations getting
some attention.

jon
