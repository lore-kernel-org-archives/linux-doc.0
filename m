Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582801F9F7F;
	Wed,  8 Jan 2025 13:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736344674; cv=none; b=jSx1E7cWLQW9q13ADWITsXUzousSZaqzaY6Ganx9ameJia7SHW3NtEJcpb70uYxlX+nOeTQPxcJUS6rtk60ErWcn+AcQYgZAp2cG4bvrlXIFdTOduF8X1XNB8ISpo5soRP51/sTi1/ytslmBgYzMT4m4dn8pa9DNHEqWnPlqt6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736344674; c=relaxed/simple;
	bh=wmOD3/ePyiIrov1ZtCkwH0y9xDdaiutIW9EoEfDt2NE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OcF/NiebH4CbDsVAzbqE0tbmCumGF2l2KaQqT0lxeLISQLI6i9VnTOV+1tfVETusGty7EOxmQCat0gVwz/DW0azoWy9hcVBs0IocB0efqLIY5utUIa49753NTxgndXaTcGxJIZwzfmZ9P6DitgWnunK3cLoWL9ko/CHj2m4RIuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ryLpxZKF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ryLpxZKF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78464C4CED3;
	Wed,  8 Jan 2025 13:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736344673;
	bh=wmOD3/ePyiIrov1ZtCkwH0y9xDdaiutIW9EoEfDt2NE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ryLpxZKF8Jk7BLihK2lHrg8eyeZUw8eo4NomOqHOcvmSWEZa8fRfDAVZjPp/KYbEV
	 8GG/DhSmPzBet4Hybnv+TCVHu8SU1GEALYhaT5lokvah/MYWxwjBURh9LtYqU/H+lM
	 w7ttyT88XkN1QK1837+vCIO7qIpChjnv9UHvJbMCfpQCpSfc0VsvTHBujcU6/GSyR6
	 b/ZaLoEX23rTgqrEKRzmnMTWIgzGYkVrm0jDVN8cvTJxDJNL6Dm34gW4XlwTtUtFGV
	 dd3NZTKyiQs7++zRi0G4keF00Pk8OH8yV2DyUcAo1VRUxrpRz6+cHZgVR2GesOfVQN
	 J/HSCts+EUE9w==
Date: Wed, 8 Jan 2025 13:57:48 +0000
From: Will Deacon <will@kernel.org>
To: Sangmoon Kim <sangmoon.kim@samsung.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, ardb@kernel.org
Subject: Re: [PATCH] docs: arm64: update memory layout for vmemmap region
Message-ID: <20250108135748.GA9367@willie-the-truck>
References: <CGME20250102065607epcas1p296c550a7ba26884e1c2810f872e537f4@epcas1p2.samsung.com>
 <20250102065554.1533781-1-sangmoon.kim@samsung.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250102065554.1533781-1-sangmoon.kim@samsung.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Thu, Jan 02, 2025 at 03:52:37PM +0900, Sangmoon Kim wrote:
> Commit 031e011d8b22 ("arm64: mm: Move PCI I/O emulation region above
> the vmemmap region") and commit b730b0f2b1fc ("arm64: mm: Move fixmap
> region above vmemmap region") have placed PCI I/O and fixmap region
> above vmemmap region.
> 
> And commit 32697ff38287 ("arm64: vmemmap: Avoid base2 order of struct
> page size to dimension region") has moved vmemmap region to higher
> address.
> 
> Update document as the memory layout modified by the previous patches.
> 
> Signed-off-by: Sangmoon Kim <sangmoon.kim@samsung.com>
> ---
>  Documentation/arch/arm64/memory.rst | 28 ++++++++++++++--------------
>  1 file changed, 14 insertions(+), 14 deletions(-)

To be honest with you, this document is pretty stale (it doesn't even
mention 16k pages) and almost impossible to keep in-sync with the code.
I'd be inclined to remove these tables; we have ptdump support if people
really want to see where things are.

Will

--->8

diff --git a/Documentation/arch/arm64/memory.rst b/Documentation/arch/arm64/memory.rst
index 8a658984b8bb..678fbb418c3a 100644
--- a/Documentation/arch/arm64/memory.rst
+++ b/Documentation/arch/arm64/memory.rst
@@ -23,71 +23,6 @@ swapper_pg_dir contains only kernel (global) mappings while the user pgd
 contains only user (non-global) mappings.  The swapper_pg_dir address is
 written to TTBR1 and never written to TTBR0.
 
-
-AArch64 Linux memory layout with 4KB pages + 4 levels (48-bit)::
-
-  Start			End			Size		Use
-  -----------------------------------------------------------------------
-  0000000000000000	0000ffffffffffff	 256TB		user
-  ffff000000000000	ffff7fffffffffff	 128TB		kernel logical memory map
- [ffff600000000000	ffff7fffffffffff]	  32TB		[kasan shadow region]
-  ffff800000000000	ffff80007fffffff	   2GB		modules
-  ffff800080000000	fffffbffefffffff	 124TB		vmalloc
-  fffffbfff0000000	fffffbfffdffffff	 224MB		fixed mappings (top down)
-  fffffbfffe000000	fffffbfffe7fffff	   8MB		[guard region]
-  fffffbfffe800000	fffffbffff7fffff	  16MB		PCI I/O space
-  fffffbffff800000	fffffbffffffffff	   8MB		[guard region]
-  fffffc0000000000	fffffdffffffffff	   2TB		vmemmap
-  fffffe0000000000	ffffffffffffffff	   2TB		[guard region]
-
-
-AArch64 Linux memory layout with 64KB pages + 3 levels (52-bit with HW support)::
-
-  Start			End			Size		Use
-  -----------------------------------------------------------------------
-  0000000000000000	000fffffffffffff	   4PB		user
-  fff0000000000000	ffff7fffffffffff	  ~4PB		kernel logical memory map
- [fffd800000000000	ffff7fffffffffff]	 512TB		[kasan shadow region]
-  ffff800000000000	ffff80007fffffff	   2GB		modules
-  ffff800080000000	fffffbffefffffff	 124TB		vmalloc
-  fffffbfff0000000	fffffbfffdffffff	 224MB		fixed mappings (top down)
-  fffffbfffe000000	fffffbfffe7fffff	   8MB		[guard region]
-  fffffbfffe800000	fffffbffff7fffff	  16MB		PCI I/O space
-  fffffbffff800000	fffffbffffffffff	   8MB		[guard region]
-  fffffc0000000000	ffffffdfffffffff	  ~4TB		vmemmap
-  ffffffe000000000	ffffffffffffffff	 128GB		[guard region]
-
-
-Translation table lookup with 4KB pages::
-
-  +--------+--------+--------+--------+--------+--------+--------+--------+
-  |63    56|55    48|47    40|39    32|31    24|23    16|15     8|7      0|
-  +--------+--------+--------+--------+--------+--------+--------+--------+
-            |        |         |         |         |         |
-            |        |         |         |         |         v
-            |        |         |         |         |   [11:0]  in-page offset
-            |        |         |         |         +-> [20:12] L3 index
-            |        |         |         +-----------> [29:21] L2 index
-            |        |         +---------------------> [38:30] L1 index
-            |        +-------------------------------> [47:39] L0 index
-            +----------------------------------------> [55] TTBR0/1
-
-
-Translation table lookup with 64KB pages::
-
-  +--------+--------+--------+--------+--------+--------+--------+--------+
-  |63    56|55    48|47    40|39    32|31    24|23    16|15     8|7      0|
-  +--------+--------+--------+--------+--------+--------+--------+--------+
-            |        |    |               |              |
-            |        |    |               |              v
-            |        |    |               |            [15:0]  in-page offset
-            |        |    |               +----------> [28:16] L3 index
-            |        |    +--------------------------> [41:29] L2 index
-            |        +-------------------------------> [47:42] L1 index (48-bit)
-            |                                          [51:42] L1 index (52-bit)
-            +----------------------------------------> [55] TTBR0/1
-
-
 When using KVM without the Virtualization Host Extensions, the
 hypervisor maps kernel pages in EL2 at a fixed (and potentially
 random) offset from the linear mapping. See the kern_hyp_va macro and
