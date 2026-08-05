Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ECA14A0C;
	Wed,  5 Aug 2026 18:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785955903; cv=none; b=uVb519qrJkkX7F7CIwpqHsk436GdBoCybgd3B31+7bGAhegsWQeyM3kgR9hMtiM8u/d0enzgxGAKo5Vse3g59A2emuUYHSb7BnT2zVjjLL8a0V6TKJ0SRiG6en+u44RWsFtrUoOajWYdvJ5Smqsi2PCykHdTDAJ4ixe/NmRVN3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785955903; c=relaxed/simple;
	bh=aEu6jzaDVTBU3DZrB6zP+mK5APdVkRcckexoYxX40Pc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Kyu4HuX/+XWgdoTor+X6Y7d9pYZIuNnObdnwp0SedlPDC1h1l+l0aUZCaJ9L141t+dduOM75BaEsM+tEHsfCnXQneoWv3c+4YfanPC10J6hIvMQr+hGCKLGwKvXUPDDJmet5w2E520dTLpyTgGaxvSdu0YXtBz/f5YH4gDmbB58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=GHNUArky; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="GHNUArky"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 47694408B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1785955900; bh=RcFD3F6CArOFfG5aXXSIk4nLmfaKTZ7aRSOErPY8V6w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=GHNUArkyuIF849MJ26pSh0RJG1CvePh6wJERtaj+eqX1meZxr3RS04FB/AeotqEav
	 dxbRerhXKCTngW3KAk5z/dhSgrvGpaBodTExFFFreQ4kl3DBhTd8GhAxcyl4R/vI8K
	 /8FD9WdAKIJ1EEuKtn0Ej3fRipGHkVt5jVypnXgMlx/P6QD+bzKtP9OeBF7Xm/O+Le
	 SUkljALf02eUxeTEN1zPg7ymE2LQPpAtJw1wpavbCLFiWWIQ5GDRvm6HP0/hlqtAHz
	 Tz5U7Qq1frtpGDZ/GdY3ENUfxKWNw5nk5hgeLq63y+zWeS3m2CMbqcJuhX2Ocmho58
	 aj/cyxq3609rg==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 47694408B2;
	Wed,  5 Aug 2026 18:51:40 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Chen-Yu Yeh <chenyou910331@gmail.com>
Cc: Alex Shi <alexs@kernel.org>, Weijie Yuan <wy@wyuan.org>, Dongliang Mu
 <dzm91@hust.edu.cn>, Yanteng Si <si.yanteng@linux.dev>, Hu Haowen
 <2023002089@link.tyut.edu.cn>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: Re: [PATCH v2] MAINTAINERS: update Traditional Chinese
 documentation maintainers
In-Reply-To: <20260804201012.110713-1-chenyou910331@gmail.com>
References: <20260804201012.110713-1-chenyou910331@gmail.com>
Date: Wed, 05 Aug 2026 12:51:39 -0600
Message-ID: <8733wspfic.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Chen-Yu Yeh <chenyou910331@gmail.com> writes:

> The zh_TW translation has been unmaintained for about two years: the
> listed maintainer has been unreachable, and because no active
> maintainer was listed, get_maintainer.pl did not point contributors at
> anyone who could actually pick up a patch. My own zh_TW patch sat on
> the list for five weeks for exactly that reason.
>
> Following the discussion in [1] and the plan in [2], list the people
> who have stepped up to carry zh_TW forward, with a shift in focus
> towards Taiwanese Mandarin terminology rather than a plain
> simplified-to-traditional conversion.
>
> Move Hu Haowen to CREDITS and drop his personal repository links,
> which are no longer reachable. The current translation is built on his
> work, but MAINTAINERS is a list of who to contact, and the listed
> address has not answered zh_TW mail for about two years, which is what
> made zh_TW hard to contribute to in the first place.
>
> zh_TW stays a separate entry and is maintained separately from zh_CN;
> the two may share a tree for pull requests, but the review and
> terminology work is independent.
>
> [1] https://lore.kernel.org/linux-doc/<20260603082531.263115-1-chenyou910331@gmail.com>/
> [2] https://lore.kernel.org/linux-doc/<amcZ5SI3-Hzw4HkJ@wyuan.org>/
>
> Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
> ---
> Changes in v2:
>  - Drop Hu Haowen's M: entry (Jonathan Corbet); a CREDITS patch will
>    follow separately.
>  - Move the division of responsibilities below --- as suggested by
>    Weijie: it will drift over time, and a commit message is the one
>    place it cannot be updated.
>  - Collected Weijie's Acked-by.
>
> Current split of work, for the record rather than for the git history:
>
>   Chen-Yu Yeh   - translation and zh_TW terminology decisions
>   Weijie Yuan   - miscellaneous matters, list monitoring, status reports
>   Dongliang Mu  - review
>
> The address in the CREDITS entry is the one Hu Haowen asked to be
> listed under in [3].
>
> [3] https://lore.kernel.org/linux-doc/20260220160201.41149-1-srcres258@furdevs.cn/
>
>  CREDITS     | 4 ++++
>  MAINTAINERS | 6 +++---
>  2 files changed, 7 insertions(+), 3 deletions(-)

Applied, thanks.

jon
