Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE5B616EB40
	for <linux-doc@vger.kernel.org>; Wed, 26 Jun 2024 22:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719440916; cv=none; b=FLUZTvLGgUcfjXnUwB2FZji1Jratw9AaSi3MEV5tsyJ9bvxdolTCdydPjPQjjokGVfcwxMPI+zJq9hnBg8xmlalG0EnGg9Ugp/SuqioWF3c41TLJQVwiVig0up/abmDKuWZcGrpsmi2q/13SgxqknsU/r9WyFyajT5MSW79LqgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719440916; c=relaxed/simple;
	bh=90guEmUcLyVdy7E62AnRPlTpT3UMlLUbHnnpss/3X+c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=PKh4U52mWhs5CZCHTqYyrF96rzB+wAXsmbc87ocD8G7KutHU2Ck/8LXPmCH7rYextS6dTcYQMG/icRg3zUbeu/1MT0I70DIWuvfC038X91gEA92+w12MGr6rcjn0/pWA5bNKHxaUEoJ8moLk6Q9gxVODYQe06U8y5LAUe6B3OEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Sugb6REO; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Sugb6REO"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net E8ACD45E2B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1719440912; bh=UUr+GNytfdn1B9t6Uh2J0ZVbAxHsdikWKuwQR+sWw1s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Sugb6REO4L4ni+iSzIN26NzSirFLOeeQ3qImOng3d0olSCtI5NQ3SI1337FpPvDyr
	 9yEkCcpuj3qZn5Yie9KWsz0C5dOOR56kZZd6L9DdqhL+N4hNwsSnirnGIohm+SCl2T
	 /AfHREk7GaGUuWSf3OIXTefUZkxiZwsYhtT5q6UUwBVAuVvYMbUnOjBKBcfNcTGNfm
	 ULxUyV6MhlCTj/50nPVAJ3hqRNp380Uy7+uYs4HDr7uhnXkQ5nHAtw8ZsXpqZKTVPO
	 0+WbNyjiJ8pxUWpIKemtNwHOkSR4RgHKLwMfCS6Kd0DT8XxYBoCL/tFNL/TmGGd/fs
	 tiqaNaYlMVrwA==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id E8ACD45E2B;
	Wed, 26 Jun 2024 22:28:31 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Yanteng Si <siyanteng@loongson.cn>, alexs@kernel.org
Cc: dzm91@hust.edu.cn, linux-doc@vger.kernel.org, Yanteng Si
 <siyanteng@loongson.cn>
Subject: Re: [PATCH v3] docs/zh_CN: Add driver-api phy translation
In-Reply-To: <20240625130909.3672446-1-siyanteng@loongson.cn>
References: <20240625130909.3672446-1-siyanteng@loongson.cn>
Date: Wed, 26 Jun 2024 16:28:30 -0600
Message-ID: <87cyo3z6cx.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Yanteng Si <siyanteng@loongson.cn> writes:

> Translate driver-api/phy.rst into Chinese.
>
> commit d02aa181ee59 ("phy: Add devm_of_phy_optional_get() helper")
>
> Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
> v3:
> Modified some sentences in accordance with Dongliang's comments.
> Pick Dongliang's Reviewed-by tag.
>
> v2:
> Modified some sentences in accordance with Dongliang's comments.
>
>  .../translations/zh_CN/driver-api/index.rst   |   2 +-
>  .../zh_CN/driver-api/phy/index.rst            |  20 ++
>  .../translations/zh_CN/driver-api/phy/phy.rst | 212 ++++++++++++++++++
>  3 files changed, 233 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/driver-api/phy/index.rst
>  create mode 100644 Documentation/translations/zh_CN/driver-api/phy/phy.rst

Applied, thanks.

jon
