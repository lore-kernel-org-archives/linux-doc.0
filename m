Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C331991A1;
	Thu,  9 Jan 2025 19:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736451462; cv=none; b=k3Di2S/nOzMGziuHgCzG9hW4qjK6Y0Wl3YR2hI9uB8kJ8eKKZKxJan4ZAiV/UmbHpgi7D6LBTx4e04PchnvcrBs+T4XQc3eVRL6Ff7vyMaT2M9a4RLdagr3VIDiH3LgQSHUzlBj7WWiDA2iU6ZjJwYZDhPL1G1qV3oCQXU/fIV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736451462; c=relaxed/simple;
	bh=8i/f8GuvMeLs4WMQUbcg8ipvBdf9ek5LEG92EUnbQVU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=NDkE21aDTve3/8rf0/ApuoT4VsOazt07My7EyyeZxrPVEmnCqkowMdVLSv7kEY22jXWBFTdh8pD4UzEhsm5OCgB1AqI66g4LLYGMnKFXni4n3Ww9BHzQ+qLw0G90wQLMK5kItjRYV79303GdL53kCjuZZiiWV2S4jp+uY2jXcq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=WdLwg8rY; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="WdLwg8rY"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 804CD404F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1736451460; bh=5lybfzGIttZyfFlI+1s+G5Tw9qLLc/8gfnajJYNNMiA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=WdLwg8rYLAsbqYFeN/ZoOicIsh9bN2lNQIVumd+ZrYE1hbYX4uXkRNZXGbwVrnzBy
	 P8lH/LrjeL3Lr1uii6T7092uhyOyy/yTIY7rWYwoqBzreoTPGyDBTo2B9V3BrkSD7v
	 sWhbqMRHs7/HBmFPjzfM5IWEqduHhd9VBYpZI1L9WESzdF8w6/5A7fHABIVA2ctVQV
	 csxMKiCxAH1adhE3Hcx7OFCKUMncJDwkBUDNMU98fCYIkmMD9kslQzs5cja4GMmVny
	 P2BMTGG/lyeTEMOXqDC6I8PcXJ2vXrNnJzTBCwa5Eg8j5xmHIp1e7DMLOPQ8m2j8ch
	 YyWPLziyPR9oA==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 804CD404F0;
	Thu,  9 Jan 2025 19:37:40 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Matthias Maennich
 <maennich@google.com>, Masahiro Yamada <masahiroy@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] doc: module: Two clearifications
In-Reply-To: <20241230142357.3203913-4-u.kleine-koenig@baylibre.com>
References: <20241230142357.3203913-4-u.kleine-koenig@baylibre.com>
Date: Thu, 09 Jan 2025 12:37:39 -0700
Message-ID: <874j27lqws.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com> writes:

> Hello,
>
> Changes since (implicit) v1, available at
> https://lore.kernel.org/linux-kernel/cover.1733305665.git.ukleinek@kernel=
.org:
>
>  - Use "string constant" instead of "C-string" in patch #1
>  - Drop #undef
>  - Mention that before all #include statements is a usual place for the
>    definition of DEFAULT_SYMBOL_NAMESPACE.
>
> Uwe Kleine-K=C3=B6nig (2):
>   doc: module: Fix documented type of namespace
>   doc: module: DEFAULT_SYMBOL_NAMESPACE must be defined before #includes
>
>  Documentation/core-api/symbol-namespaces.rst | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)

Applied, thanks.

jon
