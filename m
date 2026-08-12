Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FFBC403144;
	Wed, 12 Aug 2026 09:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786526844; cv=none; b=H5bBieTF64xW9kIQpLD+z2kOwj8B5tk9a+8G9k0f5+RUaO6sQJcCLEwfJ/IxmGmTHdrwRGSok/XWMqjrkEglYGF72ZSCpuCSPWNW8V3NlJ66bDuxYsAXRWHVO8G7Vjo5CmTAA1xNPj6FgFcNDgJLbsVuVLewczEUOVF88cE8Yxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786526844; c=relaxed/simple;
	bh=VkX3ojfZMav6LDkcHZveiMa+VRLZqeIjIeOqXksHGps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vz3I4LFXu7mbx0wWLAS2BDjgZRAf7gK9l2B0bFUgwg5pej+fUauHRxExek5qC/Kil82MAAw3q4rkJKwU/KKoBGstDh7HTvIbD1+pRYjs20IiCF2bPAVTWowJwOMnWmVgT3ueZE1y757er5m0CWzH3KkqyccXhvKIVpsL4zktIzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FosPnie2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FosPnie2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BB231F000E9;
	Wed, 12 Aug 2026 09:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786526842;
	bh=IUd4xsss48nguk+w9o+2Ozog63PCl0EQm/3UWwY4hHk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FosPnie2TVYnhXl9SP4H2dqQBZdxucBIRXspPC/8qNjS7GEcpRXuQGCe5mrBI921T
	 yXvENGLsQknuxZFKHVxnoABpxW2XXIdj87tdQ4q/Fd/XLqCRNdLWyJYQiQDmwrRXSV
	 /vORARhOXd5KHeRvnB6WuGqcpVz9cVogeviZ4VQO1mf74lf9D/m8vPEOCA7PSRpTev
	 Mwyd62ydRAxj1hAtwu9Vfcheglzz/r98SpVLcBJ5/+xoLg/DmPjA+OxTba4oyj6PUj
	 1UttBdDYn330bgQWaX07GeRCj+w75GxoBXkmxoR2v0XY9voW4PJGNTR+WdyVGHDlKF
	 M5FQ8SO3IV8Cg==
Date: Wed, 12 Aug 2026 10:27:02 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Song Hu <husong@kylinos.cn>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, david@kernel.org, 
	ziy@nvidia.com, baolin.wang@linux.alibaba.com, liam@infradead.org, 
	nico.pache@linux.dev, ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org, 
	lance.yang@linux.dev, usama.arif@linux.dev, vbabka@kernel.org, rppt@kernel.org, 
	surenb@google.com, mhocko@suse.com, corbet@lwn.net, skhan@linuxfoundation.org, 
	rdunlap@infradead.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] Docs/mm: fix THP policy counts in transhuge
Message-ID: <anw8ASKdPWW9v86d@lucifer>
References: <20260812080313.330413-1-husong@kylinos.cn>
 <20260812080313.330413-3-husong@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260812080313.330413-3-husong@kylinos.cn>

On Wed, Aug 12, 2026 at 04:03:13PM +0800, Song Hu wrote:
> transhuge.rst claims seven policies for transparent_hugepage_shmem= and
> four for transparent_hugepage_tmpfs=.  Both boot parameters are parsed by
> shmem_parse_huge(), which accepts six: always, within_size, advise, never,
> deny and force.  The "four" applies only to the per-mount huge= option
> (shmem_param_enums_huge).  Fix both counts to six.
>
> Signed-off-by: Song Hu <husong@kylinos.cn>
> ---
>  Documentation/admin-guide/mm/transhuge.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/admin-guide/mm/transhuge.rst b/Documentation/admin-guide/mm/transhuge.rst
> index b187d618452f..72e944f49da5 100644
> --- a/Documentation/admin-guide/mm/transhuge.rst
> +++ b/Documentation/admin-guide/mm/transhuge.rst
> @@ -389,14 +389,14 @@ is not defined within a valid ``thp_anon``, its policy will default to
>  Similarly to ``transparent_hugepage``, you can control the hugepage
>  allocation policy for the internal shmem mount by using the kernel parameter
>  ``transparent_hugepage_shmem=<policy>``, where ``<policy>`` is one of the
> -seven valid policies for shmem (``always``, ``within_size``, ``advise``,
> +six valid policies for shmem (``always``, ``within_size``, ``advise``,
>  ``never``, ``deny``, and ``force``).

I'm not sure we really want to advertise 'special' testing modes like this,
sorry. These are not modes anybody should be using in practice especially at
kernel boot. We should probably stop people doing that...!

>
>  Similarly to ``transparent_hugepage_shmem``, you can control the default
>  hugepage allocation policy for the tmpfs mount by using the kernel parameter
>  ``transparent_hugepage_tmpfs=<policy>``, where ``<policy>`` is one of the
> -four valid policies for tmpfs (``always``, ``within_size``, ``advise``,
> -``never``). The tmpfs mount default policy is ``never``.
> +six valid policies for tmpfs (``always``, ``within_size``, ``advise``,
> +``never``, ``deny``, and ``force``). The tmpfs mount default policy is ``never``.
>

Similarly here.

>  Additionally, Kconfig options are available to set the default hugepage
>  policies for shmem (``CONFIG_TRANSPARENT_HUGEPAGE_SHMEM_HUGE_*``) and tmpfs
> --
> 2.43.0
>

--
Cheers, Lorenzo
