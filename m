Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D1E11A683B;
	Thu,  9 Jul 2026 00:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783557465; cv=none; b=uU8Ctfws2b04G6Mh7auSRGIzNEsk6t2P2+ak3tbXNjtJRkHXN+kDuhzwouD/c2EotypNZmsdRsSNKrKOrRDAtCRkPd0piLLK4psmFo/2pGmMyfS11usWQ/pqRc0xM7BPfJ+JR0Bk8cIqHTtbLWxqNnR0uapPMxAmKLkmi1E+tno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783557465; c=relaxed/simple;
	bh=IseP9NMOHRSAqRYkYSRj1dDQVlgZOKtnrBgs5FYhcuM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fqWx1Vq9DR2B889WIqMzEPcOWnn9cmedlKfkf3xu7+cD6neOcy4yidYqD2A+g1CtNStEsnXO4KN6kCdeuyZYYQSowtLXzC7kJg0G0gHjWKehNwmMrpc0SwGbbTIn69eGBnyPtf3I0cZ/K0lxKZ7B0JOgf3lRYmfTnvGKyKXrPNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=sUET2RvG; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="sUET2RvG"
Received: by linux.microsoft.com (Postfix, from userid 1152)
	id 1D69320B716B; Wed,  8 Jul 2026 17:37:33 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 1D69320B716B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1783557453;
	bh=JrOx+/apw76P7y8j1/mgdZ4vaD1KHTVdG+YsGK+HOmA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sUET2RvGdkncNw69to87iw7S3f/NPkqwYmu6fiqYF5YEXLN//hZreIZ84xWdlX6Rc
	 vJ5eJ99cti9MekYuKW5lwMpnHKhL2V1Pq53AFnQo6/zwZu1PQaW0+hpaPMSEvB8a+0
	 rkFCuZzaFnQZwShNW3NfCM1d6kABiFMwvl8F19/Q=
Date: Wed, 8 Jul 2026 17:37:33 -0700
From: Shyam Saini <shyamsaini@linux.microsoft.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Mike Rapoport <rppt@kernel.org>, ardb@kernel.org, david@kernel.org,
	will@kernel.org, linux-arm-kernel@lists.infradead.org,
	akpm@linux-foundation.org, bboscaccy@linux.microsoft.com,
	bp@alien8.de, dapeng1.mi@linux.intel.com, ebiggers@kernel.org,
	elver@google.com, enelsonmoore@gmail.com,
	feng.tang@linux.alibaba.com, gpiccoli@igalia.com, kees@kernel.org,
	kuba@kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	lirongqing@baidu.com, peterz@infradead.org, rdunlap@infradead.org,
	tgopinath@linux.microsoft.com, tony.luck@intel.com,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@kernel.org>
Subject: Re: [RFC v2 PATCH] reserve_mem: add support for static memory
Message-ID: <ak7tTVs6tWZPOln0@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
References: <20260630170911.43521-1-shyamsaini@linux.microsoft.com>
 <ak4fu1qINGyAQUEl@arm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ak4fu1qINGyAQUEl@arm.com>

Hi Catalin,

On 08 Jul 2026 11:00, Catalin Marinas wrote:
> Hi Shyam,
> 
> Adding Lorenzo, Hanjun, Sudeep.
> 
> On Tue, Jun 30, 2026 at 10:09:11AM -0700, Shyam Saini wrote:
> > Following up on this, As Mike pointed that reserve_mem is best effort
> > reservation mechanism, so what is the recommended reliable Linux
> > mechanism, if any, to reserve a predetermined memory range during
> > early boot on ARM64/ACPI platforms for warm boot scenarios? KHO is
> > one option, but I'm specifically looking for a solution that preserves
> > the region across warm reboots.
> 
> If you need ramoops-like support, I think ACPI ERST is a better fit and
> we don't need any memory reservation tricks. I'll let the arm ACPI
> maintainers comment further.
> 

while this patch mentions use case of ramoops, there are other uses cases that
requires predetermined memory reservation at boot time, one of them is PMEM.
Like Mike pointed out in this [1] thread, we don't seem to have an
equivalent mechanism for reserving predetermined memory on ARM/ACPI
platforms, as is available on ARM/DTS based platforms.

Thanks,
Shyam

[1] https://lore.kernel.org/lkml/ak3v6dt_VIZTynT8@kernel.org/

