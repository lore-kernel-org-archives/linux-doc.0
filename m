Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8198B4419;
	Thu, 19 Oct 2023 14:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mJcwURv7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A8BBC433C7;
	Thu, 19 Oct 2023 14:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697727116;
	bh=NLXuVTxIYxsa/iNx+oFYMWnnV3rxtlfwRq/TCg68Hog=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mJcwURv7bUT66qaosnRpmPUeZs/qsuhbSYH1pZPEfzccsoVwfjkzbsHFwp3kIPm9b
	 T+dvPXCXWS9avMEgJIlCo0xAUIugAJr3WEfA+uSFQzj/+/KnQpMT7DNFmAVyl+oscw
	 hFFHz72MNI1MYA4CmRq/hsJeZa8+LRvEFqVb/T7Jl0w8FFHfI2+3IGcG5r8amAae54
	 T8nWI8OGGXMWCBuPxg+OqbaQuyzUX9IkIcdC+zCoBllZ/Eg80CFE3O9I0nBXSwBD9A
	 6mrqGubSKjRT3sHe5itcIKRv+8AuuUtCNdwSVTqj/S1nGzG0OvOmTGM8lhzvwabApA
	 qojK9byQnyM0A==
Date: Thu, 19 Oct 2023 15:51:50 +0100
From: Will Deacon <will@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: Frank.li@nxp.com, corbet@lwn.net, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, mark.rutland@arm.com,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	festevam@gmail.com, conor+dt@kernel.org, linux-imx@nxp.com,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/5] perf: fsl_imx8_ddr: Add AXI ID PORT CHANNEL
 filter support
Message-ID: <20231019145150.GB19567@willie-the-truck>
References: <20231011060838.3413621-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231011060838.3413621-1-xu.yang_2@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Wed, Oct 11, 2023 at 02:08:34PM +0800, Xu Yang wrote:
> This is the extension of AXI ID filter.
> 
> Filter is defined with 2 configuration registers per counter 1-3 (counter
> 0 is not used for filtering and lacks these registers).
> * Counter N MASK COMP register - AXI_ID and AXI_MASKING.
> * Counter N MUX CNTL register - AXI CHANNEL and AXI PORT.
>   -- 0: address channel
>   -- 1: data channel
> 
> This filter is exposed to userspace as an additional (channel, port) pair.
> The definition of axi_channel is inverted in userspace, and it will be
> reverted in driver automatically.
> 
> AXI filter of Perf Monitor in DDR Subsystem, only a single port0 exist, so
> axi_port is reserved which should be 0.
> 
> e.g.
> perf stat -a -e imx8_ddr0/axid-read,axi_mask=0xMMMM,axi_id=0xDDDD,axi_channel=0xH/ cmd
> perf stat -a -e imx8_ddr0/axid-write,axi_mask=0xMMMM,axi_id=0xDDDD,axi_channel=0xH/ cmd
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> 
> ---
> Changes since v2:
>  - no changes
> ---
>  drivers/perf/fsl_imx8_ddr_perf.c | 39 ++++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/drivers/perf/fsl_imx8_ddr_perf.c b/drivers/perf/fsl_imx8_ddr_perf.c
> index 92611c98120f..d0eae2d7e64b 100644
> --- a/drivers/perf/fsl_imx8_ddr_perf.c
> +++ b/drivers/perf/fsl_imx8_ddr_perf.c
> @@ -19,6 +19,8 @@
>  #define COUNTER_READ		0x20
>  
>  #define COUNTER_DPCR1		0x30
> +#define COUNTER_MUX_CNTL	0x50
> +#define COUNTER_MASK_COMP	0x54
>  
>  #define CNTL_OVER		0x1
>  #define CNTL_CLEAR		0x2
> @@ -32,6 +34,13 @@
>  #define CNTL_CSV_SHIFT		24
>  #define CNTL_CSV_MASK		(0xFFU << CNTL_CSV_SHIFT)
>  
> +#define READ_PORT_SHIFT		0
> +#define READ_PORT_MASK		(0x7 << READ_PORT_SHIFT)
> +#define READ_CHANNEL_REVERT	0x00000008	/* bit 3 for read channel select */
> +#define WRITE_PORT_SHIFT	8
> +#define WRITE_PORT_MASK		(0x7 << WRITE_PORT_SHIFT)
> +#define WRITE_CHANNEL_REVERT	0x00000800	/* bit 11 for write channel select */
> +
>  #define EVENT_CYCLES_ID		0
>  #define EVENT_CYCLES_COUNTER	0
>  #define NUM_COUNTERS		4
> @@ -50,6 +59,7 @@ static DEFINE_IDA(ddr_ida);
>  /* DDR Perf hardware feature */
>  #define DDR_CAP_AXI_ID_FILTER			0x1     /* support AXI ID filter */
>  #define DDR_CAP_AXI_ID_FILTER_ENHANCED		0x3     /* support enhanced AXI ID filter */
> +#define DDR_CAP_AXI_ID_PORT_CHANNEL_FILTER	0x4	/* support AXI ID PORT CHANNEL filter */
>  
>  struct fsl_ddr_devtype_data {
>  	unsigned int quirks;    /* quirks needed for different DDR Perf core */
> @@ -144,6 +154,7 @@ static const struct attribute_group ddr_perf_identifier_attr_group = {
>  enum ddr_perf_filter_capabilities {
>  	PERF_CAP_AXI_ID_FILTER = 0,
>  	PERF_CAP_AXI_ID_FILTER_ENHANCED,
> +	PERF_CAP_AXI_ID_PORT_CHANNEL_FILTER,
>  	PERF_CAP_AXI_ID_FEAT_MAX,
>  };
>  
> @@ -157,6 +168,8 @@ static u32 ddr_perf_filter_cap_get(struct ddr_pmu *pmu, int cap)
>  	case PERF_CAP_AXI_ID_FILTER_ENHANCED:
>  		quirks &= DDR_CAP_AXI_ID_FILTER_ENHANCED;
>  		return quirks == DDR_CAP_AXI_ID_FILTER_ENHANCED;
> +	case PERF_CAP_AXI_ID_PORT_CHANNEL_FILTER:
> +		return !!(quirks & DDR_CAP_AXI_ID_PORT_CHANNEL_FILTER);
>  	default:
>  		WARN(1, "unknown filter cap %d\n", cap);
>  	}
> @@ -187,6 +200,7 @@ static ssize_t ddr_perf_filter_cap_show(struct device *dev,
>  static struct attribute *ddr_perf_filter_cap_attr[] = {
>  	PERF_FILTER_EXT_ATTR_ENTRY(filter, PERF_CAP_AXI_ID_FILTER),
>  	PERF_FILTER_EXT_ATTR_ENTRY(enhanced_filter, PERF_CAP_AXI_ID_FILTER_ENHANCED),
> +	PERF_FILTER_EXT_ATTR_ENTRY(super_filter, PERF_CAP_AXI_ID_PORT_CHANNEL_FILTER),
>  	NULL,
>  };
>  
> @@ -272,11 +286,15 @@ static const struct attribute_group ddr_perf_events_attr_group = {
>  PMU_FORMAT_ATTR(event, "config:0-7");
>  PMU_FORMAT_ATTR(axi_id, "config1:0-15");
>  PMU_FORMAT_ATTR(axi_mask, "config1:16-31");
> +PMU_FORMAT_ATTR(axi_port, "config2:0-2");
> +PMU_FORMAT_ATTR(axi_channel, "config2:3-3");

Any specific reason to allocate from config2, rather than the upper 32
bits of config1?

> @@ -553,6 +572,26 @@ static int ddr_perf_event_add(struct perf_event *event, int flags)
>  		return -EOPNOTSUPP;
>  	}
>  
> +	if (pmu->devtype_data->quirks & DDR_CAP_AXI_ID_PORT_CHANNEL_FILTER) {
> +		if (ddr_perf_is_filtered(event)) {
> +			/* revert axi id masking(axi_mask) value */
> +			cfg1 ^= AXI_MASKING_REVERT;
> +			writel(cfg1, pmu->base + COUNTER_MASK_COMP + ((counter - 1) << 4));

Please can you explain what this "reverting" is doing? It looks like a
user-visible change in behaviour to me, or are you saying that the driver
currently does the wrong thing on hardware that supports the new filter?

> +
> +			if (cfg == 0x41) {

What is this 0x41 for?

Will
