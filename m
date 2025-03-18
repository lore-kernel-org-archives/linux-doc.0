Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C328D20E70E
	for <linux-doc@vger.kernel.org>; Tue, 18 Mar 2025 14:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742309466; cv=none; b=oYNnj04XxdM8IhWwO72l2c00/AZYW5fDDPzIoPG27FCUUeAYrZoStVCs1CUQiIMv3pEG5ANOO6BRbM1qVDsGe+r2qOdrkyxeKmvfzyGUKV/kTRQ43vv9Yis6XP5eOgMwrwhBx18NbhOnVpYmKKT5wQiiA16BJT6U5m6yJENHWlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742309466; c=relaxed/simple;
	bh=Fu0geNXj+0C72bNSXugwSjZhSE+DkkaIidL1RcSmRgQ=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=t+xzug8fsteNOQPlfJ+yK5TS7FWwohkBCscvkQuZQo6/XZ5KOzmRAF6h3/jD1yfAGkx1riXYX/VGJ8KPxB8NUTCrEz+gXZjMfT3lEheWnnDi9aRiWRVOBx9PdfLL9NFSTef+bCwKDhb/1SElUpwGrxLQjgr5mtyM6m3P0Ulb3Uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=bzSbkBs6; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="bzSbkBs6"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net AB1D64107B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1742309463; bh=Yi5aSg6qxHZ1De6lGc93R7t/+S8I5tw3jep/jpYjT4U=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=bzSbkBs6XZO1H6lP7yxTvEuZIKEwyCGmnILvgj8GaY9lpCGQAxxxDLzOY9s3msT9e
	 ztf11lvNWerPYK7AN4KNooiUeXbnTQE5dTXzP2PDdIonoynpw/gUDiD/xF8nfbVv0O
	 dVFWyWm3V0SBQ+x4xizsrXYieYjHFyl2TeFOappOfXJ/o4mIRSzJ1WjM+jM/56E/lZ
	 yvk0Xle+AoC7buPVhu5iSlmhFX9rghOWH1uvlr5yBCYVb6x/v0nyb9iUhmSnplqyfx
	 42a+MwBF8YQ2qDnobE3QSgLs2xlQSKOPKrFPt/zUFZd5iXEe15Xu7S4cwKPHdFcGjx
	 9frTouG2OwW8w==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id AB1D64107B;
	Tue, 18 Mar 2025 14:51:03 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: alexs@kernel.org, linux-doc@vger.kernel.org
Subject: Re: [GIT PULL] Chinese-docs changes for v6.15-rc1
In-Reply-To: <20250318062957.2120-1-alexs@kernel.org>
References: <20250318062957.2120-1-alexs@kernel.org>
Date: Tue, 18 Mar 2025 08:51:02 -0600
Message-ID: <875xk6crzd.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

alexs@kernel.org writes:

> Jonathan, please merge the Chinese translation docs, thanks.
>
> The following changes since commit 5b8f85d081da449ab35e4bd009d7c00afaab2fab:
>
>   docs: driver-api: firmware: clarify userspace requirements (2025-03-17 17:04:32 -0600)
>
> are available in the Git repository at:
>
>   git@gitolite.kernel.org:pub/scm/linux/kernel/git/alexs/linux.git docs-next
>
> for you to fetch changes up to c6e686b992f4da3fb9e56f42eb5a1060facf9442:
>
>   docs/zh_CN: fix spelling mistake (2025-03-18 13:36:57 +0800)
>
> ----------------------------------------------------------------
> Alex Shi (1):
>       docs/Chinese: change the disclaimer words
>
> Peng Jiang (1):
>       docs/zh_CN: fix spelling mistake
>
> Yuxian Mao (1):
>       docs/zh_CN: Add snp-tdx-threat-model index Chinese translation
>
>  .../translations/zh_CN/disclaimer-zh_CN.rst        |   8 +-
>  Documentation/translations/zh_CN/mm/balance.rst    |   2 +-
>  .../translations/zh_CN/security/index.rst          |   2 +-
>  .../zh_CN/security/snp-tdx-threat-model.rst        | 209 +++++++++++++++++++++
>  4 files changed, 214 insertions(+), 7 deletions(-)
>  create mode 100644 Documentation/translations/zh_CN/security/snp-tdx-threat-model.rst

It's a bit close to the merge window for this.  I could consider that,
but I really need you to put a signed tag on there and have me pull
that.

Thanks,

jon
