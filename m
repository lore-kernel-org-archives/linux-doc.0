Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5687F257821;
	Fri, 23 Jan 2026 18:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769193301; cv=none; b=ezS6wTZEW45rwWtAwPePmdC6DoEb0YWTSJeK5JCekh4fmcCf5g1NIZrgVz3oyw0tOWjmn3w8l+pXdhwHCovFTA+sHwysZdwtgxSxM9sqgAv8aKBxu0ZrjDgaBzdMHutVqgfbr8Tnf1BPBkqxideWNCbKHrhH5axfcfUpwOQDHh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769193301; c=relaxed/simple;
	bh=mHTOq4d+jvPAhg9JyUgJLnLRiDZBSEUMGvyWx25t0GA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=KPBuccEeYOEqam0rXNNpCJKTKK7DzsO2xHizqRndRtWNrqqZopf9lhHB6TjVRMC4sYpgldkEJuq3QY58pbYTL1TYLHi4u03ZftJo1vRCwKwPG37qADuGawxG0BcgPDfOGzZaOFPUXfZmIA8i0rLZgAFJIeVE34ojyI7fGJS9ODM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=aGp5lXvV; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="aGp5lXvV"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 8F2BB40C3E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1769193299; bh=aTTYQowlHYshiDtzv03aPlk8DeZF1HOeIW8JviNucF4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=aGp5lXvVtrUIr6MHp8o2TT7JxWTAsN6yR4lbP0BOe/Q8Fr9jFsmbFAOLnPudxSRuj
	 VoMcgAfhDqcjUlHrEaOuTgiugxG7E0wR52hRbAWFJuIeiaAhHuGr8uwiTIQ0/Cbs8M
	 Lj2l/wpfEXlMrw6D+iROEgaprL6rtdMmjRhBrvOjned+QATM1iTUlCBUCa7aK2fgCf
	 fSRLlOzvVo9mwAyec0+uw2AM19eQwKu37uplhYSEzXmpsFXfUw3WxET72f5HJjOnBa
	 VLtlsknbCY1gntkLEnCcLGlvtOb9iJM+QhRRszIjHFhSr1UB1m3Dt/DbZwYPdOuEMn
	 ytyPJWVUdkPJg==
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net [71.229.227.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 8F2BB40C3E;
	Fri, 23 Jan 2026 18:34:59 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>, Mauro Carvalho
 Chehab
 <mchehab@kernel.org>
Cc: Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Thomas =?utf-8?Q?Wei=C3=9Fschuh?=
 <linux@weissschuh.net>
Subject: Re: [PATCH 0/4] tools/docs: sphinx-build-wrapper: avoid spurious
 rust docs generation
In-Reply-To: <20260118-docs-spurious-rust-v1-0-998e14b9ed9e@weissschuh.net>
References: <20260118-docs-spurious-rust-v1-0-998e14b9ed9e@weissschuh.net>
Date: Fri, 23 Jan 2026 11:34:58 -0700
Message-ID: <87ldho18kt.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Thomas Wei=C3=9Fschuh <linux@weissschuh.net> writes:

> Currently the rust docs are generated for each entry of SPHINXDIRS,
> even those not mentioning the rust directory.
>
> Only generate the rust docs only once and only when requested.
>
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> ---
> Thomas Wei=C3=9Fschuh (4):
>       tools/docs: sphinx-build-wrapper: generate rust docs only once
>       tools/docs: sphinx-build-wrapper: make 'rustdoc' a local variable
>       tools/docs: sphinx-build-wrapper: compute sphinxdirs_list earlier
>       tools/docs: sphinx-build-wrapper: only generate rust docs when requ=
ested
>
>  tools/docs/sphinx-build-wrapper | 80 +++++++++++++++++++++--------------=
------
>  1 file changed, 41 insertions(+), 39 deletions(-)

Applied, thanks.

jon
