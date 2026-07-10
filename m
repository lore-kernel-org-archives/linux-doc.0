Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A7638331E;
	Fri, 10 Jul 2026 19:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783710853; cv=none; b=BUXu1Kurm5YhzY+c6T13N4zbfOOmR/gR0OtIsbkb5s2HxxMFUp+Rw2lMLKBDoGbuTK/yZ56SsQg98R/+UhL35i6/4YiXY4mVXLkw3X9LAMZ7YxQgS9cOpSxhTNoIRjZuaC4FHalkP2eKAuibpSCxvPrU/JKODFMS6HLerFiN4CQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783710853; c=relaxed/simple;
	bh=hxyg1UZHQwrBFDs2QDZYu2ii8hLK8P07Yggh6TSi+HY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=t52a/1ox6RoQ2sslm3Peop2gVveZvSF+hVJ2csoPkG4pT4tf13+OgCZnhLQ3zdd0IiNNxqcDTgnrQC/UcGNrdsBzNyDSBXEt4UJDCaI3cFk5QJBCchwhPhRUkFONf5msAoe1QW961h2Xuvpk62Qe0CrWUdQbh3ZkCvUq9X+0IaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Y3XyEayo; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Y3XyEayo"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 4870B4108A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1783710850; bh=Uvq6WY551EuInnqoLSIBvr4SYnHqBkIQPKrMMjqVKU4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Y3XyEayot5yy3sDwUYSEkF+/DbconfyZLi4Qm+yTKBE7hCjgrRlGcdHlNxRKVG2Hb
	 gq+F2poZOl/vKLxTfo7K5/Rx7WTDaBKiXbystuVnkOc5tCOYyOhBzdhJr4B9ZIwgKA
	 6p0mVdTbhWs0GTzq9glxHgrf3GL7ZWpsuNG7s9rKKDy6C6DKgR8dirsrM/TYVkdzul
	 4ZFWqPxgPrvy/kClsp1kcTSBRKjzh3cBZXEUBMnLviKnjRTA1bDRRVSuH3eKlVnCmE
	 JtBz3axgoY2ZULBPgFYRHlz7OI+Mq1f71noN+chg61c3D6X4xVl6y7PoyA9jgKX2Yt
	 1fYLWRxdfRo/w==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 4870B4108A;
	Fri, 10 Jul 2026 19:14:10 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: luoliang@kylinos.cn
Cc: Shuah Khan <skhan@linuxfoundation.org>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Liang Luo
 <luoliang@kylinos.cn>
Subject: Re: [PATCH] sched/doc: Fix stale em_pd_energy() reference in
 sched-energy
In-Reply-To: <20260707085335.2942128-1-luoliang@kylinos.cn>
References: <20260707085335.2942128-1-luoliang@kylinos.cn>
Date: Fri, 10 Jul 2026 13:14:09 -0600
Message-ID: <87ldbilkse.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

luoliang@kylinos.cn writes:

> From: Liang Luo <luoliang@kylinos.cn>
>
> The scheduler energy-aware placement documentation refers to the
> em_pd_energy() API, which was renamed to em_cpu_energy() in commit
> f0b5694791ce ("PM / EM: change name of em_pd_energy to em_cpu_energy").
> Update the reference to the current name.
>
> em_cpu_energy() is the EM helper that compute_energy() in
> kernel/sched/fair.c calls to estimate a performance domain's energy
> consumption (defined in include/linux/energy_model.h).
>
> Sync the zh_CN translation, which carries the same stale name.
>
> Signed-off-by: Liang Luo <luoliang@kylinos.cn>
> ---
>  Documentation/scheduler/sched-energy.rst                    | 2 +-
>  Documentation/translations/zh_CN/scheduler/sched-energy.rst | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

jon
