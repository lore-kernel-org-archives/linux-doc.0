Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3682A1EE019;
	Fri, 14 Nov 2025 15:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763132862; cv=none; b=btoVB7hdHSlLdBFndLckB+OsB9+Q00mab7ugx2Y9qu/FOSaIqS+JFNtCNgISxW+kcwlCT1lAGU4CkIe2tQQqbI4q4yjZeQ8X7Xtu4biQzrsBFxxZx+lhj2OAkCieUSHWkDhgSc3dMkfYUQCpQaiE+cSTq9PBmZineRrRxY5Hkwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763132862; c=relaxed/simple;
	bh=hdBYivvhj81cSEPdyZtxDL47GDFISRehLP/l/vsFoew=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uRj06qSGtBDm3t79JqkxQ62obYtr5l6Flo7AftvwULAmPYlZXntj3CXfakKPdRFvAM1eAL9RNPzQmQMDOM8qqVFr0oCR8Wj2bfez2fcwYPjHFWKPYddR9klUoiY0q53v+xG6p9knS0FllfFFSoOibgvMdaRVyHFgNH3OuG64s7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EDEDC1063;
	Fri, 14 Nov 2025 07:07:31 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 351DF3F66E;
	Fri, 14 Nov 2025 07:07:39 -0800 (PST)
Date: Fri, 14 Nov 2025 15:07:37 +0000
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 06/13] coresight: Interpret ETMv3 config with
 ATTR_CFG_GET_FLD()
Message-ID: <20251114150737.GF3568724@e132581.arm.com>
References: <20251112-james-cs-syncfreq-v4-0-165ba21401dc@linaro.org>
 <20251112-james-cs-syncfreq-v4-6-165ba21401dc@linaro.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112-james-cs-syncfreq-v4-6-165ba21401dc@linaro.org>

On Wed, Nov 12, 2025 at 03:22:12PM +0000, James Clark wrote:
> Currently we're programming attr->config directly into ETMCR after some
> validation. This obscures which fields are being used, and also makes it
> impossible to move fields around or use other configN fields in the
> future.
> 
> Improve it by only reading the fields that are valid and then setting
> the appropriate ETMCR bits based on each one.
> 
> The ETMCR_CTXID_SIZE part can be removed as it was never a valid option
> because it's not in ETM3X_SUPPORTED_OPTIONS.
> 
> Signed-off-by: James Clark <james.clark@linaro.org>

LGTM:

Reviewed-by: Leo Yan <leo.yan@arm.com>

> ---
>  drivers/hwtracing/coresight/coresight-etm3x-core.c | 24 ++++++++++++----------
>  1 file changed, 13 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
> index a5e809589d3e..4511fc2f8d72 100644
> --- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
> @@ -28,6 +28,7 @@
>  #include <linux/uaccess.h>
>  #include <linux/clk.h>
>  #include <linux/perf_event.h>
> +#include <linux/perf/arm_pmu.h>
>  #include <asm/sections.h>
>  
>  #include "coresight-etm.h"
> @@ -339,21 +340,22 @@ static int etm_parse_event_config(struct etm_drvdata *drvdata,
>  	if (attr->config & ~ETM3X_SUPPORTED_OPTIONS)
>  		return -EINVAL;
>  
> -	config->ctrl = attr->config;
> +	config->ctrl = 0;
>  
> -	/* Don't trace contextID when runs in non-root PID namespace */
> -	if (!task_is_in_init_pid_ns(current))
> -		config->ctrl &= ~ETMCR_CTXID_SIZE;
> +	if (ATTR_CFG_GET_FLD(attr, cycacc))
> +		config->ctrl |= ETMCR_CYC_ACC;
> +
> +	if (ATTR_CFG_GET_FLD(attr, timestamp))
> +		config->ctrl |= ETMCR_TIMESTAMP_EN;
>  
>  	/*
> -	 * Possible to have cores with PTM (supports ret stack) and ETM
> -	 * (never has ret stack) on the same SoC. So if we have a request
> -	 * for return stack that can't be honoured on this core then
> -	 * clear the bit - trace will still continue normally
> +	 * Possible to have cores with PTM (supports ret stack) and ETM (never
> +	 * has ret stack) on the same SoC. So only enable when it can be honored
> +	 * - trace will still continue normally otherwise.
>  	 */
> -	if ((config->ctrl & ETMCR_RETURN_STACK) &&
> -	    !(drvdata->etmccer & ETMCCER_RETSTACK))
> -		config->ctrl &= ~ETMCR_RETURN_STACK;
> +	if (ATTR_CFG_GET_FLD(attr, retstack) &&
> +	    (drvdata->etmccer & ETMCCER_RETSTACK))
> +		config->ctrl |= ETMCR_RETURN_STACK;
>  
>  	return 0;
>  }
> 
> -- 
> 2.34.1
> 
