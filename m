Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5011A329389;
	Fri, 14 Nov 2025 15:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763132627; cv=none; b=jB+5cpn/TR+vcmm5hJ6EylVYFFmuatddRir4evQ4p+7ZTohnQOrc4MI2PzcECyNAdvuboxFiSyz5a8vLkLbUhdi6+Nizd4t8N7BIzBlp8D5aakMEsrb169N99rLaOsRWqK7SvRFSTlkv4QDP/S2Ua8TGRijkaACrZLgQuQ2TtyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763132627; c=relaxed/simple;
	bh=j5fuyc1DvFhr3OAv8dsGtRDNielG3Y3KCeLFi7xjO0o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=smMOdTk4uPnowT3LLWXQhS/AkAmQM6kM/JyBlk/j3xmke5JxuG3mxDN01PKLfepg73K15w6MCZ4kCEjecBD5sZfKMIEY0uTCN87waxYmazqob+iSfQJfrNZlb3+YTyYrcCkoYGJrosoUe/+fEwcWawQpYYbKIzRajFErKmP4owc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C421F1063;
	Fri, 14 Nov 2025 07:03:37 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 09AFB3F66E;
	Fri, 14 Nov 2025 07:03:44 -0800 (PST)
Date: Fri, 14 Nov 2025 15:03:43 +0000
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 05/13] coresight: Define format attributes with
 GEN_PMU_FORMAT_ATTR()
Message-ID: <20251114150343.GE3568724@e132581.arm.com>
References: <20251112-james-cs-syncfreq-v4-0-165ba21401dc@linaro.org>
 <20251112-james-cs-syncfreq-v4-5-165ba21401dc@linaro.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112-james-cs-syncfreq-v4-5-165ba21401dc@linaro.org>

On Wed, Nov 12, 2025 at 03:22:11PM +0000, James Clark wrote:
> This allows us to define and consume them in a unified way in later
> commits.
> 
> A lot of the existing code has open coded bit shifts or direct usage of
> whole config values which is error prone and hides which bits are in use
> and which are free.
> 
> Signed-off-by: James Clark <james.clark@linaro.org>

Reviewed-by: Leo Yan <leo.yan@arm.com>

> ---
>  drivers/hwtracing/coresight/coresight-etm-perf.c | 22 ++++++++---------
>  drivers/hwtracing/coresight/coresight-etm-perf.h | 31 ++++++++++++++++++++++++
>  2 files changed, 42 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
> index 91132abca244..d19e2568a0d1 100644
> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
> @@ -13,6 +13,7 @@
>  #include <linux/mm.h>
>  #include <linux/init.h>
>  #include <linux/perf_event.h>
> +#include <linux/perf/arm_pmu.h>
>  #include <linux/percpu-defs.h>
>  #include <linux/slab.h>
>  #include <linux/stringhash.h>
> @@ -54,22 +55,21 @@ static DEFINE_PER_CPU(struct coresight_device *, csdev_src);
>   * The PMU formats were orignally for ETMv3.5/PTM's ETMCR 'config';
>   * now take them as general formats and apply on all ETMs.
>   */
> -PMU_FORMAT_ATTR(branch_broadcast, "config:"__stringify(ETM_OPT_BRANCH_BROADCAST));
> -PMU_FORMAT_ATTR(cycacc,		"config:" __stringify(ETM_OPT_CYCACC));
> +GEN_PMU_FORMAT_ATTR(branch_broadcast);
> +GEN_PMU_FORMAT_ATTR(cycacc);
>  /* contextid1 enables tracing CONTEXTIDR_EL1 for ETMv4 */
> -PMU_FORMAT_ATTR(contextid1,	"config:" __stringify(ETM_OPT_CTXTID));
> +GEN_PMU_FORMAT_ATTR(contextid1);
>  /* contextid2 enables tracing CONTEXTIDR_EL2 for ETMv4 */
> -PMU_FORMAT_ATTR(contextid2,	"config:" __stringify(ETM_OPT_CTXTID2));
> -PMU_FORMAT_ATTR(timestamp,	"config:" __stringify(ETM_OPT_TS));
> -PMU_FORMAT_ATTR(retstack,	"config:" __stringify(ETM_OPT_RETSTK));
> +GEN_PMU_FORMAT_ATTR(contextid2);
> +GEN_PMU_FORMAT_ATTR(timestamp);
> +GEN_PMU_FORMAT_ATTR(retstack);
>  /* preset - if sink ID is used as a configuration selector */
> -PMU_FORMAT_ATTR(preset,		"config:0-3");
> +GEN_PMU_FORMAT_ATTR(preset);
>  /* Sink ID - same for all ETMs */
> -PMU_FORMAT_ATTR(sinkid,		"config2:0-31");
> +GEN_PMU_FORMAT_ATTR(sinkid);
>  /* config ID - set if a system configuration is selected */
> -PMU_FORMAT_ATTR(configid,	"config2:32-63");
> -PMU_FORMAT_ATTR(cc_threshold,	"config3:0-11");
> -
> +GEN_PMU_FORMAT_ATTR(configid);
> +GEN_PMU_FORMAT_ATTR(cc_threshold);
>  
>  /*
>   * contextid always traces the "PID".  The PID is in CONTEXTIDR_EL1
> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.h b/drivers/hwtracing/coresight/coresight-etm-perf.h
> index 5febbcdb8696..c794087a0e99 100644
> --- a/drivers/hwtracing/coresight/coresight-etm-perf.h
> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.h
> @@ -20,6 +20,37 @@ struct cscfg_config_desc;
>   */
>  #define ETM_ADDR_CMP_MAX	8
>  
> +#define ATTR_CFG_FLD_preset_CFG			config
> +#define ATTR_CFG_FLD_preset_LO			0
> +#define ATTR_CFG_FLD_preset_HI			3
> +#define ATTR_CFG_FLD_branch_broadcast_CFG	config
> +#define ATTR_CFG_FLD_branch_broadcast_LO	8
> +#define ATTR_CFG_FLD_branch_broadcast_HI	8
> +#define ATTR_CFG_FLD_cycacc_CFG			config
> +#define ATTR_CFG_FLD_cycacc_LO			12
> +#define ATTR_CFG_FLD_cycacc_HI			12
> +#define ATTR_CFG_FLD_contextid1_CFG		config
> +#define ATTR_CFG_FLD_contextid1_LO		14
> +#define ATTR_CFG_FLD_contextid1_HI		14
> +#define ATTR_CFG_FLD_contextid2_CFG		config
> +#define ATTR_CFG_FLD_contextid2_LO		15
> +#define ATTR_CFG_FLD_contextid2_HI		15
> +#define ATTR_CFG_FLD_timestamp_CFG		config
> +#define ATTR_CFG_FLD_timestamp_LO		28
> +#define ATTR_CFG_FLD_timestamp_HI		28
> +#define ATTR_CFG_FLD_retstack_CFG		config
> +#define ATTR_CFG_FLD_retstack_LO		29
> +#define ATTR_CFG_FLD_retstack_HI		29
> +#define ATTR_CFG_FLD_sinkid_CFG			config2
> +#define ATTR_CFG_FLD_sinkid_LO			0
> +#define ATTR_CFG_FLD_sinkid_HI			31
> +#define ATTR_CFG_FLD_configid_CFG		config2
> +#define ATTR_CFG_FLD_configid_LO		32
> +#define ATTR_CFG_FLD_configid_HI		63
> +#define ATTR_CFG_FLD_cc_threshold_CFG		config3
> +#define ATTR_CFG_FLD_cc_threshold_LO		0
> +#define ATTR_CFG_FLD_cc_threshold_HI		11
> +
>  /**
>   * struct etm_filter - single instruction range or start/stop configuration.
>   * @start_addr:	The address to start tracing on.
> 
> -- 
> 2.34.1
> 
