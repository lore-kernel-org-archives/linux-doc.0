Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4CC30F7F2
	for <linux-doc@vger.kernel.org>; Fri, 12 Jun 2026 19:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781292415; cv=none; b=i3auMdn/a8aYyYgSbX3sAfgEn2/k9dLsLSs4t94OJ4Xzytm4D04YxYsDRIjTaFLBhmKT4QDQyJQk0f9ZUrjBxXPLvbMTnzs3kqCw1HsyGLve4UGXxnY0cKG7PN0jHfr/DHKo2U5adCwwOBj58Wn+U2joVuOt3yJWs3Oaqisx4o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781292415; c=relaxed/simple;
	bh=Qzp5Pxp3BLlQ3kQVZijs/AR9bc5/Boz1Yr+343wfwzg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=MIGfwenwA97WNQrw0QxQa3rYhp/rpP5qHuPZ1Y8pk0u6eznx7actvNml+5EfIDMi3Dy1Q05sHThiwOsh2fYgigF/m566jbrj3sajo40B6r+0X33wR12Yqn5oXfvJmYsH4ZdkyD/IqTDvJWLQOCgKM2J6m/SdOas/upjZWduy43Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Xuj//VC8; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Xuj//VC8"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 4B51340E4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1781292414; bh=IODRhEd39ZlpfjrRX22CZX35oT6UfT2r72Bm42stBH0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Xuj//VC8/R8pfrc9BKI1mU4euAYkYl3Sj6N81HGgjb5kAdxQ2xB/n3zzi8qosL8OY
	 yKUerRrPVbOCmegg4Vs0gGqxjy9Sf3KMwi748iYRtHZWjjVEem6JyUr1pY2+99m5cK
	 f88xvGibWTrN9sD3x7Z6BDdaS6+e6u9nSPlK3C2JqNtdo29jKhjdHKkfwyskS+rZ6D
	 4IbeePCnuSX+UN3kTIWZHPTEnGaLH2MbDrP9Zu8BGHrcz99m7bywm9ZLp15+s2b253
	 GaRch87YjCZ4R0Ik2HxKiCAKohosgWH3sghcWaASpfD8wiMaeZiNmc77xlUlJJpthR
	 9lOf5UyD9Rmog==
Received: from localhost (unknown [IPv6:2601:280:4600:27b:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 4B51340E4D;
	Fri, 12 Jun 2026 19:26:54 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Amanda =?utf-8?Q?Corr=C3=AAa?= <amandacorreasilvax@gmail.com>, Daniel
 Pereira
 <danielmaraboo@gmail.com>
Cc: linux-doc@vger.kernel.org, Amanda =?utf-8?Q?Corr=C3=AAa?=
 <amandacorreasilvax@gmail.com>
Subject: Re: [PATCH v3] docs: pt_BR: update "Purpose of Defconfigs" section
 in maintainer-soc.rst
In-Reply-To: <20260604031840.17236-1-amandacorreasilvax@gmail.com>
References: <20260604031840.17236-1-amandacorreasilvax@gmail.com>
Date: Fri, 12 Jun 2026 13:26:53 -0600
Message-ID: <87wlw35zlu.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Amanda Corr=C3=AAa <amandacorreasilvax@gmail.com> writes:

> This update includes the "Purpose of Defconfigs" section translated
> to Brazilian Portuguese.
>
> Signed-off-by: Amanda Corr=C3=AAa <amandacorreasilvax@gmail.com>
> ---
> v2:
>  - Adjust translation of section title to "Prop=C3=B3sito dos Defconfigs"
>    for better clarity in Portuguese.
> v3:
>
>  - Fix plural agreement in section title
>  - Clarify that the referenced device must be supported by upstream
>
>
>  .../translations/pt_BR/process/maintainer-soc.rst    | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)

Applied, thanks.

jon
