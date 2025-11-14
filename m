Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FA2022F772;
	Fri, 14 Nov 2025 16:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763137432; cv=none; b=Xd3s5LheSgAImqwnpP2WzqiT81hZbGkJIa0N4I78/N25ZYMfvxZIR70d3voQcpsnUDrij6jGh8K3JaTTzmfDKoC6GIVYg0KF/I02n6E5kmCdy5DnxJv+OlGS46gPhyEqHgXebEoy9p02WHTYHnXGzM0GwQYO2gMlark1ijN5omw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763137432; c=relaxed/simple;
	bh=PNHjG/Eh4LpWUiEyfe7MfoC3FGJ/3gde/QPYu69dP+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IsSmDct0Pv3vrCRKxguiHDLAM7R9c0ctkqU8Lxc3YzaeW9Wt4MaxXN05bF32SGbO7ss/wzNXLRa2/eWok3m0+lCovecIswNekHtc4BiF6gmcnHy1FX4mgLbZ5X4Kl8yFhEthRAt4wPiIzwI98Eex7eDmwHvDZubfJJwJwf1ewx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1C68C1063;
	Fri, 14 Nov 2025 08:23:43 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 556043F5A1;
	Fri, 14 Nov 2025 08:23:50 -0800 (PST)
Date: Fri, 14 Nov 2025 16:23:48 +0000
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 10/13] coresight: Remove misleading definitions
Message-ID: <20251114162348.GK3568724@e132581.arm.com>
References: <20251112-james-cs-syncfreq-v4-0-165ba21401dc@linaro.org>
 <20251112-james-cs-syncfreq-v4-10-165ba21401dc@linaro.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112-james-cs-syncfreq-v4-10-165ba21401dc@linaro.org>

On Wed, Nov 12, 2025 at 03:22:16PM +0000, James Clark wrote:
> ETM_OPT_* definitions duplicate the PMU format attributes that have
> always been published in sysfs. Hardcoding them here makes it misleading
> as to what the 'real' PMU API is and prevents attributes from being
> rearranged in the future.
> 
> ETM4_CFG_BIT_* definitions just define what the Arm Architecture is
> which is not the responsibility of the kernel to do and doesn't scale to
> other registers or versions of ETM. It's not an actual software ABI/API
> and these definitions here mislead that it is.
> 
> Any tools using the first ones would be broken anyway as they won't work
> when attributes are moved, so removing them is the right thing to do and
> will prompt a fix. Tools using the second ones can trivially redefine
> them locally.
> 
> Perf also has its own copy of the headers so both of these things can be
> fixed up at a later date.
> 
> Signed-off-by: James Clark <james.clark@linaro.org>

Good cleanup for me!

Reviewed-by: Leo Yan <leo.yan@arm.com>

> ---
>  include/linux/coresight-pmu.h | 24 ------------------------
>  1 file changed, 24 deletions(-)
> 
> diff --git a/include/linux/coresight-pmu.h b/include/linux/coresight-pmu.h
> index 89b0ac0014b0..2e179abe472a 100644
> --- a/include/linux/coresight-pmu.h
> +++ b/include/linux/coresight-pmu.h
> @@ -21,30 +21,6 @@
>   */
>  #define CORESIGHT_LEGACY_CPU_TRACE_ID(cpu)  (0x10 + (cpu * 2))
>  
> -/*
> - * Below are the definition of bit offsets for perf option, and works as
> - * arbitrary values for all ETM versions.
> - *
> - * Most of them are orignally from ETMv3.5/PTM's ETMCR config, therefore,
> - * ETMv3.5/PTM doesn't define ETMCR config bits with prefix "ETM3_" and
> - * directly use below macros as config bits.
> - */
> -#define ETM_OPT_BRANCH_BROADCAST 8
> -#define ETM_OPT_CYCACC		12
> -#define ETM_OPT_CTXTID		14
> -#define ETM_OPT_CTXTID2		15
> -#define ETM_OPT_TS		28
> -#define ETM_OPT_RETSTK		29
> -
> -/* ETMv4 CONFIGR programming bits for the ETM OPTs */
> -#define ETM4_CFG_BIT_BB         3
> -#define ETM4_CFG_BIT_CYCACC	4
> -#define ETM4_CFG_BIT_CTXTID	6
> -#define ETM4_CFG_BIT_VMID	7
> -#define ETM4_CFG_BIT_TS		11
> -#define ETM4_CFG_BIT_RETSTK	12
> -#define ETM4_CFG_BIT_VMID_OPT	15
> -
>  /*
>   * Interpretation of the PERF_RECORD_AUX_OUTPUT_HW_ID payload.
>   * Used to associate a CPU with the CoreSight Trace ID.
> 
> -- 
> 2.34.1
> 
