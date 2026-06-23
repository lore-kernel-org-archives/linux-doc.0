Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2932EEE89
	for <linux-doc@vger.kernel.org>; Tue, 23 Jun 2026 20:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782247560; cv=none; b=OM1zWRs4fdFfr/UqVk+9Bp07M4SHH83o8X5viUZfoyTC/9DIJcBGHxip7VTHGOLNEFK9YS1Ewygpz6Nl4sdQ5TyJ8/8kSe6W3MK+2uCBbMCebazWF7JZOd/8fGShbv7FHwMPF3n8BdLXU/sYyuBV1Zu6GIUnUcFcJVAqxoUKZPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782247560; c=relaxed/simple;
	bh=iHQMkH1XruXKqng9R1b3DNz3mNr2GRPUnBPENqIFdVQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=t/VOwwG4RI2c9/zsdQDjwJ9zlArw4N0HxH2U4FYyRTZYBzTFoZHRwqMTQ5RyBdkGjqLvCritgKvJe6LYsJq4za7G9hfTg5T61z+pnVjXLVmc/38T3GEfhoRWxX+yLvmFozzHbG/Ua+UCokQsEDgXa6SdnHraTxogb6EZv5/EwdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=huK9ID60; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="huK9ID60"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 6FD2B40E41
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1782247558; bh=LDTLqmTXBPMLO0qpm18u5Tg9s29oRuwyqp30isIBHpU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=huK9ID60sCex0CWxwfOUIPMfRApaz4cJZGeb2xLoh3AdLipi64vOi+fgH0Hxi6gL0
	 neiPj8ktuCDg2+VDRhvinFrncnAznxgUw+3v4hW4xgLZqlmQhCpJ9R9nB3p5Kvb8Xz
	 lNe6ML/HyBCmPL8fLn1I4rwyp9256XmQmz+IMCN7ZeqGpKEsbUhM2NLWO+sK0ZVjr5
	 DyFKe+eYszRwGE26IxPHtqY5cO8wBs7atQSC/szStucIc4m2iNcFP4VC4cltw9+tUV
	 XDtxEeYWBQOMC64WHCEwmazWlZnZUjSil11iI5D/G2+Sm1W83E2DcePx8VpTEqlRAJ
	 iZsoFjjkE/7WQ==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 6FD2B40E41;
	Tue, 23 Jun 2026 20:45:58 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, Shuah Khan
 <skhan@linuxfoundation.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Harry Wentland <harry.wentland@amd.com>, Alex Hung <alex.hung@amd.com>,
 Ivan Lipski <ivan.lipski@amd.com>, Dan Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Christian =?utf-8?Q?K=C3=B6nig?=
 <christian.koenig@amd.com>, amd-gfx@lists.freedesktop.org
Subject: Re: [PATCH v2] kdoc: xforms: ignore special static/inline macros
In-Reply-To: <20260612234458.1084156-1-rdunlap@infradead.org>
References: <20260612234458.1084156-1-rdunlap@infradead.org>
Date: Tue, 23 Jun 2026 14:45:57 -0600
Message-ID: <871pdxasu2.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Randy Dunlap <rdunlap@infradead.org> writes:

> drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c contains 7 (for
> now) functions that use STATIC_IFN_KUNIT or INLINE_IFN_KUNIT macros for
> function qualifiers (static or not, inline or not).
>
> These cause parse warnings from kernel-doc:
> Invalid C declaration: Expected identifier in nested name, got keyword:
>   struct [error at 29]
> STATIC_IFN_KUNIT const struct drm_color_lut * __extract_blob_lut (const
>   struct drm_property_blob *blob, uint32_t *size)
>
> Handle these in kernel-doc to prevent multiple warnings.
>
> Fixes: 647d1fd04652 ("drm/amd/display: Add KUnit test for color helpers")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> v2: drop an unsubmitted patch so that this one applies with no problem
>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Shuah Khan <skhan@linuxfoundation.org>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Alex Hung <alex.hung@amd.com>
> Cc: Ivan Lipski <ivan.lipski@amd.com>
> Cc: Dan Wheeler <daniel.wheeler@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: amd-gfx@lists.freedesktop.org
>
>  tools/lib/python/kdoc/xforms_lists.py |    2 ++
>  1 file changed, 2 insertions(+)
>
> --- linext-2026-0610.orig/tools/lib/python/kdoc/xforms_lists.py
> +++ linext-2026-0610/tools/lib/python/kdoc/xforms_lists.py
> @@ -102,6 +102,8 @@ class CTransforms:
>          (CMatch("__no_context_analysis"), ""),
>          (CMatch("__attribute_const__"), ""),
>          (CMatch("__attribute__"), ""),
> +        (CMatch("STATIC_IFN_KUNIT"), ""),
> +        (CMatch("INLINE_IFN_KUNIT"), ""),
>=20=20

Applied, thanks.

jon
