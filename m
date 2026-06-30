Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2572E7404E;
	Tue, 30 Jun 2026 13:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782827618; cv=none; b=PdpATNWP6ntKGYBPFCkyQfsbdR90ENydj0Yf/JrWp6cplvvB4LG/VgfzdbqCgckqidDJTfAJ64qVss8kmcpmTTlYssjAn/hxC0KwHdEQxwd4fvtz2fX4HgFqLsDKQhhi5pRiVrUW/H3qGsKTTZVkuVNqUE2tdTG8FynTl11jzf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782827618; c=relaxed/simple;
	bh=2Iha2aPRzf/edKvSXYfibJG6j0QD17DVopPfoz2YfRw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RuUt/AiTtGcZy2nYJMnAQATQZr/BXYt7g274g1+pe1jkjrmIhFkftfkzRPcYCl3lFmAXLdk0y1UAWcFqmPe/QTMQhy3sdowXn4h+A4l24B7OnxGw5sJY9GFi1Pkf/fxSFMfh7I+E4HAp1LypAnzHcmrqAw/Yg0/nFLYcDJEvsXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OB3f2+qO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OB3f2+qO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E12051F000E9;
	Tue, 30 Jun 2026 13:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782827616;
	bh=L8auU58LgAXdY4hWCl6wHaE8gXHNNTt7g9BcuB3xl/A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OB3f2+qOmRlqlAGoNAuNbUTF/wGc94sX4j0dhQaK0hp4KClwPMcoDtyij1m4QI+uw
	 7UIMIErKIwNYqmN/5ZFXwBHFquX/hrqbfTO0wriPqz0XN3WMC9syVtKDWc5PD93URW
	 hON1xtFS5ALZ8eo0xAUfiEDad5rGxYTsiHIqfykre4fvR4ZN8N4m4u3hYvyAG1x/S2
	 ttGmquaYzMsPbQr5aIP7Xr/ab3feOSwb6L0EF9HWA+JpTQeMy3qjy4zFwuWG5Y4+yT
	 dt07mdNe0B/F8Ec6PqL/wvDdCLLqe+balCtUx+FBmjNUn4AAc6hH1Xdeqnv4YMyMC7
	 Uwlc2bAjlkqzg==
Date: Tue, 30 Jun 2026 14:53:31 +0100
From: Will Deacon <will@kernel.org>
To: Shanker Donthineni <sdonthineni@nvidia.com>
Cc: Vladimir Murzin <vladimir.murzin@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Vikram Sethi <vsethi@nvidia.com>,
	Jason Sequeira <jsequeira@nvidia.com>
Subject: Re: [PATCH v4 0/2] arm64: errata: NVIDIA Olympus device store/load
 ordering
Message-ID: <akPKWxYxDvLGVfQx@willie-the-truck>
References: <20260625182425.3194066-1-sdonthineni@nvidia.com>
 <381fb71c-0a2c-4dec-98a3-56ad88e190c6@arm.com>
 <ba15e106-9066-4e55-be2f-6767a32e123d@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ba15e106-9066-4e55-be2f-6767a32e123d@nvidia.com>

On Mon, Jun 29, 2026 at 06:08:37PM -0500, Shanker Donthineni wrote:
> On 6/29/2026 5:45 AM, Vladimir Murzin wrote:
> > That's interesting. With the way the patch set is structured, it
> > now looks like:
> > 
> > 1. Fix the erratum, but cause a performance regression.
> > 2. Restore the performance regression and (re)apply the erratum
> >     workaround.
> > 
> > Would it make sense to avoid introducing the performance
> > regression in the first place by structuring the patch set
> > slightly differently?
> > 
> > 1. (Re)introduce arm64 memset_io()/memcpy_toio().
> > 2. Fix the erratum once for all
> > 
> > What do you reckon?
> 
> Yes, that ordering makes sense.
> 
> I can restructure v5 so that patch 1 introduces the arm64 memset_{to}io()
> implementations while preserving the existing behavior. Patch 2 will
> then add the complete erratum workaround, including the conditional
> trailing DMB for those block-write helpers. This avoids introducing
> the intermediate performance regression and keeps each commit
> independently usable.
> 
> Will and Catalin, could you please share your thoughts on this approach?

tbh, I think I'm ok with the current ordering. The second patch is purely
a performance thing for affected CPUs, so doesn't strictly need to be
applied or backported for functional correctness afaict.

Will
