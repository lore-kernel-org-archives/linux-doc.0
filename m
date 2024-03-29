Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69AA1433A2
	for <linux-doc@vger.kernel.org>; Fri, 29 Mar 2024 14:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711724337; cv=none; b=qfSYRBRRdkT3fzZjIZg7XOCQNA6uyHMHYdrsWwOXJ4o3bbjo1nA0x88xPNDgupewvF9JyB3PO4RwHVWgntOCSnFXyYO5+2Blm4zkO5Y3GfmCoOz6MJqKIP9pClm1xeDG8DQif05DmA/6zHM1IwuUfZ5lPQdGR8+ctj73mBxMEmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711724337; c=relaxed/simple;
	bh=geovNEP5MoET5yINcoihxHzec9j09GdKEPkibD/seNU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=KrtcDKcNs3HUcZiKEp9BVXqiKP8echuC56P/NKRKeDedGS4+Od7U5FLfFy0a62JQmnodAtYy8ovJ3j79XXIn4itMpZTGMRa5N2BGFTFp2r/caUKT1+Bvq3KlY0oi/XTirm6mdOMPDyM2b2zUpbXUgKC2Db4t3UcFsfeKlEZr3+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=oGwej0xP; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="oGwej0xP"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 8B73847C2E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1711724335; bh=JtJWAtudri2o05DhCZSgWrRB7y0KMghC4ku01Lioz+o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=oGwej0xP0ZqDShdEoJX/CUI6oGEn1EQAJkfahOxSukv0o9GEHCcNr46OPKg8kpoV/
	 ACVTdyh9lGXzpB6ZSpfs5GnNZhEe3+eXqKpzvxcL45NCt34xNRgesermNXlY3M+1PH
	 XyHBCHp5ljP9b/NwG+9yuXIAcqbsoNKL5GVLv9w8uRFV1GgMORDOjs0ihm89Nyxc6e
	 wdskbP1ja+MArTH7+MkAPpGSg9lbcLSov74OvnsPMB4FlU95+dOGWnBNj722yAmwGT
	 d6PgTvtK06xXftQWpZ65rP8J01d5PkgexdxS9CIc1ygikZuVXcWlFdUdQeJM8AMoAx
	 bTC7P7b/sQttw==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::646])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 8B73847C2E;
	Fri, 29 Mar 2024 14:58:55 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Weiji Wang <nebclllo0444@gmail.com>, linux-doc@vger.kernel.org
Cc: Weiji Wang <nebclllo0444@gmail.com>
Subject: Re: [PATCH] docs: zswap: fix shell command format
In-Reply-To: <20240319114253.2647-1-nebclllo0444@gmail.com>
References: <20240319114253.2647-1-nebclllo0444@gmail.com>
Date: Fri, 29 Mar 2024 08:58:54 -0600
Message-ID: <8734s95bkh.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Weiji Wang <nebclllo0444@gmail.com> writes:

> Format the shell commands as code block to keep the documentation in the
> same style
> Fixes: 501a06fe8e4c ("zswap: memcontrol: implement zswap writeback disabling")
> Fixes: b5ba474f3f51 ("zswap: shrink zswap pool based on memory pressure")
> Signed-off-by: Weiji Wang <nebclllo0444@gmail.com>
> ---
>  Documentation/admin-guide/mm/zswap.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

jon
