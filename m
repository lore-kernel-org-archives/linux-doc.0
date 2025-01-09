Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA991BA2D;
	Thu,  9 Jan 2025 18:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736448805; cv=none; b=XX/dNi8MlgpUjNxfClm0cFZ9KbIxc0zXhT6s9WOu1DZ16IG3qO0eg8mGlL8kRKCKo74HKqUUzssYrUSowLbN6saSTij5TMntCon239SkmNAVHsct9jfzyfATf0m62GrfFhL4+p6C/PGjnyioZXfhWHwRcEr1CuZm2bgNaDM9ZSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736448805; c=relaxed/simple;
	bh=ld//G/JqzIfs8hQpyy4O2y2OA6BPhlUmZ7uMY6FHLw8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Ef4zjlpnjUcbL3iZY9Z3ZB6LMnyFFg8Z1c2HQ2PeBgAX2yF77VIwPx15ZtoYZNUBbaxPS07r0wFj2djWFAnfvX9t0EZtrbKgQWkF2P3+Wqplb+ojC5zEwLUmS19qbL3ZerLfvup68KXIRN3bQ2lWMnzXUBA1dVonj0KfC8M05n8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=LWBeBwKP; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="LWBeBwKP"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 06570404F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1736448803; bh=KrmapTjRlxpC1YX9zLaFoJD2SL9ulQUWjDQyoshsuHw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=LWBeBwKPnrjOoGc4iM0h/J3aAbvrLv6z4w/FsqMGPLcZ9a0tKPXl9AqYX6JrcwJsq
	 EOITn5YyOTITySS8ZfjI3II0kkD44grzwhIKpGlGqxaOZT+RnTXXljgBwXZQMqoKwi
	 I6ttrEhxqXRE9iWMmlTf8QJADmaIau1bgTlJNfe/oahKsGHD/Z3Yc0d8HQuHAgZ0Ny
	 1YaEwXmr2S34wmR/p8DdCqWBaZ1fvu+vOzf7157QUbI3+DJ9jTOt/+xSykLDIsS8A6
	 Xr6Y9BkMTMWEy3g+k4vyLfv0ob3MeZtnlRm2imDlkufyRsce8fEAgen1RI+q3lbMOy
	 7stgwyYI/YsMw==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 06570404F0;
	Thu,  9 Jan 2025 18:53:22 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Li Zhijian <lizhijian@fujitsu.com>, linux-doc@vger.kernel.org
Cc: Thorsten Leemhuis <linux@leemhuis.info>, linux-kernel@vger.kernel.org,
 Li Zhijian <lizhijian@fujitsu.com>
Subject: Re: [PATCH] Documentation: Fix typo localmodonfig -> localmodconfig
In-Reply-To: <20250103004358.1310121-1-lizhijian@fujitsu.com>
References: <20250103004358.1310121-1-lizhijian@fujitsu.com>
Date: Thu, 09 Jan 2025 11:53:22 -0700
Message-ID: <87ldvjlsyl.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Li Zhijian <lizhijian@fujitsu.com> writes:

> It's noticed when I myself made the same spelling mistake while
> searching for localmodconfig
>
> Signed-off-by: Li Zhijian <lizhijian@fujitsu.com>
> ---
>  Documentation/admin-guide/quickly-build-trimmed-linux.rst       | 2 +-
>  .../admin-guide/verify-bugs-and-bisect-regressions.rst          | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

jon
