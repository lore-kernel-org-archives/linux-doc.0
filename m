Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC333B47D8
	for <linux-doc@vger.kernel.org>; Mon, 27 Apr 2026 10:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777284313; cv=none; b=gMGGCsga0l6CJD/e2iUvU64mbF5hdqMS5t0oqSRj+TskNB7x9VhsXwmoudOdVn9Nep1j5Jdet4uL6kQ1o7bMW87X5VksXafbaFFU7k4OA4gwCueJUU0vtz6fqGiLsioPWqAsbOrzn99WsAUyyrC7bfYB6I+WZekOiFjy2DT3xMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777284313; c=relaxed/simple;
	bh=Q25Gfo07z80ys76ge17Zp0BGA9Rj8pKbaP31+rPRHHk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=cnpuJp7K/LXxLc1N8XDVc9KDD17xKvzKzvIqYaXhRc4ML393bv7b5LP8SBpbA0BzEa5Xub/lGwpzMQAoiC8V6O18WjBwEUKULLoRaqZNEGcAnLQ8lJ/HQC3aYJm8PNlVJNOZG6Ue/qCtiJVJ7yEvXC/GwEYU4ksQKgqhWB0Nyb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=p1dSDxgk; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="p1dSDxgk"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net DFD6441098
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1777284312; bh=g/CktHUxtVkOWCoix776tJFsy6XD0cWxekB5npX/qIo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=p1dSDxgkvo64g5g+1EefXSYQFg82qZEk47z0ikfx/qSdXI2cs/9eMdC1oUqAJ8Bay
	 yWaUlsM1+Wp/kcmU0zrb2TUM6FeIAT5bwdbcdF2hXnVwE3TA0taAeyZqDoP/XM/hkM
	 g5t8Yi66xcuarYUcnQAaUhwu8wZqURn5IznkXrLj2rsj31oE4j+bzbGfnGDHoiTl1D
	 bBvKaayiVsZ64nPg49umbl+uIpFjmdgkPsfSTSTKnOZu/Oq7ApdTcennXg6Z6YTkyc
	 QXJsCoprt+k7wDctS0UpKztSMS+58EXwqegBpse0wCDNpySZa2NrMns1e5a8StT6Ah
	 Hx5mbwv++W1xQ==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id DFD6441098;
	Mon, 27 Apr 2026 10:05:11 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: fru1tworld <fruitworld.planet@gmail.com>
Cc: skhan@linuxfoundation.org, linux-doc@vger.kernel.org, Hyeonjin Kim
 <fruitworld.planet@gmail.com>
Subject: Re: [PATCH v2] docs: fix typos in kernel documentation
In-Reply-To: <20260415001204.6428-1-fruitworld.planet@gmail.com>
References: <20260414084553.22762-1-fruitworld.planet@gmail.com>
 <20260415001204.6428-1-fruitworld.planet@gmail.com>
Date: Mon, 27 Apr 2026 04:05:08 -0600
Message-ID: <87bjf4pvl7.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

fru1tworld <fruitworld.planet@gmail.com> writes:

> From: Hyeonjin Kim <fruitworld.planet@gmail.com>
>
> reinitalizes => reinitializes
> unpriviledged => unprivileged
> sub-struture => sub-structure
>
> Signed-off-by: Hyeonjin Kim <fruitworld.planet@gmail.com>
> ---
>  Documentation/block/data-integrity.rst | 2 +-
>  Documentation/core-api/list.rst        | 2 +-
>  Documentation/gpu/drm-uapi.rst         | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)

Applied, thanks.

jon
