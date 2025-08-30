Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC18930CD85
	for <linux-doc@vger.kernel.org>; Sat, 30 Aug 2025 21:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756590121; cv=none; b=CVv/dITbIaZ/UzS0Up6TprjEvNp/7JdZmGz4yk85d9cZJa1lo/eUB3UXfHHATxxLiUOeTl++Hy5mBAqTk78cG0jx0YMBh3blBgHsA1H5pHeJSmDArarmybTaJUcWC6DBOoWJzUEA4VliuiLrFLItriAzwvMIooLkwmR11yBET6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756590121; c=relaxed/simple;
	bh=ZByEIJLCt0M5a+6B+EzdbLocHI73ZbV/lbyPHzhMGmw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=TbC4U/59hNr8X2lqzrq66yAPlrl8qiyZzIQi0Mml+FCX/G+Omu7B+ogqw9n/6SqBAkI+xto19fOSTPQqADxyWzVpJBT7LPwCvium9oyuenAX+0ZnDeUmQUidkVSPHwo53EjrnL5x7Vv5/OamxnnuQFjwJ/dcey2B3JJ4+8dUnSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=T1wgcCWf; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="T1wgcCWf"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net A5EC740AE2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1756590118; bh=5G1FqXGh7NoYH6cP2QS7gwkWjZay+ky+KG9QCwURq60=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=T1wgcCWf7HZxypDycXFZ/zZYfxq/I3yGmaEejAuqkmvuABkNlxYQIWA4QSBrJs1Hd
	 +vqWsISx1YnPfVje/1RHALvVjM4HpYHq2CbJNWQVx7MB8rIjWc2Ff70q1zaqeFztE7
	 RG4xeR84vRTBMgAJQOGzrvyRgWyD2fJRKoWubDuT34t0yMWI56Ru9I5jUF8QwxnsRy
	 AcfPm7pb2ciFYjtkBDBqfoplu3cnwbKRikeSFcU4HD5GCi/GhXVAIRDTFsuo2oC4Nc
	 A3UkqqUYdBkYRopMoEbyZqboXZ3akM/JENzQIUuOCN+FrxlSsrdz0VaLJ9z9EfNA8x
	 xkpKrAJybJwtw==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id A5EC740AE2;
	Sat, 30 Aug 2025 21:41:58 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Methari Hari Krishna <harikrishnamethari@gmail.com>,
 linux-doc@vger.kernel.org
Cc: Christian Brauner <brauner@kernel.org>, "Darrick J . Wong"
 <djwong@kernel.org>, Methari Hari Krishna <harikrishnamethari@gmail.com>
Subject: Re: [PATCH] Documentation: Fix typos in filesystems
In-Reply-To: <20250830191249.25459-1-harikrishnamethari@gmail.com>
References: <20250830191249.25459-1-harikrishnamethari@gmail.com>
Date: Sat, 30 Aug 2025 15:41:57 -0600
Message-ID: <87seh81o7u.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Methari Hari Krishna <harikrishnamethari@gmail.com> writes:

> diff --git a/Documentation/filesystems/vfat.rst b/Documentation/filesystems/vfat.rst
> index b289c4449cd0..f408699ce50f 100644
> --- a/Documentation/filesystems/vfat.rst
> +++ b/Documentation/filesystems/vfat.rst
> @@ -361,7 +361,7 @@ the following:
>  
>                  <proceeding files...>
>                  <slot #3, id = 0x43, characters = "h is long">
> -                <slot #2, id = 0x02, characters = "xtension whic">
> +                <slot #2, id = 0x02, characters = "xtension which">
>                  <slot #1, id = 0x01, characters = "My Big File.E">
>                  <directory entry, name = "MYBIGFIL.EXT">
>  

This change is actively wrong.  Please, make an effort to truly
understand the text you are modifying before "fixing" things.

Thanks,

jon
