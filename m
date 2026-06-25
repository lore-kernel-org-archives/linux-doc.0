Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0281F3812D2;
	Thu, 25 Jun 2026 08:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782376651; cv=none; b=WRN+TbxwHWVS7NeTiU3/Jfc1Z/pzW2Xv+7yIjb2zblzXdxn/RwQHqPbKL04QLJOKNSA0X2xglx5QnnUd4iAssppPc13LIneBdGxDIe2VAxZ9z8Jul8z4yB5HbM7EPYoNehiE2V2lHEAtZACcOzG6AMwy8Pz4IkEHMVc4cL7yXQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782376651; c=relaxed/simple;
	bh=CRKJgnURRmZG13pBfVf5Z1+tKvCPrR2kFBWC1BQDBt0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GRPLaFCreoLqz0k2wlLEER0uKAIc+YLQ5o3g0GAMR6MS+vN2nrH/x0ow+onHnxVBNyiUFhg+PntNejQcINZMWc+Vsc9eOepqq2c6/UHGnEC2ZoWdVltim6ibBKZODnyB4U7wDMejVuZkRTbU2gIXaaUrwLYFoKaZSScsVg/V9qE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FGlFrAQy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FGlFrAQy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 930531F000E9;
	Thu, 25 Jun 2026 08:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782376649;
	bh=DTHenELavdixkpehBZtgo0+fqBfXPK/qvE1tJsk4MnM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FGlFrAQy6E1uz0C3XgqICgDtpY4DNdRjgthseoT8MOaduXl+SL2fHnjmBcTYDYVoi
	 aahon87kV8Efqxe2wgajqSOfG+M8UjxNNxFsy+F5zI+k++5To0Lok2H3O3Rv1rReCc
	 4GdaD1AQG03Ev/h+Ut1+huKOcnbWktK3QkMVU8PbwQ/NT4ysLrtbHE2zVbir4hs4P/
	 NrVHnpV8HVagJwIgz0sIcJXup1HvAIrniYojkT3EXswnjYmA8WlxJbIWl1GTzV1Wo9
	 uiKQORFPHRADJs5La5tVBgIZquUTMYRVkk8GBfS+6AZVOCWadOU7XYgpssTnjgx/Gv
	 Xi0QONQ3Fwmug==
Date: Thu, 25 Jun 2026 11:37:18 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Shyam Saini <shyamsaini@linux.microsoft.com>
Cc: linux-mm@kvack.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
	tgopinath@linux.microsoft.com, bboscaccy@linux.microsoft.com,
	kees@kernel.org, tony.luck@intel.com, gpiccoli@igalia.com,
	bp@alien8.de, rdunlap@infradead.org, peterz@infradead.org,
	feng.tang@linux.alibaba.com, dapeng1.mi@linux.intel.com,
	elver@google.com, enelsonmoore@gmail.com, kuba@kernel.org,
	lirongqing@baidu.com, ebiggers@kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC v2 PATCH] reserve_mem: add support for static memory
Message-ID: <ajzovhWHcFQZ9d3l@kernel.org>
References: <20260619062331.348789-1-shyamsaini@linux.microsoft.com>
 <aje-nY6QbwZP9XLG@kernel.org>
 <ajyC2eX9MKSU84Z8@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ajyC2eX9MKSU84Z8@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>

Hi Shyam,

On Wed, Jun 24, 2026 at 06:22:33PM -0700, Shyam Saini wrote:
> On 21 Jun 2026 13:36, Mike Rapoport wrote:
> > On Thu, Jun 18, 2026 at 11:23:31PM -0700, Shyam Saini wrote:
> > > reserve_mem relies on dynamic memory allocation, this limits the
> > > usecase where memory is required to be preserved across the boots.
> > > Eg: ramoops memory reservation on ACPI platforms
> > >
> > > So add support to pass a pre-determined static address and reserve
> > > memory at a specified location. This enables use case like ramoops
> > > on ACPI platforms to reliably access ramoops region with previous
> > > boot logs.
> > > 
> > > Also skip the parsing of <align> when static address is passed.
> > > 
> > > Example syntax for static address
> > >  reserve_mem=4M@0x1E0000000:oops
> > 
> > reserve_mem is best effort by design because such hacks as well as memmap=
> > cannot guarantee this memory is actually free.
> > 
> > If you want to preserve ramoops reliably, use KHO with reserve_mem.
> > The first kernel will allocate memory, this memory will be preserved by KHO
> > and could be picked up by the second kernel.
> 
> ok, On ARM64 DTS systems, we can reserve ramoops memory in the device tree during
> the warm reboot.

The cc list actually implied x86 ;-)
Added arm64 folks now.

> For an equivalent ARM64 ACPI platform, what is the recommended way to reserve
> and preserve that memory across the boots? 

I don't think it exists, but a command line option (be it memmap= or
reserve_mem=) does not seem the right way to me.

Most of the arguments that were made against adding memmap= to arm64 [1]
apply here.

If kexec is an option, KHO provides a reliable way to preserve memory
across boots.

If kexec is not an option, we should look for a generic way to specify
something like DT's reserved_mem for ACPI/EFI systems.

[1] https://lkml.kernel.org/lkml/20201118063314.22940-1-song.bao.hua@hisilicon.com/T/

> Thanks,
> Shyam

-- 
Sincerely yours,
Mike.
