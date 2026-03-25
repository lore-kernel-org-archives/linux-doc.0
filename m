Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED6A234964;
	Wed, 25 Mar 2026 19:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774467195; cv=none; b=rlBOuFee7GZFLAH85ncnwCL+wT600ZjKVOVcsnPgKK2o5NL2rl2SpBYfcOwg3fWubPDRxkef33n4b60UBDWWp6Jl/IecHAKBvmdQptWXHESrhc/atIC0G8Gu010qRnaQ2nlmsVr0Yfkpmuw/msZZK+J+ZMHgmA+hEUcn78TRtU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774467195; c=relaxed/simple;
	bh=sZggBEhesX3W/rJRhqRA3mSKFQktBAvrUIwXGli50Yw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=UOEqFhLgfcUp861ZgYtdnhrP3Przj/jSavHyUXLJ5C5Iw28o2lsYQ7PxToP/fuSxo1s63zC4mYgBuauVgMP5cCOFsghI4w3J8lKwoP0dOuLFmI7wxoeLKSGgVVKTRlA3pvLl7lEEeE42csyUVKjwYlZTtLOV3E/Cx/kOeisOi7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=ElXqQXbc; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="ElXqQXbc"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 3D9E840C6F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1774467194; bh=TheRULhZ85skRQP6hmmE0EveQG0qqiDhsUyL70rwqE0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ElXqQXbcPkGgm4+kQfwCTQBNcR2+g1axRxQwREpE087OhrfoYRK52r/mkvMzmWSfZ
	 RuX1Tq4kUuvBPEAReHNZlkZro8H6AFW95IeDsnUSuFXMss1H6ENv/fqxCHycRrCQtT
	 B06ZmhBnegorwJrO0q4Ut08FCf2bGjg66iT+HMY8NxK5wIe0X60CEn3DMp0MPpxIXK
	 KJN+bVWFKtObHvXikjOnW5oaFvXZAcEbqhP5DY7JKYdya1ilPGFLVh3AhNGlHsvuF2
	 +ud+3Rk4TwQupvKHv7jKWRU9EZazfKzQGXLMqGgAB3lUGyZQEtbduKlmtPvC2yYaJG
	 CclEws39o/4cA==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 3D9E840C6F;
	Wed, 25 Mar 2026 19:33:14 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Aleksandr
 Loktionov <aleksandr.loktionov@intel.com>, Randy Dunlap
 <rdunlap@infradead.org>, Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH 0/7] More kernel-doc unit tests
In-Reply-To: <cover.1773841456.git.mchehab+huawei@kernel.org>
References: <cover.1773841456.git.mchehab+huawei@kernel.org>
Date: Wed, 25 Mar 2026 13:33:13 -0600
Message-ID: <874im3g0w6.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> Hi Jon,
>
> This series comes after
>         https://lore.kernel.org/linux-doc/20260318104321.53065c27@foz.lan/T/#t
>
> and contains the remaining patches I have ready to be merged.
>
> Its focus is primarly on adding unit tests for some corner
> cases. Several of such tests came from Randy, and were already
> previously submitted on some old series.
>
> I added a couple of extra tests there to check if tables and code
> blocks will be properly producing rst and man content.
>
> Due to such test, I ended discovering one bug, fixed on the last
> patch on this series.
>
> On this series, the actual tests are not part of the unit test
> source code. Instead, they're loaded from an yaml file that
> uses a properly defined schema. One of the tests check if the
> file follows such schema.

I've applied these, thanks.

jon
