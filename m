Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7047335966;
	Thu, 13 Mar 2025 15:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741880524; cv=none; b=k1VdP0xXqSZ93AKLgTQWWqCQw5FOJw+zML1m37qFM8+2z8TV/1Pci+UXoaOOmbW4l/BxnhKSf6HKX5qzieUbozoV7S0Eq4MYBz9qRiG954m/JTY57FtjcAFk1GKkhWb5EohpxbvR/97Wu8UZjQFOrU9qGE37UvNKpUdn9F6GXpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741880524; c=relaxed/simple;
	bh=GcM0bWRw3lqkKiGt9DpFV6nSyrYsqck9QyyQooLhfPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q+FxAegaNyI2Zt/vsndRYwJj6jb4mVPI8lB8d4pVfqAIIk0RLpQQBZXhTzw9F1yKr+voc1tGn5LH2ZjgrPAwd1uC32IUUb5lnqhgfkx2GBLho68fwLT5LLEHkNPwWhX6jL0i5tuoO2rUuqib1ohtEVd3QX4CsZMnMJp8fe4Lxls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CKh58mif; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CKh58mif"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 551C0C4CEDD;
	Thu, 13 Mar 2025 15:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741880523;
	bh=GcM0bWRw3lqkKiGt9DpFV6nSyrYsqck9QyyQooLhfPQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CKh58mif1encnvopzGQ5g8u81BpNzKKnyR1m8qQQQQFsKjRMEMmH1J//1xRJ5mY+w
	 +H0rEJc6wrjQUj3wd777qw2QfvQjIWB0AR2T70uuujeB1ejksQBfCUO87h9BVIHPSU
	 EZf/Vb9bfsLAd5804VEg7rkdIybciqmUjvetIuWmGMJ84FXQyT7iHjS568tt72VEVk
	 FRkxZ8Ca9aZ6XB58b8x0LzI5TYCEjiBXVU6/z6yxmeUH5TYR/UvYrtb/yreyKwFLSF
	 WcTGizKXWyQKnMpHaxLruLRZukNBESLeygP4Jc1ORmrQ2H+ICYqgn7slmdqFHAU+2/
	 gJkGfc1gvGyRw==
Date: Thu, 13 Mar 2025 17:41:47 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Changyuan Lyu <changyuanl@google.com>
Cc: Alexander Graf <graf@amazon.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Lutomirski <luto@kernel.org>,
	Anthony Yznaga <anthony.yznaga@oracle.com>,
	Arnd Bergmann <arnd@arndb.de>, Ashish Kalra <ashish.kalra@amd.com>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Borislav Petkov <bp@alien8.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Eric Biederman <ebiederm@xmission.com>,
	Ingo Molnar <mingo@redhat.com>, James Gowans <jgowans@amazon.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Pratyush Yadav <ptyadav@amazon.de>,
	Rob Herring <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Usama Arif <usama.arif@bytedance.com>,
	Will Deacon <will@kernel.org>, devicetree@vger.kernel.org,
	kexec@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org
Subject: Re: [PATCH v4 02/14] memblock: add MEMBLOCK_RSRV_KERN flag
Message-ID: <Z9L8u4XP5U6iq5Gu@kernel.org>
References: <20250206132754.2596694-3-rppt@kernel.org>
 <20250226015342.2136669-1-changyuanl@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226015342.2136669-1-changyuanl@google.com>

Hi Changyuan,

On Tue, Feb 25, 2025 at 05:53:39PM -0800, Changyuan Lyu wrote:
> Hi Mike,
> 
> On Thu,  6 Feb 2025 15:27:42 +0200, Mike Rapoport <rppt@kernel.org> wrote:
> > From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> >
> > to denote areas that were reserved for kernel use either directly with
> > memblock_reserve_kern() or via memblock allocations.
> >
> > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > ---
> >  include/linux/memblock.h | 16 +++++++++++++++-
> >  mm/memblock.c            | 32 ++++++++++++++++++++++++--------
> >  2 files changed, 39 insertions(+), 9 deletions(-)
> >
> > diff --git a/include/linux/memblock.h b/include/linux/memblock.h
> > index e79eb6ac516f..65e274550f5d 100644
> > --- a/include/linux/memblock.h
> > +++ b/include/linux/memblock.h
> > ......
> > @@ -116,7 +117,19 @@ int memblock_add_node(phys_addr_t base, phys_addr_t size, int nid,
> >  int memblock_add(phys_addr_t base, phys_addr_t size);
> >  int memblock_remove(phys_addr_t base, phys_addr_t size);
> >  int memblock_phys_free(phys_addr_t base, phys_addr_t size);
> > -int memblock_reserve(phys_addr_t base, phys_addr_t size);
> > +int __memblock_reserve(phys_addr_t base, phys_addr_t size, int nid,
> > +		       enum memblock_flags flags);
> > +
> > +static __always_inline int memblock_reserve(phys_addr_t base, phys_addr_t size)
> > +{
> > +	return __memblock_reserve(base, size, NUMA_NO_NODE, 0);
> 
> Without this patch `memblock_reserve` eventually calls `memblock_add_range`
> with `MAX_NUMNODES`, but with this patch, `memblock_reserve` calls
> `memblock_add_range` with `NUMA_NO_NODE`. Is it intended or an
> accidental typo? Thanks!

We were mixing NUMA_NO_NODE and MAX_NUMNODES for memory with undefined node
id for a while, with MAX_NUMNODES being older and NUMA_NO_NODE newer define
for the same thing.

To make sure both are treated correctly in memblock we use
numa_valid_node() to check if a range has node id set.
 
> Best,
> Changyuan

-- 
Sincerely yours,
Mike.
