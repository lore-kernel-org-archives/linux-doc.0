Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88CC0349CF0
	for <linux-doc@vger.kernel.org>; Thu,  4 Jun 2026 15:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780587448; cv=none; b=HmUPiOlA/Qbc2XwgYW8AaA0pugj1cx6zMM4DuxRhyZarAEn70hDn2Yc7B87AVEdzOy4de1l9PDYDXar/hbvgrVYOI4d94vA2N7fp5kwVNHGEEEpDw9eGxCfrz6kuIDlWj+jL2ioMO/iiz/pKtw0ZgqLf+2NNVOZxUbYXc3Py1/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780587448; c=relaxed/simple;
	bh=wxGh5PEkfcZqXPRqz5y0thgmlbePCBL7/nAKSKQ78mI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=RlVrruT2nicuWADIH3LbmHmwrPH9A1aeP8YoG3QNwO62KGqmVbqg5bE1+ypZL2sxrXDw8Ut+jvU5cMk+38WYbrwQMzuUzoQ99zq0bG7ZSuNPRFAFZG3O6wNBF/kwHM8jEZe3qDAvNvX2LIYyJB0+ubtrzaVGGo/KcBvVVy9rKQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=FOLi5fU3; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="FOLi5fU3"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 5C20340E4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1780587441; bh=4OikeQaqhQU8KGqdoGdlozVAkLjx5eliFXI8Yhe0+r0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=FOLi5fU3g/Nt1l4E/FrAQWqrAzhYKsa9F24yRxMzc3LMeCVZ+9qleVX/kcPrm5rKz
	 /akIJRzelsev2WDDHFRHRSs6swG5D2yjT+iTLv1kAagOkO99jiHdKU6ZnO/IXSTSV4
	 JNZdL+QcLXmGw+LHO3YfTbRSBWQ44cRQDibPkwROcjbkDx5V2p19d6lKW5UlcEFK/y
	 81t1YgcUMXFSrncWIddp5NNG832h2po687uxOOWkh+kqCooO3LnMOFXiAcsPIsMvIA
	 UvyVpGrrNsno0J2I/stcNAnrqcAvnZbEr49jhZIJts95IKy9o+mCT+NN40rh6Oczqy
	 FGH1IcILbOZaQ==
Received: from localhost (unknown [IPv6:2601:280:4600:27b:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 5C20340E4C;
	Thu,  4 Jun 2026 15:37:21 +0000 (UTC)
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
Date: Thu, 04 Jun 2026 09:37:20 -0600
Message-ID: <87v7byz58v.fsf@trenco.lwn.net>
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

Some requests:

- Use scripts/get_maintainer.pl to create the CC list for your patches.
  If you don't include the maintainer, your work may fall through the
  cracks.

- Three versions of a patch in three hours is far too fast; wait for
  review comments to come in before reposting, please.

Thanks,

jon
