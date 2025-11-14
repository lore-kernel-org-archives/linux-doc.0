Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DADE032A3D4;
	Fri, 14 Nov 2025 16:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763136598; cv=none; b=c5jRLDSUknkfv0MB8lYiOu9RP4nbpQxFqghidKbOUIP3b7yK2Y+1eWO7EzgIfiiqX9KMGg8B2Jfec+mGs4R0KbQW1Gb0h69zjcDff0ClYNLe7Nuv1IF+4RgnYVkHOEMYOh1a8XvIOYsiwgLNESWjJ1zEePl1TT3OExHbCeryiYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763136598; c=relaxed/simple;
	bh=68PzXQChDpmnLNn6u5XwV+K7XfxdV/TYfSTMfKVS2CU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LYcKVfjR3QHd0bPWbvQ/qNsR1IV1z5e+FBuxK/wln8tEcKU7iuidoA5cSL5wqPmf/DMNVDbVqan45dVf3C/TpePH1EaxB/oLAOv8juSEkebhm5mW+SgIbTavQ66XcZA435h+uo66q1/GVKZEFKrNRK8dv51PeuRxTzyAEnGvgjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A0ACF1AC1;
	Fri, 14 Nov 2025 08:09:48 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DC3EB3F5A1;
	Fri, 14 Nov 2025 08:09:55 -0800 (PST)
Date: Fri, 14 Nov 2025 16:09:54 +0000
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 09/13] coresight: Interpret ETMv4 config with
 ATTR_CFG_GET_FLD()
Message-ID: <20251114160954.GJ3568724@e132581.arm.com>
References: <20251112-james-cs-syncfreq-v4-0-165ba21401dc@linaro.org>
 <20251112-james-cs-syncfreq-v4-9-165ba21401dc@linaro.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112-james-cs-syncfreq-v4-9-165ba21401dc@linaro.org>

On Wed, Nov 12, 2025 at 03:22:15PM +0000, James Clark wrote:
> Remove hard coded bitfield extractions and shifts and replace with
> ATTR_CFG_GET_FLD().
> 
> ETM4_CFG_BIT_BB was defined to give the register bit positions to
> userspace, TRCCONFIGR_BB should be used in the kernel so replace it.
> 
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>  drivers/hwtracing/coresight/coresight-etm4x-core.c | 44 ++++++++++------------
>  1 file changed, 19 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index 380a7840adb8..1aa0357a5ce7 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -29,6 +29,7 @@
>  #include <linux/seq_file.h>
>  #include <linux/uaccess.h>
>  #include <linux/perf_event.h>
> +#include <linux/perf/arm_pmu.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/property.h>
> @@ -789,17 +790,17 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
>  		goto out;
>  
>  	/* Go from generic option to ETMv4 specifics */
> -	if (attr->config & BIT(ETM_OPT_CYCACC)) {
> +	if (ATTR_CFG_GET_FLD(attr, cycacc)) {
>  		config->cfg |= TRCCONFIGR_CCI;
>  		/* TRM: Must program this for cycacc to work */
> -		cc_threshold = attr->config3 & ETM_CYC_THRESHOLD_MASK;
> +		cc_threshold = ATTR_CFG_GET_FLD(attr, cc_threshold);
>  		if (!cc_threshold)
>  			cc_threshold = ETM_CYC_THRESHOLD_DEFAULT;
>  		if (cc_threshold < drvdata->ccitmin)
>  			cc_threshold = drvdata->ccitmin;
>  		config->ccctlr = cc_threshold;
>  	}
> -	if (attr->config & BIT(ETM_OPT_TS)) {
> +	if (ATTR_CFG_GET_FLD(attr, timestamp)) {
>  		/*
>  		 * Configure timestamps to be emitted at regular intervals in
>  		 * order to correlate instructions executed on different CPUs
> @@ -819,17 +820,17 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
>  	}
>  
>  	/* Only trace contextID when runs in root PID namespace */
> -	if ((attr->config & BIT(ETM_OPT_CTXTID)) &&
> +	if (ATTR_CFG_GET_FLD(attr, contextid1) &&
>  	    task_is_in_init_pid_ns(current))
>  		/* bit[6], Context ID tracing bit */
>  		config->cfg |= TRCCONFIGR_CID;
>  
>  	/*
> -	 * If set bit ETM_OPT_CTXTID2 in perf config, this asks to trace VMID
> -	 * for recording CONTEXTIDR_EL2.  Do not enable VMID tracing if the
> -	 * kernel is not running in EL2.
> +	 * If set bit contextid2 in perf config, this asks to trace VMID for
> +	 * recording CONTEXTIDR_EL2.  Do not enable VMID tracing if the kernel
> +	 * is not running in EL2.
>  	 */
> -	if (attr->config & BIT(ETM_OPT_CTXTID2)) {
> +	if (ATTR_CFG_GET_FLD(attr, contextid2)) {
>  		if (!is_kernel_in_hyp_mode()) {
>  			ret = -EINVAL;
>  			goto out;
> @@ -840,26 +841,22 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
>  	}
>  
>  	/* return stack - enable if selected and supported */
> -	if ((attr->config & BIT(ETM_OPT_RETSTK)) && drvdata->retstack)
> +	if (ATTR_CFG_GET_FLD(attr, retstack) && drvdata->retstack)
>  		/* bit[12], Return stack enable bit */
>  		config->cfg |= TRCCONFIGR_RS;
>  
>  	/*
> -	 * Set any selected configuration and preset.
> -	 *
> -	 * This extracts the values of PMU_FORMAT_ATTR(configid) and PMU_FORMAT_ATTR(preset)
> -	 * in the perf attributes defined in coresight-etm-perf.c.
> -	 * configid uses bits 63:32 of attr->config2, preset uses bits 3:0 of attr->config.
> -	 * A zero configid means no configuration active, preset = 0 means no preset selected.
> +	 * Set any selected configuration and preset. A zero configid means no
> +	 * configuration active, preset = 0 means no preset selected.
>  	 */
> -	if (attr->config2 & GENMASK_ULL(63, 32)) {
> -		cfg_hash = (u32)(attr->config2 >> 32);
> -		preset = attr->config & 0xF;
> +	if (ATTR_CFG_GET_FLD(attr, configid)) {
> +		cfg_hash = ATTR_CFG_GET_FLD(attr, configid);

Nitpick:


    cfg_hash = ATTR_CFG_GET_FLD(attr, configid);
    if (cfg_hash) {

Then we can avoid a redundant ATTR_CFG_GET_FLD().

Otherwise:

Reviewed-by: Leo Yan <leo.yan@arm.com>

> +		preset = ATTR_CFG_GET_FLD(attr, preset);
>  		ret = cscfg_csdev_enable_active_config(csdev, cfg_hash, preset);
>  	}
>  
>  	/* branch broadcast - enable if selected and supported */
> -	if (attr->config & BIT(ETM_OPT_BRANCH_BROADCAST)) {
> +	if (ATTR_CFG_GET_FLD(attr, branch_broadcast)) {
>  		if (!drvdata->trcbb) {
>  			/*
>  			 * Missing BB support could cause silent decode errors
> @@ -868,7 +865,7 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
>  			ret = -EINVAL;
>  			goto out;
>  		} else {
> -			config->cfg |= BIT(ETM4_CFG_BIT_BB);
> +			config->cfg |= TRCCONFIGR_BB;
>  		}
>  	}
>  
> @@ -1104,11 +1101,8 @@ static int etm4_disable_perf(struct coresight_device *csdev,
>  		return -EINVAL;
>  
>  	etm4_disable_hw(drvdata);
> -	/*
> -	 * The config_id occupies bits 63:32 of the config2 perf event attr
> -	 * field. If this is non-zero then we will have enabled a config.
> -	 */
> -	if (attr->config2 & GENMASK_ULL(63, 32))
> +	/* If configid is non-zero then we will have enabled a config. */
> +	if (ATTR_CFG_GET_FLD(attr, configid))
>  		cscfg_csdev_disable_active_config(csdev);
>  
>  	/*
> 
> -- 
> 2.34.1
> 
