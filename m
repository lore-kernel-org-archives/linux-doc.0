Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCFA14279F8;
	Tue, 30 Jun 2026 14:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782829303; cv=none; b=Hi1OeqP8hsd29PrSUYCDRi/9G3kBYdK7B+VhK3r1YRKSOkn7hpOMN3eRe5zDocdHxruBzC9N0ZqGtk21rxG6Uk9N7R+DgURBM0rQvvKRritt9qHe+qcJJQhk8RivzvxGE9nBtO6layC3lZzdPBrbc3zXTHhcxufooNQw1PFavMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782829303; c=relaxed/simple;
	bh=bd1/0TdjL11u0DTphGjE55A2Nnaw1C6h18bwK1xcKo8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WiWHIdzNFbHfzNYUI9g6ilEpDY/dfa606Dn5E2/kkjuB9TOGXksDkVCxxjtGPcQojcCZ3IAebc4YrYG0+p+ZXB19tRtFQsLctZmvUxiJXB5Ib2wwTJ6yv+mSRzwRJrkxSo89z6Z+LSBrh9xlBFF608LyMtydUc8JTmh/Ni3pQjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VEafmnya; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VEafmnya"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D5C91F00A3D;
	Tue, 30 Jun 2026 14:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782829301;
	bh=BsBU320Hc5ufAPLrytCYeiRiiWiPejNIHIOiOIU1tRU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VEafmnya0emV59ZXlYQ85WdhCP1GHh6+WtrnnMLIqUC0AAuMSrJ+6QlCNRQJx4voz
	 PEP8bw2e/LNBYP56c50maL0qzY+YiwCzsF1t3LE7aSzx9HeWpL9tf92Dia8jq1lEqP
	 XKnQWU6pp+FVjXqeYBmhsjxlmLIDtvN31yG0y1+siEsjjfURunI+dHJeyekGVXkcdK
	 Vt74TfXgFSgPH80BMG2dGtam5XLTZGbIts9fiiab0UoaebguZtDRTwKjpx3g/Z5P9E
	 UqVETkJ5cVPusKTru3En4RzcTp64gLQGQudGO8RpLM5CPTZ19gfS3tKWehKT/lNJut
	 9xgYDk7CAe3mw==
Date: Tue, 30 Jun 2026 15:21:36 +0100
From: Will Deacon <will@kernel.org>
To: Shanker Donthineni <sdonthineni@nvidia.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Vladimir Murzin <vladimir.murzin@arm.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Vikram Sethi <vsethi@nvidia.com>,
	Jason Sequeira <jsequeira@nvidia.com>
Subject: Re: [PATCH v4 1/2] arm64: errata: Workaround NVIDIA Olympus device
 store/load ordering
Message-ID: <akPQ8F3OgER621UP@willie-the-truck>
References: <20260625182425.3194066-1-sdonthineni@nvidia.com>
 <20260625182425.3194066-2-sdonthineni@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260625182425.3194066-2-sdonthineni@nvidia.com>

On Thu, Jun 25, 2026 at 01:24:24PM -0500, Shanker Donthineni wrote:
> On systems with NVIDIA Olympus cores, a Device-nGnR* load can be
> observed by a peripheral before an older, non-overlapping Device-nGnR*
> store to the same peripheral. This breaks the program-order guarantee
> that software expects for Device-nGnR* accesses and can leave a
> peripheral in an incorrect state, as a load is observed before an
> earlier store takes effect.
> 
> The erratum can occur only when all of the following apply:
> 
>   - A PE executes a Device-nGnR* store followed by a younger
>     Device-nGnR* load.
>   - The store is not a store-release.
>   - The accesses target the same peripheral and do not overlap in bytes.
>   - There is at most one intervening Device-nGnR* store in program
>     order, and there are no intervening Device-nGnR* loads.
>   - There is no DSB, and no DMB that orders loads, between the store and
>     the load.

Does that mean that a DMB LD between the store and the load would
solve the problem?

It would be interesting to see how your benchmarks motivating patch 2
look if you leave __raw_writeX as-is and instead add a barrier in
__raw_readX before the load instruction.

Will
