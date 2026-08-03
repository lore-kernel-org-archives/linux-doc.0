Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705862C1595
	for <linux-doc@vger.kernel.org>; Mon,  3 Aug 2026 19:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785785064; cv=none; b=hg0RHA1Vt+BhKLT/pMJly/cKzANShJYssh3fq0N5vORIk/yntr+GcVFPnbxkBcqiucPaxbBBMQf+82UA3mkAVYjP/zOBG1tqtacRdtreW9KCDA+/Z5CklLGDmbsUwLYa63sRK7ucQxT3k4AqB6wWAq8o/8TQAQx+S4a3DGlSscs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785785064; c=relaxed/simple;
	bh=gfo55EvuikHY5N/kfTfnQcO4coteHPF0VFj0tfzjyAs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=BEagftLq3fYtW0ck0+m5UA6N9s0s/1FVX0N9Qn0yV5AKUnG/09qwX7YHNmKmo7RhNHadPneeGSpoxjT/NS27fuG/zw93ahIw6wuFfXhK2/96R65OEYkB7qajr+S3t0iniXrv3dOs2PTpXm1YNbjXugUI0PuESi9FUA68P0hP4Ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=KyBrkxbr; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="KyBrkxbr"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net D29D0408D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1785785063; bh=nErfBzOsSZGOgSC/lH8cBNC2WiB7ayrxNuEzqNh8A+o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=KyBrkxbrF14kivRI2maBoYHB82XgsQ/bqNH7fFmbKu9XR+ova5/HeFIH5AhIFXhD2
	 dBvUEvb2JuVAjIql3OxJqva0U1+QlVO7nEGeYOjXju0wpUqaMgn46Hz8cZDNshFvv1
	 7Z/tKmFCwm2qRigs3/aM/ksLPIkZzjzBp1mI/PD1xCTIRo14T/kpZYA4MbPZOwWymd
	 He+n2Q3K0/JQHpCYUZ7MTjVXJmUw0ZbLVolmqQL9LZDNSuRs54N18lJKLhq8FQtUHS
	 c/rrZurWV2PXeLzsl7QDAmM4eXM3+b1KdXyN6Xf16vOxV9Qb5ATDByjzfKggFLu/T8
	 XJdbyv8CS5eJg==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id D29D0408D2;
	Mon,  3 Aug 2026 19:24:22 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Abel Philippe <le590616@gmail.com>, danielmaraboo@gmail.com
Cc: linux-doc@vger.kernel.org, Abel Philippe <le590616@gmail.com>
Subject: Re: [PATCH v4] docs: pt_BR: process: Translate programming-language
In-Reply-To: <20260803185919.921073-1-le590616@gmail.com>
References: <20260803185919.921073-1-le590616@gmail.com>
Date: Mon, 03 Aug 2026 13:24:22 -0600
Message-ID: <874ihbxb15.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

This is not working.


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
> Changes in v4:
> - remove zero-width characters

This kind of stuff does not belong in the changelog!  Please put it
after the "---" line so that the maintainer does not have to edit it
out.=20

> Signed-off-by: Abel Philippe <le590616@gmail.com>
> ---
>  pt_BR/index.rst                        |  2 +-
>  pt_BR/process/programming-language.rst | 58 ++++++++++++++++++++++++++
>  2 files changed, 59 insertions(+), 1 deletion(-)
>  create mode 100644 pt_BR/process/programming-language.rst
>
> diff --git a/pt_BR/index.rst b/pt_BR/index.rst
> index 5b8b60cf930f..de99839db0b4 100644
> --- a/pt_BR/index.rst
> +++ b/pt_BR/index.rst

How, exactly, is this supposed to apply to a normal kernel tree?
Please, review documentation/process/submitting-patches.rst before
resubmitting this work for 7.4.

jon
