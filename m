Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8419F26B2D3;
	Fri, 14 Nov 2025 17:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763140228; cv=none; b=BO2uUG82PEtI/iL2OFr4qNegfxbzrKWGxWcUrZ348cTQ7eppmcV5PRZMAl1EYJBsK+wP7dT8Ww9rn7Y2+DEJ7mLDoqwlTQuPDHG0GcvhtasiLc+scGOl9OyoO1+cC2d8uYlau47CulQuXORcdARAJSsxFBMiO+O9K6zFyNbt0kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763140228; c=relaxed/simple;
	bh=lwuO3l3OhkEYk8WmTHhDZ8zlYyo5zBacqtocE1oArGg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P+/EaII3obsYoijtv/w5z6gmJ8atY2VLNxUeg8B9u5jbYFsU6mf8Z1Z056mWSyM/U6uLZlGx+fhCQioqS4OoL9OTKWCPLZuk2EwKLiG4IX1zSW6AEaPOtbZIOMK3tgDDAn3AU9AJwMr7MOpuFMEMMREHoYkc6spPyA5LfG+xQhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D57521063;
	Fri, 14 Nov 2025 09:10:16 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1BBB23F63F;
	Fri, 14 Nov 2025 09:10:23 -0800 (PST)
Date: Fri, 14 Nov 2025 17:10:22 +0000
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 11/13] coresight: Extend width of timestamp format
 attribute
Message-ID: <20251114171022.GL3568724@e132581.arm.com>
References: <20251112-james-cs-syncfreq-v4-0-165ba21401dc@linaro.org>
 <20251112-james-cs-syncfreq-v4-11-165ba21401dc@linaro.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112-james-cs-syncfreq-v4-11-165ba21401dc@linaro.org>

On Wed, Nov 12, 2025 at 03:22:17PM +0000, James Clark wrote:
> 'timestamp' is currently 1 bit wide for on/off. To enable setting
> different intervals in a later commit, extend it to 4 bits wide. Keep
> the old bit position for backward compatibility but don't publish in the
> format/ folder. It will be removed from the documentation and can be
> removed completely after enough time has passed.
> 
> ETM3x doesn't support different intervals, so validate that the value is
> either 0 or 1.
> 
> Tools that read the bit positions from the format/ folder will continue
> to work as before, setting either 0 or 1 for off/on. Tools that
> incorrectly didn't do this and set the ETM_OPT_TS bit directly will also
> continue to work because that old bit is still checked.
> 
> This avoids adding a second timestamp attribute for setting the
> interval. This would be awkward to use because tools would have to be
> updated to ensure that the timestamps are always enabled when an
> interval is set, and the driver would have to validate that both options
> are provided together. All this does is implement the semantics of a
> single enum but spread over multiple fields.

Just a bit thoughts.  My understanding is that the PMU format would
clearly represent the PMU characteristics.  I imagine that after reading
the ETM specification, someone should be able to easily map to the PMU
formats (enable field and counter field separately).

Alternatively, this patch provides a user-friendly interface that allows
all settings (enable + counter) in one go.  Users can benefit from it
without knowing the underlying hardware mechanism, but might need to
digest its semantics.  As this will be well documented, I am fine for
current approach:

Reviewed-by: Leo Yan <leo.yan@arm.com>


> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>  drivers/hwtracing/coresight/coresight-etm-perf.h   | 13 ++++++++++---
>  drivers/hwtracing/coresight/coresight-etm3x-core.c |  9 ++++++++-
>  drivers/hwtracing/coresight/coresight-etm4x-core.c |  4 +++-
>  3 files changed, 21 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.h b/drivers/hwtracing/coresight/coresight-etm-perf.h
> index c794087a0e99..24d929428633 100644
> --- a/drivers/hwtracing/coresight/coresight-etm-perf.h
> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.h
> @@ -23,6 +23,9 @@ struct cscfg_config_desc;
>  #define ATTR_CFG_FLD_preset_CFG			config
>  #define ATTR_CFG_FLD_preset_LO			0
>  #define ATTR_CFG_FLD_preset_HI			3
> +#define ATTR_CFG_FLD_timestamp_CFG		config
> +#define ATTR_CFG_FLD_timestamp_LO		4
> +#define ATTR_CFG_FLD_timestamp_HI		7
>  #define ATTR_CFG_FLD_branch_broadcast_CFG	config
>  #define ATTR_CFG_FLD_branch_broadcast_LO	8
>  #define ATTR_CFG_FLD_branch_broadcast_HI	8
> @@ -35,9 +38,13 @@ struct cscfg_config_desc;
>  #define ATTR_CFG_FLD_contextid2_CFG		config
>  #define ATTR_CFG_FLD_contextid2_LO		15
>  #define ATTR_CFG_FLD_contextid2_HI		15
> -#define ATTR_CFG_FLD_timestamp_CFG		config
> -#define ATTR_CFG_FLD_timestamp_LO		28
> -#define ATTR_CFG_FLD_timestamp_HI		28
> +/*
> + * Old position of 'timestamp' and not published in sysfs. Remove at a later
> + * date if necessary.
> + */
> +#define ATTR_CFG_FLD_deprecated_timestamp_CFG	config
> +#define ATTR_CFG_FLD_deprecated_timestamp_LO	28
> +#define ATTR_CFG_FLD_deprecated_timestamp_HI	28
>  #define ATTR_CFG_FLD_retstack_CFG		config
>  #define ATTR_CFG_FLD_retstack_LO		29
>  #define ATTR_CFG_FLD_retstack_HI		29
> diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
> index 584d653eda81..d4c04e563bf6 100644
> --- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
> @@ -338,9 +338,16 @@ static int etm_parse_event_config(struct etm_drvdata *drvdata,
>  	if (ATTR_CFG_GET_FLD(attr, cycacc))
>  		config->ctrl |= ETMCR_CYC_ACC;
>  
> -	if (ATTR_CFG_GET_FLD(attr, timestamp))
> +	if (ATTR_CFG_GET_FLD(attr, deprecated_timestamp) ||
> +	    ATTR_CFG_GET_FLD(attr, timestamp))
>  		config->ctrl |= ETMCR_TIMESTAMP_EN;
>  
> +	if (ATTR_CFG_GET_FLD(attr, timestamp) > 1) {
> +		dev_dbg(&drvdata->csdev->dev,
> +			"timestamp format attribute should be 0 (off) or 1 (on)\n");
> +		return -EINVAL;
> +	}
> +
>  	/*
>  	 * Possible to have cores with PTM (supports ret stack) and ETM (never
>  	 * has ret stack) on the same SoC. So only enable when it can be honored
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index 1aa0357a5ce7..d4e294cd48ae 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -28,6 +28,7 @@
>  #include <linux/amba/bus.h>
>  #include <linux/seq_file.h>
>  #include <linux/uaccess.h>
> +#include <linux/perf/arm_pmu.h>
>  #include <linux/perf_event.h>
>  #include <linux/perf/arm_pmu.h>
>  #include <linux/platform_device.h>
> @@ -800,7 +801,8 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
>  			cc_threshold = drvdata->ccitmin;
>  		config->ccctlr = cc_threshold;
>  	}
> -	if (ATTR_CFG_GET_FLD(attr, timestamp)) {
> +	if (ATTR_CFG_GET_FLD(attr, deprecated_timestamp) ||
> +	    ATTR_CFG_GET_FLD(attr, timestamp)) {
>  		/*
>  		 * Configure timestamps to be emitted at regular intervals in
>  		 * order to correlate instructions executed on different CPUs
> 
> -- 
> 2.34.1
> 
