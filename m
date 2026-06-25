Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DD42256D;
	Thu, 25 Jun 2026 01:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782350559; cv=none; b=UNmjevINv441aLjQZQsiQ2ZI5zOuXqxBi1ScN11aNdKyJGeKI90DQPpGWqeCErnsfI4rXc0MXKXGQDO8soDc8rz7Nzvr+K1HYviZ+WroU+wl+bzvfwdWpi6BWqbZTe3rp2J/LPTWG3ufgtTFBVT+SKXMkyVf0meN6RqTpvApAqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782350559; c=relaxed/simple;
	bh=CirTSesyNxvJSVDRIKz8YekKOs3a5iNJlNTtyR3N5YU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j77V48HQpNPxpM+kX5LDE/10DLtPuL9pydtMNJv1MJsK2rv4ExtFZnInu12d3tv71ugYZIKY7FWubvplIvNTBA4bZ+VmSqoYmDZHVZVZ3tX2I6YpRWbDM4dWqqo02gHeXl9cdEdGk667Hxjp2/enS47FVd9+QbIJhnqBhJ0RuzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=S1X4v/+f; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="S1X4v/+f"
Received: by linux.microsoft.com (Postfix, from userid 1152)
	id 6815420B7166; Wed, 24 Jun 2026 18:22:33 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 6815420B7166
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1782350553;
	bh=jYYnMUQS29C/XibFN0kgT1Bwe4Fc7UQjMHHtpQrnQPk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S1X4v/+fVYOGbTDyJ0YPMq+6sEY6vHTPj9JpmuoICtNDuPY/5ySdOdRyoJrL9mtv5
	 sjuOyynW9CZ+VueHzJXoJTIGw5oq4Uzy9rCgwkXNXhUmvR6kKihXmqJeU8aDWebncY
	 qy7WmJ9UDayIdl8MWEBgJSrCzi49OIft575EEmUs=
Date: Wed, 24 Jun 2026 18:22:33 -0700
From: Shyam Saini <shyamsaini@linux.microsoft.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-mm@kvack.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
	tgopinath@linux.microsoft.com, bboscaccy@linux.microsoft.com,
	kees@kernel.org, tony.luck@intel.com, gpiccoli@igalia.com,
	bp@alien8.de, rdunlap@infradead.org, peterz@infradead.org,
	feng.tang@linux.alibaba.com, dapeng1.mi@linux.intel.com,
	elver@google.com, enelsonmoore@gmail.com, kuba@kernel.org,
	lirongqing@baidu.com, ebiggers@kernel.org
Subject: Re: [RFC v2 PATCH] reserve_mem: add support for static memory
Message-ID: <ajyC2eX9MKSU84Z8@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
References: <20260619062331.348789-1-shyamsaini@linux.microsoft.com>
 <aje-nY6QbwZP9XLG@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aje-nY6QbwZP9XLG@kernel.org>

Hi Mike,

On 21 Jun 2026 13:36, Mike Rapoport wrote:
> On Thu, Jun 18, 2026 at 11:23:31PM -0700, Shyam Saini wrote:
> > reserve_mem relies on dynamic memory allocation, this limits the
> > usecase where memory is required to be preserved across the boots.
> > Eg: ramoops memory reservation on ACPI platforms
> >
> > So add support to pass a pre-determined static address and reserve
> > memory at a specified location. This enables use case like ramoops
> > on ACPI platforms to reliably access ramoops region with previous
> > boot logs.
> > 
> > Also skip the parsing of <align> when static address is passed.
> > 
> > Example syntax for static address
> >  reserve_mem=4M@0x1E0000000:oops
> 
> reserve_mem is best effort by design because such hacks as well as memmap=
> cannot guarantee this memory is actually free.
> 
> If you want to preserve ramoops reliably, use KHO with reserve_mem.
> The first kernel will allocate memory, this memory will be preserved by KHO
> and could be picked up by the second kernel.

ok, On ARM64 DTS systems, we can reserve ramoops memory in the device tree during
the warm reboot.
For an equivalent ARM64 ACPI platform, what is the recommended way to reserve
and preserve that memory across the boots? 

> > Signed-off-by: Shyam Saini <shyamsaini@linux.microsoft.com>
> > ---
> > v1: https://lore.kernel.org/lkml/0eaf3be2-5121-48b7-aeed-196405c0a480@infradead.org/
> > v2: Fix code logic and incorporate Randy's suggestion
> > ---
> >  .../admin-guide/kernel-parameters.txt         | 15 ++++++
> >  mm/memblock.c                                 | 47 +++++++++++++------
> >  2 files changed, 47 insertions(+), 15 deletions(-)
> 
> -- 
> Sincerely yours,
> Mike.

Thanks,
Shyam
