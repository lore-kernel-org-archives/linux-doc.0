Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3AD3750C4;
	Thu, 16 Jul 2026 22:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784241737; cv=none; b=W87xSmuloQJgx1WiNQfqQjC9q6jdZSOHBjTMfGvpYOf+9LiGpbTFWS43irrZP3iCE/19D2gwmH1CVIsnyV0wZPwPmFCCBPwECZQIiLL6RQUJa7AJNlrc5LN4PMRSan3JOY2YH2c7S1XpYlt0/MfuBIIyrcWiGP5/SXz/FX+UD7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784241737; c=relaxed/simple;
	bh=3fneenNfxHc+FxsdOXLu/EpDCXvze5HJPH2w4K6LttM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=h30EVAHdM8iPIWQiXV5Mhzos+3QrlrCrHvZWDB/AzI+fqed+RKyUzGx99eYagz5lDQI1I/yUsCnYd5p4nsAFO0EDCONi4f9RblVECMRDjtsMMyFIkYnS/OHGl/Kgjr1p7imVtJrzQ2mmgGEU/q66ef+OtnoeOT9eFFHTQy24mug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=ALQEOvZG; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="ALQEOvZG"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 9692F408B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1784241735; bh=WDfpaP5xxeQ782vIEGFpU35FjgY8VKT4S8rBw/9VApI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ALQEOvZG1iufyygpKMFRG/Wj6PSN/Q7IemJURwmeqerduFbzTSlm9O4PaIwCk0kvp
	 w79WWk9YJdSGIkwlfgaxwGzTPgElBzNsvARt0gWo7ynsteRPzTK2XNt27f00oWSVpG
	 mvrqUbqdgjZ3kKd3c24sXFljClOVByy54py+Lxdl0mK9BRdbilmKxJ+NVhX8TQQVlv
	 xSaOTQWYwXCdr2tKvTEIzsegTb9sbd96/mwdItNGBqim3M6TKVtLvzS7zGDdmzUa6P
	 PAr27AS+GbJd55rJoyHv7XA2K2jT1OHlTwfxRuhgFj4Pmc0loSAJx/VJVzQe5qRMeT
	 kzyCdzZpqRqeA==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 9692F408B2;
	Thu, 16 Jul 2026 22:42:15 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Weijie Yuan <wy@wyuan.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Akira Yokosawa
 <akiyks@gmail.com>, Akiyoshi Kurita <weibu@redadmin.org>
Subject: Re: [PATCH v3] docs/ja_JP: submitting-patches: Refine wording etc
 for "splitting changes" and later
In-Reply-To: <20260715120545.99917-1-akiyks@gmail.com>
References: <20260715120545.99917-1-akiyks@gmail.com>
Date: Thu, 16 Jul 2026 16:42:14 -0600
Message-ID: <87pl0m5zg9.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Akira Yokosawa <akiyks@gmail.com> writes:

> Resolve rough edges in translation text added since commit 61e4155c81d1
> ("docs/ja_JP: translate more of submitting-patches.rst").
>
> As with commit 999084ee0b11 ("docs/ja_JP: submitting-patches: Amend
> "Describe your changes""), do the following tweaks:
>
> - Rewording and rephrasing.
> - Suppress extra white spaces rendered before and after strong emphasis
>   in HTML and PDF by using espcaped spaces.
> - Provide translation words for "embargo", "word-wrap", "top-posting",
>   etc.
> - Rather than keep "interleaved replies", use only =E3=80=8C=E3=82=A4=E3=
=83=B3=E3=83=A9=E3=82=A4=E3=83=B3=E8=BF=94=E4=BF=A1=E3=80=8D
>   ("inline reply"), which is a popular term in Japanese.
>
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> Cc: Akiyoshi Kurita <weibu@redadmin.org>
> ---
> v3: Remove duplicated Signed-off-by: ...
> v2: Use =E3=80=8C=E4=BB=B6=E5=90=8D=E3=80=8D for "subject line".
>     (Inspired by Kurita-san's submission at:
>         https://lore.kernel.org/20260712210535.161387-1-weibu@redadmin.or=
g/
>     , "[PATCH v3] docs/ja_JP: translate submitting-patches.rst (sign-off)=
")
> ---
>  .../ja_JP/process/submitting-patches.rst      | 150 +++++++++---------
>  1 file changed, 75 insertions(+), 75 deletions(-)

Applied, thanks.

jon
