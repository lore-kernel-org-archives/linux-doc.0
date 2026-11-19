Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795087270;
	b=bNOxkMx7LiJ+W06/q9DUyd4xgwT8fZJmH/Vjc4j6ZdUQCpvPPxhy6vMZFyL+3gsLgHpT
	 lS942pS1JBT2FzcZOm2PLLieHX8Ge3wykY3vw9g+aWFHVk5AMmO+mVtq2RW0Iwn3RQtwO
	 cyempIeA54Kvt/m9IcOFPenZDuWeZvENEY6BqacrL0mesYfke4Iof/uB+bX314F5zF8Ew
	 FdB2DzL3ui6+itu7rjvZ9Z3SygjAblC/Yli0Ykz1eFbTNMnRr+W32yNu3XdjEF+5bQCup
	 4U0PSYD2ByWLdIVmdcVbWGKTeYoBhSSvXzXGoH7XaCMWRRgFVnFfWhn532jcVgM8RLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795087270;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=ha6DnhWQklD6WeWHrNkV2Ns/0/S4Aa7BC63XGyEQDOM=;
	b=rktH+RrcWMaRhKsCvgNj+X6LTpA83HcfkrGQk1lR1KuLNB6sLqoQtBcGaSTOOy1T7ZnB
	 GSXR81c2Ldsz63iu5uM8B2rWG/mYuPShRPxemx+wxqLVCGd9guguGIWwNgx06AjNE4VZz
	 MHIKlwx8YPFlzTQfWdrlPSSQRV1hR+D+Kp3pTrqn3qUk+S7iFJ65MjU1tBzd3z1ACjBl7
	 Uq18iB1KaCRv3pJGy6z9BFWA6Pg8E4ONIEUVqZu00SND/NJ6RD9FFME8ZIBmRn6prAMnn
	 QLMj9x+ZNyHGTKkj6cQnTy9PVRxKpz1eLYk/PJTnimqUNvAMnWdxGMnpdY3oeIRTvuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Ww59asfT;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03C16606A325;
	Thu, 19 Nov 2026 11:21:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03C16606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Ww59asfT
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EC0D61575;
	Thu, 19 Nov 2026 03:21:05 -0800 (PST)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4AF813F882;
	Thu, 19 Nov 2026 03:21:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795087268; bh=+w/PeSpkV8fS5Gud1Ms9cg7smZ9ToeDeWc8CXszhPvQ=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=Ww59asfT/L0guyuN7+0C49D7Ybpph+RIpcplwoA/3QabqJIXRAxwbk6Rwoju+atGj
	 LMWB8tl8PUFkvrMkFQos7ncUxT7a47GrWd/H/xlNuEMY4Y7StSbDVSBttVieOM1y4h
	 Kd9TeGzyJUgbVCaR20zvpDdSPaBVOO0bJCl20/0o=
Message-ID: <6b0ccb0d-487a-4985-ac7b-81808848fd0b@arm.com>
Date: Thu, 19 Nov 2026 11:21:04 +0000
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/6] fs/resctrl: Clear the CDP state after the cleanup
To: Jinjie Ruan <ruanjinjie@huawei.com>, tony.luck@intel.com,
 reinette.chatre@intel.com, Dave.Martin@arm.com, james.morse@arm.com,
 babu.moger@amd.com, corbet@lwn.net, skhan@linuxfoundation.org,
 rdunlap@infradead.org, bp@alien8.de, tan.shaopeng@fujitsu.com,
 gshan@redhat.com, jic23@kernel.org, fenghuay@nvidia.com,
 zengheng4@huawei.com, x86@kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20261119094858.813874-1-ruanjinjie@huawei.com>
 <20261119094858.813874-4-ruanjinjie@huawei.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20261119094858.813874-4-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jinjie,

On 19/11/2026 09:48, Jinjie Ruan wrote:
> To support CDP, resctrl halves the number of CLOSIDs available to
> resource groups and gives each remaining CLOSID two hardware
> configurations instead of one, distinguished by index: 2 * CLOSID for
> data and 2 * CLOSID + 1 for code. Without CDP a CLOSID has a single
> configuration, at index CLOSID. Every architecture computes these
> indices the same way.
> 
> Unmounting clears the CDP state before it undoes what the groups were
> given, so the cleanup computes index CLOSID where the group was set up
> with 2 * CLOSID and 2 * CLOSID + 1. The group's two configurations are
> left in place and index CLOSID is cleared instead, which with CDP
> enabled is a configuration of a different CLOSID. The architecture may
> keep this state for as long as the resource exists.
> 
> Only MPAM can reach this today. Of everything the cleanup has to undo,
> MPAM addresses only the MBM counter assignment by the translated CLOSID,
> and it only began doing so when it implemented assignable counters. 

This is clearly not ideal but even in MPAM we get away without any usable visible effect. Or am I
missing something? We are left with some assigned counters from the MPAM driver point of view but
the resctrl is in charge of the assignments and MPAM doesn't check if a counter is already assigned
when resctrl asks for a new assignment. The change looks good to me.

Thanks,

Ben


x86
> addresses its counters by RMID alone.
> 
> Clear the CDP state after the cleanup, so that the cleanup runs with the
> CDP state the groups were set up under.
> 
> Fixes: 6e0e538a75ce ("arm_mpam: resctrl: Add resctrl_arch_config_cntr() for ABMC use")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Cc: <stable@vger.kernel.org>
> ---
> v6:
> - Describe the CDP indices as resctrl filesystem behavior that applies
>   to every architecture, and the flow instead of the code (Reinette).
> - Drop the stable version range, the Fixes tag already gives it.
> ---
>  fs/resctrl/rdtgroup.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
> index 5d0351453c2f..3312637fb514 100644
> --- a/fs/resctrl/rdtgroup.c
> +++ b/fs/resctrl/rdtgroup.c
> @@ -3150,13 +3150,19 @@ static void resctrl_unmount(void)
>  	cpus_read_lock();
>  	mutex_lock(&rdtgroup_mutex);
>  
> -	rdt_disable_ctx();
> -
>  	/* Put everything back to default values. */
>  	for_each_alloc_capable_rdt_resource(r)
>  		resctrl_arch_reset_all_ctrls(r);
>  
>  	resctrl_fs_teardown();
> +
> +	/*
> +	 * Clear the CDP state after the cleanup. The CDP state decides
> +	 * which hardware configuration a CLOSID refers to, so the teardown
> +	 * must run with the state the configuration was created under.
> +	 */
> +	rdt_disable_ctx();
> +
>  	if (resctrl_arch_alloc_capable())
>  		resctrl_arch_disable_alloc();
>  	if (resctrl_arch_mon_capable())

