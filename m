Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43736324718;
	Fri, 14 Nov 2025 14:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763132126; cv=none; b=pf9l+osfVUiL5I78L+4NNYQFUVOuwMhSRrzk0OPHnG+UmXxYhwrfyWJAXYIt08dLduZ6ubGqWgps+ynuK3nCY5631AIxq0yFEw2OxGrb2grEqly1D+vTJqITWBfFOnyxg+g88cjH+FJ73R/FXBLpj+DmEzwsRcezGPAha2+6TOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763132126; c=relaxed/simple;
	bh=NI3GWqZPKo5kbD0ezFXyE300DA5rwnbUJjHg59eZXq4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=psAjWNsqZwD446a5/IS8DZ1G6C1Q4ZAPSvJ+E3T75IvzzCSsLfTt8E5y5agS452qGo3Xsi/Zjhoev8oo3SfKyhjKkUCrGgZu1mblg3y7opADBqdlNRCXgb+igEdJFADGQF0CQOoJLQSH7UbhVNxHOKOyDND4Id1nx8yPHTxJtHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BC5DD1063;
	Fri, 14 Nov 2025 06:55:15 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0344C3F66E;
	Fri, 14 Nov 2025 06:55:22 -0800 (PST)
Date: Fri, 14 Nov 2025 14:55:21 +0000
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 04/13] coresight: Hide unused ETMv3 format attributes
Message-ID: <20251114145521.GD3568724@e132581.arm.com>
References: <20251112-james-cs-syncfreq-v4-0-165ba21401dc@linaro.org>
 <20251112-james-cs-syncfreq-v4-4-165ba21401dc@linaro.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112-james-cs-syncfreq-v4-4-165ba21401dc@linaro.org>

On Wed, Nov 12, 2025 at 03:22:10PM +0000, James Clark wrote:
> ETMv3 only has a few attributes, and setting unused ones results in an
> error, so hide them to begin with.
> 
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>  drivers/hwtracing/coresight/coresight-etm-perf.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
> index 17afa0f4cdee..91132abca244 100644
> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
> @@ -106,8 +106,27 @@ static struct attribute *etm_config_formats_attr[] = {
>  	NULL,
>  };
>  
> +static umode_t etm_format_attr_is_visible(struct kobject *kobj,
> +					  struct attribute *attr, int unused)
> +{
> +	/* ETM4 has all attributes */
> +	if (IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X))
> +		return attr->mode;
> +
> +	/* ETM3 only has these attributes */
> +	if (attr == &format_attr_cycacc.attr ||
> +	    attr == &format_attr_timestamp.attr ||
> +	    attr == &format_attr_retstack.attr ||
> +	    attr == &format_attr_sinkid.attr ||
> +	    attr == &format_attr_configid.attr)

Do we support configid for ETM3?

> +		return attr->mode;

It is good to give a bit information why only these attributes
supported, e.g.,

  /*
   * ETM3 only support subset attributes (see ETM3X_SUPPORTED_OPTIONS),
   * keep 'sinkid' attr for specifying sink ID.
   */

Two side topics but not issues caused this patch:

- Since CTXTID/CTXTID2 is only used for ETM4x, we can remove "#if
  IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X)" from the
  format_attr_contextid_show() function.

- etm_parse_event_config() does not check attr->config3, thus user
  sets 'cc_threshold' it will slip without any error report.

Thanks,
Leo

> +
> +	return 0;
> +}
> +
>  static const struct attribute_group etm_pmu_format_group = {
>  	.name   = "format",
> +	.is_visible = etm_format_attr_is_visible,
>  	.attrs  = etm_config_formats_attr,
>  };
>  
> 
> -- 
> 2.34.1
> 
