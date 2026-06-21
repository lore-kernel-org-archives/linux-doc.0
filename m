Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E2B974BE1;
	Sun, 21 Jun 2026 10:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782038185; cv=none; b=LJ+SI/rJaqyaL1Ngc4YUmJD3+1MPj0c3UI8adNoxtksHpdHquZAyiLqubBUfAnlG76Ag4xsgdeq1EM94x2QWbIcB6tMQ8ghiDfSFxPsOBN2aM2u0p9VZBNpWbONnFHl7eEEVcLYZOhKGV32T0QxwHOXid0EdI3cOBUYBaOe2ZmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782038185; c=relaxed/simple;
	bh=ucrVZaFHV9P8rrX121ECboKE36C33WJ/6ZialGNhCW8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L9SkZJJ7O57Q++NbAj1DGrUW9Jbs+MfM3umqv+aGAhvwtT8KSvf/wW9b3KBT7E4DtLOayUzL1YumpH7r0TyoExiAU/hMcr0HAH5AuEn9ErG9PscpZtCLdvHspuuQvRrztRv7pSC02OqRklpGFDF1ie2QOk0qypUch8AgGcrf4F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bVtQJTae; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bVtQJTae"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3726C1F000E9;
	Sun, 21 Jun 2026 10:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782038183;
	bh=u7n88puASKdRn7LSLUIyKwIUjfNUuhlCupcWE32IiKc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bVtQJTaeCkbJtYPLyIXvXF62RPr79fPksVMk14M0zYNX96o6mnHvZFPA0hibhxeHo
	 eEysclkiI4gdSzS6seo2lZ1GnN0cHxD0OLsUdJs+8fu5GWUOojKTc7iVwSQNWxCLkz
	 NeJujBZLVSZmSKqPiolja65PdQe2IWZ9KbYqagJW6TagyYy5DsGI/Dfcn4WqhlCDBK
	 NdACIAkSoyfexQTpPgAhSe9jb0ppgaxsnx0VTxOTB9EkT7naGOqv87ArIiEGUexrqE
	 J+MmMWHcvyWBIENEIWGKWU6/aNbV03JUxv6U5v3cXrfQpAfileqR5zL3eFY2k3lm9C
	 Ap825Q6Z+dW5w==
Date: Sun, 21 Jun 2026 13:36:13 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Shyam Saini <shyamsaini@linux.microsoft.com>
Cc: linux-mm@kvack.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
	tgopinath@linux.microsoft.com, bboscaccy@linux.microsoft.com,
	kees@kernel.org, tony.luck@intel.com, gpiccoli@igalia.com,
	bp@alien8.de, rdunlap@infradead.org, peterz@infradead.org,
	feng.tang@linux.alibaba.com, dapeng1.mi@linux.intel.com,
	elver@google.com, enelsonmoore@gmail.com, kuba@kernel.org,
	lirongqing@baidu.com, ebiggers@kernel.org
Subject: Re: [RFC v2 PATCH] reserve_mem: add support for static memory
Message-ID: <aje-nY6QbwZP9XLG@kernel.org>
References: <20260619062331.348789-1-shyamsaini@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260619062331.348789-1-shyamsaini@linux.microsoft.com>

On Thu, Jun 18, 2026 at 11:23:31PM -0700, Shyam Saini wrote:
> reserve_mem relies on dynamic memory allocation, this limits the
> usecase where memory is required to be preserved across the boots.
> Eg: ramoops memory reservation on ACPI platforms
>
> So add support to pass a pre-determined static address and reserve
> memory at a specified location. This enables use case like ramoops
> on ACPI platforms to reliably access ramoops region with previous
> boot logs.
> 
> Also skip the parsing of <align> when static address is passed.
> 
> Example syntax for static address
>  reserve_mem=4M@0x1E0000000:oops

reserve_mem is best effort by design because such hacks as well as memmap=
cannot guarantee this memory is actually free.

If you want to preserve ramoops reliably, use KHO with reserve_mem.
The first kernel will allocate memory, this memory will be preserved by KHO
and could be picked up by the second kernel.
 
> Signed-off-by: Shyam Saini <shyamsaini@linux.microsoft.com>
> ---
> v1: https://lore.kernel.org/lkml/0eaf3be2-5121-48b7-aeed-196405c0a480@infradead.org/
> v2: Fix code logic and incorporate Randy's suggestion
> ---
>  .../admin-guide/kernel-parameters.txt         | 15 ++++++
>  mm/memblock.c                                 | 47 +++++++++++++------
>  2 files changed, 47 insertions(+), 15 deletions(-)

-- 
Sincerely yours,
Mike.
