Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D05C19D07A;
	Fri, 26 Jun 2026 14:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782485681; cv=none; b=ch5q9PcHYDu2mao0IIF8+kEfrN4agXUsCpYA23WrrRvVQigrmdWiA0ylLEwIYuuUT47vmWO16WSi1W4Sa7mMMT3KkDhZK/TURW2PH7dxnEcgp//xD12sf97l6ejaWQd419Phqxg8VWRDoDxmMufOVYtn4QgN2dG43Qomn6V6WyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782485681; c=relaxed/simple;
	bh=1fa8ygWPhV8zw1M9tJ59S0pY96eZ6GIj5p0U1KeldIA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kJIOUrpCc426ehMsnOXnSKi17W/RGOjjh5eVdEf16LltFkuAmuG3bb/LluH77Yzv8VasljO8wQ6bO/U07g9xORFRdT1EtDl6UoLlFGygI8mNgeei9a0aa2bDawOT1OQ4gW6XMDyf8Ea8LKKSs67FoGxS3rVLHJ+LYV7mQoTuEpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=X4YVjO/v; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="X4YVjO/v"
Received: by linux.microsoft.com (Postfix, from userid 1152)
	id 6D95E20B7169; Fri, 26 Jun 2026 07:54:34 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 6D95E20B7169
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1782485674;
	bh=FTDVjpRWTB5xLz1rJhXl+zL1ZWA88STzpaSgnQuzgNQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X4YVjO/vL9TlHYJDpGFXqcbR/6jI85VyLql7+Y7KNo3wuPzKze1wVfItjL6ugt2ao
	 pRtIz4B/j0SCfl/IFlU18O2+U5ip5iqGWbNp2s4UOb4BDQ0+ex52Pb0uZQW7iDtOEy
	 LL5DyWYNLkeqztby2/J/kT+3I2LZIL5V+lDkfDBM=
Date: Fri, 26 Jun 2026 07:54:34 -0700
From: Shyam Saini <shyamsaini@linux.microsoft.com>
To: Mike Rapoport <rppt@kernel.org>
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
Message-ID: <aj6SqipC/dIN01iN@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
References: <20260619062331.348789-1-shyamsaini@linux.microsoft.com>
 <aje-nY6QbwZP9XLG@kernel.org>
 <ajyC2eX9MKSU84Z8@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
 <ajzovhWHcFQZ9d3l@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ajzovhWHcFQZ9d3l@kernel.org>

On 25 Jun 2026 11:37, Mike Rapoport wrote:
> Hi Shyam,
> 
> On Wed, Jun 24, 2026 at 06:22:33PM -0700, Shyam Saini wrote:
> > On 21 Jun 2026 13:36, Mike Rapoport wrote:
> > > On Thu, Jun 18, 2026 at 11:23:31PM -0700, Shyam Saini wrote:
> > > > reserve_mem relies on dynamic memory allocation, this limits the
> > > > usecase where memory is required to be preserved across the boots.
> > > > Eg: ramoops memory reservation on ACPI platforms
> > > >
> > > > So add support to pass a pre-determined static address and reserve
> > > > memory at a specified location. This enables use case like ramoops
> > > > on ACPI platforms to reliably access ramoops region with previous
> > > > boot logs.
> > > > 
> > > > Also skip the parsing of <align> when static address is passed.
> > > > 
> > > > Example syntax for static address
> > > >  reserve_mem=4M@0x1E0000000:oops
> > > 
> > > reserve_mem is best effort by design because such hacks as well as memmap=
> > > cannot guarantee this memory is actually free.
> > > 
> > > If you want to preserve ramoops reliably, use KHO with reserve_mem.
> > > The first kernel will allocate memory, this memory will be preserved by KHO
> > > and could be picked up by the second kernel.
> > 
> > ok, On ARM64 DTS systems, we can reserve ramoops memory in the device tree during
> > the warm reboot.
> 
> The cc list actually implied x86 ;-)
> Added arm64 folks now.

Thanks for adding ARM folks, I had just included whatever get_maintainer script
suggested, sorry. 
> > For an equivalent ARM64 ACPI platform, what is the recommended way to reserve
> > and preserve that memory across the boots? 
> 
> I don't think it exists, but a command line option (be it memmap= or
> reserve_mem=) does not seem the right way to me.
> 
> Most of the arguments that were made against adding memmap= to arm64 [1]
> apply here.
> 
> If kexec is an option, KHO provides a reliable way to preserve memory
> across boots.
> 
> If kexec is not an option, we should look for a generic way to specify
> something like DT's reserved_mem for ACPI/EFI systems.
> 
> [1] https://lkml.kernel.org/lkml/20201118063314.22940-1-song.bao.hua@hisilicon.com/T/
> 
Well, kexec is one of the option for my use case, it also requires
memory reservation during warm reboot, I think memory can be reserved in
the firmware but this will create a dependency on firmware for Linux
reservation.

It would be great to have a in kernel memory reservation mechanism for
ARM64 ACPI platforms. I believe some other use cases like PMEM
reservation would also benefit from this.

Thanks,
Shyam
