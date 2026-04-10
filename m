Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A97B30F523;
	Fri, 10 Apr 2026 13:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775829301; cv=none; b=ddx7R6nJKvuhEtNPbu/5o7TPk7v6LVmIJALP3JzlNv+yUNWaRhtMez5iwMW0xwvHsOBcYhv8jXooOi/OhNBrhkgCZt+Dy+C67T2iol60de2/nYpjNnrDsLrA4OYXaR3nr+ZK3HOuf2wd421cOFsAUhWmaKBf9v8/Z9siSvt0hhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775829301; c=relaxed/simple;
	bh=/KcUFC+9kmcrxGRnZ38+nfqPZxVNEqdRUt4ZBoqL5zU=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=NeYfIkEls2fy2g7zcIcdthkOAh3f2qtMF0S7lG+cj9Ygh1ICnGrT78cryrZuMCDq/CqZdhyGntuSthLK9CmxDIfIXGcPVLW9ymoDt8xbnmqYoKhNmRbddyeMXdKf6qKyTFN48n+SYjoA7Mkf5jYha2XAnGHaTLPqv7qJFVo4ORw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=j8baCkF6; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="j8baCkF6"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 7F3B841089
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1775829299; bh=g+JKpq+HjFtfSqnOjt05crpyIY3oU39en9i1q/9ApYY=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=j8baCkF64tGoDuedM4pHoQJ7CpIL1/1l3ns58fIzKJAzxVF2+S9oat1odKF9Xo4RI
	 VbNTkb7URzFprOqr5jpygyu1depIgq0FLx5COoQPl13t860/66ybFZ9nSJV15Km1YB
	 6tdDFBqQvp0zBjenHEaeY3sblfzLZe19nFqhBYqkfuaTvb1vWXQoejW466YLYm4aBc
	 R3okj9cn4gTgn0TUs5viDMBvj3nw2IW322+jVoRoDc1k965oi4CQdxX2dys4cSbkev
	 qDITexQchNa1WW6s2QBhHiNBmXyVsLopw8OP/si12TThpofhE1Rv0snjzT5ddjwOM0
	 kBNQwqFa3NP9w==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 7F3B841089;
	Fri, 10 Apr 2026 13:54:59 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Alex Shi <seakeel@gmail.com>, linux-doc@vger.kernel.org, open list
 <linux-kernel@vger.kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
 Dongliang Mu <dzm91@hust.edu.cn>
Subject: Re: [GIT PULL] Chinese-docs changes for v7.1
In-Reply-To: <b71a3647-b1b2-4c66-b357-38f10058123d@gmail.com>
References: <b71a3647-b1b2-4c66-b357-38f10058123d@gmail.com>
Date: Fri, 10 Apr 2026 07:54:58 -0600
Message-ID: <87cy063op9.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Alex Shi <seakeel@gmail.com> writes:

> The following changes since commit 1eab6493f525910aa7bc383a2a27b68916e3c616:
>
>    tracing: Documentation: Update histogram-design.rst for fn() handling 
> (2026-04-09 08:46:39 -0600)
>
> are available in the Git repository at:
>
>    git@gitolite.kernel.org:pub/scm/linux/kernel/git/alexs/linux.git 
> tags/Chinese-docs-7.1
>
> for you to fetch changes up to 78405e7f42fa9127325c65aec9289187f67ac5ce:
>
>    docs/zh_CN: update rust/index.rst translation (2026-04-10 20:09:45 +0800)
>
> ----------------------------------------------------------------
> Chinese translation docs for 7.1
>
> This is the Chinese translation subtree for 7.1. It includes
> the following changes:
>          - Add the rust docs translation
>          - Fix an inconsistent statement in dev-tools/testing-overview
>          - sync process/2.Process.rst with English version
>
> Above patches are tested by 'make htmldocs'
>
> Signed-off-by: Alex Shi <alexs@kernel.org>
>
> ----------------------------------------------------------------
> Ben Guo (4):
>        docs/zh_CN: update rust/arch-support.rst translation
>        docs/zh_CN: update rust/coding-guidelines.rst translation
>        docs/zh_CN: update rust/quick-start.rst translation
>        docs/zh_CN: update rust/index.rst translation
>
> LIU Haoyang (1):
>        docs/zh_CN: fix an inconsistent statement in 
> dev-tools/testing-overview
>
> Song Hongyi (1):
>        docs/zh_CN: sync process/2.Process.rst with English version
>
>   Documentation/translations/zh_CN/dev-tools/testing-overview.rst |   2 +-
>   Documentation/translations/zh_CN/process/2.Process.rst          |  56 
> ++++---
>   Documentation/translations/zh_CN/rust/arch-support.rst          |   9 +-
>   Documentation/translations/zh_CN/rust/coding-guidelines.rst     | 262 
> +++++++++++++++++++++++++++++++--
>   Documentation/translations/zh_CN/rust/index.rst                 |  17 ---
>   Documentation/translations/zh_CN/rust/quick-start.rst           | 190 
> ++++++++++++++++++------
>   6 files changed, 427 insertions(+), 109 deletions(-)

Pulled, thanks.

For future reference, this is a bit late; I would really rather get
these before -rc7 if at all possible.

jon
