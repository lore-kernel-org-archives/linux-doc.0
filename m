Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7B0A77DD32
	for <lwn-linux-doc@archive.lwn.net>; Mon,  2 Apr 2018 21:57:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754516AbeDBV5i (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 2 Apr 2018 17:57:38 -0400
Received: from mail-pl0-f67.google.com ([209.85.160.67]:37343 "EHLO
        mail-pl0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754509AbeDBV5h (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 2 Apr 2018 17:57:37 -0400
Received: by mail-pl0-f67.google.com with SMTP id v5-v6so3980187plo.4
        for <linux-doc@vger.kernel.org>; Mon, 02 Apr 2018 14:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=RX08+l6XaypFpdor6d4T5X4x5aSyDU+EdHc4Xo99AqY=;
        b=RkRX9EcAlMIt9yRI7t4QwykYX65Qd1VSxWIcrWpHkjneA4MUMVpKe6dERXb7lt0Fqq
         Pv2J5aP0mkFurT3ao9qUIVDvU9OnbBQcu1qn39Y2IFlzUr11cvKr/6lKZ1oOoSL1O4Eu
         rW6HiLRn1SPCBAbGrYk9H+0wKYYYdYR28YaiA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=RX08+l6XaypFpdor6d4T5X4x5aSyDU+EdHc4Xo99AqY=;
        b=i2WCs7Z6qX9cha15TWn+xWWIL955TpGKTv7Fpgrqvmvpg38yWFqqLHM9qgPMj4TtWl
         Mpq2VjVnoAc1F6IxeAKohPvbGCvw8/04uwC3zwZEuhQONn/CUZN8xxrOEIc/NyiNQsBq
         DQD0AA9hZT2dfKLWkF4O9sw42RoCSa3uItUkY3SLRgmStHV3lNaT705W1aaTaEEzgnF6
         bThBfpN9358eFuiCDItzrwnfaRNeH7a33a0cj/l/NBExHEdBuNIYUO/+oi5BnDrCxh0B
         UaXZ+m2oPufijLkLra/wPnAJX0z4r859qgehyvNS2nacnKhDmppNYCJFpuHZDcFB2286
         r30Q==
X-Gm-Message-State: AElRT7Eb+AEeONOEQue4rLtTSKQ7wOebWVPP7DqLWAKk31rNFhjGDZcB
        Ff6RyfWSMxhp9ZETK8LSeuT7Rg==
X-Google-Smtp-Source: AIpwx48KXmB7swUv7Sh4oc7nJsgGQiEunKcNlSqil1++aQ/B8zCFmo9j3tKuPUzgv3Um1gWFFu3dUg==
X-Received: by 10.167.128.81 with SMTP id y17mr1712995pfm.194.1522706256945;
        Mon, 02 Apr 2018 14:57:36 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id e3sm1783781pgr.80.2018.04.02.14.57.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 02 Apr 2018 14:57:36 -0700 (PDT)
Date:   Mon, 2 Apr 2018 15:57:33 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Leo Yan <leo.yan@linaro.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
        Kim Phillips <kim.phillips@arm.com>,
        Mike Leach <mike.leach@linaro.org>
Subject: Re: [PATCH v4 6/6] coresight: etm4x: Support panic kdump
Message-ID: <20180402215733.GF15452@xps15>
References: <1522379724-30648-1-git-send-email-leo.yan@linaro.org>
 <1522379724-30648-7-git-send-email-leo.yan@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1522379724-30648-7-git-send-email-leo.yan@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Mar 30, 2018 at 11:15:24AM +0800, Leo Yan wrote:
> ETMv4 hardware information and configuration needs to be saved as
> metadata; the metadata format should be compatible with 'perf' tool and
> finally is used by tracing data decoder.  ETMv4 works as tracer per CPU,
> we cannot wait for gathering ETM info after CPU panic has happened in
> case there have CPU is locked up and can't response inter-processor
> interrupt for execution dump operations; so it's more reliable to gather
> tracer metadata when all of the CPUs are alive.
> 
> This patch saves ETMv4 metadata but with the different method for
> different registers.  Since values in TRCIDR{0, 1, 2, 8} and
> TRCAUTHSTATUS are read-only and won't change afterward, thus those
> registers values are filled into metadata structure when tracers are
> instantiated.  The configuration and control registers TRCCONFIGR and
> TRCTRACEIDR are dynamically configured, their values are recorded during
> tracer enabling phase.
> 
> To avoid unnecessary overload introduced by set/clear operations for
> updating kdump node, we only set ETMv4 metadata info for the
> corresponding kdump node at initialization and won't be cleared anymore.
> 
> Suggested-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Signed-off-by: Leo Yan <leo.yan@linaro.org>
> ---
>  drivers/hwtracing/coresight/coresight-etm4x.c | 27 +++++++++++++++++++++++++++
>  drivers/hwtracing/coresight/coresight-etm4x.h | 15 +++++++++++++++
>  2 files changed, 42 insertions(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x.c b/drivers/hwtracing/coresight/coresight-etm4x.c
> index cf364a5..88b1e19 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x.c
> @@ -288,6 +288,8 @@ static int etm4_enable(struct coresight_device *csdev,
>  	int ret;
>  	u32 val;
>  	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
> +	struct etmv4_config *config = &drvdata->config;
> +	struct etmv4_metadata *metadata = &drvdata->metadata;
>  
>  	val = local_cmpxchg(&drvdata->mode, CS_MODE_DISABLED, mode);
>  
> @@ -306,6 +308,10 @@ static int etm4_enable(struct coresight_device *csdev,
>  		ret = -EINVAL;
>  	}
>  
> +	/* Update tracer meta data after tracer configuration */
> +	metadata->trcconfigr = config->cfg;
> +	metadata->trctraceidr = drvdata->trcid;
> +
>  	/* The tracer didn't start */
>  	if (ret)
>  		local_set(&drvdata->mode, CS_MODE_DISABLED);
> @@ -438,6 +444,7 @@ static void etm4_init_arch_data(void *info)
>  	u32 etmidr4;
>  	u32 etmidr5;
>  	struct etmv4_drvdata *drvdata = info;
> +	struct etmv4_metadata *metadata = &drvdata->metadata;
>  
>  	/* Make sure all registers are accessible */
>  	etm4_os_unlock(drvdata);
> @@ -590,6 +597,16 @@ static void etm4_init_arch_data(void *info)
>  	drvdata->nrseqstate = BMVAL(etmidr5, 25, 27);
>  	/* NUMCNTR, bits[30:28] number of counters available for tracing */
>  	drvdata->nr_cntr = BMVAL(etmidr5, 28, 30);
> +
> +	/* Update metadata */
> +	metadata->magic = ETM4_METADATA_MAGIC;
> +	metadata->cpu = drvdata->cpu;
> +	metadata->trcidr0 = readl_relaxed(drvdata->base + TRCIDR0);
> +	metadata->trcidr1 = readl_relaxed(drvdata->base + TRCIDR1);
> +	metadata->trcidr2 = readl_relaxed(drvdata->base + TRCIDR2);
> +	metadata->trcidr8 = readl_relaxed(drvdata->base + TRCIDR8);
> +	metadata->trcauthstatus = readl_relaxed(drvdata->base + TRCAUTHSTATUS);
> +
>  	CS_LOCK(drvdata->base);
>  }
>  
> @@ -957,6 +974,7 @@ static int etm4_probe(struct amba_device *adev, const struct amba_id *id)
>  	struct device *dev = &adev->dev;
>  	struct coresight_platform_data *pdata = NULL;
>  	struct etmv4_drvdata *drvdata;
> +	struct etmv4_metadata *metadata;
>  	struct resource *res = &adev->res;
>  	struct coresight_desc desc = { 0 };
>  	struct device_node *np = adev->dev.of_node;
> @@ -1027,6 +1045,15 @@ static int etm4_probe(struct amba_device *adev, const struct amba_id *id)
>  		goto err_arch_supported;
>  	}
>  
> +	/* Set source device handler and metadata into kdump node */
> +	metadata = &drvdata->metadata;
> +	ret = coresight_kdump_source(drvdata->cpu, drvdata->csdev,
> +				     (char *)metadata, sizeof(*metadata));
> +	if (ret) {
> +		coresight_unregister(drvdata->csdev);
> +		goto err_arch_supported;
> +	}
> +
>  	ret = etm_perf_symlink(drvdata->csdev, true);
>  	if (ret) {
>  		coresight_unregister(drvdata->csdev);
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
> index b3b5ea7..08dc8b7 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x.h
> +++ b/drivers/hwtracing/coresight/coresight-etm4x.h
> @@ -198,6 +198,20 @@
>  #define ETM_EXLEVEL_NS_HYP		BIT(14)
>  #define ETM_EXLEVEL_NS_NA		BIT(15)
>  
> +#define ETM4_METADATA_MAGIC		0x4040404040404040ULL

Please dd a comment that this needs to be kept in sync with
__perf_cs_etmv4_magic in tools/perf/util/cs-etm.h.

> +
> +struct etmv4_metadata {
> +	u64 magic;
> +	u64 cpu;
> +	u64 trcconfigr;
> +	u64 trctraceidr;
> +	u64 trcidr0;
> +	u64 trcidr1;
> +	u64 trcidr2;
> +	u64 trcidr8;
> +	u64 trcauthstatus;
> +};
> +
>  /**
>   * struct etmv4_config - configuration information related to an ETMv4
>   * @mode:	Controls various modes supported by this ETM.
> @@ -393,6 +407,7 @@ struct etmv4_drvdata {
>  	bool				atbtrig;
>  	bool				lpoverride;
>  	struct etmv4_config		config;
> +	struct etmv4_metadata		metadata;

Structure documentation please.

>  };
>  
>  /* Address comparator access types */
> -- 
> 2.7.4
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
