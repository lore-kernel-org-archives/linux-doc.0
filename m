Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8FDF1DED5B
	for <linux-doc@vger.kernel.org>; Fri, 18 Oct 2024 13:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729258248; cv=none; b=QsPNEgimZgyVfsjq/2KEG693qLSjKj39zht9olW5bMaMhgGF3J4r15IwSkst5T0Wv4FzSuqUSVpxfVaHxl/gpXr2ALb9sPBVgO1Ubufo/TJ16cz/Fv2AagiONoVVHfypXK/Dj1vZCSEzqywodaMLWhSbf33MuKgPjHEcdQVyTAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729258248; c=relaxed/simple;
	bh=5RP5Sy4kINtqeaqGU6/UbqEGQfDkK2PGfhcgpitYwiI=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=nJ1iQsP5YOHITxPE9w4QOs4w5lk97aIHisl8n8WN+ce+gtJyxOuYXtRfKwKBOVWRqTFwq7bN6AUS57xLXSESUBFGHRxwIThXo8L817xb+1ZO68hRcxb3+Qt9kkPsJAeTM8kKgkg8MVKaJt8PrFyY/eAOkUJerK//dQiuWRGaE+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=n2b5KMFX; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="n2b5KMFX"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net AAD1142B29
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1729258245; bh=oAzETrXMpCNx9OPrYa50sBDYq0DEsXcGHaN7bvzT6g4=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=n2b5KMFXPvNwxBU6qry6xFlRF6RhhDeAdZddmBUDEjiaLwE7hulxt5i7LvS90a9G+
	 l+qIS2n2LOQ330lNaYF6ND521uAEsz52rlDNIqv1gqJVaGk5wzeyYtqdBdv778VqIu
	 AfL8VtNeZBxW55a5geMWHbElD0kol1hXopZkcUuwSVwAodIHXqLQ/8qKZtvmBWGi6U
	 w5P+ywHIDD2m002vJKkx6N4AdYYtU/n/D9T9VWSV1aInqPkr1ZlXQwHyFu575dd/RA
	 jOf3nU8BDq9YL1dCpuTzZdVo69AXSG/URXk3+wsZywMqJEpDfBLtOUKfMdQmdzjXIe
	 qrmRCmx7WkRkw==
Received: from localhost (unknown [IPv6:2601:280:5e00:625:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id AAD1142B29;
	Fri, 18 Oct 2024 13:30:45 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Yanteng Si <si.yanteng@linux.dev>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] Add Yanteng Si to .mailmap
In-Reply-To: <11522c3f-5d2a-4ea1-8477-46e66100dd73@linux.dev>
References: <87plny1zam.fsf@trenco.lwn.net>
 <11522c3f-5d2a-4ea1-8477-46e66100dd73@linux.dev>
Date: Fri, 18 Oct 2024 07:30:44 -0600
Message-ID: <87jze5zgfv.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Yanteng Si <si.yanteng@linux.dev> writes:

> =E5=9C=A8 2024/10/18 00:15, Jonathan Corbet =E5=86=99=E9=81=93:
>> Yanteng Si's old address bounces, creating a lot of noise in conversatio=
ns
>> about patches.  Add a .mailmap entry so scripts/get_maintainer.pl will
>> return a working address.
> I am sorry.
>
> At the beginning of last month, I submitted a similar patch, and it=20
> seems that only v1 was merged.
> See:
> <https://lore.kernel.org/linux-doc/20240905021012.2571820-1-si.yanteng@li=
nux.dev/>=20

Sounds like I should be sorry, not you, I'm not sure how I missed that.

jon
