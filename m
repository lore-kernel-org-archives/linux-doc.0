Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EEDF32E75F;
	Fri, 14 Nov 2025 15:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763133495; cv=none; b=O2cFx+JdpEnodLeZDXF2+Jrkp8L/QjAYlPvMIgTtphddP58kU3zxxQG8mLOQlqqWU/81Ry0ypWPiP4RD2Y051voYZW4EBVobweurRxWQWF0WRlW8xH/EjFIs6X/8StTlTyfPO667nH/mpWojyPFuQFtEVjalzPhWlM+DFb4bx4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763133495; c=relaxed/simple;
	bh=GJr4MmbbwSAhdltG5F0o/fgPTpglcrPCQdTsJs+ZYnE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pl5qmzGEVONF17Seil9oDMk2J4ih4qHu4aZcm7RM2g8kbYC57lK5KaCcSFOzkLbtoUNh8m3MKwb+Xf9LAjHmhUf2mLU2+mmlQq9IU4H+KXmLdP9//CMn2Sstv6ObGVITWJWoht5EmmI8C94SDCyccGfiTs+875I65ycU4Wp5BXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 64BF51063;
	Fri, 14 Nov 2025 07:18:05 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9D1353F66E;
	Fri, 14 Nov 2025 07:18:12 -0800 (PST)
Date: Fri, 14 Nov 2025 15:18:10 +0000
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 07/13] coresight: Don't reject unrecognized ETMv3
 format attributes
Message-ID: <20251114151810.GG3568724@e132581.arm.com>
References: <20251112-james-cs-syncfreq-v4-0-165ba21401dc@linaro.org>
 <20251112-james-cs-syncfreq-v4-7-165ba21401dc@linaro.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112-james-cs-syncfreq-v4-7-165ba21401dc@linaro.org>

On Wed, Nov 12, 2025 at 03:22:13PM +0000, James Clark wrote:
> config isn't the only field, there are also config1, config2, etc.
> Rejecting unrecognized attributes is therefore inconsistent as it wasn't
> done for all fields. It was only necessary when we were directly
> programming attr->config into ETMCR and didn't hide the unsupported
> fields, but now it's not needed so remove it.

It is fine for not validating all configs (please ignore my comment for
checking all configs in my reply for patch 04).

I am wandering if need to remove ETM3X_SUPPORTED_OPTIONS totally. I
saw etm_enable_hw() uses it to clear config bits, so it makes sense to
keep it.

Reviewed-by: Leo Yan <leo.yan@arm.com>

> 
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>  drivers/hwtracing/coresight/coresight-etm3x-core.c | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
> index 4511fc2f8d72..584d653eda81 100644
> --- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
> @@ -333,13 +333,6 @@ static int etm_parse_event_config(struct etm_drvdata *drvdata,
>  	if (config->mode)
>  		etm_config_trace_mode(config);
>  
> -	/*
> -	 * At this time only cycle accurate, return stack  and timestamp
> -	 * options are available.
> -	 */
> -	if (attr->config & ~ETM3X_SUPPORTED_OPTIONS)
> -		return -EINVAL;
> -
>  	config->ctrl = 0;
>  
>  	if (ATTR_CFG_GET_FLD(attr, cycacc))
> 
> -- 
> 2.34.1
> 
