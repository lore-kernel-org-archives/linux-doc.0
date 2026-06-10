Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C272837A481;
	Wed, 10 Jun 2026 11:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781090920; cv=none; b=j0FBnfgEwXEvVK6saW5OFszTJtsq1bEZk7Oj307lsamAdw6J+BFejTSk1wKk9h7IZkZNn01j+uWgIwQFrkC4bnnyUqIcwwr3wr3tirgWizcm0pxRDN588wg7g4ncVxrSP2hYBpgtISRRsWcECoBajebRYQGCGwuklZplARy5qOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781090920; c=relaxed/simple;
	bh=sfVcg/dVJPtBBGLQOmu1fTf01VV2ub9fW2ujvrGFzhY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZHXUMHS8h7kUIYfwNmCe9SXIjJnqJnQjpCT8ORK0Jf9s96zo0jd5f02gbMqarOE+C+sGoRpxu3RU9VwwpTZMNYnSd9ddxc1K3QGXKpL8XtQT/DPPdqDvhLPBhXLr6YOpzeQVmfWU+0F45gpUUbOyejbrx0lpa/zViTzLO++HYTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X3qZkJvo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X3qZkJvo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57E441F00893;
	Wed, 10 Jun 2026 11:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781090919;
	bh=35brFKLgI4jP8jMGIASVe52ze60YIKvpJeWjQTiQRpk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=X3qZkJvoEvq9epIvVKXWq9CBcTuqjKAQjN2jjD1wzBWGG6vNi7YzvjNkyrwXonTtm
	 WMz0GYrzVCgfZlTG1kAIzCrfrnTYaUjT23pMm0R07qN6rWfS999GkUC4B4v7+o7E17
	 nepCYgGtE3X2ycKzFnoiTkTf00qXNUevr5onJTL+6WTrXujwJvV+SnpgieYTRtjYOp
	 7Nrqw2yM/8cDqgtxjQRpk7O/Lcrnf0aP/K8MkqTL6aYVuwii/qopMuzWl7H1+Xe3oG
	 8ycqTD2OoKZLYKb/tsmIOCrC5f6jtqpoli2nHwnvH4nI6TlMGr1Ke9ddyqHo3IxUbe
	 1lIQmXzIt4SVQ==
Date: Wed, 10 Jun 2026 12:28:33 +0100
From: Will Deacon <will@kernel.org>
To: Shanker Donthineni <sdonthineni@nvidia.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Vladimir Murzin <vladimir.murzin@arm.com>,
	Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Vikram Sethi <vsethi@nvidia.com>,
	Jason Sequeira <jsequeira@nvidia.com>, jgg@nvidia.com
Subject: Re: [PATCH v2] arm64: errata: Workaround NVIDIA Olympus device
 store/load ordering erratum
Message-ID: <ailKYTOX23EMnJsK@willie-the-truck>
References: <20260605144551.2004391-1-sdonthineni@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260605144551.2004391-1-sdonthineni@nvidia.com>

[+Jason G]

On Fri, Jun 05, 2026 at 09:45:51AM -0500, Shanker Donthineni wrote:
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
>   - Specific micro-architectural and timing conditions occur.
> 
> Two ways to restore ordering: insert a barrier (any DSB, or a DMB that
> orders loads) between the store and the load, or make the store a
> store-release. A load-acquire on the load side would not help, because
> acquire semantics do not prevent a load from being observed ahead of an
> older store; only the store side (release or a barrier) closes the
> window.

I think you can drop the paragraph above. A store-release isn't enough
to order against a later load in the architecture either, so we're
clearly in micro-architecture territory and I don't think you need to
describe mechanisms that don't work here.

> Promote the raw MMIO store helpers (__raw_writeb/w/l/q) from plain str*
> to stlr* (Store-Release), which removes the "store is not a
> store-release" condition for every device write the kernel issues.
> Because writel() and writel_relaxed() are both built on __raw_writel()
> in asm-generic/io.h, patching the raw variants covers both the
> non-relaxed and relaxed APIs without touching the higher layers. Note
> that writel()'s own barrier sits before the store, so it does not order
> the store against a subsequent readl(); the store-release promotion is
> what provides that ordering.

Sashiko points out that you're missing __const_memcpy_toio_aligned32().

> Like ARM64_ERRATUM_832075 on the load side, the change is gated on a new
> ARM64_WORKAROUND_DEVICE_STORE_RELEASE capability and only activated on
> parts that match MIDR_NVIDIA_OLYMPUS, so unaffected CPUs continue to use
> the plain str* sequence.
> 
> Note: stlr* only supports base-register addressing, so the raw accessors
> can no longer use the offset addressing introduced by commit d044d6ba6f02
> ("arm64: io: permit offset addressing"). The str* and stlr* alternates
> share a single inline-asm operand and the sequence is selected at boot,
> so the operand form is fixed at compile time; unaffected CPUs keep using
> str* but also revert to base-register addressing. This keeps the store
> side as simple as the existing load-side patching (load-acquire) and
> avoids adding complexity to the device write path; retaining offset
> addressing only for str* would otherwise require a runtime branch on
> every write.

I seem to remember Jason caring about that, possibly because some CPUs
are very picky about write-combining?

Will
