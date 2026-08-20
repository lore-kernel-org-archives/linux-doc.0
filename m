Received: from mta1.migadu.com (out-106.mta1.migadu.com [95.215.58.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593D0385D96
	for <linux-doc@vger.kernel.org>; Thu, 20 Aug 2026 04:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787201046; cv=none; b=B97fid661ywhVm657TZ0ZD2H/68ryz3yVZYvP/7RvhrNLRBp+Y8r8Ap/aRjlbGc3ZgFM+PrLEO94QcqPF/gXZ+0gsn57diFKcZ0ub2AC9R4rYVsP9QCMBdj0EeYYlEnNoojhezJorLA1oO8E26rErbPW/p60tpSc/hpvuCXxRKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787201046; c=relaxed/simple;
	bh=dcrQmnFzca1cnV5S3GygLHCt7jlvEv+STK+ALb/4KU0=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=bY5Q3uIecj9RD+nrkjyIFqHVVBKslN9xevHfuVgsbeQakap5Y/q9zZLttQ5Kw2z0mFFUea1AfJULMCpek2oesF06EXBakwIqTKVE3bnNcItiyfguEz7ps81evfBRLoTt8/2ZE0Pn1ul6Bs3oat1NFJiN/aZAkiXejZugk5TyrQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=lf5qIeBD; arc=none smtp.client-ip=95.215.58.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="lf5qIeBD"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=dcrQmnFzca1cnV5S3GygLHCt7jlvEv+STK+ALb/4KU0=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787201041; v=1; x=1787805841;
 b=lf5qIeBD08AQpDv3MHNK8hlrbhbcecrDtL4KK2n2J/UAmp0WRKIrjDj1pLT09SUGtetV1mkH
 7LG1LnRehkidqkBic+hN3TOvl4Gr3tY0MGilyN7fnMyTDNGVZ91gSKJCIXuwIfMuZdC/OTqKZ8X
 hAzADJLnzjLWKCtKC7gJaUNW1Em51lNOkQx7mavaYxYpHz1bPJFGYScTARbp4e8yBgeMn15eHLD
 7rzOyZgZuNYIVrMZMFYrgIU6YisOqdKosgAuccpW9CpDkLZNFJMxE97oICtJ5/GC9pQM0S8BQnS
 ZunPo6oqXaW9ijFMzrO6SMb/GP48XBDkx1fC4K/tMoiKw==
X-Envelope-To: linux-doc@vger.kernel.org
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa (117.176.242.187)
	by smtp.migadu.com with ESMTPS id b7165f5237e3f84f;
	Thu, 20 Aug 2026 04:44:00 +0000
X-Mizu-Trace-ID: b7165f5237e3f84f
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/7] docs/zh_TW: remove duplicated maintainer contact
 information
From: Weijie Yuan <wy@wyuan.org>
To: Chen-Yu Yeh <chenyou910331@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>, 
 Dongliang Mu <dzm91@hust.edu.cn>, Weijie Yuan <wy@wyuan.org>, 
 Yanteng Si <si.yanteng@linux.dev>, Hu Haowen <srcres258@furdevs.cn>, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260819145808.291567-1-chenyou910331@gmail.com>
References: <20260819145808.291567-1-chenyou910331@gmail.com>
Date: Thu, 20 Aug 2026 12:43:39 +0800
Message-Id: <178720101976.15514.2188001271058942676.b4-review@b4>
X-Mailer: b4 0.17-dev

> MAINTAINERS already records who to contact about the zh_TW
> translations, yet every zh_TW file repeats that information in a
> per-file contact block.  The duplication has a concrete cost: the
> listed zh_TW maintainer address appears in 58 files and there have now
> been three separate attempts to rewrite it across the tree.  In the
> MAINTAINERS discussion Jon Corbet's conclusion was that, rather than
> churning all of those addresses once more, the best thing is simply to
> remove them.

I hope we didn't get Jon's idea wrong.

> There is a second reason.  The zh_TW tree was produced by converting
> zh_CN, and the credit blocks came across with the text: nearly every
> address removed here also appears in
> Documentation/translations/zh_CN/, several in more than a hundred
> files.  They credit the simplified-Chinese translation rather than
> zh_TW work, so keeping them would leave the wrong attribution in place.

By the way, this is something that occurred to me as well: for articles
that were converted directly from Simplified Chinese, do we really have
grounds to say that the original authors should be responsible for the
Traditional Chinese versions? I tend to think not.

Of course, one could argue that some translation issues are not specific
to either Simplified or Traditional Chinese, but are issues with the
Chinese text more generally. Even so, I do not think the original
authors have a moral obligation to take responsibility for the converted
Traditional Chinese text. Perhaps it would have been better to say
something like, “The author of the Simplified Chinese original is xxx,”
but there is little point in discussing that now.

Putting those contributors in the "blame" line because of such converted
texts therefore seems somewhat unfair to me. So for articles converted
from Simplified Chinese, I agree with removing those statements.

> Chen-Yu Yeh (7):
>   docs/zh_TW: process: remove maintainer contact information
>   docs/zh_TW: admin-guide: remove maintainer contact information
>   docs/zh_TW: arch: remove maintainer contact information
>   docs/zh_TW: dev-tools: remove maintainer contact information
>   docs/zh_TW: filesystems: remove maintainer contact information
>   docs/zh_TW: cpu-freq: remove maintainer contact information
>   docs/zh_TW: remove the last maintainer contact references

Has anyone objected to multiple commits in this series sharing almost
the same commit message?  Just a thought.

> This series conflicts with the pending zh_TW process/ series [1], which
> adds a translator entry to the same blocks in fifteen of these files.
> Please apply that one first; I will respin this on top if it lands in a
> different shape.
>
> [1] https://lore.kernel.org/linux-doc/20260806181949.65648-1-chenyou910331@gmail.com/

b4 automatically find a clean base for me: linus/master.

Thanks.

-- 
Weijie Yuan

