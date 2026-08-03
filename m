Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39DCC427A06
	for <linux-doc@vger.kernel.org>; Mon,  3 Aug 2026 18:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785782341; cv=none; b=GBw3z9fZ3Z8lG55nQUQWXUzHKdJZIh1v2g4b2dT4negZozpn44WS8ZHm40RoKqJkOcfrG8iK8Ppvzz1LCf1AdSDgOe28uIro5bg1IMIfoz8fjyD013ze79kR+AbKueGihd9kmBBNT32Yn7bmWGpFrq4tNG6SUAvTg/5aoF5zVg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785782341; c=relaxed/simple;
	bh=AwIssX50xsGWamSzm1yl1mZGq1ZiZBLWhsrcLYmwBpM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=hMKB5dbn4MK2UB6GV1EiB7s4oRb9E9bEexmPLssrv6Uz+bLOSYA/j4ycRQZYtPy3KZ1I74xoH+HCnDYs4n01JsRxDb+zVrh77TQKJpckw6daJtIjs5yWdQYajJuz+Q90srvwkODTpbuy4TkppKd6+mwPNvIacNEwMMtkko2Ogzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=EXUcXilp; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="EXUcXilp"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 5D0D6408B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1785782339; bh=nIQEbuwzg+CbkYWsxxyt8Xecb1yNr6CHUoxlNPeFxvg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=EXUcXilpuDgVXN9mIBgdrcecL9tUTkqXaqI0mPqisG351YHQ5hJlESxDHXmEdtm4V
	 5K5DdcYnWAOjU4aIXLUBFVqRm2HAqXKCKV5ntxvfRLUBDtbCWDkTOsiapis/+QuXjP
	 5xSOLHEWehvK/9hF+ayssrs4SjxFpNA/40ztAG/yDrupMqsOmUjX3CkQ0vrU3LmSaW
	 WpU7iwbdidstgg1F1BvAamCoD4eHCjgFYT7pPmarfqWGWPKNQkv+cdvc+qGZOLIvG8
	 VvDDWUoxvWjDqFXJkgFm0x7ZevzOhSi1acGk5BWHxZeb098M1OwY5KukTqPCzs7oOd
	 v1KyDgaFom85w==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 5D0D6408B2;
	Mon,  3 Aug 2026 18:38:59 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Abel Philippe <le590616@gmail.com>, danielmaraboo@gmail.com
Cc: linux-doc@vger.kernel.org, Abel Philippe <le590616@gmail.com>
Subject: Re: [PATCH v3] docs: pt_BR: process: Translate programming-language
In-Reply-To: <20260727000500.20413-1-le590616@gmail.com>
References: <20260727000500.20413-1-le590616@gmail.com>
Date: Mon, 03 Aug 2026 12:38:58 -0600
Message-ID: <87y0enxd4t.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Abel Philippe <le590616@gmail.com> writes:

> Translate the programming language documentation into Brazilian Portugues=
e.
>
> Changes in v2:
> - addition of SPDX-License-Identifier: GPL-2.0
> - addition of the missing half of the file
>
> Changes in v3:
> - change "linguagem de progama=C3=A7=C3=A3o" to "linguagem de programa=C3=
=A7=C3=A3o"
> - removing duplicate "``rustc`` [rustc]_" from programming_language.rst
>
> Signed-off-by: Abel Philippe <le590616@gmail.com>
> ---
>  pt_BR/index.rst                        |  2 +-
>  pt_BR/process/programming-language.rst | 58 ++++++++++++++++++++++++++
>  2 files changed, 59 insertions(+), 1 deletion(-)
>  create mode 100644 pt_BR/process/programming-language.rst

This patch fails to apply:

WARNING: Message contains suspicious unicode control characters!
         Subject: [PATCH v3] docs: pt_BR: process: Translate programming-la=
nguage
            Line: +Al=C3=A9m disso, alguns recursos inst=C3=A1veis =E2=80=
=8B=E2=80=8B[rust-unstable-features]_ s=C3=A3o utilizados no
            ---------------------------------------------^
            Char: ZERO WIDTH SPACE (0x200b)
         If you are sure about this, rerun with the right flag to allow.
AM FAILED

Please submit a version without this kind of problem.

Thanks,

jon
