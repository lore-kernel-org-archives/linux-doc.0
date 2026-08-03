Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80136411F95
	for <linux-doc@vger.kernel.org>; Mon,  3 Aug 2026 19:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785785487; cv=none; b=P1higOrm76C3I0z/1OM+VKTgy26s2x8EvQXZCac4+aaTiVdl+k4mLYkLoss/wV47uVoaWUZAfXNNu526XSZ3ahaBfFiKvDTSNxRNOeeE7yWaXQqeFKux7TpvWhHAPtq2NvpmyPOD8voDDhILdJostQx9TpzvqguWEJgHMWoCH/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785785487; c=relaxed/simple;
	bh=x8gdoyM+IcIpnpGrgpEb1ICKLj3/svcr1+fgCIE0qH0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=BYddw1WOpmUw3cmI5AjrtBITjUKs8ytsFt2xpXJ9bgxJOvbei2gW/4y7h99x/Uuc+pOZD4Y+EtJWznAle4Tww4tG0LCYMTC2/4HDbnHUeebleaMrCtiJOMlbeUTiziuCnZUWirkDWuX7nbRX+9qnD5rdhXGFFhLA76zNjOfnU1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=KxqQa/y1; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="KxqQa/y1"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 8FBDC408D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1785785485; bh=L1KijGUcgI/p20hiaYETNLGtyhA3uwWjvwmgqk2MY/0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=KxqQa/y1NAbxT7cuDKt9Vxa8SO4+vlu2ICcgRcylxNBIsr1R0EJAXtOavQhwg3vAs
	 MDs/fYo4irSdfMHNwsC8fQffvqHKKTJoLcFVcUj5aCHR8cUd3fPtnYmAsIkgHlA3D1
	 ST/GGdf/Dafo3KOIMVjr2Lcq7DDdXkvrQwPhETE1l1VcQpzWrgDYUSSnbDIlbs7E+S
	 IDeJYTknOld6IwA1kI4udDL3l4OOVf23cLgMqJCDp+18qd/JCQIwUw75lTVUAnBnIS
	 8ZcD7c0z/mLUwKQn+bcdmXxr9F6eFF3wALWWPzymzaDIpPkcAGsS7VrEeI10JlJdTm
	 0CFKwz3Fv4irw==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 8FBDC408D2;
	Mon,  3 Aug 2026 19:31:25 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Amanda =?utf-8?Q?Corr=C3=AAa?= <amandacorreasilvax@gmail.com>, Daniel
 Pereira
 <danielmaraboo@gmail.com>
Cc: linux-doc@vger.kernel.org, Amanda =?utf-8?Q?Corr=C3=AAa?=
 <amandacorreasilvax@gmail.com>
Subject: Re: [PATCH v2] docs: pt_BR: translate the management-style.rst to
 Brazilian Portuguese
In-Reply-To: <20260704202831.112653-1-amandacorreasilvax@gmail.com>
References: <20260704202831.112653-1-amandacorreasilvax@gmail.com>
Date: Mon, 03 Aug 2026 13:31:24 -0600
Message-ID: <87zez3vw4z.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Amanda Corr=C3=AAa <amandacorreasilvax@gmail.com> writes:

> Key changes include:
> - Translated management-style.rst into and adapted idiomatic expressions
>   and humor to sound natural in Brazilian Portuguese while maintaining
>   the original tone.
>
> Key changes since v1:
> - Fix incorrect author email address

Here, too, I have had to remove this information from the changelog.
Daniel, can you please educate your contributors on the proper way to
convey this information?

> Signed-off-by: Amanda Corr=C3=AAa <amandacorreasilvax@gmail.com>
> ---
>  Documentation/translations/pt_BR/index.rst    |   1 +
>  .../pt_BR/process/management-style.rst        | 265 ++++++++++++++++++
>  2 files changed, 266 insertions(+)
>  create mode 100644 Documentation/translations/pt_BR/process/management-s=
tyle.rst

Applied, thanks.

jon
