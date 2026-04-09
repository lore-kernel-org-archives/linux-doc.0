Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2066F31F984
	for <linux-doc@vger.kernel.org>; Thu,  9 Apr 2026 14:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775743932; cv=none; b=cruioBcCLc3k7pWndeFuX7ynMrbuue42Vjzhdru7otyAwheLS910amaoNgc17I55PiUgk7kf6bUSTBRJn1MDF7byeEN+2sA5MKEpFupmnidAkx+IGfrfM9F3JBmL71mLHCsnXAx6YwD80OT6UKiSsxbGJIck9kfo7VeS4lCcGQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775743932; c=relaxed/simple;
	bh=432YExEfmAUjkulYG5vWgQGJNa0T7Ntlh9pzq4Vp8Fs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=s/RXP9LaVJkvZEiObcA1fdvMrsX7UmmvX3mhB3O5zEMn7maduUPRRLDV5w30n0o3/Ej8hSAPfrUHnad6/mlVnB/Ow0F2pMrZC4AEZ7p1g132JQUlTCjVRXPUcf2p8OOFQNbEFI+4FCdFipJveh2ucxbSNxTNyK9P9DuS95HX7JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Z4F7tdag; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Z4F7tdag"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net D31CC40B2D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1775743922; bh=bQG/tJgXdI+zAfhIsi9mdtH9YpevyoOilicPk0eKqX8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Z4F7tdagXrpEpm2tPooL6zVfr/+avTdV88QQpds+TDi7pNJkfLkHBOQuTpu2Wn28q
	 IxoQB9DPM1TlazDPHo/ggjriP4UzFJ9naxo/6ZoUItvtKkXQmTztJiiL+gte8PxSyh
	 EBh6u4VujyfTG9U5bO1EU/yUjJgOZeHnMJcfevyQgrP3QxQr3rab/msUkK0WGxV8ys
	 wIH/NDndYjaPPcU38F2C/qdty3Hzw2TWEz3SscVRQtd9puoy4EdF+TRXbCsl/1lWQy
	 PV2ZVR8PDYR3sfUP64dFiWDtnUIARYBSLBD2khxkkyy6Vq8VMlwSKRxkPd7rbxzWTS
	 DvqFwuUgr06dg==
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net [71.229.227.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id D31CC40B2D;
	Thu,  9 Apr 2026 14:12:01 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Gleb Golovko <gaben123001@gmail.com>
Cc: linux-doc@vger.kernel.org, Gleb Golovko <gaben123001@gmail.com>
Subject: Re: [PATCH] docs: fix typo in zoran driver documentation
In-Reply-To: <20260407212818.925-1-gaben123001@gmail.com>
References: <20260407212818.925-1-gaben123001@gmail.com>
Date: Thu, 09 Apr 2026 08:12:00 -0600
Message-ID: <87se94cjf3.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Gleb Golovko <gaben123001@gmail.com> writes:

> Replace "an a few" with "and a few" in
> Documentation/driver-api/media/drivers/zoran.rst.
>
> Signed-off-by: Gleb Golovko <gaben123001@gmail.com>
> ---
>  Documentation/driver-api/media/drivers/zoran.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/driver-api/media/drivers/zoran.rst b/Documentation/driver-api/media/drivers/zoran.rst
> index 3e05b7f0442a..2538473c3233 100644
> --- a/Documentation/driver-api/media/drivers/zoran.rst
> +++ b/Documentation/driver-api/media/drivers/zoran.rst
> @@ -222,7 +222,7 @@ The CCIR - I uses the PAL colorsystem, and is used in Great Britain, Hong Kong,
>  Ireland, Nigeria, South Africa.
>  
>  The CCIR - N uses the PAL colorsystem and PAL frame size but the NTSC framerate,
> -and is used in Argentina, Uruguay, an a few others
> +and is used in Argentina, Uruguay, and a few others

Applied, thanks.

jon
